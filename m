Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4406826C237
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 13:41:13 +0200 (CEST)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIVoF-0007jY-OJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 07:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kIVmD-0006Jy-H4
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:39:05 -0400
Received: from mail-dm6nam12on2088.outbound.protection.outlook.com
 ([40.107.243.88]:49376 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kIVmB-0006p3-52
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:39:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7oPP3xKdTHRRhRtwvnq8ibpxTyIGxdBc3Oa68WrAih6s1IqnICiToW2gQfn/ayZinlVqNWjdBnTBrSOMIR/FmGY1v1FNs8vp8FdnpIV3YKNNdxvoWUCElWgzGPMFE/6lujf6g1zhqdDXXazvoE7NpXoPHZt/h6+SA6QCnbtpAQVNSVtGgjotFcqYIxeaDHg0ZXJ7zRTi+rcH574KbFFw3O5O9E6/xL7g/h/fgaZqeFzjvuaw4NkDVgcsAbF1FubgXeVFr8Q0iNqOR4ltOt44bA8qbUrJ2vvDq/XP229M/3tOq+320XhS/AAhv+1pZm4Nh6h+COODDWkf9VghvgoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyDlaijrdHqQdvAshZ3nRRYO8Jqh4Ex59aQ6ojxOa6U=;
 b=cZ/mgNqauH4fBvGP/XwqnlwNxabyQIiQpS7koUaviJlOhJgMrEsfPhHljkLQ2EytrY2KKN9G7aKhtazgp1Di+SK9ruwZO/5IGEurln/aK8qb3AnSwlj4lHF/DG5wOv15mVtcJA3Yfy6FlP+ohAQ7SYjq282ApmQExSbelXtn7xjpoRbKVyvdveA0flIt8EUWecX4zlt2mGRIwFlfbX4JgIb89ZaRonwLnekvSHPumL88s1Yl6dOOB49yuKyqTRBiWut5m0O1urlr31/qCPAQVJCpWXxIx/rjNwymHd1aZbgHSKqWYfe/Di603tf7Coom2Cq0yipHj88WW6adbZSmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=wdc.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyDlaijrdHqQdvAshZ3nRRYO8Jqh4Ex59aQ6ojxOa6U=;
 b=rUe30aM8RcNSiLEj15mfg42Jky4GvQ0E5Qd9NvFrdCSpKVwRl4xc+c/wD1Us4yw+m7GUaZw/O9RRBb4sJSQd5uMLA1PsxWxH/I/deCOVRS7Qc2amIlmpBNnAXzLWmppLCBVZlMR1wZvyttIYUKUPj+zw0wNOAbcSkMNDpRJ+X4w=
Received: from BL0PR0102CA0064.prod.exchangelabs.com (2603:10b6:208:25::41) by
 BYAPR02MB4359.namprd02.prod.outlook.com (2603:10b6:a03:55::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11; Wed, 16 Sep 2020 11:39:00 +0000
Received: from BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:25:cafe::e6) by BL0PR0102CA0064.outlook.office365.com
 (2603:10b6:208:25::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Wed, 16 Sep 2020 11:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT020.mail.protection.outlook.com (10.152.77.162) with Microsoft SMTP
 Server id 15.20.3370.16 via Frontend Transport; Wed, 16 Sep 2020 11:38:59
 +0000
Received: from [149.199.38.66] (port=45637 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kIVm0-0001be-Nk; Wed, 16 Sep 2020 04:38:52 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kIVm7-0007NV-8b; Wed, 16 Sep 2020 04:38:59 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08GBcw1W002833; 
 Wed, 16 Sep 2020 04:38:58 -0700
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1kIVm5-0007NC-Mw; Wed, 16 Sep 2020 04:38:58 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 32FE513C0235; Wed, 16 Sep 2020 17:12:41 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?=27Marc-Andr=C3=A9=20Lureau=27?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Francisco Eduardo Iglesias <figlesia@xilinx.com>
Subject: [PATCH v6 1/7] usb/hcd-xhci: Make dma read/writes hooks pci free
Date: Wed, 16 Sep 2020 17:11:02 +0530
Message-Id: <1600256469-13130-2-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600256469-13130-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1600256469-13130-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 89b0dde3-31f1-4e9b-d71c-08d85a351a8c
X-MS-TrafficTypeDiagnostic: BYAPR02MB4359:
X-Microsoft-Antispam-PRVS: <BYAPR02MB43593B7CB98BC2136EFBB442CA210@BYAPR02MB4359.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n0/dB9PHy9B63WXV/XLObOPzh2JBPCj2kKY87aaj2DwrpQDRtMYd/NWvODaLWZ8N0FM3YdEvIo5R8aBvrOufaBPpOINqlRMf5cgB+ovIrAvSqqZL7CXsuvi6Gj3tUETFNYG4yVRudas4Gwe7AufDTXjrvOHSQOz6fZGqox6aLy962PiDQ3VDh1jQBJXTMrFev6cEL0gRWVa/MClZFUnZWjEAeDGCgH4s01JGrbtl7BUgI1MxASyVdEHCiqTU7e0i1clI93jIJEwdWxjKQPZJLOCuMK8aVlcoDVIqys4GxLcrEygxuFwGOc2A0vn9+4gY6+/6uSr3wB57pNldm/QVebfZoln+7k3rz7n/a1VGjbBdwMIEUVik2DNEePbFKu6fqm3EYRCSMUy1AMJLX74xpw==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(136003)(396003)(376002)(346002)(39860400002)(46966005)(6636002)(82310400003)(8676002)(110136005)(54906003)(2906002)(7416002)(36756003)(70586007)(47076004)(82740400003)(5660300002)(70206006)(356005)(81166007)(83380400001)(2616005)(107886003)(4326008)(478600001)(316002)(26005)(186003)(426003)(6266002)(42186006)(336012)(6666004)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 11:38:59.7979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b0dde3-31f1-4e9b-d71c-08d85a351a8c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4359
Received-SPF: pass client-ip=40.107.243.88; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 07:39:01
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 qemu-devel@nongnu.org, Paul Zimmerman <pauldzim@gmail.com>,
 Sai Pavan Boddu <saipava@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?q?=27Philippe=20Mathieu-Daud=C3=A9=27?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch starts making the hcd-xhci.c pci free, as part of this
restructuring dma read/writes are handled without passing pci object.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/usb/hcd-xhci.c | 24 +++++++++++-------------
 hw/usb/hcd-xhci.h |  1 +
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 46a2186..254cf1e 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -495,7 +495,7 @@ static inline void xhci_dma_read_u32s(XHCIState *xhci, dma_addr_t addr,
 
     assert((len % sizeof(uint32_t)) == 0);
 
-    pci_dma_read(PCI_DEVICE(xhci), addr, buf, len);
+    dma_memory_read(xhci->as, addr, buf, len);
 
     for (i = 0; i < (len / sizeof(uint32_t)); i++) {
         buf[i] = le32_to_cpu(buf[i]);
@@ -515,7 +515,7 @@ static inline void xhci_dma_write_u32s(XHCIState *xhci, dma_addr_t addr,
     for (i = 0; i < n; i++) {
         tmp[i] = cpu_to_le32(buf[i]);
     }
-    pci_dma_write(PCI_DEVICE(xhci), addr, tmp, len);
+    dma_memory_write(xhci->as, addr, tmp, len);
 }
 
 static XHCIPort *xhci_lookup_port(XHCIState *xhci, struct USBPort *uport)
@@ -644,7 +644,6 @@ static void xhci_die(XHCIState *xhci)
 
 static void xhci_write_event(XHCIState *xhci, XHCIEvent *event, int v)
 {
-    PCIDevice *pci_dev = PCI_DEVICE(xhci);
     XHCIInterrupter *intr = &xhci->intr[v];
     XHCITRB ev_trb;
     dma_addr_t addr;
@@ -663,7 +662,7 @@ static void xhci_write_event(XHCIState *xhci, XHCIEvent *event, int v)
                                ev_trb.status, ev_trb.control);
 
     addr = intr->er_start + TRB_SIZE*intr->er_ep_idx;
-    pci_dma_write(pci_dev, addr, &ev_trb, TRB_SIZE);
+    dma_memory_write(xhci->as, addr, &ev_trb, TRB_SIZE);
 
     intr->er_ep_idx++;
     if (intr->er_ep_idx >= intr->er_size) {
@@ -720,12 +719,11 @@ static void xhci_ring_init(XHCIState *xhci, XHCIRing *ring,
 static TRBType xhci_ring_fetch(XHCIState *xhci, XHCIRing *ring, XHCITRB *trb,
                                dma_addr_t *addr)
 {
-    PCIDevice *pci_dev = PCI_DEVICE(xhci);
     uint32_t link_cnt = 0;
 
     while (1) {
         TRBType type;
-        pci_dma_read(pci_dev, ring->dequeue, trb, TRB_SIZE);
+        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE);
         trb->addr = ring->dequeue;
         trb->ccs = ring->ccs;
         le64_to_cpus(&trb->parameter);
@@ -762,7 +760,6 @@ static TRBType xhci_ring_fetch(XHCIState *xhci, XHCIRing *ring, XHCITRB *trb,
 
 static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
 {
-    PCIDevice *pci_dev = PCI_DEVICE(xhci);
     XHCITRB trb;
     int length = 0;
     dma_addr_t dequeue = ring->dequeue;
@@ -773,7 +770,7 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
 
     while (1) {
         TRBType type;
-        pci_dma_read(pci_dev, dequeue, &trb, TRB_SIZE);
+        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE);
         le64_to_cpus(&trb.parameter);
         le32_to_cpus(&trb.status);
         le32_to_cpus(&trb.control);
@@ -828,7 +825,7 @@ static void xhci_er_reset(XHCIState *xhci, int v)
         xhci_die(xhci);
         return;
     }
-    pci_dma_read(PCI_DEVICE(xhci), erstba, &seg, sizeof(seg));
+    dma_memory_read(xhci->as, erstba, &seg, sizeof(seg));
     le32_to_cpus(&seg.addr_low);
     le32_to_cpus(&seg.addr_high);
     le32_to_cpus(&seg.size);
@@ -1440,7 +1437,7 @@ static int xhci_xfer_create_sgl(XHCITransfer *xfer, int in_xfer)
     int i;
 
     xfer->int_req = false;
-    pci_dma_sglist_init(&xfer->sgl, PCI_DEVICE(xhci), xfer->trb_count);
+    qemu_sglist_init(&xfer->sgl, DEVICE(xhci), xfer->trb_count, xhci->as);
     for (i = 0; i < xfer->trb_count; i++) {
         XHCITRB *trb = &xfer->trbs[i];
         dma_addr_t addr;
@@ -2104,7 +2101,7 @@ static TRBCCode xhci_address_slot(XHCIState *xhci, unsigned int slotid,
     assert(slotid >= 1 && slotid <= xhci->numslots);
 
     dcbaap = xhci_addr64(xhci->dcbaap_low, xhci->dcbaap_high);
-    poctx = ldq_le_pci_dma(PCI_DEVICE(xhci), dcbaap + 8 * slotid);
+    poctx = ldq_le_dma(xhci->as, dcbaap + 8 * slotid);
     ictx = xhci_mask64(pictx);
     octx = xhci_mask64(poctx);
 
@@ -2442,7 +2439,7 @@ static TRBCCode xhci_get_port_bandwidth(XHCIState *xhci, uint64_t pctx)
     /* TODO: actually implement real values here */
     bw_ctx[0] = 0;
     memset(&bw_ctx[1], 80, xhci->numports); /* 80% */
-    pci_dma_write(PCI_DEVICE(xhci), ctx, bw_ctx, sizeof(bw_ctx));
+    dma_memory_write(xhci->as, ctx, bw_ctx, sizeof(bw_ctx));
 
     return CC_SUCCESS;
 }
@@ -3434,6 +3431,7 @@ static void usb_xhci_realize(struct PCIDevice *dev, Error **errp)
     }
 
     usb_xhci_init(xhci);
+    xhci->as = pci_get_address_space(dev);
     xhci->mfwrap_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, xhci_mfwrap_timer, xhci);
 
     memory_region_init(&xhci->mem, OBJECT(xhci), "xhci", LEN_REGS);
@@ -3534,7 +3532,7 @@ static int usb_xhci_post_load(void *opaque, int version_id)
             continue;
         }
         slot->ctx =
-            xhci_mask64(ldq_le_pci_dma(pci_dev, dcbaap + 8 * slotid));
+            xhci_mask64(ldq_le_dma(xhci->as, dcbaap + 8 * slotid));
         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
         slot->uport = xhci_lookup_uport(xhci, slot_ctx);
         if (!slot->uport) {
diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 2110c03..2570937 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -190,6 +190,7 @@ struct XHCIState {
 
     USBBus bus;
     MemoryRegion mem;
+    AddressSpace *as;
     MemoryRegion mem_cap;
     MemoryRegion mem_oper;
     MemoryRegion mem_runtime;
-- 
2.7.4


