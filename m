Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B63C7989
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:18:39 +0200 (CEST)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qje-0006WC-7m
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qca-0000B1-KR
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcY-0008JK-6v
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PzNQJlTGNrpijxK0VyVgr7xwJWYbOTHaTkK7HI7uYg=;
 b=SElgyys7cu1JAvAt4rA64IS9nJVeNoZ9LL7mesrizVeUrePhnnJuqKpzRo4dhR1///KSRu
 c+rCWuPTw00HSzNQla+WI61hUpzQbByDLbPUetMmTdz8cjldqYsvrhvB6YzZXcNR7i6GnV
 1OrKkrHTZP0wVj/PvJHItkNs2La8804=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-zXj1Ayn9N2qcQu6Au1po1g-1; Tue, 13 Jul 2021 18:11:16 -0400
X-MC-Unique: zXj1Ayn9N2qcQu6Au1po1g-1
Received: by mail-wm1-f71.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so147544wmh.9
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5PzNQJlTGNrpijxK0VyVgr7xwJWYbOTHaTkK7HI7uYg=;
 b=rYcbM13GXKVw04LsngvqGk/izZMJPKIIOyKMKKkW2BTEAukFLXGRfFHA7l1y48Qvm0
 qFhsntdgJqTasCgXhxPChVqsNgCPANf1LJmRF9dCX8sftedatl7po9/kWGNLZ673Ln4g
 xhHZ9sZfYc9ouje6frmcx3xn7l/mcZcNpVDXOo4YL3WSrbcwj8E0SDMvFGMpn5Y5VkeW
 H+cSyh2TvVUfeuEF9/SqQpiVBn/gmq1b0eTRmRTD0DbCrJD8RzgN0sh4twYJ0cbESWZ9
 2taOGNN8zdttEm/RQOmSOx6G0KG1vo5To3q9FBDl5nx46BTB5ljXfdc2B4jUCv3+kSyG
 pB7A==
X-Gm-Message-State: AOAM531OjvwGHsVW8aqTwWHzvJloaTYmsWNyE0EXpqj9bzrBd48VN1Gt
 DLIMHbTFIq8VP8qIEfdWQUWJj0nviZ/5bLKwQDNlZ72mRAZf75PKQdwANtrnmH3Tp5kqM+QNMT5
 xfpXzHbt+sDc8bipYivKqy4jBPGCQN/IC7k6rCXy8XrqiFOCRVktJfoAiTM1c
X-Received: by 2002:adf:eccf:: with SMTP id s15mr8299797wro.176.1626214274867; 
 Tue, 13 Jul 2021 15:11:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLS6osSrZ+ob3TO3W29OKjdwb3Y+cUd/B5Zq54nl4mPcYSWzmUh5qmnPMyUN2pjB5xcoG1oQ==
X-Received: by 2002:adf:eccf:: with SMTP id s15mr8299765wro.176.1626214274619; 
 Tue, 13 Jul 2021 15:11:14 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id r4sm115204wre.84.2021.07.13.15.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:11:14 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:11:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] hw/i386/acpi-build: Add DMAR support to bypass iommu
Message-ID: <20210713220946.212562-21-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Xingang Wang <wangxingang5@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

In DMAR table, the drhd is set to cover all PCI devices when intel_iommu
is on. To support bypass iommu feature, we need to walk the PCI bus with
bypass_iommu disabled and add explicit scope data in DMAR drhd structure.

/mnt/sdb/wxg/qemu-next/qemu/build/x86_64-softmmu/qemu-system-x86_64 \
 -machine q35,accel=kvm,default_bus_bypass_iommu=true \
 -cpu host \
 -m 16G \
 -smp 36,sockets=2,cores=18,threads=1 \
 -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3 \
 -device pxb-pcie,bus_nr=0x20,id=pci.20,bus=pcie.0,addr=0x4,bypass_iommu=true \
 -device pcie-root-port,port=0x1,chassis=1,id=pci.11,bus=pci.10,addr=0x0 \
 -device pcie-root-port,port=0x2,chassis=2,id=pci.21,bus=pci.20,addr=0x0 \
 -device virtio-scsi-pci,id=scsi0,bus=pci.11,addr=0x0 \
 -device virtio-scsi-pci,id=scsi1,bus=pci.21,addr=0x0 \
 -drive file=/mnt/sdb/wxg/fedora-48g.qcow2,format=qcow2,if=none,id=drive-scsi0-0-0-0,cache=none,aio=native \
 -device scsi-hd,bus=scsi1.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=1 \
 -device intel-iommu \
 -nographic \

And we get the guest configuration:

