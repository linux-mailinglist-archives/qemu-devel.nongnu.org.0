Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C14F321202
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:29:24 +0100 (CET)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6ap-0002xQ-7s
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OC-0004b8-EZ; Mon, 22 Feb 2021 03:16:20 -0500
Received: from mail-dm6nam12on2080.outbound.protection.outlook.com
 ([40.107.243.80]:51424 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O7-0001lM-2W; Mon, 22 Feb 2021 03:16:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wjlncpa2n2YxQiy2RZpovTGrvGRWglZXv2OGRZZ1pBJlO1JoPwhFdBvAacwwFTWTR4eq31CsTy3rZMrpOIZygcgffC4zVHWrFDwKMoRfJ/2LbBMBVAnJ5qqquYUY6I1I60Pw0s8i7npUnou8geCvRk/Gn80+xCEBU4cfKGJ5HZT6o8Q5+F15L3PZM4J3qolZaMGU24Saf8OXIkSWzr1XZ34CfvUpkPPHrCo+RYTy2ShdOOImnbxvWXjOgZHD688P71eWji8pt1ybSFdrsKAopGfWx7RtJynj0cbjGHhCq8P4Gd1+ekW576Qi3E1aVnIVBxzXpjUtS2o1DQ07oTTy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQMm632hilFjeSSYZ3K3ZR2y6Qo3HDU6ZYN+c6ieYck=;
 b=k8M4+AXhJZ3vwFeWArprzNrHvAGJ4fw3I9WDrXJJDKr35Xxb9Ovk22h2xmSjNz7O24/382iqsNjo/FdeeCLpVVItAVyP6bvTkcFKx5U8B+OVxC6yHcNj6jcckomo06lT5DKWyTZsimSecbQRnjFvGkI3fLp0mjf88gc+lemBWVU6AKJg10QQXYJUwrMt854HijsCB41kte01KGHZf9TN2RZk+dPYkszF4wwQIC+9iW2BtHfLLXsEvV/ObvM05NQ3i1uAqKDpKEFxnrMQ+LKdhKdZIBaesrvCyCb0y7fow+2QMMg1Or37dkqrHeHGN1L5L1/KjudWyrSaIQDIalvjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQMm632hilFjeSSYZ3K3ZR2y6Qo3HDU6ZYN+c6ieYck=;
 b=fYxGL4ysbdjeDDbhtYCwQ+7Gm+9H8gvcYMujQODtqsRWQMHTHxqraIfCGrjoF7Kw4X7cMIqh4ZKi7zusH5I3+nt8GuFam8nRhtN+0nY13+Br788w+qzrxNTilHvn4qwCvS3ZsrCKW5uuB3vGzS6cIKuYobwYEvLePPPYIV4QXBc=
Received: from SN4PR0501CA0081.namprd05.prod.outlook.com
 (2603:10b6:803:22::19) by SN6PR02MB4447.namprd02.prod.outlook.com
 (2603:10b6:805:a7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Mon, 22 Feb
 2021 08:16:11 +0000
Received: from SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::97) by SN4PR0501CA0081.outlook.office365.com
 (2603:10b6:803:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT046.mail.protection.outlook.com (10.152.72.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:01 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:01 -0800
Received: from [10.140.6.35] (port=59036 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Ns-00036z-KR; Mon, 22 Feb 2021 00:16:01 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 21A5813C0AB5; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
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
Subject: [PATCH v2 16/22] sd: emmc: Add Extended CSD register definitions
Date: Mon, 22 Feb 2021 13:50:33 +0530
Message-ID: <1613982039-13861-17-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3435c39-6814-4c97-6abd-08d8d70a1d33
X-MS-TrafficTypeDiagnostic: SN6PR02MB4447:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4447E082D75681B7DD4B0D12CA819@SN6PR02MB4447.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/mC+QJ9+sTR5Z+OxW2+ZyIB7vpilBpHbOZHvmT7A4TRuzvDtuXzSA218Eqv/IubUR4no/U9YPKXhtUxo3rWGeeh2ZOuotZHLDA5qa1MFJOlvP4Bx3pFLtoPrcRNhTCWQQoj0lYc2lrMN2Eak+QR9spivbhnebwj1yVVA1bsD/2jW/+W8bsHMZW5heIv91Pmmr9c2NEp+PQ2ssldJH2+WYTIOhOvY1Z/0wiLcM3poLVUpHHqNpYrgDsqletaZFvmUArZli9zkay3EkFEEM2YqjWzw/9KCT4Qg2kCTPPNPN2RTHpBrBV8IzkTq0TP773qaQ71HLjqvJT6CIIhqnsfoC99QZAIs59cMvfvUXetln7feL8BXS58yKnrRPv77MaDByoImCSVDFwapKPKLGp8P0fpFqy5hJuNTUrnq48kPNRv7GEwbKl6VinGRfGubfDu35hHnGns/4EF6TnZovR+6f/fpC0pGQF8JEdWLn7o7lmgZucoahFwBKPGHz8R6BcJfW7zChvmpg09ozZWRtfZuy2rjazvyWI7VMLuLO45Sn57Tk6wFuFZYsisVPXrgCsdvxEwyFIVanDFq/CT02qJudB/rT9sywo3KZnnvIqlvxM5Z0HYQ790hxysJHn/mPMWrR7sCqMajjQAWM2X7RSxwk8SEbIs+fwNY75+1oz9I1lTU8q6l01YzJVeGEPnwCvINiZbqpSlBYigg1kQoEMfzg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39850400004)(376002)(396003)(46966006)(36840700001)(4326008)(8676002)(70206006)(26005)(478600001)(186003)(70586007)(8936002)(83380400001)(5660300002)(6266002)(36756003)(2906002)(7636003)(82740400003)(36906005)(356005)(316002)(36860700001)(82310400003)(66574015)(107886003)(2616005)(110136005)(336012)(42186006)(47076005)(921005)(6666004)(7416002)(54906003)(426003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:11.1679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3435c39-6814-4c97-6abd-08d8d70a1d33
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4447
Received-SPF: pass client-ip=40.107.243.80; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

From: Cédric Le Goater <clg@kaod.org>

Add user friendly macros for EXT_CSD register.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[spb: Rebased over versal emmc series,
      updated commit message]
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sdmmc-internal.h | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/sd/sd.c             | 54 +++++++++++++++-------------
 2 files changed, 126 insertions(+), 25 deletions(-)

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
index 3c24810..60799aa 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -409,41 +409,45 @@ static void mmc_set_ext_csd(SDState *sd, uint64_t size)
     uint32_t sectcount = size >> HWBLOCK_SHIFT;
 
     memset(sd->ext_csd, 0, sizeof(sd->ext_csd));
-    sd->ext_csd[504] = 0x1; /* supported command sets */
-    sd->ext_csd[503] = 0x1; /* HPI features  */
-    sd->ext_csd[502] = 0x1; /* Background operations support */
+    sd->ext_csd[EXT_CSD_S_CMD_SET] = 0x1; /* supported command sets */
+    sd->ext_csd[EXT_CSD_HPI_FEATURES] = 0x3; /* HPI features  */
+    sd->ext_csd[EXT_CSD_BKOPS_SUPPORT] = 0x1; /* Background operations
+                                                 support */
     sd->ext_csd[241] = 0xA; /* 1st initialization time after partitioning */
-    sd->ext_csd[232] = 0x1; /* Trim multiplier */
-    sd->ext_csd[231] = 0x15; /* Secure feature support */
-    sd->ext_csd[230] = 0x96; /* Secure erase support */
-    sd->ext_csd[229] = 0x96; /* Secure TRIM multiplier */
-    sd->ext_csd[228] = 0x7; /* Boot information */
-    sd->ext_csd[226] = 0x8; /* Boot partition size */
-    sd->ext_csd[225] = 0x6; /* Access size */
-    sd->ext_csd[224] = 0x4; /* HC Erase unit size */
-    sd->ext_csd[223] = 0x1; /* HC erase timeout */
-    sd->ext_csd[222] = 0x1; /* Reliable write sector count */
-    sd->ext_csd[221] = 0x4; /* HC write protect group size */
-    sd->ext_csd[220] = 0x8; /* Sleep current VCC  */
-    sd->ext_csd[219] = 0x7; /* Sleep current VCCQ */
-    sd->ext_csd[217] = 0x11; /* Sleep/Awake timeout */
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
     sd->ext_csd[215] = (sectcount >> 24) & 0xff; /* Sector count */
     sd->ext_csd[214] = (sectcount >> 16) & 0xff; /* ... */
     sd->ext_csd[213] = (sectcount >> 8) & 0xff;  /* ... */
-    sd->ext_csd[212] = (sectcount & 0xff);       /* ... */
+    sd->ext_csd[EXT_CSD_SEC_CNT] = (sectcount & 0xff);       /* ... */
     sd->ext_csd[210] = 0xa; /* Min write perf for 8bit@52Mhz */
     sd->ext_csd[209] = 0xa; /* Min read perf for 8bit@52Mhz  */
     sd->ext_csd[208] = 0xa; /* Min write perf for 4bit@52Mhz */
     sd->ext_csd[207] = 0xa; /* Min read perf for 4bit@52Mhz */
     sd->ext_csd[206] = 0xa; /* Min write perf for 4bit@26Mhz */
     sd->ext_csd[205] = 0xa; /* Min read perf for 4bit@26Mhz */
-    sd->ext_csd[199] = 0x1; /* Partition switching timing */
-    sd->ext_csd[198] = 0x1; /* Out-of-interrupt busy timing */
-    sd->ext_csd[196] = 0xFF; /* Card type */
-    sd->ext_csd[194] = 0x2; /* CSD Structure version */
-    sd->ext_csd[192] = 0x5; /* Extended CSD revision */
-    sd->ext_csd[168] = 0x1; /* RPMB size */
-    sd->ext_csd[160] = 0x3; /* Partinioning support */
+    sd->ext_csd[EXT_CSD_PART_SWITCH_TIME] = 0x1; /* Partition switching
+                                                    timing */
+    sd->ext_csd[EXT_CSD_OUT_OF_INTERRUPT_TIME] = 0x1; /* Out-of-interrupt busy
+                                                         timing */
+    sd->ext_csd[EXT_CSD_CARD_TYPE] = 0xFF; /* Card type */
+    sd->ext_csd[EXT_CSD_STRUCTURE] = 0x2; /* CSD Structure version */
+    sd->ext_csd[EXT_CSD_REV] = 0x5; /* Extended CSD revision */
+    sd->ext_csd[EXT_CSD_RPMB_MULT] = 0x1; /* RPMB size */
+    sd->ext_csd[EXT_CSD_PARTITION_SUPPORT] = 0x3; /* Partinioning support */
     sd->ext_csd[159] = 0x00; /* Max enhanced area size */
     sd->ext_csd[158] = 0x00; /* ... */
     sd->ext_csd[157] = 0xEC; /* ... */
-- 
2.7.4


