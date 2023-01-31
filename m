Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DBB682954
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:44:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnAU-0002Gg-Rq; Tue, 31 Jan 2023 04:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAL-0002Ca-Q8
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:43:03 -0500
Received: from mail-he1eur04on2117.outbound.protection.outlook.com
 ([40.107.7.117] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAI-0001hQ-ED
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:43:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTwxvBO/vEyAMAKrqSgE1W/rZIExfyD01Urtmxt5gpp7eu0iPcCr7T1SLxgPUuHAHSa5JTPY9hWTfA9c2i/MQ7+3ddPhQPpRQjW5HIprveSRJHqk0HyfrkKID9lui1A3AKp/ykaWR60qWi/mAI20cyaAAn21Oe+Hfhu9mAIXN3ki/tU9bI/PHLGAgxr5hU/npxfjUpcwstkT4SzvzuCe7/rmXnvw2vM9Yv8V5eS0wwy2JE+mHT4qH5fqbxOB/WVnPDnfhhMjfpWNdfT2CydNcz5R8c3dQgX3M1n35WN/oshKETaZGDRwqo45abSi9LndTX9pS2xlEgjwzz65AuydbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvRwuQ8fpwwH/1nbAAS6JF8MU4WNO2ucSARCxyM+cxM=;
 b=Mx3HRjh2wOOZGmcll7hOy3ty2FpPcUrVm7j6+KxS3+gTUhqxgVXxLWFrduBgheoPjkMH4FkC+Cqwp6lHUG4B2VEjFYsERAO+U9Qu1OCAqZ5T+cyzPv3wtOUXlv31dnSHSlDhGAT04FoABAn3cH6v9cVtMCl7ICa3CnaUyxpx+vvPICsAcaBPB4wlarvR4ygzLnrDX06P1VPgMLbofpeBBo+xHsa5ltJ8dBxseTYeWQushDt253Xu1ye0HjyALC4cqv4fyjLyxK3L0CNjXlaJ3HgsnpTibwYbycFNKSu1AABsOFGSg4X1yq/RM9V6rSUM0uxXPt2nX/3kdW90538Cbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvRwuQ8fpwwH/1nbAAS6JF8MU4WNO2ucSARCxyM+cxM=;
 b=WHMuyoMheUjM1ZiWs/Bltvkc+QGJ3uGga9LKPZUqXvDe3B7xihH5uyjrP2X7kQ/GEUHCSO86BCMJySSly5Aky5umPL93OTmj22M76GSY+VJ70TFLCMP1O7OU0f3uZev2yIY5T5qVNEAA3tByW7HMSV2tr3LnMbkUPpazaRpMrFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:42:43 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:42:43 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v3 8/9] igb: respect VT_CTL ignore MAC field
