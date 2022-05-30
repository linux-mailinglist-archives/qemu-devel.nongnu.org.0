Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1C45373C3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 05:43:50 +0200 (CEST)
Received: from localhost ([::1]:53546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvWJp-0007zP-5b
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 23:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nvWH9-00057s-Dw
 for qemu-devel@nongnu.org; Sun, 29 May 2022 23:41:04 -0400
Received: from mga14.intel.com ([192.55.52.115]:36558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nvWH5-0006wX-Vu
 for qemu-devel@nongnu.org; Sun, 29 May 2022 23:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653882059; x=1685418059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gKVEge3bEJXMZpv1Om5gEVWB6AJuAwOAd7P66bJei2E=;
 b=jfPc4/BuPF3McxxKUkaAuAfr+IkhiQsZkcm/RB22LueJL/A06cbSqOGi
 HDjUwr96xJJCth5vXAyfNRb1vsZv7M11K61p40YsGDHj065NEtHJvn99V
 IPQ+ipSrN8buMy4q2shLMdRUr14to7c/L9Wyb8wUyKt/TQxfG8/C+bZ9N
 S3BCkXNdIMVI7OK3MPNChIxdigZKSY+EASU8pWxRV0qw54d8yz1Ob8+SQ
 igRbz84Z8apP6GSwVbxLcKD4GGCCnNuRZUlTAorgaX1NTqxcnJdaZi7uC
 YSztdk7Aa67lsOhihBiRDQe94U3dGtXwx0p4L0Oa0/bMAL3qBWEIWEX6a Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274974848"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; d="scan'208";a="274974848"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 20:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; d="scan'208";a="528993814"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga003.jf.intel.com with ESMTP; 29 May 2022 20:40:56 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, dan.j.williams@intel.com, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org,
	robert.hu@intel.com
Subject: [QEMU PATCH v2 4/6] nvdimm: Implement ACPI NVDIMM Label Methods
Date: Mon, 30 May 2022 11:40:45 +0800
Message-Id: <20220530034047.730356-5-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220530034047.730356-1-robert.hu@linux.intel.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=robert.hu@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Recent ACPI spec [1] has defined NVDIMM Label Methods _LS{I,R,W}, which
depricates corresponding _DSM Functions defined by PMEM _DSM Interface spec
[2].

In this implementation, we do 2 things
1. Generalize the QEMU<->ACPI BIOS NVDIMM interface, wrap it with ACPI
method dispatch, _DSM is one of the branches. This also paves the way for
adding other ACPI methods for NVDIMM.
2. Add _LS{I,R,W} method in each NVDIMM device in SSDT.
ASL form of SSDT changes can be found in next test/qtest/bios-table-test
commit message.

[1] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf
[2] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
---
 hw/acpi/nvdimm.c        | 424 +++++++++++++++++++++++++++++++---------
 include/hw/mem/nvdimm.h |   6 +
 2 files changed, 338 insertions(+), 92 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 59b42afcf1..50ee85866b 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -416,17 +416,22 @@ static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
 
 #define NVDIMM_DSM_MEMORY_SIZE      4096
 
-struct NvdimmDsmIn {
+struct NvdimmMthdIn {
     uint32_t handle;
+    uint32_t method;
+    uint8_t  args[4088];
+} QEMU_PACKED;
+typedef struct NvdimmMthdIn NvdimmMthdIn;
+struct NvdimmDsmIn {
     uint32_t revision;
     uint32_t function;
     /* the remaining size in the page is used by arg3. */
     union {
-        uint8_t arg3[4084];
+        uint8_t arg3[4080];
     };
 } QEMU_PACKED;
 typedef struct NvdimmDsmIn NvdimmDsmIn;
-QEMU_BUILD_BUG_ON(sizeof(NvdimmDsmIn) != NVDIMM_DSM_MEMORY_SIZE);
+QEMU_BUILD_BUG_ON(sizeof(NvdimmMthdIn) != NVDIMM_DSM_MEMORY_SIZE);
 
 struct NvdimmDsmOut {
     /* the size of buffer filled by QEMU. */
@@ -470,7 +475,8 @@ struct NvdimmFuncGetLabelDataIn {
 } QEMU_PACKED;
 typedef struct NvdimmFuncGetLabelDataIn NvdimmFuncGetLabelDataIn;
 QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncGetLabelDataIn) +
-                  offsetof(NvdimmDsmIn, arg3) > NVDIMM_DSM_MEMORY_SIZE);
+                  offsetof(NvdimmDsmIn, arg3) + offsetof(NvdimmMthdIn, args) >
+                  NVDIMM_DSM_MEMORY_SIZE);
 
 struct NvdimmFuncGetLabelDataOut {
     /* the size of buffer filled by QEMU. */
@@ -488,14 +494,16 @@ struct NvdimmFuncSetLabelDataIn {
 } QEMU_PACKED;
 typedef struct NvdimmFuncSetLabelDataIn NvdimmFuncSetLabelDataIn;
 QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncSetLabelDataIn) +
-                  offsetof(NvdimmDsmIn, arg3) > NVDIMM_DSM_MEMORY_SIZE);
+                  offsetof(NvdimmDsmIn, arg3) + offsetof(NvdimmMthdIn, args) >
+                  NVDIMM_DSM_MEMORY_SIZE);
 
 struct NvdimmFuncReadFITIn {
     uint32_t offset; /* the offset into FIT buffer. */
 } QEMU_PACKED;
 typedef struct NvdimmFuncReadFITIn NvdimmFuncReadFITIn;
 QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncReadFITIn) +
