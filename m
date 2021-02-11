Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4590831865B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:33:48 +0100 (CET)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7Q3-00040I-B4
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76P-00032G-8I; Thu, 11 Feb 2021 03:13:29 -0500
Received: from mail-eopbgr770047.outbound.protection.outlook.com
 ([40.107.77.47]:22156 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76H-0004gW-4W; Thu, 11 Feb 2021 03:13:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPunsD055RAqHMQLNYFSHbpTUOshf0EN2ZkG++i1ql8f+j+RG3hYYMng5XInj3p2xBH/30sZ/wp07lep1ThThrbScYqgXrvZJ7VaiHNwJD5trQk7/Q7vScl1OXf0XSpXrHkkK2ysFhTSrOU6pZV40FlaHn7D+opCvnn6fKHDJjsrNHe4LHFYDXHO8GqHPVCdnu1kEPnhLK+UDSxrWX7CJJ8Engs7cxzaN7AeiFBAakdCsgIHOzDjEPBj7yIrslkh4wrSjESpPeR4zhFYVifWEt3298+HrdjfxRtzmHA+Pahr1fvNXHPj6e5b2CNVjq8AaB8JQ6tjcstvT0ICw2nLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwMX+B+ldEDNouPhg6PkaCR7CacbusezLsdQYtjibgY=;
 b=Og+kleXe7LiaMq/0R2dNnQAehxfVJ5TLxpuXP9STI2MKphcg0ArCQNkAv41RXJ0cqYEWWF2XTPUWQbhW+mMCzfubDy6hKKZE71w1xZgqGTHN/8kwC3xA6+efJE09jmftRnfcVRFm5Dk/qudhkvjf7bndNXoDeu5a8fJWzTPUMjFyBVw/DrP0k/TUuQiN5E9Du5T7YKVUh+So3VYWCpgJmCehehBgvarUmQAizQ77bFViDJqipCSVOJyAMrp1CoPgVX2o3z2X23meU1TucIePqo9pBV5mlkPnKFMRCYSoz3keOAJuywJScKHtVqyf+unEj798f7lFbK4QYtPrOmC7oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwMX+B+ldEDNouPhg6PkaCR7CacbusezLsdQYtjibgY=;
 b=FXuH1+yxcQ+noXMLT+5CEDF7CiX9lkSiYrlb4zzliON7NOGsNhoEABeZ1UAfF6OGA0oWHQNf1UeJo+c5Zvj3v8DyNlI5wpg6LFiuTnRNlGRfx7ktWHv/4lJTNhuvZarApSZLQl6ggvzIr9+Gi6Ypoc5pHlUeGSW1672G+zDJ8VU=
Received: from BL0PR0102CA0019.prod.exchangelabs.com (2603:10b6:207:18::32) by
 BN8PR02MB5939.namprd02.prod.outlook.com (2603:10b6:408:b4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27; Thu, 11 Feb 2021 08:13:18 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:207:18:cafe::12) by BL0PR0102CA0019.outlook.office365.com
 (2603:10b6:207:18::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Thu, 11 Feb 2021 08:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:13:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:55 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:55 -0800
Received: from [10.140.6.35] (port=49684 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75q-0000QZ-OS; Thu, 11 Feb 2021 00:12:55 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 4CA6C13C063C; Thu, 11 Feb 2021 13:48:17 +0530 (IST)
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
Subject: [RFC PATCH 11/15] sd: emmc: Add Extended CSD register definitions
Date: Thu, 11 Feb 2021 13:47:22 +0530
Message-ID: <1613031446-22154-12-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4370838-b2c7-4177-ea9f-08d8ce64e366
X-MS-TrafficTypeDiagnostic: BN8PR02MB5939:
X-Microsoft-Antispam-PRVS: <BN8PR02MB593974D9B32508F39063846ACA8C9@BN8PR02MB5939.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eu6BM1F5NvLCnhEV6mu7rNppmPibV9dyaJ+uz7OKoe7QysiTDEaoUzlu49sFoQepr1kpDAbaEODEEeohOUhjIP2XG1clHPX7mPj80bS90NZtax3LaEiAAGKZ0TQwYd+/mXiuzW1i0lh7TiGkPsICnZ9MAIBQzyBB+WW7gtc+uqmOvD+vvpMIBRfgKXBn85+ET+jnmHH7Wl8uG/FH95rgUaWvUy48e7IYNcPdocdM/FfvcVouz/AREGgWxBfNe3qah52Jr8kx9Z5R5H7lTf7dzhaJ95sdmJqmC8kJja88/Xy2TFJ6hk3EpIqa/YdD9PuxXquQG8oBdEtkT0f0bANTUKAlx7iEUHWmGOFPYbdFPpKT2H3e2w35t06BrkmxczMQStTc2Zq/Q8Ln85QbqQe12iuawSinpumeLB0KCcyatrkl7re9u5dnj+yLPLV5UbZMZX4+1/Xsds5Ip1251rIMf5W3+yGxdcfhD3hgOKKiMrvC12pmoWidjavTS7sfiy6tz1pwT1j7PVRxp+jIXlvHk6UnIEq+FalFZW3sJpXMY9EpEJ13nGsiZ3ZhgWnbbNExAumVX37NsY5iCPCD0okmTuUaVNFhD53kRVYWZrFHtMOMXdOoIJMWCC4UJWm0utPNOEARfXNVtPZUCI1AQXRSs/VDo2Nw4rtCbd2qdPGCOuWBVmSAH+Q5oEs4Oly5esT6BHBMIwM6h+bUbio6+wC5dg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(36840700001)(66574015)(83380400001)(82740400003)(36860700001)(70586007)(6266002)(5660300002)(82310400003)(8676002)(70206006)(107886003)(478600001)(4326008)(7636003)(356005)(6666004)(186003)(26005)(8936002)(2616005)(36756003)(336012)(426003)(47076005)(921005)(54906003)(2906002)(36906005)(316002)(7416002)(110136005)(42186006)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:13:17.8740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4370838-b2c7-4177-ea9f-08d8ce64e366
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5939
Received-SPF: pass client-ip=40.107.77.47; envelope-from=saipava@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
 hw/sd/sd.c             | 54 +++++++++++++++-------------
 hw/sd/sdmmc-internal.h | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+), 25 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 45311fa..54fba7b 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -398,41 +398,45 @@ static void mmc_set_ext_csd(SDState *sd, uint64_t size)
     uint32_t sectcount = size >> HWBLOCK_SHIFT;
 
     memset(sd->ext_csd, 0, 512);
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
-- 
2.7.4


