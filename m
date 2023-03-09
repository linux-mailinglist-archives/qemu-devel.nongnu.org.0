Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74386B6BD5
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 22:47:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbTW5-0000Rs-3c; Sun, 12 Mar 2023 17:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTW0-0000R1-58
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:06 -0400
Received: from mail-db8eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::729]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTVy-0004XO-6I
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mi9WILqAO5YeHfXcvkARChiGI4RqBU2dbGJ05U6uRFbJ26uvs8pY0TmyB52bg4FAtEfxZNWmXVUAd/qtw+tftl8GFt2DkZ9mnqGKvIe+ztHVrfZW0MdVd5q+9/leEeQuWXyYew/8hB5fDKyYuTdZ4JOBHj+dyPXBQCk/JauzrOzrF73QwBBlmPnaGp4ELbTsvhOJKnJ2U/NdrzU4PIC/X373OuO8DNmMsOiTgvBTEXzBMKxy0B4/XIAmjfIE/38ZMEP+6zfpufYLp0vQV/2FEqcj7PBw14U3uwMFhYmU9frkPgQNOD+gN3jtQdV5XjR0slSw2wccXqJ1yEoRFKKaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLwfmyHoJOE/dRjk0UIB8ZwHhC1A4fctgKDDrLEcI5s=;
 b=kzgm9rlIhihmv9yG67S21y7SnLJ6Ighlgfdb7P7s9b6u517Ef6LjDarh9wSs67KMnTiL2WotZrhl1cyRcEjz4/Ye/tqEsEZcUF5orkIKpeF0YzsgnUB9ubsDJw6SlefJa3WeDLJIjAsnCIMQ4gE2hXhMNbkvL8xNu9D2ijTLUrbF0zQ6Hk/3O1lBy2cCO8cU84syWeCnQ4fBuA5UmEGutDLiKaQrquTWbZFvUSt5PdlyWrqc/G27UVD4DrAvEWDQnJYEEP25RE70D2BXQMX/QaesRMBAFpnjepZkTDiLbJ/8pxaWW3UgK8LN3ojTGInXea4qjfONht1ZNHrPSbRHuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLwfmyHoJOE/dRjk0UIB8ZwHhC1A4fctgKDDrLEcI5s=;
 b=lflhjgFhj8EUue9qI5xI244M2mCbxFfRsuadWbHGSsNhF4XaKcKFoDhzbhZCAaGoVnRGhneqcjmv9EIDug/YYVX5ygqDDeFCMW+418couXkfMgzDtAsIXqFvGhV3e38A6d8AUD5K3hCMu3TE65aGTz9gxaSv6l65SZF3BzBx5Nc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS4P189MB2207.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:58e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 21:45:45 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 21:45:45 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v7 4/8] igb: implement VFRE and VFTE registers
