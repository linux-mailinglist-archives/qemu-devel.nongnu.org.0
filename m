Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8C1CF590
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 15:21:42 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYUqr-0001P1-0X
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 09:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jYUnx-0007bA-D6; Tue, 12 May 2020 09:18:41 -0400
Received: from mail-eopbgr690079.outbound.protection.outlook.com
 ([40.107.69.79]:37710 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jYUnq-0001zI-4u; Tue, 12 May 2020 09:18:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDEBD1Ukneo2HNwXfE+JIrqBBtIawxIaxwiwOkh5l8GWEbRZpwa25ndvKp6hEehoHvfaWB6ogOcm1or995foNVFuBxCX4Gfct/o8eBiCtSbIFIgMeLBw0/LBHOgsIT14oIob60O7/WYcY5P5OeVN4BvNAXwEvsQQn+QFsWJ54y07/2PRS9ELBGhJBQJ3ntqMvcFQu5v6/SpBD21hSBbAyu3I+IPLJEBXiIK5jElf0adHuO2MFpYDzH2fyea7HF3Fe1WR+VMJ+ZSiBkad6dPRckjbVtoxIUDqbKleZTDQcOoo2hXrDgiEy92EzY/pRj+e3qbr7MI3XrIqnHqVqtKbew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qcy7AiWaJQ7exUrLABRFOuplr1PsD3dmHV85EhUpWo=;
 b=NtxtmDP1XxGW4Fik1uZ43SnCcCylqTIgRjdJQLlH4OQ0bmRAjaq9aL9UV2WxOLd9hQ/qcbEpKfY9UBPFeIHczzTOrcLiQ3Iz4L4p9jI8YYATZVICccL8ll7wV0OEIndhLBF/hgtD3PkaAuPgSwSkgIjMbywflFuvHSjH2eibYUFkCVtX3Olh8C9jt6QZ8pUB2SfSktTmNmRgaCpcwWH0b07OUFlQ/PFnaCcVbexKyMdZLCB47hoJ8V3WTbxsj+mq0NT5nUOKeSQ8moHC2tdkGD7yHtqZrsqZZxW5eQfcypDvYjecydl6htTxMYxoO+chLfVUVowIQxFyHqT7Oc0JzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=wdc.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qcy7AiWaJQ7exUrLABRFOuplr1PsD3dmHV85EhUpWo=;
 b=p86SCndl9II+/qo/jyBjnYRPsoKDzSg9NygQTGvFf5rQHcViPOr+sZlfBl3V1qgFvYyk0GcmpmtKwnCjIyVrKei6vspNcNZ05O4bmzhjDFudOpdzWbE8hcAN8sKSMw/a9P+jrTyag3R0MV9ohENKn3ZBjLD1D/xn6WP4puEOLxM=
Received: from CY4PR06CA0039.namprd06.prod.outlook.com (2603:10b6:903:77::25)
 by DM6PR02MB6092.namprd02.prod.outlook.com (2603:10b6:5:1fb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 13:18:30 +0000
Received: from CY1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:77:cafe::8d) by CY4PR06CA0039.outlook.office365.com
 (2603:10b6:903:77::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Tue, 12 May 2020 13:18:30 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT028.mail.protection.outlook.com (10.152.75.132) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Tue, 12 May 2020 13:18:30
 +0000
Received: from [149.199.38.66] (port=47624 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jYUnV-0002QK-G2; Tue, 12 May 2020 06:18:13 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jYUnl-0005Yo-NO; Tue, 12 May 2020 06:18:29 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04CDIStW016834; 
 Tue, 12 May 2020 06:18:28 -0700
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1jYUnk-0005Yb-GS; Tue, 12 May 2020 06:18:28 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 24FFB13C0168; Tue, 12 May 2020 18:40:25 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Tong Ho <tong.ho@xilinx.com>, Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH v4 02/12] net: cadence_gem: Fix the queue address update
 during wrap around
Date: Tue, 12 May 2020 18:39:57 +0530
Message-Id: <1589289007-23629-3-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589289007-23629-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1589289007-23629-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(346002)(396003)(136003)(376002)(46966005)(33430700001)(33440700001)(2906002)(6266002)(6666004)(426003)(47076004)(42186006)(110136005)(82740400003)(70206006)(70586007)(316002)(478600001)(336012)(2616005)(4326008)(5660300002)(8936002)(8676002)(186003)(356005)(82310400002)(36756003)(81166007)(26005);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f40e06ff-5eee-4451-2502-08d7f676f69d
X-MS-TrafficTypeDiagnostic: DM6PR02MB6092:
X-Microsoft-Antispam-PRVS: <DM6PR02MB60923AC7A2CE2B60F47B929ECABE0@DM6PR02MB6092.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6+b1TDYFAk+7Nqa/W7fjU5CKKOR5Yh6AqevhoEpPrdKnF/uzpazMrn8s/T29/D2NSRqCDKbUIyEuNMdpQZ49ZosRE+UnoVrmbs9p9DJthE+pivGMVkaLnTOUzLH4K6qB3XWlMJewF7ZTuXDQCblIXjMrh0JIaKzpQ81qgNGSV6N0WJJhSnT3PSxE1yW0J7xdkqTG6hT37vqUJSw9KXCVCKn6PcGV390qtAb8+Um++0A5myQ+XPOHlJzG8xymREeDsWgzO/RQCvqyNleOwOGmUgbpE3eWX3LHVRaRFtGqKo2csNxhD5SM7iXBLQ+kvaVH4cQwhT/fYZucUPPGRfByUNIn5xAIHLX1WjIJ7qV6zfus1iJzwqraXuOsTU98PSKxx6umxQX/1ENUcvs0AZdcvFiyD99ogQHbo4SXa0U23yVs4iHtzUS1hKDdUPBMuoyx+XZ19ufFyveGnOYDz5HELv4GvfcJZ7pTuNuc5+yYf8e0YN0iRTZJFmVITj2nBKXYwkGmDUuyISxD9Ms4Dr1MfJhJjBItfu4lusxpzdEM0c/kaX4OmNWZIV7eAxcldTPKhevctOOBtRARJmsK+nqvQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 13:18:30.0132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f40e06ff-5eee-4451-2502-08d7f676f69d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6092
Received-SPF: pass client-ip=40.107.69.79; envelope-from=saipava@xilinx.com;
 helo=NAM04-CO1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 09:18:32
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During wrap around and reset, queues are pointing to initial base
address of queue 0, irrespective of what queue we are dealing with.
Fix it by assigning proper base address every time.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 5476c62..c3536ce 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -845,6 +845,35 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
     return 0;
 }
 
+static uint32_t gem_get_queue_base_addr(CadenceGEMState *s, bool tx, int q)
+{
+    uint32_t base_addr = 0;
+
+    switch (q) {
+    case 0:
+        base_addr = s->regs[tx ? GEM_TXQBASE : GEM_RXQBASE];
+        break;
+    case 1 ... (MAX_PRIORITY_QUEUES - 1):
+        base_addr = s->regs[(tx ? GEM_TRANSMIT_Q1_PTR :
+                                 GEM_RECEIVE_Q1_PTR) + q - 1];
+        break;
+    default:
+        g_assert_not_reached();
+    };
+
+    return base_addr;
+}
+
+static inline uint32_t gem_get_tx_queue_base_addr(CadenceGEMState *s, int q)
+{
+    return gem_get_queue_base_addr(s, true, q);
+}
+
+static inline uint32_t gem_get_rx_queue_base_addr(CadenceGEMState *s, int q)
+{
+    return gem_get_queue_base_addr(s, false, q);
+}
+
 static hwaddr gem_get_desc_addr(CadenceGEMState *s, bool tx, int q)
 {
     hwaddr desc_addr = 0;
@@ -1043,7 +1072,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         /* Next descriptor */
         if (rx_desc_get_wrap(s->rx_desc[q])) {
             DB_PRINT("wrapping RX descriptor list\n");
-            s->rx_desc_addr[q] = s->regs[GEM_RXQBASE];
+            s->rx_desc_addr[q] = gem_get_rx_queue_base_addr(s, q);
         } else {
             DB_PRINT("incrementing RX descriptor list\n");
             s->rx_desc_addr[q] += 4 * gem_get_desc_len(s, true);
@@ -1199,7 +1228,7 @@ static void gem_transmit(CadenceGEMState *s)
                                     sizeof(desc_first));
                 /* Advance the hardware current descriptor past this packet */
                 if (tx_desc_get_wrap(desc)) {
-                    s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
+                    s->tx_desc_addr[q] = gem_get_tx_queue_base_addr(s, q);
                 } else {
                     s->tx_desc_addr[q] = packet_desc_addr +
                                          4 * gem_get_desc_len(s, false);
@@ -1251,7 +1280,7 @@ static void gem_transmit(CadenceGEMState *s)
                 } else {
                     packet_desc_addr = 0;
                 }
-                packet_desc_addr |= s->regs[GEM_TXQBASE];
+                packet_desc_addr |= gem_get_tx_queue_base_addr(s, q);
             } else {
                 packet_desc_addr += 4 * gem_get_desc_len(s, false);
             }
@@ -1457,7 +1486,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         if (!(val & GEM_NWCTRL_TXENA)) {
             /* Reset to start of Q when transmit disabled. */
             for (i = 0; i < s->num_priority_queues; i++) {
-                s->tx_desc_addr[i] = s->regs[GEM_TXQBASE];
+                s->tx_desc_addr[i] = gem_get_tx_queue_base_addr(s, i);
             }
         }
         if (gem_can_receive(qemu_get_queue(s->nic))) {
-- 
2.7.4


