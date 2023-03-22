Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396C86C4CC4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:02:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pez36-0000FL-6Q; Wed, 22 Mar 2023 10:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez2o-0008J0-6i
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:02:30 -0400
Received: from mail-he1eur04on0713.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::713]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez2k-0003Yq-Ge
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:02:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCZWyCkQ36116AewttkK1nKUCrr+jTMao9KSSZLbqx8qYlfF9jy24kIrXUxN9ih7ptFsprN45Grye9IGEqciCyocPsUXsrDTd4CDUuamNycaxcqSsZCaqpUqRu+2NlRc2ZJ5RmsXOj6UjM5f3LRqLG79LeNG2asnHiCUAtyUm4i4jt2e+sSTEmmPJTPmv8f3XT3H2zvLk40E4IuP7S9OzrAGhTLZ1vztDwffSEHOhVtq48+7IqF63A5EIyYeMih54sn7v1IVjpXyinok8q953vV+BolntWb1QHPA+0PjSt99NiWliDJTuCWlZVUO17tQZU0cDjyemG8+lMDA19rwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDdxTvOnd4+m43gP05gJZWQ60SduEqJHhWyResaJqIY=;
 b=k6/lrRxVq28pSaQYB9c4LZrfQCQp0y53PsYavC31Zd00DSWtm4UdjiZVU3M2UjSLIUC4qN3rPIAGc7h7ZCqaxKtd/LBk2/VZd7lfweBXaEa5+YSzqz/w0vvP+TuXZRVP8ZSPy8sfIFl9zMudt4hICbK9j8kCcUqlqD8fAilfG2geLKYxAbUYQnPkpleRVPxjpfHLX/BEL9ZH5hbttb5FydDaHCTAKoAh4ruxuChtT5Vx5bBd9Ry3z14y99yudUhkBh9WqzLimtaa0DoKV0snjSgO1OV6oatFYwBHXbbje7HBA4SONDQd47GtjiuuOB/hARxSKKSNNEH9fb8uTg4RNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDdxTvOnd4+m43gP05gJZWQ60SduEqJHhWyResaJqIY=;
 b=jqAdnDRDy9KPmt/LO9fMkxA5IkCrwzuL+ngaSKsRLfOdYO23b3PuVan4nIDfnYBTXdTMeJfU+rISBp5SXoB/unGqcRpi9M+xPbOuYQwAqmu2vBp+4tLPb0O0Gp1prWaKXkqdDvpjnRwhjIGULMSGnrKbKUcHvHQnmDuRDw+ly5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS1P189MB1936.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:48e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:02:19 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:02:19 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v9 2/8] igb: handle PF/VF reset properly
