Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BC5036D0
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 15:42:11 +0200 (CEST)
Received: from localhost ([::1]:60144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfigk-000065-Sa
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 09:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <btv1==1052f9740c3==rick.wertenbroek@heig-vd.ch>)
 id 1nfeXo-00044P-UB
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 05:16:41 -0400
Received: from gwsmtp1.avdtec.ch ([145.232.233.54]:45982
 helo=mail02.heig-vd.ch)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <btv1==1052f9740c3==rick.wertenbroek@heig-vd.ch>)
 id 1nfeXm-0004ED-9I
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 05:16:40 -0400
X-ASG-Debug-ID: 1650100591-111d9863d113110f0001-jgbH7p
Received: from EIMAIL03.einet.ad.eivd.ch ([193.134.222.4]) by
 mail02.heig-vd.ch with ESMTP id W9MTrznUsTC4LZsZ (version=TLSv1.2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sat, 16 Apr 2022 11:16:31 +0200 (CEST)
X-Barracuda-Envelope-From: rick.wertenbroek@heig-vd.ch
X-Barracuda-Effective-Source-IP: UNKNOWN[193.134.222.4]
X-Barracuda-Apparent-Source-IP: 193.134.222.4
Received: from EIMAIL03.einet.ad.eivd.ch (10.192.41.73) by
 EIMAIL03.einet.ad.eivd.ch (10.192.41.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 16 Apr 2022 11:16:31 +0200
Received: from EIMAIL03.einet.ad.eivd.ch ([fe80::a187:168b:1702:872e]) by
 EIMAIL03.einet.ad.eivd.ch ([fe80::a187:168b:1702:872e%4]) with mapi id
 15.01.2375.024; Sat, 16 Apr 2022 11:16:31 +0200
From: Wertenbroek Rick <rick.wertenbroek@heig-vd.ch>
To: "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: [PATCH] hw/nvme: allow to pass a memory backend object for the CMB
Thread-Topic: [PATCH] hw/nvme: allow to pass a memory backend object for the
 CMB
X-ASG-Orig-Subj: [PATCH] hw/nvme: allow to pass a memory backend object for
 the CMB
Thread-Index: AQHYUXKppwALV4kwNUeFSxNC4+9xiw==
Date: Sat, 16 Apr 2022 09:16:31 +0000
Message-ID: <46152B95-24DC-426B-A752-3E1F51871CE1@heig-vd.ch>
Accept-Language: fr-CH, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
x-originating-ip: [10.192.204.11]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <01B0723BB17F104B8F9EDB7D2F62FB68@heig-vd.ch>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[193.134.222.4]
X-Barracuda-Start-Time: 1650100591
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://quarantine.heig-vd.ch:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at heig-vd.ch
X-Barracuda-Scan-Msg-Size: 6622
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.97389
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
Received-SPF: pass client-ip=145.232.233.54;
 envelope-from=btv1==1052f9740c3==rick.wertenbroek@heig-vd.ch;
 helo=mail02.heig-vd.ch
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 16 Apr 2022 09:40:44 -0400
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


