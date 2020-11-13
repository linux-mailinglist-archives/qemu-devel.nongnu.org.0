Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B698C2B1490
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 04:13:11 +0100 (CET)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdPWQ-0005yg-PR
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 22:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdPUP-0004Dp-Pk; Thu, 12 Nov 2020 22:11:05 -0500
Received: from mail-dm6nam08on2078.outbound.protection.outlook.com
 ([40.107.102.78]:5156 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdPUM-0008O4-U5; Thu, 12 Nov 2020 22:11:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et32bjCNFr/8YW1nMh1VtXR+FWe3j/NfJ9NycHx2hx/KLdlRhXmXndpT2T7pxJpK88387YeNe8Jt8PMFYVzlzCmxOCb/m+4R0ISGJlZVRFOzgnkyxzcaJTRW5RFJMeaeBc/UpJ/AyNjfvKjhiCzHcG6qQQ700cNw+X7/TJhYbp4NgmynoOU4+KSz0i5LrU0mAg+LIK090ewmVKgJ3wSiNYkdny/1GHY3OFOqdbtnUks+4OXrGbFmMRn831usKs/z1VnT4QmkepnKpdPKjmnj7s3+VFaKvMWs2jN2q+4unsEwMbZmJOM6Tp4H1tV3clfl7XXPZi0ejJ9iM1beAWTEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehKC6A9O9eZsvY8PNmTxcuoKYCTOgKuyVsqjlIN93sw=;
 b=eE1WkQ27By9P7V4RQ067baSmuhDngv3i6CJ3gg56cR4Hq5LW7WRHSdDYHGneSYtDRJrrFaDutZHlTVEQPt6vLjCmTbad/hlvV6uKlZXKuPitV8/GZ5Y4A15mZ2anqU31SHhGwNxIC5/xQL1wC3bOiDhtpEhwgH9NWrDaMKAQKysbz06lVJhn/Rwp81kBZwwN2Eb4kRmyf0BgdhpFYoJ7b4UPh+jYBW9CcP9BtZqocu8eZ2/T4ASlQqQLKC/IZWL2QdErfE4pBkX/squreE40mqLUuCrzx2tl9H6ArdkKfPO7ifyrGH0R3dVUvXpKOfBqCg9sSTx8YcO1a+3Ft3OtbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehKC6A9O9eZsvY8PNmTxcuoKYCTOgKuyVsqjlIN93sw=;
 b=rRzp2L/vprixD3F21XZ511DIlB1y2G8n6h5UhaFJZo/ibM+UyA7uw2pPj+Y2i1CHTWArz0SD6S2rxXOcw7dzGhWJ4ssdkMZf5ZFbHcXKVUwl+Oq++taax80ZhMWh348ZggH6POEgobDpK+Lv9zJGOclPakGi8OA+3ptxlsZ2DBI=
Received: from MN2PR19CA0002.namprd19.prod.outlook.com (2603:10b6:208:178::15)
 by MN2PR02MB6254.namprd02.prod.outlook.com (2603:10b6:208:185::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 03:10:59 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:178:cafe::1a) by MN2PR19CA0002.outlook.office365.com
 (2603:10b6:208:178::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 03:10:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT018.mail.protection.outlook.com (10.152.77.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Fri, 13 Nov 2020 03:10:58 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 19:10:56 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 19:10:55 -0800
Received: from [172.19.2.32] (port=54046 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1kdPUF-0004vx-QM; Thu, 12 Nov 2020 19:10:55 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 3/4] hw/block/m25p80: Check SPI mode before running some
 Numonyx commands
Date: Thu, 12 Nov 2020 19:10:54 -0800
Message-ID: <1605237055-393580-4-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
References: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f3b6c2e-2db2-4666-e7f5-08d88781be78
X-MS-TrafficTypeDiagnostic: MN2PR02MB6254:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6254AE318E2480325BEEF0A7D0E60@MN2PR02MB6254.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:120;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nkrm7nc8cEPLVc0Cv7gmQRT2BtoXfdKfr2qwbJwBQh0xgx4UXONcl+aPxi8uSK9qc6Tl9hwyhjUDMv3PM+Wf+x1qAS/94PnwORRdnIYoakDM6ZQKdJKmriEuyoBnYgjEMV1TCmukvRmgldWaA+rX0ZM+jgk8oLSWDC011ZrjaDXUvNCpiBfs+XB67tNSi9kSRtl5kxVrQaI5e+EFLy+EgTeaREOhm6m9LUo79mwHAtB5dbpP/9ChVTUnorbQvqEbsm75CBFaDHVhVA9vmiX+ggByH4ccYScvOJAmACmzhqQnL90OvNCDNgz6WJziWK6S9zWncwDzQhvgW8yIkwjSgG93NG0G1gnhBtS+ZulMRpSuxGXNfez5T9KmYGt8yH8tK9vJQ/jZ3S5DBxhdjp16A+AqF2CI9zlhtJkAn+h3A/8=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966005)(8676002)(426003)(8936002)(336012)(70586007)(82740400003)(70206006)(5660300002)(4326008)(26005)(316002)(36906005)(7696005)(478600001)(6916009)(9786002)(86362001)(54906003)(2906002)(2616005)(44832011)(7636003)(186003)(83380400001)(47076004)(36756003)(82310400003)(356005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 03:10:58.7641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3b6c2e-2db2-4666-e7f5-08d88781be78
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6254
Received-SPF: pass client-ip=40.107.102.78; envelope-from=komlodi@xilinx.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 22:11:01
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: figlesia@xilinx.com, alistair@alistair23.me,
 philippe.mathieu.daude@gmail.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some Numonyx flash commands cannot be executed in DIO and QIO mode, such as
trying to do DPP or DOR when in QIO mode.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
---
 hw/block/m25p80.c | 134 +++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 112 insertions(+), 22 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index eb6539f..2552f2c 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -413,6 +413,12 @@ typedef enum {
     MAN_GENERIC,
 } Manufacturer;
 
+typedef enum {
+    MODE_STD = 0,
+    MODE_DIO = 1,
+    MODE_QIO = 2
+} SPIMode;
+
 #define M25P80_INTERNAL_DATA_BUFFER_SZ 16
 
 struct Flash {
@@ -820,6 +826,17 @@ static void reset_memory(Flash *s)
     trace_m25p80_reset_done(s);
 }
 
+static uint8_t numonyx_get_mode(Flash *s)
+{
+    if (!(s->enh_volatile_cfg & EVCFG_QUAD_IO_DISABLED)) {
+        return MODE_QIO;
+    } else if (!(s->enh_volatile_cfg & EVCFG_DUAL_IO_DISABLED)) {
+        return MODE_DIO;
+    } else {
+        return MODE_STD;
+    }
+}
+
 static void decode_fast_read_cmd(Flash *s)
 {
     s->needed_bytes = get_addr_length(s);
@@ -827,9 +844,11 @@ static void decode_fast_read_cmd(Flash *s)
     /* Dummy cycles - modeled with bytes writes instead of bits */
     case MAN_WINBOND:
         s->needed_bytes += 8;
+        s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_NUMONYX:
         s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_MACRONIX:
         if (extract32(s->volatile_cfg, 6, 2) == 1) {
@@ -837,19 +856,21 @@ static void decode_fast_read_cmd(Flash *s)
         } else {
             s->needed_bytes += 8;
         }
+        s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_SPANSION:
         s->needed_bytes += extract32(s->spansion_cr2v,
                                     SPANSION_DUMMY_CLK_POS,
                                     SPANSION_DUMMY_CLK_LEN
                                     );
+        s->state = STATE_COLLECTING_DATA;
         break;
     default:
+        s->state = STATE_COLLECTING_DATA;
         break;
     }
     s->pos = 0;
     s->len = 0;
-    s->state = STATE_COLLECTING_DATA;
 }
 
 static void decode_dio_read_cmd(Flash *s)
@@ -859,6 +880,7 @@ static void decode_dio_read_cmd(Flash *s)
     switch (get_man(s)) {
     case MAN_WINBOND:
         s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
+        s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_SPANSION:
         s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
@@ -866,9 +888,11 @@ static void decode_dio_read_cmd(Flash *s)
                                     SPANSION_DUMMY_CLK_POS,
                                     SPANSION_DUMMY_CLK_LEN
                                     );
+        s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_NUMONYX:
         s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_MACRONIX:
         switch (extract32(s->volatile_cfg, 6, 2)) {
@@ -882,13 +906,14 @@ static void decode_dio_read_cmd(Flash *s)
             s->needed_bytes += 4;
             break;
         }
+        s->state = STATE_COLLECTING_DATA;
         break;
     default:
+        s->state = STATE_COLLECTING_DATA;
         break;
     }
     s->pos = 0;
     s->len = 0;
-    s->state = STATE_COLLECTING_DATA;
 }
 
 static void decode_qio_read_cmd(Flash *s)
