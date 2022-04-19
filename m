Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECAC506656
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:52:46 +0200 (CEST)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngifF-0003jA-Pq
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <btv1==1086afe1179==rick.wertenbroek@heig-vd.ch>)
 id 1ngiAH-0007IS-1D
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 03:20:52 -0400
Received: from gwsmtp1.avdtec.ch ([145.232.233.54]:59394
 helo=mail02.heig-vd.ch)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <btv1==1086afe1179==rick.wertenbroek@heig-vd.ch>)
 id 1ngiAD-0008Ee-Gi
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 03:20:44 -0400
X-ASG-Debug-ID: 1650352834-111d9863d1146c4f0001-jgbH7p
Received: from EIMAIL03.einet.ad.eivd.ch ([193.134.222.4]) by
 mail02.heig-vd.ch with ESMTP id vrqy1TFVr2ts2WVH (version=TLSv1.2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 19 Apr 2022 09:20:34 +0200 (CEST)
X-Barracuda-Envelope-From: rick.wertenbroek@heig-vd.ch
X-Barracuda-Effective-Source-IP: UNKNOWN[193.134.222.4]
X-Barracuda-Apparent-Source-IP: 193.134.222.4
Received: from EIMAIL03.einet.ad.eivd.ch (10.192.41.73) by
 EIMAIL03.einet.ad.eivd.ch (10.192.41.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 09:20:34 +0200
Received: from EIMAIL03.einet.ad.eivd.ch ([fe80::a187:168b:1702:872e]) by
 EIMAIL03.einet.ad.eivd.ch ([fe80::a187:168b:1702:872e%4]) with mapi id
 15.01.2375.024; Tue, 19 Apr 2022 09:20:34 +0200
From: Wertenbroek Rick <rick.wertenbroek@heig-vd.ch>
To: "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: [PATCH v2] hw/nvme: allow to pass a memory backend object for the CMB
Thread-Topic: [PATCH v2] hw/nvme: allow to pass a memory backend object for
 the CMB
X-ASG-Orig-Subj: [PATCH v2] hw/nvme: allow to pass a memory backend object for
 the CMB
Thread-Index: AQHYU731x8ePBfOpsk6db0iHxGDkWQ==
Date: Tue, 19 Apr 2022 07:20:34 +0000
Message-ID: <80A639CD-2E9C-4574-9557-FE61DDBE0C57@heig-vd.ch>
Accept-Language: fr-CH, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
x-originating-ip: [10.192.222.11]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8CAB8AA20F46934FBF53A3D0872C1453@heig-vd.ch>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[193.134.222.4]
X-Barracuda-Start-Time: 1650352834
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://quarantine.heig-vd.ch:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at heig-vd.ch
X-Barracuda-Scan-Msg-Size: 6622
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.97453
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
Received-SPF: pass client-ip=145.232.233.54;
 envelope-from=btv1==1086afe1179==rick.wertenbroek@heig-vd.ch;
 helo=mail02.heig-vd.ch
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds the optional -cmbdev=3D option that takes a QEMU memory backend
-object to be used to for the CMB (Controller Memory Buffer).
This option takes precedence over cmb_size_mb=3D if both used.
(The size will be deduced from the memory backend option).

Signed-off-by: Rick Wertenbroek <rick.wertenbroek@heig-vd.ch>
---
hw/nvme/ctrl.c | 65 ++++++++++++++++++++++++++++++++++++++------------
hw/nvme/nvme.h |  9 +++----
2 files changed, 55 insertions(+), 19 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 03760ddeae..9bcc7d6db0 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -29,6 +29,7 @@
 *      -device nvme-subsys,id=3D<subsys_id>,nqn=3D<nqn_id>
 *      -device nvme,serial=3D<serial>,id=3D<bus_name>, \
 *              cmb_size_mb=3D<cmb_size_mb[optional]>, \
+ *              [cmbdev=3D<mem_backend_id>,] \
 *              [pmrdev=3D<mem_backend_file_id>,] \
 *              max_ioqpairs=3D<N[optional]>, \
 *              aerl=3D<N[optional]>,aer_max_queued=3D<N[optional]>, \
@@ -44,6 +45,11 @@
 * offset 0 in BAR2 and supports only WDS, RDS and SQS for now. By default,=
 the
 * device will use the "v1.4 CMB scheme" - use the `legacy-cmb` parameter t=
o
 * always enable the CMBLOC and CMBSZ registers (v1.3 behavior).
+ * Enabling cmb emulation can also be achieved by pointing to a memory-bac=
kend
+ * For example:
+ * -object memory-backend-ram,id=3D<mem_id>,size=3D<size> \
+ * -device nvme,...,cmbdev=3D<mem_id>
+ * cmbdev=3D will take precedence over cmb_size_mb=3D when both provided.
 *
 * Enabling pmr emulation can be achieved by pointing to memory-backend-fil=
e.
 * For example:
@@ -341,16 +347,26 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr=
)
        return false;
    }