-                  offsetof(NvdimmDsmIn, arg3) > NVDIMM_DSM_MEMORY_SIZE);
+                  offsetof(NvdimmDsmIn, arg3) + offsetof(NvdimmMthdIn, args) >
+                  NVDIMM_DSM_MEMORY_SIZE);
 
 struct NvdimmFuncReadFITOut {
     /* the size of buffer filled by QEMU. */
@@ -636,7 +644,8 @@ static uint32_t nvdimm_get_max_xfer_label_size(void)
      * the max data ACPI can write one time which is transferred by
      * 'Set Namespace Label Data' function.
      */
-    max_set_size = dsm_memory_size - offsetof(NvdimmDsmIn, arg3) -
+    max_set_size = dsm_memory_size - offsetof(NvdimmMthdIn, args) -
+                   offsetof(NvdimmDsmIn, arg3) -
                    sizeof(NvdimmFuncSetLabelDataIn);
 
     return MIN(max_get_size, max_set_size);
@@ -697,16 +706,15 @@ static uint32_t nvdimm_rw_label_data_check(NVDIMMDevice *nvdimm,
 /*
  * DSM Spec Rev1 4.5 Get Namespace Label Data (Function Index 5).
  */
-static void nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn *in,
-                                      hwaddr dsm_mem_addr)
+static void nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm,
+                                    NvdimmFuncGetLabelDataIn *get_label_data,
+                                    hwaddr dsm_mem_addr)
 {
     NVDIMMClass *nvc = NVDIMM_GET_CLASS(nvdimm);
-    NvdimmFuncGetLabelDataIn *get_label_data;
     NvdimmFuncGetLabelDataOut *get_label_data_out;
     uint32_t status;
     int size;
 
-    get_label_data = (NvdimmFuncGetLabelDataIn *)in->arg3;
     get_label_data->offset = le32_to_cpu(get_label_data->offset);
     get_label_data->length = le32_to_cpu(get_label_data->length);
 
@@ -737,15 +745,13 @@ static void nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn *in,
 /*
  * DSM Spec Rev1 4.6 Set Namespace Label Data (Function Index 6).
  */
-static void nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn *in,
+static void nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm,
+                                      NvdimmFuncSetLabelDataIn *set_label_data,
                                       hwaddr dsm_mem_addr)
 {
     NVDIMMClass *nvc = NVDIMM_GET_CLASS(nvdimm);
-    NvdimmFuncSetLabelDataIn *set_label_data;
     uint32_t status;
 
-    set_label_data = (NvdimmFuncSetLabelDataIn *)in->arg3;
-
     set_label_data->offset = le32_to_cpu(set_label_data->offset);
     set_label_data->length = le32_to_cpu(set_label_data->length);
 
@@ -760,19 +766,21 @@ static void nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn *in,
     }
 
     assert(offsetof(NvdimmDsmIn, arg3) + sizeof(*set_label_data) +
-                    set_label_data->length <= NVDIMM_DSM_MEMORY_SIZE);
+           set_label_data->length <= NVDIMM_DSM_MEMORY_SIZE -
+           offsetof(NvdimmMthdIn, args));
 
     nvc->write_label_data(nvdimm, set_label_data->in_buf,
                           set_label_data->length, set_label_data->offset);
     nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_SUCCESS, dsm_mem_addr);
 }
 
