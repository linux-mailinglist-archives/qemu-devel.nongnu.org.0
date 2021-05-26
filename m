Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E23921E1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:18:59 +0200 (CEST)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0va-0000lt-Ir
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lm0sj-0007Km-SD; Wed, 26 May 2021 17:16:01 -0400
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:2688 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lm0sd-0006kU-5S; Wed, 26 May 2021 17:16:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpqGlDwN7HTOtVgHoQiHI1/PvIRWcZ3knN40t+XiAHUeLU9BIaa7l0lBElo3SQ8OXaubnGE2vedlXf9CrMBjOlZ8YmJmkAx5vdWRG3arvHK4+4QXe4VOcPiRNsuFYszp746g3o84+ru6sek7edTHvYphHP+sfoeOZT4xTr+hDc5Z2acSTD9FXshpLZ9ppzbAiLp/UylsJLHD5Cqkd/gZXjuHmzn6KJLaPX+NtytlegBZrZVEwVaNCIeTAnGAQ9cdPYHSiQO0EvZfIGmhjoUFyhHwKPpyGS5FuX+PG87hGwYt1ddbLPsxUd3XYyJeVa/h9/usYGGGPPVIF6eGxWFqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUeh1cFnoHk+n1sR9HrH39XFTOjA7eThy3D5ubUoIXg=;
 b=c38WRLU6388ksWwb+9RWGFZwrhUx4TY/2RpLzZIUSJZy25KXDNiGqvtjKBSfTRLVQMqWSLlcn06kXw/0A4odM0v0De/lqr0y8XN1cDqxq3ils9vPNhhZUrdb+VVntLKB6PsGFNeteWvyMx9P7yR9k+SZQGVx2dp62lr0nl5cW//V4vv2gsSjD+B2KH57zdE9Eyl0nHMoa+M/cnpkejbVlRuIKfEoXllQMSMvEL3gcfOpZBZa9o3J7HmWV6ctDo9j0y7zFVAC3WPHmJ+3TAfDYsTUFYhs7Uaeu7/1sUSluJaEA1QR/CDXYcJweR73fTrfJPL+CKduUK70nDgeOwwHiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUeh1cFnoHk+n1sR9HrH39XFTOjA7eThy3D5ubUoIXg=;
 b=U4qKelblWHFOaPvig3ewBu4pt48iVqR8eBi+PCyj1H+3ZK46CNdOrpicsNYXnSteov3KpNbdbY2X7aA+sk3WAFd1IfWWkFRvl0if8012JLSz1Tn+augNS+ehZguUHuCwa8AUxiO52iLJErFE/DV+DwAxeDhJrcQ51bEf9O4plxg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5382.eurprd08.prod.outlook.com (2603:10a6:20b:108::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 21:15:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 21:15:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, codyprime@gmail.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 0/3] block: drop BlockDriverState::read_only
