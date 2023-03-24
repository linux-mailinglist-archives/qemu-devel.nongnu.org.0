Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB83E6C8574
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:00:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfmd5-0005rP-1e; Fri, 24 Mar 2023 14:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmd2-0005rC-Ku
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:08 -0400
Received: from mail-am6eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::729]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmd0-0002ID-Rb
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXDYzvuIcn0aQD1x8DL3JO0FlUpQlDoKAFEdKbTENg1J2HUxSLMmOMtgWx2wyrLZeTfkzdUM9J12hW7nxALyj+ZlYfs8H5Nv2NSnJdfheLl8Uqai1TDML/+EuKAoUtXiUkxDeGFfgxD6yLQwtAuLzCuDDU4VWz6RA0mtC71ooAGaiw/5B5xRmE7xAiLXnMMZY0i65LmGcXqOoTDO62JNshVITbMvnCX8gpf9zOlLxDNdbC7MMZfRSdpq2InnxeNeIHw9fHu4gZQMs2ZFrrFQmWB1APx4/CHbjO/Gblvs9CyrX7aHod8qyfwfsKpH4NV8bxyNP2Az03WmFsdlm9rm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdlgwlnFnzfYfvZAmdYzfm962tf25lAKxTLsWu10D6E=;
 b=Sl4mJgLWy+GJMJDv8WOsS/vsnBHc5g7O+78WSQilezZzBXUy3lTRJWNr1RDzPvYzU9qxZfdvyscUr5cdkIjknIlimwvXIzmToAY/JEsbJDaqVbb9/XlQTUI5V/7CS/ddEp2nWqKu97a2iwKjH+/6BY3Wigi2MAr4te9Vkel1lPlqwImpqgw8lzPt+EU2CNRY8zMJVB+6UlLfqbhPh9MFY9PiX6/G6F9tVuT/qvT0OSUOlGQ8F/A3/spqTJ/9ZltmhMsmZRpEPb8e19GkdwIq9y0BJ8uL5dcMPdHaQJpoGSZlRbHHPHom8i4cHl1rTY6In082/oLIGvInGtG+AR9X+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdlgwlnFnzfYfvZAmdYzfm962tf25lAKxTLsWu10D6E=;
 b=OQ1Qib7/+BtuAGn7vQT6A/J007n7cGWbAasDr1h00SyvBpM2VTRQMbWS8KJ/r3dfx9skd5mllUzhQp0qrivD96/HHsYQqrJE/EMp2ToKMfCWDEeJKacf04apkZJBjBidIz8gfmHiFrXr5EODAhK2+B+F8x5PHFa0ge6zn0Xw/NE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB3P189MB2380.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 18:58:56 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 18:58:56 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v10 2/8] igb: handle PF/VF reset properly
