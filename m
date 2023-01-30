Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E13680EF9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU9r-00027F-EQ; Mon, 30 Jan 2023 08:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU7x-00073M-T8
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:18 -0500
Received: from mail-db8eur05on2071e.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::71e]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU7v-00069g-Vy
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECWTsHGZ4IQYRBRpCOdhhb6JOWT+8mK32g5G6m1DXrlldflnFIlJYqkvBZiHOB61w+SLMPH/pqzyE7BSHvan4c+jFD7K1aJ9WvjwF9z6ZOCMEPe8G4klztlb6qAQul07KeH8gGN4e9kFSsjcVtSAHxTPNcwekcqUVARpIYT7r4sqvrEc4MprIoSrKDMOfwvi2vZIKo+xVmBsg9/bYzUHkHFMymehrsdmYQCjL5jq1jFSGxNS2VtFhxPSTBxAy02zBdDUO05Ie+5TVZmy7IMlu/kqRa4pGuTW390OQL/fkFT3JXO3Zqk9oOrts56lHs536VC/li6N/1aJTZ0QOxk5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeWKult8WzJtM7wgoqAXrvuQvyDgQIHF9hYS6iFxe3k=;
 b=B7cBaOx7XwCmdrE2sjSsCyGJvkb8adHpwZuFCABj387q/uIrzJqGRUJcf61245RLeFQ547ZvXsK/cw4wnlOHkk7Di0C6bHxtCzhNj83aBqGKLpN9tw3Q2YfB3ZPEiK18hxkJ5uTMqaImNSNWGf0SQ0DxLNswNiXowXW06eav7mIPt6iVagZsjbHs7KSdqSXVht6xk2yKyL8YnIuYxLxLUcw+Y494HtAeJ+DDiu22tUCPPYbp1V0wt/NgUbDeVtoVwGTxVcumps6j5QLNfCsVsOJAjUNC3Xi+uS7QteTOSLGohMQpD167g2AtCEFKKIppfElTIq8TBVRrti3BFsqm9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeWKult8WzJtM7wgoqAXrvuQvyDgQIHF9hYS6iFxe3k=;
 b=TgEgJPPBWEX3+oPhatu1eYm7CR04iFxik786ivM1up1RjIe9DIM21dXZcbbpNz3zYlOk9je9ZG06ang24QuRjNt144on3BQbpHGs+lcdISa2NoqEYPfnzl8+5lflkjIuUSNk9HUfrgBjEF/+rnw3lYb0jhWVSOJzqtL6xmw8BRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2225.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 13:23:09 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:23:09 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 2/9] igb: handle PF/VF reset properly
