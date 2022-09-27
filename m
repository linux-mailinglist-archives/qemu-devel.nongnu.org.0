Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481415EBB68
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:21:49 +0200 (CEST)
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4ua-0003tI-8o
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1od4Oh-0002za-7R
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:48:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47476 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1od4OY-0003pq-HU
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:48:45 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxPGvGnDJj8aEiAA--.2457S3; 
 Tue, 27 Sep 2022 14:48:38 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, yangxiaojuan@loongson.cn, huqi@loongson.cn,
 peter.maydell@linaro.org, alex.bennee@linaro.org, maobibo@loongson.cn
Subject: [PATCH v2 1/4] target/loongarch: ftint_xxx insns set the result high
 32bit 0xffffffff
Date: Tue, 27 Sep 2022 14:48:35 +0800
Message-Id: <20220927064838.3570928-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220927064838.3570928-1-gaosong@loongson.cn>
References: <20220927064838.3570928-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPGvGnDJj8aEiAA--.2457S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAF4xCFy8uFWfZw15Wr4kWFg_yoWruFy3p3
 4rGrW3KrWvqFZ5Za4xJ398GF15Xw4UGa4xtr4DWa4SvFsFyws8urW7t3y7ZrWDWFWrZr45
 Ja4jyFy3G3Z0qFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

we just set high 32bit 0xffffffff as the other float instructions do.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/fpu_helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 4b9637210a..1a24667eaf 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -518,7 +518,7 @@ uint64_t helper_frint_s(CPULoongArchState *env, uint64_t fj)
 {
     uint64_t fd;
 
-    fd = (uint64_t)(float32_round_to_int((uint32_t)fj, &env->fp_status));
+    fd = nanbox_s(float32_round_to_int((uint32_t)fj, &env->fp_status));
     update_fcsr0(env, GETPC());
     return fd;
 }
@@ -574,7 +574,7 @@ uint64_t helper_ftintrm_w_d(CPULoongArchState *env, uint64_t fj)
     FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
 
     set_float_rounding_mode(float_round_down, &env->fp_status);
-    fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
+    fd = nanbox_s(float64_to_int32(fj, &env->fp_status));
     set_float_rounding_mode(old_mode, &env->fp_status);
 
     if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
@@ -592,7 +592,7 @@ uint64_t helper_ftintrm_w_s(CPULoongArchState *env, uint64_t fj)
     FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
 
     set_float_rounding_mode(float_round_down, &env->fp_status);
-    fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
+    fd = nanbox_s(float32_to_int32((uint32_t)fj, &env->fp_status));
     set_float_rounding_mode(old_mode, &env->fp_status);
 
     if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
@@ -646,7 +646,7 @@ uint64_t helper_ftintrp_w_d(CPULoongArchState *env, uint64_t fj)
     FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
 
     set_float_rounding_mode(float_round_up, &env->fp_status);
-    fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
+    fd = nanbox_s(float64_to_int32(fj, &env->fp_status));
     set_float_rounding_mode(old_mode, &env->fp_status);
 
     if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
@@ -664,7 +664,7 @@ uint64_t helper_ftintrp_w_s(CPULoongArchState *env, uint64_t fj)
     FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
 
     set_float_rounding_mode(float_round_up, &env->fp_status);
-    fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
+    fd = nanbox_s(float32_to_int32((uint32_t)fj, &env->fp_status));
     set_float_rounding_mode(old_mode, &env->fp_status);
 
     if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
@@ -715,7 +715,7 @@ uint64_t helper_ftintrz_w_d(CPULoongArchState *env, uint64_t fj)
     uint64_t fd;
     FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
 
-    fd = (uint64_t)float64_to_int32_round_to_zero(fj, &env->fp_status);
+    fd = nanbox_s(float64_to_int32_round_to_zero(fj, &env->fp_status));
     set_float_rounding_mode(old_mode, &env->fp_status);
 
     if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
@@ -786,7 +786,7 @@ uint64_t helper_ftintrne_w_d(CPULoongArchState *env, uint64_t fj)
     FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status);
 
     set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
-    fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
+    fd = nanbox_s(float64_to_int32(fj, &env->fp_status));
     set_float_rounding_mode(old_mode, &env->fp_status);
 
     if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
@@ -848,7 +848,7 @@ uint64_t helper_ftint_w_s(CPULoongArchState *env, uint64_t fj)
 {
     uint64_t fd;
 
-    fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
+    fd = nanbox_s(float32_to_int32((uint32_t)fj, &env->fp_status));
     if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
         if (float32_is_any_nan((uint32_t)fj)) {
             fd = 0;
@@ -862,7 +862,7 @@ uint64_t helper_ftint_w_d(CPULoongArchState *env, uint64_t fj)
 {
     uint64_t fd;
 
-    fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
+    fd = nanbox_s(float64_to_int32(fj, &env->fp_status));
     if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
         if (float64_is_any_nan(fj)) {
             fd = 0;
-- 
2.31.1


