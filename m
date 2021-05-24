Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD6E38E8A6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:22:36 +0200 (CEST)
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBTW-0000RV-IG
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBRs-0006Zq-Sm; Mon, 24 May 2021 10:20:53 -0400
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:51129 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBRq-0006l3-4p; Mon, 24 May 2021 10:20:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbriHZfP64R+XvexqzsysWNE6i8gkJgntAD39O3LZ1JNJmndx98SbfXIudHHqYwCRplHtz5InsenYPfefPWT3VrlZIT+JRzeXVJGv9lGypV9tPMmZppyr44Q/gn5aZC5FRZ+5UR9auc5Chv7uf+moqjqJLbVSJ/ZClKCU6FiKa44A5mjUMCMtUZPNaSFDc/t++LA11x0QGsxf96PuqEcIbUxQfWMr+iNEhuat21TyT70L+1oEUqI0UTFUDQjqWfMVStYcsiVb8HAQ8BjQRHWrxxoG7PsfVsiY1b2c34ggjaLGWOvdA+K1PysPBb0D1sGFZrjb1jCIgJjKhDp8zbjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGo0BIraZYA+grlfy53RF9mhkWk+m2FuDfyiuhak91E=;
 b=NwbS2JgpoXZLt4od4ctU3dkODW6kWc5/ix75Pe7DysF6QLzYE68sxhtIjLQbJS7tdv16imx6Z61PSEV9e5TamTxnALAepBhllpca1a+bv6w57+QnK+kfqMICaBUQ2wLgciIlU1PIG0ESzzDbNeVW5cI74vHm4q8ZOBMOM9NJutbyzMrFgEMaFduk1ECClWxHDMsTEsVe9Eh/fIyP2zPndKLJJyE8EDjj7TWCejuBNuh1Egjf0vqcWJi6m89+NPu+BLUkd9BSu/fUk7PjHelB9FwGtHLzgXBpKsmU+6w//U3GqfT1ZPnxCGvfsQHUe7ThagNVZVlUttQqBVYHXaC3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGo0BIraZYA+grlfy53RF9mhkWk+m2FuDfyiuhak91E=;
 b=sEsOObFMKeiUMwmfqyg25gNgk4f90m9GUwoWSSa574DTAnTt8OEIns8Xhd1IsyzdHmdyLbKkoxEBS5+cq6VjhKQ/NP0u5k7fXnEpBsRACNEhICdYU0Kd7DnnxHicdvg1tVp6e9h6wtJlhwoL2ZF0haPk4vjHNQPbTEKhaEsB2rU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 00/10] qcow2 check: check some reserved bits and subcluster
 bitmaps
