Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E432549F233
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:59:32 +0100 (CET)
Received: from localhost ([::1]:46966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDIQ7-0007gD-Hm
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIBd-0007T4-BJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:33 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40368 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIBZ-0002KW-RM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:32 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S6; 
 Fri, 28 Jan 2022 11:44:25 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 04/30] target/loongarch: Implement
 qmp_query_cpu_definitions()
Date: Thu, 27 Jan 2022 22:43:46 -0500
Message-Id: <20220128034412.1262452-5-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S6
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWxZFyrGw4fKr48Jr4kCrg_yoW8Zr1xpF
 sxZrsxKrW8GrZxKw1fJFW8urnI9ws7Ww1jyFs3A3yv9a13Xw48uF1vkryjk3WUW3y8WrW7
 uFs8AF15uF4DJ3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 qapi/machine-target.json |  6 ++++--
 target/loongarch/cpu.c   | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index f5ec4bc172..682dc86b42 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -324,7 +324,8 @@
                    'TARGET_ARM',
                    'TARGET_I386',
                    'TARGET_S390X',
-                   'TARGET_MIPS' ] } }
+                   'TARGET_MIPS',
+                   'TARGET_LOONGARCH64' ] } }
 
 ##
 # @query-cpu-definitions:
@@ -340,4 +341,5 @@
                    'TARGET_ARM',
                    'TARGET_I386',
                    'TARGET_S390X',
-                   'TARGET_MIPS' ] } }
+                   'TARGET_MIPS',
+                   'TARGET_LOONGARCH64' ] } }
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 6b7d871158..719a791ec0 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -358,3 +358,29 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
 };
 
 DEFINE_TYPES(loongarch_cpu_type_infos)
+
+static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
+    const char *typename = object_class_get_name(oc);
+
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
+    info->q_typename = g_strdup(typename);
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+
+    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
+    g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
-- 
2.27.0


