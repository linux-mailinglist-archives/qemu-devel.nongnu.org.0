Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E1C6C4662
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:29:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peukm-0007No-N8; Wed, 22 Mar 2023 05:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peuki-0007N7-Nw
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:28 -0400
Received: from mail-vi1eur05on2072b.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::72b]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukg-0003Dm-2f
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iorzgkvt069eONrfEl3rD3CSYDXajGmTwUxs5/kBWS3ECubZCl3y0fTyKRMLbCyKh6o58mJWZazhTgVx+BCJjbvrHyDN4j5SXnslPBQYb3UNLYuuwu2h3wRvrTZv0rUh3akwsgkHqbasy8ADAdkeZOuojyLqyoIJL9E2T4o1Wmt8Qw3d4h6BI30Bvm9LMV9M6ib3O6/N2HVP5uP8hZwl7B8RL554Nb7EqFzFlTY67skRWavXZHhC7+Up0vo9e+9tDXZ2HPztoBpUMgNJ6VEuzWlY8RMKcXdtOUWC8ZW9W2uGx6/1zryvlWtjmV7yvhg05hUCi17AvYPT0M7S3+VMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbXi93qTVSHOf/a0KB37m5UqBDg/T1Qq3mBNzfrEJyA=;
 b=O2pkrh/iB3+ybL0tZyZndk1tjES5ZlstPpI4yIS7c0HWvRM5alPzIsEzJvVioWWWhe8FMbNjXIXpE+qDv3mpoeNK1lMFSq7JZtLL9STV4h+/IsUEMsECV63+rgNGbGRM5gEzKmPWpcgTCihzsfld8olalYOnb+ykjnqzuGXWwdPqIchBYLZYybJJxw041JB/VZD672a4mu5boigkjgufM+vlS4hJcX3lUO1CEmjjH+3hjuI/iqTAnT5QgCPJXir3KBTXBn9XLj1O1WrgoHTRj3irQPy2YjmFXkicRN5HUJ8APirBX9ncu7Z2uq+LyzB0mbceKBckzc9sfezAHKiJ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbXi93qTVSHOf/a0KB37m5UqBDg/T1Qq3mBNzfrEJyA=;
 b=cknJHeu4wDaajWatywrd1x1C4C75Bl/yq/MbQFvJ+NYFuLGgf0FtfB6eqnpz+Dklbob3YTVfWjZnxukELIWlnVCeL2LqFw1JuHkgqpxTHdDCtCQlJUlKQ4IRVZTfTE+XCqaZXJeeLMEurFmIBrXcWH7s5TB+BK+71Y0w7LDAwk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:27:12 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:27:12 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v8 8/8] igb: respect VMVIR and VMOLR for VLAN
