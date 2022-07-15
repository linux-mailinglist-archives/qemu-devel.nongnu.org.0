Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE7575BD4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 08:51:08 +0200 (CEST)
Received: from localhost ([::1]:53464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCFAI-0002Tw-PZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 02:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oCF81-00013X-7X
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:48:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35046 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oCF7y-000641-Ne
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:48:44 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9C9DdFiBiMgAA--.1778S2;
 Fri, 15 Jul 2022 14:48:29 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v1] target/loongarch/cpu: Fix cpucfg default value
Date: Fri, 15 Jul 2022 14:48:29 +0800
Message-Id: <20220715064829.1521482-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn9C9DdFiBiMgAA--.1778S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF48ZrWUuF4UZryUXr4Dtwb_yoWfZrb_WF
 13XrsY934Dua17tw4j9ry5J3y5Ga1kGFnakF4DXr4fGw15Ja13uws0qwsxur1ay347Crs3
 XrZFqFyrA3y5CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

We should config cpucfg[20] to set value for the scache's ways, sets,
and size arguments when loongarch cpu init. However, the old code
wirte 'sets argument' twice, so we change one of them to 'size argument'.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 89ea971cde..4cfce8c9d2 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -406,7 +406,7 @@ static void loongarch_la464_initfn(Object *obj)
     data = 0;
     data = FIELD_DP32(data, CPUCFG20, L3IU_WAYS, 15);
     data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 14);
-    data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 6);
+    data = FIELD_DP32(data, CPUCFG20, L3IU_SIZE, 6);
     env->cpucfg[20] = data;
 
     env->CSR_ASID = FIELD_DP64(0, CSR_ASID, ASIDBITS, 0xa);
-- 
2.31.1


