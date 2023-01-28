Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD467FB05
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 21:52:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLs9t-0006Yu-Kr; Sat, 28 Jan 2023 15:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9i-0006X2-Hr
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:37 -0500
Received: from mail-db8eur05hn2032d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::32d]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9g-0005Ml-Jk
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5cChxRXtyZbxmHkTCSe9epeDLTpwsOjPtOpTyXg+oDfIjw0n/nD53WCjNX7FWqvBrVCou2Sh/6gmUpqtIwL5zs1884KWpmUIvRsPZCvT8QjSQmqJkLyFHl1RbfaVZyFd8f6vpm1nj7NnZs2MvEMreUtkCbqF9uH8sPgtyaZPsnR3R2vKRs/i7Xnx/Hy/ffF4tVJtl9T/ymviow7TnH61dbtfj5l9zXiQAXRHiVpONsBz6RxCeOk+Kq0gsK7RUDUtTpbSCOFmhFZX+D2pXavYc/d11zAio/ZeH1OaT8BNHQEg10t+8pVpMuSb1fmfzRcp9b4mD7SuKjrz3penJcoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeWKult8WzJtM7wgoqAXrvuQvyDgQIHF9hYS6iFxe3k=;
 b=X84WMCQUPfvhp/ml9lUAXWQ4Wmfzh5CKtpuzpXxO2zPsxnFuVsW9lJCHGjUp4xSdho39T0yyyN1XGdFK4mrS7v295YjTcPWNxk6N57A5biN/rmwV8MxFGvbgOy9I2QG3KolPSIB5rwgJQQwcooG6AnEB01usyxaVYGCdGds6NaZtEBzKq37YFKeaUQ3an/rrjir8AAbnRjBxXut2A1ukytx5Jehm5tPFY/njhGTHazDefKZ9ikOW0ML/dFKYhCzb7zXY7jejDqNp+ssx8Vw/vm7LDAgGDCL0kStTh2uwB1H5Vqd38KGeEEOl1rD4+cbPqPfwm/6XOWogwulpxGZubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeWKult8WzJtM7wgoqAXrvuQvyDgQIHF9hYS6iFxe3k=;
 b=TfDcibpWAH00UhkEP5WJNhyEPqqqaH0TylmZIreLMSvNdsGTMT4lvCZr6b3W/TzwETPq3rw2s6L74Nx1GD33RFwTHJvBvYKq8GoJmIihUACiwK9J8eWGwXE4ETddXQGx/0LIz9Dbqt0uqkAeXPEc1KMoPZAfBcdM5aoYxpo8dgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0661.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sat, 28 Jan
 2023 20:50:20 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 20:50:20 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 2/9] igb: handle PF/VF reset properly
