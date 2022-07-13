Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775D573398
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 11:56:05 +0200 (CEST)
Received: from localhost ([::1]:42130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBZ6C-0001Fz-J9
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 05:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oBZ1W-0003Ix-R8
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 05:51:14 -0400
Received: from [114.242.206.163] (port=38478 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oBZ1U-0005JA-R3
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 05:51:14 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx39Bslc5iXkcbAA--.18694S7; 
 Wed, 13 Jul 2022 17:50:38 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 5/5] target/loongarch/op_helper: Fix coverity cond_at_most
 error
Date: Wed, 13 Jul 2022 17:50:36 +0800
Message-Id: <20220713095036.705102-6-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
References: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx39Bslc5iXkcbAA--.18694S7
X-Coremail-Antispam: 1UD129KBjvdXoWrtFW7CFWrZw4UKr4rury5twb_yoW3Kwc_uF
 W2qrnxurs7Ww1jka1Yv34ktr1xKF18GFnI9a1DXw42kFyYga1fJrs0g3s3Cr1UCFyrJrs0
 vwnFyry3C3WYkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.242.206.163 (deferred)
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

The boundary size of cpucfg array should be 0 to 20. So,
using index bigger than 20 to access cpucfg[] must be forbidden.

Fix coverity CID: 1489760

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
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


