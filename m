Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52725312983
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:46:20 +0100 (CET)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xVD-0006Ux-8Y
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6I-0007jw-KH
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:34 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:39894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6E-0001jm-De
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:34 -0500
Received: by mail-il1-x131.google.com with SMTP id d6so11465893ilo.6
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 19:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8zwyqjjxJulzipec2YkM3SoTdlEFmhkzHgrzxKzdEs=;
 b=SkGZIlbMN8tKuqjTMYzRNgWDk5au8iErybhksXcW6HIw435lJC6WGXh61mnsqHcHnk
 t/D99BOROAHQmP8qKk6myuXP87CHJ8uLsZYXTuns/ylEB3c0g/lAvRmxy237V7zcnRAf
 3py60I1t68fFs7wsuV74s284hLUHOe5ZSw8YJ88BkZZlpPGO2H/Wbx86spEvQanXxVAy
 dMDAnx9QiwmU2tU2pN1pwOLHNsrfvhwek8sD20W3XvuJIqFQtDoeBQQzz/WnH4JJ9nY2
 LUQ45WBcbbqyu+0iBBFjcpz/VKoJDsCCvqVGyvxNlGSwZSSTozNcyX38srOhcutquj7Y
 jNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8zwyqjjxJulzipec2YkM3SoTdlEFmhkzHgrzxKzdEs=;
 b=k1h+D7tH82R0PtBZ+lId43Oc59vJH9mbfBwcEmyFBfK/0aaHy2KH0spy5HJjyfMFCR
 EvXy0agU6R06BPz34n3HYeC4p+xNnSUUOcGt1kYzoBMNlCgAiIMzadkO96rcVGLQAcye
 Pw8YGR4897NHq7DCYwSebDjk6O6c9qsh+a+WQh4oA7vXDsoskLT+2eJKuKTmbybmvf//
 EwxSl/jxja/X/uCnNKfNZqyl9cvW+dHg2NskN+M4TfCO/XNMxNtTppAQrSJmZDF/XCOi
 ZXneuRme2wLxhjweOlchm2s4nzSyxWdj3wYdmNxcWWonAA1iBrWF/AaaB13VHQem1Swo
 BxVQ==
X-Gm-Message-State: AOAM53054Pi4JR/da+jy1gH5JZJrxOOkYszwZhomnUonTPRo/w5kZpYp
 VmtTtuJrSJKIAzCRnta3UauDdaerOnPSHrQ=
X-Google-Smtp-Source: ABdhPJxrqUS15UxO3RyD3f+13HKVGArszYH2gctFNWW1R97GgfRrnkKuPYXjwoHnE6Y8wcmwJgv/QQ==
X-Received: by 2002:a05:6e02:1608:: with SMTP id
 t8mr13992323ilu.79.1612754429418; 
 Sun, 07 Feb 2021 19:20:29 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:29 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 4/5] Add migration support for KVM guest with MTE
Date: Mon,  8 Feb 2021 03:20:05 +0000
Message-Id: <25a922038d256e47f3eb99683c5e3bd9c34753ac.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make it easier to keep the page tags sync with
the page data, tags for one page are appended to
the data during ram save iteration.

