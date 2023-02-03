Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F606893A8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:28:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsLl-0000U1-RD; Fri, 03 Feb 2023 04:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLj-0000T5-2m; Fri, 03 Feb 2023 04:27:15 -0500
Received: from mail-db5eur01on072c.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::72c]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLd-0005CS-JB; Fri, 03 Feb 2023 04:27:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAdigvesCLCC8p+3C+PmE3u281m7mWXWEgztlYTIGTWMboOTOb/Q25E+zDpYPLa8aE84y2RVo2Bae0lU5uZvTgmp/HD2pNxgq7Qsiqom3T1wfUXQ1QiC3dHCMVQW8LQBIjS3uapHFBIcwo6nAqb4kV4oDdccohDEMZTs410uFdKLXWL9aq5/504x79x4Z8M7Qh0RRxVkaYNFBPBvQfM7FL226H8XhHPgU3R4GMrQNGRMZJ+3SsUfk5vC/85nXdC5IYz+ogQvVbF0J5yHPxGtfBUNOjTJSKg9hHRvvN0Sz3b3pQ4G2VBJGeQoLox7LqY0uNZ9m7dmRCx2iOzmeNyvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60qKcKFgL6UnwAhMTUKbnPTzBkAr4yaGqrAVKBUHNwM=;
 b=dM5hYWGUyMjwaIv2uPWM98h6qnBTcR7/AZ5qSYKckVN2CEFzCzA8vbQAu6CdQsGHZMS5k5DzLYpZAKRBMHdawnlOGPThoZgwpU1RHYV2ghNx3KBC5JQ3/8qv++xRA/NhxjET/aDovXR+R+vjpP/KUW0sdCfpljqwITPpky2E9UWZ2T7QozFNlx91GBNXdUWfnF6CUy/8Aujw1u7Bt2uDsJuspUZGVPivuaXm92O/AqPG+kl/UxAiBVnfmQD9Kb4nY1EMtdVs8PQnBWWGLDQbPQbgvXzYtfonjAhYgZ0lkPeVIfJqQBq0oVybc0HmFPpcwA4EuinP8pAqcJMP8cIZfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60qKcKFgL6UnwAhMTUKbnPTzBkAr4yaGqrAVKBUHNwM=;
 b=SRozLoodvMHM1FelHijEMsIyjuLkZmMyljrNFS63I8k0uL0y+gJ7iI9q2RDnSsrtdnBU5VICdLSJKXURXPkpsJCh65GLTPoYc4zaFERgGXEKevsibraFpR5BuKhPn0Y+H22HMhxrYQD3A72X7adoBvCV3ZNoE6e7kLN0Pv/7LXW/cHFwSRJEY6ouB83PF8oY9DiigrcvwXt7EFXRVp8kPRcKfn7fNoFsmbbq91jFbooxkX7TqZKISs9GnlogVaPPt3JTG0830+uN/sVc0YCoyYT0bTkQP4KIPZjGVoC2MrMvl2iwdTWUimkwotJuitN/HjqmVqBXONlfUeYd6KIJjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAVPR08MB9356.eurprd08.prod.outlook.com (2603:10a6:102:30f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Fri, 3 Feb
 2023 09:27:03 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:27:03 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 0/5] parallels: Add duplication check, repair at open,
 fix bugs
