Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E632D3CEDD2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:32:28 +0200 (CEST)
Received: from localhost ([::1]:42416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZwC-0003n5-10
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5Zgm-00018F-Sy
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:16:32 -0400
Received: from mail-mw2nam08on2089.outbound.protection.outlook.com
 ([40.107.101.89]:10849 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5Zgk-0007J4-FR
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:16:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxxlkYErBV/UQh1+WEGc/OwPhMI2KL7M//ataOKw13ZqAAiBrYVVMS3HaF6oL9kMZVzu43kVe9bdrdJGsHkhb6IC3LFj+H9NLfqpIUjsItkaLqbCI4wktTm7/Ysc1MmkVXXk2nRrjAdvTvGG4/T+nyEB9qeomsFZbXTjOIdK/0gA3pzlpJ6fbe/49lmGltBcjmCKEUGYNiqbmawts0MjeWpsU6bV7Rjs07PGq/StqzmZm7LwxFUbjTERmPMz02IVbTHdttqQgAzPgu1JmHQ7S/UpjgdBRM6FXzkxrgF95lciky6SIX/Ll7wknPuXb2e7WPrR+eU/CpPMkFpd1mcr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JENPow6OPEyqAC9GOV+1imbPH4B+PPexIpthzl1wIPk=;
 b=AD/3elPHPvB1rOBXna/phV7Hn2YmA6x9SH/e9gguXl0KXZ4Amw07w+pm1lngCadUOlzxp3k7ur7m6A8wSfcYvL+54R7iqTSWBwbbyJQWEYKPnXtx9ndhK3Hj2WKMoE1sufPXe9lUn0ppx2/l6ajdizGv6YLgdwINKNhaVbHFkC/Whv35vRwrdUb3hNinRDr4ylIpB4gL957/FisHcpSv0CLbx/c/R8EaCurv4bOVgXsCDmAUDTyEKygrGi0wMD3n07ntuJPurKZXb8WLSbWcNfUazDelOioKpMKfJXDdC/L6DFq3c3l7cHTfRjyIN2oepAJu5l4GOYbJv72dN97Dhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JENPow6OPEyqAC9GOV+1imbPH4B+PPexIpthzl1wIPk=;
 b=li+JRq3r4wtZ2teV1SWE7RqTW6z3PuAPZw+u4HYrhLwN3PXuZQGRpsbg8lh9Qn9aRvV2RYVsebZS5R90W0dpq6FPdp+MI6Hl0Ql7spA1YnwmNmmdSmK4dx+ofKCbFQifa1Oz5yUy052PruZUWI1M2TTMhbK5RXQOizkDNyNWgOY=
Received: from DM6PR02CA0120.namprd02.prod.outlook.com (2603:10b6:5:1b4::22)
 by BYAPR02MB4742.namprd02.prod.outlook.com (2603:10b6:a03:4d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 20:16:26 +0000
Received: from DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::21) by DM6PR02CA0120.outlook.office365.com
 (2603:10b6:5:1b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 20:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT025.mail.protection.outlook.com (10.13.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:16:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 13:16:23 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 19 Jul 2021 13:16:23 -0700
Received: from [172.19.2.32] (port=56664 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5Zgd-0004Hs-Hc; Mon, 19 Jul 2021 13:16:23 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] hw/core/register: Add more 64-bit utilities
Date: Mon, 19 Jul 2021 13:16:21 -0700
Message-ID: <1626725783-133765-1-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffe35e98-9814-45b0-14ac-08d94af2157e
X-MS-TrafficTypeDiagnostic: BYAPR02MB4742:
X-Microsoft-Antispam-PRVS: <BYAPR02MB474296C7CEB2000FB136E553D0E19@BYAPR02MB4742.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +JAKxKk1S/BzAFLW/N4nRsNvdnFaMX2qbXIv/uw4HOm0RFAzJQcs8ZIzrfzuMz7bnJtPkJzKHUJz1dDqOJ+/mGxk86N6s6t3KynmzJPPJKbVPrr42rHWcT7Vqlzmh6EE8+x7Zk/L22HpQ52aW/jMwTuq6qW8FOAw9oOUvaSFGTKvPeGg8tpNtD/sEwwvvzg6XzRQS0QHt0GSPwcVetzoVAr0/Y/Qs+P023e8HBn5C0TjVETaBj2kh+PI9xED3z1DNaILQPUDFSGXGZ5Sm9IweqhNHrKZ9HQm/k0aMDRYj4yhDpAQa1S1u5O1ef5IwsSpOJQ1Bssyq4kZYrVI7AbjMzCGJMDqMPMMtCCdrDX3OIgKIwpCWzLo5Iw+lkCsxQ3S51o9hC9fbivhx2RLl62eqYivHnWL8LK+veN5Y47LxOdEBfnr3VcACQ7JtnxfLWwyAWBlIE6dRXjUfIg/WdSiFbHpKsLwDrXsR0FJOUbnXtHg0CqYctLTknTGhHrOj+yBg1PdI0eAOxUQX23jXD4txnjX8DCKnMgzP5n8I8Zc8MlhWhb7IUIzDYYEQ0unBEOO5fVybv7c4iiyEomC758kdMRx089B2geNenzpC/IJIGh6bWrtxwXygheFiJnsMdPOvzi26vYmGVTcmErjOKO6OVsTE1YJwtp9DUfXIbja6d2nQBq+XQg58j+YO3yWOx2t0g5HiYdhBPrqwlfQMyY8MtqZEDhC3UgpXxNDnTWQgZU=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966006)(36840700001)(26005)(478600001)(7696005)(2906002)(4326008)(8936002)(82310400003)(70206006)(86362001)(36756003)(8676002)(6916009)(70586007)(356005)(47076005)(36860700001)(2616005)(83380400001)(186003)(36906005)(7636003)(5660300002)(316002)(9786002)(4744005)(82740400003)(44832011)(426003)(336012)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:16:25.1851 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe35e98-9814-45b0-14ac-08d94af2157e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4742
Received-SPF: pass client-ip=40.107.101.89; envelope-from=komlodi@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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
Cc: alistair@alistair23.me
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This adds more utilities for 64-bit registers.
As part of it, it also fixes FIELD_DP64 to work with bit fields wider than
32-bits.

Thanks!
Joe

Joe Komlodi (2):
  hw/core/register: Add more 64-bit utilities
  hw/registerfields: Use 64-bit bitfield for FIELD_DP64

 hw/core/register.c          | 12 ++++++++++++
 include/hw/register.h       |  8 ++++++++
 include/hw/registerfields.h | 10 +++++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.7.4