Date: Thu,  9 Mar 2023 23:00:08 +0100
Message-Id: <20230309220012.25642-5-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
References: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0098.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::30) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS4P189MB2207:EE_
X-MS-Office365-Filtering-Correlation-Id: cf568b52-07d6-4bcf-65a7-08db234321a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lxnShRkMsB2PwMxpclsXfOlv29UC04cTDLrG92Bi6BTxM7bACMAkO4m2i/2p8VP8JDlPqlTwllOs3Pu/J2iCYdBNLr7KXD6XbSJ+Po8IGB66wa8i2TK3gnfrZEJWOsOto2yKlaypWWiX8SVT0LAyg4WMVrYXcPjH+jZip0oSummKaioaFW2BGrFFBGmi5WpwDlkYFeaLtVR6js8DwsoYiyywwtuwrI9ST/hba2BJq/2Q3lkVPd0/Qa5KuiPchBr8jb5UGhTCT+Y4GA/GqIMkFNNTuDozllNfgPxk6MndfWoNEefZ/NBTIQrsFWT4rhwGsrdSv0OJjIEHIHF08Y18i4RADJqV8pHMS4aD3Y2WzCGn6z1PipWLRuleolmBqBCWtWjNfE1uN5znpXDQG0drqWzUHAVhyuXyGl+cPJrdPhZSpliDADXmVZte/6byqZeN6J+3aRZJllbNf0jtOLvunr/aSCaDfGlRUrYxJlsnrwNO37azui21CkTUIzwnZVK0Wp+hc4lOqviZ6q5+7+Ju3H3i9QsZgRaVNULzm5Ykn+3sLJlL42J0mqQuK3+8tM37chTnBWL0cZHb/qh6JrlEr9TltQmJ9OHryS7/RX7YZB1jJe+xxsk+6dVNIlV9PvAXc5cYxSHIcqw5Jb0hIFbaDIvjGyF3pDWX0XU/p8iM6kmruWoQhwJL8fL1b+0uiwEghcvh4iPR+5BzrJJ8o0GazsIjrmlhK8XlLJIqFs6UcGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(39830400003)(346002)(451199018)(109986016)(86362001)(36756003)(38100700002)(4326008)(70586007)(8676002)(66946007)(66556008)(66476007)(41300700001)(8936002)(54906003)(478600001)(316002)(44832011)(5660300002)(2906002)(2616005)(83380400001)(6506007)(6486002)(186003)(6666004)(6512007)(1076003)(26005)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cYE0iouUQXJBNofPyNVjD1cU10D3qnQAjP9wL5zkcXOLPOH0FCyj02ooD470?=
 =?us-ascii?Q?ueCPb6fgVaM8PWCcxgMkh2KLIFCeMuLVqO1M/gxuNmMHS5wAqf7I0K/YlCH5?=
 =?us-ascii?Q?y2Xz7ZefT2STvax9qAudc8w8Ckilnx3r0/f+JdmAmBsZiobEg8sWP6fGWdU9?=
 =?us-ascii?Q?6nv516Ik43ycitHNsAzj9iFHFamjssfHLHIfOR+Ctzxj4d9eiO9LhxxTQsqL?=
 =?us-ascii?Q?Va2Wmn9aQGccbt8rW3eoEea+mLB9PS38m4CpVRzdC7jqVLueBYqMubtHlOs2?=
 =?us-ascii?Q?D1KuyeJHWYgioOH5tTCkfLhaON6RZ6sJlWNFXVtaEFLvFOFjpJLM4fADPPSu?=
 =?us-ascii?Q?I91Nwvib0HYCrpunaqVhmtGe/6tVY/QKjyhNY9oH6Ggfg8y5Old3Dmmf3+ne?=
 =?us-ascii?Q?RtyWa0ib1TJorvZgp/+mDRrsrZ02V9bzUWXv4NXIXa7Y1yhFgsgJhGKKX3Sc?=
 =?us-ascii?Q?ZsJeienOuA4eiT1A8z2k41ilKazMiYJd9QAhD9SjnSwXFgBg3dM72vhXacgi?=
 =?us-ascii?Q?nQsFA7ZvAM52AbdkXs/KlYCkUluhA4xLoN+UWRFlK7MxzmV+yMXruS/2xNgf?=
 =?us-ascii?Q?jS+O+vxjidP6iVqA9KGVUtWOYft52viM1I1kzK1mz/+9GFMzg3eFpTjGbw3N?=
 =?us-ascii?Q?smnj9lZ/FoCFnl+Q+IJ2H2HT8ws6+99YWpnlA1h42Mz4LvnSPA3DlH5Q3Y7x?=
 =?us-ascii?Q?I3tW0J4gaKxIgyMoV22wv3U3pJs9NqoPRgKVMTIE58Zs3ob2kCSY5MVXzpWL?=
 =?us-ascii?Q?upbN5c8XV1zaT1tq/c65CdkBb6GT17Pl+hnWSKMLAlOEPP/275k8WIWHIEzm?=
 =?us-ascii?Q?y7Cav5b2ikO2RBu7+bnDL0ily6fVOEvLLfZztwnbYw2B4QQfxcF6/BHaOHiS?=
 =?us-ascii?Q?FOW4PmUlD9n3FjrzhcHl0tib5Dh4wvvLWaS5nUci6wWlIzGoKXE5hDwtHrp2?=
 =?us-ascii?Q?oGytxm4MCwv4S+hJJtvPJ+vo8oOyfo77vOUOgAdPQoV/cUwI5Bg8866SJQhk?=
 =?us-ascii?Q?vAncKIJSA5A7ridzrMZoyTYYKt0MeSJlL0FB5jX2Gg7PnQrpgronHoBg1QqC?=
 =?us-ascii?Q?H48le+5NDwRNk5ZtPn++P9L5kSWREa3NvSJEULBFwP7xYsF5PRvJJG9BUvBN?=
 =?us-ascii?Q?akBX+yz/faWaOEMoYY+7jIG+YfcjPAaMTdf6K9nmpPKDEe7w5K13LhwKWE1P?=
 =?us-ascii?Q?JMYrar1xZBaGhB5OU6l89NW71+XDTRw1likdLN79c3wO9t+oqxNacI3UCSYG?=
 =?us-ascii?Q?hDi2oPaHdYsN7GgUCO4aP8hgPmaR+vY6FK/770bpGNk6aknchJRM/KA5eyDj?=
 =?us-ascii?Q?cFKN/YUG6Ga2PNhsd0ivGoHrrvwyZ4O97LDopmMs4ek3I2B4gh7mbVj9xz5w?=
 =?us-ascii?Q?ZrkIG3lB+97HsxxyVdn+8rw2QxLctcohu7SK6v2OnHd40LINf5Qk7dTfLsYi?=
 =?us-ascii?Q?LPku6m1ZbocYmWhisqU+F5hMA9qnbK5KoYpPdaplqYg5v45izfDktXaJ+SKd?=
 =?us-ascii?Q?ekze3TXWEjAWcpU0WNslRCDl4QemVndlZQWqzWuT6pSVA5U6c75iXKGimmie?=
 =?us-ascii?Q?onCdhcsEXuBi/so6Vw9Lx6nO0rB5+BddWAZYrFEJhmCMHv7iGub4IqF5SSvT?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cf568b52-07d6-4bcf-65a7-08db234321a0
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 21:45:43.8090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gY3auvP7L/xy7Qv4KluK6iGRd4HfGmCJ+Giltdec/w0iF3XIbiIFIFbI7RKjOkKY9ivR65H80+fQMjO8xXgCIgoxk7bkR6gonf4svilasE4=
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

