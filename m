Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB972E09C5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 12:36:24 +0100 (CET)
Received: from localhost ([::1]:53886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfxn-0000IW-In
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 06:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1krfvj-0007Zu-UO; Tue, 22 Dec 2020 06:34:17 -0500
Received: from mail.mutex.one ([62.77.152.124]:55460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1krfve-0007M2-Ho; Tue, 22 Dec 2020 06:34:14 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 28292BF43129;
 Tue, 22 Dec 2020 13:34:06 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbpCcTVQa5Ts; Tue, 22 Dec 2020 13:33:56 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 9D52EBF43128;
 Tue, 22 Dec 2020 13:33:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1608636836; bh=rvstQlZpJD9TqdnfrxdDRLHAFbmvmDRvAVjZBuUsjGM=;
 h=From:To:Cc:Subject:Date:From;
 b=idPi4BPqnU8Iz3khPo/LbhcpRjUWZogTMFzcpK8e2Tv71UrIzCG0/LFSG8BApWXNV
 ueqX7WeSaiCKJOsgIyGK+4tV9MVZAZKAnB2lnurD4z9N8bAZNh5/+uGoVhKMQg6d29
 cN5JbqxGqihVqiT0dKuhsYcceyHE20xUO5KKUH70=
From: Marian Posteuca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] acpi: Permit OEM ID and OEM table ID fields to be changed
Date: Tue, 22 Dec 2020 13:33:53 +0200
Message-Id: <20201222113353.31224-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=62.77.152.124; envelope-from=marian@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Marian Posteuca <posteuca@mutex.one>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu's ACPI table generation sets the fields OEM ID and OEM table ID
to "BOCHS " and "BXPCxxxx" where "xxxx" is replaced by the ACPI
table name.

Some games like Red Dead Redemption 2 seem to check the ACPI OEM ID
and OEM table ID for the strings "BOCHS" and "BXPC" and if they are
found, the game crashes(this may be an intentional detection
mechanism to prevent playing the game in a virtualized environment).

This patch allows you to override these default values.

The feature can be used in this manner:
  qemu -machine oem_id=ABCDEF,oem_table_id=EFGH

The oem_id string must be exactly 6 bytes in size, and the
oem_table_id string must be exactly 4 bytes in size. If either of
these parameters is not set, the current default values will be
used for the one missing.

This does not affect the -acpitable option (for user-defined ACPI
tables), which has precedence over -machine option.

Signed-off-by: Marian Posteuca <posteuca@mutex.one>
---
 hw/acpi/hmat.h              |  3 +-
 hw/i386/acpi-common.h       |  3 +-
 include/hw/acpi/aml-build.h | 12 +++--
 include/hw/acpi/pci.h       |  3 +-
 include/hw/acpi/vmgenid.h   |  2 +-
 include/hw/i386/pc.h        |  5 +-
 include/hw/mem/nvdimm.h     |  3 +-
 hw/acpi/aml-build.c         | 28 +++++++----
 hw/acpi/ghes.c              |  2 +-
 hw/acpi/hmat.c              |  6 ++-
 hw/acpi/nvdimm.c            | 19 +++++---
 hw/acpi/pci.c               |  6 ++-
 hw/acpi/vmgenid.c           |  4 +-
 hw/arm/virt-acpi-build.c    | 23 ++++-----
 hw/i386/acpi-build.c        | 93 ++++++++++++++++++++++++++-----------
 hw/i386/acpi-common.c       |  5 +-
 hw/i386/acpi-microvm.c      |  6 +--
 hw/i386/pc.c                | 37 +++++++++++++++
 18 files changed, 182 insertions(+), 78 deletions(-)

diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
index e9031cac01..b57f0e7e80 100644
--- a/hw/acpi/hmat.h
+++ b/hw/acpi/hmat.h
@@ -37,6 +37,7 @@
  */
 #define HMAT_PROXIMITY_INITIATOR_VALID  0x1
 
-void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state);
+void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
+                const char *oem_id, const char *oem_table_id);
 
 #endif
diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
index c30e461f18..b12cd73ea5 100644
--- a/hw/i386/acpi-common.h
+++ b/hw/i386/acpi-common.h
@@ -9,6 +9,7 @@
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev);
+                     X86MachineState *x86ms, AcpiDeviceIf *adev,
+                     const char *oem_id, const char *oem_table_id);
 
 #endif
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index e727bea1bc..3f88669d6e 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -416,7 +416,7 @@ void build_append_int_noprefix(GArray *table, uint64_t value, int size);
 void
 build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-             const char *oem_id, const char *oem_table_id);
+             const char *oem_id, const char *oem_table_id, bool use_sig_oem);
 void *acpi_data_push(GArray *table_data, unsigned size);
 unsigned acpi_data_len(GArray *table);
 void acpi_add_table(GArray *table_offsets, GArray *table_data);
@@ -426,7 +426,7 @@ void
 build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data);
 void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
-           const char *oem_id, const char *oem_table_id);
+           const char *oem_id, const char *oem_table_id, bool use_sig_oem);
 void
 build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
@@ -457,10 +457,12 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set);
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
-void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
+void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
+                const char *oem_id, const char *oem_table_id);
 
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
-                const char *oem_id, const char *oem_table_id);
+                const char *oem_id, const char *oem_table_id, bool use_sig_oem);
 
-void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog);
+void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
+                const char *oem_id, const char *oem_table_id);
 #endif
diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index bf2a3ed0ba..e514f179d8 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -33,5 +33,6 @@ typedef struct AcpiMcfgInfo {
     uint32_t size;
 } AcpiMcfgInfo;
 
-void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
+void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
+                const char *oem_id, const char *oem_table_id);
 #endif
diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index cb4ad37fc5..dc8bb3433e 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -31,7 +31,7 @@ static inline Object *find_vmgenid_dev(void)
 }
 
 void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
-                        BIOSLinker *linker);
+                        BIOSLinker *linker, const char *oem_id);
 void vmgenid_add_fw_cfg(VmGenIdState *vms, FWCfgState *s, GArray *guid);
 
 #endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 2aa8797c6e..22ae2d2bc4 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -62,7 +62,8 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
-
+#define PC_MACHINE_OEM_ID           "oem_id"
+#define PC_MACHINE_OEM_TABLE_ID     "oem_table_id"
 /**
  * PCMachineClass:
  *
@@ -101,6 +102,8 @@ struct PCMachineClass {
     int legacy_acpi_table_size;
     unsigned acpi_data_size;
     bool do_not_add_smb_acpi;
+    char oem_id[6];
+    char oem_table_id[4];
 
     /* SMBIOS compat: */
     bool smbios_defaults;
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index c699842dd0..bcf62f825c 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -154,7 +154,8 @@ void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
 void nvdimm_build_srat(GArray *table_data);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
-                       uint32_t ram_slots);
+                       uint32_t ram_slots, const char *oem_id,
+                       const char *oem_table_id);
 void nvdimm_plug(NVDIMMState *state);
 void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev);
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index f976aa667b..f832207366 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1666,7 +1666,7 @@ Aml *aml_object_type(Aml *object)
 void
 build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-             const char *oem_id, const char *oem_table_id)
+             const char *oem_id, const char *oem_table_id, bool use_sig_oem)
 {
     unsigned tbl_offset = (char *)h - table_data->data;
     unsigned checksum_offset = (char *)&h->checksum - table_data->data;
@@ -1684,6 +1684,9 @@ build_header(BIOSLinker *linker, GArray *table_data,
         strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id));
     } else {
         memcpy(h->oem_table_id, ACPI_BUILD_APPNAME4, 4);
+    }
+
+    if (use_sig_oem) {
         memcpy(h->oem_table_id + 4, sig, 4);
     }
 
