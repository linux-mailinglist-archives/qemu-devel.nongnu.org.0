Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E046D67FAFB
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 21:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLs9y-0006aT-EQ; Sat, 28 Jan 2023 15:50:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9o-0006Y1-IS
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:43 -0500
Received: from mail-db8eur05hn2032d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::32d]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9m-0005Ml-MS
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHXrkEEk3CIG3QJlGiTcRgx89QTcCcDslnJi1HnsvErFtic7fUDD+aWu5eny/sy+7FbELlkOuI8ijuMCb8Nml3dqzIfvSeBS9onpF2QuydHnMHiB8SuTJ4kQVaI58NRiWp+uIimDwJY9GtJhDkskB7aLUsP/KTXWZ/oEeVRe7J4nIjcZikRJwd4xMU4z9GGeyED3g7RKUOBB9rdcXDwDDEBiGXonNwSXG/bwfjPGK9yn1D2t5nrphbYLlRwNO8q6akewDpVCMBfvmS0cI3mGxc32mO6rx6WMlKjPnkbB1lf/yvfWllvXSSazW6WE/MzgVR+/fO6dMMpFXsp3bfdq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESIGRVOx2xbyiwxBP5061/0BbZ0qeXBbbA4XuvG19aE=;
 b=RLCZiLYMsINEuP7kV/hfRnXx017XXLlzG88q2JV/Sm6tOvMINPY/c69yO2IuQ6LJ/ec0xZA35UAVQWMhusrvaalWSpdF7NrSDDFRr7F1GnmYmnO3TZmmuGeeCcjwB/N+7oQXjd77YDHvPXeDF+v5vXseAIhmtqJJluh72RYpjXs4ignIA27lx/Up5jB/eyD5iGwYVPIJhwd3/i7FERj0WekrB5pGZ43EfrulOnq6bIyB50yoREeS70MmPiHSihLNm6fLB0WFwwMbiLJtvZYJXneJL1PkKCLf6CVNOPi9cbfqINP15BQ0xi3ztRqz57QJxON9psWgiB6rshck3Vt+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESIGRVOx2xbyiwxBP5061/0BbZ0qeXBbbA4XuvG19aE=;
 b=D1j51byRx2RGemMXUQYKe/lGmwfRraYCpN+SCfXI4HPY4JWtZkcN5NZLuEB9fzyD3Pxi2cVlQDMDz1Xr+RcsUcwPfJ4xLao5YBJlKjZvOeIeSYhazi0HP3Pczq5GXFyWoJaoc4PXedYjjFztY+6nfIl7vCWab62rplIQ0NOVajE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0661.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sat, 28 Jan
 2023 20:50:21 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 20:50:21 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 5/9] igb: respect E1000_VMOLR_RSSE
