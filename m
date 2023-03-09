Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9D6B6BDA
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 22:47:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbTVx-0000QT-Q7; Sun, 12 Mar 2023 17:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTVw-0000QB-1D
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:00 -0400
Received: from mail-db8eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::729]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTVu-0004XO-F9
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:45:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emv/7gn/azVzcYpjfbR2tk0tkeBQprw+i+o4qaL3//uM0LP+Xa3Lbbs6Q886GEw9/wY0+lOeBoAKSoaeqZ6gFQ1qrzpiGbQCzQi4QH0DbdVdlN2zGxe6qt1r2Qru30vPVfhFC+u8J+IrnSpbu7ch/BrRg8f8EonlexHf3uCaFiC7cuH5syCG4DZx53Q3WfOqRS3lGm9+Ar+ecmawZpvGK0o6Xn+8cMRj0aJjvfEZubVUTKxCfpGNVQYS3o5bXW1r4uQy2N6FQIVqXdh+qs7yUKXYqVW0H5l6KC/os+Cy2myR76DCrLgkGxYkiur+kvTB6VR948dDGdcwo/ZkxdW1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjw6w5OYK5BGvWXLFqgHM+Lk1D8yia65Oi5IyIeVk74=;
 b=d4hALEZx5VOZuMzROBeTfLb431dX2EU3imTPN8d06dXn/B2lU7RmBJ4SmYccckje01mjcA0lAqD4B8tTNDBb1zSWrNMxcyLACo5Fo+uOtGmHNpguFB7hyp9fIe8o232UXOiynol/9iz/qN6Jynzp4B4D6lvcn6lYmSMro2CPQ0FDcOZnk35Kkl7OUHn3Yvi4vPX+1XKp+BVNG1h3ItPOf72KRLOYjD/NBTdEcjFrdeuI8RL8cx8WaWL8/ftkQyjZjkMCXgFuHpxgCltFtYW4c872IZ2RRMEDVQXFZVUiJA4/nJd66wV+AIiSkK5IO/KgxxeCkMqTD77YU7+0PXoE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjw6w5OYK5BGvWXLFqgHM+Lk1D8yia65Oi5IyIeVk74=;
 b=F+ZCH9B4DfR68t8GbwzX4beAKWSzC7iia0e4q9mi/NY+mYPn7IUoJj1VIFUUCVz2oF3mrSWfMeHnyLBMOJdynf0QwOVy1Jcfib4noR0gFWdAtmR8JtSilx4lMlX/AY4QtL4Ig0wM2XdV3Dad/IJFMUMMYZ32QBZqnyDQSYHmlh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS4P189MB2207.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:58e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 21:45:44 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 21:45:44 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v7 2/8] igb: handle PF/VF reset properly