@@ -1805,7 +1808,7 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
 /* Build rsdt table */
 void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
-           const char *oem_id, const char *oem_table_id)
+           const char *oem_id, const char *oem_table_id, bool use_sig_oem)
 {
     int i;
     unsigned rsdt_entries_offset;
@@ -1826,7 +1829,8 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
             ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
     }
     build_header(linker, table_data,
-                 (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
+                 (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id,
+                 use_sig_oem);
 }
 
 /* Build xsdt table */
@@ -1853,7 +1857,7 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
             ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
     }
     build_header(linker, table_data,
-                 (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
+                 (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id, true);
 }
 
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
@@ -1871,7 +1875,8 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
  * ACPI spec 5.2.17 System Locality Distance Information Table
  * (Revision 2.0 or later)
  */
-void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
+void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
+                const char *oem_id, const char *oem_table_id)
 {
     int slit_start, i, j;
     slit_start = table_data->len;
@@ -1892,12 +1897,12 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
     build_header(linker, table_data,
                  (void *)(table_data->data + slit_start),
                  "SLIT",
-                 table_data->len - slit_start, 1, NULL, NULL);
+                 table_data->len - slit_start, 1, oem_id, oem_table_id, true);
 }
 
 /* build rev1/rev3/rev5.1 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
-                const char *oem_id, const char *oem_table_id)
+                const char *oem_id, const char *oem_table_id, bool use_sig_oem)
 {
     int off;
     int fadt_start = tbl->len;
@@ -2016,7 +2021,8 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
 
 build_hdr:
     build_header(linker, tbl, (void *)(tbl->data + fadt_start),
-                 "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
+                 "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id,
+                 use_sig_oem);
 }
 
 /*
@@ -2024,7 +2030,8 @@ build_hdr:
  * table 7: TCG Hardware Interface Description Table Format for TPM 2.0
  * of TCG ACPI Specification, Family “1.2” and “2.0”, Version 1.2, Rev 8
  */
-void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
+void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
+                const char *oem_id, const char *oem_table_id)
 {
     uint8_t start_method_params[12] = {};
     unsigned log_addr_offset, tpm2_start;
@@ -2073,7 +2080,8 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
                                    log_addr_offset, 8,
                                    ACPI_BUILD_TPMLOG_FILE, 0);
     build_header(linker, table_data,
-                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
+                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, oem_id,
+                 oem_table_id, true);
 }
 
 Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index f0ee9f51ca..6b863d379a 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -372,7 +372,7 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker)
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
 
     build_header(linker, table_data, (void *)(table_data->data + hest_start),
-        "HEST", table_data->len - hest_start, 1, NULL, NULL);
+                 "HEST", table_data->len - hest_start, 1, NULL, NULL, true);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 37806f7a06..bb4e0dde5b 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -253,7 +253,8 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
     }
 }
 
-void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state)
+void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
+                const char *oem_id, const char *oem_table_id)
 {
     int hmat_start = table_data->len;
 
@@ -264,5 +265,6 @@ void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + hmat_start),
-                 "HMAT", table_data->len - hmat_start, 2, NULL, NULL);
+                 "HMAT", table_data->len - hmat_start, 2, oem_id, oem_table_id,
+                 true);
 }
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index aa95b0cbaf..1e7cd1186d 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -402,7 +402,8 @@ void nvdimm_plug(NVDIMMState *state)
 }
 
 static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
-                              GArray *table_data, BIOSLinker *linker)
+                              GArray *table_data, BIOSLinker *linker,
+                              const char *oem_id, const char *oem_table_id)
 {
     NvdimmFitBuffer *fit_buf = &state->fit_buf;
     unsigned int header;
@@ -417,7 +418,8 @@ static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + header), "NFIT",
-                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, NULL, NULL);
+                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, oem_id,
+                 oem_table_id, true);
 }
 
 #define NVDIMM_DSM_MEMORY_SIZE      4096