-    lo =3D n->params.legacy_cmb ? n->cmb.mem.addr : n->cmb.cba;
-    hi =3D lo + int128_get64(n->cmb.mem.size);
+    if (n->cmb.dev) {
+        lo =3D n->params.legacy_cmb ? host_memory_backend_get_memory(n->cm=
b.dev)->addr : n->cmb.cba;
+        hi =3D lo + int128_get64(host_memory_backend_get_memory(n->cmb.dev=
)->size);
+    } else {
+        lo =3D n->params.legacy_cmb ? n->cmb.mem.addr : n->cmb.cba;
+        hi =3D lo + int128_get64(n->cmb.mem.size);
+    }

    return addr >=3D lo && addr < hi;
}

static inline void *nvme_addr_to_cmb(NvmeCtrl *n, hwaddr addr)
{
-    hwaddr base =3D n->params.legacy_cmb ? n->cmb.mem.addr : n->cmb.cba;
-    return &n->cmb.buf[addr - base];
+    if (n->cmb.dev) {
+        hwaddr base =3D n->params.legacy_cmb ? host_memory_backend_get_mem=
ory(n->cmb.dev)->addr : n->cmb.cba;
+        return memory_region_get_ram_ptr(&n->cmb.dev->mr) + (addr - base);
+    } else {
+        hwaddr base =3D n->params.legacy_cmb ? n->cmb.mem.addr : n->cmb.cb=
a;
+        return &n->cmb.buf[addr - base];
+    }
}

static bool nvme_addr_is_pmr(NvmeCtrl *n, hwaddr addr)
@@ -6584,16 +6600,33 @@ static void nvme_init_state(NvmeCtrl *n)

static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
{
-    uint64_t cmb_size =3D n->params.cmb_size_mb * MiB;
+    uint64_t cmb_size;
    uint64_t cap =3D ldq_le_p(&n->bar.cap);

-    n->cmb.buf =3D g_malloc0(cmb_size);
-    memory_region_init_io(&n->cmb.mem, OBJECT(n), &nvme_cmb_ops, n,
-                          "nvme-cmb", cmb_size);
-    pci_register_bar(pci_dev, NVME_CMB_BIR,
-                     PCI_BASE_ADDRESS_SPACE_MEMORY |
-                     PCI_BASE_ADDRESS_MEM_TYPE_64 |
-                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
+    if (n->cmb.dev) {
+        if (n->params.cmb_size_mb) {
+            warn_report("Option cmb_size_mb is ignored when a cmbdev is pr=
ovided");
+        }
+        n->params.cmb_size_mb =3D n->cmb.dev->size / MiB;
+        cmb_size =3D n->cmb.dev->size;
+
+        MemoryRegion *mr =3D host_memory_backend_get_memory(n->cmb.dev);
+        assert(mr);
+
+        pci_register_bar(pci_dev, NVME_CMB_BIR,
+                         PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64 |
+                         PCI_BASE_ADDRESS_MEM_PREFETCH, mr);
+    } else {
+        cmb_size =3D n->params.cmb_size_mb * MiB;
+        n->cmb.buf =3D g_malloc0(cmb_size);
+        memory_region_init_io(&n->cmb.mem, OBJECT(n), &nvme_cmb_ops, n,
+                              "nvme-cmb", cmb_size);
+        pci_register_bar(pci_dev, NVME_CMB_BIR,
+                         PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64 |
+                         PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
+    }

    NVME_CAP_SET_CMBS(cap, 1);
    stq_le_p(&n->bar.cap, cap);
@@ -6678,7 +6711,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_=
dev, Error **errp)
        }
    }

-    if (n->params.cmb_size_mb) {
+    if (n->params.cmb_size_mb || n->cmb.dev) {
        nvme_init_cmb(n, pci_dev);
    }

@@ -6793,7 +6826,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pc=
i_dev)
    NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_CSI_SUPP);
    NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_ADMIN_ONLY);
    NVME_CAP_SET_MPSMAX(cap, 4);
-    NVME_CAP_SET_CMBS(cap, n->params.cmb_size_mb ? 1 : 0);
+    NVME_CAP_SET_CMBS(cap, (n->params.cmb_size_mb || n->cmb.dev) ? 1 : 0);
    NVME_CAP_SET_PMRS(cap, n->pmr.dev ? 1 : 0);
    stq_le_p(&n->bar.cap, cap);

@@ -6893,7 +6926,7 @@ static void nvme_exit(PCIDevice *pci_dev)
    g_free(n->sq);
    g_free(n->aer_reqs);

-    if (n->params.cmb_size_mb) {
+    if (!n->cmb.dev && n->params.cmb_size_mb) {
        g_free(n->cmb.buf);
    }

@@ -6908,6 +6941,8 @@ static Property nvme_props[] =3D {
    DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
    DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmr.dev, TYPE_MEMORY_BACKEND,
                     HostMemoryBackend *),
+    DEFINE_PROP_LINK("cmbdev", NvmeCtrl, cmb.dev, TYPE_MEMORY_BACKEND,
+                     HostMemoryBackend *),
    DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
                     NvmeSubsystem *),
    DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 739c8b8f79..63747cf967 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -434,10 +434,11 @@ typedef struct NvmeCtrl {
    uint8_t     smart_critical_warning;

    struct {
-        MemoryRegion mem;
-        uint8_t      *buf;
-        bool         cmse;
-        hwaddr       cba;
+        MemoryRegion      mem;
+        HostMemoryBackend *dev;
+        uint8_t           *buf;
+        bool              cmse;
+        hwaddr            cba;
    } cmb;

    struct {
--=20
2.24.3 (Apple Git-128)


