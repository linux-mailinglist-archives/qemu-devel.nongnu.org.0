Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06995327430
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:38:48 +0100 (CET)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRtu-00037L-W8
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRlC-0000Iy-OC; Sun, 28 Feb 2021 14:29:46 -0500
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com
 ([40.107.93.40]:18689 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl1-0003D6-34; Sun, 28 Feb 2021 14:29:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2RgbJrkv1tTBiHDYzJXHDM7eQgUB0d3kkXnPwwrA7pljRM2hx22IkkdZEOSwVfJ+LjVc0pkyqw8DBMdRJL4t51gN5VBG0eYjAmI1BL8p6r9aCSFEVrwE7QlRoX1Ilkd/SyLtX1bjUrvCMCw+GVe0dNoRxQC84j+teJMJeXKRVCePY2BziKi1RdCCpXAaMq5l0VCTj0QESKsS5hUbxc9m70o3PLkd8Q2xo2LJphne3YfpldfxE9hxW/VAMbhe3L9bwdsU9RUqSZ6Gb1OeTtX0idFHRxXK7zBjMNFCYelZE8UWcZwghdiGH7/BkiFrEnQuCDJ2OnPZBKMcK0kKoVHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6be1+AbxDPGus3FHMFVJGltK9t34CkzB952bL3rumo=;
 b=ffw4Xzxf/6DfDQ+N41T+BrtuWchUG46wwrbhSzuvKpRkcLSfg7SLA6BSaXQN1TbaWN5Uocd0VynxPBSjyKSILeIkPLRt8MiBg0Zsk0sCUKPPnE1bUOaC1GmX77ZOftA3tGjVOM4urcd9vxzLWrqTX7jdTqEXSNYKRe2UWEfeBeIrwjo/vuZSg20KxMwTlSliuurlCVlyjLbrALh0zFvzFf43MF6tXaRkyllCw3ctDTmPxsV8cuI/p5C20txoEvw50be+yB9EI3n6ERFr5IjgvXchW6JXiqKyjERVATb3dikEwL/qXs3DZf6Hr5HcZf0df4+nbj6weWdJnglhcSK3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6be1+AbxDPGus3FHMFVJGltK9t34CkzB952bL3rumo=;
 b=AG/2ro38BoEG35Xzsn4+c9RjKUoNrfmea9a3/kIuqV3U5ZCzLqExZ6UMs71o5v4H53mM4HvX7gk80INYhtl8gmHuxcltfbuWN4QJlDmpuZE+d3ZLUD4ezc1vwT9KY2elXayCqFl0oPJ6XzLiyTPkbIjHupDWY1zfD0gh2EJs5go=
Received: from CY4PR03CA0014.namprd03.prod.outlook.com (2603:10b6:903:33::24)
 by BN6PR02MB2516.namprd02.prod.outlook.com (2603:10b6:404:54::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Sun, 28 Feb
 2021 19:29:31 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::fe) by CY4PR03CA0014.outlook.office365.com
 (2603:10b6:903:33::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:31 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:17 -0800
Received: from [10.140.6.35] (port=57776 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkj-0008Az-Fx; Sun, 28 Feb 2021 11:29:17 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id A1FF013C0AB0; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, "Max
 Reitz" <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, Eric Blake <eblake@redhat.com>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Vincent Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Alistair
 Francis" <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
Subject: [PATCH v3 12/21] sd: emmc: add CMD21 tuning sequence
Date: Mon, 1 Mar 2021 01:03:18 +0530
Message-ID: <1614540807-30686-13-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03ed527f-51c5-479f-20db-08d8dc1f2bf3
X-MS-TrafficTypeDiagnostic: BN6PR02MB2516:
X-Microsoft-Antispam-PRVS: <BN6PR02MB251674250C56868A4735C70ECA9B9@BN6PR02MB2516.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HFQ7LFJx7x+xhWOZ1FClOZGegKRcMuxYBVstXQkJnBWMN9WI/YFSSrn6thALYa9+CHM4JlgQB8+fXZMZTi7MUxvrO0BwUTaOGM5enwnWFgi1F0N28eKBu68qWoHDnsR3NHd0PmLADvD9mAU9xIs/rH+BICs74kccLO3IvZ1wkCT1cp8xyQxgkpf5XPUY52y+bXHFloHgPQMTo4ZwimMmcXfkK3AtPQsjqp//Pwg31t7NNs8rE96L+TpKNPgwBPTJOsl5rvWJJH0H1viRzMmYX++FNf4fArfuy0fnVbyXtrWrYIwpHJSZ4NPnjzeF+R0bJAamI1iP3ld3S+tPtG7d9hFQ79vyWkqwAQKRt/ZDI3EDMhriXAr4qqMENFvoonfoLXX8nU3vuzFmXNaXbji6kb/aqIxTgaBw3tKA9OyTsn12vauD9HgoJaF8SbZU7yRQCUxovq1EjGxYGKHYxP0Xmei0dGgvDXfu+t3S9jnu9Fyo7oq/x/9J0RDdMGVhj8QXCK95M++TcipMEMbNEcYKb1o6e54ACkPgCnQdYXdT5W3VJfDBmK6TfsG40PoZOaUaoybES0B3POg4FQnHvqnzj2csixpi0UwZebdhCMP7Ip9RUWV6cVJm1RVgOIEjoV7B21xczMKNqo+tXsPyCe8F7sXnZScyDGbK45ZQs/7GGXrmJFqktOnZa3K9ANuHFyK+ipjLTbWASWVu7uwV4bG6ww==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39850400004)(396003)(376002)(36840700001)(46966006)(4326008)(70206006)(6666004)(107886003)(336012)(426003)(70586007)(478600001)(6266002)(186003)(36756003)(26005)(83380400001)(8936002)(7416002)(2906002)(5660300002)(7636003)(42186006)(36860700001)(2616005)(36906005)(82310400003)(82740400003)(54906003)(47076005)(356005)(8676002)(316002)(921005)(110136005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:31.1736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ed527f-51c5-479f-20db-08d8dc1f2bf3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2516
Received-SPF: pass client-ip=40.107.93.40; envelope-from=saipava@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eMMC cards support tuning sequence for entering HS200 mode.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bf963ec..174c28e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1386,6 +1386,14 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
+    case 21:    /* CMD21: mmc SEND TUNING_BLOCK */
+        if (sd->emmc && (sd->state == sd_transfer_state)) {
+            sd->state = sd_sendingdata_state;
+            sd->data_offset = 0;
+            return sd_r1;
+        }
+        break;
+
     case 23:    /* CMD23: SET_BLOCK_COUNT */
         if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
             break;
@@ -2120,6 +2128,30 @@ static const uint8_t sd_tuning_block_pattern[SD_TUNING_BLOCK_SIZE] = {
     0xbb, 0xff, 0xf7, 0xff,         0xf7, 0x7f, 0x7b, 0xde,
 };
 
+#define EXCSD_BUS_WIDTH_OFFSET 183
+#define BUS_WIDTH_8_MASK    0x4
+#define BUS_WIDTH_4_MASK    0x2
+#define MMC_TUNING_BLOCK_SIZE   128
+
+static const uint8_t mmc_tunning_block_pattern[128] = {
+       0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00,
+       0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc, 0xcc,
+       0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff, 0xff,
+       0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee, 0xff,
+       0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd, 0xdd,
+       0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff, 0xbb,
+       0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff, 0xff,
+       0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee, 0xff,
+       0xff, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00,
+       0x00, 0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc,
+       0xcc, 0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff,
+       0xff, 0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee,
+       0xff, 0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd,
+       0xdd, 0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff,
+       0xbb, 0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff,
+       0xff, 0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee,
+};
+
 uint8_t sd_read_byte(SDState *sd)
 {
     /* TODO: Append CRCs */
@@ -2213,6 +2245,21 @@ uint8_t sd_read_byte(SDState *sd)
         ret = sd_tuning_block_pattern[sd->data_offset++];
         break;
 
+    case 21:    /* CMD21: SEND_TUNNING_BLOCK (MMC) */
+        if (sd->data_offset >= MMC_TUNING_BLOCK_SIZE - 1) {
+            sd->state = sd_transfer_state;
+        }
+        if (sd->ext_csd[EXCSD_BUS_WIDTH_OFFSET] & BUS_WIDTH_8_MASK) {
+            ret = mmc_tunning_block_pattern[sd->data_offset++];
+        } else {
+            /* Return LSB Nibbles of two byte from the 8bit tuning block
+             * for 4bit mode
+             */
+            ret = mmc_tunning_block_pattern[sd->data_offset++] & 0x0F;
+            ret |= (mmc_tunning_block_pattern[sd->data_offset++] & 0x0F) << 4;
+        }
+        break;
+
     case 22:    /* ACMD22: SEND_NUM_WR_BLOCKS */
         ret = sd->data[sd->data_offset ++];
 
-- 
2.7.4


