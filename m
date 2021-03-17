Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB9C33ED17
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:34:27 +0100 (CET)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSZO-000644-Nw
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSU5-0001yP-RB
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:28:57 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSU2-00017y-PF
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:28:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n17so482416plc.7
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cVOab/9KS4jIDkWGFjbL8+3uRQcLx+0OHUcux34L6Y4=;
 b=CFxCfgrLzU9WJBetw50HtlW2LNEvylnyiNNVLDLZEu3si8KpqdRRobczSCF9jRKDDe
 O5fyw0vn4M0ulykeVWZKlEOg8hLJvIgNFxTHXNVWZPyWpGSXu6gmVY6Ma8Cj103ym5su
 QFe/d+qFC6ngkKCwHIb58ML6V4KCRt+ucvTttl00P0w02iJGylu6T0ttyDaTsrAP1m7V
 8XrxlYjOPXKCQ61+Tl87p8FIKAam20t634kv5CcLBRuyqn+v36VaND2TD1FJC4FSB8Mu
 9ALJVjhIftgK/rvenmpZd7UzjgYfm+88xrrX+dmCi4C/qJPcmmueJ6HxrCdECB150meL
 2i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVOab/9KS4jIDkWGFjbL8+3uRQcLx+0OHUcux34L6Y4=;
 b=nSdg0iTH9V5g+BpVoi0dTdibdQ1Ekz3rXfeJKjtn2qxFeg+mZxWuI7vnMPwViC9oTX
 HmhZ5EO51BQ35EnayqC67xkQ6hGsAzDXtdaaplSOwrNcscPwzIdRNmTeL60VpFiNkxaD
 bMUT+0Uj765hE5jAU5MumNPwIaJzXb83u5UfePGLQQqn93WnWXWC+fGfH239SZoq1Aol
 dlB+E9Sr7JHZK5BTFZ7SZnLZ//5r4q5f5i7T+TFrbRxIbcqMJfhR1m5zH3/QqkbMa7VR
 hEWBzUmaXsA+W2vnZsAeip/Y920MFQtWeTxw9OaI3nv6fBzsUmi1ACsmr7Hv1IdHxSZp
 VIrg==
X-Gm-Message-State: AOAM530kJV7O2NleuKga+OwZEy6aGIa1DgzWeOfM8dzXOBdmotw0pbXo
 tHtTJbY9w65uIfp6rtI+Y8xH
X-Google-Smtp-Source: ABdhPJxUaakzHMmELsz122IKr8rOERc1thTNKaxQAEksR3Dp5R1R5KT5lElDS9m8FHFiMrOt1ClFhQ==
X-Received: by 2002:a17:902:4a:b029:e4:74cb:7351 with SMTP id
 68-20020a170902004ab02900e474cb7351mr3621113pla.62.1615973333353; 
 Wed, 17 Mar 2021 02:28:53 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:53 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 4/5] Add migration support for KVM guest with MTE
Date: Wed, 17 Mar 2021 09:28:23 +0000
Message-Id: <881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615972140.git.haibo.xu@linaro.org>
References: <cover.1615972140.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=haibo.xu@linaro.org; helo=mail-pl1-x62f.google.com
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
index 921416f918..8b28cde8bf 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -166,6 +166,8 @@ struct VirtMachineState {
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
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
index 72143da0ac..e67b798c3b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -53,10 +53,12 @@
 #include "block.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-throttle.h"
+#include "sysemu/kvm.h"
 #include "savevm.h"
 #include "qemu/iov.h"
 #include "multifd.h"
 #include "sysemu/runstate.h"
+#include "kvm_arm.h"
 
 #if defined(__linux__)
 #include "qemu/userfaultfd.h"
@@ -80,6 +82,9 @@
 #define RAM_SAVE_FLAG_XBZRLE   0x40
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+#define RAM_SAVE_FLAG_MTE              0x200
+
+#define MTE_GRANULE_SIZE   (16)
 
 static inline bool is_zero_range(uint8_t *p, uint64_t size)
 {
@@ -317,6 +322,8 @@ struct RAMState {
     bool ram_bulk_stage;
     /* The free page optimization is enabled */
     bool fpo_enabled;
+    /* The RAM meta data(e.t memory tag) is enabled */
+    bool metadata_enabled;
     /* How many times we have dirty too many pages */
     int dirty_rate_high_cnt;
     /* these variables are used for bitmap sync */
@@ -394,6 +401,15 @@ void precopy_enable_free_page_optimization(void)
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
@@ -1134,6 +1150,61 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
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
@@ -1148,6 +1219,10 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
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
@@ -1159,6 +1234,11 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
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
 
@@ -2189,6 +2269,7 @@ static void ram_state_reset(RAMState *rs)
     rs->last_version = ram_list.version;
     rs->ram_bulk_stage = true;
     rs->fpo_enabled = false;
+    rs->metadata_enabled = false;
 }
 
 #define MAX_WAIT 50 /* ms, half buffered_file limit */
@@ -3779,7 +3860,7 @@ static int ram_load_precopy(QEMUFile *f)
             trace_ram_load_loop(block->idstr, (uint64_t)addr, flags, host);
         }
 
-        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
+        switch (flags & ~(RAM_SAVE_FLAG_CONTINUE | RAM_SAVE_FLAG_MTE)) {
         case RAM_SAVE_FLAG_MEM_SIZE:
             /* Synchronize RAM block list */
             total_ram_bytes = addr;
@@ -3849,6 +3930,9 @@ static int ram_load_precopy(QEMUFile *f)
 
         case RAM_SAVE_FLAG_PAGE:
             qemu_get_buffer(f, host, TARGET_PAGE_SIZE);
+            if (flags & RAM_SAVE_FLAG_MTE) {
+                load_normal_page_mte_tags(f, host);
+            }
             break;
 
         case RAM_SAVE_FLAG_COMPRESS_PAGE:
-- 
2.17.1