@@ -1278,7 +1280,7 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
 static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
                               BIOSLinker *linker,
                               NVDIMMState *nvdimm_state,
-                              uint32_t ram_slots)
+                              uint32_t ram_slots, const char *oem_id)
 {
     Aml *ssdt, *sb_scope, *dev;
     int mem_addr_offset, nvdimm_ssdt;
@@ -1331,7 +1333,8 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
         NVDIMM_DSM_MEM_FILE, 0);
     build_header(linker, table_data,
         (void *)(table_data->data + nvdimm_ssdt),
-        "SSDT", table_data->len - nvdimm_ssdt, 1, NULL, "NVDIMM");
+                 "SSDT", table_data->len - nvdimm_ssdt, 1, oem_id, "NVDIMM",
+                 false);
     free_aml_allocator();
 }
 
@@ -1359,7 +1362,8 @@ void nvdimm_build_srat(GArray *table_data)
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
-                       uint32_t ram_slots)
+                       uint32_t ram_slots, const char *oem_id,
+                       const char *oem_table_id)
 {
     GSList *device_list;
 
@@ -1369,7 +1373,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
     }
 
     nvdimm_build_ssdt(table_offsets, table_data, linker, state,
-                      ram_slots);
+                      ram_slots, oem_id);
 
     device_list = nvdimm_get_device_list();
     /* no NVDIMM device is plugged. */
@@ -1377,6 +1381,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
         return;
     }
 
-    nvdimm_build_nfit(state, table_offsets, table_data, linker);
+    nvdimm_build_nfit(state, table_offsets, table_data, linker,
+                      oem_id, oem_table_id);
     g_slist_free(device_list);
 }
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index 9510597a19..7a0f0bb021 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -28,7 +28,8 @@
 #include "hw/acpi/pci.h"
 #include "hw/pci/pcie_host.h"
 
-void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
+void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
+                const char *oem_id, const char *oem_table_id)
 {
     int mcfg_start = table_data->len;
 
@@ -56,6 +57,7 @@ void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
     build_append_int_noprefix(table_data, 0, 4);
 
     build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
-                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
+                 "MCFG", table_data->len - mcfg_start, 1, oem_id, oem_table_id,
+                 true);
 }
 
diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 2c8152d508..91bbeb93ca 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -23,7 +23,7 @@
 #include "sysemu/reset.h"
 
 void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
-                        BIOSLinker *linker)
+                        BIOSLinker *linker, const char *oem_id)
 {
     Aml *ssdt, *dev, *scope, *method, *addr, *if_ctx;
     uint32_t vgia_offset;
@@ -117,7 +117,7 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
 
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - ssdt->buf->len),
-        "SSDT", ssdt->buf->len, 1, NULL, "VMGENID");
+        "SSDT", ssdt->buf->len, 1, oem_id, "VMGENID", false);
     free_aml_allocator();
 }
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 711cf2069f..6b16efa294 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -340,7 +340,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     iort->length = cpu_to_le32(iort_length);
 
     build_header(linker, table_data, (void *)(table_data->data + iort_start),
-                 "IORT", table_data->len - iort_start, 0, NULL, NULL);
+                 "IORT", table_data->len - iort_start, 0, NULL, NULL, true);
 }
 
 static void
@@ -374,7 +374,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
 
     build_header(linker, table_data, (void *)(table_data->data + spcr_start),
-                 "SPCR", table_data->len - spcr_start, 2, NULL, NULL);
+                 "SPCR", table_data->len - spcr_start, 2, NULL, NULL, true);
 }
 
 static void
@@ -426,7 +426,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     build_header(linker, table_data, (void *)(table_data->data + srat_start),
-                 "SRAT", table_data->len - srat_start, 3, NULL, NULL);
+                 "SRAT", table_data->len - srat_start, 3, NULL, NULL, true);
 }
 
 /* GTDT */
