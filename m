Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E882B54C5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 00:13:33 +0100 (CET)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kengh-0007PY-Mi
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 18:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1keneW-0005xA-Lg; Mon, 16 Nov 2020 18:11:16 -0500
Received: from mail-eopbgr690062.outbound.protection.outlook.com
 ([40.107.69.62]:49230 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1keneS-0003x9-Nu; Mon, 16 Nov 2020 18:11:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G59oerhABxTIbWv970XZscW8/I/XuppZ6S1aj9WHXCNE524qTW3RVmvtcNnHxk84yCJn7Lf5w3Jq1lhVq2krUc80qXHPBIs1DN85Gjt/xOzpoXg1GC4g5tVQbVm1zqj8+TynGEO3pXE/d3hzUYIaKYeuURaJtyBkghnpiCL+d406uraFkLGAVAJO+jGcFyN1Lv/k2n+CoSVSGVFxSc4SFuwDH1leWAc0PFBdXjL9qQi6zntw4+WM7mF2fWZktlKxMuggyZyCK/5hRPmuTfvZtqwd/bQ+3GYwxztRS/rcirE1WMCO5K38+7/5O4B/I7bOrCo1q1q4eKuF1VP79UCW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR8jD+j5MrWmKeZ+Dv79qspK7/u27O+5MG+fkBzsLSU=;
 b=TOq9mMW8LdFk3kid6QeWlVVxAK9KbyINYK5WZuIZHHnHalwo8FtdspcDxIyJgWAoqkGEj/qlgRzpncRzTynnrBn7zc4tH/GbDAQ2U45Du67jGxMbgNx21CK5ApaZ55ijaDJrU2+sI7KEQBYQiBjHwy+B/vOXCwG3L1qhdJpo/0Dass4XWAuR7T1k1EtQg8AOnRxzPick+r5JW4HSMGKb/YMB54opm7lmD3r1j3mZtBY0R4OHnMP1uJyL/WSeZ5pYRMKEKQpXb9TqRiAOmuxd8Y8ozZMo4h4a96TdotHuDw44mK6G36kVvjqrsfBCCiMMIVEW+S3uAqh2D278G3+uYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR8jD+j5MrWmKeZ+Dv79qspK7/u27O+5MG+fkBzsLSU=;
 b=jfDejbZSWaBRVIST/QZuMgASBC2NSR6GJnBT4n9OsimoCf+2zbvJDEjhqJRkt4ajOKf1Ead4p5+eSWWjiDXVQfkwYh0+slTcRBrDMVKlJqqAtmcd35ntC5UD2nPS4bqlZbb3tmLdvvJJe9IDJmTECBbRwnjApNqjbqbBcs7zb0g=
Received: from MN2PR15CA0064.namprd15.prod.outlook.com (2603:10b6:208:237::33)
 by DM6PR02MB4058.namprd02.prod.outlook.com (2603:10b6:5:9f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 23:11:09 +0000
Received: from BL2NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:237:cafe::26) by MN2PR15CA0064.outlook.office365.com
 (2603:10b6:208:237::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 23:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT051.mail.protection.outlook.com (10.152.76.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 23:11:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 15:11:04 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 16 Nov 2020 15:11:04 -0800
Received: from [172.19.2.32] (port=55506 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1keneK-0007S0-JK; Mon, 16 Nov 2020 15:11:04 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 2/4] hw/block/m25p80: Fix when VCFG XIP bit is set for
 Numonyx
Date: Mon, 16 Nov 2020 15:11:02 -0800
Message-ID: <1605568264-26376-3-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
References: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 075f1545-0af4-43ab-87c9-08d88a84e6f3
X-MS-TrafficTypeDiagnostic: DM6PR02MB4058:
X-Microsoft-Antispam-PRVS: <DM6PR02MB40584A98DF650B5D1673A636D0E30@DM6PR02MB4058.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:79;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zzId58GfzODCZYugP9NQk8eOfT7JQ8+EBMdKk6ArnIFl4mx9hxWFqdbCOig8DoVqtHHbRv25TkN9DVEy9X3aAJh7ZKptMmWl++Om6qVh8ZU1DB6OOdstSiMSxvl+nvSfEepJiWC1PYcImk8hz1wmEvVUOD/O6run59Io/EsDs2bSg94arq8Ix4pYmXndOiqC4aDYxWjmkTvhs3QLhq2yaOQ0TtQfgsmT4hrJxk7b2IaROCfMifT3rW9bfDih3qgqliYtcXup+MI5V0wB1ZxpBsOxnZ5GvyvAuAP2mzsqP9tuK7nzlqDanNNb8HiDaiNbuw6mCl9lDi2/TmFMBosTsuPNTcKf7lhzQSEoUNwYpIppRLqoDx3Awu6yMELx+CXP5IZc4Wz2bMqNqzZSL6epgUost/itCaLQv6Q5dmeTnuE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(54906003)(36906005)(316002)(478600001)(5660300002)(70586007)(70206006)(8936002)(4744005)(86362001)(2906002)(8676002)(9786002)(4326008)(336012)(426003)(6916009)(36756003)(44832011)(2616005)(83380400001)(7696005)(82740400003)(186003)(47076004)(26005)(7636003)(82310400003)(356005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 23:11:08.6541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 075f1545-0af4-43ab-87c9-08d88a84e6f3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4058
Received-SPF: pass client-ip=40.107.69.62; envelope-from=komlodi@xilinx.com;
 helo=NAM04-CO1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 18:11:10
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
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