@@ -899,6 +924,7 @@ static void decode_qio_read_cmd(Flash *s)
     case MAN_WINBOND:
         s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
         s->needed_bytes += 4;
+        s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_SPANSION:
         s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
@@ -906,9 +932,11 @@ static void decode_qio_read_cmd(Flash *s)
                                     SPANSION_DUMMY_CLK_POS,
                                     SPANSION_DUMMY_CLK_LEN
                                     );
+        s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_NUMONYX:
         s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_MACRONIX:
         switch (extract32(s->volatile_cfg, 6, 2)) {
@@ -922,13 +950,14 @@ static void decode_qio_read_cmd(Flash *s)
             s->needed_bytes += 6;
             break;
         }
+        s->state = STATE_COLLECTING_DATA;
         break;
     default:
+        s->state = STATE_COLLECTING_DATA;
         break;
     }
     s->pos = 0;
     s->len = 0;
-    s->state = STATE_COLLECTING_DATA;
 }
 
 static void decode_new_cmd(Flash *s, uint32_t value)
@@ -950,14 +979,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case ERASE4_32K:
     case ERASE_SECTOR:
     case ERASE4_SECTOR:
-    case READ:
-    case READ4:
-    case DPP:
-    case QPP:
-    case QPP_4:
     case PP:
     case PP4:
