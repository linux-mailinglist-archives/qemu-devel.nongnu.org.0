Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10376C4CAD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pez0k-0003mG-F9; Wed, 22 Mar 2023 10:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0i-0003kB-Jr
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:16 -0400
Received: from mail-am7eur03on2071a.outbound.protection.outlook.com
 ([2a01:111:f400:7eaf::71a]
 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0g-0002CS-TV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOdAuX53ckKBc9p4tLb1YNiEtvUtxhFurKNJmOuLm6pvF3DDTSUvTDPqufmeKSYAv5JpVlKpQCnsbXrCkYEiekKrXFLGhcsL0Xt6/h1B29fWylM6s8ahr/gq/td+bvGpDj48unXCV3104gWCoNP+JtfBSfjCDLNAyaESnh7ufTbMRC7VYHJmUmrN4WjHRTpbChpCXdOPd4R3Nya49XE4nWscUHuw6ZqsRPY0hpd+tYl3a2F63M3iMMCKlUOZQXjRnNelVc3xQre+M/4MOFtYL2bBjF/pGfvfIyoZzaaSQmSHV8Zw7G0WUWtjq95x/S5/wmEDbeYDE/ZXDwlTAc1DDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6TEj3Uu+6QqRf4p2mP3LSzNHk++xlQuVySeEM4g2ak=;
 b=XVOc3aM9dWBNoLACeL3UzTKGgngnRcT/lg6QDH9q6eHyTCZOizOWvPUxaDeR+08Y+GSAoHDpyDFiAlcLjBDCtwGeRZIMWur6f714F82BAB/BBUmfmM5yzzWZG9Fz37Hx1kQrJi1cndHRhcBZT2xibH4kjMcXxcOh9BIJzHEvaLlx7heCSd9VxLfYyyvrAoI7hZ3NcJw5QNforCoqQx3wkmZ45xaNfxh2RsMWwyNoM1ESN/Q7DyssUfVmGAm5hD1vbjNzxy1om27S0W7OxVcCMp3WNpRWYk8F+7jbT2j3eHf5OZdVM+4wn4xOLzFQswWWZFIF+5sWtsRxKhEhzRrcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6TEj3Uu+6QqRf4p2mP3LSzNHk++xlQuVySeEM4g2ak=;
 b=frrprgLMJ6/3MLDGps4ZA9ZgYUfPHQb0GjnAT2+ul9SGkuUo/DVp6TV6iLU+kG0o9ywO444yxI6xOVxOmtWMKjHn769YhZNLWFZLlw+C1qDWvcQKoyCImRlNw/ZwSQJ9ozvGLDmbqpcPpH3enXtvrtMulw0VLYNOwRMpNIy2Uko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PRAP189MB1850.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:27b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:00:05 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:00:05 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v9 8/8] igb: respect VMVIR and VMOLR for VLAN
