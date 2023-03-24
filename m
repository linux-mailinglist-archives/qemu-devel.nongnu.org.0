Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21376C8575
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:00:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfmdF-0005uC-8p; Fri, 24 Mar 2023 14:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmdA-0005sx-GS
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:16 -0400
Received: from mail-am6eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::729]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmd8-0002ID-Pu
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sx5XqhGB4mx+Etb4eURUwmhhU02otPF2KLsRzGOk9Pgfgc9LGB6p/RL51Es+q23snlZQAcaU086+7DEZYUVuS8CHM6Y0FFkQWyyy+R5uunsF1MOSSoUgIIYd7t7bXNOa/Sleh1VPcpzZV3Q6OpqvHFfFcvYU3mviFRZJ5LcrTXnDzgtHKgb5OaJcoc383Z4LdGSzFd35n46HNTDChkEdQVDKk8Q6x2NHsnml6pOrziOhq4G5tsIibC6y/5g7WNeVf/XwK/xALZpPH+9qUfVR7f+woMNUfvGORCpaLqFTb83wtOFok5aB7bOPZaZgDG0laGqQyCjNubc2DHWpIV9rWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbBMtpj8FYd2Ki/VRN/suTF2u/B5rtMbbWK5nwz9bhU=;
 b=fBrO0VRBFT2bxPKqFP/dOg5J6Zx5G5vzjblyUvFE/L4zsq5Zcm/6tTCKwh54SDcekBxxzXV9qzli8qGqFsDEaEixLlSc07H9f1c/egB4j4NGblxhaZv1BBBfsqDnO8EyjzG12nC52nCLHN35hP3qUapCRJosIbXWC/S/S/ahJMiv4YMzg7KvnQZF35E+lN8tNGuygy02t/gi05wCw+FVCxx2j56iI1FpV4EpwFrD5LU+9Iwg+wd1WQkPbbQaeLBcXK7hnPWf6HYgevtqtnaTcLUIwQJj7LDXlROtMaVZF8dH2enlG+do7cDBxLj7JK8/WT3L60T+wjzvT4+170AhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbBMtpj8FYd2Ki/VRN/suTF2u/B5rtMbbWK5nwz9bhU=;
 b=hco+ITYwVEyEz6FMHixpK+OyQCH5Kcsuoq04FlquQwfIo40K4r0kbzCARdVHLDlgXkabdzQLslnrL5AJgOhZ0trwzt+e2vCPlDJmXf2SuE8mNMjwZx+ERTFhIX+9fw9Wfhy03ut/ht4SRUdgKMu/utcNkOcDX0gWF5eVcIuyE2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB3P189MB2380.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 18:58:57 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 18:58:57 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v10 4/8] igb: implement VFRE and VFTE registers
