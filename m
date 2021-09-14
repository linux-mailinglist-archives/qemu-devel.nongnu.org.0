Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1274640ABD9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:39:47 +0200 (CEST)
Received: from localhost ([::1]:54314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5qs-0003Dl-5i
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e8-0005Jr-JN; Tue, 14 Sep 2021 06:26:36 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:28801 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e5-0003UG-JZ; Tue, 14 Sep 2021 06:26:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipXnx2weASaI0U4bYXcWkeu6nqIP6kU+KMXtxe9+UWyAiYjl4ucK+u255tHlQ+l840ZYFtnEUA0XHxxmnQnh+OG5CnPemJ6WYIyUxoLTbMN+Dbe9CwCoyh1sq6pwA0Ip+vcDiAfJEV7gnEKP+wcsXyoJG7JR6yUH4YC50Rbm00X5vxS6KCyJMn8uEwnhqZYuicQmqbafdYogunFwu9jpZdc8rxcE8LUJwvMouwTq/akf4yp0gQT2T0Yad3XP5W2V1XZxbWdrSNZZsNqN7m7PI0mN3J9fe0BoE6mVipKQfw/nIBGkMILReBPomEOjouTZ4TehYQ9/eOyeAtrmyn4PVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=6J+dwDpCysg/7qyJjv5QTvew3DzMfuZNessktrypt4w=;
 b=O/OIBWX1fUT5z4up++l94gbBAtOqjBt70KPS/dlv9KCmPWVAIcXHRfPE1GJ6bRlyIf+K+D/7PMwGqsDvf+e0v4DMrGwO1oOsaC9elH9AbQNU1iLBkShoN1OToGp71viPPoa/EjU5bIPMN0jjelVoQLyFGS9Lbpm8dyvPWG3xpxcATwxDn6/NG5aphD27z4PlBFBUTXw6dhiYfbDu9MQgSFcz9cYZCWOskQOQEFtEL/jdyb9M/qybWTCuWJji14WQmbtvQnNSrexl70rjk3kGp+0KSR1F8zvg8yCjFT2QFMKLAZfnFC9zSjy6L5oq55+AJWTmwMhoOPWV+u9lBq4TrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6J+dwDpCysg/7qyJjv5QTvew3DzMfuZNessktrypt4w=;
 b=iVpFm0ZKd6McTe9FNr2n2inaZtMU0xceJvJ2e5Aws07CXntonSL1X9nqYqIjX1kNKLUrWq3cRIZiNn/FSg0+08k6pGZzQxCXUTjM6WH24DKxZPoZj4I8G41GTtcC1IjWC/D5FiPywTFr3eUq5d/3/QaPCmqjuijNTWiJudKaDcU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v3 13/17] iotest 39: use _qcow2_dump_header
