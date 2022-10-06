Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977245F71F4
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 01:41:39 +0200 (CEST)
Received: from localhost ([::1]:44902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogaUk-0005mn-Fi
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 19:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ogaR9-00039g-NC
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 19:37:55 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:36405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ogaR7-0007Mc-Nn
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 19:37:55 -0400
Received: by mail-qk1-x743.google.com with SMTP id i3so2043235qkl.3
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 16:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7d+b65bj7VXsp7FSEBAI6y6nKY4+q7iifkwzMK1dng=;
 b=pIW+FeckGj6f7/xH14BH8MUP+XgcFiB+JjdlwkF0crdNpJvDCwWsA1sOBocIQ4IDJW
 z2T0Ea+ZS5t8XsTMCul7os6e7m0bL0+hO+GQ7aPbXo6UrtT9gD2IabV6uColqsFoBWXD
 0sQkdkOieA7StnbkQuuYVWwhpWSKz/OTZDkEg2Q92ucXBgQ/i1PPPt+uVKD0+J1FaQGy
 y9Jk2wVzcBGVJwnsA9FxeLxS3qCZC9kO03QiBYdB6PgdEZdq8Ub3ULs966H3VPhO+Hly
 LppjIAXlzDDWS3saCO9G7Dqk6y1E8o6wDK74jcmE29Hp2rdQkrc34tA69wHfq/+r0Kkd
 /76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U7d+b65bj7VXsp7FSEBAI6y6nKY4+q7iifkwzMK1dng=;
 b=BcVC0uXF+B3Ir1HMzM7WckUylsVftUC3p2gXuOhaBUT2u63kA/cFZRUvAadNWGr0ti
 cQY3SblM0MhyRRp8fb/kF9x5YX4BUDXQJgChMTllDJD9yEwLEsWA7q5GqWJivUe78bvX
 qhVMkmL4e66hgLJ13rsFtX0LV2FDwd+TwbjgZXKoK6YUkdB7PP/W4DNHw6ANV97X8qZV
 82Whbt12RGo0+0tiqiqjNBsAHRaePTG1qnTGADYGlKpDFliRetkmFWvHnAenrW0JefR3
 6z4zDYQLIz66PSMD1/vSY4XadIz1YvESi86IwdtEi/AR7/z6eIw0sLq1Y1qQcfSfwkNE
 +rLQ==
X-Gm-Message-State: ACrzQf3lX0UyjawzhhhuYctLj6PUU+jvO2b8sG57Imhd9gzbbnNvVxE+
 tthax3wpwZo/Gjgdi8xF5vHdXtpSvw==
X-Google-Smtp-Source: AMsMyM5eeBVfQGIvdGdV1yTxqkH0osaFGkI7O/DL/J+DATp6n0xwbha+/eucGEOASXVzLqleQ4JRww==
X-Received: by 2002:a05:620a:2996:b0:6e5:c15a:6da5 with SMTP id
 r22-20020a05620a299600b006e5c15a6da5mr2094891qkp.642.1665099472434; 
 Thu, 06 Oct 2022 16:37:52 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05620a44d500b006b8f4ade2c9sm528032qkp.19.2022.10.06.16.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 16:37:52 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, Gregory Price <gregory.price@memverge.com>
Subject: [PATCH 2/2] hw/cxl: Allow CXL type-3 devices to be persistent or
 volatile
Date: Thu,  6 Oct 2022 19:37:02 -0400
Message-Id: <20221006233702.18532-2-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006233702.18532-1-gregory.price@memverge.com>
References: <20221006233702.18532-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qk1-x743.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit enables setting one memory region for a type-3 device, but
that region may now be either a persistent region or volatile region.

Future work may enable setting both regions simultaneously, as this is
a possible configuration on a real type-3 device.  The scaffolding was
put in for this, but is left for further work.

The existing [memdev] property has been deprecated and will default the
memory region to a persistent memory region (although a user may assign
the region to a ram or file backed region).

There is presently no interface with which to expose a MemoryRegion's
real backing type (HostMemoryBackendRam/File), otherwise we could have
used File to imply pmem (or inspected HostMemoryBackendFile->is_pmem) to
deterine whether the backing device supported pmem mode.  This should be
considered for future work, as it would make creating an array of
HostMemory devices to represent DIMMs on a Single-Logical-Device
MemoryExpander fairly straightforward.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
---
 hw/cxl/cxl-mailbox-utils.c  | 22 ++++++++++--------
 hw/mem/cxl_type3.c          | 46 +++++++++++++++++++++++++++++++++----
 include/hw/cxl/cxl_device.h |  7 +++++-
 3 files changed, 59 insertions(+), 16 deletions(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index bc1bb18844..dfec11a1b5 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -138,7 +138,7 @@ static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
     } QEMU_PACKED *fw_info;
     QEMU_BUILD_BUG_ON(sizeof(*fw_info) != 0x50);
 
-    if (cxl_dstate->pmem_size < (256 << 20)) {
+    if (cxl_dstate->mem_size < (256 << 20)) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
@@ -281,9 +281,10 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
 
     CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
     CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
-    uint64_t size = cxl_dstate->pmem_size;
 
-    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+    if ((!QEMU_IS_ALIGNED(cxl_dstate->mem_size, 256 << 20)) ||
+        (!QEMU_IS_ALIGNED(cxl_dstate->vmem_size, 256 << 20)) ||
+        (!QEMU_IS_ALIGNED(cxl_dstate->pmem_size, 256 << 20))) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
@@ -293,8 +294,9 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     /* PMEM only */
     snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
 
-    id->total_capacity = size / (256 << 20);
-    id->persistent_capacity = size / (256 << 20);
+    id->total_capacity = cxl_dstate->mem_size / (256 << 20);
+    id->persistent_capacity = cxl_dstate->pmem_size / (256 << 20);
+    id->volatile_capacity = cxl_dstate->vmem_size / (256 << 20);
     id->lsa_size = cvc->get_lsa_size(ct3d);
 
     *len = sizeof(*id);
@@ -312,16 +314,16 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
         uint64_t next_pmem;
     } QEMU_PACKED *part_info = (void *)cmd->payload;
     QEMU_BUILD_BUG_ON(sizeof(*part_info) != 0x20);
-    uint64_t size = cxl_dstate->pmem_size;
 
-    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+    if ((!QEMU_IS_ALIGNED(cxl_dstate->mem_size, 256 << 20)) ||
+        (!QEMU_IS_ALIGNED(cxl_dstate->vmem_size, 256 << 20)) ||
+        (!QEMU_IS_ALIGNED(cxl_dstate->pmem_size, 256 << 20))) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
-    /* PMEM only */
-    part_info->active_vmem = 0;
+    part_info->active_vmem = cxl_dstate->vmem_size / (256 << 20);
     part_info->next_vmem = 0;
-    part_info->active_pmem = size / (256 << 20);
+    part_info->active_pmem = cxl_dstate->pmem_size / (256 << 20);
     part_info->next_pmem = 0;
 
     *len = sizeof(*part_info);
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 1837c1c83a..998461dac1 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -100,18 +100,47 @@ static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
     DeviceState *ds = DEVICE(ct3d);
     MemoryRegion *mr;
     char *name;
+    bool is_pmem = false;
 
-    if (!ct3d->hostmem) {
-        error_setg(errp, "memdev property must be set");
+    /*
+     * FIXME: For now we only allow a single host memory region.
+     * Handle the deprecated memdev property usage cases
+     */
+    if (!ct3d->hostmem && !ct3d->host_vmem && !ct3d->host_pmem) {
+        error_setg(errp, "at least one memdev property must be set");
         return false;
+    } else if (ct3d->hostmem && (ct3d->host_vmem || ct3d->host_pmem)) {
+        error_setg(errp, "deprecated [memdev] cannot be used with new "
+                         "persistent and volatile memdev properties");
+        return false;
+    } else if (ct3d->hostmem) {
+        warn_report("memdev is deprecated and defaults to pmem. "
+                    "Use (persistent|volatile)-memdev instead.");
+        is_pmem = true;
+    } else {
+        if (ct3d->host_vmem && ct3d->host_pmem) {
+            error_setg(errp, "Multiple memory devices not supported yet");
+            return false;
+        }
+        is_pmem = !!ct3d->host_pmem;
+        ct3d->hostmem = ct3d->host_pmem ? ct3d->host_pmem : ct3d->host_vmem;
     }
 
+    /*
+     * for now, since there is only one memdev, we can set the type
+     * based on whether this was a ram region or file region
+     */
     mr = host_memory_backend_get_memory(ct3d->hostmem);
     if (!mr) {
         error_setg(errp, "memdev property must be set");
         return false;
     }
-    memory_region_set_nonvolatile(mr, true);
+
+    /*
+     * FIXME: This code should eventually enumerate each memory region and
+     * report vmem and pmem capacity separate, but for now just set to one
+     */
+    memory_region_set_nonvolatile(mr, is_pmem);
     memory_region_set_enabled(mr, true);
     host_memory_backend_set_mapped(ct3d->hostmem, true);
 
@@ -123,7 +152,10 @@ static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
     address_space_init(&ct3d->hostmem_as, mr, name);
     g_free(name);
 
-    ct3d->cxl_dstate.pmem_size = ct3d->hostmem->size;
+    /* FIXME: When multiple regions are supported, this needs to aggregate */
+    ct3d->cxl_dstate.mem_size = ct3d->hostmem->size;
+    ct3d->cxl_dstate.vmem_size = is_pmem ? 0 : ct3d->hostmem->size;
+    ct3d->cxl_dstate.pmem_size = is_pmem ? ct3d->hostmem->size : 0;
 
     if (!ct3d->lsa) {
         error_setg(errp, "lsa property must be set");
@@ -272,6 +304,10 @@ static void ct3d_reset(DeviceState *dev)
 static Property ct3_props[] = {
     DEFINE_PROP_LINK("memdev", CXLType3Dev, hostmem, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_LINK("persistent-memdev", CXLType3Dev, host_pmem,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+    DEFINE_PROP_LINK("volatile-memdev", CXLType3Dev, host_vmem,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
     DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
     DEFINE_PROP_END_OF_LIST(),
@@ -340,7 +376,7 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     pc->revision = 1;
 
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
-    dc->desc = "CXL PMEM Device (Type 3)";
+    dc->desc = "CXL Memory Device (Type 3)";
     dc->reset = ct3d_reset;
     device_class_set_props(dc, ct3_props);
 
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 1e141b6621..fd96a5ea4e 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -117,8 +117,10 @@ typedef struct cxl_device_state {
         uint64_t host_set;
     } timestamp;
 
-    /* memory region for persistent memory, HDM */
+    /* memory region size, HDM */
+    uint64_t mem_size;
     uint64_t pmem_size;
+    uint64_t vmem_size;
 } CXLDeviceState;
 
 /* Initialize the register block for a device */
@@ -235,7 +237,10 @@ struct CXLType3Dev {
     PCIDevice parent_obj;
 
     /* Properties */
+    /* TODO: remove hostmem when multi-dev is implemented */
     HostMemoryBackend *hostmem;
+    HostMemoryBackend *host_vmem;
+    HostMemoryBackend *host_pmem;
     HostMemoryBackend *lsa;
 
     /* State */
-- 
2.37.3