Date: Fri, 24 Mar 2023 16:34:57 +0100
Message-Id: <20230324153501.20695-5-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
References: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0100.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::14) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB3P189MB2380:EE_
X-MS-Office365-Filtering-Correlation-Id: c718d75b-4ed0-48a0-5e1d-08db2c99d0c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6uoCor2MR5EMmbP0RfwpO1sjvoQeZGmiBuLkQw7MVdlP6XVFslzdZ1KO3atFVxzkIykCsSM44GaRrm+5HXvhOR8J3RKQw6Usw768DXpaWBzSIRDxELpZUCk02vHBIUY3kzk9gW6eSdkr5fEYfgU+6GIPnUKGy0rRmCqlNzjM9eBwLcCi+R8zYax8JtwYokYcxmF7yIBvTqgq1mwTAtRvZb2K5NgD6KwrrDyl2+YjoOUzf+95XmZA2GOjuYdREkkG3F9vV72Pqf6UfazDFPHdMkcvYVeSV+Z5bGLlKkZITQGcZgIA6dSLBDTEBpmi+ZWsPKnhvmRoqhnNVEWWCFVZZ6wtLgeIUJrnic/8WRa2aC7asR5ZFhN5bTDAGIBQc7+2lisOcnSvkdGXLXTGsZvuoPuHk99FpEjsHbTHOTYr4r5PkfyAx/1tRkO6SVKLMFzpB7xM0ulsd9vUGsmv0UIn94GG7G9qfqeFFj/c4RqZFJSawt5Ui9GoPx2eDdQQ+yJiTvOmnpRr3Xo0p+04YMggXdRCu3BKZ6oWmrmbAhx1fTWgz2riFfClXrY272QMb0TGyt6l59rTE5/1kyAqDGXgcPGhsFFgKwZLwIu73EyLovZoFKPPRy0kFpKec59TKWTO53h0Q3F8SOkSbjvMGO+T+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39840400004)(451199021)(109986019)(66946007)(54906003)(316002)(66556008)(38100700002)(8676002)(70586007)(44832011)(66476007)(86362001)(4326008)(41300700001)(36756003)(5660300002)(8936002)(186003)(2616005)(2906002)(6486002)(26005)(6512007)(478600001)(1076003)(6506007)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xWQJoBd4T2POgRj5s/qWh+5OXOL9G0RI7sT6+D0WUAVikUJfOuRDVNhd3p2m?=
 =?us-ascii?Q?//wke8Be9bv0MYcY9ZDpa5vHl35LuUblxb8yf0yH/GPWZjLMrl+4ACV1Kf9q?=
 =?us-ascii?Q?r3jgAsP5UyEwpZQXrbGsZvhy9C1x9PtaUO+lALxw7PsxcGIxQN4lYNNhak8f?=
 =?us-ascii?Q?MAO8Q/aPA57kR4nTk5KgQmaRD+6+I0hwy+zsDvMjQPe8XZiDS23QvqYeUvwk?=
 =?us-ascii?Q?PoRrz1hJsjQIGpRk3MFtmZbfbqgAAiOrCMGA/7wiw+rP8j1LKrkY9nuStqaM?=
 =?us-ascii?Q?e+UKrxdMkjhemmReY5HL2OFzdk4Tk0Z8D1wD1rAsN19QvvuYSXOlfXklIupZ?=
 =?us-ascii?Q?Tv4M5oid6WxQqNOv+2YPF31/w2ZSP4pZJ11tus6WctGY9422zBoeI8h4c4/E?=
 =?us-ascii?Q?HBxucacA7CcUEZYf3+B4uoRhXAXKMeAJIXD5ivSLWp1eGLDYantJMV0xfeaS?=
 =?us-ascii?Q?VSm7x+SrO7swziWm6X3LpBmf/5xIkRwxwWWn3QyQ+yfN7oLkYFsmGSRi98mS?=
 =?us-ascii?Q?780P3ujkB9vuG6JRS8k7yGNhSnEcJUpzrGGUkv0Y1R1yV8Vthpx32aSwhFWz?=
 =?us-ascii?Q?XFF+s96em+KXtbE8imi0GKPVmysQ48NtTSUsEPNkr9/hcnOGbw1pzcRqLEve?=
 =?us-ascii?Q?uo3Rgu8+sW2EsQ598OTYl1it8os20KdLv0zMAq+Ko4ZieI5RDqscAAr80eya?=
 =?us-ascii?Q?8N0qbTUvxMUhxyoJGhOjGgNbNaNZ4WdJBGaxuYOVyXraTBeK5cl97FFMQiuH?=
 =?us-ascii?Q?dzCefQsGa+TS5mbOE+sjtLvq6fAml+e2A7WsjpVByJ43gozbwprVfz4wuqmg?=
 =?us-ascii?Q?IlmEgSdy1HWKylh/Rk3NPnIbyu4UYxJEfF/dJj+HwnjyPnByPZOvM96wyIa0?=
 =?us-ascii?Q?wMGnRpFlawheH2cMsEB2yS9lIR3SaKJFLWVCKekOIZevaOl8mrCJZyE6axGI?=
 =?us-ascii?Q?68LRs6cLeOqKGZ5DcBamu8k2YjFAYpkJGl2x86L7qQzUY11fRo9nOWe9U10m?=
 =?us-ascii?Q?ZdCvnOIMdhuT89zsuI9DSQPSTnOQ2XDkVaLBZqpANA6eQNz/on7uvrLwZL8M?=
 =?us-ascii?Q?0Wn1+sFBzTwBlAICCp2sOeNJJIOjiUUQcDX/Fsh8UoP/VcfC8V+/CjrrMy4m?=
 =?us-ascii?Q?Vnbwad8L5hl9JQi7Y8qr9YWzgajRpLfR73QsLjkf00pKC3cTTz/3Y2zhw+Uq?=
 =?us-ascii?Q?ngZmylLKjzrOAxA5SOQLaXu4RxyFlylTo5S4tl/Ofk7tNsnY/EWTkGTQjHn5?=
 =?us-ascii?Q?4xCXpFxks+i1x1YnqMeuteoevz/pbbQC3VBPX3FHnZgovp1LT9iLrYfmYT4s?=
 =?us-ascii?Q?UsSjd8kQj2eZrUr1G4HZHnvMuVaETwV2OdlzM2S78FE1RnTXUB4c+Cqy9DQA?=
 =?us-ascii?Q?m2wAWm0uJmJYqn7bBCWsv9FOh8vzOIEiJlWF1Bax4oX80ObnZH63LC53hHy4?=
 =?us-ascii?Q?PolbB8tnmK6/gZPhfYUzFJ2av4bhm4mTUSpTTt/EnmgGT7Fcj/pld74/WtzL?=
 =?us-ascii?Q?D7Zqnp/fJSwaZex9qG8KRcAgEXAbmzz6H0NJZe2i6akN+5KOXrSEZPtl3iFy?=
 =?us-ascii?Q?gS5Ch+yBVfy8gD5/ynuJ6b8wNwc7iEbuu1cznRhD9Z1SvcWH7Dz/0hIgv39o?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c718d75b-4ed0-48a0-5e1d-08db2c99d0c7
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:58:54.8340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3HP5TAD5t6wETcWLPBOeXCS137q7qQmnKKVhURb8Kq8RwM0WKNs34oAWVNvXcPzmyMf8N3Dz0UfjapFhokIjDGFKLC23sTVimkIG3qZTbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2380
Received-SPF: pass client-ip=2a01:111:f400:7e1b::729;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Also introduce:
- Checks for RXDCTL/TXDCTL queue enable bits
- IGB_NUM_VM_POOLS enum (Sec 1.5: Table 1-7)

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 38 +++++++++++++++++++++++++++++++-------
 hw/net/igb_core.h |  1 +
 hw/net/igb_regs.h |  3 +++
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 9ab90e8576..753f17b40c 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -784,6 +784,18 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
     return igb_tx_wb_eic(core, txi->idx);
 }
 
