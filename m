Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F23529282
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:16:10 +0200 (CEST)
Received: from localhost ([::1]:55336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqi4X-0001bh-9H
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgY-0005Nt-3k
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgV-0006Nw-KH
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aklrpMJuHCETyzG1fo9jzMfxGXl9tgpyyR1Xyj2mPrs=;
 b=JyEmDKrtCZYtEwMHK8hFAwhEMGwlRV7+9oem6fabWbnxR2SE3hORsNqeKTYmV55xbCulmS
 eenosG5bqDVe3z8mok915fzWd+rUuCXkT5rOURe4lneBBMBL+C5TUla2A3JYMYs5o9HjYL
 pyk5O5szrmR6lBB6GJ40zrBK+2xNngY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-AEK0YHiMMIChM4XFt7naDA-1; Mon, 16 May 2022 16:51:17 -0400
X-MC-Unique: AEK0YHiMMIChM4XFt7naDA-1
Received: by mail-ej1-f72.google.com with SMTP id
 r16-20020a170906c29000b006fe56366024so772871ejz.20
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aklrpMJuHCETyzG1fo9jzMfxGXl9tgpyyR1Xyj2mPrs=;
 b=OqcT9r6TNxgiWMX5JKMicSKqaKxAaZOShu0Nhcb77d6gfiyfXmbM3kwBoOMhr6zSxx
 pFyCMN/gIkmMRr6iz5kuxPIWyoOR33VBKObW7W1zUXgAJGKoJkbDJs/8vRRNzyXIAna4
 XNWv0m9O+EB7dBF7QV1Dm/BGYIF9L0Nowats6LNU8+1QdxUltMfQrgJNkF4wg6yj9EIq
 yuayddUwU7cgQNcsobSLvluGgpJZ8ELleZtKxO/KuGGetiA2sTsQH/5H6W6l+/SPtVoO
 C9m9Sxfj+MELBkdZcDFKg2IRe4yFpS0y+vDowsd0asZvzNUbmEA1L4B8pnAxHzoLJVuN
 4SKQ==
X-Gm-Message-State: AOAM533W9Rz1BtN65RNNm+2wP03cLtMebjYifOncbSJhQ/I0q8mbQQln
 sRgmfs54XXRJdrbbuIoevxwvpK/8Kf+Ew2VEEVS6PKciFOsbzLZudwMIZQVGrWHofJnfyFa0i0D
 OURZe/yvRVLKvqiDg8fMGrhw5zrmrB3Dx2s8Br9PKTnaPUDFZKztE/MnGt6hs
X-Received: by 2002:a17:906:7315:b0:6f4:c84f:9eab with SMTP id
 di21-20020a170906731500b006f4c84f9eabmr16736567ejc.759.1652734275942; 
 Mon, 16 May 2022 13:51:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybSnmDHqMJNpngihfj4aQNp9nhb0go9Y4yqagjDIcEP7h7xr/p6Gn/NFlj9n5I0q8Prngm7w==
X-Received: by 2002:a17:906:7315:b0:6f4:c84f:9eab with SMTP id
 di21-20020a170906731500b006f4c84f9eabmr16736540ejc.759.1652734275564; 
 Mon, 16 May 2022 13:51:15 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 w5-20020a170907270500b006fdd5415ef4sm163772ejk.104.2022.05.16.13.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:51:15 -0700 (PDT)
Date: Mon, 16 May 2022 16:51:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 19/86] hw/cxl/device: Add a memory device (8.2.8.5)
Message-ID: <20220516204913.542894-20-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ben Widawsky <ben.widawsky@intel.com>

A CXL memory device (AKA Type 3) is a CXL component that contains some
combination of volatile and persistent memory. It also implements the
previously defined mailbox interface as well as the memory device
firmware interface.

Although the memory device is configured like a normal PCIe device, the
memory traffic is on an entirely separate bus conceptually (using the
same physical wires as PCIe, but different protocol).

Once the CXL topology is fully configure and address decoders committed,
the guest physical address for the memory device is part of a larger
window which is owned by the platform.  The creation of these windows
is later in this series.

The following example will create a 256M device in a 512M window:
-object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
-device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0"

