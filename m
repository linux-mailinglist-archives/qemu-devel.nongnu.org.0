Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D76D3B2D5D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:12:09 +0200 (CEST)
Received: from localhost ([::1]:36190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNHD-0000z3-Ft
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwMxT-0004rg-Gm
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:51:45 -0400
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwMxQ-0007zD-7w
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:51:43 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07744556|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.483948-0.000250596-0.515801;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=3; RT=3; SR=0; TI=SMTPD_---.KXKBQkc_1624531893; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKBQkc_1624531893)
 by smtp.aliyun-inc.com(10.147.40.200);
 Thu, 24 Jun 2021 18:51:34 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] tcg: Add tcg_gen_vec_shl{shr}{sar}8i_i32
Date: Thu, 24 Jun 2021 18:50:22 +0800
Message-Id: <20210624105023.3852-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105023.3852-1-zhiwei_liu@c-sky.com>
References: <20210624105023.3852-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.122; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-122.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement tcg_gen_vec_shl{shr}{sar}8i_tl by adding corresponging i32 OP.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 include/tcg/tcg-op-gvec.h | 10 ++++++++++
 tcg/tcg-op-gvec.c         | 28 ++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index e3c9f45926..e3b274502c 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -408,8 +408,11 @@ void tcg_gen_vec_add16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 
+void tcg_gen_vec_shl8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_shl16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
+void tcg_gen_vec_shr8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_shr16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
+void tcg_gen_vec_sar8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 
 #if TARGET_LONG_BITS == 64
@@ -417,14 +420,21 @@ void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t);
 #define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i64
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i64
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i64
+#define tcg_gen_vec_shl8i_tl tcg_gen_vec_shl8i_i64
+#define tcg_gen_vec_shr8i_tl tcg_gen_vec_shr8i_i64
+#define tcg_gen_vec_sar8i_tl tcg_gen_vec_sar8i_i64
 #define tcg_gen_vec_shl16i_tl tcg_gen_vec_shl16i_i64
 #define tcg_gen_vec_shr16i_tl tcg_gen_vec_shr16i_i64
 #define tcg_gen_vec_sar16i_tl tcg_gen_vec_sar16i_i64
+
 #else
 #define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i32
 #define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i32
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
+#define tcg_gen_vec_shl8i_tl tcg_gen_vec_shl8i_i32
+#define tcg_gen_vec_shr8i_tl tcg_gen_vec_shr8i_i32
+#define tcg_gen_vec_sar8i_tl tcg_gen_vec_sar8i_i32
 #define tcg_gen_vec_shl16i_tl tcg_gen_vec_shl16i_i32
 #define tcg_gen_vec_shr16i_tl tcg_gen_vec_shr16i_i32
 #define tcg_gen_vec_sar16i_tl tcg_gen_vec_sar16i_i32
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index c2ce05e9ee..fabad7cc00 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -2678,6 +2678,13 @@ void tcg_gen_vec_shl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_gen_andi_i64(d, d, mask);
 }
 
+void tcg_gen_vec_shl8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t mask = dup_const(MO_8, 0xff << c);
+    tcg_gen_shli_i32(d, a, c);
+    tcg_gen_andi_i32(d, d, mask);
+}
+
 void tcg_gen_vec_shl16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
 {
     uint32_t mask = dup_const(MO_16, 0xffff << c);
@@ -2736,6 +2743,13 @@ void tcg_gen_vec_shr16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_gen_andi_i64(d, d, mask);
 }
 
+void tcg_gen_vec_shr8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t mask = dup_const(MO_8, 0xff >> c);
+    tcg_gen_shri_i32(d, a, c);
+    tcg_gen_andi_i32(d, d, mask);
+}
+
 void tcg_gen_vec_shr16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
 {
     uint32_t mask = dup_const(MO_16, 0xffff >> c);
@@ -2808,6 +2822,20 @@ void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
     tcg_temp_free_i64(s);
 }
 
+void tcg_gen_vec_sar8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
+{
+    uint32_t s_mask = dup_const(MO_8, 0x80 >> c);
+    uint32_t c_mask = dup_const(MO_8, 0xff >> c);
+    TCGv_i32 s = tcg_temp_new_i32();
+
+    tcg_gen_shri_i32(d, a, c);
+    tcg_gen_andi_i32(s, d, s_mask);  /* isolate (shifted) sign bit */
+    tcg_gen_muli_i32(s, s, (2 << c) - 2); /* replicate isolated signs */
+    tcg_gen_andi_i32(d, d, c_mask);  /* clear out bits above sign  */
+    tcg_gen_or_i32(d, d, s);         /* include sign extension */
+    tcg_temp_free_i32(s);
+}
+
 void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
 {
     uint32_t s_mask = dup_const(MO_16, 0x8000 >> c);
-- 
2.17.1


