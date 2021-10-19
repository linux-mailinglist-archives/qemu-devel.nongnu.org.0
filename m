Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B55432FF5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:44:04 +0200 (CEST)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjn1-000777-W7
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjew-0001G9-En
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34738 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjes-0004PW-Ia
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:42 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S7; 
 Tue, 19 Oct 2021 15:35:29 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/31] target/loongarch: Implement qmp_query_cpu_definitions()
Date: Tue, 19 Oct 2021 15:34:51 +0800
Message-Id: <1634628917-10031-6-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S7
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWxZFWxAw45tr15KrW8Xrb_yoW8Zr4xpF
 sxZrZxKr48JrZxKw1fJFW8urnI9ws7W34jyFs3J3yv9a13X3y8uF1vkryjk3W8WrW8WrWx
 uF4DAF15uF4DJ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduce qmp_query_cpu_definitions interface.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
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
index 14352fb139..dcd951c377 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -336,3 +336,31 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
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


