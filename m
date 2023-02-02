Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BD868766C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNU8M-0008T3-SO; Thu, 02 Feb 2023 02:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8G-0008SU-UE
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:44 -0500
Received: from mail-vi1eur05on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::70e]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8F-0001eR-87
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KV1ows4RZWKnNuHdg0G4yuZjVzzuz1gNPsMuMYLFeOSAA4EpkaGwmJeW4+H5GTV6FO8aHvRcWGnOdNSdrw2Ij5TU7rQccrfRxg6VzZqY5Lz1pju/FJa3YiLpbZr3xq/Eim3hIZnJMZVF9/YXcKhWgChmuvuICzIoaiBvY09zbO9vz1w+7AQDigEbaAEwDc9J/KnD3OyjdoUefSZKHZpsdB2AQwSUC/n2MmfVF7CI4+rihpH/3zVRzAyzFqSyhD+7ONWt0CEPvGOeviQBRz/48e8njbKrQDWOhru0ze4Xx1v0QUqQmTjqYvk3NB4N+hi8+c96Qz+f7TCS33MzKd7NQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH8eb0Ku50eAOzZOrdXz9GiXP/+yYlyCWgiOKa//Xlw=;
 b=YNfikpLdL3J/Ks8jN4yIi62J3erTvO9EgqpUkoQ5QQXwHcY8H7WF6FNs23mBZyuMZLGNyi67uWHKHK2hrtm68eWAJAu+raCVCzxTxCq3ZFePDxWTjGYgX2zo4VKvm3IGkiW30bjUxc4pnWjwKSkMxwWbQMRRD5qYJsz9+HDCY3Rtt4x2VmKvUTgDSm+Q0h3CmWeBbfoanM5k7LxD8jUnQgFIgdzrEnYPWbzUEqvJyANH4SvEwEJXeMWBgUsLZt5N2ddbdDGK4IxswaLxAnUq1aBKt7bGNHKMwEuZ5qZ0cN0vqLpSBRAqpMY3Y/VZSqwq/8BxfaygA/bWLYBVLdQJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cH8eb0Ku50eAOzZOrdXz9GiXP/+yYlyCWgiOKa//Xlw=;
 b=m9zDfdmu2iHlh8QG7vdKPw1X7ElfOk4nocd3N3Wx5x2j0CLX6ze68YVn2iCz3O+ZGAZ8l2bna4qyk0hWALUk8/tekFIFXiCb3oY9QJoNuhXhYbM0TQeOpDpgPEXSwHjWgGFcZFaFHPnRi8b9PX03h+TzrayoAKDyaHn1WtZdrgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2389.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 07:35:38 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 07:35:38 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v5 2/8] igb: handle PF/VF reset properly
