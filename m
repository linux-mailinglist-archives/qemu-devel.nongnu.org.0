Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02E13160F2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:28:05 +0100 (CET)
Received: from localhost ([::1]:51272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9kqy-0007Ff-PM
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1l9kpg-0006RD-Rh
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:26:44 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:42075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1l9kpf-0005Ty-6D
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:26:44 -0500
Received: from localhost.localdomain ([178.239.76.114]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MeDYt-1lj6311WP1-00bMBK; Wed, 10 Feb 2021 09:26:36 +0100
From: David Brenken <david.brenken@efs-auto.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] tricore: fixed faulty conditions for extr and imask
Date: Wed, 10 Feb 2021 09:26:50 +0100
Message-Id: <20210210082650.5516-2-david.brenken@efs-auto.org>
X-Mailer: git-send-email 2.16.1.windows.4
In-Reply-To: <20210210082650.5516-1-david.brenken@efs-auto.org>
References: <20210210082650.5516-1-david.brenken@efs-auto.org>
X-Provags-ID: V03:K1:FAMhu4K8Q/sSxvBN/RmOjc+GKapv91934MTPL6Ao4xio8BkpnJB
 529Okz386HWzJOdWw64m126A2mWEtzsLLj37pBIT9frXGtKiEfg84iSH2fRu53CzEIz0Z5L
 jNL/ysZjt3Iy2P2myRJWkWtT4zZzgu3JAK/IuSM8mSv1lPjic8DhoZ440hP25hc/IBZkkXw
 DFxOxoI4SJnAhfzTjw3rw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jJ3lCH01Y6E=:EaDma6ikSY7M+AqLCqOzv/
 qtH/SIfcnvkk+T/+JMXvtFRUGXuT/bS9taIaMZ/0f+oLiBeuH4x3zlzm/KiKweFOkl7w8hisz
 qZeWxAsmj2Bgmb7f5bxmDGcn0Tp1lSYhCVgifkYwxVigLCpitZ134EL8WtfGOMwL9+gkU5qtG
 rY1em2GLlfyZsqA08e0IrWHwKZwF5QUym9nDBec4LhJb64UeVnWbmUaaKTQduvPXzqajeyzUW
 jFjbc4cYY0orFRr3Gof9Kz1ddR/tz8MW8AyKA0+4q9d6IgvxWHHaAZ8S0TCdrawO7XpCH03Es
 /Nc/Bzmufr2/iSPaK8nd/VosKe1GjfSsgyhd9Z2s2sJadieGp/9MuX0uyVeSI6ZwQMiPenGJz
 rHGaZpSFVpuQmo8iuoz+UHSZ8BtSbZffXzoyGLrUB4PUUoBGuxBR/Yd+QFlCp3LEMvUPt1b1K
 bZE/IVLEeQ==
Received-SPF: none client-ip=212.227.126.130;
 envelope-from=david.brenken@efs-auto.org; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kbastian@mail.uni-paderborn.de, David Brenken <david.brenken@efs-auto.de>,
 Georg Hofstetter <georg.hofstetter@efs-auto.de>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas Konopik <andreas.konopik@efs-auto.de>

Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
Signed-off-by: David Brenken <david.brenken@efs-auto.de>
---
 target/tricore/translate.c | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 7752630ac1..f451e085f8 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -5777,8 +5777,8 @@ static void decode_rcpw_insert(DisasContext *ctx)
     switch (op2) {
     case OPC2_32_RCPW_IMASK:
         CHECK_REG_PAIR(r2);
-        /* if pos + width > 31 undefined result */
-        if (pos + width <= 31) {
+        /* if pos + width > 32 undefined result */
+        if (pos + width <= 32) {
             tcg_gen_movi_tl(cpu_gpr_d[r2+1], ((1u << width) - 1) << pos);
             tcg_gen_movi_tl(cpu_gpr_d[r2], (const4 << pos));
         }
@@ -6999,29 +6999,16 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
 
     switch (op2) {
     case OPC2_32_RRPW_EXTR:
-        if (pos + width <= 31) {
-            /* optimize special cases */
-            if ((pos == 0) && (width == 8)) {
-                tcg_gen_ext8s_tl(cpu_gpr_d[r3], cpu_gpr_d[r1]);
-            } else if ((pos == 0) && (width == 16)) {
-                tcg_gen_ext16s_tl(cpu_gpr_d[r3], cpu_gpr_d[r1]);
-            } else {
-                tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], 32 - pos - width);
-                tcg_gen_sari_tl(cpu_gpr_d[r3], cpu_gpr_d[r3], 32 - width);
-            }
-        }
+        /* if pos + width > 32 undefined result */
+        tcg_gen_sextract_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], pos, width);
         break;
     case OPC2_32_RRPW_EXTR_U:
-        if (width == 0) {
-            tcg_gen_movi_tl(cpu_gpr_d[r3], 0);
-        } else {
-            tcg_gen_shri_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], pos);
-            tcg_gen_andi_tl(cpu_gpr_d[r3], cpu_gpr_d[r3], ~0u >> (32-width));
-        }
+        /* if pos + width > 32 undefined result */
+        tcg_gen_extract_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], pos, width);
         break;
     case OPC2_32_RRPW_IMASK:
         CHECK_REG_PAIR(r3);
-        if (pos + width <= 31) {
+        if (pos + width <= 32) {
             tcg_gen_movi_tl(cpu_gpr_d[r3+1], ((1u << width) - 1) << pos);
             tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r2], pos);
         }
@@ -8320,13 +8307,9 @@ static void decode_rrrw_extract_insert(DisasContext *ctx)
         tcg_gen_sari_tl(cpu_gpr_d[r4], cpu_gpr_d[r4], 32 - width);
         break;
     case OPC2_32_RRRW_EXTR_U:
-        if (width == 0) {
-            tcg_gen_movi_tl(cpu_gpr_d[r4], 0);
-        } else {
-            tcg_gen_andi_tl(temp, cpu_gpr_d[r3], 0x1f);
-            tcg_gen_shr_tl(cpu_gpr_d[r4], cpu_gpr_d[r1], temp);
-            tcg_gen_andi_tl(cpu_gpr_d[r4], cpu_gpr_d[r4], ~0u >> (32-width));
-        }
+        tcg_gen_andi_tl(temp, cpu_gpr_d[r3], 0x1f);
+        tcg_gen_shr_tl(cpu_gpr_d[r4], cpu_gpr_d[r1], temp);
+        tcg_gen_andi_tl(cpu_gpr_d[r4], cpu_gpr_d[r4], ~0u >> (32-width));
         break;
     case OPC2_32_RRRW_IMASK:
         temp2 = tcg_temp_new();
-- 
2.30.0