Date: Fri, 24 Mar 2023 16:34:55 +0100
Message-Id: <20230324153501.20695-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
References: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0119.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::20) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB3P189MB2380:EE_
X-MS-Office365-Filtering-Correlation-Id: 55807f87-b93b-4ffd-25a1-08db2c99d0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYOrIiW9hE588lL23hNg91pI2eAFc9pF7bqM3oZucDfvGLl8BlO553L1xXCuecMPMuURJlTw07/ZLt/Tvy5GcjpZDc8TJC15qElG8vr+RMdVdlTiN9PfAXPmeOCXLGPcYxEW96M7PAwpKmD6ui5AH2xXpho4eyyxkUr/U7sQSzNZQHTiEBP6Ssb8T5Tq/Y/IW6u2AEsOBO8LoJPSvOttxuZcyU0EZ5E/9jkHruSYWi8A95Z8eJHoGr/KJbleoM+w8sGMGzRNx/Kyfm791dwriqR6zCxuNp5vFYnk2F5y7nAmbXqezDGoZB3H9uUuK6+yAPKhQUg68xP+Xr67iBP85f+Q7HLkjoCNbrDeg0eFhDhhplLv1SHeQ7J9nqN6hyyGaU7lt+LiDfN6RAPpe9k0SC+iI0GkEzjcX7QDz/8nw9zSoZs0dmK7P05VdLCufP2tCXh5P+ttzb3DioKOWgu3gWZfnss9RXVjkiOCpY2y8qNqjWF3rtJEQG4HSP6bsULpsN1q0WeRA3JbK9BQXQvBCR2paZWJldvk4T4t2qhW9HGzGosiRZ/ZBO6zQni4VZLaan9j2Wh/w/DCQFv7W8zpD5ZdhUCdvgZzCMvuOC3OiDMtgvNnd6A2Ruem1IxQ/v0pzouOWg0ZfEuRQyQ9gW1UwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39840400004)(451199021)(109986019)(66946007)(54906003)(316002)(66556008)(38100700002)(8676002)(70586007)(44832011)(66476007)(86362001)(4326008)(41300700001)(36756003)(5660300002)(8936002)(186003)(2616005)(2906002)(6486002)(26005)(6512007)(478600001)(1076003)(6506007)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fy+DBXT5cRrio1PihKY2YJ23uW6GX7VC4xo4+mtEdqeMm8UqYZV5n42lTpdz?=
 =?us-ascii?Q?yte9YJcpFvd3z66Gq1lCIzPOuPHv0W+A3S0nqvzj6g/uPEC9BfiNAi3EUV4y?=
 =?us-ascii?Q?drDsrhSFPYK7pESRN0jkIaPwYL5MkkvGMMK4yndkDEMxnhhFolaUDNS668Zm?=
 =?us-ascii?Q?1p9fxc3noQRfc9tDaXceES8rxeFokYgR/CpYtPgLEg+IwA8A4DE8wRg6CXU5?=
 =?us-ascii?Q?/Nagt7UXuGzJekJGPEEdkbf5NxUKK7Y9av0wJkTzOUoXDfFLvDQv/k4INMyx?=
 =?us-ascii?Q?5h1NC8y41dAmXsV/sprxQukKusMmbZunjKeLgWsm1wB/K5vCGwQ8O8synbvC?=
 =?us-ascii?Q?57NCBmr8Gu5z9/8Nar1g9pcOqNpftO3VIxq2IQ0Bel9tGlI5o6wbRw34GNBh?=
 =?us-ascii?Q?qvRgeovMZ0du+pVCMDKiN2FPRVcbyCYwp//Gt8jbVghLIyXL/8xPtBEwYdF8?=
 =?us-ascii?Q?/G/q8qYIbx+aKz/oqpBGscmRjRBZypnljWVvLkLD9xcWqYmkVk7sXzF7NdII?=
 =?us-ascii?Q?4CW5Nk+RwA7oJc7zWQuJXo/3RyL0feI2iAhkCg11wZr+YswCO8hw1bt4wQZp?=
 =?us-ascii?Q?TD0CwZzE0O7PDsBvPdgQaTywrPgZWyJ7u6s0zw95xQK4Rw02xv6gZXdvFDRk?=
 =?us-ascii?Q?nuuWdQ1thOC/dj6P/CoZhnLN5TAh14LfDnsJjNCm8mMpJAY7wagjQDO/jgZL?=
 =?us-ascii?Q?1TSOy9fdLlTxMxEeWeB2+tjVAhXqQsU4UXgY8zzXQQYBvVwNtSfG4oQ4/VrX?=
 =?us-ascii?Q?fmPTali5eDhjZSm2ZJNsGeU7kCuuxCkiLGBs2m1qgQuNiMr8mBY7nNORan9S?=
 =?us-ascii?Q?E0q7kgDKTDRWPYz8eviP4r4nGg4RGqceHIAiK4wPn8Lx2roeCU2IAiEG3mjE?=
 =?us-ascii?Q?sY4dYqDDSFQAI6uzu9GA+yQOPvOqbb40YgJxz213SHwaidHIxYh5AIAk4p2u?=
 =?us-ascii?Q?JtM8Qm75f6TM7o+VhlqS/tGqrWigTjb9ylfj/9e17cp5aunzwygK1pImiQLz?=
 =?us-ascii?Q?h69jwmXWSajUPrTyoW+3qpuvF5vaLzn5lNvB++5zdRV54KbUEgpp2Laj0wod?=
 =?us-ascii?Q?Y8Cqhr9P1DvBsQS2gZpiX4jEBqPfG9dVQQJ+263i+Cry1JBXQlgyzbJwWKYj?=
 =?us-ascii?Q?gD3Qgwv2pzcakaSvO4QjsE6RoAZ6ypLu2u2Z3QWf4r2qEsFDUQYU4+O0F/77?=
 =?us-ascii?Q?pVoK/utffarbwLXPv2MPyfoMhFWC/G5J+zPeUD70PwNrgTxfAgVidvn3WL49?=
 =?us-ascii?Q?SXdeaIcYhi4mSF0tbOh7hIcf4Rtx+pApHVhUGNxO/Plxxtgjtv8L2qlTavrB?=
 =?us-ascii?Q?tt2iI0D6f2U35q94t3G1kqF2IXZ351jKiSEsyQjtr8pyZyH1c53W/TAcEpI1?=
 =?us-ascii?Q?pft1lp6VVP1P4beVsJ88kzRzL+lfw9JqOTmRUUh5ARCSWhGEb7S0kOA169QM?=
 =?us-ascii?Q?7Aq5+PtLMEEXyyoc/PuWpcpq57SDfkDk9i2MfQmNkQMCkOXH8gGOw8mu/IQj?=
 =?us-ascii?Q?AK50CMEy4/4GTXud67Zq97RBpAbdck5hgHh+7nNuUVTi8vXTkpHTwwRTdt7T?=
 =?us-ascii?Q?W184e4TdpxBmo5dK9lB/6ipn3gy+nhnQbvowEhsYVxe5vF+CmIoiNvRMK3EK?=
 =?us-ascii?Q?dA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 55807f87-b93b-4ffd-25a1-08db2c99d0ad
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:58:54.6777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6tlcDKIDoeQLhBfpPcuuk7vdiie96Yh0lS7z03TpGeBaTlafdhaNXjT8conPGkLNF32XjDSdHI/kv+cRgDLlJRDLKJ3hcKvcS7s+9+9ln8=
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

Use PFRSTD to reset RSTI bit for VFs, and raise VFLRE interrupt when VF
is reset.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c   | 38 ++++++++++++++++++++++++++------------
 hw/net/igb_regs.h   |  3 +++
 hw/net/trace-events |  2 ++
 3 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 78d30738e6..6ba9696637 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1898,14 +1898,6 @@ static void igb_set_eims(IGBCore *core, int index, uint32_t val)
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
@@ -1983,6 +1975,17 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
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
@@ -2237,14 +2240,20 @@ igb_set_status(IGBCore *core, int index, uint32_t val)
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
@@ -4027,6 +4036,11 @@ static void igb_reset(IGBCore *core, bool sw)
 
     e1000x_reset_mac_addr(core->owner_nic, core->mac, core->permanent_mac);
 
+    for (int vfn = 0; vfn < IGB_MAX_VF_FUNCTIONS; vfn++) {
+        /* Set RSTI, so VF can identify a PF reset is in progress */
+        core->mac[V2PMAILBOX0 + vfn] |= E1000_V2PMAILBOX_RSTI;
+    }
+
     for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
         tx = &core->tx[i];
         net_tx_pkt_reset(tx->tx_pkt, NULL);
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