Note: Dropped PCDIMM info interfaces for now.  They can be added if
appropriate at a later date.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-18-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_device.h  |  15 ++++
 include/hw/cxl/cxl_pci.h     |  21 +++++
 include/hw/pci/pci_ids.h     |   1 +
 hw/cxl/cxl-component-utils.c |  18 ++++
 hw/cxl/cxl-mailbox-utils.c   |  46 ++++++++++
 hw/mem/cxl_type3.c           | 162 +++++++++++++++++++++++++++++++++++
 hw/mem/Kconfig               |   5 ++
 hw/mem/meson.build           |   1 +
 8 files changed, 269 insertions(+)
 create mode 100644 hw/mem/cxl_type3.c

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 797a22ddb4..d8da2c7b68 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -230,4 +230,19 @@ REG64(CXL_MEM_DEV_STS, 0)
     FIELD(CXL_MEM_DEV_STS, MBOX_READY, 4, 1)
     FIELD(CXL_MEM_DEV_STS, RESET_NEEDED, 5, 3)
 
+struct CXLType3Dev {
+    /* Private */
+    PCIDevice parent_obj;
+
+    /* Properties */
+    HostMemoryBackend *hostmem;
+
+    /* State */
+    CXLComponentState cxl_cstate;
+    CXLDeviceState cxl_dstate;
+};
+
+#define TYPE_CXL_TYPE3 "cxl-type3"
+OBJECT_DECLARE_SIMPLE_TYPE(CXLType3Dev, CXL_TYPE3)
+
 #endif
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index 3f7e44daac..01cf002096 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -67,6 +67,27 @@ QEMU_BUILD_BUG_ON(sizeof(DVSECHeader) != 10);
  * CXL 2.0 Downstream Port: 3, 4, 7, 8
  */
 
+/* CXL 2.0 - 8.1.3 (ID 0001) */
+typedef struct CXLDVSECDevice {
+    DVSECHeader hdr;
+    uint16_t cap;
+    uint16_t ctrl;
+    uint16_t status;
+    uint16_t ctrl2;
+    uint16_t status2;
+    uint16_t lock;
+    uint16_t cap2;
+    uint32_t range1_size_hi;
+    uint32_t range1_size_lo;
+    uint32_t range1_base_hi;
+    uint32_t range1_base_lo;
+    uint32_t range2_size_hi;
+    uint32_t range2_size_lo;
+    uint32_t range2_base_hi;
+    uint32_t range2_base_lo;
+} CXLDVSECDevice;
+QEMU_BUILD_BUG_ON(sizeof(CXLDVSECDevice) != 0x38);
+
 /* CXL 2.0 - 8.1.5 (ID 0003) */
 typedef struct CXLDVSECPortExtensions {
     DVSECHeader hdr;
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11abe22d46..898083b86f 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -53,6 +53,7 @@
 #define PCI_BASE_CLASS_MEMORY            0x05
 #define PCI_CLASS_MEMORY_RAM             0x0500
 #define PCI_CLASS_MEMORY_FLASH           0x0501
+#define PCI_CLASS_MEMORY_CXL             0x0502
 #define PCI_CLASS_MEMORY_OTHER           0x0580
 
 #define PCI_BASE_CLASS_BRIDGE            0x06
diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index 9457a1b029..afc97b17c2 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -252,6 +252,24 @@ void cxl_component_create_dvsec(CXLComponentState *cxl,
     /* Configure write masks */
     switch (type) {
     case PCIE_CXL_DEVICE_DVSEC:
+        /* Cntrl RW Lock - so needs explicit blocking when lock is set */
+        wmask[offset + offsetof(CXLDVSECDevice, ctrl)] = 0xFD;
+        wmask[offset + offsetof(CXLDVSECDevice, ctrl) + 1] = 0x4F;
+        /* Status is RW1CS */
+        wmask[offset + offsetof(CXLDVSECDevice, ctrl2)] = 0x0F;
+       /* Lock is RW Once */
+        wmask[offset + offsetof(CXLDVSECDevice, lock)] = 0x01;
+        /* range1/2_base_high/low is RW Lock */
+        wmask[offset + offsetof(CXLDVSECDevice, range1_base_hi)] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDevice, range1_base_hi) + 1] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDevice, range1_base_hi) + 2] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDevice, range1_base_hi) + 3] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDevice, range1_base_lo) + 3] = 0xF0;
+        wmask[offset + offsetof(CXLDVSECDevice, range2_base_hi)] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDevice, range2_base_hi) + 1] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDevice, range2_base_hi) + 2] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDevice, range2_base_hi) + 3] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDevice, range2_base_lo) + 3] = 0xF0;
         break;
     case NON_CXL_FUNCTION_MAP_DVSEC:
         break; /* Not yet implemented */
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index db473135c7..4ae0561dfc 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -50,6 +50,8 @@ enum {
     LOGS        = 0x04,
         #define GET_SUPPORTED 0x0
         #define GET_LOG       0x1
+    IDENTIFY    = 0x40,
+        #define MEMORY_DEVICE 0x0
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -214,6 +216,48 @@ static ret_code cmd_logs_get_log(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
+/* 8.2.9.5.1.1 */
+static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
+                                           CXLDeviceState *cxl_dstate,
+                                           uint16_t *len)
+{
+    struct {
+        char fw_revision[0x10];
+        uint64_t total_capacity;
+        uint64_t volatile_capacity;
+        uint64_t persistent_capacity;
+        uint64_t partition_align;
+        uint16_t info_event_log_size;
+        uint16_t warning_event_log_size;
+        uint16_t failure_event_log_size;
+        uint16_t fatal_event_log_size;
+        uint32_t lsa_size;
+        uint8_t poison_list_max_mer[3];
+        uint16_t inject_poison_limit;
+        uint8_t poison_caps;
+        uint8_t qos_telemetry_caps;
+    } QEMU_PACKED *id;
+    QEMU_BUILD_BUG_ON(sizeof(*id) != 0x43);
+
+    uint64_t size = cxl_dstate->pmem_size;
+
+    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+        return CXL_MBOX_INTERNAL_ERROR;
+    }
+
+    id = (void *)cmd->payload;
+    memset(id, 0, sizeof(*id));
+
+    /* PMEM only */
+    snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
+
+    id->total_capacity = size / (256 << 20);
+    id->persistent_capacity = size / (256 << 20);
+
+    *len = sizeof(*id);
+    return CXL_MBOX_SUCCESS;
+}
+
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
 #define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
