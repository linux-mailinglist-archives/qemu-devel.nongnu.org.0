Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645CD3BA4FD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:19:44 +0200 (CEST)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQZb-0004uC-FV
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzQX1-0001FH-8P; Fri, 02 Jul 2021 17:17:03 -0400
Received: from mail-eopbgr60106.outbound.protection.outlook.com
 ([40.107.6.106]:49763 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzQWy-0003iz-V3; Fri, 02 Jul 2021 17:17:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mo3+veGO4YPwyJ3h2CBnDqls0SytjQqYEFy7SqpndEky6QT0piXpX3aTjUYk7A07Y/HCy/R3ysx+7Vqfpn+qmQiiO4AiDnTutK8gAqldvmyUHez5CtA+a/VhUEM4yze86O/gBSn0xV/WDDa2KoCInFA+T5+XIEJo0bTJAMY7dmFjfDB6uQt4M1LSMflpHFKVRzYTUsHfzOxiB1bR3DS7Lr4p1qkvjNapLaLf7BwSU/82tapVZ0iqtFarGx7CjnTHgr10BkFyyjhG8TU83MG1IGio6q0maxYJxMW3fWgVSEH9GCITkKW77kP3uOyo6OuWXQb/WS/xRoK3dBviT2k7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h5eTphYW2QrWHpfh7y2NeHN9wsn/Y6vuk8UyXkQP1k=;
 b=HICQebQtldLAhrnjppdpU9+PJ+F9Jt5DuxDGrlKidPtBy4wmamjyH6aL4FuYncHGE+9hyRrZLZ/nexmRJahbGeHgG7kPiNHAl5eSbHOa2GAHFF44sle20/u4MQ7eoJW0TZiaxksP0Az7B3RQ5e3IyMva91ZzOn4pyktf/Y9/3l1UOds5JQQanSl+sqzKIwqmSq3MPz49I99xXQIYAR9AohPR1JZWSxXhCMOodzronzw/kTl9ZqImhQZAGRxW2K+Iap6KhQe3Y8mw8f0XhwYJc8zM3diIBVGTb7qo2Hn2kC4UoKRvnAhZ/rM4ZXCHHUbQJzVLk0oscyPmjAWNl4EJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h5eTphYW2QrWHpfh7y2NeHN9wsn/Y6vuk8UyXkQP1k=;
 b=Z6qMhjylGyfP+ubVPGoTuG7BD1K2oiznBy6oqyQEmxFUuLRuKTVXnRiDvN+DDmAqTvBGOCywYlIrZk510JO4zE4Z4HaQZkThGHgc9y9nIfj2piOelzoEZNFRX4s08MHEW3VbTZs8aZyPw43ps7l2+IYPjR0+HBGVntfGIaiIvpI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 21:16:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 21:16:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, dem@openvz.org
Subject: [PATCH 1/3] block/mirror: set .co for active-write MirrorOp objects
Date: Sat,  3 Jul 2021 00:16:34 +0300
Message-Id: <20210702211636.228981-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210702211636.228981-1-vsementsov@virtuozzo.com>
References: <20210702211636.228981-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR02CA0112.eurprd02.prod.outlook.com
 (2603:10a6:7:29::41) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:7:29::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 21:16:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1263cdf6-5361-4529-20cb-08d93d9eb668
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691C4AE7E91C039E6134FCAC11F9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:283;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SxWzlAaGvRwWzzZblB4qKRFdBlGMBoiRHxcS6x5xJ4HCMNXklemVRZVcTZhCyF8LPxsKt84vWfTnqPxL8Tt/6WsK9IYvguGPFb9JfGZdxN9jtjUSkNeSWJLptZjjTTygx/XpHHlvSVA6o8FLD/Fmw5/n0YxUZ4hxtj5n7Gxjm2yQ7ag+GGVkxo1jyD7v71u2q/uJeWCYY0jjk4J9wRC7sHfQMoulscYAnbmBNLHrO7lQPkyHRqlGG4GzRKk/CfnlOa3eGLe6Wiky37FLjVIAqSQZ3iJWULhEMuK0Id9wpTIDih1JCpNO0JYtiPFw36F7z9xRWI/C+XKXtqcalSFW7vOMEJILjmp22F4aRQN6mMFghJbnKpP1BN1rxV3mPCy92stA5UgRlcI/3V5NMpzyGqyn0InxCd/h8BbszwSTz2LmTLIKZ3PnZx+nUVBb9lI7qCRaPEbC+QCTmyoxWRUd6w4w2YiE0Apaidsu9Hr8kkuDwfYox9qn5x6F3dyHI8x3YS2gdst9P8bvOQNZDTU5TgNTql2ekm4qO/3XOImAwmW6bDd+GBcbmh9rTB5ZP4fihPCrK/zTo13YPV6JxlE8ZCZSKb5Cki2RAIz/9pr3PtKQAcFRSA/4/Rvi3Uf7Ee9iOdLVV/eR2hx5KZE4cQ4PpIL18MWoNxvQniCN8D4Qbxy9qO7yGW2sK2SDdSrDFX4k0xJFPEGS4tQYC21nL2SuyYHogINODOBSUtJ5/IAtHGouss/+67g0p5zAGFymF/HRz15W19czg/tmX3ac+Ealvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39830400003)(376002)(346002)(1076003)(86362001)(316002)(2906002)(52116002)(4326008)(38350700002)(8676002)(66476007)(66556008)(5660300002)(38100700002)(66946007)(16526019)(956004)(6916009)(83380400001)(6666004)(107886003)(36756003)(6486002)(186003)(478600001)(26005)(4744005)(6512007)(6506007)(2616005)(8936002)(69590400013)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zH7HLvLkgcrsezhv1U12YBRPshcRoJ9OXhQOvJ042R7rMLFXpwvWHj7tfeAj?=
 =?us-ascii?Q?GDoqzHqEgxKuepzgX3U6MlfGWl76288de3QCJlQHcAvf3SyCyrW1wL3y5q27?=
 =?us-ascii?Q?hO4pB67bdbJ4Lxl94D7FEtD2zJTadEWnwquiIk/enHEe/I/J40WmmjHOfZ5q?=
 =?us-ascii?Q?GDo6p1Qv1NBa/AWqYoo5LVPTTH7m4Q7Q5AN3CA5SfA40OvHSVLXvpgeWEQJd?=
 =?us-ascii?Q?eFQD8zmfuUoDO848pc/EK7dzDbn7rOybu1cFW5flIImgtnsy4RtY0o07Ld8U?=
 =?us-ascii?Q?CUTKhDtmQFURySXecD6I4yz5AmNdaqG/+PGgdE4RXnRMsQ2EN8lrnrqVqHLz?=
 =?us-ascii?Q?UGj4uuJ0DrEW+APUzJ+aElNPnvU8vVHPAOOjIJYaF/gSVB7QjGWXCg4mSwNH?=
 =?us-ascii?Q?Vcam+KE7UlNDwNgJVgz36EBzduCU9xVi4fSQtAZY9eNUiTFUOk32qq03b2qu?=
 =?us-ascii?Q?BGQa7dCr/0Sz3G3fnMN0xUdEIsXSetd7+z7A38uKKTGG63OLba/1NqtU9jwF?=
 =?us-ascii?Q?6a1P3Do2BMqTSuGHqusUQTra8J0Tjtp0yYxZJPjJv1rJFr/95l8PiE7pkBsx?=
 =?us-ascii?Q?EhS7/SlAS0yhUtor9hIaVl4wO3BPKPUBbP/QafjHJODnjM+FsyD68bic8PPV?=
 =?us-ascii?Q?VmPlcz9pSJ/U9vTI/akAWAILFp7x5lxwk5HZitOoStvHvYi3DMdw2OyqYoMy?=
 =?us-ascii?Q?nYgxhZZhHm59k9657vdmgZmuorw68zyu75Zk49rZtp9OKe/03OZZCFtciT6R?=
 =?us-ascii?Q?w2hyqnaHj6Xn/s3Fci45t7TlYcFmDnfBRzqrE+osIupdPMbkSu4BTXKYjyxr?=
 =?us-ascii?Q?+mKebPBH/gA3Jd1y9G016n9ZdoY0+9rcYthlW5cTuUVwXBkWkonQrO5Sw9dH?=
 =?us-ascii?Q?n68u2I754NUZsG/PJTxmIsC1BEY126dm0DEYMUngfIfgeuPxFAuRewXyNJte?=
 =?us-ascii?Q?S/m6gMbDNA+Dz+Hf9TgJ+1CzJU13RaiR2NsHAJUZVGDSbvGgsG/9vXRVHi+Q?=
 =?us-ascii?Q?0mlFUmfMtiLaaI4/dYxRiB8ilW0ljvsAvXC7FJ4l53gxnnQBTbv48ANjm+KV?=
 =?us-ascii?Q?9icH7w04uwZwZZDW+A0qY/jTn4jaRlly2IjNfpixL/wiZUG6COxhEV5DXdu9?=
 =?us-ascii?Q?k/ekXuh6Aai3LMPzTM0Pwc3CTU+59kbRUT171JrzuDQkSimi2/9XT6oQKLBq?=
 =?us-ascii?Q?6ouo88KCmogKqZdhcqCE7G9Kg39tCs1qk29yisMT45t+TsVjtoRFflq1pTus?=
 =?us-ascii?Q?wjisLLFFps8hVeemMk261jx2mpH4ECthINLWmCLBovdLIYPliH37jaiKu9OG?=
 =?us-ascii?Q?VNRzuLIVm7wx7paD3/MAkSUX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1263cdf6-5361-4529-20cb-08d93d9eb668
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 21:16:53.0302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 237OqFyXmF/L1D0kQNXglnKH6SsMBDHVoL0zPHfXVL4FZVSbtck8uL6XVc/j5NmRpmGIABiQoJMhkawqQnmmsKRPGO4Dus7ABeZuWhE6dtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.6.106;
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

This field is unused, but it very helpful for debugging.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/mirror.c b/block/mirror.c
index 019f6deaa5..ad6aac2f95 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1343,6 +1343,7 @@ static MirrorOp *coroutine_fn active_write_prepare(MirrorBlockJob *s,
         .bytes              = bytes,
         .is_active_write    = true,
         .is_in_flight       = true,
+        .co                 = qemu_coroutine_self(),
     };
     qemu_co_queue_init(&op->waiting_requests);
     QTAILQ_INSERT_TAIL(&s->ops_in_flight, op, next);
-- 
2.29.2