Date: Wed, 22 Mar 2023 10:27:04 +0100
Message-Id: <20230322092704.22776-9-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
References: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS6P279CA0141.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3a::17) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: e7deb36d-0c26-42cd-2887-08db2ab79dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vk4UiB9KH5dz5WEWoLkAP7o4kIRXis/6vwlN48qpLohPVIWL/HGJDEUt+Fn/WLeOqZbBfmgQLa31kAAwBUGFAkDPxKxEeD+772FKjMAupCeTzyDvYflq3jVQu2e3YiJhaCIJ6fAxXk5gR8EA7X5Fbte8t2gX9DeUgyVEx5X/s2u2nbBrOwI3EPRdUmHK2v4Lg6DwE64LNCp3YKghO1JLCCwmlrHbaIQPBuv57Fmmvrjgoyn3OoH56zbom41+xAzG0HpDK5ow8Xvdg9x0vZjB7uVvpS//+PTyWuu/cLxX+QfkYp9bwcSZ1UjOIcuAlr2/rSsmUOmwkjrlIGGU9z2JEMOCvUWGTWjb0txkS6k3YhY6t5y7cyDDkUVXZFXmWkkxEuylbEVT192z8/0xyAZ5KpCkSzfw0hsW4AUCGp8gU/+wNR0NO2LPCArk4jw10jBnhlCINvLwgWV+jAk/7glfZ8lhu45n2+Y+9+TKDl/AOWO3TipLMJAeGLkkTd0qZYE81QaaIQP4tEWFsnOq5E+17rCxHguREcRU00kJxsfNiLRikQyrKENSEEmN+gWgEEcSvpfxnLcfTcNox4lQ3z9LsWle3v7tkcuJ6AYJY1kW3z7+eck072TAtmjBUrXLPjqtSVzCex3qG+1cCZGO2ZUauYdB1aAQuFq1qWsqRwNOmiFkzcAjAaYG+uXFGD3mYoj8iK8CZUnAWyAUGocX1T5uA/2sjQYfNnbAi5FDUD2tIfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39840400004)(346002)(109986016)(451199018)(36756003)(44832011)(8936002)(5660300002)(41300700001)(83380400001)(2906002)(2616005)(316002)(478600001)(6486002)(54906003)(86362001)(38100700002)(1076003)(6512007)(26005)(8676002)(70586007)(6506007)(66476007)(66556008)(66946007)(4326008)(186003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tjOkgrcGd47cEPSIs3uERRJHoFclS0asv46VRTxqCX1Ix/GKHGBzE3Tgtg6S?=
 =?us-ascii?Q?50lvw8WLxxG5y9EBIkVqwnTUmdFxnQvk0/1ojuoTygFP14URJW4SWx8a/pJE?=
 =?us-ascii?Q?ZMqbq0xlxnUXsQTGoPt9Cthvx85RJrriSe5OQoSt4gJ0H+uVGbPh3+2YpkAs?=
 =?us-ascii?Q?FGfZRxN+tj37gqo/WLgRwpwJ3jO9hvDQQwX99xfwOwS5vJJRnzJO5zelCfKa?=
 =?us-ascii?Q?mb7ubZpS7o2xlPfua2KMo4uKgTCpYKZ8RDMVbKkF2eNKrWBa1dsyhQOLv4yC?=
 =?us-ascii?Q?S5/E812ULeZA0G3TTOL+uTGPqroac95pFUsGnWcm4Efv/Rph0d+KI1DffOv4?=
 =?us-ascii?Q?yA0rYaSTXxQ2k+L751CMZu9v+Th5oNAJ2eJUkN84DGZR6ig9rJHh3WrOx3Jh?=
 =?us-ascii?Q?0nPmadY8s7BQlh2BEus3lSvJth295NRaQZJqPlQBFdKtSboSQ1G7kqi5zjTr?=
 =?us-ascii?Q?7mnOXHIli+zzEZFbT7ObC14FOuiPBZq7h0ZnMn2zk8b5CoG+1iBteHsBI2dZ?=
 =?us-ascii?Q?gFh/pE4wAgEkrqX9fAZT89CA0Zse4iLtMgaQgMylc4S4gg9fjlwrUGkz7jVI?=
 =?us-ascii?Q?Ub5+i3c5AE6C9HjGW6wy2FwbkK+nIwUlh4Yy2vNUOGsOcMLeH7wQENn5gLtl?=
 =?us-ascii?Q?E6sJVQYZHbn8mkBmOCHlb8rRAioPyn6WKF4jg3SGIX5VzZORcZyMas3XRaWv?=
 =?us-ascii?Q?sJl5pMEtNsAnQZ6ZzIe5HKI9CXzMW3PVZCjVo52HroAf+z06ZxveEfad4lc5?=
 =?us-ascii?Q?eL3SEfBNUdjPFJPM7baslPYKIWtC6pwWx6jporDrNHjH74MIa0+pGi8mZ5AX?=
 =?us-ascii?Q?boT1Gw7OL1oExBmDpTAgoyqPOBmD6e7Fc2bk3kC5klzdGMt9H3TBruVVZFJ0?=
 =?us-ascii?Q?tWaGBTRvU9aGbdwrG3633qiDGwtmuqhcvmK7IogbzJHcKHu+AApY4mktCoCd?=
 =?us-ascii?Q?nAYny5BCp6IEgDd5qLy85uNY1MS57kfnyEjWNWRwTHolbxhM5FxwClITnmv8?=
 =?us-ascii?Q?9KAt6PXtDRDiWQLwFjv1vwv4Cs8o7eoccgO/Ik/Hxvs4QBjKhcwcS28+J9KO?=
 =?us-ascii?Q?lunrzNjOOiZ53rbagJ9h7Bg1T/5Uq6TXbRdXCtpdpNfypPQ4pECZLK4L0jmP?=
 =?us-ascii?Q?UHuf3VMjT5EEUmOhBq+IZBt6eIz4gczl3hFvUv0mDtlqiVy8o9qk08PRTFwG?=
 =?us-ascii?Q?5RGZvSP2Buc1m/Lay8ge+NOVDmiS1c1HWrrJ/nIYaSSzZGGtkCRxjgCSXUN7?=
 =?us-ascii?Q?G4AJSRhZOrftjOKXMBtLkKZCKcQkhg2KScdGiKONh0Ddd5h5lb8J4WdxAH12?=
 =?us-ascii?Q?mr+8igzF6EzOOX/k1yfWKRzXJcazMIcKmkpL8Y5azAbuWj6O8cNWNQYly8+4?=
 =?us-ascii?Q?JdovYCmvIsYRJtvVNCoR76wY3wtLGuamEyxim7BkrM9Hu31AWUHyiVCve4TC?=
 =?us-ascii?Q?vG2vzjhXU1PpKFS0K4kzVMZjQRa7KE0qsb6AVjRRN92P+YAa0aCKZPAHNdkv?=
 =?us-ascii?Q?3sk0Aphuo1qyrX0fL2/Sio/92LJBssvYwPj8bPRqCYC4PZMPPiMxwo1MlsRi?=
 =?us-ascii?Q?xMdz0CAJP+ZBeZmeDrbThZxJZ0Lll7fMANEWB4DQUGCGGZv5A8zVosNQSPc9?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e7deb36d-0c26-42cd-2887-08db2ab79dbf
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:27:11.8395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdo4jL8mENk1JMQgrCGDKMgRd11uAofbeLkEFSir7T6mzIMiQ3OLtzpMgALhmGqSmxnQfPdHiWNpcyr2Opp4h1bV4x+D7IVYy51jO5Z3feo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
Received-SPF: pass client-ip=2a01:111:f400:7d00::72b;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
index 7e97a01d66..572cae10bd 100644
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


