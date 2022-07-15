Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65A575B70
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 08:20:51 +0200 (CEST)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCEh0-0004BY-8a
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 02:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oCEUe-0001eE-3g
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:08:04 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49862 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oCEUY-0000gJ-M6
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:08:03 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9AtBNFicw8gAA--.25026S3; 
 Fri, 15 Jul 2022 14:07:48 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v3 1/5] target/loongarch/cpu: Fix cpu_class_by_name function
Date: Fri, 15 Jul 2022 14:07:36 +0800
Message-Id: <20220715060740.1500628-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
References: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_9AtBNFicw8gAA--.25026S3
X-Coremail-Antispam: 1UD129KBjvJXoWrZFy3WrW7Xw4xuryUJrWrXwb_yoW8Jr17pr
 y7CFZ8KrWxKFZrK3WkJas8WF1kXr1xXF42qa1ayrsY9rWqqryxXr1Iy34qkF98Jay8Xw47
 XF4rAF15J3WrXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
And add the assertion that 'cpu_model' resolves to a class of the
appropriate type.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index e21715592a..ed26f9beed 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -571,11 +571,12 @@ static void loongarch_cpu_init(Object *obj)
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
-    char *typename;
 
-    typename = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
+    oc = object_class_by_name(cpu_model);
+    if (!oc || !object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU) ||
+        object_class_is_abstract(oc)) {
+        return NULL;
+    }
     return oc;
 }
 
-- 
2.31.1


