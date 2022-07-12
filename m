Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF7A571484
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:28:58 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBGL-0008AT-8h
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oBAqC-0003Og-0s
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:01:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57088 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oBAq4-0001Qi-9v
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:01:55 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9JdKs1i3NgYAA--.15429S3; 
 Tue, 12 Jul 2022 16:01:34 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 1/5] target/loongarch/cpu: Fix cpu_class_by_name function
Date: Tue, 12 Jul 2022 16:01:29 +0800
Message-Id: <20220712080133.4176971-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
References: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_9JdKs1i3NgYAA--.15429S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy3WrW7Wr4DtFy3tFW5Wrg_yoWfZFc_Wa
 4fZ3ykWF4DW3WDtw4jv34rJw15JF4rCFnIkF9rA39agwn8XF45ArsFqwn7Z34Ygr45KFnY
 krW7CryYyr4akjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

In loongarch_cpu_class_by_name(char *cpu_model) function,
the argument cpu_model already has the suffix '-loongarch-cpu',
so we should remove the LOONGARCH_CPU_TYPE_NAME(cpu_model) macro.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/cpu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index e21715592a..8294b05ee8 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -571,11 +571,8 @@ static void loongarch_cpu_init(Object *obj)
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
-    char *typename;
 
-    typename = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
+    oc = object_class_by_name(cpu_model);
     return oc;
 }
 
-- 
2.31.1