-    case PP4_4:
     case DIE_ERASE:
     case RDID_90:
     case RDID_AB:
@@ -966,24 +989,85 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         s->len = 0;
         s->state = STATE_COLLECTING_DATA;
         break;
+    case READ:
+    case READ4:
+        if (!(get_man(s) == MAN_NUMONYX) || (numonyx_get_mode(s) != MODE_DIO &&
+            numonyx_get_mode(s) != MODE_QIO)) {
+            s->needed_bytes = get_addr_length(s);
+            s->pos = 0;
+            s->len = 0;
+            s->state = STATE_COLLECTING_DATA;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "DIO or QIO mode\n", s->cmd_in_progress);
+        }
+        break;
+    case DPP:
+        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_QIO) {
+            s->needed_bytes = get_addr_length(s);
+            s->pos = 0;
+            s->len = 0;
+            s->state = STATE_COLLECTING_DATA;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "QIO mode\n", s->cmd_in_progress);
+        }
+        break;
+    case QPP:
+    case QPP_4:
+    case PP4_4:
+        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_DIO) {
+            s->needed_bytes = get_addr_length(s);
+            s->pos = 0;
+            s->len = 0;
+            s->state = STATE_COLLECTING_DATA;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "DIO mode\n", s->cmd_in_progress);
+        }
+        break;
 
     case FAST_READ:
     case FAST_READ4:
+        decode_fast_read_cmd(s);
+        break;
     case DOR:
     case DOR4:
+        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_QIO) {
+            decode_fast_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "QIO mode\n", s->cmd_in_progress);
+        }
+        break;
     case QOR:
     case QOR4:
-        decode_fast_read_cmd(s);
+        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_DIO) {
+            decode_fast_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "DIO mode\n", s->cmd_in_progress);
+        }
         break;
 
     case DIOR:
     case DIOR4:
-        decode_dio_read_cmd(s);
+        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_QIO) {
+            decode_dio_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "QIO mode\n", s->cmd_in_progress);
+        }
         break;
 
     case QIOR:
     case QIOR4:
-        decode_qio_read_cmd(s);
+        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_DIO) {
+            decode_qio_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "DIO mode\n", s->cmd_in_progress);
+        }
         break;
 
     case WRSR:
@@ -1035,17 +1119,23 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         break;
 
     case JEDEC_READ:
-        trace_m25p80_populated_jedec(s);
-        for (i = 0; i < s->pi->id_len; i++) {
-            s->data[i] = s->pi->id[i];
-        }
-        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
-            s->data[i] = 0;
-        }
+        if (!(get_man(s) == MAN_NUMONYX) || (numonyx_get_mode(s) != MODE_DIO &&
+            numonyx_get_mode(s) != MODE_QIO)) {
+            trace_m25p80_populated_jedec(s);
+            for (i = 0; i < s->pi->id_len; i++) {
+                s->data[i] = s->pi->id[i];
+            }
+            for (; i < SPI_NOR_MAX_ID_LEN; i++) {
+                s->data[i] = 0;
+            }
 
-        s->len = SPI_NOR_MAX_ID_LEN;
-        s->pos = 0;
-        s->state = STATE_READING_DATA;
+            s->len = SPI_NOR_MAX_ID_LEN;
+            s->pos = 0;
+            s->state = STATE_READING_DATA;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute JEDEC read "
+                          "in DIO or QIO mode\n");
+        }
         break;
 
     case RDCR:
-- 
2.7.4