Date: Tue, 31 Jan 2023 10:42:31 +0100
Message-Id: <20230131094232.28863-9-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0055.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::27) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: e6adc6b1-1ff0-4ef8-e59c-08db036f7d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMZAAN0nsaZQV8ONd2ekgH0RKfOkrabyuKEUzW/Vb12BE7OZgSK7lQz+59S0uxgNP0zFkFRmUMXgykGiTUIaa7sXx4gV5HnVhKb+qaRu19AVBzdJozh4xz/kmvmWBF8fmP4nsJmJ2rThD0aqkDkO+AtSbLaWnNum4dam3ECkikE6Nafo5tvdyVXKlEelR4qZtfi83HhZ5ZnPcgRfanJNDiRNcbs65Ku59pnXMvdgf9LO3sEYdc2WsVGUoE6of9wm/SSNgIV+npjCLgHcCZypBDIb4j0DXUS8T0Rk4NSMKasXdtWnH2CQr9zcfLKIzMp5nlzGtFTgapFOjztebX8KCmyHKuedcTBiGFleYDUgq53HBUB0XtxRFSWYX28X555DwVBkoC7+SxuQIyyF6ihrlcs7+nK/CEBhseKjikKGBxWjImSjLGOvnRjHx2eU19EFCtrIqRw5z4WpssE5BK3881U9JLJX53mOag/J8fKIDOtkTBVwG3LGEhcr3XQSYLfl7ExI9qDDnZxpg9qzCvk3TmSIB6o6I5BP2ct2AlGAsvB2/pteQZrrk55+RWSotn7sRoZN1ReGqCN8TxoWIOhvXs4dor+MTo9DvdrSH5voNwPA+QFa/VVJcD309KAGZu4eVCblFstKkICebvTEiPlJWa50HLkGmnVfFdEaCv0HDHL3ZtpqBSqScSiosNzkvhg/iNqRt0rQpiWnrB8WwC8to3uKwEQRtjNrtCvpLPrSKtM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(451199018)(109986016)(316002)(66946007)(70586007)(66556008)(83380400001)(86362001)(38100700002)(54906003)(36756003)(6512007)(26005)(186003)(2616005)(478600001)(6486002)(6506007)(6666004)(1076003)(5660300002)(44832011)(8936002)(2906002)(41300700001)(66476007)(4326008)(8676002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SMNq2AeRbMCjrnjKKmx6byLtBepr+wrTz2VptQ7t9JmVSo9EPW3lZ9oVPgcO?=
 =?us-ascii?Q?Ud5D37lBMR7ysp0rN0KpZO0E2y95rDXYYUemQarqPR2IxQHWPdKXz1axyQw5?=
 =?us-ascii?Q?NxPjtKlZR38HPqwaG5hn9kN07MFVyb62gQ/ye5xc5kpcCTHMnxpknmfHe6nC?=
 =?us-ascii?Q?maYl+AYlz7h9C2D/aRnNTXbs4Miut+Na+AXGxaIh0xAVHu3xi479rEycwXct?=
 =?us-ascii?Q?U9VCyXxgmVXI6Mvgz9zqUKSnmS4AMHq8vQSyUbIN+slKjAXZ9bUhSIcHL0ks?=
 =?us-ascii?Q?CGAuWVo3/dvTnBDDZ1yRhfSYJkHoDt74+OG8d161q95S/reNNWhUQiPHv3Es?=
 =?us-ascii?Q?Koho7LitTbt/krcdtlIQKE1q6wPUOXYW1hTuMQVgns8ESpt9MmsmTSjuiaxM?=
 =?us-ascii?Q?LxssZTA3LJqyZkPfnASWxEYdZVXQQcghfKOxeYL7vEQ9vR5UXrBdCf0oG2Wf?=
 =?us-ascii?Q?7CBl8GBvW/m9a2jSXBiVHf+Yzuy4dvCLBaeMsNej2Aj4u7FX0qRV0WnkjNoA?=
 =?us-ascii?Q?6IvCtfN65DAjVwrKVopwI7ILcBeCXK65bdQHfKa61eNRDdtTzJ9WbCABvq0l?=
 =?us-ascii?Q?WgehaFifKxi9PNxqlCmOFnxEIVt3eYPMW97K7H4KjcqKTaL0nUX2Y++WV//9?=
 =?us-ascii?Q?qXpxahCXm0K78DyzPPNqi4i22X90wAWVq1tgSDhAsDbNgwsMD3ti2Ep2bEtr?=
 =?us-ascii?Q?pGsHNhTIz2UwAHFDFUhZoQn8u4+qI7jK7qcApP9UXARpnJ5rdYbqBk8qwDI6?=
 =?us-ascii?Q?n62AimH/l/877c2YB/P2DzZU4qqVZNmPLEA/cxxawA6tJLd/feeW0stAmXlc?=
 =?us-ascii?Q?6oWTfnN7axzPkYk0j4m7U+JdAEuKNLxTh6MIzIcmBOJlnXGFSBlKJXXVAmfo?=
 =?us-ascii?Q?tsJwIlmOhCbQY9eGNnkHnWmJ5KPlHM8u6R6hHZh0jbG31GzbjJKwYZus1rac?=
 =?us-ascii?Q?JSSykufYEjphHBvsZPZ/KzQKJ/9y2yNZCZ4GQsHxWDl7cZN19Teu2Bf/8jGk?=
 =?us-ascii?Q?pDpqjtoYmgKyMVa3O0/Cl5VdX+3ZFmK/kBb+Bl7z5syr3JGaDj/9LK/ztUzu?=
 =?us-ascii?Q?gt7qYSRnSNQkJe9QF02Xa8VWAhtLPBqHTYclBae+xmm3R+B0JXOyNtcRSbei?=
 =?us-ascii?Q?H/keshLMTrmExkdDE/QSW6hE6BY2WAMsrB0xbYt0JEg2DZfeLNyp3tQca49T?=
 =?us-ascii?Q?lB0OFjO9DhQqbV+uzMErg+Sv+crMjSFwqaQhLjl407t0s1ubAqrAzqa/4J6g?=
 =?us-ascii?Q?n/6+vPOPZDILONIG2t5QGDNX0YTiXs1cTplHDr+eDk0Hm8D53AE68LbfV4rF?=
 =?us-ascii?Q?7gUiPfe+60ZzAUV4nuvDQzyx6JdK/0UUo0Q/idiOciLl7XEo99TBL/qAW4MX?=
 =?us-ascii?Q?JEe5wpZAUwo2TdE65ADMUy4Pfa8ivHG7IJPXabePMgSJx/2v1w/8LMIkyzHu?=
 =?us-ascii?Q?I8HqunRqVykXiDgGL2Icm1rgp8B8/iXy00UVZmd0TsO1Vg4QJVw3+wWLdRMO?=
 =?us-ascii?Q?SoHgAj3JuOV3Mu22IINolg7WCfcY6v2ZXD+LW/HT1WghkhYOvqC2AJIsakna?=
 =?us-ascii?Q?xn42AFJiHmjXq5UzuwWomjNlobeboDfT/kFWdwCNPOi+8cj3AA8Y9ti8ACrO?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e6adc6b1-1ff0-4ef8-e59c-08db036f7d93
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:38.7248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sat6PIwz48bGLXPBupUZRbl/8rJM+6FsBpSCAa6GN5KzQwZubpNihVhJVg6bdIyrAy9peRvhGvzOC3aPQm6cJtAQSNAwkcws2cSiu5ydIoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
Received-SPF: pass client-ip=40.107.7.117;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Also trace out a warning if replication mode is disabled, since we only
support replication mode enabled.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c   | 9 +++++++++
 hw/net/trace-events | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index c5f9c14f47..8115be2d76 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -964,6 +964,10 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
     }
 
     if (core->mac[MRQC] & 1) {
+        if (!(core->mac[VT_CTL] & E1000_VT_CTL_VM_REPL_EN)) {
+            trace_igb_rx_vmdq_replication_mode_disabled();
+        }
+
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
             for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
@@ -1010,6 +1014,11 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             }
         }
 
+        /* assume a full pool list if IGMAC is set */
+        if (core->mac[VT_CTL] & E1000_VT_CTL_IGNORE_MAC) {
+            queues = BIT(IGB_MAX_VF_FUNCTIONS) - 1;
+        }
+
         if (e1000x_vlan_rx_filter_enabled(core->mac)) {
             uint16_t mask = 0;
 
diff --git a/hw/net/trace-events b/hw/net/trace-events
index e94172e748..9bc7658692 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -288,6 +288,8 @@ igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint3
 
 igb_rx_metadata_rss(uint32_t rss) "RSS data: 0x%X"
 
+igb_rx_vmdq_replication_mode_disabled(void) "WARN: Only replication mode enabled is supported"
+
 igb_irq_icr_clear_gpie_nsicr(void) "Clearing ICR on read due to GPIE.NSICR enabled"
 igb_irq_icr_write(uint32_t bits, uint32_t old_icr, uint32_t new_icr) "Clearing ICR bits 0x%x: 0x%x --> 0x%x"
 igb_irq_set_iam(uint32_t icr) "Update IAM: 0x%x"
-- 
2.34.1