This patch only add the pre-copy migration support.
Post-copy and compress as well as zero page saving
are not supported yet.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 include/hw/arm/virt.h    |  2 +
 include/migration/misc.h |  1 +
 migration/ram.c          | 86 +++++++++++++++++++++++++++++++++++++++-
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 36fcb29641..6182b3e1d1 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -165,6 +165,8 @@ struct VirtMachineState {
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
     PCIBus *bus;
+    /* migrate memory tags */
+    NotifierWithReturn precopy_notifier;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
diff --git a/include/migration/misc.h b/include/migration/misc.h
index bccc1b6b44..005133f471 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -38,6 +38,7 @@ void precopy_add_notifier(NotifierWithReturn *n);
 void precopy_remove_notifier(NotifierWithReturn *n);
 int precopy_notify(PrecopyNotifyReason reason, Error **errp);
 void precopy_enable_free_page_optimization(void);
+void precopy_enable_metadata_migration(void);
 
 void ram_mig_init(void);
 void qemu_guest_free_page_hint(void *addr, size_t len);
diff --git a/migration/ram.c b/migration/ram.c
index 7811cde643..32f764680d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -53,9 +53,11 @@
 #include "block.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-throttle.h"
+#include "sysemu/kvm.h"
 #include "savevm.h"
 #include "qemu/iov.h"
 #include "multifd.h"
+#include "kvm_arm.h"
 
 /***********************************************************/
 /* ram save/restore */
@@ -75,6 +77,9 @@
 #define RAM_SAVE_FLAG_XBZRLE   0x40
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+#define RAM_SAVE_FLAG_MTE              0x200
+
+#define MTE_GRANULE_SIZE   (16)
 
 static inline bool is_zero_range(uint8_t *p, uint64_t size)
 {
@@ -310,6 +315,8 @@ struct RAMState {
     bool ram_bulk_stage;
     /* The free page optimization is enabled */
     bool fpo_enabled;
+    /* The RAM meta data(e.t memory tag) is enabled */
+    bool metadata_enabled;
     /* How many times we have dirty too many pages */
     int dirty_rate_high_cnt;
     /* these variables are used for bitmap sync */
@@ -387,6 +394,15 @@ void precopy_enable_free_page_optimization(void)
     ram_state->fpo_enabled = true;
 }
 
+void precopy_enable_metadata_migration(void)
+{
+    if (!ram_state) {
+        return;
+    }
+
+    ram_state->metadata_enabled = true;
+}
+
 uint64_t ram_bytes_remaining(void)
 {
     return ram_state ? (ram_state->migration_dirty_pages * TARGET_PAGE_SIZE) :
@@ -1127,6 +1143,61 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     return true;
 }
 
+static int save_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
+{
+    uint8_t *tag_buf = NULL;
+    uint64_t ipa;
+    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;
+
+    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
+        /* Buffer for the page tags(one byte per tag) */
+        tag_buf = g_try_malloc0(size);
+        if (!tag_buf) {
+            error_report("%s: Error allocating MTE tag_buf", __func__);
+            return 0;
+        }
+
+        if (kvm_arm_mte_get_tags(ipa, TARGET_PAGE_SIZE, tag_buf) < 0) {
+            error_report("%s: Can't get MTE tags from guest", __func__);
+            g_free(tag_buf);
+            return 0;
+        }
+
+        qemu_put_buffer(f, tag_buf, size);
+
+        g_free(tag_buf);
+
+        return size;
+    }
+
+    return 0;
+}
+
+static void load_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
+{
+    uint8_t *tag_buf = NULL;
+    uint64_t ipa;
+    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;
+
+    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
+        /* Buffer for the page tags(one byte per tag) */
+        tag_buf = g_try_malloc0(size);
+        if (!tag_buf) {
+            error_report("%s: Error allocating MTE tag_buf", __func__);
+            return;
+        }
+
+        qemu_get_buffer(f, tag_buf, size);
+        if (kvm_arm_mte_set_tags(ipa, TARGET_PAGE_SIZE, tag_buf) < 0) {
+            error_report("%s: Can't set MTE tags to guest", __func__);
+        }
+
+        g_free(tag_buf);
+    }
+
+    return;
+}
+
 /*
  * directly send the page to the stream
  *
@@ -1141,6 +1212,10 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
 static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
                             uint8_t *buf, bool async)
 {
+    if (rs->metadata_enabled) {
+        offset |= RAM_SAVE_FLAG_MTE;
+    }
+
     ram_counters.transferred += save_page_header(rs, rs->f, block,
                                                  offset | RAM_SAVE_FLAG_PAGE);
     if (async) {
@@ -1152,6 +1227,11 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     }
     ram_counters.transferred += TARGET_PAGE_SIZE;
     ram_counters.normal++;
+
+    if (rs->metadata_enabled) {
+        ram_counters.transferred += save_normal_page_mte_tags(rs->f, buf);
+    }
+
     return 1;
 }
 
@@ -1905,6 +1985,7 @@ static void ram_state_reset(RAMState *rs)
     rs->last_version = ram_list.version;
     rs->ram_bulk_stage = true;
     rs->fpo_enabled = false;
+    rs->metadata_enabled = false;
 }
 
 #define MAX_WAIT 50 /* ms, half buffered_file limit */
@@ -3492,7 +3573,7 @@ static int ram_load_precopy(QEMUFile *f)
             trace_ram_load_loop(block->idstr, (uint64_t)addr, flags, host);
         }
 
-        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
+        switch (flags & ~(RAM_SAVE_FLAG_CONTINUE | RAM_SAVE_FLAG_MTE)) {
         case RAM_SAVE_FLAG_MEM_SIZE:
             /* Synchronize RAM block list */
             total_ram_bytes = addr;
@@ -3562,6 +3643,9 @@ static int ram_load_precopy(QEMUFile *f)
 
         case RAM_SAVE_FLAG_PAGE:
             qemu_get_buffer(f, host, TARGET_PAGE_SIZE);
+            if (flags & RAM_SAVE_FLAG_MTE) {
+                load_normal_page_mte_tags(f, host);
+            }
             break;
 
         case RAM_SAVE_FLAG_COMPRESS_PAGE:
-- 
2.17.1


