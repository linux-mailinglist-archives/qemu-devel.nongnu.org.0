Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7AA5BB70E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 10:07:09 +0200 (CEST)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZSqx-00032M-M0
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 04:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oZSk3-0006Xe-6d
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:59:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57650 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oZSk0-0008Sh-6E
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:59:58 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxBOJ2fiVjHQccAA--.40868S6; 
 Sat, 17 Sep 2022 15:59:51 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
Subject: [PATCH 4/5] target/loongarch: flogb_{s/d} add set float_flag_divbyzero
Date: Sat, 17 Sep 2022 15:59:49 +0800
Message-Id: <20220917075950.1412309-5-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220917075950.1412309-1-gaosong@loongson.cn>
References: <20220917075950.1412309-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxBOJ2fiVjHQccAA--.40868S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4fuFykCr1kKrWxAF45GFg_yoW8WrW5pr
 WfuFW3trW8XFZ7Za93A39Yqr45X3y8GrWIvrnav3yrtr4UXr4Dur4SgasF9Fy5XryUJr1Y
 qFsYyrW7GF45XrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

if fj ==0 or fj == INT32_MIN/INT64_MIN, LoongArch host set fcsr cause exception FP_DIV0,
So we need set exception flags float_flagdivbyzero if fj ==0.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/fpu_helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 1a24667eaf..8ddfbd1abd 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -322,6 +322,13 @@ uint64_t helper_flogb_s(CPULoongArchState *env, uint64_t fj)
     fp = float32_log2((uint32_t)fj, status);
     fd = nanbox_s(float32_round_to_int(fp, status));
     set_float_rounding_mode(old_mode, status);
+    /*
+     * LoongArch host if fj == 0 or INT32_MIN , set the fcsr cause FP_DIV0
+     * so we need set exception flags float_flag_divbyzero.
+     */
+    if (((uint32_t)fj == 0) | ((uint32_t)fj == INT32_MIN )) {
+        set_float_exception_flags(float_flag_divbyzero, status);
+    }
     update_fcsr0_mask(env, GETPC(), float_flag_inexact);
     return fd;
 }
@@ -336,6 +343,13 @@ uint64_t helper_flogb_d(CPULoongArchState *env, uint64_t fj)
     fd = float64_log2(fj, status);
     fd = float64_round_to_int(fd, status);
     set_float_rounding_mode(old_mode, status);
+    /*
+     * LoongArch host if fj == 0 or INT64_MIN , set the fcsr cause FP_DIV0
+     * so we need set exception flags float_flag_divbyzero.
+     */
+    if ( (fj == 0) | (fj == INT64_MIN)) {
+        set_float_exception_flags(float_flag_divbyzero, status);
+    }
     update_fcsr0_mask(env, GETPC(), float_flag_inexact);
     return fd;
 }
-- 
2.31.1


