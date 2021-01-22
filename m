Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9594C2FF985
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 01:36:45 +0100 (CET)
Received: from localhost ([::1]:39356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2kRQ-0000iy-MY
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 19:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1l2kOs-0006pG-6N
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:34:06 -0500
Received: from mail-mw2nam10on2050.outbound.protection.outlook.com
 ([40.107.94.50]:37345 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1l2kOo-0007oN-Sm
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:34:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2OzQBCk7EahAE9osj5PVU/K+a72Majr1ehvum0YAY3evHJKMEw0lBsAGDqWb4cJ/1f5NKFxryGntnI3M2J+SJVTAC0nLu188x1Y3+pNdVgPielVEj5YSgrZib+FaIxwSsIEBphZKrHQteR8iOBPdw2iwWZp9ggSR6RZD1Czh/hQSo6L+8asHie19APFAcrcUAXrr4h1kJfbIQr0Qc3ND1d/d6n3LaJ8lznI0Tzex1oqqaqdjsQUPGw6xr2reCLAsoFQZ2xTixQ+x3JVFsaL6wJj9550F/pMHhLQWCQAOYwJJesc/80YYkI3eDlE0FYmnLhhRjhJKaIxZHDTMKTiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPjsKADjF+j6Ffy7aC9+ZvgznwFj7g+f4gmUdTd923I=;
 b=j/ETmnNNUupj1KyzU+wqSH+Lp88nBcIpjozNZunT0VpEq77f20aPpY8XawpIEL9qQ/5lrsz9essdGC7A+LK+EQMnkLuwt7vFwrB056mYRUI4TkGZScz6va7CnKktFWuA7BppKWbCEr9/YzXTWI7kiTpsbuN3UCKHh1RY5BcYB3tbLtb1ArkmZLHa19f5IVEUbg/y5nKLpDFmMHoJmlOeLhRgObnMDp3amFJPZXCGDUX3NHOTuADV7YBNM2c/6vMrgs0s65TqE5U9iICxVJgBgUphIYhnKBSTmhwvGin1ItJvJLPDJ1HJpGjZCssCxpx4QaSVZ5H0qX6+F2hPG4+khQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPjsKADjF+j6Ffy7aC9+ZvgznwFj7g+f4gmUdTd923I=;
 b=dqzhyTIxCt3Cf9Cb0SFuuG1P1JTlk9e4SbqytN42vrUF3W9FViUaAc7OHYKYUo2ptB92ic2F4uOFl4faejFZ34lkH59J0RsAap4W9X7/LDYP/r+9siNaaXWyqEQVtqacVrwwBeABcy9HXwrL6Mt2UZxpFOSOFK03fVNWFPEt8nU=
Received: from BL1PR13CA0165.namprd13.prod.outlook.com (2603:10b6:208:2bd::20)
 by MW4PR02MB7364.namprd02.prod.outlook.com (2603:10b6:303:64::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 22 Jan
 2021 00:18:58 +0000
Received: from BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2bd:cafe::5) by BL1PR13CA0165.outlook.office365.com
 (2603:10b6:208:2bd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend
 Transport; Fri, 22 Jan 2021 00:18:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT024.mail.protection.outlook.com (10.152.77.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 00:18:57 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 21 Jan 2021 16:18:55 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 21 Jan 2021 16:18:55 -0800
Received: from [172.19.2.32] (port=58488 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1l2kAB-0001Bj-Ij; Thu, 21 Jan 2021 16:18:55 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 2/3] target/microblaze: use MMUAccessType instead of int in
 mmu_translate
Date: Thu, 21 Jan 2021 16:18:54 -0800
Message-ID: <1611274735-303873-3-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
References: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f182405-a33c-4b67-a11f-08d8be6b4f9d
X-MS-TrafficTypeDiagnostic: MW4PR02MB7364:
X-Microsoft-Antispam-PRVS: <MW4PR02MB73641E6A6B6BC174F763852AD0A09@MW4PR02MB7364.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: irXaeVQvkEvz2xl8H+wtr6EvU2aNOb+n7slmdd8CjjIfRYOwTe5Ms4/NLHnhE9XqMHQZ8VW2yhGzhiUkRSfvAVP6viDzSuC4aahikgmMxu9ZupNkxtDVjmVarlctKlGBsK+kSnNBLg3OQOb9fYU9yb0ZWaLplsmSx53NoPcJ+rFiVidrC0bAanPQIaO27AMNAMlwW1Gz9hpuUYIPcg6wr4EDsDJc097wAxXd0NJLHKdGsq0qaNYi0jGjREy0NbW5ehN//6deVOlDbRNctssx7/s/vhIP/bSm9GaT2meWozWP3X/tBuqqUrtWeJwLcNYtWZPSZMqzZ5Q8+HHW9Iu1MyEilt33PbeTctVkysPVmysHC3FijpYowhXESmLUuYw1XaIyJdrHd88xYuoOCJx6bs5lKrslqIg5R72TouOEtlTNrx99TrfcAV5B5PcJ3hH8Vy+oAKYrZajwBVdfOXqxo2yIBwHUwRiUWrlYzF3JBYmZywTJKctZWcLlsXAhkWRE
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(5660300002)(9786002)(6916009)(26005)(8936002)(47076005)(186003)(82740400003)(356005)(70586007)(70206006)(36756003)(2906002)(7636003)(478600001)(36906005)(316002)(2616005)(107886003)(336012)(86362001)(44832011)(7696005)(8676002)(82310400003)(426003)(4326008)(83380400001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 00:18:57.8004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f182405-a33c-4b67-a11f-08d8be6b4f9d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7364
Received-SPF: pass client-ip=40.107.94.50; envelope-from=komlodi@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
Cc: edgari@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using MMUAccessType makes it more clear what the variable's use is.
No functional change.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
---
 target/microblaze/mmu.c | 2 +-
 target/microblaze/mmu.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index 1e42696..cc40f27 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -74,7 +74,7 @@ static void mmu_change_pid(CPUMBState *env, unsigned int newpid)
 
 /* rw - 0 = read, 1 = write, 2 = fetch.  */
 unsigned int mmu_translate(MicroBlazeCPU *cpu, MicroBlazeMMULookup *lu,
-                           target_ulong vaddr, int rw, int mmu_idx)
+                           target_ulong vaddr, MMUAccessType rw, int mmu_idx)
 {
     MicroBlazeMMU *mmu = &cpu->env.mmu;
     unsigned int i, hit = 0;
diff --git a/target/microblaze/mmu.h b/target/microblaze/mmu.h
index 09e4075..b6b4b9a 100644
--- a/target/microblaze/mmu.h
+++ b/target/microblaze/mmu.h
@@ -84,7 +84,7 @@ typedef struct {
 } MicroBlazeMMULookup;
 
 unsigned int mmu_translate(MicroBlazeCPU *cpu, MicroBlazeMMULookup *lu,
-                           target_ulong vaddr, int rw, int mmu_idx);
+                           target_ulong vaddr, MMUAccessType rw, int mmu_idx);
 uint32_t mmu_read(CPUMBState *env, bool ea, uint32_t rn);
 void mmu_write(CPUMBState *env, bool ea, uint32_t rn, uint32_t v);
 void mmu_init(MicroBlazeMMU *mmu);
-- 
2.7.4