@@ -461,7 +461,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + gtdt_start), "GTDT",
-                 table_data->len - gtdt_start, 2, NULL, NULL);
+                 table_data->len - gtdt_start, 2, NULL, NULL, true);
 }
 
 /* MADT */
@@ -550,7 +550,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 3, NULL, NULL);
+                 table_data->len - madt_start, 3, NULL, NULL, true);
 }
 
 /* FADT */
@@ -580,7 +580,7 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
         g_assert_not_reached();
     }
 
-    build_fadt(table_data, linker, &fadt, NULL, NULL);
+    build_fadt(table_data, linker, &fadt, NULL, NULL, true);
 }
 
 /* DSDT */
@@ -644,7 +644,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-        "DSDT", dsdt->buf->len, 2, NULL, NULL);
+                 "DSDT", dsdt->buf->len, 2, NULL, NULL, true);
     free_aml_allocator();
 }
 
@@ -703,7 +703,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
            .base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base,
            .size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size,
         };
-        build_mcfg(tables_blob, tables->linker, &mcfg);
+        build_mcfg(tables_blob, tables->linker, &mcfg, NULL, NULL);
     }
 
     acpi_add_table(table_offsets, tables_blob);
@@ -720,13 +720,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_srat(tables_blob, tables->linker, vms);
         if (ms->numa_state->have_numa_distance) {
             acpi_add_table(table_offsets, tables_blob);
-            build_slit(tables_blob, tables->linker, ms);
+            build_slit(tables_blob, tables->linker, ms, NULL, NULL);
         }
     }
 
     if (ms->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
-                          ms->nvdimms_state, ms->ram_slots);
+                          ms->nvdimms_state, ms->ram_slots, NULL, NULL);
     }
 
     if (its_class_name() && !vmc->no_its) {
@@ -736,7 +736,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
         acpi_add_table(table_offsets, tables_blob);
-        build_tpm2(tables_blob, tables->linker, tables->tcpalog);
+        build_tpm2(tables_blob, tables->linker, tables->tcpalog, NULL,
+                   NULL);
     }
 
     /* XSDT is pointed to by RSDP */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f18b71dea9..9316e12444 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1636,12 +1636,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-        "DSDT", dsdt->buf->len, 1, NULL, NULL);
+        "DSDT", dsdt->buf->len, 1, pcmc->oem_id, pcmc->oem_table_id, true);
     free_aml_allocator();
 }
 
 static void
-build_hpet(GArray *table_data, BIOSLinker *linker)
+build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
+           const char *oem_table_id)
 {
     Acpi20Hpet *hpet;
 
@@ -1652,11 +1653,13 @@ build_hpet(GArray *table_data, BIOSLinker *linker)
     hpet->timer_block_id = cpu_to_le32(0x8086a201);
     hpet->addr.address = cpu_to_le64(HPET_BASE);
     build_header(linker, table_data,
-                 (void *)hpet, "HPET", sizeof(*hpet), 1, NULL, NULL);
+                 (void *)hpet, "HPET", sizeof(*hpet), 1, oem_id, oem_table_id,
+                 true);
 }
 
 static void
-build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
+build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
+               const char *oem_id, const char *oem_table_id)
 {
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
     unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
@@ -1676,7 +1679,8 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
         ACPI_BUILD_TPMLOG_FILE, 0);
 
     build_header(linker, table_data,
-                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, NULL, NULL);
+                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id,
+                 true);
 }
 
 #define HOLE_640K_START  (640 * KiB)
@@ -1695,6 +1699,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     X86MachineState *x86ms = X86_MACHINE(machine);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
     PCMachineState *pcms = PC_MACHINE(machine);
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     ram_addr_t hotplugabble_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
@@ -1811,7 +1816,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_header(linker, table_data,
                  (void *)(table_data->data + srat_start),
                  "SRAT",
-                 table_data->len - srat_start, 1, NULL, NULL);
+                 table_data->len - srat_start, 1, pcmc->oem_id,
+                 pcmc->oem_table_id, true);
 }
 
 /*
@@ -1819,7 +1825,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
  * (version Oct. 2014 or later)
  */
 static void
