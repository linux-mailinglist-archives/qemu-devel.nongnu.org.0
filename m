Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417840B356
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:42:30 +0200 (CEST)
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAZo-0006MY-NB
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Xb-0006X7-Gp
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9XX-0005IQ-Jk
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1wcruW+g3FbhxuBTmshlgas1GP2gbIYSddshDcwvVw=;
 b=exv4JG3huLeEF/ZNBsJQ//WTnAYxMX/kuh3tBe/sfWoNvD+7Ww87VSMJJtkoi53/o+99u5
 2bab/P8DsFWYXloDmkZn0Oz+UMuACJqW2UhFAs/rakomTPU1txQJeYsH4DpyRZF43GA92s
 HCojHd1IT+YGdiNie/Ci5UDmPrMm6BU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-0IulxTMMNcWSB60ECpszPA-1; Tue, 14 Sep 2021 10:36:01 -0400
X-MC-Unique: 0IulxTMMNcWSB60ECpszPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F3D1180830C;
 Tue, 14 Sep 2021 14:35:57 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5970C5D9CA;
 Tue, 14 Sep 2021 14:35:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 50/53] monitor: merge duplicate "info tlb" handlers
Date: Tue, 14 Sep 2021 15:20:39 +0100
Message-Id: <20210914142042.1655100-51-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all target architectures are converted to use the "format_tlb"
callback, we can merge all the duplicate "info tlb" handlers into one
and remove the architecture condition on the command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands-info.hx         |  3 ---
 include/monitor/hmp-target.h |  1 -
 monitor/misc.c               | 15 +++++++++++++++
 target/i386/monitor.c        | 15 ---------------
 target/m68k/monitor.c        | 15 ---------------
 target/nios2/monitor.c       | 15 ---------------
 target/ppc/monitor.c         | 15 ---------------
 target/sh4/monitor.c         | 15 ---------------
 target/sparc/monitor.c       | 16 ----------------
 target/xtensa/monitor.c      | 15 ---------------
 10 files changed, 15 insertions(+), 110 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index f8312342cd..7bd1e04d46 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -206,8 +206,6 @@ SRST
     Show PCI information.
 ERST
 
-#if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
-    defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
     {
         .name       = "tlb",
         .args_type  = "",
@@ -215,7 +213,6 @@ ERST
         .help       = "show virtual to physical memory mappings",
         .cmd        = hmp_info_tlb,
     },
-#endif
 
 SRST
   ``info tlb``
diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index df79ad3355..04e02e8895 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -45,7 +45,6 @@ CPUArchState *mon_get_cpu_env(Monitor *mon);
 CPUState *mon_get_cpu(Monitor *mon);
 
 void hmp_info_mem(Monitor *mon, const QDict *qdict);
-void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 6b07efdddd..c7d138914d 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -936,6 +936,21 @@ static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
     mtree_info(flatview, dispatch_tree, owner, disabled);
 }
 
+static void hmp_info_tlb(Monitor *mon, const QDict *qdict)
+{
+    g_autoptr(GString) buf = g_string_new("");
+    CPUState *cpu = mon_get_cpu(mon);
+
+    if (!cpu) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+
+    cpu_format_tlb(cpu, buf);
+
+    monitor_printf(mon, "%s", buf->str);
+}
+
 static void hmp_info_profile(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 698fbbc80b..a7eb4205c7 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -248,21 +248,6 @@ void x86_cpu_format_tlb(CPUState *cpu, GString *buf)
     }
 }
 
-void hmp_info_tlb(Monitor *mon, const QDict *qdict)
-{
-    g_autoptr(GString) buf = g_string_new("");
-    CPUState *cpu = mon_get_cpu(mon);
-
-    if (!cpu) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-
-    cpu_format_tlb(cpu, buf);
-
-    monitor_printf(mon, "%s", buf->str);
-}
-
 static void mem_print(Monitor *mon, CPUArchState *env,
                       hwaddr *pstart, int *plast_prot,
                       hwaddr end, int prot)
diff --git a/target/m68k/monitor.c b/target/m68k/monitor.c
index 003a665246..0dc729692b 100644
--- a/target/m68k/monitor.c
+++ b/target/m68k/monitor.c
@@ -12,21 +12,6 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine-target.h"
 