-static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr dsm_mem_addr)
+static void nvdimm_dsm_device(uint32_t nv_handle, NvdimmDsmIn *dsm_in,
+                                    hwaddr dsm_mem_addr)
 {
-    NVDIMMDevice *nvdimm = nvdimm_get_device_by_handle(in->handle);
+    NVDIMMDevice *nvdimm = nvdimm_get_device_by_handle(nv_handle);
 
     /* See the comments in nvdimm_dsm_root(). */
-    if (!in->function) {
+    if (!dsm_in->function) {
         uint32_t supported_func = 0;
 
         if (nvdimm && nvdimm->label_size) {
@@ -794,7 +802,7 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr dsm_mem_addr)
     }
 
     /* Encode DSM function according to DSM Spec Rev1. */
-    switch (in->function) {
+    switch (dsm_in->function) {
     case 4 /* Get Namespace Label Size */:
         if (nvdimm->label_size) {
             nvdimm_dsm_label_size(nvdimm, dsm_mem_addr);
@@ -803,13 +811,17 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr dsm_mem_addr)
         break;
     case 5 /* Get Namespace Label Data */:
         if (nvdimm->label_size) {
-            nvdimm_dsm_get_label_data(nvdimm, in, dsm_mem_addr);
+            nvdimm_dsm_get_label_data(nvdimm,
+                                      (NvdimmFuncGetLabelDataIn *)dsm_in->arg3,
+                                      dsm_mem_addr);
             return;
         }
         break;
     case 0x6 /* Set Namespace Label Data */:
         if (nvdimm->label_size) {
-            nvdimm_dsm_set_label_data(nvdimm, in, dsm_mem_addr);
+            nvdimm_dsm_set_label_data(nvdimm,
+                        (NvdimmFuncSetLabelDataIn *)dsm_in->arg3,
+                        dsm_mem_addr);
             return;
         }
         break;
@@ -819,67 +831,128 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr dsm_mem_addr)
 }
 
 static uint64_t
-nvdimm_dsm_read(void *opaque, hwaddr addr, unsigned size)
+nvdimm_method_read(void *opaque, hwaddr addr, unsigned size)
 {
-    nvdimm_debug("BUG: we never read _DSM IO Port.\n");
+    nvdimm_debug("BUG: we never read NVDIMM Method IO Port.\n");
     return 0;
 }
 
 static void
-nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+nvdimm_dsm_handle(void *opaque, NvdimmMthdIn *method_in, hwaddr dsm_mem_addr)
 {
     NVDIMMState *state = opaque;
-    NvdimmDsmIn *in;
-    hwaddr dsm_mem_addr = val;
+    NvdimmDsmIn *dsm_in = (NvdimmDsmIn *)method_in->args;
 
     nvdimm_debug("dsm memory address 0x%" HWADDR_PRIx ".\n", dsm_mem_addr);
 
-    /*
-     * The DSM memory is mapped to guest address space so an evil guest
-     * can change its content while we are doing DSM emulation. Avoid
-     * this by copying DSM memory to QEMU local memory.
-     */
-    in = g_new(NvdimmDsmIn, 1);
-    cpu_physical_memory_read(dsm_mem_addr, in, sizeof(*in));
-
-    in->revision = le32_to_cpu(in->revision);
-    in->function = le32_to_cpu(in->function);
-    in->handle = le32_to_cpu(in->handle);
-
-    nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n", in->revision,
-                 in->handle, in->function);
+    dsm_in->revision = le32_to_cpu(dsm_in->revision);
+    dsm_in->function = le32_to_cpu(dsm_in->function);
 
+    nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n",
+                 dsm_in->revision, method_in->handle, dsm_in->function);
     /*
      * Current NVDIMM _DSM Spec supports Rev1 and Rev2
      * Intel® OptanePersistent Memory Module DSM Interface, Revision 2.0
      */
-    if (in->revision != 0x1 && in->revision != 0x2) {
+    if (dsm_in->revision != 0x1 && dsm_in->revision != 0x2) {
         nvdimm_debug("Revision 0x%x is not supported, expect 0x1 or 0x2.\n",
-                     in->revision);
+                     dsm_in->revision);
         nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT, dsm_mem_addr);
-        goto exit;
+        return;
     }
 
