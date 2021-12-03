Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297234678A6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:42:52 +0100 (CET)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8pu-0001P3-O2
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:42:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Iu-0002Q3-E7; Fri, 03 Dec 2021 08:08:44 -0500
Received: from mail-eopbgr40107.outbound.protection.outlook.com
 ([40.107.4.107]:61828 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Iq-00071J-Qf; Fri, 03 Dec 2021 08:08:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuiB2F79jU07ApJyYWZvLDrZffp/+upLEa/yJmVvdWLh9hiQSVhzoKsxLtAh1jT51c54lt+f8rltCw6eD/urueCWgvRDPml2ZOHxj94wKtrIw/Ggy4rGzJeApbGhYnSmbSNQqJsN9EtLo49j4QBWxX1bcSWovwsYtDZ+3mng8JwddXr8RgJkJbFPrXv6t/7Lip0k2METOP44KZA+u4loRrF1lfSKR94ihCbBBLe1ujLZrkasx/B0E06r0844cbe/WVpPk5aUxO9W2UuZcg0UJs/KtLLWebNrcrdaASvwz5rq3e2MPbtZYauQqKKsfhgW6Ii0vpdZ4S4+iPBSYMa2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RU88eMYqH5FMqCplfNXc+E/GqCiMwnkaRc630GvQCs=;
 b=XhhLS5oDEXCp71LMecLyjrSNdrJy7pXeoZPCZUfLVctVTw1tFi6n8Zu7+jZvMhNmI3Xa0FmAifzM22sw3Qdq1HIMJmyJ4U7AcTFu0En3JzRmQSiSOWtC7Ai/6OpJFgLEJNTAsXnIpG0rHrq2O7tFu31MwpRY8RJHCOxygZi0WBk1rQNwWQWHDnDpcGf/heEZ1uhfV9ddfgp822zpU1qa8liHmiFIsn/wQLrwaWO4NgkeVO/rxQTQpAVmbbt8HoB7mh0Ar6CGu3/NY/LsRm8l3KPKdHUNjUrJnboDaPpw4r6FNiYwCQULc0kB/1c1xiEK88aBbTfIX1v13iK6Z5m/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RU88eMYqH5FMqCplfNXc+E/GqCiMwnkaRc630GvQCs=;
 b=RB07rdm0EO8I8XCHwbH8wltK7r8CkHOghVp0Pffr26Hd1XGqkyqZCg/ynN7uRLkIjVJn9kMz3kaxN3FOJRaEK693KeXhOsMjaOVzf6A9U7zX4tnlEgTxdepl8unGnVBBYXYi7unVbbUPyauNht7Ltsb0Y+K41rK4rc06uCX2srY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:16 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v4 15/19] iotests 60: more accurate set dirty bit in qcow2
 header
