Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB572B1491
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 04:13:15 +0100 (CET)
Received: from localhost ([::1]:32852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdPWU-00066D-6g
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 22:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdPUO-0004By-Nt; Thu, 12 Nov 2020 22:11:04 -0500
Received: from mail-eopbgr750058.outbound.protection.outlook.com
 ([40.107.75.58]:50241 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdPUK-0008Ne-Qw; Thu, 12 Nov 2020 22:11:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMHSROeprfYZpOWeGby1o2eTglQP2GXgwQHEsuqANkJWE0L6BVEudB7On4TXzhmf+kXS8ajIdpgJFtQOTTKeDb2kLXwXDvx4CTS8nDxQqqBC0Qk7DeO90qJ4aFu2e5tCBNjNqmR6DtpJlD3syV7y9WwuQs7p0S1SdCKKmu0Vcqe2xmoa5/dM16nWpWpt65LzhnPtbDAKlxCrEDX2BFV/0vYTt/kgyeTLVVGRNrTNRQoZOaW2QpGfmVRbiF/pJFIhb+9+gACznhgMocxUI3xd5On6J/7mRtkfRTIyXO4fPGdMHBoXEeNdUfVok4n41X8qXnzCiIVXATvIm5rOwBZLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73hXoEu5tO6gENXtYU1saSfkVCz8CSEZhTKeUvegX/8=;
 b=j51N3TY4nBdR/nIGs8VjSu1K+gl9+DNWZDqGy/nHdQqMz42q8f3ewG4ayZUGGYLWXQbmUpt6JC7gb/kbPk1J0TXGH136dpNXFuWcGGwhQeeJNS/jPD/k80Xlu4pvSj0FYVS+xdvrm+IzGj+7qJ+3DY1wSlHEnWs+YFDCcjyCW/N/S9RWWT44ekg16cxkemWNIrJl73vTr9Iw3W05z9WGYtoEttW8TT0tWAKyNzGxI6gKd9+07ulBsF9A+lxIXzVEBXVczcGUl/FGEdtgrZX3qTMoYzSqU2gCur/NB5gQtusXV80Dp8iY4f8SxGdw/cUBE1F1W8Kz0OrcrwWIRUc/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73hXoEu5tO6gENXtYU1saSfkVCz8CSEZhTKeUvegX/8=;
 b=hJ2TPLH5gn88+If3FYgXXX0Lvw3CsjEXxANJ6BHJIKzaOgChoV/MbTZofI8ezeNbaFii9DLy+N/YAeTTmHaPpSUSIFur45kdSj5RSCpOVDvX9dmwYJgvehFZ//c9MdK2TJbv3YbCqbf04yzbSIUQ46B5qKGV3LtANgLmBd13CWo=
Received: from MN2PR19CA0004.namprd19.prod.outlook.com (2603:10b6:208:178::17)
 by DM6PR02MB6044.namprd02.prod.outlook.com (2603:10b6:5:1f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Fri, 13 Nov
 2020 03:10:58 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:178:cafe::74) by MN2PR19CA0004.outlook.office365.com
 (2603:10b6:208:178::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Fri, 13 Nov 2020 03:10:58 +0000
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
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 19:10:56 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 19:10:55 -0800
Received: from [172.19.2.32] (port=54046 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1kdPUF-0004vx-Qr; Thu, 12 Nov 2020 19:10:55 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 4/4] hw/block/m25p80: Fix Numonyx fast read dummy cycle
 count
Date: Thu, 12 Nov 2020 19:10:55 -0800
Message-ID: <1605237055-393580-5-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
References: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dadf8b20-ae2c-470f-905d-08d88781be2d
X-MS-TrafficTypeDiagnostic: DM6PR02MB6044:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6044505E263D0BFB4A0720D3D0E60@DM6PR02MB6044.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DIcAv4SS7DaiiGxeN0h4D4L1cYOkFdUP4G4wHMjRGjuS8GzL5yHu4o/uZYwt1oVmeRtpr79grDocN+Tdu7ZyBzsgmF2qgDPlxUY/FQnLHQlXE2lAeHV0GmXAqVYxC10F9mNM5WxI+xVqAKgPvWDQ0j415a/uxk9UCBZl4YbtVvKAma7C1X/pEAzia2fN4SFwflygckCrNr6T3JwJL1A85zCz6DOEvsAUfU2BoY0wA/SLh3W5qI9/9UA3az5/66sF+CsiXzBbKuC+DveuoWdQYDJc2bHBjWhCDNKXVGsQJMAzKgMz3aoebt+NdvX8mUpLcvizQcqg09FtMksHK9Kfn513HcOama25NygFSAIsmoV1pbXbsZAkYm8+fEv4wimlogzK3to//beE5rVQ8gwGALBFb6D/fbeJUANUKDcoJIAvN36khe1tpRHpT6BiOo+ZJEVX+yEIQ/EaIuOi6iztrEjM8KTXlT+w3+DYhO1RQNtr3Nk9/jdBeHKzVBi+RSQ
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(2616005)(9786002)(86362001)(5660300002)(26005)(316002)(478600001)(336012)(426003)(7696005)(966005)(8676002)(2906002)(70206006)(4326008)(356005)(186003)(6916009)(83380400001)(82740400003)(7636003)(44832011)(47076004)(36756003)(82310400003)(70586007)(36906005)(8936002)(54906003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 03:10:58.2703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dadf8b20-ae2c-470f-905d-08d88781be2d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6044
Received-SPF: pass client-ip=40.107.75.58; envelope-from=komlodi@xilinx.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 22:10:59
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

Numonyx chips determine the number of cycles to wait based on bits 7:4
in the volatile configuration register.

However, if these bits are 0x0 or 0xF, the number of dummy cycles to
wait is
10 on a QIOR or QIOR4 command, or 8 on any other currently supported
fast read command. [1]

[1]
https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_02g_cbb_0.pdf?rev=9b167fbf2b3645efba6385949a72e453

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
---
 hw/block/m25p80.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 2552f2c..0c78015 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -837,6 +837,30 @@ static uint8_t numonyx_get_mode(Flash *s)
     }
 }
 
+static uint8_t numonyx_extract_cfg_num_dummies(Flash *s)
+{
+    uint8_t num_dummies;
+    uint8_t mode;
+    assert(get_man(s) == MAN_NUMONYX);
+
+    mode = numonyx_get_mode(s);
+    num_dummies = extract32(s->volatile_cfg, 4, 4);
+
+    if (num_dummies == 0x0 || num_dummies == 0xf) {
+        switch (s->cmd_in_progress) {
+        case QIOR:
+        case QIOR4:
+            num_dummies = 10;
+            break;
+        default:
+            num_dummies = (mode == MODE_QIO) ? 10 : 8;
+            break;
+        }
+    }
+
+    return num_dummies;
+}
+
 static void decode_fast_read_cmd(Flash *s)
 {
     s->needed_bytes = get_addr_length(s);
@@ -847,7 +871,7 @@ static void decode_fast_read_cmd(Flash *s)
         s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
         s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_MACRONIX:
@@ -891,7 +915,7 @@ static void decode_dio_read_cmd(Flash *s)
         s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
         s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_MACRONIX:
@@ -935,7 +959,7 @@ static void decode_qio_read_cmd(Flash *s)
         s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_NUMONYX:
-        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
+        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
         s->state = STATE_COLLECTING_DATA;
         break;
     case MAN_MACRONIX:
-- 
2.7.4