-    if (in->handle == NVDIMM_QEMU_RSVD_HANDLE_ROOT) {
-        nvdimm_dsm_handle_reserved_root_method(state, in, dsm_mem_addr);
-        goto exit;
+    if (method_in->handle == NVDIMM_QEMU_RSVD_HANDLE_ROOT) {
+        nvdimm_dsm_handle_reserved_root_method(state, dsm_in, dsm_mem_addr);
+        return;
     }
 
      /* Handle 0 is reserved for NVDIMM Root Device. */
-    if (!in->handle) {
-        nvdimm_dsm_root(in, dsm_mem_addr);
-        goto exit;
+    if (!method_in->handle) {
+        nvdimm_dsm_root(dsm_in, dsm_mem_addr);
+        return;
     }
 
-    nvdimm_dsm_device(in, dsm_mem_addr);
+    nvdimm_dsm_device(method_in->handle, dsm_in, dsm_mem_addr);
+}
 
-exit:
-    g_free(in);
+static void nvdimm_lsi_handle(uint32_t nv_handle, hwaddr dsm_mem_addr)
+{
+    NVDIMMDevice *nvdimm = nvdimm_get_device_by_handle(nv_handle);
+
+    if (nvdimm->label_size) {
+        nvdimm_dsm_label_size(nvdimm, dsm_mem_addr);
+    }
+
+    return;
+}
+
+static void nvdimm_lsr_handle(uint32_t nv_handle,
+                                    void *data,
+                                    hwaddr dsm_mem_addr)
+{
+    NVDIMMDevice *nvdimm = nvdimm_get_device_by_handle(nv_handle);
+    NvdimmFuncGetLabelDataIn *get_label_data = data;
+
+    if (nvdimm->label_size) {
+        nvdimm_dsm_get_label_data(nvdimm, get_label_data, dsm_mem_addr);
+    }
+    return;
+}
+
+static void nvdimm_lsw_handle(uint32_t nv_handle,
+                                    void *data,
+                                    hwaddr dsm_mem_addr)
+{
+    NVDIMMDevice *nvdimm = nvdimm_get_device_by_handle(nv_handle);
+    NvdimmFuncSetLabelDataIn *set_label_data = data;
+
+    if (nvdimm->label_size) {
+        nvdimm_dsm_set_label_data(nvdimm, set_label_data, dsm_mem_addr);
+    }
+    return;
+}
+
+static void
+nvdimm_method_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    NvdimmMthdIn *method_in;
+    hwaddr dsm_mem_addr = val;
+
+    /*
+     * The DSM memory is mapped to guest address space so an evil guest
+     * can change its content while we are doing DSM emulation. Avoid
+     * this by copying DSM memory to QEMU local memory.
+     */
+    method_in = g_new(NvdimmMthdIn, 1);
+    cpu_physical_memory_read(dsm_mem_addr, method_in, sizeof(*method_in));
+
+    method_in->handle = le32_to_cpu(method_in->handle);
+    method_in->method = le32_to_cpu(method_in->method);
+
+    switch (method_in->method) {
+    case NVDIMM_METHOD_DSM:
+        nvdimm_dsm_handle(opaque, method_in, dsm_mem_addr);
+        break;
+    case NVDIMM_METHOD_LSI:
+        nvdimm_lsi_handle(method_in->handle, dsm_mem_addr);
+        break;
+    case NVDIMM_METHOD_LSR:
+        nvdimm_lsr_handle(method_in->handle, method_in->args, dsm_mem_addr);
+        break;
+    case NVDIMM_METHOD_LSW:
+        nvdimm_lsw_handle(method_in->handle, method_in->args, dsm_mem_addr);
+        break;
+    default:
+        nvdimm_debug("%s: Unkown method 0x%x\n", __func__, method_in->method);
+        break;
+    }
+
+    g_free(method_in);
 }
 
