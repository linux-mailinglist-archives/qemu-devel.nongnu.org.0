Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53112C6834
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:51:07 +0100 (CET)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif5W-0005uK-Nu
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0Z-0000nD-IY; Fri, 27 Nov 2020 09:46:00 -0500
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:40192 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0R-000369-JR; Fri, 27 Nov 2020 09:45:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQtCosh6r62Z4li8BUQrNkAmxXCQNKSb04y7umghtaJwM4ClgcpTNREX5D6nADJyzWfXbBJ73XsK1IATbFYvxx0Z7UY5KnC+WQexCnmYeKIVB7hRhoPTclXzlKO4gB5WrLDMrYNPNbeJtr60fPhlA9vCFw/Cc2tiPFgqVPV6Yl/oMdS1N1hspc5zSq4iVmGeWGdou1BpsRbTkgyOFrLenkxiC+/D1MlCz29UXxqjDEZUr8lD1Tp4npvmZ+3AcW/iuOlcFaVdG955BoSD2Z+HS097XZNXUkhTL222113jwTkjqOit+ymQfi+xj0roT+jDPxJfKSj5JyF++Ht0N5MPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWfpKV73n42x1nKNQT2bBcd1svkRFzuHty3dcTTJtEI=;
 b=T6P84rRPFQY265GuUa/hCFiOHuxA2gkbnUANfNa3s79qAPP5zxDkf3CvbYLrwiyxNIkopW3Z434Tr9IXH3I+M58dbPdhza5FlxSfiCIl+qCTtlHEnlOZTGSdh5Tbb6FVJ5eLrjbQxuJ1IV6DOhkw9xUUCqsPvyAMKCdjKXjP3sRSIgs0nmJhPzLGJ8c8OaUgAMJ0AmNexcCP4khgNT85GQWCxro1PrwEkExMnZ5DRYJMrvRWYs/xYCfL003fGWWLEIDgHEltAG9reUs0HQQUUPWndr6xFW7mUOVOFlIMD5qoCeY5DgE1lwrR/eQhiylbmP8pkFK+pYjTrB4S1GBp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWfpKV73n42x1nKNQT2bBcd1svkRFzuHty3dcTTJtEI=;
 b=GedyXl8qCIeUPUsCFxMxY70AsGGY6yCaVzgNMeHuHoHd3OBWKO1JZ0VYTgZARz7265uL6aJgO/1uFwwcfSZMzazRIzFM1s8Jb4XJ+Nv9x7AGh2PbUYuBZ3hCBh67IiZXEztsfaO4yB8B1M3PGmdej2ZiF8hmn5hIma3bXMSrdQE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5128.eurprd08.prod.outlook.com (2603:10a6:20b:e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Fri, 27 Nov
 2020 14:45:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:45:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 00/36] block: update graph permissions update