+static inline bool
+igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi)
+{
+    bool vmdq = core->mac[MRQC] & 1;
+    uint16_t qn = txi->idx;
+    uint16_t pool = qn % IGB_NUM_VM_POOLS;
+
+    return (core->mac[TCTL] & E1000_TCTL_EN) &&
+        (!vmdq || core->mac[VFTE] & BIT(pool)) &&
+        (core->mac[TXDCTL0 + (qn * 16)] & E1000_TXDCTL_QUEUE_ENABLE);
+}
+
 static void
 igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
 {
@@ -793,8 +805,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
     const E1000E_RingInfo *txi = txr->i;
     uint32_t eic = 0;
 
-    /* TODO: check if the queue itself is enabled too. */
-    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
+    if (!igb_tx_enabled(core, txi)) {
         trace_e1000e_tx_disabled();
         return;
     }
@@ -872,6 +883,9 @@ igb_can_receive(IGBCore *core)
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         E1000E_RxRing rxr;
+        if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
+            continue;
+        }
 
         igb_rx_ring_init(core, &rxr, i);
         if (igb_ring_enabled(core, rxr.i) && igb_has_rxbufs(core, rxr.i, 1)) {
@@ -938,7 +952,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
 
     if (core->mac[MRQC] & 1) {
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
-            for (i = 0; i < 8; i++) {
+            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
                     queues |= BIT(i);
                 }
@@ -972,7 +986,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                 f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
                 f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
                 if (macp[f >> 5] & (1 << (f & 0x1f))) {
-                    for (i = 0; i < 8; i++) {
+                    for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                         if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
                             queues |= BIT(i);
                         }
@@ -995,7 +1009,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                     }
                 }
             } else {
-                for (i = 0; i < 8; i++) {
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                     if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
                         mask |= BIT(i);
                     }
@@ -1011,6 +1025,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
         }
 
+        queues &= core->mac[VFRE];
         igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
         if (rss_info->queue & 1) {
             queues <<= 8;
@@ -1571,7 +1586,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         e1000x_fcs_len(core->mac);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
-        if (!(queues & BIT(i))) {
+        if (!(queues & BIT(i)) ||
+            !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
             continue;
         }
 
@@ -1977,9 +1993,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
 
 static void igb_vf_reset(IGBCore *core, uint16_t vfn)
 {
+    uint16_t qn0 = vfn;
+    uint16_t qn1 = vfn + IGB_NUM_VM_POOLS;
+
     /* disable Rx and Tx for the VF*/
-    core->mac[VFTE] &= ~BIT(vfn);
+    core->mac[RXDCTL0 + (qn0 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
+    core->mac[RXDCTL0 + (qn1 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
+    core->mac[TXDCTL0 + (qn0 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
+    core->mac[TXDCTL0 + (qn1 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
     core->mac[VFRE] &= ~BIT(vfn);
+    core->mac[VFTE] &= ~BIT(vfn);
     /* indicate VF reset to PF */
     core->mac[VFLRE] |= BIT(vfn);
     /* VFLRE and mailbox use the same interrupt cause */
@@ -3914,6 +3937,7 @@ igb_phy_reg_init[] = {
 static const uint32_t igb_mac_reg_init[] = {
     [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
     [EEMNGCTL]      = BIT(31),
+    [TXDCTL0]       = E1000_TXDCTL_QUEUE_ENABLE,
     [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
     [RXDCTL1]       = 1 << 16,
     [RXDCTL2]       = 1 << 16,
diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
index 8914e0b801..9cbbfd516b 100644
--- a/hw/net/igb_core.h
+++ b/hw/net/igb_core.h
@@ -47,6 +47,7 @@
 #define IGB_MSIX_VEC_NUM        (10)
 #define IGBVF_MSIX_VEC_NUM      (3)
 #define IGB_NUM_QUEUES          (16)
+#define IGB_NUM_VM_POOLS        (8)
 
 typedef struct IGBCore IGBCore;
 
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index a658f9b53f..c5c5b3c3b8 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -160,6 +160,9 @@ union e1000_adv_rx_desc {
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
 
+/* Additional Transmit Descriptor Control definitions */
+#define E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx Queue */
+
 /* Additional Receive Descriptor Control definitions */
 #define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx Queue */
 
-- 
2.34.1


