Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B35B32BC5D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:54:05 +0100 (CET)
Received: from localhost ([::1]:45138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZRU-0004d2-6G
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZME-0005K1-M3; Wed, 03 Mar 2021 16:48:38 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMB-0002RL-Te; Wed, 03 Mar 2021 16:48:37 -0500
Received: by mail-wr1-x434.google.com with SMTP id f12so21566005wrx.8;
 Wed, 03 Mar 2021 13:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EgbaLT145JE9K24YqnNM6CBW+74A5NiqHCMjzrliWjU=;
 b=khFf7D1kn1I8+VV7UwMj4AoxYALmg6FuAUX0DZ7Zk0Phjg623DyddsNHR60s5WzLo9
 k4juJhLrUafayhaebqLgOJlZ23QMmAZTIxksL9vlHpK+2ewfsEFVNU4DJ8+edDfQIOd/
 DigRaq5gqUjzRQ+ZDGUdk3yBn7L06hCul1H9NDWSFcH264CsAZeSAQEmTda1jOsi3aLT
 De7Rj8+80KgtFeYK/v/o6AaB3VjDS02KY03vMUz1OIII6ViwbTqBTQKUlUO0gWbMFKz+
 Fp8BZRyPzYlYvKHupe7pvAVDDICSY5P7wOzaPn80+L5h1sSfyoYQfIpt9E4hK+3c08X6
 PDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EgbaLT145JE9K24YqnNM6CBW+74A5NiqHCMjzrliWjU=;
 b=U0RM7R9SVsdhYK+zmfxPDFQQxv+fAH+b57UxV827Nh+IX4XiydY43E4i1oguq0qWHA
 QN3Mwa833DcOkieSYzUusfnXBTrSvqvZjWImXwO1YPqrGH8Ol1+ZOOPJ++zBVCKrq5UP
 tO1lDg7BhMG9Li4UNrwBsBeG/FEHA3bMnF2og3uGvyTXaNI7dszokI4ttLAQT9ANt2y6
 5ZvEJD02/SAApg73WVKFk5HGmbSeDhongqG12LyNq5bs/CWFHJ6WMCMzNjfIBeHxxzIe
 UqXf75dyX3sgOg2c0LXnrnJB6PQXbkTjs5PoyQ7/eM+VGVNKp8WtAixYrMPkRleT3xU3
 kPew==
X-Gm-Message-State: AOAM533+XeJoGFgX7aL6rpa8ZnM881gM8jgMXPbBR3JmINNMqpUmWX5J
 CIiEvisPISwilmrDLMb+wocP9Qd6N1Y=
X-Google-Smtp-Source: ABdhPJzg229G09tZapjldlWd9H3NvLGpGzpJKR7kk7D9KbG56lVNaudV26dJHAEeGCzH3AIMxkWkUw==
X-Received: by 2002:adf:b355:: with SMTP id k21mr794588wrd.156.1614808113118; 
 Wed, 03 Mar 2021 13:48:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g1sm6924468wmh.9.2021.03.03.13.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:48:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/28] cpu: Move CPUClass::get_paging_enabled to
 SysemuCPUOps
Date: Wed,  3 Mar 2021 22:46:55 +0100
Message-Id: <20210303214708.1727801-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 2 --
 include/hw/core/sysemu-cpu-ops.h | 4 ++++
 hw/core/cpu.c                    | 4 ++--
 target/i386/cpu.c                | 4 +++-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8af78cdde23..960846d2b64 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -93,7 +93,6 @@ struct AccelCPUClass;
  * @dump_state: Callback for dumping state.
  * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
- * @get_paging_enabled: Callback for inquiring whether paging is enabled.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
  *       setting the PC from a source such as an ELF file entry point;
@@ -136,7 +135,6 @@ struct CPUClass {
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
-    bool (*get_paging_enabled)(const CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 460e7d63b0c..3f9a5199dd1 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -21,6 +21,10 @@ typedef struct SysemuCPUOps {
      */
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
+    /**
+     * @get_paging_enabled: Callback for inquiring whether paging is enabled.
+     */
+    bool (*get_paging_enabled)(const CPUState *cpu);
     /**
      * @get_phys_page_debug: Callback for obtaining a physical address.
      */
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 339bdfadd7a..7a8487d468f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -71,8 +71,8 @@ bool cpu_paging_enabled(const CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_paging_enabled) {
-        return cc->get_paging_enabled(cpu);
+    if (cc->sysemu_ops->get_paging_enabled) {
+        return cc->sysemu_ops->get_paging_enabled(cpu);
     }
 
     return false;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b2d3debd1f2..994d58aa754 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7157,12 +7157,14 @@ static int64_t x86_cpu_get_arch_id(CPUState *cs)
     return cpu->apic_id;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool x86_cpu_get_paging_enabled(const CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
 
     return cpu->env.cr[0] & CR0_PG_MASK;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void x86_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -7389,6 +7391,7 @@ static Property x86_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
     .get_memory_mapping = x86_cpu_get_memory_mapping,
+    .get_paging_enabled = x86_cpu_get_paging_enabled,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
@@ -7429,7 +7432,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
     cc->get_arch_id = x86_cpu_get_arch_id;
-    cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &i386_sysemu_ops;
-- 
2.26.2


