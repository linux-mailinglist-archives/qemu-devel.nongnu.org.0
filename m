Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8268294B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnAR-0002Ej-6S; Tue, 31 Jan 2023 04:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAC-0002Bj-EY
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:55 -0500
Received: from mail-he1eur04on2115.outbound.protection.outlook.com
 ([40.107.7.115] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnA8-0001hD-75
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L83PUA1Ci+1z/U2ew+awj6S/WGeWbs+aKcG3SjuxWlfg5YXwUeWpJ6BJXlH6nVH81VckKYbWm/pOETDHYsSxaSTsVGk7HWl6JnfmHPaoYERuV/JiNmDx7C1ahBRM+i8yeJcegVKX2eCqQWBZoaQJIpOCIRcFud2IXcewQmrnB01dMf2YCimKuduiiGQoBmbPWfhtKE+wza9vzpa6Gq72yksu5Zj+NPeD2PqlLvqazZ4HLg2shLwv5rKm+sbnH9El55CjMeswagWDxMozFwlYQkjEFnKkSMtwbG43OU07ujAcSsJQZXEHF3Y/DnBVIzGSuSkWxeBUCShG8JFsKWu87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPnU5VwGdhOMZeEkHjv+sAYCUYecT5EkKXGLjkGWE+w=;
 b=Flu7zfdJ2yf6Pju2G5RbY90z1Av8dNuzXUpbYk04yJiZeSyTosrRAoEl4NDxMOuHVGe+ZlkZWXfd6EhCRAHaKESBxWsHZBaG5nkJPUlpsNyNMGsbms0SR7wFyDam+bbQ/5TJiY9kZaGFJBPmporxXV95Vp3HGCpN0RHuxS9L5sqlDm/C0MhK7u0f2rAFWJeizdsmlaQwRmkki/tE7Y7nFeXBNBZWY/lbWLD1pPnbHIdXuMoAZVcPUftx2rXPkOMXphzNS0Nwrm/Qto2bokzK6jobNKfAz88prFKlwYdqFGDCIKbVRPyuFWYyVIuah2TylQnhtF0yNIXH5+LZNq80Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPnU5VwGdhOMZeEkHjv+sAYCUYecT5EkKXGLjkGWE+w=;
 b=jz6YvUj8AdbHB8ksnfrfP0x2qsY0Fx2Ua3zN0RbEbcDvZyVWzqoVCPg7tiw1KujUTPrBnszQlgR6liBJOIgI/fctM3aXRZ+Ejn7kmkbfUlUXTfjhJtjeqbmJM2pS2ZJatecp5ncQe3v/39mNRNVwKeYkY7IJl+aKx1u1FQRAuEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:42:40 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:42:40 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v3 5/9] igb: check oversized packets for VMDq
