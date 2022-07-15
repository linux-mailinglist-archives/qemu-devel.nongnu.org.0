Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1572575B4C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 08:11:56 +0200 (CEST)
Received: from localhost ([::1]:38366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCEYN-0006uy-AO
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 02:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oCEUZ-0001Y0-EB
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:07:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49876 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oCEUW-0000gQ-FG
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:07:58 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9AtBNFicw8gAA--.25026S7; 
 Fri, 15 Jul 2022 14:07:49 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v3 5/5] target/loongarch/op_helper: Fix coverity cond_at_most
 error
Date: Fri, 15 Jul 2022 14:07:40 +0800
Message-Id: <20220715060740.1500628-6-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
References: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_9AtBNFicw8gAA--.25026S7
X-Coremail-Antispam: 1UD129KBjvdXoWrZF18Ww13JFWxCw17Xr4xJFb_yoWftFb_uF
 W2qrn8ur4Du3Wjka1Fv3s5tr1xKF18JF1Y9a1DXw4IkFyYga1fJwn0g3s3Cr1UKFyrJrn0
 9wnFyry7C3WYkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The boundary size of cpucfg array should be 0 to ARRAY_SIZE(cpucfg)-1.
So, using index bigger than max boundary to access cpucfg[] must be
forbidden.

Fix coverity CID: 1489760

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 4b429b6699..568c071601 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -81,7 +81,7 @@ target_ulong helper_crc32c(target_ulong val, target_ulong m, uint64_t sz)
 
 target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
 {
-    return rj > 21 ? 0 : env->cpucfg[rj];
+    return rj >= ARRAY_SIZE(env->cpucfg) ? 0 : env->cpucfg[rj];
 }
 
 uint64_t helper_rdtime_d(CPULoongArchState *env)
-- 
2.31.1