Date: Wed, 22 Mar 2023 14:04:40 +0100
Message-Id: <20230322130440.26808-9-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
References: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0112.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::23) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PRAP189MB1850:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f97594d-730b-45b9-8714-08db2addbbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KCK5Lt2ih3li9TKJ2zsJ8LleyckbUnIC5ODKA2Gyidw8jZRSuBXuREdcCjpslivup0yCm2uvKHPTtmQTNHMUzbgkYIc+6gxb406aXHRnPglRMALaIkiSRmtFS7mkHsM9YuRmFjPW7vwN800wYVW0afPK9w+SJAmeM5j/rfbWUE6ChoUQQiiy2mKrJk/T3wlOaUe/2A3S4ZZ1inYG03u6mB2wcm/m/HUVMQt1epjk0fXcWylIVEGpVajAnuvIqcsplsJOVAnDN4EPd1L9tcHOsU0h+m3CUikUBF15pJAtFy7Q8KV71GwFUUg5pIT6rDeXCmS8kQOaIuaPAHpc0oHFMpETq4PV2086P/GmwX2+Swh+gPh3MsI7l7WKpgBZ5kUjDKqxk067GEoOTK5EdeKuVccEYwPpSN5R0AxKHflxtl4TUmvQjKvxQ632J12Pb7lSFVGObsEuDXvkxSertMx7qhbR+/No/IFbcaesTw36CiL/VqQjrVTz3yvHWuXxaHZ8KSw29YGEdo+p06KuX3H78YPgAjGXvP72sOGWysqEquPKOM/bNGxUcR7mb4l+RPEbP63Alnz6JaMB9+drdHGrImMNEFWB6p61ABEiwV7vnHHkJ6ZpGMdLktqrrL5WM14uygfY4y5jdniLBZS+7n0eFLeOGYK4JCi9IiX85aVvMp/xiPwKFJyxN/7r/xCBGf4DEMyUNT9HFCqa2U/VmznyYaV0lUdDpL26b0LeqTz4a8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39840400004)(376002)(346002)(109986016)(451199018)(86362001)(36756003)(83380400001)(186003)(66476007)(8676002)(316002)(4326008)(66946007)(70586007)(478600001)(2616005)(54906003)(1076003)(6506007)(26005)(6512007)(6486002)(6666004)(66556008)(38100700002)(5660300002)(44832011)(41300700001)(8936002)(2906002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gHE59WQep1vP7pDe6eXAUaQ34Dm4yRV509i/Rd+WEqJz4hIu63Pkn8zNefvE?=
 =?us-ascii?Q?J2uzB34aOO52Py5vQZ7Evny6SrTN+5MzSF3XEpvLExeT+KMo5bls8MYdVlf5?=
 =?us-ascii?Q?91YAjKF7g/y9rT50MgVRXWTOBXzOZLGKp0H8p7vap2wZp2DDsEMEWEoM6xEI?=
 =?us-ascii?Q?qiBm3GtpquBN+uiL8R3TO8SJ3pe48NZrtXBWX7bz9sdrkYvx9wJAPt57hdda?=
 =?us-ascii?Q?oMmMxXyfEETBZ+pYv3/h/nHVXN+HQX+BjC2gmea261Nc93hH6KhDjzlXzwpw?=
 =?us-ascii?Q?T8OT6saAKg/c84VUulRyHRUrF0YfJNJykZRSVutHBOnkiB+HnX/HuusW11hq?=
 =?us-ascii?Q?AwCXdgCFy8sSioiYw+fiHqXWnoEWGy3a5DjhhFhwjBrfXIndZ2SCSWiCi0hV?=
 =?us-ascii?Q?ybXSZJ30KNrK7rHCoxJ2+BOrRyhTjsFR2R/kR/wdvn0LElTkd3ACOfIF4DqB?=
 =?us-ascii?Q?i+mJueNyOFaUbvF1uxjg99PIRsyqunx6wkiRT4ABTHtA3vAt0Zojjr4vLvJH?=
 =?us-ascii?Q?kFkDZJkGRoIfZAB2LBPq265c9mSwKYsPHKEzTIawnpz4SBjjj1Ymjc/nPOGK?=
 =?us-ascii?Q?Pg+ZDMUHpvTVC8Xb161pYpDZYGTHrO/QcfIhZsGpDKdzKPYmcBvrrPtX5DcX?=
 =?us-ascii?Q?kM/8KHPEN6S7zNzgkC6eRRiHy82RiU+Qe5DPm4bo9FAffIaJQClIRaCIOI7r?=
 =?us-ascii?Q?306khUykus6lWWypRZzydZVG266VY0GzckDdInp+SDf886m0vFr6c/v9Upal?=
 =?us-ascii?Q?WxW/oNVxVAizIkjxOFoBIdCdpheyuWzPmarQBb7y8C0nRE4HWMK3Budnl56z?=
 =?us-ascii?Q?NLy/H0MhnglOSeY7JJ5ieA+L6jXC1eohNTTYX5okuNpGPcr02ik3509iAaGQ?=
 =?us-ascii?Q?qQ7itqgY0VFY+oup8uVMkBSLDqWaMbc6GeboXGTIKe+8QcQR2p8yrjfrNwAs?=
 =?us-ascii?Q?0j7pMm7uUdNaPLBnhVSL52ellhzxDBIAbpvJoAJw17JVJXCjWE+eN2q2pV+z?=
 =?us-ascii?Q?vSSuAicrohg87BMeeHCQrkJI0viuwFcF0dhlX15y+1rHB1YsOSK2e8n+2PHt?=
 =?us-ascii?Q?27LN/YpT0XP7V01l2p1H6ttYDIB0hBsquhcxKt2M2FdHC6bmoCEix/g5lQ2a?=
 =?us-ascii?Q?DGc1xIkrPetzs4exFKwMg4LJP9Ry5jR0kKs8VYm9mYEqPBbh1VutQ4RWhK4m?=
 =?us-ascii?Q?Anw5G7esHeMw5bqpqp4RiHLJiREH5cHis9zMXgobl1xiNXb+Za1Ct4Ukgfzp?=
 =?us-ascii?Q?Gsy0ThNTGfCzXpUscm7SxmmcP49Oru0Sw46/yO2ZlGBueDkiwi8yQYHky1rW?=
 =?us-ascii?Q?wZBifrvfoXIdqjuxsZpQlfOvUPJw6whmuDxzSU4G6PuvptfrIh5G4vKwpEEb?=
 =?us-ascii?Q?g0lQUK5qsD2VKvyWexjU6FzZW2CHVXp7GIQFNvcpH5uNTcDlJJz6r/N1HWsl?=
 =?us-ascii?Q?C/bUuToBe6K/CiTA1bWaXahCQYVy75hAdOYmtjo9F8mRux9DFFiOlrPE0+li?=
 =?us-ascii?Q?VgmmnMOa+ENIVJkVnfvdIHhAt21ZLLe8HbKYJw1RcqDBs7yYUQohWUauVJL8?=
 =?us-ascii?Q?RCoYwng9uypskx+pzQXoN75iig95rTJodZTfVbE3Q+ODvApV/aJrHV0oK5f1?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f97594d-730b-45b9-8714-08db2addbbbf
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:00:02.9868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpyOWH40XsQBoay+icRQOr+spBYkzSZCkNgTzl1VWu9rofvTJ3QMnEraxtHs+hU0V00RgNXjXnpI7IWCDer1003brfrQGVznV5hOLzvv2/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1850
Received-SPF: pass client-ip=2a01:111:f400:7eaf::71a;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add support for stripping/inserting VLAN for VFs.

Had to move CSUM calculation back into the for loop, since packet data
is pulled inside the loop based on strip VLAN decision for every VF.

net_rx_pkt_fix_l4_csum should be extended to accept a buffer instead for
igb. Work for a future patch.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 62 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 27bb4a55e6..52ea2b16c8 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -386,6 +386,28 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, bool tx,
     info->queue = E1000_RSS_QUEUE(&core->mac[RETA], info->hash);
 }
 
