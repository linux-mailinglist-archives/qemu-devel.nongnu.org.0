Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED53ABD4A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 22:11:13 +0200 (CEST)
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltyM4-0006U8-F4
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 16:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ltyK6-00056T-Sd
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 16:09:11 -0400
Received: from mail-dm6nam12on2131.outbound.protection.outlook.com
 ([40.107.243.131]:35457 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ltyK4-0007Ck-5V
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 16:09:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGAc0fd+/6/ZXDszigC/Qgr0drEHgWWfuJkF0Sp/STutVDHUIycdB+QzocKSogSY+2Oz+ULKARB9/TCyfe4jVjCBOVpHX8M+5f0P963Zn39tb5HNdSt2+hYwmQMqfV+eoaqNGEI6doV6RXaRhlaCkEfJmSDC5aYizdMFuT5KtayUmQqMGTre9fa+z0ywsBXNgtHRE5rc6DD9mqNvZwo+twJ8zeHfNpaE6IlXy6ynZBnb6vvraX8Hcawxte9/VtP2hZ96Ir2aT+zTHHTXw2WwCM3bxEADwhejWSWEZUXHnqVC0mWJ4TFLhKdqWFT1So/YlZw60mzlf0lmJ+KAtH1T8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMuMFB5GASBXcMEo3VLfw4CdezkZMryqwKf74/3MN7w=;
 b=n+jCulI92fDpUXF3Gvn+MyByBv+Lo0qWxmYcAEQE7J1wyt4ADQLpBShk4a7UVxNXH8E9aMjN3rCjNHS3HJPKJeUjwhiowEp9cwjbpNsPUvgUCQGPwdCfwadgMzDC2v3mmxFuWbJwiNNde3B9ngLmAvMdyP7Vs2wNqqlh4imLwpUgwhcGH63RTCoyZ2H+VWHSgPTJ5XMfTMyTtn0IER4JcDZbSPpsLN1AQGpq+3FiU5buEm0lNRR1Y+Dlb1LISVdbgzBpwSxbAC8B1ROcu5bOf5f0GUt/CeN3gnBNVuGMRrTP6zNb6JNbOXUDFlrc+TMtueNZKsFATKEFClBEEaoLIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMuMFB5GASBXcMEo3VLfw4CdezkZMryqwKf74/3MN7w=;
 b=676nyyg+PZgQOJP/PQc9dIGrId0mfkE/N/9mn/gufZw6VFNdu/xcdX3VvV5qcF4kx0LtGCQMnhVWFKWSHqCWfSLpmjeLfEWA8ydxWuFlfNvl5dqjK0GuM6G4b61Xgxg5jJoN4TlXWau1oUk0vti++AULsb1Iz05ULE0+aHSRDsM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3677.namprd03.prod.outlook.com (2603:10b6:805:41::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 19:54:04 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 19:54:04 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Miscellaneous fuzzer changes
Date: Thu, 17 Jun 2021 15:53:49 -0400
Message-Id: <20210617195353.284082-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR18CA0030.namprd18.prod.outlook.com
 (2603:10b6:208:23c::35) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR18CA0030.namprd18.prod.outlook.com (2603:10b6:208:23c::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Thu, 17 Jun 2021 19:54:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e0a070e-efa6-4559-f8fe-08d931c9a89d
X-MS-TrafficTypeDiagnostic: SN6PR03MB3677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3677941878747F084612EFD8BA0E9@SN6PR03MB3677.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UceUKiKbgvHt/MxzUUnOD0L5a3nXEt9YMRLu8yqTV3lebDPG3ohyFmpI7bWXOdG2mtJplMhOyGnFE9NhYSbxeojapFwM3bW1muSqP3Gcq11GE5U57aDaY6sRgtEfS4fwX9UABcwRqYZ8PUz1G48j6nSedyTfw6yi3q9CzZz56s39ChSJWgtaYXdjppjxpC+Mmsy+hWIOUSh9aD/5ZY41KJRer2+IBUtnzvYH6lRhBrxcZ9naX12zq8VmqmQAdluUve0FzvDs0pbVJbsRoaJs/ebltTMd0bie6+ELrbhYN4omfoe1eGzOB9Wpjo4y+MKk5oL00ISC6KddByr8kCieQAxe/VJCEK1Z3Hem40fhiyJ+y5iQXAKsd/PHMCdeFeaScysYpHrMj0hS1lu2GFGXq0Gv9WdpgW6vgM7pewBuR/8GZWFZMM3NOKBAnfCJv8HuLtASZfjuuvHTXAHzObwJZhZgwPuzqLnOjyQyq4+vz7yqIxvQ/ZzWA63ppBnEJzWnWdFq4aHXh+e6UMjCvbzhCL5wimjRn5AdFMSr0pLj3IkFlLEj9EeG/ss0XtIJ2IaW7J98qLkurXAE4xil+HswftBfDTZgMa9FuICtykRcd9Mk1xOWEhbQQolIhGPgwtDq4xegy8PuhBb/n0idz49TfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(16526019)(4744005)(186003)(786003)(316002)(2906002)(6486002)(83380400001)(52116002)(36756003)(956004)(66946007)(75432002)(26005)(5660300002)(86362001)(6512007)(66476007)(66556008)(8936002)(6916009)(38350700002)(6666004)(8676002)(6506007)(4326008)(1076003)(2616005)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OhUP0BlgxOTEEekwJZEqqGydro1JVzFs6jqO0JqgqgqedYJfXmrAp1JYxr/H?=
 =?us-ascii?Q?R5+UsSi36WoWXWYT+qq3RW1VWA4gd57IMWzfSn5SQ3lqwP8WwDhM2prlE+xx?=
 =?us-ascii?Q?Gpw8WTYX2cwH6sQQVBlqvzNb7enlXMR92qceEtYQnMjVPgZWIrYHT2ILdZ73?=
 =?us-ascii?Q?YLFOfHdnFeHaVj0K8DgEOVxNCoKawphzRgRm/LSTqUNWh4cp3VW3AknPaVYR?=
 =?us-ascii?Q?OsTuCSa2Or3YQVhqVuCz03D852pYX4x2GRG6YUeiXPdgwh0vfMJbM4yjWgil?=
 =?us-ascii?Q?f0avU9cGNkvkp4HewM+eayEDvhPPErdiyRyhgNhRudFiGKl5mmIix3lVLKGu?=
 =?us-ascii?Q?PnLtbRNd0Er7humV1zaIqiKc30AoHyH4pVhD+ZDR9jefsscraVo65PxULXzE?=
 =?us-ascii?Q?CQRBACbotmL4EG1qyPMCqo0J6she5WLh9hbu7aC6U22BF/BlJm/ewlO/w4AL?=
 =?us-ascii?Q?h6trDn5lvldGTn8y037dj8HMlL8e9VEvDOG3GXFq83yJWoUyQzzyr70pJUEz?=
 =?us-ascii?Q?qTcPW9Uop0OpXT1DT4VwKIHTWQNaFonqQlJ/MNnvdN6wioxMffcFdMiQ+KWG?=
 =?us-ascii?Q?4pjNAaqkyC7tD+nyfIPEN3CEv49xpOX/iTYtzxg5yCChxZdvcUx+aN4FOI9l?=
 =?us-ascii?Q?PgZXhZsYznnM3ZzG1XXyDMZSStyViUJkvqYgNKBJsN+vIcGObijPw+CFY8Uf?=
 =?us-ascii?Q?LiqxHzRYbZjsp/x1chkNZL+3IsDS2iVHhaVUmQc3hCCkTUmC2QYRjRJyO2ll?=
 =?us-ascii?Q?J8b5JLFh8c7omEmhegdXN7TUKYgMb8ClnA9eksJ82kDD6RVodPJU3W7ovFLh?=
 =?us-ascii?Q?dJSFO38AaRWxfe7ycNUXdQF8Y10wJ8/s1tkLPuqevujUiIqnkEMK0ONR8xmE?=
 =?us-ascii?Q?OsnhIpEljNjosq977fwPky5SnO2zJJp98+6ef95GVWJe+/UPCoEqeTQ74ohu?=
 =?us-ascii?Q?AU4lQ44w0OFrX4F1HXVQipMMAoffM1TiLRut9lJmWfghsN+FlOZifFcVXC8e?=
 =?us-ascii?Q?TuUQOoIUdG9mYtp5V/BcuJq1A5xbowMk7eH7gTdT3uj5N2Rx2OCwFm96k7C8?=
 =?us-ascii?Q?ergWa3kf8ED/m75OyalHH7rcbDZOGkuG2IGqMAOaoFhQQZVLaYjfypmg384b?=
 =?us-ascii?Q?ltYbAzvCH70leoaNFFmSWLyn/LgLpFmF7dPwdT+1SxqUhJRQ/PIsITkbJ8qb?=
 =?us-ascii?Q?McaiEmyELIYSX9+PlPb4rGPLexynPmadwog7asTBsDBZVIvkva1lFz3E7LeX?=
 =?us-ascii?Q?DD1sVDIilPsRxQ2/+/0i5M7UV2OAsCD0x3UC5CKFz5uru8r8E6yTfq1wN7oc?=
 =?us-ascii?Q?X7+ZLKL8RSpWdCuiKxdVdPSj?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0a070e-efa6-4559-f8fe-08d931c9a89d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 19:54:03.9437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mW1W2Fss9Nxdmv1/0AS3k9F6kFa4gaKhZ7s0uaeZqy02YsWN4CGXM8qIxC4yd/f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3677
Received-SPF: pass client-ip=40.107.243.131; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,
These patches
1.) Change generic-fuzzer timeouts so they are reconfigured prior to
each individual IO command, to allow for longer-running inputs
2.) Add an instrumentation filter to prevent libfuzzer from tracking
noisy/irrelevant parts of the code.
3.) Fix the AC97 and ES1370 fuzzer configs

-Alex

Alexander Bulekov (4):
  fuzz: adjust timeout to allow for longer inputs
  fuzz: add an instrumentation filter
  fuzz: fix the AC97 generic-fuzzer config.
  fuzz: fix the ES1370 generic-fuzzer config.

 configure                               |  4 ++++
 tests/qtest/fuzz/generic_fuzz.c         | 13 +++++++++----
 tests/qtest/fuzz/generic_fuzz_configs.h |  4 ++--
 3 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.28.0


