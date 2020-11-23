Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC212C15C7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:28:31 +0100 (CET)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIRq-0001cb-RV
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICq-0003m5-AT; Mon, 23 Nov 2020 15:13:00 -0500
Received: from mail-am6eur05on2135.outbound.protection.outlook.com
 ([40.107.22.135]:5972 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICi-0007KY-0j; Mon, 23 Nov 2020 15:12:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnjI+yU1f3BMzKSld0iuoxuGZ7PgxIELFktAUubksRRKAQHieZRjK9qkYDoepnerxxR5O2qzRrt9BTFazRkz97s5BPtcBtPVQopTtZvOBN1ldj2cWkEoOJ/YrytYsAi6u7p0vaLQblyKcPzuCQM+Syi4blG3p+Fyz7q386w1lfTCS5nGUpx1mLnqV7JUeKGeSi+rPT5D8Z8PWgcXMmFkNXuvk+khi2yQP7wgISaL6ot07K+f3Pe3v3GJpfwaanWYV11sMdssJFMJ9O0jLXncp33+niolAqsZjACLesEFM0I/LFQSLSs1yYWtVcM+p8d215mpe7uxxIlXEts7E7Hbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps4DMs7PBopgZPfbxtCYyWv2YD5mTDNd7KNw9BPwRrA=;
 b=ocZz/a3SPjkiTCFKyO2dUFTlcIDsR8UmQsJD3oBpGIKcgU4Nu/Mnaj67HX64IF+ee73u7EeUSE8hVHzEO3MRtm/1XdkjVUpdZpvWHhvBczJ6P+dL00LWZMzFgzyKeFX1sKowWgiyjYFENELfddgmLJ30jduYHNLyhWobJEyPJdvS2SlsnhaQN0WBhMo3uhNf2kTEWMF9J1cJCv09Ssv5abBbjv3GDZtH8q8SPMBKwjIG4que9SjmF9HkeR8Kij+SQ8REyD7mZRPk8Ad2wvD+ZgRC/UlY9JnANfrZ5Ku9Amxj2Y4goW75/EVKIpGT0V290I6nYD0H4VOqS4yCcn4dlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps4DMs7PBopgZPfbxtCYyWv2YD5mTDNd7KNw9BPwRrA=;
 b=Ezg1Br1tkpwCSUPVvvAyy8c8Mnj/uXk3tAgF6mj7C2Df/Wlh/UvaC2uGSbCCfMjmjlOmfk+Ey227NntDcsF/3QvHFKlYmEtD745olf76pkBYmcobDgkZTxgi5gJg7zEgdv3Pt1BjqVhfQ5ZAlJ8BdGEk1r5qYAYlV49qCmnXjWE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH RFC 00/21] block: update graph permissions update
Date: Mon, 23 Nov 2020 23:12:10 +0300
Message-Id: <20201123201233.9534-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3088b560-cc16-4f72-f3af-08d88fec2520
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46908E045BD8E7E48BABA25BC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJAAcDwuBNE8QT5tRPZuPIsPrsfQlDf23dUCrpW4tVpCAwFKekzn9wb2tr5p6+K1s/VbTkk5EKS+DL6h0VXj0BFqmnARfanK4UGG0H+7IXd31MxtBANjd4P03UZ21rEJds8oC7R34Qg7MyjCEK++kiESSD8BZiI6yXsFq6xFlZWeF6Ju3bbDeqxfrj5aMAVL0cQh9S3xTv6v53XhphqCWgAaW3iBdYgNVUs8SDv6lFvMZIkTy6T8gLPvbqkfMe9qF6imUUbpLvAXtI/cZjCmnk7TuNh3SCrHz8LlQKmsjNQqdvxiLBhwRxCLOdWjAZFPkkA7uwdfQVnzQBUsSKfqGf+XDfSWlj6SlcvphTwnKlIIN9I99lv7xIDHC+N7ZblJ9ebE0inP1nPUL42zokVHaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(966005)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(15650500001)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ZJ6UfgIqRR/ShfEUbV1tN3uKtfosiKv2b7iMfuPayfsoeXn7RkM0vi2x/okC2MvdfeskLhIJe0bBA3HC+ODbukjuVrq8/t9SgWHXGNKEhnICHWw0M1m5nznqkAn/TNeDs8COTUk/o+aFcdhPbdB9goIh6dG9qTD5N7DF7OU05li7k19Coe/MJkcK5alOlFtDyLFARcrX7A5ImwBO6wGAhmDpCc4m3wr/PmhkIXV6PhzvySDMlBa5vpShjEp77XOYi8Oi+3gowKtVz6hdF3QFhM2zHyicd5DSKgL5ro4lzPK0iDnomUtxPYS52JcN65VpxK2X+XLMkh8OHJrUO0b9wC3701Jk3VFSaillQEBkNqnbCc9I90/HhPgwk5WbSqh3PBINGS6BxbS4MP7JBKAClk49yTqYoEX0mvABWlo+idrz9ua+bg75lP7G59PQVp18o7PaKWd8n+WIdhVgddsl0r73x8Gz6UisKqNRYRI8r0g/n6qaNVtsZEQ92I1zpeF3w0vgBXo8al5SKy8e3vnFUU08z7NsZ5vKPGMmjuMGdCYKnqFbPAXqEwA6wAdI08PC3BF0FK/ZNJsWvQMTngv6rvSgLxOOcetFUxzeG1aJJQ3hscNBGW0Qqk1TAQmYmZNvjdaclWt5DB9pM4Dz1lGOKwTyzxae/nwBuwqribYY5Jya4KZsAza1lwc2IYrdYvZmTWziw1vxreXjk2usr+V5tK7q74lRTNVLZ9h7Xq9vlGhNBjg0hsVNTniXaq6MKgT3mAOiB+il2SyrB2X1m2tReUEcCR+nC39eQ9RdI846PtAdEB+eW5QsNnbslpTm9BUlYluqSr+CiAgAwxY9Q2C90MDxEvCLI57k3eVC/s1wgcgnkUNA2Q9sG1XUs8UbdWfHLQtyTUOSuLeK68XESHcT/w==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3088b560-cc16-4f72-f3af-08d88fec2520
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:47.8731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RECCUY2TIYLzOqvx5TalGFf06q8Ip/hfI450WaAGmJRCLe30ysTv5Vlu58bvob3/gptUrbS8rWnM5QpHD+50j9/Bp9rs6n5ePTzxGqAURfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Hi all!