~ lspci -vt
-+-[0000:20]---00.0-[21]----00.0  Red Hat, Inc. Virtio SCSI
 +-[0000:10]---00.0-[11]----00.0  Red Hat, Inc. Virtio SCSI
 \-[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller
             +-01.0  Device 1234:1111
             +-02.0  Intel Corporation 82574L Gigabit Network Connection
             +-03.0  Red Hat, Inc. QEMU PCIe Expander bridge
             +-04.0  Red Hat, Inc. QEMU PCIe Expander bridge
             +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface Controller
             +-1f.2  Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 port SATA Controller [AHCI mode]
             \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus Controller

With bypass_iommu enabled on root bus, the attached devices will bypass iommu:

/sys/class/iommu/dmar0
├── devices
│   ├── 0000:10:00.0 -> ../../../../pci0000:10/0000:10:00.0
│   └── 0000:11:00.0 -> ../../../../pci0000:10/0000:10:00.0/0000:11:00.0

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1625748919-52456-8-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 68 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index bc966a4110..7efc6285ac 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2022,6 +2022,56 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                  x86ms->oem_table_id);
 }
 
+/*
+ * Insert DMAR scope for PCI bridges and endpoint devcie
+ */
+static void
+insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
+{
+    GArray *scope_blob = opaque;
+    AcpiDmarDeviceScope *scope = NULL;
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
+        /* Dmar Scope Type: 0x02 for PCI Bridge */
+        build_append_int_noprefix(scope_blob, 0x02, 1);
+    } else {
+        /* Dmar Scope Type: 0x01 for PCI Endpoint Device */
+        build_append_int_noprefix(scope_blob, 0x01, 1);
+    }
+
+    /* length */
+    build_append_int_noprefix(scope_blob,
+                              sizeof(*scope) + sizeof(scope->path[0]), 1);
+    /* reserved */
+    build_append_int_noprefix(scope_blob, 0, 2);
+    /* enumeration_id */
+    build_append_int_noprefix(scope_blob, 0, 1);
+    /* bus */
+    build_append_int_noprefix(scope_blob, pci_bus_num(bus), 1);
+    /* device */
+    build_append_int_noprefix(scope_blob, PCI_SLOT(dev->devfn), 1);
+    /* function */
+    build_append_int_noprefix(scope_blob, PCI_FUNC(dev->devfn), 1);
+}
+
+/* For a given PCI host bridge, walk and insert DMAR scope */
+static int
+dmar_host_bridges(Object *obj, void *opaque)
+{
+    GArray *scope_blob = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            pci_for_each_device(bus, pci_bus_num(bus), insert_scope,
+                                scope_blob);
+        }
+    }
+
+    return 0;
+}
+
 /*
  * VT-d spec 8.1 DMA Remapping Reporting Structure
  * (version Oct. 2014 or later)
@@ -2041,6 +2091,15 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     /* Root complex IOAPIC use one path[0] only */
     size_t ioapic_scope_size = sizeof(*scope) + sizeof(scope->path[0]);
     IntelIOMMUState *intel_iommu = INTEL_IOMMU_DEVICE(iommu);
+    GArray *scope_blob = g_array_new(false, true, 1);
+
+    /*
+     * A PCI bus walk, for each PCI host bridge.
+     * Insert scope for each PCI bridge and endpoint device which
+     * is attached to a bus with iommu enabled.
+     */
+    object_child_foreach_recursive(object_get_root(),
+                                   dmar_host_bridges, scope_blob);
 
     assert(iommu);
     if (x86_iommu_ir_supported(iommu)) {
@@ -2054,8 +2113,9 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     /* DMAR Remapping Hardware Unit Definition structure */
     drhd = acpi_data_push(table_data, sizeof(*drhd) + ioapic_scope_size);
     drhd->type = cpu_to_le16(ACPI_DMAR_TYPE_HARDWARE_UNIT);
-    drhd->length = cpu_to_le16(sizeof(*drhd) + ioapic_scope_size);
-    drhd->flags = ACPI_DMAR_INCLUDE_PCI_ALL;
+    drhd->length =
+        cpu_to_le16(sizeof(*drhd) + ioapic_scope_size + scope_blob->len);
+    drhd->flags = 0;            /* Don't include all pci device */
     drhd->pci_segment = cpu_to_le16(0);
     drhd->address = cpu_to_le64(Q35_HOST_BRIDGE_IOMMU_ADDR);
 
@@ -2069,6 +2129,10 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     scope->path[0].device = PCI_SLOT(Q35_PSEUDO_DEVFN_IOAPIC);
     scope->path[0].function = PCI_FUNC(Q35_PSEUDO_DEVFN_IOAPIC);
 
+    /* Add scope found above */
+    g_array_append_vals(table_data, scope_blob->data, scope_blob->len);
+    g_array_free(scope_blob, true);
+
     if (iommu->dt_supported) {
         atsr = acpi_data_push(table_data, sizeof(*atsr));
         atsr->type = cpu_to_le16(ACPI_DMAR_TYPE_ATSR);
-- 
MST