-build_dmar_q35(GArray *table_data, BIOSLinker *linker)
+build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
+               const char *oem_table_id)
 {
     int dmar_start = table_data->len;
 
@@ -1869,7 +1876,8 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker)
     }
 
     build_header(linker, table_data, (void *)(table_data->data + dmar_start),
-                 "DMAR", table_data->len - dmar_start, 1, NULL, NULL);
+                 "DMAR", table_data->len - dmar_start, 1, oem_id, oem_table_id,
+                 true);
 }
 
 /*
@@ -1880,7 +1888,8 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker)
  * Helpful to speedup Windows guests and ignored by others.
  */
 static void
-build_waet(GArray *table_data, BIOSLinker *linker)
+build_waet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
+           const char *oem_table_id)
 {
     int waet_start = table_data->len;
 
@@ -1896,7 +1905,8 @@ build_waet(GArray *table_data, BIOSLinker *linker)
     build_append_int_noprefix(table_data, 1 << 1 /* ACPI PM timer good */, 4);
 
     build_header(linker, table_data, (void *)(table_data->data + waet_start),
-                 "WAET", table_data->len - waet_start, 1, NULL, NULL);
+                 "WAET", table_data->len - waet_start, 1, oem_id, oem_table_id,
+                 true);
 }
 
 /*
@@ -1998,7 +2008,8 @@ ivrs_host_bridges(Object *obj, void *opaque)
 }
 
 static void
-build_amd_iommu(GArray *table_data, BIOSLinker *linker)
+build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
+                const char *oem_table_id)
 {
     int ivhd_table_len = 24;
     int iommu_start = table_data->len;
@@ -2093,7 +2104,8 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
     }
 
     build_header(linker, table_data, (void *)(table_data->data + iommu_start),
-                 "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
+                 "IVRS", table_data->len - iommu_start, 1, oem_id, oem_table_id,
+                 true);
 }
 
 typedef
@@ -2149,12 +2161,28 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     GArray *tables_blob = tables->table_data;
     AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
     Object *vmgenid_dev;
+    char *oem_id;
+    char *oem_table_id;
+    bool use_sig_oem = true;
 
     acpi_get_pm_info(machine, &pm);
     acpi_get_misc_info(&misc);
     acpi_get_pci_holes(&pci_hole, &pci_hole64);
     acpi_get_slic_oem(&slic_oem);
 
+    if (slic_oem.id) {
+        oem_id = slic_oem.id;
+    } else {
+        oem_id = pcmc->oem_id;
+    }
+
+    if (slic_oem.table_id) {
+        oem_table_id = slic_oem.table_id;
+        use_sig_oem = false;
+    } else {
+        oem_table_id = pcmc->oem_table_id;
+    }
+
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
     ACPI_BUILD_DPRINTF("init ACPI tables\n");
@@ -2189,31 +2217,35 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     pm.fadt.dsdt_tbl_offset = &dsdt;
     pm.fadt.xdsdt_tbl_offset = &dsdt;
     build_fadt(tables_blob, tables->linker, &pm.fadt,
-               slic_oem.id, slic_oem.table_id);
+               oem_id, oem_table_id, use_sig_oem);
     aml_len += tables_blob->len - fadt;
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, x86ms,
-                    ACPI_DEVICE_IF(x86ms->acpi_dev));
+                    ACPI_DEVICE_IF(x86ms->acpi_dev), pcmc->oem_id,
+                    pcmc->oem_table_id);
 
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
         vmgenid_build_acpi(VMGENID(vmgenid_dev), tables_blob,
-                           tables->vmgenid, tables->linker);
+                           tables->vmgenid, tables->linker, pcmc->oem_id);
     }
 
     if (misc.has_hpet) {
         acpi_add_table(table_offsets, tables_blob);
-        build_hpet(tables_blob, tables->linker);
+        build_hpet(tables_blob, tables->linker, pcmc->oem_id,
+                   pcmc->oem_table_id);
     }
     if (misc.tpm_version != TPM_VERSION_UNSPEC) {
         if (misc.tpm_version == TPM_VERSION_1_2) {
             acpi_add_table(table_offsets, tables_blob);
-            build_tpm_tcpa(tables_blob, tables->linker, tables->tcpalog);
+            build_tpm_tcpa(tables_blob, tables->linker, tables->tcpalog,
+                           pcmc->oem_id, pcmc->oem_table_id);
         } else { /* TPM_VERSION_2_0 */
             acpi_add_table(table_offsets, tables_blob);
