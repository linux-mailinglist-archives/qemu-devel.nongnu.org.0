Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0BA3B2D2D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:03:34 +0200 (CEST)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwN8v-0002Ut-UP
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwMxW-0004rr-EK
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:51:46 -0400
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:55149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwMxQ-0007z1-CH
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:51:46 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2191468|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0457685-0.0036406-0.950591;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=3; RT=3; SR=0; TI=SMTPD_---.KXKBQkc_1624531893; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKBQkc_1624531893)
 by smtp.aliyun-inc.com(10.147.40.200);
 Thu, 24 Jun 2021 18:51:34 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] tcg: Add tcg_gen_vec_add{sub}8_i32
Date: Thu, 24 Jun 2021 18:50:20 +0800
Message-Id: <20210624105023.3852-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105023.3852-1-zhiwei_liu@c-sky.com>
References: <20210624105023.3852-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.217; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Implement tcg_gen_vec_add{sub}8_tl by adding corresponging i32 OP.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 include/tcg/tcg-op-gvec.h |  6 ++++++
 tcg/tcg-op-gvec.c         | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 9b67822f54..2d5ad6ce12 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -402,14 +402,20 @@ void tcg_gen_vec_rotl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 void tcg_gen_vec_rotl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 
 /* 32-bit vector operations. */
+void tcg_gen_vec_add8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_add16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 
+void tcg_gen_vec_sub8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 
 #if TARGET_LONG_BITS == 64
+#define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i64
+#define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i64
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i64
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i64
 #else
+#define tcg_gen_vec_add8_tl  tcg_gen_vec_add8_i32
+#define tcg_gen_vec_sub8_tl  tcg_gen_vec_sub8_i32
 #define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
 #define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
 #endif
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index a8898ba7bf..78b86194a7 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -1736,6 +1736,25 @@ void tcg_gen_vec_add8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     gen_addv_mask(d, a, b, m);
 }
 
+void tcg_gen_vec_add8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8, 0x80));
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t3 = tcg_temp_new_i32();
+
+    tcg_gen_andc_i32(t1, a, m);
+    tcg_gen_andc_i32(t2, b, m);
+    tcg_gen_xor_i32(t3, a, b);
+    tcg_gen_add_i32(d, t1, t2);
+    tcg_gen_and_i32(t3, t3, m);
+    tcg_gen_xor_i32(d, d, t3);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+}
+
 void tcg_gen_vec_add16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
     TCGv_i64 m = tcg_constant_i64(dup_const(MO_16, 0x8000));
@@ -1900,6 +1919,25 @@ void tcg_gen_vec_sub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     gen_subv_mask(d, a, b, m);
 }
 
+void tcg_gen_vec_sub8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8, 0x80));
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t3 = tcg_temp_new_i32();
+
+    tcg_gen_or_i32(t1, a, m);
+    tcg_gen_andc_i32(t2, b, m);
+    tcg_gen_eqv_i32(t3, a, b);
+    tcg_gen_sub_i32(d, t1, t2);
+    tcg_gen_and_i32(t3, t3, m);
+    tcg_gen_xor_i32(d, d, t3);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+}
+
 void tcg_gen_vec_sub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
     TCGv_i64 m = tcg_constant_i64(dup_const(MO_16, 0x8000));
-- 
2.17.1


