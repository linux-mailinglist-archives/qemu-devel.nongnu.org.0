Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763F2D9097
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:34:11 +0100 (CET)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY4I-0005ur-HR
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXsD-0003Fa-Oi
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXsC-0005h5-6i
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:41 -0500
Received: by mail-wm1-x333.google.com with SMTP id v14so11954636wml.1
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=elw3dkJb0pO4uN20lOWqB+T8hVaJgjod16PJg5LRYBw=;
 b=OakRocpid6FZj3s/PHYLg8MdRlpbGGdPHt0I1Hb3XrhOxXp3/vJv5KwyCgWALrU1gD
 cy5QiYNzKe4CL63vdsi0D1njoMUzsX59RGAdylbSTMxcaagw3mMevgxeLXuzYfRBFfey
 0FiwS7SCZsQxFLdbxVsGsavlw0q/uUP5pSakgEzriGTJ+oyDfEM/5vaeqZSWkRhZ+t2I
 6T6kvP20RAGbVNzgqNGKz8SnndsmKOKQI61NyIC7M7aQoqa9B6XIQoTlMV342ZF6GR7k
 plpVy02/WeD/36qp+tsHL80j8nR85pYGGf71Zx8TtAQGRIJWV5Sn3Hgcu2yw1InrB4zD
 hyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=elw3dkJb0pO4uN20lOWqB+T8hVaJgjod16PJg5LRYBw=;
 b=e7pv2lmlOjscEGB0tgv8t9AgDPM34TmJuwz7+2ZDTSLVccu8UNH0wI1GQ+V23f6NHc
 /2uyOJ0xd4TTiNOrtrkNXhXGNG/hrdIHoD9UtfApukWdVRLeeR9tK/ARgI0hkMoHUZ4F
 s2+94bLIFiowqTqesRqqPUD/uN9vlHx+GVFps0jcyC0PQQMA/r0DQ1qywQ4VE3moRSo5
 Pe/UUEikmvXaevwS2LqwwKRcbx8F++dARmSZ3qwO+wGIxzyAVlhXu9K2wjYXal5x5v7T
 B08iHtNzSqDgbFbTeCyl/Cas+1evfaNZTlcxZzqs29Pjpt+vXyqfE2SsyY0a+qpkD0jp
 Pbfg==
X-Gm-Message-State: AOAM532+6lYKGYL4iBPBvGuB+EDjffvNXbw2KrSBq7QkYzYYcU0JybV4
 thcmpOVU+GsXjUvYUj1qKr5RqCxBNFE=
X-Google-Smtp-Source: ABdhPJxYfakzKjYyS+h5ikBDwAbUZrCSc5kwJtqdOV5z+575/HCCL+TNCGZORrpxlu3KFPynTy49wg==
X-Received: by 2002:a1c:8016:: with SMTP id b22mr24363664wmd.135.1607890898684; 
 Sun, 13 Dec 2020 12:21:38 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j7sm26852271wmb.40.2020.12.13.12.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/26] target/mips: Move mips_cpu_add_definition() from
 helper.c to cpu.c
Date: Sun, 13 Dec 2020 21:19:42 +0100
Message-Id: <20201213201946.236123-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-10-f4bug@amsat.org>
---
 target/mips/cpu.c    | 33 +++++++++++++++++++++++++++++++++
 target/mips/helper.c | 33 ---------------------------------
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 3024c51a211..c29fef29d00 100644
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
index 0c657865793..87296fbad69 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -24,7 +24,6 @@
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "hw/mips/cpudevs.h"
-#include "qapi/qapi-commands-machine-target.h"
 
 enum {
     TLBRET_XI = -6,
@@ -1500,35 +1499,3 @@ void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
 
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