Date: Wed, 22 Mar 2023 14:04:34 +0100
Message-Id: <20230322130440.26808-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
References: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0001.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::31) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS1P189MB1936:EE_
X-MS-Office365-Filtering-Correlation-Id: a40debcf-f6a2-4d92-8eb0-08db2ade0cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S63mII6/TjQOs8rBAD4+fQRO+GD8SqWK8OBtBdr/j/v6KayOutyViypLuuiFs2/61qOc93zi0urPm3Gvt0g6nZrgun+OQNc8phzhr2xLanyDKmHF1XZwJ8RQqs7xT6ot9J5eOWxMexZlN81s8gTp7YTETlPXjcX1mlbEUdZCboZc3MlkeTSQD1B0xw9sdu3XCuC/6Hb310E5/WsvZHE14g5XpaBuwCZaQLsqegtIyTZBssbXHghw9TkgjKdAGkS3I/LHg+JEakq64/eDGEZNNyfKWzh7MQZBMFJoC4tjksl6BLZIfpK+3OQ/dihOUvHxztsJjwwH11IGGShrnjfxv82/pU2xdtgIXsQ3gvpy8+MTHgRZCWtHUVhyVO1vnngByOPnKQ8bX88+bJdQcLZBVcJBBqPbARcD2t2IeS+wMMEGy9Y+ePEQO9wBA7rJ2Cxt8sgvXHbETdHktRq7fzSklRsgxXTEWJU8PlGCrOxHpxWtTAUCZxnW97DCkxlr1nHB/MzkRC6qjkeSxJpcHl0zNu1w6PcicdArhis7DGWC3VoehCEzrwp0VbNB2pUMtsgssLqYhIcf10+FxB5si3vPEtekTqZ9v0bCt9iCkPJpV/p8oLqB7ImJjanaTIOibrASuAFQUNEHQMjhR+q6MFoROWI20y3G4BAR+XymPKmHPjlRT7wvPxASQnQ70pEIER0eQNmUn1RYNTu1bxynu31dDAiW3IpAEJ01dCpXVt4JzXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39840400004)(376002)(396003)(346002)(109986016)(451199018)(5660300002)(8936002)(44832011)(41300700001)(86362001)(38100700002)(36756003)(2906002)(4326008)(6486002)(1076003)(478600001)(83380400001)(6666004)(2616005)(186003)(6512007)(26005)(6506007)(54906003)(66476007)(316002)(8676002)(66946007)(70586007)(66556008)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BZQtvO6D5/j1DApCpqrXZhBlF3M123wKbm3Hzpksh5dXr1LUfVd00SQ3TAyl?=
 =?us-ascii?Q?KAqDftOLBc2KwjufCu0dQzZ0U8hrRVS9LEFbJFIZsjDPITr1xRdZqyHCpqsQ?=
 =?us-ascii?Q?qiYp8nc0b7UG6HfXKPM7Ag8cCC6O3Ju/gX1rM2FBWYSlB3HIjW0vAa3+w1D2?=
 =?us-ascii?Q?hMDKry0iT+2Twzkdf4iOslUxVdiNUwomAOWA8+qTxjvdqBnm33Tra9+VZO6A?=
 =?us-ascii?Q?MphsAcW8TdOL2CFuplwkiUD1uhq4EVBvxbTPlZBOAsv+Z24K4LVZAypWfyT5?=
 =?us-ascii?Q?ZVqnj4PeXbDAIDhM4Rnw4a3cqpKjL56R97AbqTJIAN7GZ/oHbZ482tk0WXDB?=
 =?us-ascii?Q?lnwTyM+FK1TUa9LHYQycuvdRgRrTcpn1p74N52JkdmMMgDFkHDYKDkp72i5F?=
 =?us-ascii?Q?Z/pHAJ8+TQtOujudGD507cvY8yeI4ucBlcRHp5V1CSvcXl+xWs4wFEKzYn/c?=
 =?us-ascii?Q?nF+G4+hODDNOsLLx5JsID3ixs/EFcPppAxOS0JAZ+kB8y6OkVPIwMMmuAlug?=
 =?us-ascii?Q?O8SADIUXxPBW4CPoePYntcOVN0JANgrhnujM1PHSgjquagiHIBK8RAi1iMua?=
 =?us-ascii?Q?ptPXvvmQ/0KuvfwNDFFqfoBid0DkRHs7QXHHW7h4sboERgmu8SiLWM5ssxYP?=
 =?us-ascii?Q?sOZmUPG/MKSgPQx+qmui45PsqEix3PLnepS7qEhbL2lH8l4bn0n2L/u5+29f?=
 =?us-ascii?Q?LAtKNFJduzfZKOWdqMy8V/gvde52FF4J4sgRNZFeilqLNIRjy7OSxOEV1zF7?=
 =?us-ascii?Q?FlnHAtqLptBjlZHiKKFrxoUDGgtgrBbm0VWtFpqAaQlOJnCBr1zQqO37XqBU?=
 =?us-ascii?Q?CyetZFqHqeinrSArVRoq0w8mbdanKw0cRRG0ImGRxHalNkh4aYOJ7JRuMpsX?=
 =?us-ascii?Q?hz1khc6BELXv1iBg5iBXhmSZ9Ht84+b0qgpfyeZgkockEdS+VuX3RAnlOq6z?=
 =?us-ascii?Q?vJWBKP5MpTnrw3z/i+J85op5O4i6tzQEhBzbSVsI6F2JkAXTzWxNKlyRJHW4?=
 =?us-ascii?Q?+4CYYwYWeabrRodW4O+dBi0X+GnxegjsWav3oZo7kNxu59MI7rSuu3YN5eZu?=
 =?us-ascii?Q?eH7Yk4JJxQ2XUg7ETuKL+gQqucjUdaeQsSg316Jl8sN8F+Bd9beKyUqmCyYK?=
 =?us-ascii?Q?dGmO33NXym14oHvmWmMti7qOabf6/IXtP+9TkE1HnNaSq/WEZLR/X77t97SN?=
 =?us-ascii?Q?WKJ+NQYNmA1+mPLMNXK7yiKePuAosthcugFqQT6U/laQkp6IcNJW6txGuy7w?=
 =?us-ascii?Q?N1e6FdvwJQs4BybZ6Mu88hs2wAucjwfcq98HdPwyUUue4i3RpHH6hATYV+P5?=
 =?us-ascii?Q?k1hZAggj8H6mO5WOybeMPJh2FTmRugX5iYFECzCId1ajLcxDIAJ59hc8TfXO?=
 =?us-ascii?Q?8lrLBzXBBwbmWh4D1V/DrJoAwMrZvdFUDtYrRN+6DB0kyjLzYAT5Y35dRrel?=
 =?us-ascii?Q?E70zHvSwoB73Qit/0XyAnqtZQdkgf7Ef5b7/CL2kpI2ekNDZTIvBu9x7TxY9?=
 =?us-ascii?Q?ziEM+mQOVPgDFvKkRDJ08Q4o4umBO6CrF6R3gw85pFbOnrqlSe+XyPJgdRpq?=
 =?us-ascii?Q?yT4ZC0FYA1h8dUAiW0d5VY9nnkOqoEUEFEOAZkr2FOmUDFlN4g4ZSb6HKjuZ?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a40debcf-f6a2-4d92-8eb0-08db2ade0cf4
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:02:19.2298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d4uwXvppuEvQbjAFOEbcAL6VsatKNemZ8JfL36830RDJnvtJgj2FUZPjrFPfUWQT9xuHmJHfQKcyMwFiYMuxSG1rpMBgGal7ZRVXEAc7xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1936
Received-SPF: pass client-ip=2a01:111:f400:fe0d::713;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Use PFRSTD to reset RSTI bit for VFs, and raise VFLRE interrupt when VF
is reset.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c   | 38 ++++++++++++++++++++++++++------------
 hw/net/igb_regs.h   |  3 +++
 hw/net/trace-events |  2 ++
 3 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 596039aab8..0fde8ef854 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1895,14 +1895,6 @@ static void igb_set_eims(IGBCore *core, int index, uint32_t val)
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
@@ -1980,6 +1972,17 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
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
@@ -2234,14 +2237,20 @@ igb_set_status(IGBCore *core, int index, uint32_t val)
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
@@ -4024,6 +4033,11 @@ static void igb_reset(IGBCore *core, bool sw)
 
     e1000x_reset_mac_addr(core->owner_nic, core->mac, core->permanent_mac);
 
+    for (int vfn = 0; vfn < IGB_MAX_VF_FUNCTIONS; vfn++) {
+        /* Set RSTI, so VF can identify a PF reset is in progress */
+        core->mac[V2PMAILBOX0 + vfn] |= E1000_V2PMAILBOX_RSTI;
+    }
+
     for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
         tx = &core->tx[i];
         net_tx_pkt_reset(tx->tx_pkt);
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