Date: Fri, 27 Nov 2020 17:44:46 +0300
Message-Id: <20201127144522.29991-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3526213a-7bc0-4de3-d109-08d892e31a08
X-MS-TrafficTypeDiagnostic: AM6PR08MB5128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB51280297886FEF3A1C889D16C1F80@AM6PR08MB5128.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jsWKJPUaW/5MFRPKw+aOMpZYukOFj5pA7JOpd5xORoP5OOnMs+u8B/ruPUXJWmaDDJjp4h1RsDkAMLXQz36uJkcN5Rj6b6KuwLrv6vtaRRjD0p1vWtNvjy3PPciR6zkvqt+L2d3tns1PYnN0ZpBh3v0fbGVKVV94cKF+gL0LqvXU1dDU+wV3lC9B151o4+Q5unwhVRn6P+mx95wPERVKvk80dvOVpj8xvO+KJ1z1gTT4sEoO4u7fVdcv4YNDUkg6ihEVeFt2mQQ+ZmOoE9K5cVhM0ze53cB4pszgvEfomNpk80biiEhhy7+jNhbM2+JZyfScJQSdi/r8XBnr+p4kKt6/ua7HzXzGoglCWagb+vdK9aa6/z2dDaABrwC7RmN3y8XeWTrHNkkG5QDpuHt7pQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39840400004)(136003)(376002)(66946007)(66556008)(478600001)(6512007)(2616005)(66476007)(6506007)(316002)(26005)(966005)(186003)(6666004)(16526019)(956004)(8676002)(5660300002)(6916009)(83380400001)(2906002)(4326008)(1076003)(8936002)(36756003)(15650500001)(86362001)(6486002)(52116002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0ExZnpaOEhLUHREMFczM21kZGgzOHlIcCtVV0J6QTNCQnZwZituYTEzQXBV?=
 =?utf-8?B?ZDBEWllQTlNLemFpb09lc20rMzRueFRtVHg3QSsxS2RlTzhPT0U4Q1hDKytV?=
 =?utf-8?B?SlpCTW9vZzlOYXVxVHdVWXZ5WjlLZ2xYRzZZb3lYVlRoUkU0ZVZUNGtDMjlH?=
 =?utf-8?B?VWlyK2dTQ280SXBFcVloUlZqdjRkU05ZdTd3YXFVa1JrTnhvUmZJWWFvYkJB?=
 =?utf-8?B?OWhrOU1CYnJHZmRRT1F0aCt0UkJFMEdsS3pRbkZxQ3o2YWExUlFjRUxmUlBY?=
 =?utf-8?B?VUhQT3RtbVkrdkdzcnhaM0tkQkxtWkN0aVZPM09PbnBmTGtmYTJhb1JOMlYx?=
 =?utf-8?B?eGI4VkFXak0yS1NPY21BMGQ3SmVYOFdNOUxmc2E2dGRKTFJqa05LVDdnWXZX?=
 =?utf-8?B?ZGw3ZUE4VzBSYm9UY2pXdkZNQWkxMjFJTEtPSnluNkxGMm8yR3dpclMzWlJ1?=
 =?utf-8?B?NFl0bml0Yk1VeCt2ak5DWmNoWGpINXZTa0hHaUVDOUpJeWEvQndMRjFqZVdl?=
 =?utf-8?B?Tk1JUTRCU24yRFRSc2VpTm0ycU1SaUQyeDNFako0TmxLZTMwK2hVVUFqUkRL?=
 =?utf-8?B?OUNRNEZGL3BINUZTL1FmeEJrZ2hxcStYM1lqanVtSUl2b1YzT2cvTUcxRTB2?=
 =?utf-8?B?R0xjT0p4NmtmMEMzY04rMU02TzBFSmNpcHF3ZS8rM0JGUHZJU1ZGWHlHRE1Z?=
 =?utf-8?B?c3pndmUyanl0a2oweVR0bS8rWWM4R2gxS3RMUUEyR0lYR1lFQWI4bFFUNWNt?=
 =?utf-8?B?VE5pOHpMYnlYTkJyOTEyT0dOcmM2Y1IybTFyTWU5RGo3Z3VUVE9XQ090YTdh?=
 =?utf-8?B?VUxJaVdqWlYybkJwYWNtRmVCN1YxdUZPMmdPT3Raa2lmcWtOeFFKQWNROVRG?=
 =?utf-8?B?KzFBOVhMc24vZG1kbmgvVzlhb1o3WG9HcmtDMFdFN0JSTHM4TW1VUXArOWFk?=
 =?utf-8?B?V3o2YkhRWlZvdS93Q1JwRSszWDJrOGt2cllOMGcyVUNkZEU2c09kR0p2eXk3?=
 =?utf-8?B?bEo0TTVCblV4a2hhQzdtU0JTS2p4ckxYNnhBbklXbm41NkJTT2YxejlTZk1s?=
 =?utf-8?B?NTI4YUZtYUNaZUYrL1ZyZDIycjZ2ZzJHTkNOOVVhdjJCU1g1emRxOUh6TGZ4?=
 =?utf-8?B?WDJiVm9LWjBGbE9oWjBrdHNzRDUxL2tQYWxPMkF2MlRIT3ZYMDhGWk1najVO?=
 =?utf-8?B?ODZuSmM0MytrcWJJQjVmWWVPZ1EvL2srdkhGeEZFVklQd2lqOHJhSjVpczJN?=
 =?utf-8?B?K1RqeGxPM3hTeDB4dmNQZmNpV1VOL0l6dVdrYWo0Z05Ydk9VQTFPaFlWTTNE?=
 =?utf-8?Q?W4Dq+vBf6hJHT/0yYcTYxz/OtnBnC8uwSc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3526213a-7bc0-4de3-d109-08d892e31a08
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:36.7321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ixV+D29oq8JIhdhRmJWqwm7kDJ1N9WwYDNbCi6KQT1qLXN+h+451dGoHwAqFL9F0T3XaGRgxLtXHIjN4550eChHauGp7mk1vOUVceEOUO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5128
Received-SPF: pass client-ip=40.107.20.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Patches plan:

01,02 - add failing tests to illustrate conceptual problems of current
permission update system.
[Here is side suggestion: we usually add tests after fix, so careful
 reviewer has to change order of patches to check that test fails before
 fix. I add tests in the way the may be simply executed but not yet take
 part in make check. It seems more native: first show the problem, then
 fix it. And when fixed, make tests available for make check]

03-09 - some perparations, refactorings which may go in separate

10 - new transaction API

15 - toplogical sort implemented for permission update, one of new tests
now pass

19 - improve bdrv_replace_node. second new test now pass

26 - drop .active field and activation procedure for backup-top!

30 - update bdrv_reopen_multiple. At this point everything is using new
paradigm of permission update

31-36 - post refactoring, drop old interfaces, we are done.

Note, that this series does nothing with another graph-update problem
discussed under "[PATCH RFC 0/5] Fix accidental crash in iotest 30".

The series based on block-next Max's branch and can be found here:

git: https://src.openvz.org/scm/~vsementsov/qemu.git
tag: up-block-topologic-perm-v2

Vladimir Sementsov-Ogievskiy (36):
  tests/test-bdrv-graph-mod: add test_parallel_exclusive_write
  tests/test-bdrv-graph-mod: add test_parallel_perm_update
  block: bdrv_append(): don't consume reference
  block: bdrv_append(): return status
  block: add bdrv_parent_try_set_aio_context
  block: BdrvChildClass: add .get_parent_aio_context handler
  block: drop ctx argument from bdrv_root_attach_child
  block: make bdrv_reopen_{prepare,commit,abort} private
  block: return value from bdrv_replace_node()
  util: add transactions.c
  block: bdrv_refresh_perms: check parents compliance
  block: refactor bdrv_child* permission functions
  block: rewrite bdrv_child_try_set_perm() using bdrv_refresh_perms()
  block: inline bdrv_child_*() permission functions calls
  block: use topological sort for permission update
  block: add bdrv_drv_set_perm transaction action
  block: add bdrv_list_* permission update functions
  block: add bdrv_replace_child_safe() transaction action
  block: fix bdrv_replace_node_common
  block: add bdrv_attach_child_common() transaction action
  block: add bdrv_attach_child_noperm() transaction action
  block: split out bdrv_replace_node_noperm()
  block: adapt bdrv_append() for inserting filters
  block: add bdrv_remove_backing transaction action
  block: introduce bdrv_drop_filter()
  block/backup-top: drop .active
  block: drop ignore_children for permission update functions
  block: add bdrv_set_backing_noperm() transaction action
  blockdev: qmp_x_blockdev_reopen: acquire all contexts
  block: bdrv_reopen_multiple: refresh permissions on updated graph
  block: drop unused permission update functions
  block: inline bdrv_check_perm_common()
  block: inline bdrv_replace_child()
  block: refactor bdrv_child_set_perm_safe() transaction action
  block: rename bdrv_replace_child_safe() to bdrv_replace_child()
  block: refactor bdrv_node_check_perm()

 include/block/block.h       |   20 +-
 include/block/block_int.h   |    8 +-
 include/qemu/transactions.h |   46 ++
 block.c                     | 1319 ++++++++++++++++++++---------------
 block/backup-top.c          |   39 +-
 block/block-backend.c       |   13 +-
 block/commit.c              |    7 +-
 block/file-posix.c          |   84 +--
 block/mirror.c              |    9 +-
 blockdev.c                  |   33 +-
 blockjob.c                  |   11 +-
 tests/test-bdrv-drain.c     |    2 +-
 tests/test-bdrv-graph-mod.c |  122 +++-
 util/transactions.c         |   81 +++
 tests/qemu-iotests/283.out  |    2 +-
 util/meson.build            |    1 +
 16 files changed, 1100 insertions(+), 697 deletions(-)
 create mode 100644 include/qemu/transactions.h
 create mode 100644 util/transactions.c

-- 
2.21.3


