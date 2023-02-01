Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEE5686BAB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 17:29:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNFxq-0003DW-UG; Wed, 01 Feb 2023 11:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNFxl-000391-3V
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:27:57 -0500
Received: from mail-am0eur02on20704.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::704]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNFxj-0003K3-Kz
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:27:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NthhalZFYjp6w4A8hA3Hau32Z9KLzOBrbvkX8Yt+agtfQO9g8VY9XAF00MLh3N4BO09IGjylGzdv3GDDq8G1gAL1cyqiO+gp6dbwU1udBaVkLr9vttEwI1B2qVicOJEsGgMjkIIaPcY47JGyDN0ENDnOVyGD46mYBaJjwQHeGsIv3oYjgWM8JTaR2xIi90E2l3/CsizBh3odNjW2LQDyyhDkMIqZ+1brbWNw/7kRPniJd5SoWrE2feAYOQ5PLfZQ1wVK4xISRXOdE0GRilUn445JAdmu/hIfX41/fQiqgQIF4R84h8h+oyNyLiGwDlDMAexM+n9O2ov0dUtdXWw6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH8eb0Ku50eAOzZOrdXz9GiXP/+yYlyCWgiOKa//Xlw=;
 b=KidcZNR64hyrF2iX+oUMInLqnhMfMXvhJSYl7TqAZgUGnY3u4pfObeVdLkHSb0g/jdIjH12AA+rxBs2B1Ho4BCSUb8UK71cL/vQPitIzPmT8aEYy/H3TdcM4wyMWB72Xb5DixRk1SkX62zao+dH8ZwHXa+CzUlMbZE6JzigEoM2a/Cp3kye2EzeHNmVb4j8tFECcjJXhTyPmgt9OnhajIfqlJv3dSbatnuKYggygCCi6VDjBqrw96PoYnduxB8L26yEod2erUObN+9fbogy8YLKTqbqiMP5fbRhEObTTlcuw1SXVOsi5iz7eqrk6DBqS8mRNd284bHyXskAvwLgmGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cH8eb0Ku50eAOzZOrdXz9GiXP/+yYlyCWgiOKa//Xlw=;
 b=K8K3TotyouZTT1FUKEbTV77hFpN2Qon6/JvMc9Fhp9myKiBHaUTTC/yb2Dvf36fSTTLOfBuc5ZxW2s3Cza02O6aaEv2RtRtH64Nlmc1+LnNvH9RGWjUOTBmdIM2EyVmIBWVkTIPjYPSdv5X6xfRrmkIlMpnsk4PG7wLjYg9J8/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0836.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Wed, 1 Feb
 2023 16:27:49 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 16:27:49 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v4 2/9] igb: handle PF/VF reset properly
