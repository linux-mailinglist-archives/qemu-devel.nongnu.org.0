Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAF644AE1C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:54:19 +0100 (CET)
Received: from localhost ([::1]:50988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkQdm-00034L-8A
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkQc9-0000Hv-CT
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:52:37 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37726 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkQc5-0006KH-2M
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:52:36 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cx+dD5bophXJYBAA--.3628S7;
 Tue, 09 Nov 2021 20:52:17 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/30] target/loongarch: Implement
 qmp_query_cpu_definitions()
Date: Tue,  9 Nov 2021 20:51:44 +0800
Message-Id: <1636462329-1716-6-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636462329-1716-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636462329-1716-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Cx+dD5bophXJYBAA--.3628S7
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWxZFy7Aw4fZw13ZF4rAFb_yoW8ZFW7pF
 sxZrZ8KrW8JrZxKw1fJFW8urn09ws7Ww1jyan3J3yv9a13X3y8uF1vkryjk3W8WrW8WrWx
 uFs8AF15uF4DJwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 i.qemu@xen0n.name, richard.henderson@linaro.org, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, yangxiaojuan@loongson.cn,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk, chenhuacai@loongson.cn,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces qmp_query_cpu_definitions interface.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 qapi/machine-target.json |  6 ++++--
 target/loongarch/cpu.c   | 28 ++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

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
index 16443159cc..c3e7c5dc98 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -342,3 +342,31 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
 };
 
 DEFINE_TYPES(loongarch_cpu_type_infos)
+
+static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info;
+    const char *typename;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
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


