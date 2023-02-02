Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF5687843
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:07:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNVYR-0003nh-U2; Thu, 02 Feb 2023 04:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXo-0003Z3-C0
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:14 -0500
Received: from mail-db3eur04on0719.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::719]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXl-000664-T5
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqiM3olttAqip5MFErrAhi2owqNjbQjb20D2xBuBR1jr4MxnKKIEs3FnuAdp5ocRZio0h/vgbFdaehJ+5kIf2ns2ArIiKV6cR3JCTAumQrr5hB1hyUlA3AvoCZ09OM2gH25VQll9k0nwKWVtgTKgdEXWSlI5AHwD0riA2nkIiGCC7NxwiulI7DDYLBxQ8ytVDbti8v0UBFC9CD9lWIh8xx+mFhBBLUUk5sK8g3XzbmIne2MW0gTcAS6LI5SzZtQxsNZ+qPiXQkBnOROr5gX4P/rlzGTqazZaTtcaBkQmQMoWZLGaHpPMcVEYmwZZ6Wx1mEkZiaGn5wTGOyQMDPThyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH8eb0Ku50eAOzZOrdXz9GiXP/+yYlyCWgiOKa//Xlw=;
 b=fXFXDEsV//9evuGq1bkImFUU+EULn2VUNj8/QISB4Uh62mAzyzAYWeNnmcOycWMg5H2pB7+P7rCOqIWYZTlw2+8VnektDfPCm6ig/k0zATKuyywsZbNle/OmhOJuezvPa3jHlJoU2Gp0kcKDYu84u1SMhLXj5asWQ8bf5MMIsy7BYSsoJ7ELp73f6/AknMW45hhQc4y3LQh+mF50cKi6fhPrSpBQpNiQgiknIiz1KQM7Iv7LxNZUV+2/IusY3GBvF06p7tXePdqLpevM+xZ5rVV5vYGWZyCY3L/0rw/q8wLoQHkqmwhAVEz5xeILO5FEDbm5+5Fm6VwpCV9KMvZvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cH8eb0Ku50eAOzZOrdXz9GiXP/+yYlyCWgiOKa//Xlw=;
 b=ij9CDruxM6OM6aqcWSELKKMM823Gf3nMthTxYD1Nhi6CwverJfcSq6sun96IdjpD5e79oPXaB3DrYs6aVq5iaxxOUPlOMHoW0lwcPE6cA4I1IiGYhuv2HKxTUrJ/u6033nw4EWe4S1w2cPg6zY8YuQLWUTU+crRIxSAnNKg+iJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAWP189MB2592.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:362::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 09:05:58 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 09:05:58 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v6 2/8] igb: handle PF/VF reset properly
