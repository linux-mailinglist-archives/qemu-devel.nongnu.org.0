Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F673D01C4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:34:55 +0200 (CEST)
Received: from localhost ([::1]:46826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uZy-0000Rt-Hd
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5uX0-0006eD-Gg
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:31:50 -0400
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com
 ([40.107.243.56]:46194 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5uWx-0002Ey-G9
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:31:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcC77S5BZp6Oh80b4vn1BbhQtE9KToXiuCOAG1YI2S6V0s3nCqgepElONyjP1GzpSqUITAXMnRfX74K/mN2k9X5ScAHsAU9gKCX7QhC+nhrOeVRsFakBsPl3Ia7fe7kgvso+Db5pyWlp2zZUtsKaoDZDmIPrvbRoK4wIQU7IXjme/UxG2Ton0odJbx3o4hDfvv8rH1QPc7ja7T629sKoHJK6ospaBeYD6YRlIAyjTnyejF8ocSmDiv/qEpG5FSVpeN1Ff31bQIDruu6eYTMZOaPEKZRd6uerKOOcdKKEJQo1kGJWvExkGMXr+aixDMTjmjjgwgh/t6i5O7ucIMauAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AA42CTqhQO65HM1yRa1OasOXTIgWwKhwmyWGoJbJ7nk=;
 b=Xf/yviR8ty1OeAY77x3W4U1M43X1mltl0AlojI+bPpAAQeMa6vBhfz9SJzGRZvxTSFND37P/V1cLJQUqpC/gQWYu4Qziekb225FCPmJc6H7Cjk1yy2V3LJRUbk/Vr6/wtPxxzB7IP613CdrZfLMBK3gdaK/XjyaBGdUsztWJJSuI/e+3Etaht7o8+UpKG9E+TBGo9tGfbcXzauXu+9P2EQFoOAp1gG8siRZ4ZIbQP24sW7A72wJjoXrTxp1kLEbM7gjBHjJ0rXVESOTaMDjXtX9Vmglxz31uZSQBqlOtdxpHXQPJ1yXYS5EEssOwW4iUAgqvVodWZj4PUbzq+aa+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AA42CTqhQO65HM1yRa1OasOXTIgWwKhwmyWGoJbJ7nk=;
 b=sVvbVI29VEJ92vE70/znxTd+mtLGs/hGdvC8pEComChQxSplGqtW7ooNMxA56GMc+WukVT9iLpZRM5ao6XlO/tsCwzGSMa14Ldxqs7pzrgIzIl/d+igUyZvpYEg3Wnm5Nj2GM8WRmNZJdG89M5PqzAWaANmDMZMQ62yprneTSZo=
Received: from SA9PR03CA0011.namprd03.prod.outlook.com (2603:10b6:806:20::16)
 by DM5PR0201MB3574.namprd02.prod.outlook.com (2603:10b6:4:77::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Tue, 20 Jul
 2021 18:31:44 +0000
Received: from SN1NAM02FT0017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:20:cafe::b4) by SA9PR03CA0011.outlook.office365.com
 (2603:10b6:806:20::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 18:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0017.mail.protection.outlook.com (10.97.4.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 18:31:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 20 Jul 2021 11:31:43 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 20 Jul 2021 11:31:43 -0700
Received: from [172.19.2.32] (port=57332 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5uWt-000H05-Jr; Tue, 20 Jul 2021 11:31:43 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/2] Add more 64-bit utilities
Date: Tue, 20 Jul 2021 11:31:41 -0700
Message-ID: <1626805903-162860-1-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1005409-260d-4149-b951-08d94baca052
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3574:
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3574377FF4490F6533812A7DD0E29@DM5PR0201MB3574.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JFhwEBrlguT5xGZjpyx/vlQTOzrLHNl2X3Nxmo4Iu1kgLxNplFc1wc6gyWG3EsUn+4fil0Zhq11ty/0FG8npUAlBhYCvDsZm+Mh0ssqawbQe9Po29oHwN0u6PsvgNBr0A3I+tY2HJjNgXCJ8gRocHXfao3fuckmRF/8dZprNkSEbMSioZo/yiCvWyoJbqXuS/l7YVQueu700RIJ8ogDLvBUKGcVejsuCpqbU2DEXpxhyyEKmM3qRO4od8m18IGxjPu0D2mwmdKaDDuDQ4E++NKp4mTIIuXmu0f53DBRsAaIXBCfUuWmnK4Iy+7iBn6QY9kztbZbTx4UHuDx5in/YzwNWq8V/GOFXBr7AYyQIXPpcapHOR99DJlq3OCDQZfn8d7fLtYqmNG/yoV3X5c+2oKksoa62/p0djSXbug1tjIHxcUnc89IQAZX1k/9PpRJgJKxyc71b5eg4efTCvFskL6K19FOk9FNidZuXlCi05gXeSrysrkL4pSIh3uCMDhEeQWOzYjw7l1+xWOavEbb03HkjIBYKlhrP4f3w9X5Ti9UJMXTMD8gPhoi7V3mh+i4kclMOhIzESWKY6Zkkb58rSdqHWeNiZLKJiSQ7gVgn/9yyEaT9EwksEADN9h7pr0eHjiu+8YxG2Ko92qQumXK2LtvnW/cyjHmB/JhRF/NgdejXNHq/duKatC3bN5h+NEJCuiAjy6JDKSfeLIr1NklXkn7zJSRW3BwOhuO5AZ9Ein4=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(36840700001)(83380400001)(82740400003)(2906002)(356005)(7636003)(9786002)(86362001)(82310400003)(2616005)(316002)(36906005)(7696005)(44832011)(8676002)(5660300002)(36860700001)(54906003)(70586007)(6916009)(70206006)(26005)(47076005)(478600001)(36756003)(8936002)(426003)(4326008)(336012)(186003)(4744005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 18:31:44.5060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1005409-260d-4149-b951-08d94baca052
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3574
Received-SPF: pass client-ip=40.107.243.56; envelope-from=komlodi@xilinx.com;
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
Cc: alistair23@gmail.com, richard.henderson@linaro.org,
 philippe.mathieu.daude@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changelog:
v2 -> v3
 - 1/2: register block init should also be uint64_t
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


