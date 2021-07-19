Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D993CEDF9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:58:20 +0200 (CEST)
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5aLD-0007QP-Ms
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5aKF-0006lQ-S8
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:57:19 -0400
Received: from mail-dm6nam12on2052.outbound.protection.outlook.com
 ([40.107.243.52]:2144 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5aKC-0000er-U0
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:57:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvgJqAykrFKWnFcAT4NyNsLL0lwvr9F6aS0HP2NK3ZkYjUbz4As+0E9ZMMpcueB4qhCn1dG9O5xAa2hUgLqQ7vX/idN6FAeer6ihIpAVA3w6GyZPAw5Lhz0pEfYJohu3FyVV8818KaxIrl4+s1UNN2RHCOyqgbOzcPKEBXTGI25dvlDVFv4+bB/DLHu8+Zc5Wl6cey2uEMDnwANJuyEPHWjs2881xB24lmVw7/b7e4qzHHLtXSrH6DZODkRiwt2fd7LLujrcQB9m36wziJG8Q/2kIW6RSK0v/5m4UvKfR3mvus8JspDg2hbMLwR9peg7RM5oIzvOozlc26+cHoy91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvZvxe4umiqoKSVrYSKYlIDJfRSTMZDQN34wj4Ho5os=;
 b=T936ZEiNI3HAI1rUP3StDjXmX0jf5Ug7/isR0tWPCasH/A3lxqu3hYOHChCXTsQbJGFHvh3Apnfx+K0mZt5w11IILudnbKvjPxonwmjcKz2VqD1cRLA31PE9uvn1Earo1wJxZX+0QbjqYI6if+GLN5vQnbcv8tJO2/CvRn78kzEPvY0k2a+787q5iiULiq8UefvW4riSmTYm8Yqh8jFrGx4gb9uIrAlSY4GLLDOWI6ijzoPPoVo4fc8Tn4AE2e9xzCSMSLcFSobz6SZAByqyCIYTiPzm3YE8cGUjJxizEGLno3GMKZAEhd7onnyzjOeDCnv/3VpgUuQ1i5jzxX0vTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvZvxe4umiqoKSVrYSKYlIDJfRSTMZDQN34wj4Ho5os=;
 b=U03olm3DID99qmAPqDymDgWdpJDe778yA2e6US+8blNEkGbUCk26GVZ6G60L9fw1UBLHAyzROEKdqocEYt8yGpl3yx9mZhtripuM7bLwxf4AyEYdk8QcA47rnB9phI/he1p5k1uosGueoSF716VdYooYuPBscF2Ck0nJ5JMXitg=
Received: from DM5PR18CA0082.namprd18.prod.outlook.com (2603:10b6:3:3::20) by
 SA1PR02MB8493.namprd02.prod.outlook.com (2603:10b6:806:1f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 20:57:14 +0000
Received: from DM3NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::87) by DM5PR18CA0082.outlook.office365.com
 (2603:10b6:3:3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 20:57:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT024.mail.protection.outlook.com (10.13.5.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:57:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 13:57:13 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 19 Jul 2021 13:57:13 -0700
Received: from [172.19.2.32] (port=56680 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5aK9-0000iY-16; Mon, 19 Jul 2021 13:57:13 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/1] hw/arm/smmuv3: Check 31st bit to see if CD is valid
Date: Mon, 19 Jul 2021 13:57:11 -0700
Message-ID: <1626728232-134665-1-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 454774d3-5174-4869-776e-08d94af7c8d7
X-MS-TrafficTypeDiagnostic: SA1PR02MB8493:
X-Microsoft-Antispam-PRVS: <SA1PR02MB8493F07A38B423E5A84B442CD0E19@SA1PR02MB8493.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YIweauePCe0FYWj38qZcDYDnrY36/S616joY8Hqo4eohvwKUikukuNkvoES8LTEEfG3ZQCEeU6Ln63L7AwP4UX5EuYH/TxHtvN390raGXDxpqvzZTizS8+aHDc/hizhrzIIXYF5GF9aIIk57ZtGXZCp9Q5cs7LfLZJ6rV0abKJq8bTed7s2lrdjKt/42AXlH8B2z5FB/osj/r9qf281+xaQdWg0cTKlb3siTZvZLzaR8VdiPc9VBXgC1/TphAoWkP0bR5hQ9jCAXMc/6s+/GF/tZmERaPNZk1AT85NY+33hRXXXQOhN6Nq31dnC4dule/xHuqL9QIZG49lgGTJA5kQ0iB6gQ2XRSHfqCsRCC0MIvkO6nRyZ5W0HOqapc6IFJ22jljGLJsgziwawrXlQln/yOcAM3/R7vpIRL4G/bewiJOpq0lvPyg151eJaXj6dEDilP0Okz+RUfZ0oNZ2tZeryiyQlhda/RHp4sbFwODQ7+Pv7VxQ1u8ovSwcD3CMJwZeQlpTGRz/f8I83Zxv7Bk3T/a7RT5sUQ74SrNIO72J4BbP+pqm2D8x2vLNk2eWD0x6162Y5iK2yj1qdH9CM0y1Cwiz2dHn/BhQrH2jM8fUS8Z2dYbmAqdTZ6Tm5p4aIzBci5IzwgEbZ0i/857R563CokCHOYFdurbBdcZMJS9rS3L+QJ8qa6ET9rMyRjEi9hugyqggJzX8C+5puZBut0cxNGSOyGhxFxxfr3H3qEujo=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(478600001)(2616005)(26005)(6916009)(316002)(2906002)(4326008)(36906005)(36756003)(47076005)(9786002)(82310400003)(8936002)(426003)(8676002)(86362001)(336012)(83380400001)(36860700001)(7636003)(4744005)(70586007)(82740400003)(7696005)(5660300002)(186003)(70206006)(356005)(44832011)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:57:13.5607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 454774d3-5174-4869-776e-08d94af7c8d7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8493
Received-SPF: pass client-ip=40.107.243.52; envelope-from=komlodi@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
Cc: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This fixes an off-by-1 error when checking to see if a context descriptor is
valid in SMMUv3.

I think it hasn't caused problems yet because Linux will also set the 30th bit,
which is the bit CD_VALID currently checks.

Thanks!
Joe

Joe Komlodi (1):
  hw/arm/smmuv3: Check 31st bit to see if CD is valid

 hw/arm/smmuv3-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


