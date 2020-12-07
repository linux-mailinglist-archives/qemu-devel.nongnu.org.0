Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F350A2D09D0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 05:49:25 +0100 (CET)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8Si-0001TJ-Qv
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 23:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1km8Ql-0008K7-IR
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:47:23 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:32984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1km8Qh-00018E-J2
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:47:23 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3647852|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.263026-0.000626056-0.736348;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.J3tRDLu_1607316427; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.J3tRDLu_1607316427)
 by smtp.aliyun-inc.com(10.147.41.199);
 Mon, 07 Dec 2020 12:47:08 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Fixup SIMD fcmla(by element) in 4H arrangement
Date: Mon,  7 Dec 2020 12:46:54 +0800
Message-Id: <20201207044655.2312-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
References: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For SIMD fcmla(by element), if the number of elements is less than
the number of elements within one segment，i.e. 4H arrangement,
we should not calculate the entire segment.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/arm/vec_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 7174030377..44b8165323 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -544,6 +544,10 @@ void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm,
     neg_real <<= 15;
     neg_imag <<= 15;
 
+    /* Adjust eltspersegment for simd 4H */
+    if (eltspersegment > elements) {
+        eltspersegment = elements;
+    }
     for (i = 0; i < elements; i += eltspersegment) {
         float16 mr = m[H2(i + 2 * index + 0)];
         float16 mi = m[H2(i + 2 * index + 1)];
@@ -610,6 +614,10 @@ void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm,
     neg_real <<= 31;
     neg_imag <<= 31;
 
+    /* Adjust eltspersegment for simd 4H */
+    if (eltspersegment > elements) {
+        eltspersegment = elements;
+    }
     for (i = 0; i < elements; i += eltspersegment) {
         float32 mr = m[H4(i + 2 * index + 0)];
         float32 mi = m[H4(i + 2 * index + 1)];
-- 
2.23.0