Date: Thu,  2 Feb 2023 08:52:51 +0100
Message-Id: <20230202075257.16033-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
References: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0015.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::13) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAWP189MB2592:EE_
X-MS-Office365-Filtering-Correlation-Id: e0dfc403-26cb-4cd2-e4b9-08db04fcb264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 458DCI49VRDP2Ax0rhAh8MYUOrJPcQ7U650tMhcebakzjO9h1FbzmHGawUdsIXqzaAjbf6BAqE1X7sm9oYr0ZPLhuEQTNXisv/cJwEZ8Rz/EaYJtKn1+fXT1FlnUcT/gw/xesCi4iAymKhfxKyzQWOzrpYDxVLFi5vwbaX0Wv6XH/DQhpHmvxNp+MOX41+n9jTklMtDwtI29L9okLBU++FInZETZGlHLPewHo/Uv4Af3J0OkIdVI0QgY5Tq9HN62QjCr59VsEaW9DE//FVlzWrNOsC0cOO49Bs3IWpXskA3prml+ij4yGUfd4gg1m6163h65jKLEuYpyt6n+yJBNAgpEwbLUr+Xj+l4WzEb70vWvfIsGnTHSSiQvOPsfnXwrAtl1LpcmiALMsMj/srnCXKv9evkPO1AcsTHR/59xYni5w8leK+7dVI90oOCLPEX3YTTiIb+lsMCVvKNIF1Wmei/Jg9cJfhDo2UTGahr3f359A8Cbj94jtaLe90V1j/G82AXztrYaIJeboXBRkW2D3j96xH9M0ekpzPNVh6bsd0cHxeEbC1awggTSKF7Bh7/wvKZZe/5lq+XJTOmnPiNd7kM6qonrDrqgfxMaISEvfraFDK6sdkk3HfGTgzZIY/xmRL2pX2rIdh4jXFV6bUagp3wF8FhdzAtZ/w+64qBPDXlgCdiLgOaK2Bm9oefTinoK4pZAda+aEMjZBPRfEoYl2ItIId2mki9Pj04pV1zDGUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(39840400004)(451199018)(109986016)(70586007)(83380400001)(66476007)(1076003)(316002)(8936002)(4326008)(6666004)(6506007)(66556008)(8676002)(54906003)(66946007)(41300700001)(478600001)(6512007)(2616005)(26005)(6486002)(86362001)(186003)(36756003)(44832011)(5660300002)(2906002)(38100700002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dRpflw1wZLXMoI0X4bXCu9LGJyO7ecS47BE70b+SXdRlA6c3AZVvQ/vjYwMS?=
 =?us-ascii?Q?HYKOptMGwHNMbaUVVugdAnsoq6lRp+7vsDLOxW2udmgyKD5q0glH7VPS6JrW?=
 =?us-ascii?Q?TOZUj52HUbXtZZioTvtUOzjzvJ78AsASRmudAVgBy8wAmqObvZfBHB2DmUJz?=
 =?us-ascii?Q?KknkffrQfiZP4JlfXp/ib3O97BTsI0fgQRLwvlnlBpLWTYb0VBMIJxt5BFIR?=
 =?us-ascii?Q?OR7xHEgzhW2mOYoXzucigsVw3fNI+2AGSHAo27LU28Kqm8DIoSyfMrPM6NUL?=
 =?us-ascii?Q?FVS4/5c9b6A7CeNr3QKIybOvS+dBLXg7mDVFp37GVJZcdAW8+fVEL+ck/GSl?=
 =?us-ascii?Q?Fn2tcxJgMg6puwb+qNq6HK6NfBOA/h/a61DJfetTSyCdvpkEqusVnFw2knUs?=
 =?us-ascii?Q?V+BsLZ9CNxuyNqjVU+rYBq7qCVQlii34a8V9qFOftHmBoTqljQuEAjiL6/0U?=
 =?us-ascii?Q?PuUzKIdBDp45P3G7IWCSJoLurtt3J+B9+OvMJh+lZhCqCna2MYY5heS+dMnB?=
 =?us-ascii?Q?nS9j7T+4bcI/8NerNjxokgGAaz79JtRdR/H8hoV3/cYKgGoCrvJup8x//hkL?=
 =?us-ascii?Q?wehWyHaopqpdvKZWw2EZ/1whyUI+yuc3kYkXbgh2FPNTsxTMAvS8axi9XqD4?=
 =?us-ascii?Q?WHhHQUw2dXab/MKbu+4g6/XUfs0eNRUvhgA0nFDNla2JspTcV6BC/+KaMzG9?=
 =?us-ascii?Q?Q/asSJfFhxK1TJQ0A0GcEDDPrkmjS23VEBzyTPKhjGFS5BV2HrBhJVkx8Rt3?=
 =?us-ascii?Q?5mK+q7MkVSEXfBKvlVEt3nPCnMvdz6in/S5KwZQu70nSAbvwHRK4hytBvq6Q?=
 =?us-ascii?Q?LR3HDgO9Lsx39rsGIamPt6kbKHkGGzUoI1ODPlqHHIdoFugv5WnfHsKiQjg/?=
 =?us-ascii?Q?1TfpiitNXvUNsjAt9AYa8yrQ8P0m64RraOW203EkeiXObPmwvVJ3wSqxptlN?=
 =?us-ascii?Q?zhgxu7XT3966P7bgHcMipOLVOHvMdYIgwMtwcRA7w66F7Jj+A2T+Qwi6/VlK?=
 =?us-ascii?Q?6jJ5ume6SyCnjapkd/NrwKm5saV7Nopfggj1/gfw1WRC0JZjJ7yJ1qNrAqDc?=
 =?us-ascii?Q?pTwPCf9vNFpeq99KrziSbeweWlydRbCfyyhjVF+uSvxO9Bb+sj3USdety/iz?=
 =?us-ascii?Q?7BKM44ZoOJY7GrfR48spcx4riPGXe2hVda640ReT5PjJjMYrjZNOnRMXWSpe?=
 =?us-ascii?Q?rjCZTw/if+4x/JxpDi49/aqInwZzvm1Nqe0RVJbz2CnJNjzNdPClcpDj1Dlv?=
 =?us-ascii?Q?TqboLMovtW2j0cHqU39vne+PnMW6U4a/B/yxmRYsZGwbiqW6vG5vannl3awN?=
 =?us-ascii?Q?duSZc2HcJrA9LZpryOMTwTPynGQPSPGn+TviBKMFjm0hxQcHVFtaOvhDzJAO?=
 =?us-ascii?Q?TZ6UXizOWVo9iZpwDknsn+1xmaTInlNSwS8yShlfl8HlgXsgduEBAJtaojZE?=
 =?us-ascii?Q?zJTlgH8WpBsOz2GpSIzHh4L9nwjO0eIBfmNf12jbGXy7ioglPk0S3/ILBP96?=
 =?us-ascii?Q?/+0gkq6ODQhIKAx+NUgKXSzz2xol+vzl0DlGH6u0st2bhH/YQHSAyG673JDS?=
 =?us-ascii?Q?OVjaFzBmjUX0tFd7OTOuisTiFjse11Hjr8UVnOEGzwhVqUHgOuGvIGqgg4Sp?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e0dfc403-26cb-4cd2-e4b9-08db04fcb264
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:05:57.6503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjqwIaoLVKqNmzj1SVV8ax2f56kCYjWiuCbI0yrv0O9liaycfVtWjhBP7TnQxjMu09y2VmdQ+IgyrY1eC07IShSyblIG5DkVkzDeyEA18Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2592
Received-SPF: pass client-ip=2a01:111:f400:fe0c::719;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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