Date: Tue, 31 Jan 2023 10:42:28 +0100
Message-Id: <20230131094232.28863-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0043.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::7)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: d9889738-8853-4626-28dd-08db036f7d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqutT2nQW7TX5WVkEs2NCLG99dsoN1e4WVYuv2zuHwFwRp0om23/65Z1wdjGIF0p/FB7MGyDBrYPPsJuxbGlqBPd8rhQodyFkueukM9LYhvw5CCZjYkLcv82DC8viMA1suCBgXVGiCn9GTOJp/At2h3T/REeOwhW5TTZwk12nqvGvrwKhPeKIC6O6asK3+JnU2sZzNJ+lRw8vcBODQAuFwhLhDNzjg5bnIKuX3m82r83NsLHRDdaJjSiv2WwGFJdzEaJOOGF5w3c5ldrDRX2koKC1LwmWXcTHaveudnDRNxMs94wfJofoZiuamoKahkh8YokS/PLY/TC1NaiKqtk8Cc2K+dD/f+rYT5QV81FYd6UUZfWdyTUaaNpRIDBBLOXj3a6WghDiJ70P7SmhGM0IFJlzpHRpANmh85K1uPbLa5pYVbat0uAdJ1aUanGrsHECaqZC/tpIbjkxKBh9KP8XppgMkm8qhoORiXfp0BUIxPa60ZW2U3cw0prms9HnFUa4cQr1Tds9Vo9knHZqEMg9OcGMKC7hzUQuoedXcbydxDuLE78iGuu3hUeSxL75vfMgUwXXBLipGcB8oZFX9zkbn808fNpjVyz5rcH7UpKhF8MUFzwe2bYgqLOf/OXeYcUkqwvB0Ry/HIJQ15QlDie6ae0CdxvCu8LPVFaGaZAF4kkzhQqGMPvcdOmuneyb80Bbfx5IcPbJXDHr8IBBSxvaQw1P0oIRilH2YMca/yIvB8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(451199018)(109986016)(316002)(66946007)(70586007)(66556008)(83380400001)(86362001)(38100700002)(54906003)(36756003)(6512007)(26005)(186003)(2616005)(478600001)(6486002)(6506007)(6666004)(1076003)(5660300002)(44832011)(8936002)(2906002)(41300700001)(66476007)(4326008)(8676002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?85ihma9809VtjatIuZAyFfgPPP2C9LnvGtcrZxWcSLspQrT4az7UA2whuIfY?=
 =?us-ascii?Q?6Tw3hyF7uJ9egIM0r2H/MMfsjKwdpW4X6ZZJHKIzhiJkWj4sOmkVFCg8Jqqd?=
 =?us-ascii?Q?cMwYobN6HugrWZCQ1tJNXRn9QIqoE2bL6VtvxvDEE762iJ6GZl5MDDkLWSuN?=
 =?us-ascii?Q?coNvmObKfAix7l0c/XBchl5q93OoRliQ9xx+MsE3Jdw5vXsfscDbUvmPLdc+?=
 =?us-ascii?Q?L0dxTqN3IaYrAU1cEoAcxNXYYGxcqmTIFXbGzZDH27RrU6XMHwu1zLFox2s2?=
 =?us-ascii?Q?BMz7x9OzkCI7sv5Fs7c2tMWvvwKKGrCO2g5ZgThYEl5S2e67c5i6DQOkHpyE?=
 =?us-ascii?Q?dSAaWNfUTy/monNR8kfzAHlBEBRwl1ByxAV3QBFPJT81tqma0MuUMbf5QYaf?=
 =?us-ascii?Q?zx3zg+1qI0qB/WuXt889ZTrkftLESH86/if3JPNnHsqVTq7UKk37jb14Pmxc?=
 =?us-ascii?Q?7Lalv0P17t7S14gQ8RaWfFUf6HW+Nupt255vDBSsVprbYpTi6T/L2Jy4ILTx?=
 =?us-ascii?Q?2pUm8I4jFJwOJMlYBxTT3CE3K6TwWYf2aigWyq74nK/b05htKSbun00yFAD1?=
 =?us-ascii?Q?Cg6haJ5eRYbEinu6wIi4XcDokRgHBYxvt6qk1bHh2ksmaVNXJk6RvG+ZfHm2?=
 =?us-ascii?Q?TBvGO7hoV3qa1MQcR8QYsu/rn0UOeaNW63M0Ey4x7rVGbPRdW2oL2d80cq7q?=
 =?us-ascii?Q?Ueq9SnMkPi7gunzczrFt+uN/mH/yRi/EqBlC+CNKfro0jha9+8ZwqgiFoDXz?=
 =?us-ascii?Q?2wfG4nM+esWP0RQ45E9QRzicIZ9d/W9CNyVSU+CiNj32BCs1rmCSoHORf1od?=
 =?us-ascii?Q?7440IVdjK+0Lb2BkM8ZpRSXVgtGlk6Yirw8fWzJ4RVy1sceuu7/Z7ulvBmY5?=
 =?us-ascii?Q?/QoQ1TY8bsGZSEXg/so3L7KcOBSSC0HZpq7m+R5nEjNhiaXuF0j013wLlU2W?=
 =?us-ascii?Q?yHTqoLm2HY+C6x7OvtEj0s4jS3alJVMz1l0chAb7TPxn4bBevBcPl2+YybDL?=
 =?us-ascii?Q?86UVYbHxRfxu34g2fIXTs7SvcDrvENW0XVp7hbXU4UNg49lJgmxLFCjgpFdA?=
 =?us-ascii?Q?wA/ByjQzjOYNHrdBlVw+KiYDqMQeq+1Gxjd39H/TjsjWKfxyQIyWgfj2lfpK?=
 =?us-ascii?Q?Z6Ap2gqBPuYHf7kPcMKJTVUe7ngv+mZk68ug+dRBKJViieSzezZEKllZ9GQI?=
 =?us-ascii?Q?FlbRF2+lBPtcL9hlLlV83wBDLw37IVGa4FWhNlhSoozww5fpctiUelP3C7X5?=
 =?us-ascii?Q?QcgXWK6oenIuoJfuIklKI/WOiVk4ZjabN3ClIW7igN6ywzfppfoEFdsARN/T?=
 =?us-ascii?Q?K7FVSF89FwrQ+5Bg7zAOZR3mwS7qLBG5+W3s4Fa29H9xEu6HqoiLF/gVWTFN?=
 =?us-ascii?Q?87ihgSQJA8Q+L9llbJ4JHuskTrxYZHBcuP/I0PqhsPYwj5azwL+Hdk5XLqS3?=
 =?us-ascii?Q?OhHvY59GPdJ8CTv61tNCK0y21u4FMD3ER4VbOpe6RZL6dfuDUNQQMdKbUXaW?=
 =?us-ascii?Q?caXFKV0eaIY8cJbN49K0kmhKNqK5K8dXIJGumogkP9bwh3DWrPO9nZYM2sm2?=
 =?us-ascii?Q?/OxrBZDF8zqd5hmebrG/GuOM4y1rmKEQei9GOM43gJh/PulmQKFgTqh6+7Ms?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d9889738-8853-4626-28dd-08db036f7d2b
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:38.0830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnjY9S3xSKxKlAZ081P5GOzWzqG26ZVbsn41b88bbG6xTvaMe/fBUSp4z/+usDksXefa9v4c3TO1TTeRL6M4MpUMnmbrD6CAPUnnCIFJJig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
Received-SPF: pass client-ip=40.107.7.115;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 48 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 4a1b98bf0e..2f6f30341f 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -912,12 +912,27 @@ igb_rx_l4_cso_enabled(IGBCore *core)
     return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
 }
 
