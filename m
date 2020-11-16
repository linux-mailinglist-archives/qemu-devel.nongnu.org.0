Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACDF2B54C6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 00:13:33 +0100 (CET)
Received: from localhost ([::1]:44746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kengi-0007Pd-Du
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 18:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1keneV-0005wn-Kz; Mon, 16 Nov 2020 18:11:15 -0500
Received: from mail-mw2nam12on2076.outbound.protection.outlook.com
 ([40.107.244.76]:8512 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1keneR-0003wy-Of; Mon, 16 Nov 2020 18:11:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIt+xoZ+fVnv3cJRGZsqbSLGDhoTv+sSMkbWuTKvNagJ0I945JyP39r+tg/mWoUxbr1UxMgHXll8gGgBIQYg0yCZTc8GDbd/7fuvzTu5esOok5Hi3UXFKqRznCz2hmeRVqJOlGCMYZ6de027lMv9bzt7cCGiNfgq8z7tkvwkP3cOxVUVL5K7ZIuZzS4IUqRHcODc3v38ZE2+/mAEd3E9AISO2gibb5S9j/UCwQpVlM52GkGR8tJLxMYtpxtGKV2UiCwyIEM6NRbxn4byqQTMWsMvlTjjW4WcwefRV3DaxdfYGlBwmUf3k65z9PCaIlcEMkXg9T7h2Z3PWytRFEse0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odIGpw+UDMOf/66/cVK3QbqoaDlb7lRd65ebuQoUHq8=;
 b=En41xqlUwVACFf2cnS1mNuNKl9FCNF68/YMwGk6EMwDeCJMVQrXnPTG7P8+IxftVWSK9L8/Mm64m8Iy0V3Rm+jc0YKheA8urly+Avx7+RzvIRcFQaC8KhwMaT4zQHqifXAeXC97bOvRTSGL+KypZgp1TpNQvN1V+H4Ybbyl8tEje+EcY/z0QjPx5cT1WrCi0jA12qEIP0g6DXmmHbJFu03IjUYPaTZMPBjBikqCxnO269kk/+VWntPuC/E6/a1y+aDCeP49ueTroHmA0upxFLPNCzRdar3Xoecr+lZMxkzcyTi7uFqJRxwMvv68MQb/NpS+dJoh/3G2ELWDw1zZglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odIGpw+UDMOf/66/cVK3QbqoaDlb7lRd65ebuQoUHq8=;
 b=SbJ8mKPEqr7Q2++LpCYlYUNH0kjBByJQM1LyY2/MR4OHCyOPvlvwC5xs3hmg5LeRS58If/a9nCBERRrwlp0HF7avHfUG6ZSvvTPLgQe6vAqrpcb6X3If5LbH5e+CxDqTnGa+PavZEA7fxa+miLjX+rGiPa0jVhWJ7Cj7MhLwSDI=
Received: from DM6PR10CA0011.namprd10.prod.outlook.com (2603:10b6:5:60::24) by
 SN6PR02MB5485.namprd02.prod.outlook.com (2603:10b6:805:ed::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25; Mon, 16 Nov 2020 23:11:08 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::69) by DM6PR10CA0011.outlook.office365.com
 (2603:10b6:5:60::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 23:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 23:11:07 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 15:11:04 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 16 Nov 2020 15:11:04 -0800
Received: from [172.19.2.32] (port=55506 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1keneK-0007S0-Jp; Mon, 16 Nov 2020 15:11:04 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 3/4] hw/block/m25p80: Check SPI mode before running some
 Numonyx commands
Date: Mon, 16 Nov 2020 15:11:03 -0800
Message-ID: <1605568264-26376-4-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
References: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaafe1cd-f0e8-4c95-56c0-08d88a84e66a
X-MS-TrafficTypeDiagnostic: SN6PR02MB5485:
X-Microsoft-Antispam-PRVS: <SN6PR02MB54857692C38E534ED27AA3F2D0E30@SN6PR02MB5485.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIRnFbbVm4MNzelr1NGhSyRh26q1Ft4yRWjqKwHXxgy0PB+Kj4Al/fJLtRtKXvDPb7WwrcbomBFSW8txLBSMRIEVR1yCaUr25TEEgvQRF/u40qSuK7qY0K46BKeMai3z26781pebFYZEQLGQvABl9P3YcTGA/l30VM7Dmt4zNF4bSc2cklLDu7eiNmeOT0AC92Z+XktSFs4xPjl2rEmsrAILYwORQ5CNiNGE2o3tYZ1D5WVgXqxzz42n9jJytlczqWD47sj4PHbVjAjcsoM4mxc84scIYCJBRpHf/SF3meagCNjm/1dfek+uIFxVZ6VsrwK9T0Nkd5OgkizC3fSbd9H/zMOQ50j0zLLkFMOEpIKngydam8eBxzeEPSUcWj54ovjT+vwCU3U7/e8p7L3Q7BB4MTbOYNZxDxkCfhkGf+0=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(83380400001)(6916009)(336012)(186003)(44832011)(316002)(8936002)(54906003)(426003)(2906002)(82740400003)(356005)(36756003)(7696005)(5660300002)(82310400003)(26005)(86362001)(8676002)(478600001)(70206006)(70586007)(9786002)(47076004)(4326008)(2616005)(7636003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 23:11:07.8336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaafe1cd-f0e8-4c95-56c0-08d88a84e66a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5485
Received-SPF: pass client-ip=40.107.244.76; envelope-from=komlodi@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 18:11:09
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Cc: figlesia@xilinx.com, alistair@alistair23.me,
 philippe.mathieu.daude@gmail.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some Numonyx flash commands cannot be executed in DIO and QIO mode, such as
trying to do DPP or DOR when in QIO mode.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
---
 hw/block/m25p80.c | 114 +++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 95 insertions(+), 19 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index eb6539f..56bd5bc 100644
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
 
+static uint8_t numonyx_mode(Flash *s)
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
@@ -950,14 +967,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
@@ -966,24 +977,84 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         s->len = 0;
         s->state = STATE_COLLECTING_DATA;
         break;
+    case READ:
+    case READ4:
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) == MODE_STD) {
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
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
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
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
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
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
+            decode_fast_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "QIO mode\n", s->cmd_in_progress);
+        }
+        break;
     case QOR:
     case QOR4:
-        decode_fast_read_cmd(s);
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
+            decode_fast_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "DIO mode\n", s->cmd_in_progress);
+        }
         break;
 
     case DIOR:
     case DIOR4:
-        decode_dio_read_cmd(s);
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
+            decode_dio_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "QIO mode\n", s->cmd_in_progress);
+        }
         break;
 
     case QIOR:
     case QIOR4:
-        decode_qio_read_cmd(s);
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
+            decode_qio_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
+                          "DIO mode\n", s->cmd_in_progress);
+        }
         break;
 
     case WRSR:
@@ -1035,17 +1106,22 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         break;
 
     case JEDEC_READ:
-        trace_m25p80_populated_jedec(s);
-        for (i = 0; i < s->pi->id_len; i++) {
-            s->data[i] = s->pi->id[i];
-        }
-        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
-            s->data[i] = 0;
-        }
+        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) == MODE_STD) {
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