Date: Thu,  9 Mar 2023 23:00:06 +0100
Message-Id: <20230309220012.25642-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
References: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0094.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::7)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS4P189MB2207:EE_
X-MS-Office365-Filtering-Correlation-Id: 3990fcba-3af0-411e-bcf0-08db23432151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b4CqQEVlPtOJlTjK9NgAutjclV8PpxjHHPfbd2oFMipmxyGN6yjT+PIP5KHf478DW+rE3BbgYSCZnGSqn4Y+E49JNf4xHaWLdyKCFMBTUzkS3BsJIMxzGzvr9VuYaeBS2qlR8Z4HbRpdT64KveAVrNAjwSJTNP/DYyMx3IuIx3Jf+7o/U1hJV2iPiv5fmADWjAUMQ7ZHspfCF9XKzjD+hNP6jzeykiBTS0RvqyAvwJYNBGIu0/M0xqfRR1mYUtx9ZqWMMUygcszG3myN5aFcQrWcUDvhDkm1k+TpgpiQUTjsJQMX9u3AQI5YoiTjpQDjGPSM9wjIPdGk4Ec8czF2SV4raCvtHR9dd/N2Cpm7uUO8nKG6lrFj4RGxmFaDahLVV4IfLnUCFfOFKuepNYh8m0QLmnpVdnk/I/BFxnrYz7u0LPcxRHIxRJ26/FPAWAJ58RFWQZR2W76SbENt9lZdx5fukKmu3cGOFJKsDBaDp6jOz6XkywyjrxgM7nh/reEg/lcr82/TMsgPCUnWNAiTeqqqc65Ftsrn+JxfOzRas+hsYNL8TSKUQofuo+ZKz/0/9JgX5c6AVveFcg3rYDI5KloQbpffZsi2CuakKGcpLChURgttBJ7L9W5197S6DLKyJbdCbo2rIDv5vfVIVQcKN5Zw+fXcuMFA4CK8dfgUA/7aTP4/50uHuFsOD1Z093Y3CTPj6HfApOFFY+2m+h6/uIGDKSDytfcW8WZSc3eyAkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(39830400003)(346002)(451199018)(109986016)(86362001)(36756003)(38100700002)(4326008)(70586007)(8676002)(66946007)(66556008)(66476007)(41300700001)(8936002)(54906003)(478600001)(316002)(44832011)(5660300002)(2906002)(2616005)(83380400001)(6506007)(6486002)(186003)(6666004)(6512007)(1076003)(26005)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3eJSfduYq9bPu/G0B8xjvy7eUPFNMLUNvSdRB6fzq/h19Fx+o03NOpr37Kti?=
 =?us-ascii?Q?RBcqon9NxZcxvY4oovWja9gPNVz3LOOai6rws7yl4FBkJxP5cThdn3LvE15G?=
 =?us-ascii?Q?vBuBL12P6OiBb7ukntNx8e3GUW5iQDwHD3D2W6MM6cDd7IAlH8QYTfJj/4cM?=
 =?us-ascii?Q?Ji6Jbc/rkabnoMpLuzJvmRT1OCBU9hNIdcid3aeZHdbxI1S1TB1XY9jXu1at?=
 =?us-ascii?Q?a+12XIT9jXhs4Byc8brl/zBMJUnw8HLH9zcbrZMMGm1eZBtZQMNadTj5W893?=
 =?us-ascii?Q?TnGOE2v/7EdygQh/kITwmh0pfQ3eDK6ET+51USGVmAeo9TWIkcY5vAdnSKT3?=
 =?us-ascii?Q?qD6gUmod+pKAYqmXdcs5yIa0juA62lgvoOFWNxo3S03qdbVA8h7ChkwGjEUI?=
 =?us-ascii?Q?a4mYJ8m4FQan5Re63Te4zMDPcl8RSzQbJanT0bdRqZuYOAaNFZFd1lzCN5VD?=
 =?us-ascii?Q?Ffq+Fm//B/Tcm/rmBJm9vUbhFrBp0/Y8tfRUKZhRbaqRI0VVh+fpeg19Xxly?=
 =?us-ascii?Q?+QSA62wK2inVKHUp+gS0AIK0PmLs8O//HjMe4JMayWsZdbO//1bYzDWuf63U?=
 =?us-ascii?Q?NxUPpSGxBK18H4GmOKfKbwrsbP8qHlzjOpGAROBuwNP6r3ZxvLMMDOU3ClOq?=
 =?us-ascii?Q?1wjHLW+e5dtOYNDOPOnSA/WlSbWOdgNzIoSNOp6iLyhl7h9VOrKgPnts1SIX?=
 =?us-ascii?Q?cdKMXi0ej6Q/5fuTF0FFmJlaQDj9cIWF/PUzQGAoyKqoePA5e+pTVW7QkKxS?=
 =?us-ascii?Q?djez+8/A1WceL+Om/AMkdgiIJgxIKnMiGhxvbvjdT4nE4Kv/kGCMWN7BdpQC?=
 =?us-ascii?Q?28FatP6ydol25X8it1RFdgI4yBx9MJJYJtVPlZMMEEh9g+M0Xtaw7TMiNOsa?=
 =?us-ascii?Q?sbpk+2dX+mEtKIEZWMzujWfquYtYr2lkWuhlmpAlUXuzJ+3QYS0k5YATLtU7?=
 =?us-ascii?Q?0qfUXVzH8EHNSIWyYiziTruMMR8TOiycGSXF6lXq7SlKVpei+aojytUjP3T6?=
 =?us-ascii?Q?0e82K5ImqWs/9GWa9qAImsLDrWKIiMZq0OkWIAHtM5eUCWHalBRt2D2xshBG?=
 =?us-ascii?Q?WEYroNlvTIFguq7xoXqMjbsAFJT36cxqgCfK4FWFiFWa/cMbjPApyAG0CiIw?=
 =?us-ascii?Q?O+LuhyieZiVqQ/F3gmnoePBerHHzr25M5thgbvVK9HF1TEyzNU4AtuJ/VipI?=
 =?us-ascii?Q?i4y1EjJD8DP7y3Z16xFZYGjXaWrLlae+BwO5vFibbuyErxMnzGQQoX5bCwNJ?=
 =?us-ascii?Q?KqCfuGp8e6pkRqVqlXIf0GU5AM+Pus85TkEzKUpNmSpVRmUkd2uDaesKLpXz?=
 =?us-ascii?Q?/DL83IqCQ/4bqpaX61plxmiH6X7mZSG/wdLd8vNrGcMyjXYFsoB2x3aZRb7o?=
 =?us-ascii?Q?nh9nHBnMfc2HULsJ+V25vhAFdETQU0wvsfZNFGzIdG6ABCOeSvz44Dj5NPuZ?=
 =?us-ascii?Q?LAwv+cNkN5zuVwbft3HUZwIMYy+DKSTPBwy9OM38SA5bKXlkiFGD6mmob4XG?=
 =?us-ascii?Q?Hhr3ODEVkuJlyFu//9S45WAvHDyMhV6nUmjn5ZZxZ1tBfkDSHvZ6zMFa6hEj?=
 =?us-ascii?Q?Q4nP78g8ErXi8BK1KU54fAR1o434uwnlh7jGabf7R5xlIKNFTO9Kt55z58mm?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3990fcba-3af0-411e-bcf0-08db23432151
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 21:45:43.4342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+L0iXRFdvBj4khGp3N+gzXCpUgso3rkr/SorgToHMwvIOtF9HK2jA3aKWJpzru6q23Xdp+5vLgqq2yDNc2z90FDlXIjh3ouznbosgAC+IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2207
Received-SPF: pass client-ip=2a01:111:f400:7e1a::729;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Use PFRSTD to reset RSTI bit for VFs, and raise VFLRE interrupt when VF
is reset.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c   | 33 +++++++++++++++++++++------------
 hw/net/igb_regs.h   |  3 +++
 hw/net/trace-events |  2 ++
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index a7c7bfdc75..5eb83a56f9 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1892,14 +1892,6 @@ static void igb_set_eims(IGBCore *core, int index, uint32_t val)
     igb_update_interrupt_state(core);
 }
 
