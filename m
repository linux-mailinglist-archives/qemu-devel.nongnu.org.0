Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3E6EE345
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:40:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prItC-00039x-8R; Tue, 25 Apr 2023 09:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prIsq-00033f-R2
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prIsp-0003Ir-0n
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682429941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+ZM3KQoncTdei9rootHBy/08sRrht5xW3bbZSEsOQM=;
 b=aRwhOYKiwT0L/vpNoACDW09yNAoiGYMqR9xxrKe8TnMZZAuxACI4EaHoFeJR8BQJ1aevCW
 w2kC0+vABs9tU6uxu5AF0mhQW1JuCQa9Ow0RK3Rv6rpYGZetmE3XLhEkBu67cF8mFbIs8b
 iI7UAzr5bhDOxcmkIQsXjK9JBSgRn/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-TwtY83DzO0qLmKc1QSoGRQ-1; Tue, 25 Apr 2023 09:38:59 -0400
X-MC-Unique: TwtY83DzO0qLmKc1QSoGRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A216F8EE588;
 Tue, 25 Apr 2023 13:38:57 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7677D1121314;
 Tue, 25 Apr 2023 13:38:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH 1/3] cpu: Add a way to detect 32-bit mode from argv0
Date: Tue, 25 Apr 2023 15:38:49 +0200
Message-Id: <20230425133851.489283-2-thuth@redhat.com>
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

In the future, we might want to avoid compiling certain targets separately
for 32-bit mode (i.e. -i386, -arm and -ppc) where the 64-bit variant is a
superset of the 32-bit variant. But it would be good to provide a way to
mimic the 32-bit behavior via the program name in case the users need this
compatibility for some scenarios. Thus add a function that checks
for the old 32-bit program names and sets a flag accordingly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/core/cpu.h | 10 ++++++++++
 cpu.c                 | 13 +++++++++++++
 softmmu/vl.c          |  1 +
 3 files changed, 24 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 397fd3ac68..8fc15b7797 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -470,6 +470,15 @@ extern __thread CPUState *current_cpu;
 extern bool mttcg_enabled;
 #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
 
+/**
+ * qemu_target_only_32bits:
+ * Check whether the target is 32 bits only (like i386 in contrast to x86_64).
+ *
+ * Returns: %true if we are running with a 32-bit only target
+ */
+extern bool target_only_32bits;
+#define qemu_target_only_32bits() (target_only_32bits)
+
 /**
  * cpu_paging_enabled:
  * @cpu: The CPU whose state is to be inspected.
@@ -1009,6 +1018,7 @@ void cpu_exec_unrealizefn(CPUState *cpu);
  */
 bool target_words_bigendian(void);
 
+void cpu_init_target_only_32bits(const char *argv0);
 void page_size_init(void);
 
 #ifdef NEED_CPU_H
diff --git a/cpu.c b/cpu.c
index 9105c85404..0b498f3a53 100644
--- a/cpu.c
+++ b/cpu.c
@@ -47,6 +47,8 @@
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
 
+bool target_only_32bits = (TARGET_LONG_BITS == 32);
+
 #ifndef CONFIG_USER_ONLY
 static int cpu_common_post_load(void *opaque, int version_id)
 {
@@ -427,6 +429,17 @@ bool target_words_bigendian(void)
 #endif
 }
 
+/*
+ * This is used for 64-bit targets that can also run in restricted 32-bit
+ * mode, e.g. if running as qemu-system-i386 instead of qemu-system-x86_64
+ */
+void cpu_init_target_only_32bits(const char *argv0)
+{
+    target_only_32bits |= g_str_has_suffix(argv0, "-i386") ||
+                          g_str_has_suffix(argv0, "-arm") ||
+                          g_str_has_suffix(argv0, "-ppc");
+}
+
 void page_size_init(void)
 {
     /* NOTE: we can always suppose that qemu_host_page_size >=
diff --git a/softmmu/vl.c b/softmmu/vl.c
index fb6c221e8e..51b35a6f0b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2677,6 +2677,7 @@ void qemu_init(int argc, char **argv)
 
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
+    cpu_init_target_only_32bits(argv[0]);
 
     qemu_init_arch_modules();
 
-- 
2.31.1