+static void
+igb_tx_insert_vlan(IGBCore *core, uint16_t qn, struct igb_tx *tx,
+    uint16_t vlan, bool insert_vlan)
+{
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = qn % IGB_NUM_VM_POOLS;
+
+        if (core->mac[VMVIR0 + pool] & E1000_VMVIR_VLANA_DEFAULT) {
+            /* always insert default VLAN */
+            insert_vlan = true;
+            vlan = core->mac[VMVIR0 + pool] & 0xffff;
+        } else if (core->mac[VMVIR0 + pool] & E1000_VMVIR_VLANA_NEVER) {
+            insert_vlan = false;
+        }
+    }
+
+    if (insert_vlan && e1000x_vlan_enabled(core->mac)) {
+        net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan,
+            core->mac[VET] & 0xffff);
+    }
+}
+
 static bool
 igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
 {
@@ -582,12 +604,11 @@ igb_process_tx_desc(IGBCore *core,
 
     if (cmd_type_len & E1000_TXD_CMD_EOP) {
         if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
-            if (cmd_type_len & E1000_TXD_CMD_VLE) {
-                idx = (tx->first_olinfo_status >> 4) & 1;
-                uint16_t vlan = tx->ctx[idx].vlan_macip_lens >> 16;
-                uint16_t vet = core->mac[VET] & 0xffff;
-                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
-            }
+            idx = (tx->first_olinfo_status >> 4) & 1;
+            igb_tx_insert_vlan(core, queue_index, tx,
+                tx->ctx[idx].vlan_macip_lens >> 16,
+                !!(cmd_type_len & E1000_TXD_CMD_VLE));
+
             if (igb_tx_pkt_send(core, tx, queue_index)) {
                 igb_on_tx_done_update_stats(core, tx->tx_pkt, queue_index);
             }
@@ -1544,6 +1565,20 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
     igb_update_rx_stats(core, rxi, size, total_size);
 }
 
+static bool
+igb_rx_strip_vlan(IGBCore *core, const E1000E_RingInfo *rxi)
+{
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = rxi->idx % IGB_NUM_VM_POOLS;
+        /* Sec 7.10.3.8: CTRL.VME is ignored, only VMOLR/RPLOLR is used */
+        return (net_rx_pkt_get_packet_type(core->rx_pkt) == ETH_PKT_MCAST) ?
+                core->mac[RPLOLR] & E1000_RPLOLR_STRVLAN :
+                core->mac[VMOLR0 + pool] & E1000_VMOLR_STRVLAN;
+    }
+
+    return e1000x_vlan_enabled(core->mac);
+}
+
 static inline void
 igb_rx_fix_l4_csum(IGBCore *core, struct NetRxPkt *pkt)
 {
@@ -1624,10 +1659,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
     ehdr = PKT_GET_ETH_HDR(filter_buf);
     net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
-
-    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac),
-                               core->mac[VET] & 0xffff);
+    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
 
     queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
@@ -1635,9 +1667,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         return orig_size;
     }
 
-    total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
-        e1000x_fcs_len(core->mac);
-
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         if (!(queues & BIT(i)) ||
             !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
@@ -1646,6 +1675,13 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
         igb_rx_ring_init(core, &rxr, i);
 
+        net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
+                                   igb_rx_strip_vlan(core, rxr.i),
+                                   core->mac[VET] & 0xffff);
+
+        total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
+            e1000x_fcs_len(core->mac);
+
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
             n |= E1000_ICS_RXO;
             trace_e1000e_rx_not_written_to_guest(rxr.i->idx);
-- 
2.34.1