Also introduce:
- Checks for RXDCTL/TXDCTL queue enable bits
- IGB_NUM_VM_POOLS enum (Sec 1.5: Table 1-7)

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 38 +++++++++++++++++++++++++++++++-------
 hw/net/igb_core.h |  1 +
 hw/net/igb_regs.h |  3 +++
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 2a16692448..b2ea3a18ed 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -780,6 +780,18 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
     return igb_tx_wb_eic(core, txi->idx);
 }
 
+static inline bool
+igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi)
+{
+    bool vmdq = core->mac[MRQC] & 1;
+    uint16_t qn = txi->idx;
+    uint16_t pool = qn % IGB_NUM_VM_POOLS;
+
+    return (core->mac[TCTL] & E1000_TCTL_EN) &&
+        (!vmdq || core->mac[VFTE] & BIT(pool)) &&
+        (core->mac[TXDCTL0 + (qn * 16)] & E1000_TXDCTL_QUEUE_ENABLE);
+}
+
 static void
 igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
 {
@@ -789,8 +801,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
     const E1000E_RingInfo *txi = txr->i;
     uint32_t eic = 0;
 
-    /* TODO: check if the queue itself is enabled too. */
-    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
+    if (!igb_tx_enabled(core, txi)) {
         trace_e1000e_tx_disabled();
         return;
     }
@@ -866,6 +877,9 @@ igb_can_receive(IGBCore *core)
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         E1000E_RxRing rxr;
+        if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
+            continue;
+        }
 
         igb_rx_ring_init(core, &rxr, i);
         if (igb_ring_enabled(core, rxr.i) && igb_has_rxbufs(core, rxr.i, 1)) {
@@ -932,7 +946,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
 
     if (core->mac[MRQC] & 1) {
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
-            for (i = 0; i < 8; i++) {
+            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
                     queues |= BIT(i);
                 }
@@ -966,7 +980,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                 f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
                 f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
                 if (macp[f >> 5] & (1 << (f & 0x1f))) {
-                    for (i = 0; i < 8; i++) {
+                    for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                         if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
                             queues |= BIT(i);
                         }
@@ -989,7 +1003,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                     }
                 }
             } else {
-                for (i = 0; i < 8; i++) {
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                     if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
                         mask |= BIT(i);
                     }
@@ -1005,6 +1019,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
         }
 
+        queues &= core->mac[VFRE];
         igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
         if (rss_info->queue & 1) {
             queues <<= 8;
@@ -1565,7 +1580,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         e1000x_fcs_len(core->mac);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
-        if (!(queues & BIT(i))) {
+        if (!(queues & BIT(i)) ||
+            !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
             continue;
         }
 
@@ -1971,9 +1987,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
 
 static void igb_vf_reset(IGBCore *core, uint16_t vfn)
 {
+    uint16_t qn0 = vfn;
+    uint16_t qn1 = vfn + IGB_NUM_VM_POOLS;
+
     /* disable Rx and Tx for the VF*/
-    core->mac[VFTE] &= ~BIT(vfn);
+    core->mac[RXDCTL0 + (qn0 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
+    core->mac[RXDCTL0 + (qn1 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
+    core->mac[TXDCTL0 + (qn0 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
+    core->mac[TXDCTL0 + (qn1 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
     core->mac[VFRE] &= ~BIT(vfn);
+    core->mac[VFTE] &= ~BIT(vfn);
     /* indicate VF reset to PF */
     core->mac[VFLRE] |= BIT(vfn);
     /* VFLRE and mailbox use the same interrupt cause */
@@ -3908,6 +3931,7 @@ igb_phy_reg_init[] = {
 static const uint32_t igb_mac_reg_init[] = {
     [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
     [EEMNGCTL]      = BIT(31),
+    [TXDCTL0]       = E1000_TXDCTL_QUEUE_ENABLE,
     [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
     [RXDCTL1]       = 1 << 16,
     [RXDCTL2]       = 1 << 16,
diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
index 814c1e264b..24bb67f870 100644
--- a/hw/net/igb_core.h
+++ b/hw/net/igb_core.h
@@ -47,6 +47,7 @@
 #define IGB_MSIX_VEC_NUM        (10)
 #define IGBVF_MSIX_VEC_NUM      (3)
 #define IGB_NUM_QUEUES          (16)
+#define IGB_NUM_VM_POOLS        (8)
 
 typedef struct IGBCore IGBCore;
 
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index a658f9b53f..c5c5b3c3b8 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -160,6 +160,9 @@ union e1000_adv_rx_desc {
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
 
+/* Additional Transmit Descriptor Control definitions */
+#define E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx Queue */
+
 /* Additional Receive Descriptor Control definitions */
 #define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx Queue */
 
-- 
2.34.1


