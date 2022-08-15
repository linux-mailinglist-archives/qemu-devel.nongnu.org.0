Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E243E59333F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 18:27:51 +0200 (CEST)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNcwQ-00051J-Ph
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 12:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcpf-00079Q-66; Mon, 15 Aug 2022 12:20:51 -0400
Received: from [200.168.210.66] (port=25068 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcpc-0005gw-CU; Mon, 15 Aug 2022 12:20:50 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 15 Aug 2022 13:20:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 10E88800186;
 Mon, 15 Aug 2022 13:20:43 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH 00/13] PowerPC interrupt rework
Date: Mon, 15 Aug 2022 13:20:06 -0300
Message-Id: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Aug 2022 16:20:43.0373 (UTC)
 FILETIME=[F7B9E9D0:01D8B0C2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, PowerPC interrupts are handled as follows:

1) The CPU_INTERRUPT_HARD bit of cs->interrupt_request gates all
   interrupts;
2) The bits of env->pending_interrupts identify which particular
   interrupt is raised;
3) ppc_set_irq can be used to set/clear env->pending_interrupt bit and
   CPU_INTERRUPT_HARD, but some places access env->pending_interrupt
   directly;
4) ppc_cpu_exec_interrupt is called by cpu_handle_interrupt when
   cs->interrupt_request indicates that there is some interrupt pending.
   This method checks CPU_INTERRUPT_HARD and calls ppc_hw_interrupt. If
   env->pending_interrupt is zero after this call, CPU_INTERRUPT_HARD
   will be cleared.
5) ppc_hw_interrupt checks if there is any unmasked interrupt and calls
   powerpc_excp with the appropriate POWERPC_EXCP_* value. The method
   will also reset the corresponding bit in env->pending_interrupt for
   interrupts that clear on delivery.

If all pending interrupts are masked, CPU_INTERRUPT_HARD will be set,
but ppc_hw_interrupt will not deliver or clear the interrupt, so
CPU_INTERRUPT_HARD will not be reset by ppc_cpu_exec_interrupt. With
that, cs->has_work keeps returning true, creating a loop that acquires
and release qemu_mutex_lock_iothread, causing the poor performance
reported in [1].

This patch series attempts to rework the PowerPC interrupt code to set
CPU_INTERRUPT_HARD only when there are unmasked interrupts. Then
cs->has_work can be simplified to a check of CPU_INTERRUPT_HARD, so it
also only returns true when at least one interrupt can be delivered.

To achieve that, we are basically following Alex Bannée's suggestion[2]
in the original thread: the interrupt masking logic will be factored
out of ppc_hw_interrupt in a new method, ppc_pending_interrupts. This
method is then used to decide if CPU_INTERRUPT_HARD should be set or
cleared after changes to MSR, LPCR, env->pending_interrupts, and
power-management instructions.

We used [3] to check for regressions at each patch in this series. After
patch 12, booting a powernv machine with a newer skiboot with "-smp 4"
goes from 1m09s to 20.79s.

[1] https://lists.gnu.org/archive/html/qemu-ppc/2022-06/msg00336.html
[2] https://lists.gnu.org/archive/html/qemu-ppc/2022-06/msg00372.html
[3] https://github.com/legoater/qemu-ppc-boot

Matheus Ferst (13):
  target/ppc: define PPC_INTERRUPT_* values directly
  target/ppc: always use ppc_set_irq to set env->pending_interrupts
  target/ppc: move interrupt masking out of ppc_hw_interrupt
  target/ppc: prepare to split ppc_interrupt_pending by excp_model
  target/ppc: create a interrupt masking method for POWER9/POWER10
  target/ppc: remove embedded interrupts from ppc_pending_interrupt_p9
  target/ppc: create a interrupt masking method for POWER8
  target/ppc: remove unused interrupts from ppc_pending_interrupt_p8
  target/ppc: create a interrupt masking method for POWER7
  target/ppc: remove unused interrupts from ppc_pending_interrupt_p7
  target/ppc: remove ppc_store_lpcr from CONFIG_USER_ONLY builds
  target/ppc: introduce ppc_maybe_interrupt
  target/ppc: unify cpu->has_work based on cs->interrupt_request

 hw/ppc/ppc.c             |  17 +-
 hw/ppc/trace-events      |   2 +-
 target/ppc/cpu.c         |   2 +
 target/ppc/cpu.h         |  43 +--
 target/ppc/cpu_init.c    | 212 +------------
 target/ppc/excp_helper.c | 651 ++++++++++++++++++++++++++++++++-------
 target/ppc/helper_regs.c |   2 +
 target/ppc/misc_helper.c |  11 +-
 target/ppc/translate.c   |   8 +-
 9 files changed, 580 insertions(+), 368 deletions(-)

-- 
2.25.1


