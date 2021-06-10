Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C80F3A2918
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:13:21 +0200 (CEST)
Received: from localhost ([::1]:48286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHge-00068D-9C
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcT-0005Bk-JD; Thu, 10 Jun 2021 06:09:01 -0400
Received: from mail-eopbgr50133.outbound.protection.outlook.com
 ([40.107.5.133]:23957 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcR-00051Z-Ur; Thu, 10 Jun 2021 06:09:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8j2MMsWhm+Rb2F01PP9fLueVZ7NQBoP5kiU4NRbFo2VN3+CDKb8ZeHX23P/oiyIufe8UA0CaFHFfOq0EB999eZJ2FCdaA5zkZJtWEJiqNUyNxPSch+vUFg8rfYNC4P9aookDsrlKOp80EI0TPbhcQItZmPxuyefW5uIuEwWaQIGNmJGNQfYInvCLybSBSsdKzE8QMO56Yw2cI+bP2dBJUZaOzH/L3XzFMvAVAqOxwUMGD9MnCLkQq318uIik//QPX6pSfDH2wm3B6shzNdPs2vYNug+ZsrGqtRLcTFU9Exj445r/jX11JSiP9kLf1m0jCPkKcPuMe8uTgwRaRT44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmnzYabBpR15Vyy9Ktfx9Q1U5XsfXnSdcjApquFc0vk=;
 b=e8njMxJGNZPn9MKlydj0yDjczmmgrlmW7rlyiiZd54wDyhoT/eWI8Imyd9RYcOONKNBSdjLANYo8AhvXcGZqGJ6n3w+gEMqaRusMjeoAdGKT+NHchYDudzzAvHdxcElru3xabp7uy94dAKiEtwLowy4FGSuPqA7wE5q1lgLHhcGofpM0LfxfC8C7OySUhA3ICS93tQ+knCQk6LvoTt+aWY2/+ZD6Y2AjbSb+bqrmzs9kzh9YcqC1b1AbdqEVcmZbQmislHyOTsfKG/F9GmFUpK3KFuD5IbHtRLj0mj24bBttYj6B1eSBwUBt07tt/lu7+E0XRuWLyREUGtfrDSz35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmnzYabBpR15Vyy9Ktfx9Q1U5XsfXnSdcjApquFc0vk=;
 b=UM6sLElWB5VlO6QJbvUMPiRxC/CbwLOJrrWiHFjb3n11m/ySvKfTNM5jJM2s39SuLTyeVe18seJzg6r1uypALCmrlRc1pu69D5SOEEJEj4YnrglL3SVnbV0bpwu8giQxNGo09SlybwqmXDBzGqPn42EiTXJHKdn2Ltxik3FovGQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 10:08:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PATCH v4 08/32] block/nbd: nbd_client_handshake(): fix leak of s->ioc
Date: Thu, 10 Jun 2021 13:07:38 +0300
Message-Id: <20210610100802.5888-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5252a724-6655-4ecf-c474-08d92bf7c0eb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6502D0754EA94917F0B33A44C1359@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:52;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tABKGa7yYVn1opmriGgvorunpJacPvQYImkt/oumOzcay218GCWlsnfu1zcev4JTtpNtwKhEw7D478ACZPz4KSS0Go+7A10eOPss38pgEd47eT+KWX7QAzAbnZhCYgOHI6khrbDPJTDRhQwsHYRCurdN5i1Pr7/jNxfHQw+c+n8QUCFchb6+f/zKK4CqRnreKpJUdHTNcEJPzUe0t307i1oIJoyPCu4kn1mzlOdabmajr8RzstLxw1XDFDq3rAVOVmFVzT3pV+iV2fKRKbSDhYoVqDjeOqhdR3/S15oey5QPx8O9nZYNvm9dHk5Isz1RBatnu8WZ4bcNgEmSrL9KMuSjjbmOcLi37zTQ4ZwB40hTK3ztDdGoTGsB5/QSPmGjTuZMHscCBY+k1AwdoWbypPRfpGadRAA/UMhm+QebQltvMdQW41HYmsrFYJFTkF6rNsT8SkFMVGCfXXVgwji+aYtLW26evQzunyf+D63/7UQPD+aC2aOZ/rMyysGQOn33IURUjBXJkfRZ5Ugf35olQha7XlIfwKECn0XJrUdpHdDM0bSp4dbJQINv1KLd/iHq+jTy8FnznJ6sjfNzTHsT1sjRacj2KZ71Eqlx4qTtKHwE9W5Ds0a+MHaZ6d5zQBrWeKg/TeSiGRChh9GLT0PzmYj1LV8XmoQvPgPnryPLSAOQX5ZRQjKWc4ZxGmZabLwN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(2616005)(956004)(6512007)(66556008)(4744005)(2906002)(86362001)(52116002)(36756003)(6486002)(6916009)(478600001)(16526019)(66476007)(4326008)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(66946007)(38100700002)(38350700002)(6666004)(316002)(5660300002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lapOP59PVDpK6XCNlT62zwgm0W7Q6RWle8lnpLAPpmltWpSsPda3rzScTXIo?=
 =?us-ascii?Q?pNGQ934jbw6oYIeUc4rMOUzITNiBy36s6KMRDwWrD8+105aGWKhQJ9SmTvnu?=
 =?us-ascii?Q?SbtZRr1o1wFI0UzMTPaiXAfGYfPF++OXGcunMs8meEnKaaNa9R+Nwfa6xYLT?=
 =?us-ascii?Q?LUSBYRL8u4UWGrtLFJUTPgFisxy41hhhcBu8uefz0HAfBf2fw0CG3q4yHHij?=
 =?us-ascii?Q?e7M2dV+PUaueB+66AG33erqAfpIlq02rrzmBWLrgz+ZJ2qS/hVne47dK+UlG?=
 =?us-ascii?Q?2FqiR/dnrDEIigqieJNN3aqo73UcI5XYwX+BzcMlUtLz1zbUqtVslkvRoDJL?=
 =?us-ascii?Q?RZ4FvMjswZ3N/cxNfrNCcTrjEazJK5FvPdCMfSOdVXvkZ0cdLO/9ZuZkuNXQ?=
 =?us-ascii?Q?biw9OrQAEk1KTnTRDxb0MJW8wZlePBztk0wSjh2kXH0eJkUmIITWJ9Z0hNJH?=
 =?us-ascii?Q?ppOc1nJpUW1TdYCgfA09E7AFXqbsNTkrEJ7MwGBSR5bBclw0YyPcundnSZJC?=
 =?us-ascii?Q?LqrRj+07e2uOU68PZY9Kk6mbszMLliGkcjLbc0Sr4iop/FT26wrAEEQKqVWq?=
 =?us-ascii?Q?alAt0JAMS1tt2dbA62jhFZw2gQbW5+dhvgsd/CCCSVHunR6Jrf9uUMGRnGgN?=
 =?us-ascii?Q?m92YtlGtOJKKqA33F0SbHkAPbiKT51kCn9kz72CriJsUleHjAApUzsFy0wSq?=
 =?us-ascii?Q?r+gRDihJX+NooBzOggFMNY0IoDxGXoj7rT8uCKqbVQuJ1rjGkr97UWL4k/I0?=
 =?us-ascii?Q?CrbWqMLtfuVkm4RFpWmtuWrrNmUvzkkXwYG8yofk4y8HN0zeBtOV1jCRBZLw?=
 =?us-ascii?Q?LhaoaTl5gF3DpJa4tldZR4gwior59Nd8hju8hT/Ix9IUxakkcanKfl6SrSc+?=
 =?us-ascii?Q?R+vf61xTNLGaSYX53Izd6pG8bZfO8Ui9XKa+pTBvjECL81CaJfbndqIr6tWX?=
 =?us-ascii?Q?HFtjuX/p40wkMhsQM9rw2NmLH4xyRF2iFNcyGS7CPRPmfAOOlaMxPWd/Jyxq?=
 =?us-ascii?Q?sPNg59EkQsfvGqXbRmXo9CcNJD5Q9UKyQFKnYbZ/ZCtMac4C2o/QS1xIj4wD?=
 =?us-ascii?Q?gj8xYs+xg4qQTR37OuoF5yAn/NJdbUvUnZnvhkkjnZWI8dIVmjSfoaoo4y+j?=
 =?us-ascii?Q?LZNTY+gpr18NRlScy45qmr9YPqWliI1afd5p41TCmJ3mEKcTqZi7K2AEhe9l?=
 =?us-ascii?Q?M/56ZTUqDPQN/HRKmZrDcZZM5LIMFiuwrZzzWloSOMqG3zxDSBOp+YT90/6i?=
 =?us-ascii?Q?F0i3LDTHYoLtEJy29o0BC+xJoeKI+kcDd2uTH54AWj6aoWfe7wY2b3Ijk23z?=
 =?us-ascii?Q?MvWEEhosb8KKLo3mUBxxym8+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5252a724-6655-4ecf-c474-08d92bf7c0eb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:54.5001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G50BleEmWL1kPYqqSeuzPvzaVzEFSaM4x9o0F7u7YR0NSVE/MfLCDoPz+Yqce4/iP9knN9kuBeAkIsNFLG1yBFvXe3toT4UTmIKY3UiSx5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.5.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 08ae47d83c..77b85ca471 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1889,6 +1889,8 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
                                  nbd_yank, bs);
         object_unref(OBJECT(s->sioc));
         s->sioc = NULL;
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
 
         return ret;
     }
-- 
2.29.2


