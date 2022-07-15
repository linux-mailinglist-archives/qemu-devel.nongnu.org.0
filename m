Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D369576896
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 22:58:30 +0200 (CEST)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCSOK-0002c7-VT
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 16:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oCSKx-0005Xj-QU; Fri, 15 Jul 2022 16:54:59 -0400
Received: from [200.168.210.66] (port=55753 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oCSKw-00083Z-4u; Fri, 15 Jul 2022 16:54:59 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 15 Jul 2022 17:54:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 52101800181;
 Fri, 15 Jul 2022 17:54:51 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, cohuck@redhat.com, farosas@linux.ibm.com
Subject: [PATCH v4 0/3] Implement Power ISA 3.1B hash insns
Date: Fri, 15 Jul 2022 17:54:36 -0300
Message-Id: <20220715205439.161110-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jul 2022 20:54:51.0820 (UTC)
 FILETIME=[20F57EC0:01D8988D]
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

It's built on top of ppc-next. Working branch for ease of use can be
found here:
https://github.com/PPC64/qemu/tree/vccolombo-hash-to-send-v4

What do you think about the choice to implement the hash algorithm
from the ground up, following the SIMON-like algorithm presented in
Power ISA? IIUC, this algorithm is not the same as the original[1].
Other options would be to use other algorithm already implemented
in QEMU, or even make this instruction a nop for all Power versions.

v1->v2:
- Split the patch in 2
- Rebase to master

v2->v3:
- Split patches in 3
    - the new patch (patch 1) is separating the kvm header
      changes [Cornelia]

v3->v4:
- Remove Patch 1 (linux-headers/asm-powerpc/kvm.h:
    Add HASHKEYR and HASHPKEYR in headers)
    - Daniel recommended drop the kvm part:
    https://lists.nongnu.org/archive/html/qemu-ppc/2022-07/msg00213.html
- Substitute Patch 1 with a separated patch setting up the registers
  for TCG only. Also, now setup it with a random value in linux-user.
- Change the registers naming:
    - SPR_POWER_HASHKEYR -> SPR_HASHKEYR
- Drop RFC tag

[1] https://eprint.iacr.org/2013/404.pdf

Víctor Colombo (3):
  target/ppc: Add HASHKEYR and HASHPKEYR SPRs
  target/ppc: Implement hashst and hashchk
  target/ppc: Implement hashstp and hashchkp

 target/ppc/cpu.h                           |  2 +
 target/ppc/cpu_init.c                      | 28 ++++++++
 target/ppc/excp_helper.c                   | 84 ++++++++++++++++++++++
 target/ppc/helper.h                        |  4 ++
 target/ppc/insn32.decode                   | 10 +++
 target/ppc/translate.c                     |  5 ++
 target/ppc/translate/fixedpoint-impl.c.inc | 34 +++++++++
 7 files changed, 167 insertions(+)

-- 
2.25.1


