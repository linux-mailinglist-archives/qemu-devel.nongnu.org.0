Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41762495DA6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:21:07 +0100 (CET)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAr2X-0000L8-Q3
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:21:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nAqH8-0007ZL-40; Fri, 21 Jan 2022 04:32:06 -0500
Received: from mail.ispras.ru ([83.149.199.84]:40416)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nAqH2-0003p8-4b; Fri, 21 Jan 2022 04:32:05 -0500
Received: from localhost.localdomain (unknown [77.37.166.174])
 by mail.ispras.ru (Postfix) with ESMTPSA id 53B3B40D3BFF;
 Fri, 21 Jan 2022 09:31:28 +0000 (UTC)
From: Vitaly Cheptsov <cheptsov@ispras.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc/mmu_common: Fix SRR1/MSR error code on Book-E
Date: Fri, 21 Jan 2022 12:31:07 +0300
Message-Id: <20220121093107.15478-1-cheptsov@ispras.ru>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84; envelope-from=cheptsov@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, Vitaly Cheptsov <cheptsov@ispras.ru>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Book-E architecture does not set the error code in 31:27 bits
of SRR1, but instead uses these bits for custom fields such
as GS (Guest Supervisor).

Wrongly setting these fields will result in QEMU crashes
when attempting to execute not executable code due to the attempts
to use Guest Supervisor mode.

Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
---
 target/ppc/mmu_common.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 91270c1f17..6512ee031c 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -1367,22 +1367,34 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
             case -2:
                 /* Access rights violation */
                 cs->exception_index = POWERPC_EXCP_ISI;
-                env->error_code = 0x08000000;
+                if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
+                    (env->mmu_model == POWERPC_MMU_BOOKE206)) {
+                    env->error_code = 0;
+                } else {
+                    env->error_code = 0x08000000;
+                }
                 break;
             case -3:
                 /* No execute protection violation */
                 if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
                     (env->mmu_model == POWERPC_MMU_BOOKE206)) {
                     env->spr[SPR_BOOKE_ESR] = 0x00000000;
+                    env->error_code = 0;
+                } else {
+                    env->error_code = 0x10000000;
                 }
                 cs->exception_index = POWERPC_EXCP_ISI;
-                env->error_code = 0x10000000;
                 break;
             case -4:
                 /* Direct store exception */
                 /* No code fetch is allowed in direct-store areas */
                 cs->exception_index = POWERPC_EXCP_ISI;
-                env->error_code = 0x10000000;
+                if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
+                    (env->mmu_model == POWERPC_MMU_BOOKE206)) {
+                    env->error_code = 0;
+                } else {
+                    env->error_code = 0x10000000;
+                }
                 break;
             }
         } else {
-- 
2.32.0 (Apple Git-132)


