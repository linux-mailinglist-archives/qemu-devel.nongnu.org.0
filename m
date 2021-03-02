Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392FB32A392
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:19:46 +0100 (CET)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6oL-00058u-99
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6VM-0000LM-Hh; Tue, 02 Mar 2021 10:00:10 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6VK-0005Nt-AG; Tue, 02 Mar 2021 10:00:07 -0500
Received: by mail-ed1-x52f.google.com with SMTP id w21so25569139edc.7;
 Tue, 02 Mar 2021 07:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=80i+luS2gU1nZWsoBAiYbRUL/K5YnYdp7E5uXZjJBL4=;
 b=dpGwCF6rebaENcMlefxhPfnkG83niqll8GFUGNLSSk8S7EFiaz4tXcPgz1/bHzD/LG
 ySvI+vtZvFfOwKSfOyCwAOHdWro9HLaYSOVTUxfM0qXytAzCGZY/nOxz6r7wz4w6RxgS
 P3jtRjV0jIHhTtPTqTebeL0RhUPGgmkABM7OMFbp5k4mboy/vKFeqliQ5CQUAzYq8q/x
 2OFd7nr215d/UNsF3OF0FPoEliX9ng6XE4ZfumA/SLowiAyOqLIB5llWH5H489asaxSG
 ENsWhrR2IsMbVeRTxhN8DlSc8SLFzjg/o/winpzAwheC9289Q3m/3AsJQfU2nvJZOaqF
 gvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=80i+luS2gU1nZWsoBAiYbRUL/K5YnYdp7E5uXZjJBL4=;
 b=QS7ddQ+kNSYUFF83s9zjRB9trjNqQp94XH2fa1gcoFumGZTSW3ishg6ZmektrBZzVq
 dZg2GRb+UG2Sq4o4YBHJpOapjIHzRoUzzChqOThu1wrr4r4pXbxXcwon7cHN2jTqESaY
 18uELKY3ximzKbN6mR96mJPfsgP2LW9FiTwKwjTPQQZC2iSqc61lvazoJnBZwfWHfZB1
 vOo6SGRna/n6sIyqOFq+5740dXL5iTniccPLkvT1a5+dqrJQNJnuZqfMZopHlulnHbqr
 eWC1zClvTPnr3o/EkkhXBYVf/H1fuHD2aqL3WY7E3YBS4qtG+cRZWnEbnPEFNbX2SZz9
 vocQ==
X-Gm-Message-State: AOAM532lk27Kvix6+S2YJRGleKB98VG9O40C4I3oVdrmmQErIOlwgfKd
 jIPU4Bz28726cjjG0k1Ka6f6QUwZB5Y=
X-Google-Smtp-Source: ABdhPJyXQFUGRRxV54Xm/zg4k3LV8CQ/B3gXnhCbP+IjO4+X69LJTqe/h1Q4Rh1dH6mRTY7/JWneNw==
X-Received: by 2002:aa7:c150:: with SMTP id r16mr20556346edp.96.1614697203386; 
 Tue, 02 Mar 2021 07:00:03 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p25sm18624983eds.55.2021.03.02.07.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 07:00:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/27] cpu: Move CPUClass::get_memory_mapping to
 SysemuCPUOps
Date: Tue,  2 Mar 2021 15:58:05 +0100
Message-Id: <20210302145818.1161461-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 3 ---
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu.c                    | 4 ++--
 target/i386/cpu.c                | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 9a86c707cf7..8af78cdde23 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -94,7 +94,6 @@ struct AccelCPUClass;
  * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @get_paging_enabled: Callback for inquiring whether paging is enabled.
- * @get_memory_mapping: Callback for obtaining the memory mappings.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
  *       setting the PC from a source such as an ELF file entry point;
@@ -138,8 +137,6 @@ struct CPUClass {
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
-    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
-                               Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 0c8f616a565..460e7d63b0c 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_memory_mapping: Callback for obtaining the memory mappings.
+     */
+    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
+                               Error **errp);
     /**
      * @get_phys_page_debug: Callback for obtaining a physical address.
      */
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 6932781425a..339bdfadd7a 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -83,8 +83,8 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_memory_mapping) {
-        cc->get_memory_mapping(cpu, list, errp);
+    if (cc->sysemu_ops->get_memory_mapping) {
+        cc->sysemu_ops->get_memory_mapping(cpu, list, errp);
         return;
     }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c7a18cd8e4f..d33ee9f831e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7388,6 +7388,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps i386_sysemu_ops = {
+    .get_memory_mapping = x86_cpu_get_memory_mapping,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
@@ -7431,7 +7432,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
-    cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.26.2


