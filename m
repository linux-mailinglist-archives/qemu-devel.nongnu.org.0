Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFE31864E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:28:36 +0100 (CET)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7L1-0007pU-5w
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76H-0002vW-QU; Thu, 11 Feb 2021 03:13:21 -0500
Received: from mail-dm6nam11on2088.outbound.protection.outlook.com
 ([40.107.223.88]:52064 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76G-0004fh-1A; Thu, 11 Feb 2021 03:13:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYVTdj8cli77uTm7/XcYShf7SSh5Cu+PCg3Fd/xBdHFv3s9MU1NAyhhLOdeHS21IatxF/GlWujB6m6UERv1rGY60x4nPgiBTDJuX2dM5a3VEwycVDnhi6sqJwA8dvrVitQaYRYXwl/CY5hrO78LoMEsQOfTJokzSu760aI6LsFLNx81al1cdPPH65dxbuAYe+8ELAKVGzQORPtdI8cioBe2xmchpYA3CTquuFJJmumFeM4Jz791i0jIzqjlK76rZphf8LJpO4nbuoMn0OKUmRxqjur8Nys868B1usKQQxfwUqJK5JmL9M9FQ9+qsdqURICRYa2JNLl1vKTUnQimHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak9KvnwmKqQ81VZ46sj6vnn+oCPC+/qsR820m+rHY68=;
 b=GRrZhiPtTvuQpWJ9C645SLg9k5SjBk7mcsMJgKvA40u6VQDfmCc7V8xlZeOm7o+CgxknEQ+zHW5YNRoG4XnakVs9wd/kqXrYeoPUkbr/EPyPF0APW9pb9HkTqmLb8Niy+uyRhNA6U9fFWPMLmJGD6sug4OJqUH6xVpl3taBoGvIiuHph6d2XNuTyv8Si9ml5CjDK4tU1O+jH9D1bDj0VJhOpji+dCwA4XX+2DNpsoMwl9saksvM64IwSKHsvCLPI1RVmhuZsp5z6zER/Xngoe4DfQnhDZzGoN936vq4YVWcqTXycLvb2vOkWEXWHQ/4/Rb6P8XyehCWl3vPIl0UZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak9KvnwmKqQ81VZ46sj6vnn+oCPC+/qsR820m+rHY68=;
 b=hcR7JPfp4wiowyvod+5C3GsvwRTpAcM84GTM7omdV+J3PnzQ5ZLu0ECXrg0ZPWRePiS3b2VrEzudn10b8qAQ704L5Nlu1RCgKizLI3FGL4MgHbswPOdUkQ3ImLB2NDLrNTDJUgJS0as3OWTYBT8VCfAQlgrcEJq77Gr9SdIUAqo=
Received: from BL0PR02CA0126.namprd02.prod.outlook.com (2603:10b6:208:35::31)
 by DM6PR02MB6857.namprd02.prod.outlook.com (2603:10b6:5:21e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 11 Feb
 2021 08:13:16 +0000
Received: from BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:35:cafe::ba) by BL0PR02CA0126.outlook.office365.com
 (2603:10b6:208:35::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Thu, 11 Feb 2021 08:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT009.mail.protection.outlook.com (10.152.77.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:13:16 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:51 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:51 -0800
Received: from [10.140.6.35] (port=49672 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75m-0000QC-PE; Thu, 11 Feb 2021 00:12:51 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id CB4A313C063C; Thu, 11 Feb 2021 13:48:13 +0530 (IST)
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
Subject: [RFC PATCH 07/15] sd: emmc: add CMD21 tuning sequence
Date: Thu, 11 Feb 2021 13:47:18 +0530
Message-ID: <1613031446-22154-8-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7ac4683-7687-486b-de0b-08d8ce64e24a
X-MS-TrafficTypeDiagnostic: DM6PR02MB6857:
X-Microsoft-Antispam-PRVS: <DM6PR02MB68575ECE8D4AD87AEADDA2F5CA8C9@DM6PR02MB6857.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UTmRf/pBItcKbtPeIOmd29JJ6G9CK4W5xmJIg86YaDKwB2c2b/x5rsSZ0gR2Fsh23aQMq6XsxJUi5ILRTFpU0OVaWyLTh32ktqbxfdISTEWHM66PovhOHCjwJfhcgM1mbQF6APyGi3ZxCX4MEQgPLb+1vYy7JVjKx+Wy4yiia+K6MZESAY5drNkeDv3PTGUEd6EP/7tgH7lU7vEf07Sv9ygS0p0w5N0v0t8UMO4kX4H0RoTohgnd+jReOOcde7e/1oD3uRz/qeadDrQko7D6GS9KHyQ6lHbp5T6V0twgBYv/jNRIBjFZyyiXH4AeF4gQrXxl7bvT4cAVV6bKPFnNWvXoZS5k4Bbh0PZhOFOLnWJ/eN1M7RE+7459qUn7ziFGdlcY8aRKvn4NfvScN+UDC0vB1XwJ7pGWwSESKWs8pz29am5hxl/NUYyo/1i3xXwas4jHf/BRQHJPgwK/1MtDZXlJQVH1gkMjWmNmVckV3zSBKC+Y3fDI1TMnYAX3ZNB35LY5yyaIM3g+G5h9U48k8RbXlhepMW6OxSUdCK1vbC+ALBNKOk3XuP/b4IwhyTtqxA6/LzVsPp46/LKYXA4o1yxCCWee8+l/J086N8sKW/MBB0J26lrRmyxzL89HIZxe2bf+g8+EzbDJId+bea/p5SEGcs26kKB0jnHaUDeZSH+Iw/OXa6Y0xVWqdFon/lg+XsYN82aqbCwvjAfJlWIr/Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966006)(36840700001)(921005)(82310400003)(2616005)(478600001)(83380400001)(26005)(7416002)(186003)(36860700001)(336012)(426003)(8936002)(356005)(36756003)(7636003)(107886003)(36906005)(82740400003)(8676002)(70586007)(70206006)(110136005)(316002)(5660300002)(42186006)(54906003)(6266002)(4326008)(2906002)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:13:16.0124 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ac4683-7687-486b-de0b-08d8ce64e24a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6857
Received-SPF: pass client-ip=40.107.223.88; envelope-from=saipava@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
index 7925174..90359f6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1378,6 +1378,14 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
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
@@ -2112,6 +2120,30 @@ static const uint8_t sd_tuning_block_pattern[SD_TUNING_BLOCK_SIZE] = {
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
@@ -2204,6 +2236,21 @@ uint8_t sd_read_byte(SDState *sd)
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
     case 22:	/* ACMD22: SEND_NUM_WR_BLOCKS */
         ret = sd->data[sd->data_offset ++];
 
-- 
2.7.4


