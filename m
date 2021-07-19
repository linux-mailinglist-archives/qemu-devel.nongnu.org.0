Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9893CEEF1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 00:04:56 +0200 (CEST)
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5bNf-0006XK-2W
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 18:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5bLh-0004D5-1Z
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:02:53 -0400
Received: from mail-dm6nam11on2060.outbound.protection.outlook.com
 ([40.107.223.60]:18727 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5bLe-0001Y0-JW
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:02:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTc6lRUYvJhByPQYZAazT57aQpriCarqNn7/guq/Ge6y9KojTce+kmvoOwWrzyVGBtbParFDHqt3j9WYp6tsbLP4KhBZED7VOWAhwIb1uO4Do64m2q1UHh7zY2qJ0QBqr9EcRIY730faaVjdnQsm93NjgRrFzGmVVb+BV6ROHpCxQwROwV1oe9JbxDaXLAhkLJdaNL6fRFlfuJhkBtyAo+jEwGkyy6k3wuMFeiVExR65uA/6nWG+ol5d6lQeeDSHpdZMIb4vXmije6VqpV23eAWfccPzd0ZpHobYxd0E3q41pqG6INpL3NhwoLaQU0+PFPeO0mDti49E2s1FfPTI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZf9CLPTzKWhBDB92i0beHCV2Aq2Wu8fQsnyljxdPrM=;
 b=cB13r2MCl2vWqOTlJm44owlYuMpN+MjnzcYoKdfFiCP8pNmhsfVjYDv6t0rR5AfKqWF74/sKiqvSS/QI++rs3uhCafQ4oPP5fZDQAVVnFsiwPSTUKkUN2WKFono7DYNrX/lUFebUa0N2h7/bsP7+ggHOOGHf8ya+ui8WyS7xJIPclt1WmrWPUpoL6cKBMWWHCVrAAMSnjH9HEAJV2ks/IYlDQ7H/hEQi08gR4Bdqms34G1X2aQneuUwiLAY4knL9fJ4pAt7+0qRcM+GtWNda0N2915iuAbr81jbs1gP6k5o2dPPBL4rwlgj+4MnmQV1eCykJdtyv/fSvNZYfSOrNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZf9CLPTzKWhBDB92i0beHCV2Aq2Wu8fQsnyljxdPrM=;
 b=rAf50RSPXwN5DRiIDprzeygW9hxJ19PROgq0H6ts1p3/H/Yf5t9ky0CtZq5LR7oRbEz1LUbIhY2Dt2ngvda0t1TqZS1AP/qd9kxH1rdXU+EDK8nTqgI5Vd6pAuEfbY3PYllK1UPoKBA7Ik/IEm+4cS0JVlYl2zfn/Rjxq4f1YkI=
Received: from DS7PR03CA0252.namprd03.prod.outlook.com (2603:10b6:5:3b3::17)
 by PH0PR02MB7271.namprd02.prod.outlook.com (2603:10b6:510:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 22:02:46 +0000
Received: from DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::aa) by DS7PR03CA0252.outlook.office365.com
 (2603:10b6:5:3b3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 22:02:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT036.mail.protection.outlook.com (10.13.5.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 22:02:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 15:02:45 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 19 Jul 2021 15:02:45 -0700
Received: from [172.19.2.32] (port=56696 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5bLZ-0003YW-Tw; Mon, 19 Jul 2021 15:02:45 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] Add more 64-bit utilities
Date: Mon, 19 Jul 2021 15:02:43 -0700
Message-ID: <1626732165-137461-1-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40587ada-7c2d-473e-3dd9-08d94b00f10b
X-MS-TrafficTypeDiagnostic: PH0PR02MB7271:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7271A93F3B39436B82AFBB0CD0E19@PH0PR02MB7271.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AaSWxw2s2PFBSXAJ2T0MGPd4NSDjo1/cQB6GdhtYGvBFXgBbJrbT3wx7iiU2TFHHr9IaPkX9/qeuXZk+7UIzRBoh/fplmf+mMMe+Dq1wKN/xl+W+QXaIUJBefAd9JrVs+qpebfN+uH2jeIegKciRwwnFr00hQXThE91JFiZEVAwXb77zHjYfbNRfIL01K0+L6bkmhEMpXDaSYr3wHloaBZhbpuMyjSN8buQ+ywZJAvtCwnNpacngnlH7deCj8WkBoyfB/P5Tqrq3wvd7vQAavvZKMaD1Bv2ADoTwMT0P8CHwF069gcrZhYnsj6gmr6xn1X3NbXqPAV1Z3XP8AYetlwEsdydSpGRk9dEqRHKqJJr6JbynijVy1RXkkIUCZVgIYeRsL2WK4qRMi1OTS34BqqFlml8I+4iw3WCe0ZdJEbN9wwXqSgdgUqjhRps/2J4DVlQrkXpWKyQR+8DdzDYlGkeJAeWZG7uLiAWPGvuDFTqd/Jsqal3C4Bif3Jx6v0JUNT+uiM76h7p1sdD+HupYj5hqwNMHzWyKWlFfjkd9CSeotiJ3+GVgyboEdG26ar8SumacPdVn7YBVesGq51RUbA7W8aoorTJ80KwUTMj3Hfo1qK0eB9QTgdy1/ryXlUCObvAMMdLvpCWfI6DCZPbnnNtOI5gI1GysHzRYARaybnC3pzGC/2GOnYor7uW+T5dEAShqxANDhJi1VDYO7e1jXjdf5tQC+HV/NGm9cO4i5fs=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(86362001)(36906005)(4326008)(316002)(336012)(5660300002)(82310400003)(4744005)(8676002)(44832011)(6916009)(186003)(26005)(36756003)(54906003)(83380400001)(2906002)(47076005)(8936002)(70586007)(36860700001)(2616005)(70206006)(426003)(7696005)(356005)(9786002)(7636003)(82740400003)(478600001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 22:02:46.4845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40587ada-7c2d-473e-3dd9-08d94b00f10b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7271
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
Cc: alistair@alistair23.me, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changelog:
v1 -> v2
 - 2/2: Use uint64_t for 64-bit value

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


