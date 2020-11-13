Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFA62B1492
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 04:13:24 +0100 (CET)
Received: from localhost ([::1]:33856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdPWd-0006V3-NI
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 22:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdPUM-00048c-PE; Thu, 12 Nov 2020 22:11:02 -0500
Received: from mail-bn8nam12on2059.outbound.protection.outlook.com
 ([40.107.237.59]:34400 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdPUK-0008NV-9O; Thu, 12 Nov 2020 22:11:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJrKfOT5+mAMJM1Wudvvbfh/vH2gy/JlHmXro3Qlal9Yenpcx7+w41M6EdPxTLZC9I4AYhJpJVPO2WG+jL2aBkeS25ThrZkl4M08+viz6OCYiJjilBbF4g+5lba3NxtrmzQZy3l//oHcjVlP2n72IuYQrsoVyF/4xZjWWbEvkfJsmPyloIkWX+ja4ON4ehRT9D/i7gBktAD/bduPL5s5PF79nHJPysNIChMSVVhH93pfgwv0DC5jH8Sc0IcdoFDdkRZlZyRijrz1k6/Qay6EMQHQ6zTIiQY/Hwb2PezF3IcvMZsUKlYSTTM4NjMXJJf7YXHnlnHYyIkVsuWOiAqwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fij6OG1nCB/qU2b7zMeBELdwLiukAF+a4RymvbQyVJM=;
 b=jqznmJEq3N826iH7AP3Ly2C/kZtINumu68ZODVtn9lg8whEcWR7Nsyvtc1ndfpZeUZWQGHAom0x9ltC1yhmt8sh377pBkClyFnOtW7MP6/xWNCW4sj1+K1rdisjQrHRJ9GC0JAeaKnn5QL61vmzLvG/8iJT03/SXYYoz3XMFkULdGsCg5QDs9jCCIwYz9m8oQRN33igO9UBXYWu9sgAVhyv+Wg4Bwc+yozcZCxRRtVDKD4FQXAzxFIP0pbJzayW20oCOHSArpA1Q5Epvt1Q6KE1/Z17uwmCn2RED+ORcmX44edsmW85CpKXnKD/q0N97GJ9dD8Fpbvczhifo/OyFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fij6OG1nCB/qU2b7zMeBELdwLiukAF+a4RymvbQyVJM=;
 b=jzb7uZ/W/pSMnYvKtvCN9bAYEfzpS48wIpYKiHij9rKs+Nm1b0vPnnGtG5avfxUgH3pyipWhbCPMNkH1lOrk6vjHVMePezZbI3R7upantGI/F1YiI4HoaBttEUNGu+TeDEYHqYPNHIsQfbtbjLMIa+TYwQhM5OXinYcQJsczMWM=
Received: from MN2PR19CA0004.namprd19.prod.outlook.com (2603:10b6:208:178::17)
 by DM5PR02MB2588.namprd02.prod.outlook.com (2603:10b6:3:3d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Fri, 13 Nov
 2020 03:10:58 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:178:cafe::85) by MN2PR19CA0004.outlook.office365.com
 (2603:10b6:208:178::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Fri, 13 Nov 2020 03:10:57 +0000
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
 15.20.3564.22 via Frontend Transport; Fri, 13 Nov 2020 03:10:57 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 19:10:55 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 19:10:55 -0800
Received: from [172.19.2.32] (port=54046 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1kdPUF-0004vx-Pn; Thu, 12 Nov 2020 19:10:55 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 2/4] hw/block/m25p80: Fix when VCFG XIP bit is set for
 Numonyx
Date: Thu, 12 Nov 2020 19:10:53 -0800
Message-ID: <1605237055-393580-3-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
References: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1b654f5-ad98-4370-bd64-08d88781bdaf
X-MS-TrafficTypeDiagnostic: DM5PR02MB2588:
X-Microsoft-Antispam-PRVS: <DM5PR02MB258853460FF43D76B954065BD0E60@DM5PR02MB2588.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:79;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EnDEnS1kGyt1SUp71d0urGqmV4dNtK6SeoHSQz4INo3dpMXHRbOgklWAEl92ZKhWJgaiNWkKnSY9E3CQhNoGXftF/EO5nyDqxwUNbAHi8plO8qwVu8hAyZzkQKecyF+p/IVNXGkYpX6CwWKWoYN1elPqmLJXZ1+6ECVTEVhTfv8KgZvIPGgMbn7YGrjYf26nDpdbe49Lgj3x7WRJW3qBb5ypH00btBbRPr40bGbazoUKTnd5zlMTE6taJOgjsYF5sDCgCETEx3QBHEq0B2XnrdYPLJMiYhmw5ltu9iVYg9Ypt77qUXdLnHkuQ/9JNlQ5NPcnR4w/Ggie88+ubmtA3edpzayHWgpXGbF/T7TKkVy0LnJ+uu+JPUFHpoMDtX6Pqw63iypuGiM5JE3SeUs3Nqoo5Cf5Ti5f3p0W500vVIc=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966005)(2906002)(478600001)(6916009)(7696005)(4744005)(86362001)(5660300002)(316002)(26005)(36906005)(9786002)(7636003)(44832011)(54906003)(336012)(2616005)(8676002)(8936002)(83380400001)(356005)(4326008)(36756003)(82310400003)(70206006)(47076004)(186003)(82740400003)(426003)(70586007)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 03:10:57.4447 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b654f5-ad98-4370-bd64-08d88781bdaf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2588
Received-SPF: pass client-ip=40.107.237.59; envelope-from=komlodi@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

VCFG XIP is set (disabled) when the NVCFG XIP bits are all set (disabled).

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
---
 hw/block/m25p80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 452d252..eb6539f 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -768,7 +768,7 @@ static void reset_memory(Flash *s)
         s->volatile_cfg |= VCFG_DUMMY;
         s->volatile_cfg |= VCFG_WRAP_SEQUENTIAL;
         if ((s->nonvolatile_cfg & NVCFG_XIP_MODE_MASK)
-                                != NVCFG_XIP_MODE_DISABLED) {
+                                == NVCFG_XIP_MODE_DISABLED) {
             s->volatile_cfg |= VCFG_XIP_MODE_DISABLED;
         }
         s->volatile_cfg |= deposit32(s->volatile_cfg,
-- 
2.7.4