Date: Tue, 14 Sep 2021 13:25:43 +0300
Message-Id: <20210914102547.83963-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7ef1485-a087-4b9f-b7b2-08d9776a1826
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6071000978EA46B0B6E85E72C1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oClvJ9xjqcwyBQAzz2N8C9l3yJoB8wcEiZ3Y8R8qLpxT4mstKLwXX7iHnriuoPZRS3q/dduWfX8QjBfuEhNXiGem2wwMtEtpbveLGxk0JutRqofhufdlI6xMyBPeNJHLFQfUgf3XuR+qtLPx+FCVpjPw9EtmtjsDzZMRY8INPwLzlk0fh4VbcBC5PSVOBwsAtfGXlJKshj+u4IgzWAo4Lv2RP5Xu0RjI5KE5YuDNQmz7x60/lQ3bt6Lqe/fwd1Nx+yspuu853zQIehBPviccR59EVsTgIKpyM53idXjaSH1M/6yjbLPTNFKLq1vtrgREl1ArQZlIox1mqyvBdPP6tLObZO6i3UL7CvDxQORxDYxCKxkRkT9Z4A3bRoZv2XU5RA846lyF9qIcCGPcuKsJkwkBp5viMq8lawrFk/v+11YN6OfbvmIvMG3olR/GYfdQWS8g0wh5LmYPPm6fJTltNHQioAZMDBXmyTqjgCI4AyGJBU1VupV4qXGpzpVVqBe5i/KIeaZSr+1aFusN/ijX08r3wTbSDGTn1jkskpHSUfqSHamluuIZ5XwTqJkJHlZBxrBAOHryuRrlCsvmQ8Ql3o9j17XUl9dpBEoQIQuaNhezB01GfCDyHrFrgLHP4BRL2+jvhMgimaZD57RyHXRCUxBCP5ySJ7TQLQxAHAj6ZXP+22za5BcehfBVPwD5Qq4/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(4744005)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5zBTcvfVOWPuyGHr6bLy8Z5fm35U6NnBCo+XS+pwVB0xZ+ZFL3EGXfOSFozv?=
 =?us-ascii?Q?MPB4nCGB7QFlDDqVXI6Eq8KxNZ66QkLtA3rvFwTSwUIr2z90kP/LjV5N3kEH?=
 =?us-ascii?Q?AXPnW/t+KB+8HMbAgyTZA5M/y7kQ/ACGOXZ905l0pq895jOnv9qSmN2zI06o?=
 =?us-ascii?Q?gJXU9EadtEaWUGv4TxkglF98wKMHRAkGjab9AEYaoHNp2nBj4JWGfvP/IncK?=
 =?us-ascii?Q?1VDA2eLztyjctdl1ZeTfFFFl8xGbLiURwMIw6/x5bwwC797RISAjI5T3o6M5?=
 =?us-ascii?Q?gpY/SidQXmMI9wlivj3ZlpBYGSdgMjLL/vBBEaSKjnGCwlHAeDyxbqQ3f93D?=
 =?us-ascii?Q?UgKB8VL8aqU20/DgKlQ8Wk1x6UOPhha+pz2DtnPwBjEIsQYqV4fBJA8XSbRM?=
 =?us-ascii?Q?5mrr+sv4mxJx5UOZPJNqVJQIf9Tr7jZH3ufbw+3B/4mBz0jk3Z6eRO6tRQMB?=
 =?us-ascii?Q?KW0zYNI6GzGUQGgKq2ZZghE1DNM3zAMY59wwjSNCUnpxKqrfXdYj9n+zMdQY?=
 =?us-ascii?Q?xN8z4oXQaWqiU0gC+tuxzrQgqtq4DC07a9YFo5IOCoM7XurEY601DdBa+7FG?=
 =?us-ascii?Q?2EzWq5Bi+xD512/yMLDI5BgUImJ+GL81NMyDCRrQIRvnQVhgG07qm+Z05bYT?=
 =?us-ascii?Q?enmsCu/L80nXsbOQMw5Pw3uevDdfrts1+RX1YgRjzWguY8jXkqi/b3C0BYNS?=
 =?us-ascii?Q?f2Sal6nU5CaPYggjlhVHcW1Q11EeGdh9Rq4GcdAy4/NGGOKKl3QOLCtGl8EP?=
 =?us-ascii?Q?orW+Hlajg1bbXtucY7/DMDdEoITK935tRwjoUUNpjUKbJokowxdSrFgbCOim?=
 =?us-ascii?Q?tvJzlD7cMGcKc4j0qXhC0Cm2+qE45q6GmDnNJSIyQXFNIUmgbEIpC2ginWgd?=
 =?us-ascii?Q?8IYjBYP72zp0WgGVv8tvW2ybmrkwea5F7IBQ9ftK/36mj1fGYjlzNPqyI9Gi?=
 =?us-ascii?Q?k0knXs/jKk0cbdy/84sRQ5DrssvTfOzLA1sl5GlZpsBGgJMdoeW4o07vnKnZ?=
 =?us-ascii?Q?D1I5MuvYiwaXt8eoaHi2j0YNp3rH24Gim+Q1wD5FNddSg0QD3uFVxomfNoAq?=
 =?us-ascii?Q?cswfncEzPpGntsPpBPSviX5gJd2wP0cZF6OsyADIBcShK6UEqgxf6QKGAOIR?=
 =?us-ascii?Q?mIic2FlPdFMQBgO9EAVWFKJPTSZCSjdWuiq9Xsp5u9TWwzaxPdvGWmuyQrh5?=
 =?us-ascii?Q?SBIzHDkgBaOJSFEmMHCDtHJnSkMb9l7HIa3YS5HmXpgrSgNGj9jvgAROvu1X?=
 =?us-ascii?Q?c90+SNFfz5PwQRmu7gWW5agonrlJP7oq89ycCENVpCKge0AYuF4C5G5kU3kC?=
 =?us-ascii?Q?6/kd5rYzqU2rTotxsIuOuMot?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ef1485-a087-4b9f-b7b2-08d9776a1826
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:20.6668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fxd93qSnbCVWc6NKndVuZWTmDudLNIFzbFVemxvrS8l2sy71M5OIITx7Bds1One7iMpz+HETeRr9l9t6MXreJhsAq/ZwbG2kfdle5n4ZPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.21.115;
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

_qcow2_dump_header has filter for compression type, so this change
makes test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/039 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 8e783a8380..00d379cde2 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -142,7 +142,7 @@ $QEMU_IMG commit "$TEST_IMG"
 
 # The dirty bit must not be set
 _qcow2_dump_header | grep incompatible_features
-$PYTHON qcow2.py "$TEST_IMG".base dump-header | grep incompatible_features
+_qcow2_dump_header "$TEST_IMG".base | grep incompatible_features
 
 _check_test_img
 TEST_IMG="$TEST_IMG".base _check_test_img
-- 
2.29.2