Here is a proposal of updating graph changing procedures.

The thing brought me here is a question about "activating" filters after
insertion, which is done in mirror_top and backup_top. The problem is
that we can't simply avoid permission conflict when inserting the
filter: during insertion old permissions of relations to be removed
conflicting with new permissions of new created relations. And current
solution is supporting additional "inactive" mode for the filter when it
doesn't require any permissions.

I suggest to change the order of operations: let's first do all graph
relations modifications and then refresh permissions. Of course we'll
need a way to restore old graph if refresh fails.

Another problem with permission update is that we update permissions in
order of DFS which is not always correct. Better is update node when all
its parents already updated and require correct permissions. This needs
a topological sort of nodes prior to permission update, see more in
patches later.

Key patches here:

01,02 - add failing tests to illustrate conceptual problems of current
permission update system.
[Here is side suggestion: we usually add tests after fix, so careful
 reviewer has to change order of patches to check that test fails before
 fix. I add tests in the way the may be simply executed but not yet take
 part in make check. It seems more native: first show the problem, then
 fix it. And when fixed, make tests available for make check]

08 - toplogical sort implemented for permission update, one of new tests
now pass

13 - improve bdrv_replace_node. second new test now pass

21 - drop .active field and activation procedure for backup-top!

Series marked as RFC as they are non-complete. Some things like
bdrv_replace_node() and bdrv_append() are moved into new paradigm
(update graph first) some not (like bdrv_reopen_multiple()). Because of
it we have to still support old interfaces (like ignore_children).

Still, I'd be very grateful for some feedback before investigating more
time to this thing.

Note, that this series does nothing with another graph-update problem
discussed under "[PATCH RFC 0/5] Fix accidental crash in iotest 30".


The series based on block-next Max's branch and can be found here:

git: https://src.openvz.org/scm/~vsementsov/qemu.git
tag: up-block-topologic-perm-v1

Vladimir Sementsov-Ogievskiy (21):
  tests/test-bdrv-graph-mod: add test_parallel_exclusive_write
  tests/test-bdrv-graph-mod: add test_parallel_perm_update
  util: add transactions.c
  block: bdrv_refresh_perms: check parents compliance
  block: refactor bdrv_child* permission functions
  block: rewrite bdrv_child_try_set_perm() using bdrv_refresh_perms()
  block: inline bdrv_child_*() permission functions calls
  block: use topological sort for permission update
  block: add bdrv_drv_set_perm transaction action
  block: add bdrv_list_* permission update functions
  block: add bdrv_replace_child_safe() transaction action
  block: return value from bdrv_replace_node()
  block: fix bdrv_replace_node_common
  block: add bdrv_attach_child_noperm() transaction action
  block: split out bdrv_replace_node_noperm()
  block: bdrv_append(): don't consume reference
  block: bdrv_append(): return status
  block: adapt bdrv_append() for inserting filters
  block: add bdrv_remove_backing transaction action
  block: introduce bdrv_drop_filter()
  block/backup-top: drop .active

 include/block/block.h       |   9 +-
 include/qemu/transactions.h |  46 +++
 block.c                     | 789 ++++++++++++++++++++++++++++--------
 block/backup-top.c          |  39 +-
 block/commit.c              |   7 +-
 block/mirror.c              |   9 +-
 blockdev.c                  |  10 +-
 tests/test-bdrv-drain.c     |   2 +-
 tests/test-bdrv-graph-mod.c | 122 +++++-
 util/transactions.c         |  81 ++++
 tests/qemu-iotests/283.out  |   2 +-
 util/meson.build            |   1 +
 12 files changed, 872 insertions(+), 245 deletions(-)
 create mode 100644 include/qemu/transactions.h
 create mode 100644 util/transactions.c

-- 
2.21.3