Date: Wed,  1 Feb 2023 12:17:15 +0100
Message-Id: <20230201111722.28748-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
References: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00000103.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:1d) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0836:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a638cd8-e6a9-4c4a-1df6-08db04714215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgaIkwPDo5zqvvWksCXgI2NvnRfo6MBeyAjvGEiib5+ZzKaF59GJdoYYQziyGgLWK4tocwr554jAsKMTySIMKFxm8pAi4PjSwHaVikukB1QTTCq1aHRnExov6SZXpv3InLUceV+xw/Cq3u48DW57i5T/o/nUP2/riGT/JIqtZ/ffBw0g9PjKzWe09E9cF2/EQGMqe8XB5WOHsIACjws+f24FkmEYzsmVJOfYRDv9gaFws8JjGTDxrwYF/KDYjW5ksFeJhmC37OELlEd5xX0Q0ldc88CwwC7RymmnhH6nxCCFkUGWh0FVeoN+eERIK8ryHwAUKZ+uCktD3ABjnMd2EHcPYNR1yUz1PwhRZHC+39HbbtTEL4813/x8E/9ldGdy/7yV6iYbRCvYGmQkw0RSA3YloHQJSJsCP1J2jic/y3tXT+GZ1KsIhcV/grjls7Zc/NsChPgMK4IUzNKXwuqm68CbXXOw6NoM5EtGSY1MzQrr5nnNNPExeMAof492KwF1oYHU32m0+t3onEPuY3nOp4WnNLpdVnAsrTGGOJSz5X/dE5y/HQiQsxhY3KRRN1tnzOHgUCLfChzaaA5w7SrsHrXwENIArpA+Ie4HUnNLuc9AsfUOa0vDRejpeEsaaYHvn+uX8zeKilmE3vzoOr2DC7YIciizBSbCS7DtwwBOjlHmMimjZGJiV4dIT6E0pNIiU1G9hOG51YS1eRBROa3bK364jtpuH8VWoy9C34B8pz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39840400004)(451199018)(109986016)(316002)(6486002)(86362001)(478600001)(2616005)(38100700002)(6666004)(1076003)(6512007)(186003)(6506007)(26005)(54906003)(5660300002)(36756003)(83380400001)(2906002)(66476007)(66556008)(41300700001)(8676002)(8936002)(44832011)(4326008)(70586007)(66946007)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mkbcF/yWDQGE8kFOfSfjdeIFlJI0q2iuS+uGSC75aqxXI93KaqX+96dn/C1R?=
 =?us-ascii?Q?Q7G21jaXp4whGMI6WzfdWD5uw+tRF7e/+ptaVzdz36jRChcKhpU7fH3S92FR?=
 =?us-ascii?Q?CpXYg+GdPCUKP3k4l5QNSZbvsJTZ3eiQeLal4lHhR99PTVbNPnPmlD8kX7uB?=
 =?us-ascii?Q?G/yfChwT/rqYz445fmXGsUqBsdh+7a3SOxOBEvkd4M40rRdWUElvE0m1lrGv?=
 =?us-ascii?Q?hu3Jz2gSay6FKAV/tVzQ3pfVoYTOkjXXXZYznv79G/IhCILnj34f/tbX3WnN?=
 =?us-ascii?Q?sp5YnBoh7pLoqy9Uu8PYULTeBUJgks5H/Dv+QHsGR4/MvJvQN14VqJx48nxX?=
 =?us-ascii?Q?KxgFXLAv9+YBGAQyvZ900jbggm5cQiJTHIScLyIiQf9D1femFlSzW2DUXTF1?=
 =?us-ascii?Q?rf/xrEh94fe+BhmfBU5pR7OiveyvunQgf5N8vjLcBHZhsaQmeBECd946KWpp?=
 =?us-ascii?Q?CpPKbZ1MV5Eh/tm9YWMDb+NXy5de8uB+yp24XKtItgMLW9zHTy6KBaTw7eCq?=
 =?us-ascii?Q?cFmioCHnLjjR3BwtZNGOwY4XTSfR7im6y3aEJhgankHhxZHrG/3y4LhfVjcS?=
 =?us-ascii?Q?ek1MsB+NIetCJRIDaEF7IRdB8lA2RjrU+ogcbN2xLMRy+9Hc0ySnIqt9MWs/?=
 =?us-ascii?Q?qnn9u5wCdQx2YrDhEYrLqlFdiy0zXnM9aQx/nsFRmIAN30OdHIUeKNa1Gn12?=
 =?us-ascii?Q?EivZpvIF0vlCy41Mdz3p+tpdvNmClcjb1eOv61CuwYZs4GXYvTKd9JG+hRDw?=
 =?us-ascii?Q?jeZwn0DQDFoIvgbuy5lxFcMUmlPxQnPRgrA9s6HYpiLsOMKMrvGhCwdVraHr?=
 =?us-ascii?Q?rEisa09L8w29gxY/jZnAsxmnl1DW95RiK6O6XuWo3TdPOfeM8v4iA3zqy9zg?=
 =?us-ascii?Q?UwXsVdMkfMq/+L9T9yE5qXjnxmO+XJerVOvcn4DgdLnC+ZAh2MP3BWxRxhMV?=
 =?us-ascii?Q?50/bn+3HzzOrNqHygggpFrFGs5WzYhKmevrw1bUIiYWalYg+q0CFVd7EJgb1?=
 =?us-ascii?Q?J+Y80R0zCVNZhShyasEWfm65TvzetA4QFoeSa8F4NbLdL4wvEN9EMOk4jvrd?=
 =?us-ascii?Q?fhCXCne4odk28nFHd3pJFuwmr0hAI5+lfD77D0Kik6WO9fKu0uRMKM174GqU?=
 =?us-ascii?Q?8WBjL3Vh8NAHUffUhMsvilrUSWTlS42677X5FLJ1c02qyHiIA9sBu5htknJH?=
 =?us-ascii?Q?JdhAuZ3bvcAVE4+Twhbgk5bE2PBcx37rdTPswZ1RrMgHZKmsSyz+aFTYX5qS?=
 =?us-ascii?Q?01YzRPBjWfaPZ0/WmuKrr/EXWR/PUy/cr2jJlKOkLRWj31ZuYjGPXU8PtW7l?=
 =?us-ascii?Q?NdJPz+r3KfIqATPmDF+W/8xXPxdlX4LmoXriwwguPraCoKwVV7DgcPqzBXLY?=
 =?us-ascii?Q?emmkQ74+YrOrU+kj3XTA5/GcQ1ILemRKFPkrthkaWTb1QrNwn2XBlB8lXrTJ?=
 =?us-ascii?Q?qj9qRiTV3x7L3TIkcsV2kO1OX06rWJ0LeJ298EPpkemYt4zddBGaVAwFFZZp?=
 =?us-ascii?Q?VsHzsOBzIh3DxFyPjklWQ29nhEhVUH2ToSPqCpzP5F0fFD3aszy2sASbNuLk?=
 =?us-ascii?Q?GBJYY8wQFwhmhrxZCvpdE9Y4l3aq2L3k8tlWbls1YlU0Wqx4MYa2LD0LYYes?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a638cd8-e6a9-4c4a-1df6-08db04714215
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 16:27:49.7364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pe/ua0pZpQIdq9o6UGcngZXrsrgSKi/QK0yXpgaRicrTr+OaGSr0X3IgnvJ6gzRkwXVYu971Vo6ARcOXAyHC9OfpVotdjaz/qFsKdGMYrTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0836
Received-SPF: pass client-ip=2a01:111:f400:fe13::704;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
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

Use PFRSTD to reset RSTI bit for VFs, and raise VFLRE interrupt when VF
is reset.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c   | 33 +++++++++++++++++++++------------
 hw/net/igb_regs.h   |  3 +++
 hw/net/trace-events |  2 ++
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index cb3e2d0be3..b484e6ac30 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1887,14 +1887,6 @@ static void igb_set_eims(IGBCore *core, int index, uint32_t val)
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
@@ -1972,6 +1964,17 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
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
@@ -2226,14 +2229,20 @@ igb_set_status(IGBCore *core, int index, uint32_t val)
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
index ebf3e95023..ddc0f931d6 100644
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
index 0092919b9b..5665cccc1f 100644
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


