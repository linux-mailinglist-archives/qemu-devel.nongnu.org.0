Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B7433964
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:58:36 +0200 (CEST)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqZX-0008HW-4x
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq4U-0007jI-5D; Tue, 19 Oct 2021 10:26:31 -0400
Received: from mail-dm6nam11on2050.outbound.protection.outlook.com
 ([40.107.223.50]:6080 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq4R-0003Uw-J8; Tue, 19 Oct 2021 10:26:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfTUhgyPBQvKw1fSm/HQjGHp5AKMltOZUIWiou4HwEKdZ6f0QBwY8KoVwByjRqq9ehNHrDcMWCZ7q7355CRi2S/NB7K0V4h1MrCOl14GlXiuT2xHve15IdCGcXuBedwFK9vj8e48N+lMumpoApvTWtXlI6hxeWiYhZ/NGdghkTecMM+9SndX0+jU39zYoMVuI8oOdusKFZVwE4mZQ7I7al1qz84JQn7Fz+sTDmaW7QM15MvUrcwGTvODmt8gNvnn+0J+EU23yMaCGuR7QUJxiqyymFO/IDQ10+zWSukzuT17kBuz4DBFRBY4HnLaU2hmSXO9PfnIxntMQZJPNJUPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhbE1+ogRBrZ2nwEg5/Iy3iWBahfTdUFfxdmU30+kz8=;
 b=fdlhchyLJSxtJrnp3kqmU6h04jKQ7dfeUhB6h5ekeInpu89mkY+oX2GEf4Ya/Z7Q6hJL2PhL4OvBPLUwfynjq65p/HhXSgsf+L6nFNiq8w7thbYBwr70qzOPMAZv63OzOw1tELKZ/J/fDFLBgsFTpm1fFxqu1s7XLAeks/sNCGlY2yl2CV3N9aP4y7M8rzchSLtYUFm38uYrggGaMErRtSaCwpw5lotyKI6VQmIsuRZjqYxzLPVwInYttCaKMdj8XA+7ZeVjFV0i5rU4syyJEXV+ZATCR8cxwelQHKUCwtMuAp8qoyHnqFKM3CduDV8KwFNnfozg/ITjqsz0LXDOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhbE1+ogRBrZ2nwEg5/Iy3iWBahfTdUFfxdmU30+kz8=;
 b=EaPZiEEx4lryPR463MJdppQfF9mXO5w0zVLYRmFnfFUnpo/cYv8cM+HHBfwARRhcM+QHPCQg2cObXlOtK3HWTK4J6VxhM484vwKHyEqx2SF7Ls3YSwAzUyRH+/Oj4Bg+rwiaIBTJfQ0wH9lpZMjxyV0koU0eUS7yB/QOkVQ9jTk=
Received: from DM5PR19CA0066.namprd19.prod.outlook.com (2603:10b6:3:116::28)
 by MN2PR12MB3871.namprd12.prod.outlook.com (2603:10b6:208:16a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:26:21 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:116:cafe::b1) by DM5PR19CA0066.outlook.office365.com
 (2603:10b6:3:116::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:26:20 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:26:19 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 39/64] hw/block/nvme: align with existing style
Date: Tue, 19 Oct 2021 09:09:19 -0500
Message-ID: <20211019140944.152419-40-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 061bdd90-d895-448e-22d2-08d9930c6bcc
X-MS-TrafficTypeDiagnostic: MN2PR12MB3871:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3871FB72895F22CADA0FFFC995BD9@MN2PR12MB3871.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OIoK/fAtr1wuEa3qeZf16E3vWdlmP68nZvt3eEC8ITprPPlO+1jjuBq7LtVCVjmY9tD92ZnIEYkmsC2EnyeaNmoUFngJvz9jTeyuSghJT2HgYGwiuFPPAQ9CiuZy2jD0zGoYiZnx07qEDITrYxe7n6E67ONcqqwkt3bYRhGD0JLMTrEh389aNpddUpfNQsqIKRgrP21S5bf9NJ4x78wgnaPoQKSBA9txN8HR741U8x2eJdetIzGtTn1mGFOkAK6alPttzJmW5Zb2u60IFOyuPxfqrezAvaioQYB+C7NUFnJiRaJgWsr79bK9QZJ/7jcMEu5UWrmNaSjYFEq29jH82/CLbRK86qAz4FqSvgYZGh+B3HaFTT+cynEB7c1Ff3A5vNCo5ihAq+vx/7MQjzK2WgsEpE465C2ljI6H9D+1SgBkDpsWl2QWbaBRSM0ZaNA5605mkfDyRFwPH766qX1wzCJOYb/+cISYcNd8f9iavdbMb6Hqhbn6eOzt95U1kTYajlsd8G0ZLQpY1iK9T9ZALflECLTOvRKm/tduOYuQ4NkS9pMIDwWrYjJ4i3T6SvPxvhYpBYHg/odGSik9fsReyFDvW1r1/2itifjXk55oZ7esFqQSy4Q6o2oQpp0Ua4SEE03txfg+knafzShDisbyZ4nlQSP4icx5wP+pAwinTkZQdjt0cRYg3VymY5fbTl9X9/OTtNpJxh8NMp24kgVvyPuwQ2H+0jUrmY30PVczkmqazvgZjPk+9UJpKrUPC2feU1nIMyajDVtW2ebTX5HfIz3Hj6XtEAch75zliC833IopZ520k4yA4O3kTSSOhlxT
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(336012)(2616005)(2906002)(6916009)(426003)(86362001)(36756003)(356005)(81166007)(70206006)(70586007)(44832011)(8676002)(186003)(8936002)(508600001)(4326008)(54906003)(316002)(16526019)(36860700001)(5660300002)(966005)(83380400001)(47076005)(1076003)(82310400003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:26:20.6277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 061bdd90-d895-448e-22d2-08d9930c6bcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3871
Received-SPF: softfail client-ip=40.107.223.50;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

While QEMU coding style prefers lowercase hexadecimals in constants, the
NVMe subsystem uses the format from the NVMe specifications in comments,
i.e. 'h' suffix instead of '0x' prefix.

Fix this up across the code base.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: updated message; added conversion in a couple of missing comments]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
(cherry picked from commit 312c3531bba416e589f106db8c8241fc6e7e6332)
*context dependency for 2b02aabc9d
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/block/nvme-ns.c   |  2 +-
 hw/block/nvme.c      | 67 +++++++++++++++++++++++++-------------------
 include/block/nvme.h | 10 +++----
 3 files changed, 44 insertions(+), 35 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7bb618f182..a0895614d9 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -303,7 +303,7 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
 
     id_ns_z = g_malloc0(sizeof(NvmeIdNsZoned));
 
-    /* MAR/MOR are zeroes-based, 0xffffffff means no limit */
+    /* MAR/MOR are zeroes-based, FFFFFFFFFh means no limit */
     id_ns_z->mar = cpu_to_le32(ns->params.max_active_zones - 1);
     id_ns_z->mor = cpu_to_le32(ns->params.max_open_zones - 1);
     id_ns_z->zoc = 0;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5fe082ec34..2c7ca587c5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -12,10 +12,19 @@
  * Reference Specs: http://www.nvmexpress.org, 1.4, 1.3, 1.2, 1.1, 1.0e
  *
  *  https://nvmexpress.org/developers/nvme-specification/
- */
-
-/**
- * Usage: add options:
+ *
+ *
+ * Notes on coding style
+ * ---------------------
+ * While QEMU coding style prefers lowercase hexadecimals in constants, the
+ * NVMe subsystem use thes format from the NVMe specifications in the comments
+ * (i.e. 'h' suffix instead of '0x' prefix).
+ *
+ * Usage
+ * -----
+ * See docs/system/nvme.rst for extensive documentation.
+ *
+ * Add options:
  *      -drive file=<file>,if=none,id=<drive_id>
  *      -device nvme-subsys,id=<subsys_id>,nqn=<nqn_id>
  *      -device nvme,serial=<serial>,id=<bus_name>, \
@@ -3607,18 +3616,18 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 
     /*
      * In the base NVM command set, Flush may apply to all namespaces
-     * (indicated by NSID being set to 0xFFFFFFFF). But if that feature is used
+     * (indicated by NSID being set to FFFFFFFFh). But if that feature is used
      * along with TP 4056 (Namespace Types), it may be pretty screwed up.
      *
-     * If NSID is indeed set to 0xFFFFFFFF, we simply cannot associate the
+     * If NSID is indeed set to FFFFFFFFh, we simply cannot associate the
      * opcode with a specific command since we cannot determine a unique I/O
-     * command set. Opcode 0x0 could have any other meaning than something
+     * command set. Opcode 0h could have any other meaning than something
      * equivalent to flushing and say it DOES have completely different
-     * semantics in some other command set - does an NSID of 0xFFFFFFFF then
+     * semantics in some other command set - does an NSID of FFFFFFFFh then
      * mean "for all namespaces, apply whatever command set specific command
-     * that uses the 0x0 opcode?" Or does it mean "for all namespaces, apply
-     * whatever command that uses the 0x0 opcode if, and only if, it allows
-     * NSID to be 0xFFFFFFFF"?
+     * that uses the 0h opcode?" Or does it mean "for all namespaces, apply
+     * whatever command that uses the 0h opcode if, and only if, it allows NSID
+     * to be FFFFFFFFh"?
      *
      * Anyway (and luckily), for now, we do not care about this since the
      * device only supports namespace types that includes the NVM Flush command
@@ -3934,7 +3943,7 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
             NVME_CHANGED_NSID_SIZE) {
         /*
          * If more than 1024 namespaces, the first entry in the log page should
-         * be set to 0xffffffff and the others to 0 as spec.
+         * be set to FFFFFFFFh and the others to 0 as spec.
          */
         if (i == ARRAY_SIZE(nslist)) {
             memset(nslist, 0x0, sizeof(nslist));
@@ -4332,7 +4341,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
     trace_pci_nvme_identify_nslist(min_nsid);
 
     /*
-     * Both 0xffffffff (NVME_NSID_BROADCAST) and 0xfffffffe are invalid values
+     * Both FFFFFFFFh (NVME_NSID_BROADCAST) and FFFFFFFFEh are invalid values
      * since the Active Namespace ID List should return namespaces with ids
      * *higher* than the NSID specified in the command. This is also specified
      * in the spec (NVM Express v1.3d, Section 5.15.4).
@@ -4379,7 +4388,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
     trace_pci_nvme_identify_nslist_csi(min_nsid, c->csi);
 
     /*
-     * Same as in nvme_identify_nslist(), 0xffffffff/0xfffffffe are invalid.
+     * Same as in nvme_identify_nslist(), FFFFFFFFh/FFFFFFFFEh are invalid.
      */
     if (min_nsid >= NVME_NSID_BROADCAST - 1) {
         return NVME_INVALID_NSID | NVME_DNR;
@@ -4446,7 +4455,7 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
 
     /*
      * Because the NGUID and EUI64 fields are 0 in the Identify Namespace data
-     * structure, a Namespace UUID (nidt = 0x3) must be reported in the
+     * structure, a Namespace UUID (nidt = 3h) must be reported in the
      * Namespace Identification Descriptor. Add the namespace UUID here.
      */
     ns_descrs->uuid.hdr.nidt = NVME_NIDT_UUID;
@@ -4595,7 +4604,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
             /*
              * The Reservation Notification Mask and Reservation Persistence
              * features require a status code of Invalid Field in Command when
-             * NSID is 0xFFFFFFFF. Since the device does not support those
+             * NSID is FFFFFFFFh. Since the device does not support those
              * features we can always return Invalid Namespace or Format as we
              * should do for all other features.
              */
@@ -4847,15 +4856,15 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         }
 
         /*
-         * NVMe v1.3, Section 5.21.1.7: 0xffff is not an allowed value for NCQR
+         * NVMe v1.3, Section 5.21.1.7: FFFFh is not an allowed value for NCQR
          * and NSQR.
          */
         if ((dw11 & 0xffff) == 0xffff || ((dw11 >> 16) & 0xffff) == 0xffff) {
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        trace_pci_nvme_setfeat_numq((dw11 & 0xFFFF) + 1,
-                                    ((dw11 >> 16) & 0xFFFF) + 1,
+        trace_pci_nvme_setfeat_numq((dw11 & 0xffff) + 1,
+                                    ((dw11 >> 16) & 0xffff) + 1,
                                     n->params.max_ioqpairs,
                                     n->params.max_ioqpairs);
         req->cqe.result = cpu_to_le32((n->params.max_ioqpairs - 1) |
@@ -5493,7 +5502,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             n->bar.cc = data;
         }
         break;
-    case 0x1C:  /* CSTS */
+    case 0x1c:  /* CSTS */
         if (data & (1 << 4)) {
             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_ssreset_w1c_unsupported,
                            "attempted to W1C CSTS.NSSRO"
@@ -5505,7 +5514,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
         break;
     case 0x20:  /* NSSR */
-        if (data == 0x4E564D65) {
+        if (data == 0x4e564d65) {
             trace_pci_nvme_ub_mmiowr_ssreset_unsupported();
         } else {
             /* The spec says that writes of other values have no effect */
@@ -5575,11 +5584,11 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         n->bar.cmbmsc = (n->bar.cmbmsc & 0xffffffff) | (data << 32);
         return;
 
-    case 0xE00: /* PMRCAP */
+    case 0xe00: /* PMRCAP */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
                        "invalid write to PMRCAP register, ignored");
         return;
-    case 0xE04: /* PMRCTL */
+    case 0xe04: /* PMRCTL */
         n->bar.pmrctl = data;
         if (NVME_PMRCTL_EN(data)) {
             memory_region_set_enabled(&n->pmr.dev->mr, true);
@@ -5590,19 +5599,19 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             n->pmr.cmse = false;
         }
         return;
-    case 0xE08: /* PMRSTS */
+    case 0xe08: /* PMRSTS */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
                        "invalid write to PMRSTS register, ignored");
         return;
-    case 0xE0C: /* PMREBS */
+    case 0xe0C: /* PMREBS */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrebs_readonly,
                        "invalid write to PMREBS register, ignored");
         return;
-    case 0xE10: /* PMRSWTP */
+    case 0xe10: /* PMRSWTP */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrswtp_readonly,
                        "invalid write to PMRSWTP register, ignored");
         return;
-    case 0xE14: /* PMRMSCL */
+    case 0xe14: /* PMRMSCL */
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5622,7 +5631,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
 
         return;
-    case 0xE18: /* PMRMSCU */
+    case 0xe18: /* PMRMSCU */
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5664,7 +5673,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
          * from PMRSTS should ensure prior writes
          * made it to persistent media
          */
-        if (addr == 0xE08 &&
+        if (addr == 0xe08 &&
             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
             memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
         }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 4ac926fbc6..0739e0d665 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -848,8 +848,8 @@ enum NvmeStatusCodes {
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
     NVME_NS_ALREADY_ATTACHED    = 0x0118,
     NVME_NS_PRIVATE             = 0x0119,
-    NVME_NS_NOT_ATTACHED        = 0x011A,
-    NVME_NS_CTRL_LIST_INVALID   = 0x011C,
+    NVME_NS_NOT_ATTACHED        = 0x011a,
+    NVME_NS_CTRL_LIST_INVALID   = 0x011c,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
@@ -1409,9 +1409,9 @@ typedef enum NvmeZoneState {
     NVME_ZONE_STATE_IMPLICITLY_OPEN  = 0x02,
     NVME_ZONE_STATE_EXPLICITLY_OPEN  = 0x03,
     NVME_ZONE_STATE_CLOSED           = 0x04,
-    NVME_ZONE_STATE_READ_ONLY        = 0x0D,
-    NVME_ZONE_STATE_FULL             = 0x0E,
-    NVME_ZONE_STATE_OFFLINE          = 0x0F,
+    NVME_ZONE_STATE_READ_ONLY        = 0x0d,
+    NVME_ZONE_STATE_FULL             = 0x0e,
+    NVME_ZONE_STATE_OFFLINE          = 0x0f,
 } NvmeZoneState;
 
 static inline void _nvme_check_size(void)
-- 
2.25.1