Date: Mon, 30 Jan 2023 14:22:57 +0100
Message-Id: <20230130132304.2347-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0054.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::24) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2225:EE_
X-MS-Office365-Filtering-Correlation-Id: 982919c5-86cd-4414-7e88-08db02c5211d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZBdecfqAQrR8QrkzloPG5a/KjvcBMtfKauvm4VSqbHxrDUgrvUuoJpPuPKimB+XaLChrYWDtwe1YVWWbYIT84qYJsL8aGtZR2zmgU3ng42YCUx2pj1CMN/8KvKUOT1zG/qTALO5Km+Gn0bkixdnYQ26oV98xSH8VGxG4vD2qiDfwDXlGlNAmEfpXrtpJf8dc4bL9T0Twv/A/L7587Bnq8wH81t/GQA6eeO8qm7o0QpPj4MzaOu0SuoaKFeC1I2ja7KZbKFObgFN/1qRI1BgTlvoHgsxeHMLBAqs5O/tTo0l3EBGi7y78bI8RB/lNfmGExYC1vuySEbXYYE8YXcWFK0GcZjWxzCBiodyvY1+PQtlVbdKa4GjvaCRs5bxG9stMCD5i4oe/jzkLhoMaa0fK3Ou5I9D4WF79PSOI4azjnRc3H/4pqnomOAdRsrzwLuiYkPH9KLxfu5NBuF8kxhQKdJLXBT5aAN9zi+gMt5LsAz4CcgMj/FiterQzUYc+IWPsuHF5Oy4vEfrU1b7Hui4LQhakqSPdsQOegUIdsqyTy/aFPlRfhwl5lPO0cteDxvzl+i8uhq2DjGZ6STj9mgECsiZDBDCTQeuaE+vhgswIbxrpNC2nBFKKkm/p5bOsXYApUKQCt6lE4OIhA5saOsZyjpHjKYmoUh6gv2eChaqCACxV6PYyfK271kEQVlTE+nG2HksZmEnwVbdRuYfHKQXJFJIUPaJK6XU30qgLU18AGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(109986016)(451199018)(70586007)(66946007)(8676002)(4326008)(8936002)(38100700002)(316002)(6666004)(5660300002)(6506007)(1076003)(26005)(54906003)(44832011)(186003)(6512007)(66476007)(41300700001)(66556008)(478600001)(36756003)(2616005)(83380400001)(6486002)(2906002)(86362001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YyktHZhflfGQWoLy96937jHOxb47u5ayQ6FXSBIznic/gnWh3ovX6zKXIcmV?=
 =?us-ascii?Q?UmgYpHqvSQmz8YY9L186jcVBsfrv58zKg5i6/o9AFcbh02q1pHSMRbxsMzmm?=
 =?us-ascii?Q?sK6Wr7nz2AlvubJKyvIMR8NVHY7UBlc8rxiJm/KM14wgcouDR52zfZoER40h?=
 =?us-ascii?Q?bVX88CITrCxe/JqT0ZgQ6MQuWiqU/2b0DpI96RLI3HAJZBUza+3+WJRMfPcu?=
 =?us-ascii?Q?g8VHz6vNrQEXBASOQOp+nxOK+vitnoUiE/QoTzawS5Dp5XHzrnr7fNH+1q+J?=
 =?us-ascii?Q?igZyviMi7cIjFOhUSn4W4l/HNHqcNgImFLZF3Mcfi5/YxjiVNLmPDkVK2brK?=
 =?us-ascii?Q?mQQVgnr3LiSGeg+6tv8Q8fO6yIOai6CKp4OvvfCrg3eB+/+yMxREcimqoH0l?=
 =?us-ascii?Q?4MujxxE9kCAba1mFfOF+TMAtb0GhVaVR7Alv/6O4Kn6yWKRnDaQv9Y1blNpf?=
 =?us-ascii?Q?h8TOM5BM5b3a6k9J29GjfcxP/3t1t5lfDZLiPmht5qXSlYhU9/EcOO5OE2Of?=
 =?us-ascii?Q?5R+RUaQFYymuyn8t+2Gtsr/X/6VuiD8ad7i7fJWOaINU6L2H+5s4dpPBAe6J?=
 =?us-ascii?Q?Qhxk8W73gsG2h6f2tqIuaiOefD3Z8whWNqSrSi1rojtExptzhQVSjl/5gKMM?=
 =?us-ascii?Q?T7ujaTGCUviZpCxHlxkCBxBHr+FkXTsWbqlifqGQ7By5TRkre0VBCGOf0+Gr?=
 =?us-ascii?Q?vecyDue4XkR60M1UmS0qSPta4qtVjJPzPjw1lSY6X0+moK+7Uwx9cW9SmuFP?=
 =?us-ascii?Q?IyfJ3pU/vHaZVbDi/WdLCyLHyczWddwou0QUGEjWtzYRXxGHrspl4dnMkTpc?=
 =?us-ascii?Q?qTNuVnkmQAwacQPorBhiq0GEkQ0Trr/f0AvLYIgvB+B0SJPtwEkzXvXYVWrB?=
 =?us-ascii?Q?3/bhutnx5DFh/T/fApxBhxDEMWEmQG4PpIKqBYKJjG2ZH04jDUQpmy+1Zjre?=
 =?us-ascii?Q?1xxsWvv40N/TDIW/b9DYyXYuB2zGpashEaEZOzDt8WfuTksnlRlG7O9PH5u1?=
 =?us-ascii?Q?l8DnOY1PK48CL8F00brxtoS3aYkepP3HFrg8sIv0vM0AyZL4n4yHUT8t/qGA?=
 =?us-ascii?Q?xLaNntpDdApYaXzwlkjhcqUTlarFaDC0hlY13rKuz7Jq6tmzfAPnfrkj2OIP?=
 =?us-ascii?Q?PgX8R434sBTdUSu1Ve+yiPUTdH7os0cFP+rvLUXqGlib0wT0gq3aDcSYdAaD?=
 =?us-ascii?Q?DcHEg1cOPXkCJBePxdq4E/x6Fg/Mxx0q0aLGzmi20gukpqaaicBM56q3ASI1?=
 =?us-ascii?Q?dWhOAaAObGH88xD2/MU11Su9u4ZR1MgKKYSautuKeaEPLyKljYIrpRRfrOhP?=
 =?us-ascii?Q?F6ZGP+xKNbsUPeGgcEZRgIB+RUeymuP4m9NukeNK+f2FYEdDjP4r2F4PVjSH?=
 =?us-ascii?Q?VZzZxAbioajYeKRvumpNeILU6cEkhZxg9QgUH8jlmohfR9HFdPeeGYPyLLpN?=
 =?us-ascii?Q?yixMS7yFpNlLbymGE8kTQUM3z/XUYdRjEZNuN/k8bRtaKHtsG4mmhlK3ur3p?=
 =?us-ascii?Q?+7jN19NpbVUA4gzeakIkdGSTSik5Ia/44EKFMd6WnlRB2kg2yNgUET5dkOfo?=
 =?us-ascii?Q?XDj5zs5538DDH0vJGjITjKY871SYw4FxHMUm5+eKmF+bcZbqWADH3Qn9RePZ?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 982919c5-86cd-4414-7e88-08db02c5211d
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:23:09.1700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rf64czLQxwQLl2SaOOBv9K90bki/pisLScnAmh8D0gGyM2xP9YiiMzPeuFKVCe8e8L4mkPRsosByHgzvW/AmVm+ZZDCG357HFJYBY2ACQQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2225
Received-SPF: pass client-ip=2a01:111:f400:7e1a::71e;
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
 hw/net/e1000x_regs.h |  1 +
 hw/net/igb_core.c    | 33 +++++++++++++++++++++------------
 hw/net/trace-events  |  2 ++
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index fb5b861135..bb3fb36b8d 100644
--- a/hw/net/e1000x_regs.h
+++ b/hw/net/e1000x_regs.h
@@ -548,6 +548,7 @@
 
 #define E1000_CTRL_EXT_ASDCHK  0x00001000 /* auto speed detection check */
 #define E1000_CTRL_EXT_EE_RST  0x00002000 /* EEPROM reset */
+#define E1000_CTRL_EXT_PFRSTD  0x00004000 /* PF reset done indication */
 #define E1000_CTRL_EXT_LINK_EN 0x00010000 /* enable link status from external LINK_0 and LINK_1 pins */
 #define E1000_CTRL_EXT_DRV_LOAD 0x10000000 /* Driver loaded bit for FW */
 #define E1000_CTRL_EXT_EIAME   0x01000000
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index abeb9c7889..9bd53cc25f 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1902,14 +1902,6 @@ static void igb_set_eims(IGBCore *core, int index, uint32_t val)
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
@@ -1987,6 +1979,17 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
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
@@ -2241,14 +2244,20 @@ igb_set_status(IGBCore *core, int index, uint32_t val)
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
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 2f791b9b57..e94172e748 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -281,6 +281,8 @@ igb_core_mdic_read_unhandled(uint32_t addr) "MDIC READ: PHY[%u] UNHANDLED"
 igb_core_mdic_write(uint32_t addr, uint32_t data) "MDIC WRITE: PHY[%u] = 0x%x"
 igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
 
+igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, bool pfrstd) "Set extended link params: ASD check: %d, Speed select bypass: %d, PF reset done: %d"
+
 igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
 igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
 
-- 
2.34.1