-            build_tpm2(tables_blob, tables->linker, tables->tcpalog);
+            build_tpm2(tables_blob, tables->linker, tables->tcpalog,
+                       pcmc->oem_id, pcmc->oem_table_id);
         }
     }
     if (pcms->numa_nodes) {
@@ -2221,34 +2253,40 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         build_srat(tables_blob, tables->linker, machine);
         if (machine->numa_state->have_numa_distance) {
             acpi_add_table(table_offsets, tables_blob);
-            build_slit(tables_blob, tables->linker, machine);
+            build_slit(tables_blob, tables->linker, machine, pcmc->oem_id,
+                       pcmc->oem_table_id);
         }
         if (machine->numa_state->hmat_enabled) {
             acpi_add_table(table_offsets, tables_blob);
-            build_hmat(tables_blob, tables->linker, machine->numa_state);
+            build_hmat(tables_blob, tables->linker, machine->numa_state,
+                       pcmc->oem_id, pcmc->oem_table_id);
         }
     }
     if (acpi_get_mcfg(&mcfg)) {
         acpi_add_table(table_offsets, tables_blob);
-        build_mcfg(tables_blob, tables->linker, &mcfg);
+        build_mcfg(tables_blob, tables->linker, &mcfg, pcmc->oem_id,
+                   pcmc->oem_table_id);
     }
     if (x86_iommu_get_default()) {
         IommuType IOMMUType = x86_iommu_get_type();
         if (IOMMUType == TYPE_AMD) {
             acpi_add_table(table_offsets, tables_blob);
-            build_amd_iommu(tables_blob, tables->linker);
+            build_amd_iommu(tables_blob, tables->linker, pcmc->oem_id,
+                            pcmc->oem_table_id);
         } else if (IOMMUType == TYPE_INTEL) {
             acpi_add_table(table_offsets, tables_blob);
-            build_dmar_q35(tables_blob, tables->linker);
+                build_dmar_q35(tables_blob, tables->linker, pcmc->oem_id,
+                               pcmc->oem_table_id);
         }
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
-                          machine->nvdimms_state, machine->ram_slots);
+                          machine->nvdimms_state, machine->ram_slots,
+                          pcmc->oem_id, pcmc->oem_table_id);
     }
 
     acpi_add_table(table_offsets, tables_blob);
-    build_waet(tables_blob, tables->linker);
+    build_waet(tables_blob, tables->linker, pcmc->oem_id, pcmc->oem_table_id);
 
     /* Add tables supplied by user (if any) */
     for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