Date: Thu, 27 May 2021 00:15:31 +0300
Message-Id: <20210526211534.524597-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR0502CA0021.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR0502CA0021.eurprd05.prod.outlook.com (2603:10a6:3:e3::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 21:15:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08d714c1-5182-41a9-9313-08d9208b6f0a
X-MS-TrafficTypeDiagnostic: AM7PR08MB5382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53826B7EE3BBD433D1083311C1249@AM7PR08MB5382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:264;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2BzHaSs+PedSFS+T34TqsrmUsf6IYXZ5XTaLPj8FBJMgw8eOunRUeRoA2oN/KxINeu80Bh3muRJPwiDFjIGHAI11iBxivnQ554RlVZ3NNk1H/pn171g0IM1U9OUm1XsEmF+On1vXe6yPO0noWNLy45yMNZ/8DXAk4GTYhlY5S+yc+YOSfLru9PE4Cl9CTi3p3pHExx9zr09mvyZ5XGS3Jj2dYxHgRznuUajkCOZ62/702ZXGi5XN+vuULg7V/g0DGau/XdwiAFiNagP4MyCALu2DHPqr22qwxerMNnR7/aMs3f2X/TcGTsfdyQBCiZe3Y2fokYwltEkTyiwPQymh//cUFbwhIySMfc13zlfVWQBw/6laiYoQhYTauXT4ENu0DAJubXThN8xaHD7Jc0ZS+4gaCZ8Hl6mqvgDJqjKry7F8j4CSbkVQraAed5UZYffmUH7Buu731vMY0rCnszDLeY9LgtLGBJOrpmfzEQe1JySxnM1uCs0F7u+yzPBhlYOQN5T5xMw3JeZxTL52pSs+YOYE9EZ64cbXEPsNgkUiBEIjD7SyaveBwAy9IDr/4IhYvNSl1SqpRRfVff2t6mcYzXlV9rGrVqTdOZC75lCrmK+JA4J0HMbqBwlkIM4OoV85td4FvwwTmGpRs1r6PkUfD6MFc/6jjnTEel5Osdg+1/7hmI60+unU/u7TSPsgc5vf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(366004)(376002)(346002)(396003)(86362001)(2906002)(478600001)(38350700002)(4744005)(38100700002)(956004)(36756003)(316002)(6666004)(4326008)(5660300002)(66946007)(83380400001)(8936002)(8676002)(6916009)(6512007)(6486002)(26005)(2616005)(52116002)(1076003)(6506007)(66476007)(16526019)(66556008)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?r8gGoFZ161TtDXOAJ7k5zPNdx1LBa/JmZzsIMBJWMHHzlMbdCmFVs5MvHkpK?=
 =?us-ascii?Q?dqWU/G51Q2OQVe1otJFJRSLk3ugjIoIQWvZl9J5VAagj9Kz6yNitTScx/ks8?=
 =?us-ascii?Q?kxsJpBL2ffRaq+OP5uU0KsgjkgmK4ZUkunyBwptQJrhuB+ib1sPBkJ3BnS8Q?=
 =?us-ascii?Q?XWySs47a0K8qzOHrdEr9i9M35bz04AQJLWpiA2wtL22Wu8c09Mr7hOX6sS3C?=
 =?us-ascii?Q?rPQm0LZiH7bFJq+SRuN5gfQWNRmaE/vtKbVo7OCBXkpf/oDuw1WziP0QthjJ?=
 =?us-ascii?Q?6o8VAXHfSJAGSc6Gdh6rlSp/YCRNvCxljEWW9rXtJblMqkBwPfl7OTG+YF4Q?=
 =?us-ascii?Q?FV33/bYolN/mSovsUN11hV+r1ekEA2Te/oaomlO48DQz78qZGQU/Z3M9aHeL?=
 =?us-ascii?Q?UzzmYeRsaGgbRXXS8KGmEF4RJPmEpXXMYVbCKjFVaFCYnKUL8pd19kNg6w4I?=
 =?us-ascii?Q?lP/YkiYNePC2/9LGARkYzZlF3KSQI6r75dYizmnsAzdUMqyPvYmGvr2iBQdZ?=
 =?us-ascii?Q?f2mPPe5+s5TB6+LLSyEydBBUXpw8Rk+dSuYCXHeTGS/G4OCJv80nYyGxKFxH?=
 =?us-ascii?Q?vxFE5XoiZw00wGJ/afGeNn3GUJ8sfFjEf6mhkuvVI2dLRyJvJFs1A81gmKJ0?=
 =?us-ascii?Q?2/AH/xYs/vvsAM9MCVF2gyXkwgQb5id/gDFmj26qK0dt8ogpaiWMiQQVWmbb?=
 =?us-ascii?Q?Tpot2eqYEen+DFjQ1i16vO431FOza6QYUSZwx8ci7fhdcSjqB71xJLr3awdX?=
 =?us-ascii?Q?JMyZX584hLLFGVY+jDEFy3wIL9KJv+NqSe+nWQu7gSh3V/3x0iEvRjR7c2FZ?=
 =?us-ascii?Q?tg1QVhAva5o3TosrzjI14uxiVFOvnhnIGQnBhtFxdbrbwGgA9On/A1Exf2X0?=
 =?us-ascii?Q?kcy/lr0Y8WhujC8zs3dEl1MuXESR60zFh1SvhI+Bthfmbi/x1pLp1q+uStgh?=
 =?us-ascii?Q?czKl+LAysXQhjiIn/cwhT1IyE4xNHbaD8sO1vhQQoRWQoZBcpwCUMPZGVQQP?=
 =?us-ascii?Q?Sa9av6Y54dWatXrVL0MmLd+o8223dDyctnKlcWL2VFCyHe58T5/Ob7lpqcT6?=
 =?us-ascii?Q?0a6FTcaGE2k7twlkC9tK8LyzYdjDpR3o9AkwzJzbnqTUiFNpoVF5ub32rn0L?=
 =?us-ascii?Q?C2MNwU24fBu1MQpit/FQusLuUiME3QLuMTtbxhWKjJWNXo17w8C7wDoWCJYY?=
 =?us-ascii?Q?xgdmqL8RnBRlAnrk7x0q8RE3XpyIIU5q0JylLqL8QVrNdD4kIKVID1odP2VK?=
 =?us-ascii?Q?17CmloX0qdFUGQY6X53rKLedzpe6kLHvmO50EtR8RAzUpWSxJCXOxTw4YLBB?=
 =?us-ascii?Q?0g29OlFKCAlKRF3QiCR9wJuE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d714c1-5182-41a9-9313-08d9208b6f0a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 21:15:48.8209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJzsWsEcZYcnoVfhlQca42VO7XAnzwwixjPGFpExCr+SNNbMSIfFgATLuiQLxos8Ji1fad/mgZS7rzqDfV5Z6zMusA6CtPRwfr6qG8M95+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5382
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi all!

The field duplicates information in .open_flags. We have to carefully
sync these two fields everywhere. It's simple to introduce a bug by
forgetting it.

Let's drop the field, and fix users to call bdrv_is_read_only() and
bdrv_is_writable() instead.

Vladimir Sementsov-Ogievskiy (3):
  block: consistently use bdrv_is_read_only()
  block: drop BlockDriverState::read_only
  block: drop BlockBackendRootState::read_only

 include/block/block_int.h        |  2 --
 block.c                          | 16 +++++++---------
 block/block-backend.c            | 10 ++--------
 block/commit.c                   |  2 +-
 block/io.c                       |  4 ++--
 block/qapi.c                     |  2 +-
 block/qcow2-snapshot.c           |  2 +-
 block/qcow2.c                    |  4 ++--
 block/snapshot.c                 |  2 +-
 block/vhdx-log.c                 |  2 +-
 blockdev.c                       |  4 +++-
 tests/unit/test-block-iothread.c |  6 ------
 12 files changed, 21 insertions(+), 35 deletions(-)

-- 
2.29.2