Date: Fri,  3 Feb 2023 10:26:51 +0100
Message-Id: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0099.eurprd09.prod.outlook.com
 (2603:10a6:803:78::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAVPR08MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: 1389a9a1-d4a2-4de0-0e64-08db05c8cf5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLiyyGsXWMLH3B8oWV62BfeXUylxbWHrnjo3P9mEZ1+JfSrBLXRV1wMbXZPAHPnMwaNC1DwUUspIoK58gnKnY46bXzurVchpsq6B+vUBTS2a690jODl7H37d23O1OJv+YBTgAAEQEBgObBfydUUiuOmm65fTZYqeLWEKiBM37wO/biDZd9rIW1M0FcjCoQ79ixl1ZIf9Axdr7obxarPvD8PPFSQlb+0e3hCG2R4LFbv9FVcXYovwQJAFoZpKFdF/aIFQrrVgT/C0serrLf9WJb6aS1a4KWPFiJmzaMHKQl98gXnU3YREW9OEWIU7O4yKtOvLyYXCu+j3k6us76xvCyn62yb5RwU3KBZhLaLyRnrTMF6pS69/EgsXZAH6JCbQa1sjQgFZeHHfhaxSlEu7ugWgGBAKmZk765BgC6ce//n/IZRVbcZ4ISFLNSFuKTou04CQ7t68hQCam6W+43Jw+PxZfldKHPp31EyzG4wGerKjGONgcjegUaOrM2BjjS9Ap1alfolaMSQOhvTbotZW5zAQ/S6RhN2Z5h/T/sKOPPeKcHWyTSjNenU4nnR3CHT0nCaKggNc5jGrcnd3IvUS4LNg6ZiikUbomleigwjycwbcqnxrOTeiagOf/TkY3ijloU0IlBQcPq+YhXfzdfUTTo0l+Eb4NMAtsJEvkxmLq9+TlVK8Ok1Fo1wF/7FOQlOqFt2sHbrqOklqu3dksjjBlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199018)(478600001)(52116002)(2616005)(44832011)(36756003)(6486002)(5660300002)(2906002)(8936002)(316002)(86362001)(4326008)(38350700002)(8676002)(6916009)(66476007)(6506007)(1076003)(66556008)(186003)(38100700002)(26005)(66946007)(6512007)(41300700001)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dq9YDRyqrO9x2WvP5XW/ad0MvpG9By5GuUsJOiTBVinkHj/m+mnxn+JUJoEo?=
 =?us-ascii?Q?4HCXGY853EYunKh7bNdvV0hxWFRunmJyNiKlwkpMKuzHbeuPpOz5xw1gi4st?=
 =?us-ascii?Q?eSUMOBizrpMQj1o+zGTfWUqJJvqT3RiYt4tP6+/O+w8LRT+mVJwnlCeJbzdu?=
 =?us-ascii?Q?PTDkiVwS9gbm0rLtohdiMEHKShvCOQEiXaiLF4N7mShrvlrrxoOUhLNyNwj8?=
 =?us-ascii?Q?JmuvlcX3gWgu+yYlylGaDrPbLSJ9lU1pqbWRGreQGBvz0QYPlUaPO1L2c2C3?=
 =?us-ascii?Q?sskbWvIsvbZ0Hb4AGfNpJva1VqRKzOlI5kvPzObLilj6Hz+Grs8/HBI2PxS1?=
 =?us-ascii?Q?DpgpdRR7Mg/R1a3SmalY3HEZ2pQ6JCpao+2RBwazxwDkXA7C4s+HPGfoN+fM?=
 =?us-ascii?Q?fPuHsN7GkSK6LpEXkSqCfrXddA7KfiZhILoicgBbX7/LVzKQ/mkEH23Qa5bJ?=
 =?us-ascii?Q?NmsIKJ0o/XAacmSeC5Ll0qrCE4l9LHmYyYvXLNpv9YqABUQx3FDhWkn5RwrO?=
 =?us-ascii?Q?cQHnFFjclJtrETIvsmzAizdGpFDLAmVuacv8YZKvuOFbjs/f5bGjEFn3osyc?=
 =?us-ascii?Q?KwVJCObVE/9lN9KP9kXKIH6qITwHp9DCEp14/INaHOgKQ6zj42PlB/26UZN7?=
 =?us-ascii?Q?2J4AwNaX350R8/Pcn1wewHlogaanMDXLsiLVIdiFcA5F1tOhMhgqAqPzG/lh?=
 =?us-ascii?Q?XA4mwqH6yltlxMd+NHBq6GorsRbZAP2pq5GudPz7P9aKqHteB3wNgJ3HWRDs?=
 =?us-ascii?Q?ioWTGplz+6jOjy9BqKAe4Vk3jyCg8YQ2Xev9XdX54vvX/9+l1ENTbcKqK/W9?=
 =?us-ascii?Q?5G/VW4RtFmjNFV0eMhH1nTtWkxEeDJ03g/lpkldIRztYRsjYj4g77K1wRefQ?=
 =?us-ascii?Q?rFdmf2HgKqHoKC0D6BTG4cABmjhdS/MicOSulEOzzzub/ldV775K00yjrroM?=
 =?us-ascii?Q?HdZrLf/oz3vJrSQdvl3XEMZPxi0JHB6rUOAf8mN3qdmah65lgIdjcdEBynam?=
 =?us-ascii?Q?C8HkAOy5S6P6T1DTs2xnvFzn+9bhj2AE4/Mp+MqZavsIbo68bNCSMnsEmUTk?=
 =?us-ascii?Q?KY72UDpcUp0zyn929hg/08/DEZswuxkN1dQFNRbc22GXXGYa6kfUZFpyNNF4?=
 =?us-ascii?Q?CyE0hFb3uOy9yZV8+OLdbirntPQ+NP+iZTg25rXuLyrgMtPwXqBDIlBDJ1YK?=
 =?us-ascii?Q?4MksKSltOh3MMk5NTHPw7QCJ1g6ZgJMisLIazLtv79X3LWXFisjmYD7+OlX+?=
 =?us-ascii?Q?92pf6NBmeJymsPh0oKESalZqToLscjBGy0bsdD+FEDgmNirnIp2SR+FCRkfV?=
 =?us-ascii?Q?43gdpWO5XTEPYlccyxfBB/8bGFYu2fADuzyh2dPGmyyicnroUYnMLitlpFAu?=
 =?us-ascii?Q?ikFDPLN+bpHeVRVk6CosX+IOzqylcGNBaMI/BEox5A1zcFhwBNflkaqyDDpC?=
 =?us-ascii?Q?g1+dBNqQqkpS4ZIWIYUOXx1h6j7Lxtt98J6Dq35xwpfgZk9QLRXLtl4I5uxE?=
 =?us-ascii?Q?Zd9dh2cWWytLmlmRtYvuc36eAlVitM6s5ALsUI9zfMgKe7jxqaqz3ekuSjoF?=
 =?us-ascii?Q?5NfMBgBDLg52z3JCq5yvpDHOgn2d+EqZ813O2y/eS/L5rRcQIKXzZSfUoXvX?=
 =?us-ascii?Q?o/CQm85y2yIXaQD9Uu1k5zw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1389a9a1-d4a2-4de0-0e64-08db05c8cf5b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:27:03.4599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNp6L6CsjNQeeKj44dsLQaT38vMeIPNiaiAeOtA08zg4ubyZcgoVNFWstcJwxFMWkWNCzUyELfNYNMzSi0hy2LBEtwt1vP0Zx636Vyl0BiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9356
Received-SPF: pass client-ip=2a01:111:f400:fe02::72c;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset should be applied on the top of [PATCH v10 00/12] parallels:
Refactor the code of images checks and fix a bug.

Fix incorrect data end calculation in parallels_open().

Split image leak handling to separate check and fix helpers.

Add checking and repairing duplicate offsets in BAT

Replace fprintf() by qemu_log().

Image repairing in parallels_open().

v3:
2: Added (size >= res->image_end_offset) assert and changed the comment in
   parallels_get_leak_size(). Changed error printing and leaks fixing order.
3: Removed highest_offset() helper, instead image_end_offset field is used.
5: Moved highest_offset() code to parallels_open() - now it is used only in
   this function. Fixed data_end update condition. Fixed a leak of
   s->migration_blocker.

v2:
2: Moved outsude parallels_check_leak() 2 helpers:
   parallels_get_leak_size() and parallels_fix_leak().
   
3: Used highest_offset() helper in parallels_check_leak(). Fixed a typo.
   Added comments. Replaced g_malloc() call by qemu_memalign(). Replaced
   bdrv_pread() call by bdrv_co_pread(). Got rid of keeping bytes and
   sectors in the same variable. Added setting the bitmap of the used
   clusters for a new allocated cluster if it isn't out of the bitmap.
   Moved the leak fix to the end of all the checks. Removed a dependence
   on image format for the duplicate check.
   
4 (old): Merged this patch to the previous.
4 (former 5): Fixed formatting.
5 (former 6): Fixed comments. Added O_INACTIVE check in the condition.
              Replaced inuse detection by header_unclean checking.
              Replaced playing with corutines by bdrv_check() usage.

Alexander Ivanov (5):
  parallels: Incorrect data end calculation in parallels_open()
  parallels: Split image leak handling to separate check and fix helpers
  parallels: Add checking and repairing duplicate offsets in BAT
  parallels: Replace fprintf by qemu_log in check
  parallels: Image repairing in parallels_open()

 block/parallels.c | 290 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 228 insertions(+), 62 deletions(-)

-- 
2.34.1


