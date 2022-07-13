Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BFB573BA1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:59:27 +0200 (CEST)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBfht-0000Qo-PC
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oBfeX-0003Iq-QB; Wed, 13 Jul 2022 12:55:57 -0400
Received: from [200.168.210.66] (port=34335 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oBfeV-00039g-Vd; Wed, 13 Jul 2022 12:55:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 13 Jul 2022 13:55:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0BD3D8001C2;
 Wed, 13 Jul 2022 13:55:51 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, farosas@linux.ibm.com
Subject: [RFC PATCH v3 0/3] Implement Power ISA 3.1B hash insns
Date: Wed, 13 Jul 2022 13:54:55 -0300
Message-Id: <20220713165458.58807-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Jul 2022 16:55:51.0512 (UTC)
 FILETIME=[68A4A580:01D896D9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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

This patch series implements the 4 instructions added in Power ISA
3.1B:

- hashchk
- hashst
- hashchkp
- hashstp

To build it, you need to apply the following patches on top of master:
<20220701133507.740619-2-lucas.coutinho@eldorado.org.br>
<20220701133507.740619-3-lucas.coutinho@eldorado.org.br>
<20220712193741.59134-2-leandro.lupori@eldorado.org.br>
<20220712193741.59134-3-leandro.lupori@eldorado.org.br>

Working branch for ease of use can be found here:
https://github.com/PPC64/qemu/tree/vccolombo-hash-to-send-v3

What do you think about the choice to implement the hash algorithm
from the ground up, following the SIMON-like algorithm presented in
Power ISA? IIUC, this algorithm is not the same as the original[1].
Other options would be to use other algorithm already implemented
in QEMU, or even make this instruction a nop for all Power versions.

Also, I was thinking about using the call to spr_register_kvm() in
init_proc_POWER10 to initialize the registers with a random value.
I'm not sure what is the behavior here, I would expect that is the job
of the OS to set the regs, but looks like KVM is not exporting them,
so they are always 0 (?). Does anyone have any insight on this?

v1->v2:
- Split the patch in 2
- Rebase to master

v2->v3:
- Split patches in 3
    - the new patch (patch 1) is separating the kvm header 
      changes [Cornelia]

[1] https://eprint.iacr.org/2013/404.pdf

Víctor Colombo (3):
  linux-headers/asm-powerpc/kvm.h: Add HASHKEYR and HASHPKEYR in headers
  target/ppc: Implement hashst and hashchk
  target/ppc: Implement hashstp and hashchkp

 linux-headers/asm-powerpc/kvm.h            |  3 +
 target/ppc/cpu.h                           |  2 +
 target/ppc/cpu_init.c                      |  7 ++
 target/ppc/excp_helper.c                   | 82 ++++++++++++++++++++++
 target/ppc/helper.h                        |  4 ++
 target/ppc/insn32.decode                   | 10 +++
 target/ppc/translate.c                     |  5 ++
 target/ppc/translate/fixedpoint-impl.c.inc | 34 +++++++++
 8 files changed, 147 insertions(+)

-- 
2.25.1