Date: Sat, 28 Jan 2023 14:46:26 +0100
Message-Id: <20230128134633.22730-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::13) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0661:EE_
X-MS-Office365-Filtering-Correlation-Id: 812b4edf-b327-48cf-9368-08db0171441f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iByd2Ukmkn0UGX9rbAzCRWA++2D8XCb9EFU+3O8vaD7cOTy2gOMjQdGdKI42zZQwHuZubzhjkyj60vI4d9SqupfG4E1aM/Me6A2V9PO/b4EPYL1Rj696ZZBdLeqrUMdFyG7rVVj0mSH2KnsvJjufXPCJs45E0+2voesYAZquMMVAARhWbSkXLzmrKEjH/EKoJisjLcDFvP3bqYRrLK82VpDPjbCy7iSusTufXSWnK4FGxHBNlRbtZBWCdEmUDNzbkAv0zw5FZl3gpWwe1SSgl3E4mcwAEUKAXbN/cmM0tXd/sT1ZUeT2j2Lt22PTdL4XXL9hKpaH3qPJtPJUryL/U2ZwkC9Z5DJAtanH3uViiZ4fxDnq6s5PdN4jJTIpUvTIH0k8EUrwwinx4rXQFCACRb0OtJRNUz7NVPMt/3JCPYqEsYRhbOhOZc9Cu0ynse7QtGyBfHSlZWTw/h99cIJy6d6UxZe2AdEUeoie8ta2utNqiu4cyW73kbOip794Q3UJ7AJmhY7Ee1wCf6LDMVvM0OlzOCZNAkeUG1yGJnTneZGXzfCqWgZlQV2CHQBPGft+ILTtIcu9+khW26f3dCS3cVhW3aistcvoR2TbR3GKqefDRtVEz4T3HFeycaV2OryunUbWMWgDfvaz9Gv8B/63LCk2BAIMZxhyo6xTszkA+B7u/odyTx7kK4g6io6OzXQ/tGzEMxyYEZabYBEY3D3jiu+MZ3SKqmNhn3GwaltLGkE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(396003)(346002)(376002)(136003)(34036004)(109986016)(451199018)(8936002)(41300700001)(86362001)(2616005)(83380400001)(810100004)(38100700002)(41320700001)(316002)(8676002)(54906003)(36756003)(4326008)(66556008)(66476007)(70586007)(66946007)(1076003)(6506007)(6512007)(26005)(186003)(6486002)(508600001)(44832011)(2906002)(5660300002)(266003)(37730700002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ajd/DtZc37hAN9u8I6zh6cOzLNtO5TIeIzcbJ8CmWNG6ZhJ0YYhlxylW8hqG?=
 =?us-ascii?Q?qqNdRkasoIQEwxCf4GCTLrKqmyBh4FFySv7cbYkd/DizQdsTS9r/b7slMfVN?=
 =?us-ascii?Q?BDu+SShTQRNmuQ2aKTYF2BZWGZw4PmwrdKnXioe6mawyXaXG2NQHveAkGqq/?=
 =?us-ascii?Q?WiRISXJ4mycDCPpXW3NL7dSkLtgCgmNoATtzaPIJNkCPl0/cN7amnddvZ0sW?=
 =?us-ascii?Q?6Q+ihFnNcZ2xLkEQ6QoVKaeqaiBnuC9U3YykB73VK+rPIknM6bUZbFj8GmT0?=
 =?us-ascii?Q?MhpTNVgeqkmizgSaZ1KaYJiGEbxWkNbcg05O/WI4hjaPyjoqtCYVk2Su7jHT?=
 =?us-ascii?Q?mooZvJc8fZWmgFZa/Av21mjgOtPsYyorfWoWgrdHt9TYfff369Tlq5rU8gsM?=
 =?us-ascii?Q?2mS9VBP5zCHT2d2fUPnsvC3Kbwh+p8KKf41ZFCtC4Nuzv8wE330QeHhpC9IP?=
 =?us-ascii?Q?udVsaTqrNGOQstZNoIBKgtDA30lO53Q70mTZhQkl/b2t4Uc8HvZ8piJvb8jg?=
 =?us-ascii?Q?JcAPM+jqEG2HGS7y2sr8aGpbvJ5lka7NqZ/KouKKVgRe0kLUsUKgQhOx61gq?=
 =?us-ascii?Q?aB/SIX2QQMl+PtOpdd4JNS1c8IqVCPkHUQFioUSG5G1s+zJiF1sUC9p5tNOx?=
 =?us-ascii?Q?8XDZS0oZ4nYy5JFca6JQ3d29eWs3rxxUUUJ1VdIwh0OeXRMTOG7roDD51QIO?=
 =?us-ascii?Q?PcfE9HSnrhRumgYKY/o/kogb5XkG3A3xP5HNPAw13yID2ZR8rQzeD0D8m+kV?=
 =?us-ascii?Q?x92kJfgr+iFEsxekeFS6Jzmr1Ol2sbd+RuEAayxBpVUYjJEMgMNRBdrxMB93?=
 =?us-ascii?Q?t23edBFZ5NSdWZMlw0uP18Jnv5VCoVCBKGaYMLczvmbJAKUCicEFn/NOrE2m?=
 =?us-ascii?Q?mlpIfvcTR0Fh2jxseDz4aUKb9ZdG8tC0VdZ/yu+ktNBg5/IjesgXpx+pY/+H?=
 =?us-ascii?Q?bzM/lMeTaFRYpb3wtrg+PuAmbd1bVRISQzqP5hlEh0/7a8VB3X3bYn2ynBjb?=
 =?us-ascii?Q?oescbEW9eX6916KqVCV7lDEt/hUyqsdclDT+G0jVtWFNhJ973ZDzNNpHnOXr?=
 =?us-ascii?Q?Pb0MaStaP9GPtU8lSORvz8xO/K4t45znne+H7oQMkSBQhoWQDmmU+fW7n3E8?=
 =?us-ascii?Q?BUxTs7MOMCZSoEkxn0XMv8hsUnWDeex1KIXcUqblyAKZpJogmDj9tzLS9Du6?=
 =?us-ascii?Q?EYsqWxQbBTIGUf9AN4s2iKtKNpWuIgGugBogJOcm4ZukpguzYJPfT4a8RPip?=
 =?us-ascii?Q?TfZEYPcKs+XkT3JMwun3WEhKb/AO40uiYkAIhknHpsmR3TnJS6SdoT0OlzyL?=
 =?us-ascii?Q?kRiLHMTTiVQM+/HU8T99neGpsLZT0IFA1FLq6hSCFTSWhsq5VbnaO2LuYKpu?=
 =?us-ascii?Q?0Tu4SRA+jTr6v1poaazUrI2JPj92vutkBl0wnAS7R/LjeIrjq8AW78ReadMC?=
 =?us-ascii?Q?g3JyGptVoafpTtRaBtABay3bUDOC7nYxkUgp2EEm45aYu/WFyr0pbxGmk2il?=
 =?us-ascii?Q?4F+5r8DP2R9Fd8/dLBtPy477t5cdVmCeMBJnbrjJ0dv9ldZ6uIVm9hTOUTvd?=
 =?us-ascii?Q?Us+3Yr0uPcQQqLjUzXzcjU5YDcYbKJntTc2ZUUTCqLHGMZd5W/46ltrH2zb3?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 812b4edf-b327-48cf-9368-08db0171441f
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 20:50:19.0471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pG6nWCf6RjHE0aABLYLbqCNZoJubnWcrmH9XCn+jCeoXZFiwIJ1AeTeVjM8gyC3ac4LGrDOyJraAPbB0yqjsnJE/kecMR/PU0t+lgc8A5M=
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


