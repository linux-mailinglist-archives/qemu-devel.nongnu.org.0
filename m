Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4612C85CF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:46:07 +0100 (CET)
Received: from localhost ([::1]:33792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjVG-0002mw-0e
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQB-0006tV-DZ; Mon, 30 Nov 2020 08:40:52 -0500
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:61792 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQ5-0000P5-Ue; Mon, 30 Nov 2020 08:40:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBswwF3NbvS3IJNDnIQxVn3WKYYrYIrmbB4xQ5WCJQcHl6RiDkJBFtUyZMANkB4hZFl4m6hq6iN+DkDy4kRf/9/M4e51kvCjR/Ofu+gzzpDeyhdvvfjI4noKJasNfT2Gjvmb81UBAz+G4GAjZPzrDAnkhwYLa2MUFfI7eJoFqccHB6Eo1KtNHB1WiYpT6iUplwQSRMXI1tVTqzDHVTTPIyqmyab8fE178KkBbJfXFAa8k9YPFUXv36rbxhghzn3KOha4I+Z3ixN7e0Quh2Pnv4sP8+xblPyFd6jdCag0m5SnbxubzeFkFl+od9iaRgQ8XSq1BEPKvZ0lJQD5gWmPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/uQbKrr7mIYNRzfuDC7iouDeTcmDOYhLYZRF52a7PE=;
 b=b8LkgeP2AhRW1528CTUSDjhIiq3OLfTfu9UyJO4dwjUnt5b7v9YGONiU4qokdREI1qf+5071HLJZR+TsRkXNBijDmRxidvvZy8fe3dNAI5dF7nf24BqeG1NvuojNGxN8ALSD90DexCrlfkvtrcetPbNOd/4yEj6tVx3glXrVP8EM+pAAmOUHfWL1Q6qbV6RKsMT2PNbaalACAZuCzo2FMW7lF64MB4fEiibf9eVVHje24ovRYjum28BDULsQ46BpdzWUhLuBV7/ED1Aj6f+JcaFKJ1xJNneGoxtAiT9doPk49qyZa7clFNV/8rWqdYtI/uof0jv/qR3I6rfz7uePYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/uQbKrr7mIYNRzfuDC7iouDeTcmDOYhLYZRF52a7PE=;
 b=B6ViRK1XpFTrpqtMKhRSqHmSPcuqL6UwfD64ogBmL5OBFAz1Luc/gUIEI4ThdM8Z64FllrcWrSGkyXVQ6ZXP+Prft8kc09Z9bX3pSnF5THCpLUJIqHGFzle5jLMhBk9rWmLF+LLzPW6+ed9bZYitBCWGK1YjiU2BjjXKITnju30=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3448.eurprd08.prod.outlook.com (2603:10a6:20b:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 13:40:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:40:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 for-6.0 0/8] nbd reconnect on open
Date: Mon, 30 Nov 2020 16:40:16 +0300
Message-Id: <20201130134024.19212-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:208:122::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:208:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend
 Transport; Mon, 30 Nov 2020 13:40:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07fcd62b-7b47-4d9b-a92b-08d8953585c7
X-MS-TrafficTypeDiagnostic: AM6PR08MB3448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB34487BEF81ACA5E8F4212805C1F50@AM6PR08MB3448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pJlFy26DBIx+ZkRK9T5aAGAgOic7KPWMCfMs2lV+cGRlZ6HJzSQ9douPQo2je+/r4KTEpC5Rd9ZHJD8LIwYC/DYQXqoAswY9PumWMs+7WKcQ8qNEdoVjXY+7+NZ9omhxLvi6iPwvKWyew6Wv3RzKRszTIBEFQHw7O0GW2l07xeN0TmCZhMBymYDQnYziSYd1QKWIoYvUJWIwxCOkSIrtVAznrmfqQcmS4I4Xf/ZqKIvHQ4sF2nOdUajp169vz5EGnI+c/nnlAkxoM7pPm2w+fyQt7zX7lzWen9rAW9+lwpKZNr/3cvLPKHCoHLiGXg9koMy2yug6EjwSsUbm28jfzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(2906002)(478600001)(52116002)(6666004)(1076003)(4326008)(6512007)(8676002)(8936002)(86362001)(107886003)(2616005)(6916009)(316002)(956004)(6486002)(5660300002)(6506007)(186003)(66946007)(66476007)(66556008)(16526019)(26005)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YzQoDQzySgr9lySO8pFs2Qtj/W1oexPxp4RZl/SaqOCAWYA10UGAgerJfMQi?=
 =?us-ascii?Q?tTqYyEBmg2pVwYOTDEelf3VGAiHIfX4fwCz/qtBtaxQEyFohcwDWxLiSfqaj?=
 =?us-ascii?Q?ZlUfZbDFp6OhCea0JhoAuHNkttrbRTqllrIQIcscsfzb9xj9ndUZVNCiI/iX?=
 =?us-ascii?Q?egzd2hlexYErDzPrPI0Cxrx5mIBWfedwmqFh1JaJuNw5m9WDxruOVkE4aUSo?=
 =?us-ascii?Q?Nez1YgxEWmnRM1F/uvG6ylXHaf95bjmKEfBGn1yjzT5xMm1d4Jhz99B3W+xr?=
 =?us-ascii?Q?kUAS+9nyd5ZJQ5p0h/dECkQASX9RfM0fUfltr03xURQAyyX9umPw7vzvKe6L?=
 =?us-ascii?Q?REcFXdOcsyeHznQgpnc0WXsIt+e9qhzCIVfnapgvydrX23Vy/L+FhEiU/lyZ?=
 =?us-ascii?Q?X6wf3twwt8yXcI5q3sEv3TQPDRsVQyK9ccxvbH0Nwv0KrcGeaMkmiOsHtmc3?=
 =?us-ascii?Q?tDL5Djj07mJ8guAXhNHh/YXTFFc83nNm02S2B8RKeXWQ2TYn1T74mI8W4R+A?=
 =?us-ascii?Q?CSNI0L6kWTKBeI+QVMRkKagGwTZ1h84q4eVXmGuVbeyz7ljJ64s8Cy/pWK+q?=
 =?us-ascii?Q?0K2x/l+NEU4PGmPXAEnfBM0v44dGuAIcQ0d7/BgEFddhdd+wdC00hAM5sBYW?=
 =?us-ascii?Q?Gw7tHa7ggGB9eDdl/LIlqefKUZ8tEIVuJiuT+mip70OJpR8NiRuwULH2gn9L?=
 =?us-ascii?Q?9Q6aOOTrUdWAzMJ1kdsqxW1BrhC+aFE9Q9w36Ol+uMz+1Zhr05CmQpRSc40a?=
 =?us-ascii?Q?4QG3phbHsMIlprAXavBKoUSBHoGaDZ0JMg3x6Eeca+csXF/aYZP+lABNAifX?=
 =?us-ascii?Q?5oKZJgugIK7l4aFOIw+K01jJuPEKnbISlI25PSgXzv3oCSm8MGzzWS1pu+Sm?=
 =?us-ascii?Q?KpjP6mFmEx2s0Fh6JCXIgzjlkjXhfUubQ8tXmXg3i3/FU1V+yep7hVqxVgml?=
 =?us-ascii?Q?Jen6Hwa5oaYYDZAJlmWx+aMjSgGZj+DW9Hg9lelS2QaKG/CDqIoVMersJ3Gw?=
 =?us-ascii?Q?rTG4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fcd62b-7b47-4d9b-a92b-08d8953585c7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 13:40:38.5345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWLOL++vWo84bYbDQ9q1blZDs9jLGFXsXzdMLai/ttTAMEQnlhPIUH7YmVPPilM5ZRb4kUY/SFQ4i2cLxU4OIT1yWOGuZsAzTAPuReT6K5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3448
Received-SPF: pass client-ip=40.107.21.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all! There is a new feature: reconnect on open. It is useful when
start of vm and start of nbd server are not simple to sync.

v2: rebase on master.
Also, I've discovered that I've sent downstream version of test which
doesn't work here. So, the test is rewritten (with appropriate
improvements of iotests.py)

Vladimir Sementsov-Ogievskiy (8):
  block/nbd: move initial connect to coroutine
  nbd: allow reconnect on open, with corresponding new options
  iotests.py: fix qemu_tool_pipe_and_status()
  iotests.py: qemu_io(): reuse qemu_tool_pipe_and_status()
  iotests.py: add qemu_tool_popen()
  iotests.py: add and use qemu_io_wrap_args()
  iotests.py: add qemu_io_popen()
  iotests: add 306 to test reconnect on nbd open

 block/nbd.c                   | 173 +++++++++++++++++++++++++---------
 tests/qemu-iotests/306        |  71 ++++++++++++++
 tests/qemu-iotests/306.out    |  11 +++
 tests/qemu-iotests/group      |   1 +
 tests/qemu-iotests/iotests.py |  56 +++++++----
 5 files changed, 246 insertions(+), 66 deletions(-)
 create mode 100755 tests/qemu-iotests/306
 create mode 100644 tests/qemu-iotests/306.out

-- 
2.21.3


