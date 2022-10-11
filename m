Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17885FBC9A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 23:04:02 +0200 (CEST)
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiMPw-0000hq-31
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 17:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oiMBE-0006dh-GQ; Tue, 11 Oct 2022 16:48:48 -0400
Received: from [200.168.210.66] (port=33314 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oiMBC-0001Yb-Hz; Tue, 11 Oct 2022 16:48:48 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 11 Oct 2022 17:48:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C4E9F8001F1;
 Tue, 11 Oct 2022 17:48:40 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v3 00/29] PowerPC interrupt rework
Date: Tue, 11 Oct 2022 17:48:00 -0300
Message-Id: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 11 Oct 2022 20:48:41.0154 (UTC)
 FILETIME=[D8605A20:01D8DDB2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Link to v2: https://lists.gnu.org/archive/html/qemu-ppc/2022-09/msg00556.html
This series is also available as a git branch: https://github.com/PPC64/qemu/tree/ferst-interrupt-fix-v3
Patches without review: 3-27

This new version rebases the patch series on the current master and
fixes some problems pointed out by Fabiano on v2.

Matheus Ferst (29):
  target/ppc: define PPC_INTERRUPT_* values directly
  target/ppc: always use ppc_set_irq to set env->pending_interrupts
  target/ppc: split interrupt masking and delivery from ppc_hw_interrupt
  target/ppc: prepare to split interrupt masking and delivery by excp_model
  target/ppc: create an interrupt masking method for POWER9/POWER10
  target/ppc: remove unused interrupts from p9_next_unmasked_interrupt
  target/ppc: create an interrupt deliver method for POWER9/POWER10
  target/ppc: remove unused interrupts from p9_deliver_interrupt
  target/ppc: remove generic architecture checks from p9_deliver_interrupt
  target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER9
  target/ppc: add power-saving interrupt masking logic to p9_next_unmasked_interrupt
  target/ppc: create an interrupt masking method for POWER8
  target/ppc: remove unused interrupts from p8_next_unmasked_interrupt
  target/ppc: create an interrupt deliver method for POWER8
  target/ppc: remove unused interrupts from p8_deliver_interrupt
  target/ppc: remove generic architecture checks from p8_deliver_interrupt
  target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER8
  target/ppc: add power-saving interrupt masking logic to p8_next_unmasked_interrupt
  target/ppc: create an interrupt masking method for POWER7
  target/ppc: remove unused interrupts from p7_next_unmasked_interrupt
  target/ppc: create an interrupt deliver method for POWER7
  target/ppc: remove unused interrupts from p7_deliver_interrupt
  target/ppc: remove generic architecture checks from p7_deliver_interrupt
  target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER7
  target/ppc: add power-saving interrupt masking logic to p7_next_unmasked_interrupt
  target/ppc: remove ppc_store_lpcr from CONFIG_USER_ONLY builds
  target/ppc: introduce ppc_maybe_interrupt
  target/ppc: unify cpu->has_work based on cs->interrupt_request
  target/ppc: move the p*_interrupt_powersave methods to excp_helper.c

 hw/ppc/pnv_core.c        |   1 +
 hw/ppc/ppc.c             |  17 +-
 hw/ppc/spapr_hcall.c     |   6 +
 hw/ppc/spapr_rtas.c      |   2 +-
 hw/ppc/trace-events      |   2 +-
 target/ppc/cpu.c         |   4 +
 target/ppc/cpu.h         |  43 +-
 target/ppc/cpu_init.c    | 212 +---------
 target/ppc/excp_helper.c | 887 ++++++++++++++++++++++++++++++++++-----
 target/ppc/helper.h      |   1 +
 target/ppc/helper_regs.c |   2 +
 target/ppc/misc_helper.c |  11 +-
 target/ppc/translate.c   |   2 +
 13 files changed, 833 insertions(+), 357 deletions(-)

-- 
2.25.1