-static const MemoryRegionOps nvdimm_dsm_ops = {
-    .read = nvdimm_dsm_read,
-    .write = nvdimm_dsm_write,
+static const MemoryRegionOps nvdimm_method_ops = {
+    .read = nvdimm_method_read,
+    .write = nvdimm_method_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
@@ -899,12 +972,12 @@ void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
                             FWCfgState *fw_cfg, Object *owner)
 {
     state->dsm_io = dsm_io;
-    memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
+    memory_region_init_io(&state->io_mr, owner, &nvdimm_method_ops, state,
                           "nvdimm-acpi-io", dsm_io.bit_width >> 3);
     memory_region_add_subregion(io, dsm_io.address, &state->io_mr);
 
     state->dsm_mem = g_array_new(false, true /* clear */, 1);
-    acpi_data_push(state->dsm_mem, sizeof(NvdimmDsmIn));
+    acpi_data_push(state->dsm_mem, sizeof(NvdimmMthdIn));
     fw_cfg_add_file(fw_cfg, NVDIMM_DSM_MEM_FILE, state->dsm_mem->data,
                     state->dsm_mem->len);
 
@@ -918,13 +991,22 @@ void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
 #define NVDIMM_DSM_IOPORT       "NPIO"
 
 #define NVDIMM_DSM_NOTIFY       "NTFI"
+#define NVDIMM_DSM_METHOD       "MTHD"
 #define NVDIMM_DSM_HANDLE       "HDLE"
 #define NVDIMM_DSM_REVISION     "REVS"
 #define NVDIMM_DSM_FUNCTION     "FUNC"
 #define NVDIMM_DSM_ARG3         "FARG"
 
-#define NVDIMM_DSM_OUT_BUF_SIZE "RLEN"
-#define NVDIMM_DSM_OUT_BUF      "ODAT"
+#define NVDIMM_DSM_OFFSET       "OFST"
+#define NVDIMM_DSM_TRANS_LEN    "TRSL"
+#define NVDIMM_DSM_IN_BUFF      "IDAT"
+
+#define NVDIMM_DSM_OUT_BUF_SIZE     "RLEN"
+#define NVDIMM_DSM_OUT_BUF          "ODAT"
+#define NVDIMM_DSM_OUT_STATUS       "STUS"
+#define NVDIMM_DSM_OUT_LSA_SIZE     "SIZE"
+#define NVDIMM_DSM_OUT_MAX_TRANS    "MAXT"
+
 
 #define NVDIMM_DSM_RFIT_STATUS  "RSTA"
 
@@ -938,7 +1020,6 @@ static void nvdimm_build_common_dsm(Aml *dev,
     Aml *pckg, *pckg_index, *pckg_buf, *field, *dsm_out_buf, *dsm_out_buf_size;
     Aml *whilectx, *offset;
     uint8_t byte_list[1];
-    AmlRegionSpace rs;
 
     method = aml_method(NVDIMM_COMMON_DSM, 5, AML_SERIALIZED);
     uuid = aml_arg(0);
@@ -949,37 +1030,15 @@ static void nvdimm_build_common_dsm(Aml *dev,
 
     aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR), dsm_mem));
 
-    if (nvdimm_state->dsm_io.space_id == AML_AS_SYSTEM_IO) {
-        rs = AML_SYSTEM_IO;
-    } else {
-        rs = AML_SYSTEM_MEMORY;
-    }
-
-    /* map DSM memory and IO into ACPI namespace. */
-    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, rs,
-               aml_int(nvdimm_state->dsm_io.address),
-               nvdimm_state->dsm_io.bit_width >> 3));
     aml_append(method, aml_operation_region(NVDIMM_DSM_MEMORY,
-               AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmDsmIn)));
-
-    /*
-     * DSM notifier:
-     * NVDIMM_DSM_NOTIFY: write the address of DSM memory and notify QEMU to
-     *                    emulate the access.
-     *
-     * It is the IO port so that accessing them will cause VM-exit, the
-     * control will be transferred to QEMU.
-     */
-    field = aml_field(NVDIMM_DSM_IOPORT, AML_DWORD_ACC, AML_NOLOCK,
-                      AML_PRESERVE);
-    aml_append(field, aml_named_field(NVDIMM_DSM_NOTIFY,
-               nvdimm_state->dsm_io.bit_width));
-    aml_append(method, field);
+               AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmMthdIn)));
 
     /*
      * DSM input:
      * NVDIMM_DSM_HANDLE: store device's handle, it's zero if the _DSM call
      *                    happens on NVDIMM Root Device.
+     * NVDIMM_DSM_METHOD: ACPI method indicator, to distinguish _DSM and
+     *                    other ACPI methods.
      * NVDIMM_DSM_REVISION: store the Arg1 of _DSM call.
      * NVDIMM_DSM_FUNCTION: store the Arg2 of _DSM call.
      * NVDIMM_DSM_ARG3: store the Arg3 of _DSM call which is a Package
@@ -991,13 +1050,16 @@ static void nvdimm_build_common_dsm(Aml *dev,
     field = aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
                       AML_PRESERVE);
     aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
-               sizeof(typeof_field(NvdimmDsmIn, handle)) * BITS_PER_BYTE));
+               sizeof(typeof_field(NvdimmMthdIn, handle)) * BITS_PER_BYTE));
+    aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
+               sizeof(typeof_field(NvdimmMthdIn, method)) * BITS_PER_BYTE));
     aml_append(field, aml_named_field(NVDIMM_DSM_REVISION,
                sizeof(typeof_field(NvdimmDsmIn, revision)) * BITS_PER_BYTE));
     aml_append(field, aml_named_field(NVDIMM_DSM_FUNCTION,
                sizeof(typeof_field(NvdimmDsmIn, function)) * BITS_PER_BYTE));
     aml_append(field, aml_named_field(NVDIMM_DSM_ARG3,
-         (sizeof(NvdimmDsmIn) - offsetof(NvdimmDsmIn, arg3)) * BITS_PER_BYTE));
+         (sizeof(NvdimmMthdIn) - offsetof(NvdimmMthdIn, args) -
+          offsetof(NvdimmDsmIn, arg3)) * BITS_PER_BYTE));
     aml_append(method, field);
 
     /*
@@ -1065,6 +1127,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
      * it reserves 0 for root device and is the handle for NVDIMM devices.
      * See the comments in nvdimm_slot_to_handle().
      */