Date: Sat, 28 Jan 2023 14:46:29 +0100
Message-Id: <20230128134633.22730-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0038.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::15) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0661:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e981d7-46fa-4735-4bb5-08db017144a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lb9k2chu/wj/NcH9bzdjhb3zehv5VmanhaTgSCjHw/OiG8snWRQH/AYMSGyYV6ILl6vPiXNnQg5iT4uEa3px+sRWgJKmYzqYIvUq0IlThWona/fAzoCcBxGvCCjJx//1X3xdMElYFxjZhhDDbfHMFo/dOXvnsWYOXwdQ8jyGeAsYrJPEqaM4TmmdsoQwifuxp+xJJEZ35TppZePxNiR8gHgRL5VZ/1JZ6jUR6SjbDN8gm3fsamyJ+XCpiPVJlMoSPEILWjxFqMQtB8zteORElzJdX8wpgLsRjna2vxHdKDvy4ICjsesoCqQ+9ZaqGuaMJo0n/BS56vZU+xYdWW36G4OFzqMRTN3K9GNYRGGJeXrPer61NPIYNbniTCZPqp1tL6K/EZ3w1a6oOOqek7rMIOLkWZIqdI6mq3SC6qmp7J67JbjjZ3+3IO7DUdU7eTirlvsyNSo5zBXAcL1a67rn8MQCmC6uF+EXx1+KOBUPg4F6NHYZB4zqIoZANcHzF1+BJKt54bvuvirRpfJZSj6PMAUU3r258SJxidyKKJ+DCsOuJ6L8WANg6SNIvxnwhswMSRbUE1yJ4s5rJiNu8nw/oTVcfhvn/vwbotlEo8iDM0JTzIyhO7r8/nE+riwdFlQvbfV6aIY6Z9zzjZHkuU4a0qT9uDllxd13wLV73RlWktb9dy2YmzJWte7aLXCG33gATdVAndT/rIBVdSwnauJHcG5fFc7UfUKqrHjWaN2Ec8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(396003)(346002)(376002)(136003)(34036004)(109986016)(451199018)(8936002)(41300700001)(86362001)(2616005)(83380400001)(810100004)(38100700002)(41320700001)(316002)(8676002)(54906003)(36756003)(4326008)(66556008)(66476007)(70586007)(66946007)(1076003)(6506007)(6512007)(26005)(186003)(6486002)(508600001)(44832011)(2906002)(5660300002)(266003)(37730700002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JF2TfVVv5B3aP5iKdi9gxHnNcq55izpb5M2ijCEY+wdUuND+sjEEvMOuUxe2?=
 =?us-ascii?Q?Rfm/LWrpBvgLdxrmzTFNVzKm2GNfdrgMGfJzk5Eh5WQPKPeqs6/VKOqgnEGT?=
 =?us-ascii?Q?Nd+H1GadoCf2iY/xMJeG4/RX4JtHpl3Sl1lHKwhKMV0+6v3VSg/ua85iEL8J?=
 =?us-ascii?Q?+SMhnj+GY8kGLl6RTauqSVeIfBCzy2u5VEMKkhdPBSgXocV+JQVJmLpr+hh+?=
 =?us-ascii?Q?4+U8e/TfFSDvci2oxSpul7ojYOHi9xX3NX1O1z2iTUIPrHXc2FBX70yz9QUK?=
 =?us-ascii?Q?Hi+1ipdKNwfxsEd70d8k+xYxtlHhil+1XwTcQltvVrNGhDKjp9LG3GQoNHXE?=
 =?us-ascii?Q?0wmyMPbL4pMB2uOUpljR7RfABIGYkO3+nGCrOR9vPRMd7HI9UWAERTeaNwWG?=
 =?us-ascii?Q?OK85MgcO5HkMbyppr/BXLC/uSdKlgos0uluksl+758y7jj/YMBnXYgd3bj3F?=
 =?us-ascii?Q?YbquUQSYlUQj9bTD6t0CZQ6a5ZTMDaGUzLTT3GKKWAnZg+oEurzm5xu7r6u+?=
 =?us-ascii?Q?k4CK0koeudQPvReKYFIKub/+1lXCtMg8tRMkcCiw2auu5xb4zWPqEvT+E2M4?=
 =?us-ascii?Q?ISlzhn8y6+iitc2gTPIQ3WcSPkhe2if3UqE0xjruXF8c2j0q2N4+Z9Lzsgb+?=
 =?us-ascii?Q?0n/CHVoFtjy6T/8opxb+pnRmQMFZ4is4YJFwP5gJv8rahBzeS7dUBeMZ5yLx?=
 =?us-ascii?Q?ebxnkCFl0p/YRbUyCh+/wQpSlgD2ukvXgTBSqESvqV2o+xV6lUIVeUduaU25?=
 =?us-ascii?Q?kn4mVw6xCXblSjkeoZMgIlJpViifEYqpWvhU2OXWqs/tnZMOoRawcKB2+wjq?=
 =?us-ascii?Q?lFELTqXhYmQdq/CKnWxm82cGVOz9nYlUnx0z8qLPYfjiYpY2ye+J65JLYtUB?=
 =?us-ascii?Q?ZEmp4Y6pVojvWcSu0L5x927Q4fE7psUDDBQ15qkKtBhpx1yhbY8vo0Sw3OEO?=
 =?us-ascii?Q?pti1IKiXa+tHXJaa6QOvEIYXYCsy72xXDwuuQuQ2jvSS+e9/DB1HQ/JVXyW7?=
 =?us-ascii?Q?vs7S1ydeF77G1mosjALdRTx6X6hnT5EFrEPwHJZz4XqotCX00VodYbEHEcOP?=
 =?us-ascii?Q?WGO8VuYlOWsQIP4SH5K3+psEWgjsPDYmObK1+lTzPaJDlr90iUPuM+KXzqZ+?=
 =?us-ascii?Q?ZY3G9ze6zggLbh5yFN44Sv9RoTOxsHCjBGC068UnncqbjElpdrnPdLdOQrD9?=
 =?us-ascii?Q?eCeMEfATqHhvowbGm/DOA38saDMbyFBAQMHs5ofeUVFTt/P/T/osTi9rtKHV?=
 =?us-ascii?Q?vYzOr8DXiICWVUpF7KtqCaqwAoL/g+psyoUzwFDNEq97PcXj4o/gKTlxxBvF?=
 =?us-ascii?Q?VleYUcsucBrFLVwtmebRudxvFSohQrkc7Sij1wpesN52rV7xYmHZWa5KFNgg?=
 =?us-ascii?Q?XN6EH+T7TLFMAX2BMltHFAVHrJOmfuy9iXmclGFGKn/Z+GKPT9R4aEBFdBYL?=
 =?us-ascii?Q?7Nj8xmmIfdR9Qsmlu5TiuZHYj4rQyvtaf3a+/zs3+A1ZI9amqulivl4CVZx9?=
 =?us-ascii?Q?0/bGjhoZgAAqlz/KCwwTRu56dHqeIW/0/CX5b5QYc3/r2YctULulAHl23siu?=
 =?us-ascii?Q?Oc7Sym9RJxJ1yt79mCovdZBs9mPXnzn2/04f2ElMVYnjPCdnTpBNi/jEryye?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e981d7-46fa-4735-4bb5-08db017144a0
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 20:50:19.9511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICF49kwEugOECq2ECGGd/YixZVYNEwAkIi//M0+Gpxsg6mcXhqzt59AVzfQYA6nm9w9tLAvRcWIdak9QZ+7Tr+IqkTC9tqM+R0f54qa8bdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0661
Received-SPF: pass client-ip=2a01:111:f400:7e1a::32d;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
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