-static void igb_vf_reset(IGBCore *core, uint16_t vfn)
-{
-    /* TODO: Reset of the queue enable and the interrupt registers of the VF. */
-
-    core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_RSTI;
-    core->mac[V2PMAILBOX0 + vfn] = E1000_V2PMAILBOX_RSTD;
-}
-
 static void mailbox_interrupt_to_vf(IGBCore *core, uint16_t vfn)
 {
     uint32_t ent = core->mac[VTIVAR_MISC + vfn];
@@ -1977,6 +1969,17 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
     }
 }
 
+static void igb_vf_reset(IGBCore *core, uint16_t vfn)
+{
+    /* disable Rx and Tx for the VF*/
+    core->mac[VFTE] &= ~BIT(vfn);
+    core->mac[VFRE] &= ~BIT(vfn);
+    /* indicate VF reset to PF */
+    core->mac[VFLRE] |= BIT(vfn);
+    /* VFLRE and mailbox use the same interrupt cause */
+    mailbox_interrupt_to_pf(core);
+}
+
 static void igb_w1c(IGBCore *core, int index, uint32_t val)
 {
     core->mac[index] &= ~val;
@@ -2231,14 +2234,20 @@ igb_set_status(IGBCore *core, int index, uint32_t val)
 static void
 igb_set_ctrlext(IGBCore *core, int index, uint32_t val)
 {
-    trace_e1000e_link_set_ext_params(!!(val & E1000_CTRL_EXT_ASDCHK),
-                                     !!(val & E1000_CTRL_EXT_SPD_BYPS));
-
-    /* TODO: PFRSTD */
+    trace_igb_link_set_ext_params(!!(val & E1000_CTRL_EXT_ASDCHK),
+                                  !!(val & E1000_CTRL_EXT_SPD_BYPS),
+                                  !!(val & E1000_CTRL_EXT_PFRSTD));
 
     /* Zero self-clearing bits */
     val &= ~(E1000_CTRL_EXT_ASDCHK | E1000_CTRL_EXT_EE_RST);
     core->mac[CTRL_EXT] = val;
+
+    if (core->mac[CTRL_EXT] & E1000_CTRL_EXT_PFRSTD) {
+        for (int vfn = 0; vfn < IGB_MAX_VF_FUNCTIONS; vfn++) {
+            core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_RSTI;
+            core->mac[V2PMAILBOX0 + vfn] |= E1000_V2PMAILBOX_RSTD;
+        }
+    }
 }
 
 static void
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index 00934d4f20..a658f9b53f 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -240,6 +240,9 @@ union e1000_adv_rx_desc {
 
 /* from igb/e1000_defines.h */
 
+/* Physical Func Reset Done Indication */
+#define E1000_CTRL_EXT_PFRSTD   0x00004000
+
 #define E1000_IVAR_VALID     0x80
 #define E1000_GPIE_NSICR     0x00000001
 #define E1000_GPIE_MSIX_MODE 0x00000010
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 65753411fc..d35554fce8 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -280,6 +280,8 @@ igb_core_mdic_read_unhandled(uint32_t addr) "MDIC READ: PHY[%u] UNHANDLED"
 igb_core_mdic_write(uint32_t addr, uint32_t data) "MDIC WRITE: PHY[%u] = 0x%x"
 igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
 
+igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, bool pfrstd) "Set extended link params: ASD check: %d, Speed select bypass: %d, PF reset done: %d"
+
 igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
 igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
 
-- 
2.34.1


