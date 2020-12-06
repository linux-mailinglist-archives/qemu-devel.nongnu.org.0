Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E12D083E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:53:10 +0100 (CET)
Received: from localhost ([::1]:42704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3q1-0001ug-Aa
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dx-0005gr-Lz
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:45 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dv-0007mO-Kc
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:41 -0500
Received: by mail-wr1-x42a.google.com with SMTP id y17so1609087wrr.10
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3yW7Q/kZO8O6aW6XbRUlcf0EmcrkqsX0rg11stnjUs=;
 b=q2xge+aIvR1sBZv4AWVUi6UC4i1ICC7CvStloK6ObHRbBh/Xhnh3/ZQ8/gaPbj/imf
 J1yZ0a82F0Hh75erzBJDt3bQ231e6t50hzFZre7FvGxZseLzrOtZIBQYRk96/9GT6s7v
 cjrdZBpvMKAjMoH9jPG9HOJM72zVHuGnEMN1UBtdciWNQRdvFMoJE0PE8UMLXXu7WaCX
 gaLrNNDJhQe5Nj6xlgfMov6atxHx3ShKd7NMlCfIz/1hjXQudQsgisrmluQvmocmvgG0
 RO6RA9qBs0DPcPUtOHQl7ZqzDBYwlKDtYpppa3KD/r85zxnFz4wdat6OW5kOR0RnnVWX
 ZyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m3yW7Q/kZO8O6aW6XbRUlcf0EmcrkqsX0rg11stnjUs=;
 b=uhMB/+4Cv7EvpWZXsk598iOm2Zofjv4Y8fC+nWockGG9TsxDnP4aXfurUtmCocOO6C
 F1ooAWpqPFhGZms78HCrA2xAFQbqHdQjvLA+Uib5FzvHcoC0gctElVirtTcAJW9F8ml8
 MXfBtcbC7o3R7dvk40wzyyyTMiS3OzHcytHgmCnsNnZ50MKXobXya93BpMpuWOLjGYtU
 pcVNeXzDpjjVfuGZRilr0cWOJGiEAEjyx1UnccfXKO6y6AyaCvzrmJ+L8Q/SOUMSkdZ1
 FshBtaapnaKDFjYUJgZ6gM/8eId58NRirTyFHw79RsHIR7RoOT6wLS4pOkyskc2u/RGl
 ykKA==
X-Gm-Message-State: AOAM530jQl4pHHlV15GBmkR7M8/vB7KYuE3cPm9t62it2qzZVOYnCF8P
 FgWeQFJkPHgaPhgZ7qrYcT5dM5Wuzo8=
X-Google-Smtp-Source: ABdhPJwFcv3NFWbse7VYk8f1/MogekTdhhYhfUCC6z6eGhN/SHrc0wkos4mLTsztd6KyNRJ5ZrurGA==
X-Received: by 2002:adf:b194:: with SMTP id q20mr5061839wra.199.1607298038017; 
 Sun, 06 Dec 2020 15:40:38 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 94sm3638043wrq.22.2020.12.06.15.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/19] target/mips: Move mips_cpu_add_definition() from
 helper.c to cpu.c
Date: Mon,  7 Dec 2020 00:39:39 +0100
Message-Id: <20201206233949.3783184-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c    | 33 +++++++++++++++++++++++++++++++++
 target/mips/helper.c | 33 ---------------------------------
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 8d9ef139f07..e612a7ac41a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -30,6 +30,7 @@
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-clock.h"
+#include "qapi/qapi-commands-machine-target.h"
 
 static void mips_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -299,6 +300,38 @@ static void mips_cpu_register_types(void)
 
 type_init(mips_cpu_register_types)
 
+static void mips_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfoList *entry;
+    CpuDefinitionInfo *info;
+    const char *typename;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_MIPS_CPU));
+    info->q_typename = g_strdup(typename);
+
+    entry = g_malloc0(sizeof(*entry));
+    entry->value = info;
+    entry->next = *cpu_list;
+    *cpu_list = entry;
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+
+    list = object_class_get_list(TYPE_MIPS_CPU, false);
+    g_slist_foreach(list, mips_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
+
 /* Could be used by generic CPU object */
 MIPSCPU *mips_cpu_create_with_clock(const char *cpu_type, Clock *cpu_refclk)
 {
diff --git a/target/mips/helper.c b/target/mips/helper.c
index 063b65c0528..bb962a3e8cc 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -24,7 +24,6 @@
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "hw/mips/cpudevs.h"
-#include "qapi/qapi-commands-machine-target.h"
 
 enum {
     TLBRET_XI = -6,
@@ -1497,35 +1496,3 @@ void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
 
     cpu_loop_exit_restore(cs, pc);
 }
-
-static void mips_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfoList *entry;
-    CpuDefinitionInfo *info;
-    const char *typename;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_MIPS_CPU));
-    info->q_typename = g_strdup(typename);
-
-    entry = g_malloc0(sizeof(*entry));
-    entry->value = info;
-    entry->next = *cpu_list;
-    *cpu_list = entry;
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-
-    list = object_class_get_list(TYPE_MIPS_CPU, false);
-    g_slist_foreach(list, mips_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
-}
-- 
2.26.2


