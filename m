Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9542FF958
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 01:21:39 +0100 (CET)
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2kCm-0002nv-VD
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 19:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1l2kAQ-0002MY-EH
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:19:10 -0500
Received: from mail-dm6nam11on2060.outbound.protection.outlook.com
 ([40.107.223.60]:7038 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1l2kAN-0002aF-Hd
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:19:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmqUwQ/crSAImveq3TcKEGIyW0ddxUUlElH9hXLavPFb9FqwtTdEJFrB65RVeUTjfhFOyioUkf+w6nsD2APNuyQXKBQzNH6gsuQNtf6p3SFCIfEm5Er3to5cKm3ftz4gEned6eNYuVVM3EviOC6afTuqL+YUvdWZ+PYKmUXWMzS2OKgGS71F+WU+OqC23VxpfLLAdvrUEVRoVbFsZCKrqVV2k+Wv9fbY+6CvHMUIXlFa9fRPn9F3rt7KLmOxF4dvC0zgpKsZiW7ozbMtXTTGnRFt9gbDX6SVyEdcF25hpEz+JslQFggc4BNdZQhb7wsZgiWiJHIgTEYRmP7y9ed2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRoMVbhkA0Qr0w5Q/RDvnitT7kn6fPPYBBwfQJsQC/w=;
 b=DCvk/3G0t9OLRvXRb+qO7tiMNGgj4fsDeE6mb5EKo09dx8PJUME325tIYiq7VIvNqgveuilduf5bcwNBMFbg1/Rzs2RukaLQOyGCIeofrjnaeY1NBgAXNtnr62QuLsu3nXV8gnzM7LsB51nGTASX5cSHZlCSTlM49Nngu74nTWqbTR7CaX+rfnSmYf8YF0zlCjcp8DbxBPyFrBAPVIuLGqpxxIjEr8q4bj9LgAMBYeAHNhNRkuzYtyoPumCMgNKbCeAkLAxNEjUBwrPA0nus77N8dqKn2iJ5TAa9WocohbSlcj6ykPUNUXYRCpLBWACFCyx/lNwYP1+uz2jbiyP6GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRoMVbhkA0Qr0w5Q/RDvnitT7kn6fPPYBBwfQJsQC/w=;
 b=jT5uDslEsLSr+tolsF0UpKXvYMEtbY+5H9hNTTufcjhDMHna8QPfXORgpcbfQzJXbJUr6afb5QPyUX5K7gYpKNwiLgL/aGm2QExHprqdoWRHzXmuej5MygfSIkjxLD57nepI8P91G+CPC/9/ABCA3wa4362Ftw2E7LkiFEVx6eo=
Received: from DM3PR14CA0147.namprd14.prod.outlook.com (2603:10b6:0:53::31) by
 PH0PR02MB7143.namprd02.prod.outlook.com (2603:10b6:510:1f::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10; Fri, 22 Jan 2021 00:19:04 +0000
Received: from CY1NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::a4) by DM3PR14CA0147.outlook.office365.com
 (2603:10b6:0:53::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Fri, 22 Jan 2021 00:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT062.mail.protection.outlook.com (10.152.75.60) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 00:19:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 21 Jan 2021 16:18:55 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 21 Jan 2021 16:18:55 -0800
Received: from [172.19.2.32] (port=58488 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1l2kAB-0001Bj-HU; Thu, 21 Jan 2021 16:18:55 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 0/3] target/microblaze: Add memattrs on transactions
Date: Thu, 21 Jan 2021 16:18:52 -0800
Message-ID: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8893fbd3-b04c-4ad6-2b54-08d8be6b52ec
X-MS-TrafficTypeDiagnostic: PH0PR02MB7143:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7143337AABF1F95101E41215D0A00@PH0PR02MB7143.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqDoouJNNi0h3NTzL6pfncnQcPKp7W1reOxZA0iH8eypKQJEQJNL8frF0OQ0nO33rsvXyP9WwKiCUF7ora+SY5mBEu84fCwegHbUvQMhoCVEemkhjE5UszKmKFH2/K7ViRQGzLuMAuBWlx0YtjjN+JBinHSSPCJ2vVi78HRE9AJkC0C+f7fMboxkPgUdRqvu1Itq0o1Ayjuk7I3kcNwK5kghaeF4mqRhyp0wbpBwkm8QHTX2GW0WmU+csW5EaAIGPoF9d4rg9oJcdBhHvZx0Khl73hAHjr/Nxwhhsigju/c3ZL3r09I7/8BC5eL1Q/YgDgBvfDhG8Vmn98jobP+olbt4QKqVmdybTMEUzOUiv1hMH5oemy3rc1NsdPbozhPiP31pJTgscwownd1H+Xn5THKRRRBDSHZlaIaw+tN3Qm5B1VnJOXoy6/G0+V5iDCP2gO7CM6o3HagE9KDh/h1DS9ctEGLnjJczMQCxBWPROo48DtnCYXedUjxTz9/l1Aqa
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966006)(2616005)(426003)(478600001)(82740400003)(70586007)(336012)(86362001)(70206006)(4744005)(47076005)(9786002)(82310400003)(186003)(26005)(6916009)(107886003)(2906002)(5660300002)(44832011)(356005)(83380400001)(7696005)(8676002)(7636003)(36756003)(316002)(36906005)(4326008)(8936002)(6666004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 00:19:03.4192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8893fbd3-b04c-4ad6-2b54-08d8be6b52ec
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7143
Received-SPF: pass client-ip=40.107.223.60; envelope-from=komlodi@xilinx.com;
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
Cc: edgari@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This series adds memattrs on MicroBlaze transactions.

It does so by adding support for the use-non-secure property on MicroBlaze CPUs.
From there, we can then determine if the transaction should be secure or not,
and memory attributes can be set accordingly.

Thanks!
Joe

Joe Komlodi (3):
  target/microblaze: Add use-non-secure property
  target/microblaze: use MMUAccessType instead of int in mmu_translate
  target/microblaze: Add security attributes on memory transactions

 target/microblaze/cpu.c    | 48 +++++++++++++++++++++++++++++++++++++++++++++-
 target/microblaze/cpu.h    | 14 +++++++++++++-
 target/microblaze/helper.c | 26 ++++++++++++++++++++++---
 target/microblaze/mmu.c    |  2 +-
 target/microblaze/mmu.h    |  2 +-
 5 files changed, 85 insertions(+), 7 deletions(-)

-- 
2.7.4