+    aml_append(method, aml_store(aml_int(0), aml_name(NVDIMM_DSM_METHOD)));
     aml_append(method, aml_store(handle, aml_name(NVDIMM_DSM_HANDLE)));
     aml_append(method, aml_store(aml_arg(1), aml_name(NVDIMM_DSM_REVISION)));
     aml_append(method, aml_store(function, aml_name(NVDIMM_DSM_FUNCTION)));
@@ -1250,6 +1313,7 @@ static void nvdimm_build_fit(Aml *dev)
 static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
 {
     uint32_t slot;
+    Aml *method, *pkg, *field;
 
     for (slot = 0; slot < ram_slots; slot++) {
         uint32_t handle = nvdimm_slot_to_handle(slot);
@@ -1266,6 +1330,155 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
          * table NFIT or _FIT.
          */
         aml_append(nvdimm_dev, aml_name_decl("_ADR", aml_int(handle)));
+        aml_append(nvdimm_dev, aml_operation_region(NVDIMM_DSM_MEMORY,
+                   AML_SYSTEM_MEMORY, aml_name(NVDIMM_ACPI_MEM_ADDR),
+                   sizeof(NvdimmMthdIn)));
+
+        /* ACPI 6.4: 6.5.10 NVDIMM Label Methods, _LS{I,R,W} */
+
+        /* Begin of _LSI Block */
+        method = aml_method("_LSI", 0, AML_SERIALIZED);
+        /* _LSI Input field */
+        field = aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
+                          AML_PRESERVE);
+        aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
+                   sizeof(typeof_field(NvdimmMthdIn, handle)) * BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
+                   sizeof(typeof_field(NvdimmMthdIn, method)) * BITS_PER_BYTE));
+        aml_append(method, field);
+
+        /* _LSI Output field */
+        field = aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
+                          AML_PRESERVE);
+        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF_SIZE,
+                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut, len)) *
+                   BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_STATUS,
+                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut,
+                   func_ret_status)) * BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_LSA_SIZE,
+                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut, label_size)) *
+                   BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_MAX_TRANS,
+                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut, max_xfer)) *
+                   BITS_PER_BYTE));
+        aml_append(method, field);
+
+        aml_append(method, aml_store(aml_int(handle),
+                                      aml_name(NVDIMM_DSM_HANDLE)));
+        aml_append(method, aml_store(aml_int(0x100),
+                                      aml_name(NVDIMM_DSM_METHOD)));
+        aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR),
+                                      aml_name(NVDIMM_DSM_NOTIFY)));
+
+        pkg = aml_package(3);
+        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_STATUS));
+        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_LSA_SIZE));
+        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_MAX_TRANS));
+
+        aml_append(method, aml_name_decl("RPKG", pkg));
+
+        aml_append(method, aml_return(aml_name("RPKG")));
+        aml_append(nvdimm_dev, method); /* End of _LSI Block */
+
+
+        /* Begin of _LSR Block */
+        method = aml_method("_LSR", 2, AML_SERIALIZED);
+
+        /* _LSR Input field */
+        field = aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
+                          AML_PRESERVE);
+        aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
+                   sizeof(typeof_field(NvdimmMthdIn, handle)) *
+                   BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
+                   sizeof(typeof_field(NvdimmMthdIn, method)) *
+                   BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_OFFSET,
+                   sizeof(typeof_field(NvdimmFuncGetLabelDataIn, offset)) *
+                   BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_TRANS_LEN,
+                   sizeof(typeof_field(NvdimmFuncGetLabelDataIn, length)) *
+                   BITS_PER_BYTE));
+        aml_append(method, field);
+
+        /* _LSR Output field */
+        field = aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
+                          AML_PRESERVE);
+        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF_SIZE,
+                   sizeof(typeof_field(NvdimmFuncGetLabelDataOut, len)) *
+                   BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_STATUS,
+                   sizeof(typeof_field(NvdimmFuncGetLabelDataOut,
+                   func_ret_status)) * BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF,
+                   (NVDIMM_DSM_MEMORY_SIZE -
+                    offsetof(NvdimmFuncGetLabelDataOut, out_buf)) *
+                    BITS_PER_BYTE));
+        aml_append(method, field);
+
+        aml_append(method, aml_store(aml_int(handle),
+                                      aml_name(NVDIMM_DSM_HANDLE)));
+        aml_append(method, aml_store(aml_int(0x101),
+                                      aml_name(NVDIMM_DSM_METHOD)));
+        aml_append(method, aml_store(aml_arg(0), aml_name(NVDIMM_DSM_OFFSET)));
+        aml_append(method, aml_store(aml_arg(1),
+                                      aml_name(NVDIMM_DSM_TRANS_LEN)));
+        aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR),
+                                      aml_name(NVDIMM_DSM_NOTIFY)));
+
+        aml_append(method, aml_store(aml_shiftleft(aml_arg(1), aml_int(3)),
+                                         aml_local(1)));
+        aml_append(method, aml_create_field(aml_name(NVDIMM_DSM_OUT_BUF),
+                   aml_int(0), aml_local(1), "OBUF"));
+
+        pkg = aml_package(2);
+        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_STATUS));
+        aml_append(pkg, aml_name("OBUF"));
+        aml_append(method, aml_name_decl("RPKG", pkg));
+
+        aml_append(method, aml_return(aml_name("RPKG")));
+        aml_append(nvdimm_dev, method); /* End of _LSR Block */
+
+        /* Begin of _LSW Block */
+        method = aml_method("_LSW", 3, AML_SERIALIZED);
+        /* _LSW Input field */
+        field = aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
+                          AML_PRESERVE);
+        aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
+                   sizeof(typeof_field(NvdimmMthdIn, handle)) * BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
+                   sizeof(typeof_field(NvdimmMthdIn, method)) * BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_OFFSET,
+                   sizeof(typeof_field(NvdimmFuncSetLabelDataIn, offset)) *
+                   BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_TRANS_LEN,
+                   sizeof(typeof_field(NvdimmFuncSetLabelDataIn, length)) *
+                   BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_IN_BUFF, 32640));
+        aml_append(method, field);
+
+        /* _LSW Output field */
+        field = aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
+                          AML_PRESERVE);
+        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF_SIZE,
+                   sizeof(typeof_field(NvdimmDsmFuncNoPayloadOut, len)) *
+                   BITS_PER_BYTE));
+        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_STATUS,
+                   sizeof(typeof_field(NvdimmDsmFuncNoPayloadOut,
+                   func_ret_status)) * BITS_PER_BYTE));
+        aml_append(method, field);
+
+        aml_append(method, aml_store(aml_int(handle), aml_name(NVDIMM_DSM_HANDLE)));
+        aml_append(method, aml_store(aml_int(0x102), aml_name(NVDIMM_DSM_METHOD)));
+        aml_append(method, aml_store(aml_arg(0), aml_name(NVDIMM_DSM_OFFSET)));
+        aml_append(method, aml_store(aml_arg(1), aml_name(NVDIMM_DSM_TRANS_LEN)));
+        aml_append(method, aml_store(aml_arg(2), aml_name(NVDIMM_DSM_IN_BUFF)));
+        aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR),
+                                      aml_name(NVDIMM_DSM_NOTIFY)));
+
+        aml_append(method, aml_return(aml_name(NVDIMM_DSM_OUT_STATUS)));
+        aml_append(nvdimm_dev, method); /* End of _LSW Block */
 
         nvdimm_build_device_dsm(nvdimm_dev, handle);
         aml_append(root_dev, nvdimm_dev);