Date: Fri,  3 Dec 2021 14:07:33 +0100
Message-Id: <20211203130737.2924594-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48c649e8-bd18-4ca4-b67a-08d9b65df93b
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB451560810E766BAEC0674EE2C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W5rS3Ck1jlnkXNrbqd01twTUsSgtJLYLUicxvPJmok4QiTWXOjfF0EqOxzGrF1vX/JJe+ZM9C/IW+7vHUtkkqV1+lrlDKlV/lK/+QmMJ9ZLLJziXPPyfJM/NdtlohAa/gYhJqDH/S2Io7DkCN/7eiYiaCpe+/XoLdHy1t+di5e8NFVOMB4UGs9nYFmqPMwyj97WQW3giEqgjh8v2xy2EV8GeDRT6Dh8qNOBi8pTbtnJeYwHuLL8736XolyLg4M2Dq6qfsum+BM8+6otV+4gMv/1abSoqur9VNEmmG3g+0W1l0XIr9HkK6Edp0lyz3mEsyijoMnhJr48EaNpNzZg7Ktzhiko2zbF7UmyRcOWvk7hFBynxafGVy9vF38attQ2q7pTZ4yKjSXZPL4oVepj/fyZ8d+SoyA11bdTSfOVIhvUDjEn0Rqi6MCHVIL6ABxA/1R/4UdVl2B0xR37Bxeox+eirBeCAuzuTYj2kFlcysNp28Mv9A7vZ+fj2vW6h66fn6pcV25BsCzbxJEkkYqudCGMNuoX5QYZoAvo8bnby/HAY7FH70zkG8rg2E9D36ovCmScbLeAT1pyaCeLgcJNSBJomDbQ8VRxoadqcDb4Rrl3jm18yCIXhHcHTjehRyq+iKt2DCm39yMD1FfzYEDNPdpWJCcrIgUOD0uuHsuTvPkZFnzfF4+oX1j3qUEuYeoyduLeBvqXPrG1dZFkDmYJlzz3709lPHwEL/N2Q2p9L7hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(4744005)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1TxjHayuTLlxbCCHpcm+h0dK4LBplIoq3GoLhm5jckBXSulmpplDrzI5Ow7l?=
 =?us-ascii?Q?eSvAVf9/RgN0ZgbJ3MNMdPpb4y9L0Sn9XKrElctuypUy3FS2bOGRWBv2IdZ4?=
 =?us-ascii?Q?+YIXlZdI3N4MgvXhLAQHT8qUQZ1kLU1ExpaBdQJRRsIp2viIoY+o1Q6uclN8?=
 =?us-ascii?Q?t8c88LXc35GRNrWI4PSmPJdnUwzUYJng5oJ0WzV2JAnF449RmU5Iy6X/wpBH?=
 =?us-ascii?Q?vfn+xHwYRHeYNCZw/+1EoSJV04Q6S8z1Drv/ifkzmlhAlrtEKpz2vgQfubA3?=
 =?us-ascii?Q?77JPXKjeQPIORUcUKhBu7qaD7ezSvP29QEcGaq5MkDDrP3LoPTs7qiVBZTsW?=
 =?us-ascii?Q?SUa2diyPvZhx69UAvKeNVyZVoveTLDxKJzV3FojTk9iQy4gk0gSPlvQz+ZY+?=
 =?us-ascii?Q?LiaSviVBmTxVfttdkAidQ5ahALvI4daO4nWilM58UgpALv77spGAUhptzinN?=
 =?us-ascii?Q?qtjBPAyHiot1QboXMkacxnYQwT/fZskOjeObzorioRkig289sZvFl2njLlrf?=
 =?us-ascii?Q?2NzoAZGiqz8YhSYdFAh0sgGRO6IPZxbMZwTVRU77bDtcDKg58l4Bbf+r1YGK?=
 =?us-ascii?Q?uyh02kJPniSYJBYAhI/CWU+8Wyq+fLdOZUzA9PYgVdv4sqYt23TN/u+NjrM/?=
 =?us-ascii?Q?Pv7ZqI7y4YBq74zUj/uQO4qnLYiN0e/MrPzsn8dwhQV8AzpmfX/eln4kJxcO?=
 =?us-ascii?Q?4YOH4m0iiq+8MHstXkm/VhXxvMGDQ7D5Qui8lfiKga6MG7l4J79FdrQpfZKx?=
 =?us-ascii?Q?pGDsdasttdydNkfvsiwAXqC/jxe77szBv2/Dm+Y6JMWIvgLAq9igXhC5fetr?=
 =?us-ascii?Q?JuSA6SX1JEnEIhBXVFZP5+WI7RcAGgJg4nH6SHl8EnDNqBJnyuj0YvPKwMlO?=
 =?us-ascii?Q?HNEXy2SFeYY1ru3Eo0ZFa8KiAIYYlr/BwJ0mE8jlCwhv3XHyHuR1wN+4pPnN?=
 =?us-ascii?Q?rSBDb/KoWYKLNnUVplH88zy2mxwbhKoI4h2+SrCfFQkvBvmi6tMIAY5/7ftc?=
 =?us-ascii?Q?NOOUAOAOl3O/ILwP7ISgrVMGb1PmA3FDdq7sfuVSi2O2a3GOHjHDWCB4SdZH?=
 =?us-ascii?Q?Wkb5UfZ2n6pc2G6MkrgPpdoTPcEYb07Sbfwn/NsDAWAR2HMaGJ/yRgz0X40A?=
 =?us-ascii?Q?7sSlOmm3JvMj1Z5CXQsctsbLA8B3Qewor2ol7SFanaaiLWNRniLHQzwewyo0?=
 =?us-ascii?Q?XuQmg94+Z0HacyJ9bALeFVkefnAqxgA4BokF6758qQuuVndYfhwAHjml2VPu?=
 =?us-ascii?Q?ht5WbnHkjMdKsQiiBtbeTsWh8JFqHQyI+VFs4+JmHaMTAt2+NhZLdm0T7OaI?=
 =?us-ascii?Q?w/A0e+3WIUcP6RaIFjFqtHH2NRArLoP/xpqQyMR3Aq08si49d9sWJAYsRn1h?=
 =?us-ascii?Q?KloXBET6kgio6VIToeLC6oeV73S3yfoKZ89f0/8XHPJOOik+KQw4C5st4kLD?=
 =?us-ascii?Q?UYp0SeRN1WxSE8T8xhc3FM7vs4rH8rpfFABvbl3Yuj4HuuO9zPZP75A/RKP9?=
 =?us-ascii?Q?+jJg9W7bH0H0Q2sYeblqt1WLrWoNow1/+yv96Dyzx+fW5J0rTJY3GoZhqnCi?=
 =?us-ascii?Q?I6duISIyhILsVbjNWQBJ2hP741VouuV0O53kk2ugcpLTPPVX1Mb57ly3P9Rt?=
 =?us-ascii?Q?BX9NI4gFDwOyp8NHkc5f7BvoL/aNdXnve0DfEBkeCj0/yD/E+AwKm+7tExCI?=
 =?us-ascii?Q?akJoXQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c649e8-bd18-4ca4-b67a-08d9b65df93b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:18.8399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/xPEfkBd0wkqXzXnkHrIEYhIV9tVV0Uut1g/3XMmFquKJRDqQayodA0of15HywvrACOLt+MLtnlHEzGiCgHjdW8A8oTsvfj32RkmI/ceCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.4.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
X-Mailman-Version: 2.1.29
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

Don't touch other incompatible bits, like compression-type. This makes
the test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/060 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index d1e3204d4e..df87d600f7 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -326,7 +326,7 @@ _make_test_img 64M
 # Let the refblock appear unaligned
 poke_file "$TEST_IMG" "$rt_offset"        "\x00\x00\x00\x00\xff\xff\x2a\x00"
 # Mark the image dirty, thus forcing an automatic check when opening it
-poke_file "$TEST_IMG" 72 "\x00\x00\x00\x00\x00\x00\x00\x01"
+$PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 0
 # Open the image (qemu should refuse to do so)
 $QEMU_IO -c close "$TEST_IMG" 2>&1 | _filter_testdir | _filter_imgfmt
 
-- 
2.31.1