Date: Thu,  2 Feb 2023 08:26:42 +0100
Message-Id: <20230202072648.4743-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
References: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0023.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::24) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB4P189MB2389:EE_
X-MS-Office365-Filtering-Correlation-Id: 879210bc-fc7a-4dbf-d9e4-08db04f01425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UEFmgWhlxfOsmB5kIMZaZwZR2KAqXmQIqf0V+ewFUvqY/C7/ND8vELNxDS1b9FQqAHKiLQaBPN+FEfjiUIdbN0PRR5w/yafG/Jh/e4WNvyIhwsOZf18kisQLHoVrgATvmDSxoID0V26TmxyJH482SvzEJEBlnMzgOkeYPwx4ZLPlwIC2g0FpVkjlWj5rz9EEzVa2BBWJGZEl1Kog62Wp4BZT3B/aBSug+t9uz8VpCTRqrX27WVdeJGTVrGpE8+6C7zqF6DHKQQmBAUnjF8Pp7G1lYe3S/a/Ikoh8H0rqdXMuQYVWdEIpDFJD2RTPDHUp1Isz4mjanR53WrQ9Bv/bCx9XQ2kxKATYZIAjtyzunD4EKbvFZTkysKIwv+TNPTud7jSJUiDdp7IAbY3CcqRWFh8Y0h2O2QUCJ1LnNVG3ttoUdhIEv/SCnY1cakAaGJ4MCjg0ezigJK4cFTeooSqomIC6uKpNxDpCw4SFEhTvH726hUcjdMy+cPyCA3rKdbOEZbZZN3Tvm4Tmy6Kb7fh+yV3YZB08YhWglokkycP0wXDsemfhiR74+0Rg6b+/fP1HZo9q2eqVsw5ytPHE0XYFCFU1nw8Tq7xcGc5eRSPx2uvRwPV3jAD/jN71wUoed/TEUJuW9YxfI0T/3FIBQk2DyS4djUPFlVwF7eDWdfAswNz/VW3WBN6k2XZlDXBunK72IHZumaMYaFslILryCIzvdVZjxT+EXJ006w0mKLNAf50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39840400004)(396003)(136003)(451199018)(109986016)(6666004)(1076003)(186003)(6506007)(6512007)(83380400001)(26005)(2616005)(38100700002)(36756003)(86362001)(8936002)(41300700001)(44832011)(5660300002)(478600001)(2906002)(6486002)(66476007)(316002)(4326008)(8676002)(66556008)(66946007)(70586007)(54906003)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XqAqUVe4iHD8D+xqbYv6HxWKDynfeZn861RV2V0eMGP2275PI/5Id19Q8cSw?=
 =?us-ascii?Q?xA35mToMFO3009MuQYVDvU6ZoynWCQ+xCi+QI/F33IXrYuExqTPKSZIYm2jb?=
 =?us-ascii?Q?aSN7nB0quUEoODamBtf1+lx82Vs4CtsP/hq1JTn1kWZjuW5DYUk0n2iw1RXc?=
 =?us-ascii?Q?jdft6EBbOb/Fm8LLirES6iuhuX7PN0xU8AlLirIMbnEdOx1yW7rwgxUY4gca?=
 =?us-ascii?Q?ifwWN6WilKyBKvGyvU21YS1dOU60MTyedZj+uOFlkazHAI8Fj0McH1+EqlF+?=
 =?us-ascii?Q?KPQSmFx+TP0VFdV27/cdird1gMmPsfNUBidcp8G9FqyBoDSldUnCqTQQRa9I?=
 =?us-ascii?Q?MjgwMSTD96Ai8G36ealW2xw5jCrqSpf+o8hC+2UJon5Fq8NMcSfrqYjiUq7u?=
 =?us-ascii?Q?eXB816JdDSXtjJCnV1LcPKcsaqyS8x1W8gNm1MfxVsBNQBt2FZlWW06W6XyI?=
 =?us-ascii?Q?vhNCYBmDDr1FFH9LyvFV0H/1QaVD2YGPt6Ess7D1za4ZFnik+H1ml4ReWMFX?=
 =?us-ascii?Q?XER1v0M7r88DRehrt7OwH3p9niaxrgaRjKgTbQIEiUwBRC5/YWXkvB+iC/Er?=
 =?us-ascii?Q?SzUwV5D7lpRqcB1DwGeh2lHgEqgpT5/PRGzU5fSUj1LA89xOUoE6gdZhHg/M?=
 =?us-ascii?Q?gEaWRlWabcym0VkKRPFCyuGGlHt2oJhLaguMDEDXQgfcfMvmke1HZTOokNG5?=
 =?us-ascii?Q?+5N0j4tKeVdSXp6d2zgpQxhAgfQbrQQhq2er2bg5Kg+AINd80dcXwP9KGJDJ?=
 =?us-ascii?Q?di/0J7A2fhjJWmnlNAIY/kAu0b8n+6DLaZEpbBz0DjA8DbJflj/VXeXyvt/H?=
 =?us-ascii?Q?ucSOScqVup4hjBoWW5v8FhEz7BwktTaoJB6nkAUNh08+XJos+WT13HCOwxeE?=
 =?us-ascii?Q?ITFDHPRRfnCELlQb4pE+3d7gdc9qI7Niso1whxz3cjtqh9Kf1xej4Z6uJFY2?=
 =?us-ascii?Q?UIg6vgYV4RV+1O3ypj56qKzsoDxXZY8A5Lt4kVa/HXNdFRBsq0WmfTMLkbJl?=
 =?us-ascii?Q?7DPkyRX9AYu0NGjMojeiiJ04woVDOUfVNvmA/uD8K7Eti410gwRBlVOEu/m4?=
 =?us-ascii?Q?nXS8AY/t3yqS3PsE5MG8m7eXjfo4L2pZ+zuoeAWfksx04OIzaAk7bb9oE7VH?=
 =?us-ascii?Q?4YjoSr+xBdNJbrHzqVzm/nURxAAZN81c5iIwWJhdCqE2PmBvQCQhRDVBjyaU?=
 =?us-ascii?Q?AgevfuTG/CwQopxz4vE5nLbewMabK5DbO0nW3MS8uqqAf5HykpIWxaYh4he4?=
 =?us-ascii?Q?yITRUYX1JKcp3nZb8J+40n6gA0NVgJ2Y6LevmT0vFIdSTDJE/5lCBXZrp+uy?=
 =?us-ascii?Q?L2Xh5TbS0WQWOtBi7K/tuwmC50JtV+6npu+ILO0mTsKUFVFu9g14h29ULiRz?=
 =?us-ascii?Q?2lAknRs4kcysr7xpYBGCymrRJEZrK0EiOSBQ9KatiNfikEMDbjYr1boO2lxU?=
 =?us-ascii?Q?aE6H2RC6w5riQj8nj8fz/a1ZytOQMlDY2ttzxSXGoWm+n6VaUejZaqF7Lg0L?=
 =?us-ascii?Q?jnyOVMo1MlDUzNv2Tr5jkHxfJJxtUPhhFiV8jttutkARuzwm9+q8DYMJkrCe?=
 =?us-ascii?Q?pzrdo/M6Bnpd+a26JyCs1qQCaj3mJhya0zQVnW4qmb/qYk3AbU/YwNptk+Id?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 879210bc-fc7a-4dbf-d9e4-08db04f01425
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 07:35:38.1150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhMqcvE3K4hNgAeDqHVQMpTBVxZpfDT/lBTPLmBe8PDtBW0BqEKjPK3LWNKcHJ5sT0EtkFkzJssbBP/DXn99YaIsJulD+3D/S4t1d60EsWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2389
Received-SPF: pass client-ip=2a01:111:f400:7d00::70e;
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


