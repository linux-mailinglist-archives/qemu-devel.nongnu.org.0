Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849FB4747C
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jun 2019 14:42:09 +0200 (CEST)
Received: from localhost ([::1]:39464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcUU4-0005rb-1h
	for lists+qemu-devel@lfdr.de; Sun, 16 Jun 2019 08:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42252)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hcUQE-0003vs-UD
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 08:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hcUQD-000631-KM
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 08:38:10 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:46360
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hcUQD-00061S-Cq; Sun, 16 Jun 2019 08:38:09 -0400
Received: from host86-173-229-95.range86-173.btcentralplus.com
 ([86.173.229.95] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hcUPw-0001jp-38; Sun, 16 Jun 2019 13:37:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 rth@twiddle.net, gkurz@kaod.org
Date: Sun, 16 Jun 2019 13:37:38 +0100
Message-Id: <20190616123751.781-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190616123751.781-1-mark.cave-ayland@ilande.co.uk>
References: <20190616123751.781-1-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 86.173.229.95
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PATCH v3 02/15] target/ppc: remove getVSR()/putVSR()
 from mem_helper.c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Since commit 8a14d31b00 "target/ppc: switch fpr/vsrl registers so all VSX
registers are in host endian order" functions getVSR() and putVSR() which used
to convert the VSR registers into host endian order are no longer required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/ppc/mem_helper.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 5b0f9ee50d..87632ccf53 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -417,26 +417,27 @@ STVE(stvewx, cpu_stl_data_ra, bswap32, u32)
 void helper_##name(CPUPPCState *env, target_ulong addr,                 \
                    target_ulong xt_num, target_ulong rb)                \
 {                                                                       \
-    int i;                                                              \
-    ppc_vsr_t xt;                                                       \
+    ppc_vsr_t *xt = &env->vsr[xt_num];                                  \
+    ppc_vsr_t t;                                                        \
     uint64_t nb = GET_NB(rb);                                           \
+    int i;                                                              \
                                                                         \
-    xt.s128 = int128_zero();                                            \
+    t.s128 = int128_zero();                                             \
     if (nb) {                                                           \
         nb = (nb >= 16) ? 16 : nb;                                      \
         if (msr_le && !lj) {                                            \
             for (i = 16; i > 16 - nb; i--) {                            \
-                xt.VsrB(i - 1) = cpu_ldub_data_ra(env, addr, GETPC());  \
+                t.VsrB(i - 1) = cpu_ldub_data_ra(env, addr, GETPC());   \
                 addr = addr_add(env, addr, 1);                          \
             }                                                           \
         } else {                                                        \
             for (i = 0; i < nb; i++) {                                  \
-                xt.VsrB(i) = cpu_ldub_data_ra(env, addr, GETPC());      \
+                t.VsrB(i) = cpu_ldub_data_ra(env, addr, GETPC());       \
                 addr = addr_add(env, addr, 1);                          \
             }                                                           \
         }                                                               \
     }                                                                   \
-    putVSR(xt_num, &xt, env);                                           \
+    *xt = t;                                                            \
 }
 
 VSX_LXVL(lxvl, 0)
@@ -447,23 +448,23 @@ VSX_LXVL(lxvll, 1)
 void helper_##name(CPUPPCState *env, target_ulong addr,           \
                    target_ulong xt_num, target_ulong rb)          \
 {                                                                 \
-    int i;                                                        \
-    ppc_vsr_t xt;                                                 \
+    ppc_vsr_t *xt = &env->vsr[xt_num];                            \
     target_ulong nb = GET_NB(rb);                                 \
+    int i;                                                        \
                                                                   \
     if (!nb) {                                                    \
         return;                                                   \
     }                                                             \
-    getVSR(xt_num, &xt, env);                                     \
+                                                                  \
     nb = (nb >= 16) ? 16 : nb;                                    \
     if (msr_le && !lj) {                                          \
         for (i = 16; i > 16 - nb; i--) {                          \
-            cpu_stb_data_ra(env, addr, xt.VsrB(i - 1), GETPC());  \
+            cpu_stb_data_ra(env, addr, xt->VsrB(i - 1), GETPC()); \
             addr = addr_add(env, addr, 1);                        \
         }                                                         \
     } else {                                                      \
         for (i = 0; i < nb; i++) {                                \
-            cpu_stb_data_ra(env, addr, xt.VsrB(i), GETPC());      \
+            cpu_stb_data_ra(env, addr, xt->VsrB(i), GETPC());     \
             addr = addr_add(env, addr, 1);                        \
         }                                                         \
     }                                                             \
-- 
2.11.0