@@ -2261,16 +2299,17 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     /* RSDT is pointed to by RSDP */
     rsdt = tables_blob->len;
     build_rsdt(tables_blob, tables->linker, table_offsets,
-               slic_oem.id, slic_oem.table_id);
+               oem_id, oem_table_id, use_sig_oem);
 
     /* RSDP is in FSEG memory, so allocate it separately */
     {
         AcpiRsdpData rsdp_data = {
             .revision = 0,
-            .oem_id = ACPI_BUILD_APPNAME6,
             .xsdt_tbl_offset = NULL,
             .rsdt_tbl_offset = &rsdt,
         };
+
+        memcpy(rsdp_data.oem_id, pcmc->oem_id, 6);
         build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
         if (!pcmc->rsdp_in_ram) {
             /* We used to allocate some extra space for RSDP revision 2 but
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index a6a30e8363..eb1ae28be3 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -72,7 +72,8 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 }
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
-                     X86MachineState *x86ms, AcpiDeviceIf *adev)
+                     X86MachineState *x86ms, AcpiDeviceIf *adev,
+                     const char *oem_id, const char *oem_table_id)
 {
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
@@ -157,6 +158,6 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 1, NULL, NULL);
+                 table_data->len - madt_start, 1, oem_id, oem_table_id, true);
 }
 
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index d34a301b84..98d02b7554 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -149,7 +149,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-        "DSDT", dsdt->buf->len, 2, NULL, NULL);
+        "DSDT", dsdt->buf->len, 2, NULL, NULL, true);
     free_aml_allocator();
 }
 
@@ -201,11 +201,11 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
     pmfadt.dsdt_tbl_offset = &dsdt;
     pmfadt.xdsdt_tbl_offset = &dsdt;
     acpi_add_table(table_offsets, tables_blob);
-    build_fadt(tables_blob, tables->linker, &pmfadt, NULL, NULL);
+    build_fadt(tables_blob, tables->linker, &pmfadt, NULL, NULL, true);
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
-                    ACPI_DEVICE_IF(x86ms->acpi_dev));
+                    ACPI_DEVICE_IF(x86ms->acpi_dev), NULL, NULL);
 
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 5458f61d10..0ba98add56 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1611,6 +1611,33 @@ static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
     pcms->max_fw_size = value;
 }
 
+static char *pc_machine_get_oem_id(Object *obj, Error **errp)
+{
+    return g_strdup(PC_MACHINE_GET_CLASS(PC_MACHINE(obj))->oem_id);
+}
+
+static void pc_machine_set_oem_id(Object *obj, const char *value, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    size_t len = strnlen(value, 6);
+
+    memcpy(PC_MACHINE_GET_CLASS(pcms)->oem_id, value, len);
+}
+
+static char *pc_machine_get_oem_table_id(Object *obj, Error **errp)
+{
+    return g_strdup(PC_MACHINE_GET_CLASS(PC_MACHINE(obj))->oem_table_id);
+}
+
+static void pc_machine_set_oem_table_id(Object *obj, const char *value,
+                                        Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    size_t len = strnlen(value, 4);
+
+    memcpy(PC_MACHINE_GET_CLASS(pcms)->oem_table_id, value, len);
+}
+
 static void pc_machine_initfn(Object *obj)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
@@ -1623,6 +1650,8 @@ static void pc_machine_initfn(Object *obj)
     pcms->max_ram_below_4g = 0; /* use default */
     /* acpi build is enabled by default if machine supports it */
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
+    memcpy(PC_MACHINE_GET_CLASS(pcms)->oem_id, ACPI_BUILD_APPNAME6, 6);
+    memcpy(PC_MACHINE_GET_CLASS(pcms)->oem_table_id, ACPI_BUILD_APPNAME4, 4);
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
     pcms->pit_enabled = true;
@@ -1759,6 +1788,14 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
         "Maximum combined firmware size");
+
+    object_class_property_add_str(oc, PC_MACHINE_OEM_ID,
+                                  pc_machine_get_oem_id,
+                                  pc_machine_set_oem_id);
+
+    object_class_property_add_str(oc, PC_MACHINE_OEM_TABLE_ID,
+                                  pc_machine_get_oem_table_id,
+                                  pc_machine_set_oem_table_id);
 }
 
 static const TypeInfo pc_machine_info = {
-- 
2.26.2



