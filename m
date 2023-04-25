Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3966EE347
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:40:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prItC-0003AO-IS; Tue, 25 Apr 2023 09:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prIss-00035G-46
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prIsp-0003Iz-0n
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682429941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPPS70WFjcy2JwT8P5XtO5CMpg/f2RRQN7faqVv2JXE=;
 b=R3w6Rf76dseFKQFtFdfobgRt6i06ei9ykPqi98ID5oTRzLDMADGZccoJEOncWiDPVr5X5A
 SOAuvbl4u/JgufokgQETwyLoPDTtly7kWNLyTQC9dgmpMd0Uq7oVqA2acM+vL0r91OSRda
 auRryI86jMqh44LTOzST9DJSpbnDRoo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-UjoxOrgEPd-3QDCBvpwcIQ-1; Tue, 25 Apr 2023 09:38:59 -0400
X-MC-Unique: UjoxOrgEPd-3QDCBvpwcIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14BB63822DE3;
 Tue, 25 Apr 2023 13:38:59 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCC731121318;
 Tue, 25 Apr 2023 13:38:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH 2/3] target/i386/cpu: Allow to limit the 64-bit binary to
 32-bit mode only
Date: Tue, 25 Apr 2023 15:38:50 +0200
Message-Id: <20230425133851.489283-3-thuth@redhat.com>
In-Reply-To: <20230425133851.489283-1-thuth@redhat.com>
References: <20230425133851.489283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qemu-system-x86_64 is pretty much a proper superset of qemu-system-i386,
so in the long run, it does not make too much sense that we continuously
build two binaries here.
However, some people still might want to start QEMU in a mode that limits
the environment to 32-bit. Thus allow qemu-system-x86_64 to run in 32-bit
mode if the binary name ends in "-i386".

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/i386/cpu.h     |  4 ++--
 target/i386/cpu.c     | 28 +++++++++++++---------------
 target/i386/gdbstub.c |  8 +-------
 3 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d243e290d3..5cb2eb3493 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -40,8 +40,8 @@
 #define TARGET_HAS_PRECISE_SMC
 
 #ifdef TARGET_X86_64
-#define I386_ELF_MACHINE  EM_X86_64
-#define ELF_MACHINE_UNAME "x86_64"
+#define I386_ELF_MACHINE  (qemu_target_only_32bits() ? EM_386 : EM_X86_64)
+#define ELF_MACHINE_UNAME (qemu_target_only_32bits() ? "i686" : "x86_64")
 #else
 #define I386_ELF_MACHINE  EM_386
 #define ELF_MACHINE_UNAME "i686"
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2e30e348a1..f713005476 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5093,11 +5093,9 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
     } else {
         return ~0;
     }
-#ifndef TARGET_X86_64
-    if (w == FEAT_8000_0001_EDX) {
+    if (qemu_target_only_32bits() && w == FEAT_8000_0001_EDX) {
         r &= ~CPUID_EXT2_LM;
     }
-#endif
     if (migratable_only) {
         r &= x86_cpu_get_migratable_flags(w);
     }
@@ -5267,11 +5265,11 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
 
 static gchar *x86_gdb_arch_name(CPUState *cs)
 {
-#ifdef TARGET_X86_64
-    return g_strdup("i386:x86-64");
-#else
-    return g_strdup("i386");
-#endif
+    if (qemu_target_only_32bits()) {
+        return g_strdup("i386");
+    } else {
+        return g_strdup("i386:x86-64");
+    }
 }
 
 static void x86_cpu_cpudef_class_init(ObjectClass *oc, void *data)
@@ -7295,13 +7293,13 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
-#ifdef TARGET_X86_64
-    cc->gdb_core_xml_file = "i386-64bit.xml";
-    cc->gdb_num_core_regs = 66;
-#else
-    cc->gdb_core_xml_file = "i386-32bit.xml";
-    cc->gdb_num_core_regs = 50;
-#endif
+    if (qemu_target_only_32bits()) {
+        cc->gdb_core_xml_file = "i386-32bit.xml";
+        cc->gdb_num_core_regs = 50;
+    } else {
+        cc->gdb_core_xml_file = "i386-64bit.xml";
+        cc->gdb_num_core_regs = 66;
+    }
     cc->disas_set_info = x86_disas_set_info;
 
     dc->user_creatable = true;
diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index ebb000df6a..35a56b317c 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -72,15 +72,9 @@ static const int gpr_map32[8] = { 0, 1, 2, 3, 4, 5, 6, 7 };
 #define IDX_CTL_CR8_REG     (IDX_CTL_REGS + 4)
 #define IDX_CTL_EFER_REG    (IDX_CTL_REGS + 5)
 
-#ifdef TARGET_X86_64
-#define GDB_FORCE_64 1
-#else
-#define GDB_FORCE_64 0
-#endif
-
 static int gdb_read_reg_cs64(uint32_t hflags, GByteArray *buf, target_ulong val)
 {
-    if ((hflags & HF_CS64_MASK) || GDB_FORCE_64) {
+    if ((hflags & HF_CS64_MASK) || !qemu_target_only_32bits()) {
         return gdb_get_reg64(buf, val);
     }
     return gdb_get_reg32(buf, val);
-- 
2.31.1