@@ -1278,7 +1491,8 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
                               uint32_t ram_slots, const char *oem_id)
 {
     int mem_addr_offset;
-    Aml *ssdt, *sb_scope, *dev;
+    Aml *ssdt, *sb_scope, *dev, *field;
+    AmlRegionSpace rs;
     AcpiTable table = { .sig = "SSDT", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = "NVDIMM" };
 
@@ -1286,6 +1500,9 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
 
     acpi_table_begin(&table, table_data);
     ssdt = init_aml_allocator();
+
+    mem_addr_offset = build_append_named_dword(table_data,
+                                               NVDIMM_ACPI_MEM_ADDR);
     sb_scope = aml_scope("\\_SB");
 
     dev = aml_device("NVDR");
@@ -1303,6 +1520,31 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
      */
     aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0012")));
 
+    if (nvdimm_state->dsm_io.space_id == AML_AS_SYSTEM_IO) {
+        rs = AML_SYSTEM_IO;
+    } else {
+        rs = AML_SYSTEM_MEMORY;
+    }
+
+    /* map DSM memory and IO into ACPI namespace. */
+    aml_append(dev, aml_operation_region(NVDIMM_DSM_IOPORT, rs,
+               aml_int(nvdimm_state->dsm_io.address),
+               nvdimm_state->dsm_io.bit_width >> 3));
+
+    /*
+     * DSM notifier:
+     * NVDIMM_DSM_NOTIFY: write the address of DSM memory and notify QEMU to
+     *                    emulate the access.
+     *
+     * It is the IO port so that accessing them will cause VM-exit, the
+     * control will be transferred to QEMU.
+     */
+    field = aml_field(NVDIMM_DSM_IOPORT, AML_DWORD_ACC, AML_NOLOCK,
+                      AML_PRESERVE);
+    aml_append(field, aml_named_field(NVDIMM_DSM_NOTIFY,
+               nvdimm_state->dsm_io.bit_width));
+    aml_append(dev, field);
+
     nvdimm_build_common_dsm(dev, nvdimm_state);
 
     /* 0 is reserved for root device. */
@@ -1316,12 +1558,10 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
 
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
-    mem_addr_offset = build_append_named_dword(table_data,
-                                               NVDIMM_ACPI_MEM_ADDR);
 
     bios_linker_loader_alloc(linker,
                              NVDIMM_DSM_MEM_FILE, nvdimm_state->dsm_mem,
-                             sizeof(NvdimmDsmIn), false /* high memory */);
+                             sizeof(NvdimmMthdIn), false /* high memory */);
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
         NVDIMM_DSM_MEM_FILE, 0);
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index cf8f59be44..0206b6125b 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -37,6 +37,12 @@
         }                                                     \
     } while (0)
 
+/* NVDIMM ACPI Methods */
+#define NVDIMM_METHOD_DSM   0
+#define NVDIMM_METHOD_LSI   0x100
+#define NVDIMM_METHOD_LSR   0x101
+#define NVDIMM_METHOD_LSW   0x102
+
 /*
  * The minimum label data size is required by NVDIMM Namespace
  * specification, see the chapter 2 Namespaces:
-- 
2.31.1


