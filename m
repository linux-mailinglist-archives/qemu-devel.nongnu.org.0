Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B6B554573
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:58:39 +0200 (CEST)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y4E-0003vH-R4
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3xvt-000805-Bl
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:50:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55338 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3xvr-0004ks-Aw
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:50:01 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0838rJi+BtUAA--.28846S11; 
 Wed, 22 Jun 2022 18:43:07 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 09/10] target/loongarch: Fix the meaning of ECFG reg's VS field
Date: Wed, 22 Jun 2022 18:43:00 +0800
Message-Id: <20220622104301.804447-10-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
References: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0838rJi+BtUAA--.28846S11
X-Coremail-Antispam: 1UD129KBjvdXoW7Wry5uw1rCw1rKFW5uw4fAFb_yoW3ZFX_W3
 WfuF4kuFyjg3ZFqr4Fk345t345Xr18Ka1q9F92qrZ7Ga45XrsxZw4vgwn7ur12grW7GFnx
 A347GryYyr4akjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

By the manual of LoongArch CSR, the VS field(18:16 bits) of
ECFG reg means that the number of instructions between each
exception entry is 2^VS.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 401d3fd30a..d1a87e8e1c 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -219,6 +219,10 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV, 0);
     env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE, 0);
 
+    if (vec_size) {
+        vec_size = (1 << vec_size) * 4;
+    }
+
     if  (cs->exception_index == EXCCODE_INT) {
         /* Interrupt */
         uint32_t vector = 0;
-- 
2.31.1