-void hmp_info_tlb(Monitor *mon, const QDict *qdict)
-{
-    g_autoptr(GString) buf = g_string_new("");
-    CPUState *cpu = mon_get_cpu(mon);
-
-    if (!cpu) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-
-    cpu_format_tlb(cpu, buf);
-
-    monitor_printf(mon, "%s", buf->str);
-}
-
 static const MonitorDef monitor_defs[] = {
     { "d0", offsetof(CPUM68KState, dregs[0]) },
     { "d1", offsetof(CPUM68KState, dregs[1]) },
diff --git a/target/nios2/monitor.c b/target/nios2/monitor.c
index 99d35e8ef1..1180a32f80 100644
--- a/target/nios2/monitor.c
+++ b/target/nios2/monitor.c
@@ -26,18 +26,3 @@
 #include "monitor/monitor.h"
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
-
-void hmp_info_tlb(Monitor *mon, const QDict *qdict)
-{
-    g_autoptr(GString) buf = g_string_new("");
-    CPUState *cpu = mon_get_cpu(mon);
-
-    if (!cpu) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-
-    cpu_format_tlb(cpu, buf);
-
-    monitor_printf(mon, "%s", buf->str);
-}
diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
index 401a36c2eb..3564fd5f45 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/monitor.c
@@ -65,21 +65,6 @@ static target_long monitor_get_tbl(Monitor *mon, const struct MonitorDef *md,
     return cpu_ppc_load_tbl(env);
 }
 
-void hmp_info_tlb(Monitor *mon, const QDict *qdict)
-{
-    g_autoptr(GString) buf = g_string_new("");
-    CPUState *cpu = mon_get_cpu(mon);
-
-    if (!cpu) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-
-    cpu_format_tlb(cpu, buf);
-
-    monitor_printf(mon, "%s", buf->str);
-}
-
 const MonitorDef monitor_defs[] = {
     { "fpscr", offsetof(CPUPPCState, fpscr) },
     /* Next instruction pointer */
diff --git a/target/sh4/monitor.c b/target/sh4/monitor.c
index 5ccb95af93..d641d95316 100644
--- a/target/sh4/monitor.c
+++ b/target/sh4/monitor.c
@@ -53,18 +53,3 @@ void superh_cpu_format_tlb(CPUState *cpu, GString *buf)
         print_tlb(buf, i, &env->utlb[i]);
     }
 }
-
-void hmp_info_tlb(Monitor *mon, const QDict *qdict)
-{
-    g_autoptr(GString) buf = g_string_new("");
-    CPUState *cpu = mon_get_cpu(mon);
-
-    if (!cpu) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-
-    cpu_format_tlb(cpu, buf);
-
-    monitor_printf(mon, "%s", buf->str);
-}
diff --git a/target/sparc/monitor.c b/target/sparc/monitor.c
index cc7fe74e3e..0c51669c08 100644
--- a/target/sparc/monitor.c
+++ b/target/sparc/monitor.c
@@ -27,22 +27,6 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 
-
-void hmp_info_tlb(Monitor *mon, const QDict *qdict)
-{
-    g_autoptr(GString) buf = g_string_new("");
-    CPUState *cpu = mon_get_cpu(mon);
-
-    if (!cpu) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-
-    cpu_format_tlb(cpu, buf);
-
-    monitor_printf(mon, "%s", buf->str);
-}
-
 #ifndef TARGET_SPARC64
 static target_long monitor_get_psr(Monitor *mon, const struct MonitorDef *md,
                                    int val)
diff --git a/target/xtensa/monitor.c b/target/xtensa/monitor.c
index 99d35e8ef1..1180a32f80 100644
--- a/target/xtensa/monitor.c
+++ b/target/xtensa/monitor.c
@@ -26,18 +26,3 @@
 #include "monitor/monitor.h"
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
-
-void hmp_info_tlb(Monitor *mon, const QDict *qdict)
-{
-    g_autoptr(GString) buf = g_string_new("");
-    CPUState *cpu = mon_get_cpu(mon);
-
-    if (!cpu) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-
-    cpu_format_tlb(cpu, buf);
-
-    monitor_printf(mon, "%s", buf->str);
-}
-- 
2.31.1