Date: Mon, 24 May 2021 17:20:21 +0300
Message-Id: <20210524142031.142109-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR09CA0063.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR09CA0063.eurprd09.prod.outlook.com (2603:10a6:7:3c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acd2ba82-a240-4e0e-b47a-08d91ebf1e1b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4165017E4E036EF19FFDE22FC1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XyoQULMpz/4iMSWCEqjP2N6f4auCo8VL2wM+/VZfy/krNkZ1xKVVOZ8CFSERpU73+yyfVo0QBbbOvjd2kCYaUyitxGnJ1EZ4BxqAZomC0d6uCUFoHqjD9DdnGGabfEYMMhYAz4+jbsMXUm4D29X3Atc2bdRgKCTdHS2ylBF36hvG7vp7i9ZmvvUNiDuvPR02Mf0y+bjzqvTeqUzBHKhuifyahMOYsbWjkxddidaIRXKCaHr1FPZwtemf8yUfz5Fln8JZTbPtq24QS9lHwW44hqW3AtLTry71tn1L7eUbYTbohvLtpuHggtCtpcbyYibzm93zRoFjH0mf6omA9Q73H8ZHms3/0FYSbJD0KLQrS1uAJo2b3DWWkxkQLFRQodvJvpRMEiGXZmD4xLaJBPk7j0+frvzZ6rNkDD9n6XQrQ799FHL59kZjCzuf8dkluGWMqqc4XWfHsDFf0z1jrghN/PBtwmk4UyDRp5oHkz9TsLm6jGlqB0O/N+wBZwGIpGVQzKRGOJYlpmJ92VCNo5f5M40rGYVFpOjVQfHJTtZ+9YNnh8PCnKidFZNkQ9zJGpOa/LmaSmq6vlToMWncO3PP63MNIGHVZrIa8oYSL/1kdAn8w4I5JuZW8vHnRQMIc79bss6SqgcDveBX/AJNBGe2Y5iW6+981jyVQg22sClBFqjppZGWBY6UOyp1JCTV/R5l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(4744005)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/LzeBPDzcHzrdRxWTz8752wDhPdekzz0uZzYHWqPHB7zc3XWVRV/OlNy+6wF?=
 =?us-ascii?Q?hjkAMujwvFrwt3zBe7tJPPiDMzRplpAnfUwwV8KPdsZgvyQ6z4pOzjRrVYyo?=
 =?us-ascii?Q?733DU5q70V8b2UfZQ6Lb0jWBn19HR5bBtE68iaUtLhSrG/+YK/0RT5c2YBIQ?=
 =?us-ascii?Q?ApdqcApVQGzLABuo29AH7ozJrFE7GcDsPP3J7ozqIoOGNGRKudvC2rBI8Xnv?=
 =?us-ascii?Q?fWnO9VlcvSZl2674ZOapPFgptiYPkwljMLddxFaTYqwn0XI/5g/qc8+dRauX?=
 =?us-ascii?Q?0BJdWEqpcDEfp3BqNIq3QZacTFRNuomZmkT1uSUXMn9iOAqERCEAK5GIbEOq?=
 =?us-ascii?Q?2rMoeQIALscDbPGfn+qZg2hOccK1016UKR2zZQf51ZHexu0OrPezAZLR3LG0?=
 =?us-ascii?Q?jJcO9E5H22c6FRk93tGbGtl0GeU7SBSwrbyueL4GYz7jxvHC69cyI2s5xsID?=
 =?us-ascii?Q?+ANoyqUAXItoqWjUNaK9n2DwBpFBe5JVIiRElzyt8D1c2ym37+zoqC4qFB+E?=
 =?us-ascii?Q?n96Vw2xjXK61lp0/3aTQlpfsRg7+MiTkDaP+BAZAV+Cq+SAUDfoQRGWOnk7U?=
 =?us-ascii?Q?7Ank/b2UhoGrhwTCa8BLpoX5FTeNwPo8gYH/hZxvQSvG8cmuYswic6j8+cgi?=
 =?us-ascii?Q?8r6ks1BAe/QJOrykdwwRQcF+Hvy5nzP1HP32YIcmxl4XL8F0w2RBpTzwGpG9?=
 =?us-ascii?Q?S0VYT1t0oRT7RU4evRgDY4Ffemq6TkkZAhnM+La4FxAQ/G5BM1MR0ROGMJV6?=
 =?us-ascii?Q?orw//mI6Zi5SZQqzIm7tER2X30QNEROsLUQG1Sat0Qg1FS5bb5E62rKYef92?=
 =?us-ascii?Q?3YNKBCuUzod0JKBWeg4kxA5cj7cF6GIlr8Lqd1a3g7uifIu+xVMsONZuGRn9?=
 =?us-ascii?Q?0GjHi+QmdoYW8vVJRphmzesKpMxEju/vDmiKPDbH1pfLQf4yLV+rl2WmjjsE?=
 =?us-ascii?Q?jasquffIRRSMGSluyKkHPbMedBZzA8wew7UEc+pYbt0b7k3TWeIHySm8uHXY?=
 =?us-ascii?Q?gqH34rz6R/hiEQZzEIgGtZQethHXfXL+xCLoKnKnspEpgfv7lIGeB/12sWIp?=
 =?us-ascii?Q?sE5mlRYsaN0uO/LvG6VH0xjfXy/fP3Rv6EHH58bObNwFbyJsi1stQ9k/2tgc?=
 =?us-ascii?Q?nTtxcYMtsGoUsJOg+0LdDHYpDk5WDa0DOX6c58ZPncm1bmkZtQWnfVLTiTm0?=
 =?us-ascii?Q?S2W8ph2Bv/zCck/SgRgFlAOi29srTy/QMmT0HtfZY8H1v1BaDG31aMIotcNi?=
 =?us-ascii?Q?+tqChjqREiaYOLEkHPgBKgmmPWGM2RiQl9DIDYVMoIvgxrnlgw4c0OSG7XHQ?=
 =?us-ascii?Q?785EdjMUnxQsHJ+wdJQSzqfC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd2ba82-a240-4e0e-b47a-08d91ebf1e1b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:44.4724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjeXkFX3n2mmdwI7TNkFNyZOk1xoKZwW9iuu8BKUUQ5Weu6QwV61JEkniEz+5mQp0LnwhOtIdZokcg7d4VdB0fe4BJ1mIyd+Mx+OVu1MooI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4165
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Here are some good refactorings and new (qemu-img check) checks for
qcow2.

v3: add r-b mark by Alberto and t-b marks by Kirill
 07, 09: add missed "\n"

Vladimir Sementsov-Ogievskiy (10):
  qcow2-refcount: improve style of check_refcounts_l2()
  qcow2: compressed read: simplify cluster descriptor passing
  qcow2: introduce qcow2_parse_compressed_l2_entry() helper
  qcow2-refcount: introduce fix_l2_entry_by_zero()
  qcow2-refcount: fix_l2_entry_by_zero(): also zero L2 entry bitmap
  qcow2-refcount: check_refcounts_l2(): check l2_bitmap
  qcow2-refcount: check_refcounts_l2(): check reserved bits
  qcow2-refcount: improve style of check_refcounts_l1()
  qcow2-refcount: check_refcounts_l1(): check reserved bits
  qcow2-refcount: check_refblocks(): add separate message for reserved

 block/qcow2.h          |   7 +-
 block/qcow2-cluster.c  |  20 ++-
 block/qcow2-refcount.c | 328 ++++++++++++++++++++++++++---------------
 block/qcow2.c          |  13 +-
 4 files changed, 240 insertions(+), 128 deletions(-)

-- 
2.29.2