RSS for VFs is only enabled if VMOLR[n].RSSE is set.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 1eb7ba168f..e4fd4a1a5f 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -69,7 +69,7 @@ typedef struct IGBTxPktVmdqCallbackContext {
 
 static ssize_t
 igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
-                     bool has_vnet, bool *assigned);
+                     bool has_vnet, bool *external_tx);
 
 static inline void
 igb_set_interrupt_cause(IGBCore *core, uint32_t val);
@@ -942,7 +942,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
 
     if (core->mac[MRQC] & 1) {
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
-            for (i = 0; i < 8; i++) {
+            for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
                     queues |= BIT(i);
                 }
@@ -976,7 +976,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                 f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
                 f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
                 if (macp[f >> 5] & (1 << (f & 0x1f))) {
-                    for (i = 0; i < 8; i++) {
+                    for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
                         if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
                             queues |= BIT(i);
                         }
@@ -999,7 +999,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                     }
                 }
             } else {
-                for (i = 0; i < 8; i++) {
+                for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
                     if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
                         mask |= BIT(i);
                     }
@@ -1018,7 +1018,15 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         queues &= core->mac[VFRE];
         igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
         if (rss_info->queue & 1) {
-            queues <<= 8;
+            for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
+                if (!(queues & BIT(i))) {
+                    continue;
+                }
+                if (core->mac[VMOLR0 + i] & E1000_VMOLR_RSSE) {
+                    queues |= BIT(i + IGB_MAX_VF_FUNCTIONS);
+                    queues &= ~BIT(i);
+                }
+            }
         }
     } else {
         switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
-- 
2.34.1


