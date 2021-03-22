Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49E1343D38
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 10:51:31 +0100 (CET)
Received: from localhost ([::1]:59464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHDe-0006Cj-GA
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 05:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOHBm-0004pW-Ag; Mon, 22 Mar 2021 05:49:35 -0400
Received: from mail-eopbgr60113.outbound.protection.outlook.com
 ([40.107.6.113]:25015 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOHBe-0007bG-KC; Mon, 22 Mar 2021 05:49:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlrC1rC3SxJhXvDKELzKcX8AEKQi4pLLjlKc+/TBX6avAQ+zu5pKLiWghlXOBDVdPHT6/gmTGAJvFOE2p454JdQpdRUa7LkYx16uQbCAGfhcY1jLZTm30frtZT9W4pAcn8/CppCBvQMG8ec4wvyBkChE2ECQqQu8Szn5Z1CbBExFVA49MEs0BqQvtn1OT5qUStq0s6W34xIxAx1WNYbFoXvOIq0abLIFCTXD5QbzZhDZZfh5f06D0tZSYYPXqevYJNR8pnXITR5nXA4jux81oU5KxUpPlXKAa8S9wGx1Chxb3g5XmHNg9rao78y1fksZmg0ULBpiGmP3xFtD/Ljhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyZw87GiCIcJ12Qa0IoWZ7jMj2dvoOCROA44xPZ8rdc=;
 b=QRN5gZ1AKMvXOQ/U/Ot5j5PCs03riFFPQtUZRX08H5p8r2wFpEKxC/2s+tiXkgxwtwErNI6Iwh0R4moOpm5pFIaA4b3WapIETkMz4efVZ6pX9mqnLGL5lbe5i9yIbjHYtdyb89qhjPj2EuaJxBbRWdbACdpB+rM8+bjLUuoZiTB+xIOtOzS6Q3y2T2v8LK2xZPMv9e8kYsiaGN2LtKcxRUkZj/IJmFT/CE1cMujHlXGRGA3BDeVnS5+72wJYKXc7TtV07z/F0by8t55TGp1hXHapepXX5vRMySYoP9/6ZtpK8dGUF7L+NY2bGXoI2KrG6+HPltK+pWL+w58ajxT4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyZw87GiCIcJ12Qa0IoWZ7jMj2dvoOCROA44xPZ8rdc=;
 b=NCH3g50Kyr6l+RVaUjQvx3NFb1JY99QVctfWgvR8V9mfPnfyZa8JF/7YNHoCR7mDYPhuy7Y4F3N5XdwTn6tAQqozUpNPZEbt7rr2rmht7Ka/9uIFYLopbzhb5hnZKPWMgxPfe1rum1dglEX4qD5wCBvpm1YOna7dp8Z4f+pmKI0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB5614.eurprd08.prod.outlook.com (2603:10a6:800:1a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 09:49:22 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 09:49:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, fam@euphon.net,
 stefanha@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com
Subject: [PATCH for-6.0 0/2] Fix use-after-free,
 if remove bitmap during migration
Date: Mon, 22 Mar 2021 12:49:04 +0300
Message-Id: <20210322094906.5079-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::18) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 09:49:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a9c5f4b-8488-45c8-a923-08d8ed17c50c
X-MS-TrafficTypeDiagnostic: VE1PR08MB5614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5614B7E6567E49A204FC4651C1659@VE1PR08MB5614.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gm0x7SYe0J+ymjYorh4wYwDMvVrG9DO7D/lvqMp4udeklTv1PZAO5T4iStmbiLm2P22vLjfMFUxaWV7LO3b6wj2AvF5V4Slqv7WBi2jKqr0iVw7imyv9S+0/KOCOpFXEpNX9650e3We1kwn/uTil5jjWuwA9gYelB4Pa7lY77vmKlReL4xd+5nswfe9oWVpAxs3+10WVmvZeRhelzk6ko9fyWFD93K0/IWHWAPcGL3ef3AVz12YHkDwl1C3SHL3VBfb5wWQyckK/fs7uuIHrwTmPjxXh00G0UsNoPczSRcVFE5sDp2OcPLMoQSA9LcqzQbGMnIRxcQwsrUZLica9YVRkPcq6c1UsYgsVqVI+2TP10d00XGbSUB7+IKksz4vUHQZl49oMF0Zr2P9pEtZpcFgq7NYa3QTMJLTZTfJe0CILIVjufYeE81QSXhb6FEU5KquCloedU/8uF72prDskzUkMfNl0S9JB4w8z9tC5n56bCW2FXXurkVtK/4GxmGihEZ3E7u67y8C4gAFvG819XOE4uni7p7Ju75q4Cx8E4txHWRTam6hN5IduDDmcVuzoXopqilfDPp2/LbM17iWJFoPu+wEwO+EZiVQzZp0zM7/mxu79nM2afAmSxN5IA8pm3NUe6s8i6opbVtb/P1yU6IeN/vUpHHPwrNvsxa/6VEGSkDTOoexdyGthhX80ungo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39840400004)(4744005)(6916009)(5660300002)(36756003)(69590400012)(1076003)(83380400001)(2906002)(86362001)(478600001)(6506007)(316002)(6512007)(4326008)(38100700001)(66556008)(66476007)(2616005)(16526019)(956004)(6666004)(8676002)(8936002)(26005)(6486002)(186003)(7416002)(66946007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UH58iDK3Ccc6mw9brt26EhFgaT/gJNWHZSXqMB1L18t7amT4/nsB5p7c+3lM?=
 =?us-ascii?Q?mBKwYkF0tRHVtWfjgV2n2rEzB3m/s2uqPMdxx74ae9xVN24ifKOLYX1WUdcZ?=
 =?us-ascii?Q?q+9YjzJmtqynYfQsM2NqYh2bfT8GvKkqmlySadu8P35aAUXjbUxj4CVu4mHU?=
 =?us-ascii?Q?/4DwdoFHf/2edveRSQ9bPerXDZTMMWq43jyHInzJieHiCxOFMfCCmXgLg+Jl?=
 =?us-ascii?Q?EBXAfLtaVGjApWAZJVJvaig5sBwHxJYqWf5GGT7ABsE//1FbV5iXQh1rUVkO?=
 =?us-ascii?Q?vKzfnGjfZ5UrmVbo+hAQbyn8tP5/cJ8QhFgFDSRy2a7vtLA3h7hJqw4mzOvx?=
 =?us-ascii?Q?oIj9103mr9ghtgfqe7HJB72OJUNDAawCepp8n4ep/2wWE7OzPBfe5rJArxHq?=
 =?us-ascii?Q?baoKFo7XlbF+kEfWkoQB1Y+ca8vRbcGQG5Ohh5K5wXeC4PwJsL9KpGMW8iFY?=
 =?us-ascii?Q?7e82r0jGSKI5eVcHmczB2J8pHhCt6ah0+42uuvXPtcxMJFj8iF7FwULsBaiK?=
 =?us-ascii?Q?5KOqV/OgpzAS3q69hXouvp4CeL5AiqECCzgKqFFHIrIOm716bG5EqU9mglA0?=
 =?us-ascii?Q?TGqHT+1t3sIyNRIkZI2693pUR7Fr5wWkp+cjLIBCFmKDQa8EceQ2R5ZOq+oC?=
 =?us-ascii?Q?RgS5lBlKPhs8Hk4kgPxHaXxw+qolIL06uRdVfAlgMMmDL02N5bRhhbB4WYb/?=
 =?us-ascii?Q?vUJXIulnTxUu+gzsFetwtpj0frsTzQqBJF+eu099sVSOQqcRvRUYSfTk97Dn?=
 =?us-ascii?Q?9jZUU8jjvz/r/1xwJ7gl3ZIK6GAXQk612qCYM7vDzDq2y+B6OjSGfuCMUULE?=
 =?us-ascii?Q?pX7wyVF3Mu6bQEtOSQQ7KNiPe4qyXlbMw+kWEglFzd+G3XLU124jvhI/8YUP?=
 =?us-ascii?Q?GKMC5e0jg5uc2vMmf5SlKdegudk9X6dbd6du0SanJX2bBHGObxYLh+czGes3?=
 =?us-ascii?Q?ULt2GmQjuRRMlIC7iwZUZsKuu2jJCFgS9FsCWGi6YWm8Ns8fGP5hUL/ULYj8?=
 =?us-ascii?Q?b9zK1v6+pCsbYKEZ49A2pH3EY6uVtXrKPCuxv3gbVDkHxM/0sd04dVk0pkxS?=
 =?us-ascii?Q?K+tO+rgIExOBOSIzOl1K5Sv80Zr5wsWLzP2ckK2qw03BenT/Ezilb78W8AOl?=
 =?us-ascii?Q?Vxus8d2heDOdvcqt+VlgSzdZjGHUDBs4PLstyk6YtqwgGjyXpme4Rg/VK1/q?=
 =?us-ascii?Q?4yHhtevj5i6w++Rfn57oxAv/sbzhVEEjWZzfLpqHY4cbwj8toOKm40PRJHBs?=
 =?us-ascii?Q?WADjGOQrYufKnL5R3H9LkhczUV1izYiYdRSa1JbWoZq4UY3iSYXu6/R68BME?=
 =?us-ascii?Q?a/3I0mKjRTtK7GzK3RbdJs0Q?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9c5f4b-8488-45c8-a923-08d8ed17c50c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 09:49:22.2401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHdRDioFnDE0kuNNPXNU17ywz9Fb6J6Z91wiWFLRRtp9ZcVkc3XVs5zv+8f7NYDrbITrZYQr07NVDwElf6r8lSMe8ocTAIlAHykemF8uvc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5614
Received-SPF: pass client-ip=40.107.6.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Hi all! Accidentally we found on use-after-free. Normally user should
not remove bitmaps during migration.. But some wrong user actions may
simply lead to Qemu crash and that's not good.

Vladimir Sementsov-Ogievskiy (2):
  migration/block-dirty-bitmap: make incoming disabled bitmaps busy
  migrate-bitmaps-postcopy-test: check that we can't remove in-flight
    bitmaps

 migration/block-dirty-bitmap.c                         |  6 ++++++
 tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 10 ++++++++++
 2 files changed, 16 insertions(+)

-- 
2.29.2


