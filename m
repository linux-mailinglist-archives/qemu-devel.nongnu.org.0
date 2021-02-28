Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F1E327439
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:43:55 +0100 (CET)
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRys-0001hZ-To
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRlA-0000Cj-C6; Sun, 28 Feb 2021 14:29:44 -0500
Received: from mail-dm6nam11on2067.outbound.protection.outlook.com
 ([40.107.223.67]:52800 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl2-0003ER-56; Sun, 28 Feb 2021 14:29:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uv5Pac6BVZbTs2wdfoH+rZYXqPtp8CS3+V8vS9GSICki0xoZI7jfbM9EmhPFQGoQgMkTyrKnOzBEA4OeMq1AsOCSkGTNEfAAWU7fV+AaCvc7YFBObdSUsHZC7Y5/9O3Wlj1wT2RcNTfJ7Qf+ZguYwbgyJJvHXBhMJIxzqx1J5/cwGQwZhwlQqqOOUvgfl7o5GZQkPQrEVlfroWYGzdw/UKXyt38E6aZA69BZm+Hf6+0PdkPtKdZGybMaeCm+Hv/vYgJW3jrRzsT2/e6gI2Y4NtviB8zSBEUtbxTI8VaTDf4JRdHx9W32eZmiXdg+38/0xREVUIxAEciUKAr4KY4fRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJPvQMryhZRpSdyg+7ffy7+Taz5WzYNokWUtSoFYIjw=;
 b=L6gxhtnKLkp9eq7ttNc2wf70r2VtLKuTZ4rBwtD9tMsVfwZouS+Y7gCMnabPDoettgM7FRs/9dkkl4bB8NIjIyuSHLBfe9hbVCg2zmSS46mlzP7m43oDCe/EdMy5seVpLfukCZD03ueSDjcaPpbo/fPrxlOkKQIh4aE52QR5FGtAkkeGBSC5c5qeWjGSFq/ma7gcjWf6vD2WhW9+9emEUQu6wrSw5CJroXRbrXkC67Bbnjod5nAJW5wOuYEYvXddasB7CzseYPg16tnQx+DWkz/F7WV21/wCAcdynbJeaU8BcUhLb1ZHY6lIC/JfJEcAm3Y6uVoePAFVNjcVi9Jskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJPvQMryhZRpSdyg+7ffy7+Taz5WzYNokWUtSoFYIjw=;
 b=orU5vmydr0MssFe2ATBOH3ZCP+K3jUZRaPQIQuPDHGw8Ee04TlYknGloT/3uyDqXxI8/OYYjSVYNiFBu365I/gAiRbUsAO81mROqc21p6z6f5J29ZJ2qlnQuDEMM/poZD7dqHRFRQ5Jg3HzuWmVXxPOtMOFJbNya2JhyOz+pKYA=
Received: from CY4PR03CA0014.namprd03.prod.outlook.com (2603:10b6:903:33::24)
 by MWHPR0201MB3545.namprd02.prod.outlook.com (2603:10b6:301:79::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Sun, 28 Feb
 2021 19:29:32 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::fe) by CY4PR03CA0014.outlook.office365.com
 (2603:10b6:903:33::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:32 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:18 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:18 -0800
Received: from [10.140.6.35] (port=57770 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkj-0003MM-Eb; Sun, 28 Feb 2021 11:29:17 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 6890D13C09CF; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 05/21] sd: emmc: Add support for EXT_CSD & CSD for eMMC
Date: Mon, 1 Mar 2021 01:03:11 +0530
Message-ID: <1614540807-30686-6-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 162b0378-04a7-4fa0-b536-08d8dc1f2c8c
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3545:
X-Microsoft-Antispam-PRVS: <MWHPR0201MB35454AAFC67EE3E5CB7C5CD0CA9B9@MWHPR0201MB3545.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: niBRxuejSM88lB0AndN1BsDbCwaM6MVzkxfPV5yqhk8UnFVXVpaG21u2oGVPAmbLDsBF+UGDr0ELJ3pE9tjRDF2HWUBq6qfDJiy4upDF76HwDaLDEMRqGo8K3iYaA9ltJ/TydPekRsIso+tf3xZC3OLlNOxDTHKhegMYG5qtv7BZgIvbbEikWA5UhEOB785E2JjPrPnnKjgwM9uO1Z2a7t7L2ON3rZ8Gj+HjBOWYLIRG2ANqJ00kXqVjowNyhvs4xziSi5b+md4HNIKS4cqCiGuSDeWeoAAUPGwqxIqO8WFSPibQkRm/nNe0sop4knVkE1pqD0gqXt7eHFeFZKtK72v63u1aPpVYk+ES69C63ySSwOh3AUZUA4AkNan05ZyPQLKVLsgp+jxkdmZooguGtCeQIomEeYHkbJ/u+FOf8U96rkwxEqGUMbVjaFs4jvqpEVoS77TyCSKvFbnIfvb8ybOE4lcMc59J2qRH8WVb9GUaAcpnLc2WLbJeCigaADmRuGSK2dlHM6qNcnGVA5jwzVmtNZDppke3msGdyhxapV7o0ry98WDcbRLty5vCDe7OUk/yP2DY0B+S9ercBOUpV10ZipCDjqpwo0Ok+Efxr8P+qUt240KpkbzWdkUTc+w+yFxz4u3E0AUo1VQ93xTgPzpj0UKTfdPMq9UXdtsGkhRfeaR4f7HyOG36xH/RiPEnX5cyjefsnFCl48AAKQBmkw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(46966006)(36840700001)(82740400003)(316002)(478600001)(186003)(7636003)(42186006)(26005)(356005)(6666004)(426003)(70206006)(36906005)(70586007)(36756003)(4326008)(110136005)(6266002)(36860700001)(8676002)(54906003)(7416002)(8936002)(921005)(107886003)(82310400003)(2906002)(66574015)(83380400001)(336012)(47076005)(2616005)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:32.1021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 162b0378-04a7-4fa0-b536-08d8dc1f2c8c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3545
Received-SPF: pass client-ip=40.107.223.67; envelope-from=saipava@xilinx.com;
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

From: Vincent Palatin <vpalatin@chromium.org>

eMMC CSD is similar to SD with an option to refer EXT_CSD for larger
devices.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
[clg: Add user friendly macros for EXT_CSD register]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[spb: updated commit message]
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sdmmc-internal.h | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/sd/sd.c             | 61 +++++++++++++++++++++++++++++--
 2 files changed, 156 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdmmc-internal.h b/hw/sd/sdmmc-internal.h
index d8bf17d..7ab7b4d 100644
--- a/hw/sd/sdmmc-internal.h
+++ b/hw/sd/sdmmc-internal.h
@@ -37,4 +37,101 @@ const char *sd_cmd_name(uint8_t cmd);
  */
 const char *sd_acmd_name(uint8_t cmd);
 
+/*
+ * EXT_CSD fields
+ */
+
+#define EXT_CSD_CMDQ_MODE_EN    15  /* R/W */
+#define EXT_CSD_FLUSH_CACHE   32      /* W */
+#define EXT_CSD_CACHE_CTRL    33      /* R/W */
+#define EXT_CSD_POWER_OFF_NOTIFICATION  34  /* R/W */
+#define EXT_CSD_PACKED_FAILURE_INDEX  35  /* RO */
+#define EXT_CSD_PACKED_CMD_STATUS 36  /* RO */
+#define EXT_CSD_EXP_EVENTS_STATUS 54  /* RO, 2 bytes */
+#define EXT_CSD_EXP_EVENTS_CTRL   56  /* R/W, 2 bytes */
+#define EXT_CSD_DATA_SECTOR_SIZE  61  /* R */
+#define EXT_CSD_GP_SIZE_MULT    143 /* R/W */
+#define EXT_CSD_PARTITION_SETTING_COMPLETED 155 /* R/W */
+#define EXT_CSD_PARTITION_ATTRIBUTE 156 /* R/W */
+#define EXT_CSD_PARTITION_SUPPORT 160 /* RO */
+#define EXT_CSD_HPI_MGMT    161 /* R/W */
+#define EXT_CSD_RST_N_FUNCTION    162 /* R/W */
+#define EXT_CSD_BKOPS_EN    163 /* R/W */
+#define EXT_CSD_BKOPS_START   164 /* W */
+#define EXT_CSD_SANITIZE_START    165     /* W */
+#define EXT_CSD_WR_REL_PARAM    166 /* RO */
+#define EXT_CSD_RPMB_MULT   168 /* RO */
+#define EXT_CSD_FW_CONFIG   169 /* R/W */
+#define EXT_CSD_BOOT_WP     173 /* R/W */
+#define EXT_CSD_ERASE_GROUP_DEF   175 /* R/W */
+#define EXT_CSD_PART_CONFIG   179 /* R/W */
+#define EXT_CSD_ERASED_MEM_CONT   181 /* RO */
+#define EXT_CSD_BUS_WIDTH   183 /* R/W */
+#define EXT_CSD_STROBE_SUPPORT    184 /* RO */
+#define EXT_CSD_HS_TIMING   185 /* R/W */
+#define EXT_CSD_POWER_CLASS   187 /* R/W */
+#define EXT_CSD_REV     192 /* RO */
+#define EXT_CSD_STRUCTURE   194 /* RO */
+#define EXT_CSD_CARD_TYPE   196 /* RO */
+#define EXT_CSD_DRIVER_STRENGTH   197 /* RO */
+#define EXT_CSD_OUT_OF_INTERRUPT_TIME 198 /* RO */
+#define EXT_CSD_PART_SWITCH_TIME        199     /* RO */
+#define EXT_CSD_PWR_CL_52_195   200 /* RO */
+#define EXT_CSD_PWR_CL_26_195   201 /* RO */
+#define EXT_CSD_PWR_CL_52_360   202 /* RO */
+#define EXT_CSD_PWR_CL_26_360   203 /* RO */
+#define EXT_CSD_SEC_CNT     212 /* RO, 4 bytes */
+#define EXT_CSD_S_A_TIMEOUT   217 /* RO */
+#define EXT_CSD_S_C_VCCQ          219     /* RO */
+#define EXT_CSD_S_C_VCC                 220     /* RO */
+#define EXT_CSD_REL_WR_SEC_C    222 /* RO */
+#define EXT_CSD_HC_WP_GRP_SIZE    221 /* RO */
+#define EXT_CSD_ERASE_TIMEOUT_MULT  223 /* RO */
+#define EXT_CSD_HC_ERASE_GRP_SIZE 224 /* RO */
+#define EXT_CSD_ACC_SIZE    225 /* RO */
+#define EXT_CSD_BOOT_MULT   226 /* RO */
+#define EXT_CSD_BOOT_INFO   228 /* RO */
+#define EXT_CSD_SEC_TRIM_MULT   229 /* RO */
+#define EXT_CSD_SEC_ERASE_MULT    230 /* RO */
+#define EXT_CSD_SEC_FEATURE_SUPPORT 231 /* RO */
+#define EXT_CSD_TRIM_MULT   232 /* RO */
+#define EXT_CSD_PWR_CL_200_195    236 /* RO */
+#define EXT_CSD_PWR_CL_200_360    237 /* RO */
+#define EXT_CSD_PWR_CL_DDR_52_195 238 /* RO */
+#define EXT_CSD_PWR_CL_DDR_52_360 239 /* RO */
+#define EXT_CSD_BKOPS_STATUS    246 /* RO */
+#define EXT_CSD_POWER_OFF_LONG_TIME 247 /* RO */
+#define EXT_CSD_GENERIC_CMD6_TIME 248 /* RO */
+#define EXT_CSD_CACHE_SIZE    249 /* RO, 4 bytes */
+#define EXT_CSD_PWR_CL_DDR_200_360  253 /* RO */
+#define EXT_CSD_FIRMWARE_VERSION  254 /* RO, 8 bytes */
+#define EXT_CSD_PRE_EOL_INFO    267 /* RO */
+#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_A  268 /* RO */
+#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_B  269 /* RO */
+#define EXT_CSD_CMDQ_DEPTH    307 /* RO */
+#define EXT_CSD_CMDQ_SUPPORT    308 /* RO */
+#define EXT_CSD_SUPPORTED_MODE    493 /* RO */
+#define EXT_CSD_TAG_UNIT_SIZE   498 /* RO */
+#define EXT_CSD_DATA_TAG_SUPPORT  499 /* RO */
+#define EXT_CSD_MAX_PACKED_WRITES 500 /* RO */
+#define EXT_CSD_MAX_PACKED_READS  501 /* RO */
+#define EXT_CSD_BKOPS_SUPPORT   502 /* RO */
+#define EXT_CSD_HPI_FEATURES    503 /* RO */
+#define EXT_CSD_S_CMD_SET   504 /* RO */
+
+/*
+ * EXT_CSD field definitions
+ */
+
+#define EXT_CSD_WR_REL_PARAM_EN   (1 << 2)
+#define EXT_CSD_WR_REL_PARAM_EN_RPMB_REL_WR (1 << 4)
+
+#define EXT_CSD_PART_CONFIG_ACC_MASK  (0x7)
+#define EXT_CSD_PART_CONFIG_ACC_DEFAULT (0x0)
+#define EXT_CSD_PART_CONFIG_ACC_BOOT0 (0x1)
+
+#define EXT_CSD_PART_CONFIG_EN_MASK (0x7 << 3)
+#define EXT_CSD_PART_CONFIG_EN_BOOT0  (0x1 << 3)
+#define EXT_CSD_PART_CONFIG_EN_USER (0x7 << 3)
+
 #endif
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bc9d913..a26695b 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -135,6 +135,7 @@ struct SDState {
     uint64_t data_start;
     uint32_t data_offset;
     uint8_t data[512];
+    uint8_t ext_csd[512];
     qemu_irq readonly_cb;
     qemu_irq inserted_cb;
     QEMUTimer *ocr_power_timer;
@@ -393,6 +394,55 @@ static const uint8_t sd_csd_rw_mask[16] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
 };
 
+static void mmc_set_ext_csd(SDState *sd, uint64_t size)
+{
+    uint32_t sectcount = size >> HWBLOCK_SHIFT;
+
+    memset(sd->ext_csd, 0, sizeof(sd->ext_csd));
+    sd->ext_csd[EXT_CSD_S_CMD_SET] = 0x1; /* supported command sets */
+    sd->ext_csd[EXT_CSD_HPI_FEATURES] = 0x3; /* HPI features  */
+    sd->ext_csd[EXT_CSD_BKOPS_SUPPORT] = 0x1; /* Background operations
+                                                 support */
+    sd->ext_csd[241] = 0xA; /* 1st initialization time after partitioning */
+    sd->ext_csd[EXT_CSD_TRIM_MULT] = 0x1; /* Trim multiplier */
+    sd->ext_csd[EXT_CSD_SEC_FEATURE_SUPPORT] = 0x15; /* Secure feature
+                                                        support */
+    sd->ext_csd[EXT_CSD_SEC_ERASE_MULT] = 0x96; /* Secure erase support */
+    sd->ext_csd[EXT_CSD_SEC_TRIM_MULT] = 0x96; /* Secure TRIM multiplier */
+    sd->ext_csd[EXT_CSD_BOOT_INFO] = 0x7; /* Boot information */
+    sd->ext_csd[EXT_CSD_BOOT_MULT] = 0x8; /* Boot partition size. 128KB unit */
+    sd->ext_csd[EXT_CSD_ACC_SIZE] = 0x6; /* Access size */
+    sd->ext_csd[EXT_CSD_HC_ERASE_GRP_SIZE] = 0x4; /* HC Erase unit size */
+    sd->ext_csd[EXT_CSD_ERASE_TIMEOUT_MULT] = 0x1; /* HC erase timeout */
+    sd->ext_csd[EXT_CSD_REL_WR_SEC_C] = 0x1; /* Reliable write sector count */
+    sd->ext_csd[EXT_CSD_HC_WP_GRP_SIZE] = 0x4; /* HC write protect group size */
+    sd->ext_csd[EXT_CSD_S_C_VCC] = 0x8; /* Sleep current VCC  */
+    sd->ext_csd[EXT_CSD_S_C_VCCQ] = 0x7; /* Sleep current VCCQ */
+    sd->ext_csd[EXT_CSD_S_A_TIMEOUT] = 0x11; /* Sleep/Awake timeout */
+    sd->ext_csd[215] = (sectcount >> 24) & 0xff; /* Sector count */
+    sd->ext_csd[214] = (sectcount >> 16) & 0xff; /* ... */
+    sd->ext_csd[213] = (sectcount >> 8) & 0xff;  /* ... */
+    sd->ext_csd[EXT_CSD_SEC_CNT] = (sectcount & 0xff);       /* ... */
+    sd->ext_csd[210] = 0xa; /* Min write perf for 8bit@52Mhz */
+    sd->ext_csd[209] = 0xa; /* Min read perf for 8bit@52Mhz  */
+    sd->ext_csd[208] = 0xa; /* Min write perf for 4bit@52Mhz */
+    sd->ext_csd[207] = 0xa; /* Min read perf for 4bit@52Mhz */
+    sd->ext_csd[206] = 0xa; /* Min write perf for 4bit@26Mhz */
+    sd->ext_csd[205] = 0xa; /* Min read perf for 4bit@26Mhz */
+    sd->ext_csd[EXT_CSD_PART_SWITCH_TIME] = 0x1; /* Partition switching
+                                                    timing */
+    sd->ext_csd[EXT_CSD_OUT_OF_INTERRUPT_TIME] = 0x1; /* Out-of-interrupt busy
+                                                         timing */
+    sd->ext_csd[EXT_CSD_CARD_TYPE] = 0xFF; /* Card type */
+    sd->ext_csd[EXT_CSD_STRUCTURE] = 0x2; /* CSD Structure version */
+    sd->ext_csd[EXT_CSD_REV] = 0x5; /* Extended CSD revision */
+    sd->ext_csd[EXT_CSD_RPMB_MULT] = 0x1; /* RPMB size */
+    sd->ext_csd[EXT_CSD_PARTITION_SUPPORT] = 0x3; /* Partinioning support */
+    sd->ext_csd[159] = 0x00; /* Max enhanced area size */
+    sd->ext_csd[158] = 0x00; /* ... */
+    sd->ext_csd[157] = 0xEC; /* ... */
+}
+
 static void sd_set_csd(SDState *sd, uint64_t size)
 {
     int hwblock_shift = HWBLOCK_SHIFT;
@@ -406,8 +456,11 @@ static void sd_set_csd(SDState *sd, uint64_t size)
     }
     csize = (size >> (CMULT_SHIFT + hwblock_shift)) - 1;
 
-    if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
-        sd->csd[0] = 0x00;  /* CSD structure */
+    if (size <= SDSC_MAX_CAPACITY || sd->emmc) { /* Standard Capacity SD */
+        if (sd->emmc && size >= SDSC_MAX_CAPACITY) {
+            csize = 0xfff;
+        }
+        sd->csd[0] = sd->emmc ? 0xd0 : 0x00;  /* CSD structure */
         sd->csd[1] = 0x26;  /* Data read access-time-1 */
         sd->csd[2] = 0x00;  /* Data read access-time-2 */
         sd->csd[3] = 0x32;      /* Max. data transfer rate: 25 MHz */
@@ -451,6 +504,10 @@ static void sd_set_csd(SDState *sd, uint64_t size)
         sd->csd[14] = 0x00;
     }
     sd->csd[15] = (sd_crc7(sd->csd, 15) << 1) | 1;
+
+    if (sd->emmc) {
+        mmc_set_ext_csd(sd, size);
+    }
 }
 
 static void sd_set_rca(SDState *sd, uint16_t value)
-- 
2.7.4