@@ -231,6 +275,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
     [TIMESTAMP][SET] = { "TIMESTAMP_SET", cmd_timestamp_set, 8, IMMEDIATE_POLICY_CHANGE },
     [LOGS][GET_SUPPORTED] = { "LOGS_GET_SUPPORTED", cmd_logs_get_supported, 0, 0 },
     [LOGS][GET_LOG] = { "LOGS_GET_LOG", cmd_logs_get_log, 0x18, 0 },
+    [IDENTIFY][MEMORY_DEVICE] = { "IDENTIFY_MEMORY_DEVICE",
+        cmd_identify_memory_device, 0, 0 },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
new file mode 100644
index 0000000000..290c088dd6
--- /dev/null
+++ b/hw/mem/cxl_type3.c
@@ -0,0 +1,162 @@
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/error-report.h"
+#include "hw/mem/memory-device.h"
+#include "hw/mem/pc-dimm.h"
+#include "hw/pci/pci.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/range.h"
+#include "qemu/rcu.h"
+#include "sysemu/hostmem.h"
+#include "hw/cxl/cxl.h"
+
+static void build_dvsecs(CXLType3Dev *ct3d)
+{
+    CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
+    uint8_t *dvsec;
+
+    dvsec = (uint8_t *)&(CXLDVSECDevice){
+        .cap = 0x1e,
+        .ctrl = 0x2,
+        .status2 = 0x2,
+        .range1_size_hi = ct3d->hostmem->size >> 32,
+        .range1_size_lo = (2 << 5) | (2 << 2) | 0x3 |
+        (ct3d->hostmem->size & 0xF0000000),
+        .range1_base_hi = 0,
+        .range1_base_lo = 0,
+    };
+    cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
+                               PCIE_CXL_DEVICE_DVSEC_LENGTH,
+                               PCIE_CXL_DEVICE_DVSEC,
+                               PCIE_CXL2_DEVICE_DVSEC_REVID, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECRegisterLocator){
+        .rsvd         = 0,
+        .reg0_base_lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
+        .reg0_base_hi = 0,
+        .reg1_base_lo = RBI_CXL_DEVICE_REG | CXL_DEVICE_REG_BAR_IDX,
+        .reg1_base_hi = 0,
+    };
+    cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
+                               REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
+                               REG_LOC_DVSEC_REVID, dvsec);
+    dvsec = (uint8_t *)&(CXLDVSECDeviceGPF){
+        .phase2_duration = 0x603, /* 3 seconds */
+        .phase2_power = 0x33, /* 0x33 miliwatts */
+    };
+    cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
+                               GPF_DEVICE_DVSEC_LENGTH, GPF_PORT_DVSEC,
+                               GPF_DEVICE_DVSEC_REVID, dvsec);
+}
+
+static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
+{
+    MemoryRegion *mr;
+
+    if (!ct3d->hostmem) {
+        error_setg(errp, "memdev property must be set");
+        return false;
+    }
+
+    mr = host_memory_backend_get_memory(ct3d->hostmem);
+    if (!mr) {
+        error_setg(errp, "memdev property must be set");
+        return false;
+    }
+    memory_region_set_nonvolatile(mr, true);
+    memory_region_set_enabled(mr, true);
+    host_memory_backend_set_mapped(ct3d->hostmem, true);
+    ct3d->cxl_dstate.pmem_size = ct3d->hostmem->size;
+
+    return true;
+}
+
+static void ct3_realize(PCIDevice *pci_dev, Error **errp)
+{
+    CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
+    CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
+    ComponentRegisters *regs = &cxl_cstate->crb;
+    MemoryRegion *mr = &regs->component_registers;
+    uint8_t *pci_conf = pci_dev->config;
+
+    if (!cxl_setup_memory(ct3d, errp)) {
+        return;
+    }
+
+    pci_config_set_prog_interface(pci_conf, 0x10);
+    pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
+
+    pcie_endpoint_cap_init(pci_dev, 0x80);
+    cxl_cstate->dvsec_offset = 0x100;
+
+    ct3d->cxl_cstate.pdev = pci_dev;
+    build_dvsecs(ct3d);
+
+    cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
+                                      TYPE_CXL_TYPE3);
+
+    pci_register_bar(
+        pci_dev, CXL_COMPONENT_REG_BAR_IDX,
+        PCI_BASE_ADDRESS_SPACE_MEMORY | PCI_BASE_ADDRESS_MEM_TYPE_64, mr);
+
+    cxl_device_register_block_init(OBJECT(pci_dev), &ct3d->cxl_dstate);
+    pci_register_bar(pci_dev, CXL_DEVICE_REG_BAR_IDX,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                     &ct3d->cxl_dstate.device_registers);
+}
+
+static void ct3d_reset(DeviceState *dev)
+{
+    CXLType3Dev *ct3d = CXL_TYPE3(dev);
+    uint32_t *reg_state = ct3d->cxl_cstate.crb.cache_mem_registers;
+    uint32_t *write_msk = ct3d->cxl_cstate.crb.cache_mem_regs_write_mask;
+
+    cxl_component_register_init_common(reg_state, write_msk, CXL2_TYPE3_DEVICE);
+    cxl_device_register_init_common(&ct3d->cxl_dstate);
+}
+
+static Property ct3_props[] = {
+    DEFINE_PROP_LINK("memdev", CXLType3Dev, hostmem, TYPE_MEMORY_BACKEND,
+                     HostMemoryBackend *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ct3_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
+
+    pc->realize = ct3_realize;
+    pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
+    pc->vendor_id = PCI_VENDOR_ID_INTEL;
+    pc->device_id = 0xd93; /* LVF for now */
+    pc->revision = 1;
+
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    dc->desc = "CXL PMEM Device (Type 3)";
+    dc->reset = ct3d_reset;
+    device_class_set_props(dc, ct3_props);
+}
+
+static const TypeInfo ct3d_info = {
+    .name = TYPE_CXL_TYPE3,
+    .parent = TYPE_PCI_DEVICE,
+    .class_init = ct3_class_init,
+    .instance_size = sizeof(CXLType3Dev),
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CXL_DEVICE },
+        { INTERFACE_PCIE_DEVICE },
+        {}
+    },
+};
+
+static void ct3d_registers(void)
+{
+    type_register_static(&ct3d_info);
+}
+
+type_init(ct3d_registers);
diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
index 03dbb3c7df..73c5ae8ad9 100644
--- a/hw/mem/Kconfig
+++ b/hw/mem/Kconfig
@@ -11,3 +11,8 @@ config NVDIMM
 
 config SPARSE_MEM
     bool
+
+config CXL_MEM_DEVICE
+    bool
+    default y if CXL
+    select MEM_DEVICE
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 82f86d117e..609b2b36fc 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -3,6 +3,7 @@ mem_ss.add(files('memory-device.c'))
 mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
 mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
 mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
+mem_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_true: files('cxl_type3.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
 
-- 
MST