+static bool
+igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
+{
+    uint16_t pool = qn % IGB_NUM_VM_POOLS;
+    bool lpe = !!(core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE);
+    int maximum_ethernet_lpe_size =
+        core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK;
+    int maximum_ethernet_vlan_size = 1522;
+
+    return lpe ? size > maximum_ethernet_lpe_size :
+        size > maximum_ethernet_vlan_size;
+}
+
 static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
-                                   E1000E_RSSInfo *rss_info, bool *external_tx)
+                                   size_t size, E1000E_RSSInfo *rss_info,
+                                   bool *external_tx)
 {
     static const int ta_shift[] = { 4, 3, 2, 0 };
     uint32_t f, ra[2], *macp, rctl = core->mac[RCTL];
     uint16_t queues = 0;
+    uint16_t oversized = 0;
     uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(ehdr)->h_tci) & VLAN_VID_MASK;
     bool accepted = false;
     int i;
@@ -943,7 +958,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
 
     if (core->mac[MRQC] & 1) {
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
-            for (i = 0; i < 8; i++) {
+            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
                     queues |= BIT(i);
                 }
@@ -977,7 +992,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                 f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
                 f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
                 if (macp[f >> 5] & (1 << (f & 0x1f))) {
-                    for (i = 0; i < 8; i++) {
+                    for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                         if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
                             queues |= BIT(i);
                         }
@@ -1000,7 +1015,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                     }
                 }
             } else {
-                for (i = 0; i < 8; i++) {
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                     if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
                         mask |= BIT(i);
                     }
@@ -1017,9 +1032,26 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         }
 
         queues &= core->mac[VFRE];
-        igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
-        if (rss_info->queue & 1) {
-            queues <<= 8;
+        if (queues) {
+            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
+                if ((queues & BIT(i)) && igb_rx_is_oversized(core, i, size)) {
+                    oversized |= BIT(i);
+                }
+            }
+            /* 8.19.37 increment ROC if packet is oversized for all queues */
+            if (oversized == queues) {
+                trace_e1000x_rx_oversized(size);
+                e1000x_inc_reg_if_not_full(core->mac, ROC);
+            }
+            queues &= ~oversized;
+        }
+
+        if (queues) {
+            igb_rss_parse_packet(core, core->rx_pkt,
+                                 external_tx != NULL, rss_info);
+            if (rss_info->queue & 1) {
+                queues <<= 8;
+            }
         }
     } else {
         switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
@@ -1563,7 +1595,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                                e1000x_vlan_enabled(core->mac),
                                core->mac[VET] & 0xffff);
 
-    queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
+    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
-- 
2.34.1


