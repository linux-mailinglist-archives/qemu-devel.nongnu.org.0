Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451E533F33F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:41:21 +0100 (CET)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXMO-0008J7-62
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHS-0004CN-6j; Wed, 17 Mar 2021 10:36:14 -0400
Received: from mail-db8eur05on2126.outbound.protection.outlook.com
 ([40.107.20.126]:5793 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHK-0006mZ-Rc; Wed, 17 Mar 2021 10:36:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqKL+do1/RAILJhziIWdKNCfBzWX7N1Z4wp1FPpvoI/PLUfSimofIZJgceWlOU2Rs+aehcnwoJDTKk/SwVZvevaG4oj1R50gag53tJaQg93qOGsFBJ/EGSjzLx70cIfmzsQPbPRujNGu3r8tVk8HmunOpVgNJscq5uBH1LEaBtQ4ELlWxI3NoD0nD10pEMPCzcXygychxQ88QZtBDIWdBUfhOZCbXBclOpFDI94l1Vu1Grs6uoq2PjXRhLu2H2cmJ1sOW5rAXX3Yvnkfht3lM0R9yviHtk4lSilSo60Jksej1z1OBt/jSHQTtfYDx25RU0HJbqZZi1zinFppVj58mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBx0Y+1DFUnxCI1e38HpVAyoKWXWvlI8WcuXbJN+luU=;
 b=PZyqGZdAZvF8f2qpNWYoYNE9a1mODeW+Pziv9bIWqO12vWskIpoiyuejWE7vzlBO7xOrc6pWec4ifQYDq39DG+zWt1GHmtMjVXvWwviUZ+/Rupz3EgGMm7P4GniiXoCX7cLoNvahgv9QEuqArmCwYp3Mzpkffx1gAwEwB8ZY6GfOl69dXG8QlZvHwskowHYqjKiwY3ojl047P/Hzsgio2SjjJF6ZFwHbpTrLyEWjScj6W8tafo6IvX8LiVlyWFFZme3Q4hm5AEjSbNGRKTD6p+oT2OyouNvn13EupE0m0Hd4XOMTE/GSSHpc6P0rDcAwyCGJCz5a/38i1xDXXdeJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBx0Y+1DFUnxCI1e38HpVAyoKWXWvlI8WcuXbJN+luU=;
 b=OFIFP36o4BcupcsPoDSON6oZ1TKnukr0c7XvufO5sfNWH40O6p2k3VqN2+3QRHu+kLcQJJT9bR/CPKGWvTD6X8O5BzoGmy5DGbX5QvPSvDxs8YHsGHZpRHtpGrZwsrsrETY6cixPVV8lULGjbym2/CNcAMjEUeRgSGdG4YZj8uQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 14:36:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 00/36] block: update graph permissions update
Date: Wed, 17 Mar 2021 17:34:53 +0300
Message-Id: <20210317143529.615584-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 877702e4-bc99-450a-28c0-08d8e951fc75
X-MS-TrafficTypeDiagnostic: AS8PR08MB6008:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB600839DA84F661572ABA01A8C16A9@AS8PR08MB6008.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /fgiPld5Ubgo6i8n0r3ENeQeGAPQKW3sGv2R2h1daxN5wkvwxGyCt4ZklOdFMW/g5YqbEZLc/GhqXFnp1wbEdWAhlCDrv5IUcB3k8BeQQi1Nt4p2laeo2zis+jFsJIoJwh67RcQoj9NjcrXFfUlVxh6L9QAL+K+oiUrLdJA71B4XyVukdgsLB+g0A5dtVBQczlF6YkQgYRWGNTYrk34hT29Q6aUJts7BNHeRtwHyHzS69nQBXzeNrK965zXcHrfPwt8ugE5UmSe5xxVDC4iTkYKXnzxVDb0b3WZqUpicDWVKTv5SggSQtBCwxbKQlE3CAcfZJCyh9ulit085TupJIeo/IxYBUs4/r3OWM/J1I34UIeOTqR/vx+4zeNEDT89lejgmOuimRS72SOSP4EcceQJAjEje3l9vYBzmpx8JLQo6usCOGyPUgKGHqGCP+IjzP4mWWbWvvyGxn2i3nyqjNlz3HnpA0DnA/JjMeAzvGTVqWEWREfsfsv1EF2TjgnQN1ABGhUJL3FpWO8DWSOzE34jOPW9YDPSInwQKKqgthj++4m4uyQmDfXJfxFSVyC/R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39840400004)(52116002)(966005)(26005)(36756003)(6666004)(8676002)(8936002)(6506007)(4326008)(6916009)(5660300002)(15650500001)(66946007)(6512007)(478600001)(316002)(83380400001)(6486002)(66476007)(16526019)(186003)(66556008)(43170500006)(86362001)(2616005)(1076003)(956004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NFdDOGN2UktvbnhvS29pbjByVDh5a2ZDWUFRZDUxRDhud0FhUXpsalFhZ1F2?=
 =?utf-8?B?VEIzQU9vcTY5YnhHemxCSlowNnkvMzhkeXpKTVZhUzFXZ0ZlbHAxaitkU2c5?=
 =?utf-8?B?QmtndHZ4a3duYkhvSjMwSEhEcGNiN1R2bTZ3dWZ1RW9YS1NCRmxHYWE3eS9F?=
 =?utf-8?B?bFlHVVMvMVpNZWpqd3gyUCtDQU11c3Z2d2l2OWVDSUVOK3JyRlplaDVmNVdT?=
 =?utf-8?B?UmpIWDhVTUZZRjZyaGd2TUxTS1JITGhnTXBISGtXdFNhWlg5dSthU2d3cVRJ?=
 =?utf-8?B?dWNsbEJjZlB6MU9kQ3M0Ynd0OEdwQ2ZkcU5BNW45UUZYOXdZajB3R1JZYSs0?=
 =?utf-8?B?UW14Qy9Ib21XTmNmSXVST04vaTFTbDhRZWJXbFA1dWxWYUsrSTA1S01VeTVn?=
 =?utf-8?B?enlhbTAxRVBJc0J6aVZoaitDN3VxUm9TeHA5ZVJPRytKa1AxRXZGS1RDVnc3?=
 =?utf-8?B?UlpRektHZjhUTmJzODBGaHZqV21nVDBNWWNtcUxEQ2tDcnc3VWJjVVpEdExz?=
 =?utf-8?B?d290a0VBTnhRZHkreHJ5djA0ZlpGSzcxemMxdE1YNGtJb3BYYjNRaUxOa3No?=
 =?utf-8?B?QjhjVFRTWmJsVzVodXVpUHhXYWRTK0taeWc2d2FpT2VwQWp3dHVqallqS29z?=
 =?utf-8?B?SDF1R2dNWE9yVklUYVQ5TEp3S2g4ZTBkWmtadGI3WkVDazFxeDU3UVFDdXZI?=
 =?utf-8?B?SnBjTVByYzBVcE5iVEIxNy9Zc2FoaUE3SWhHeGpnUDNudllqWW4zSVhWMmR2?=
 =?utf-8?B?VGlGSWN6S3FGa0k0UUNpR3RhZWxmSDRrMG5pV2lMNXRjaGZ3bndqZE9Lb0hp?=
 =?utf-8?B?NGNPQTRhTUtiVW9IMFlnVHdlOE9ITVJYQVJkWC9hY2VBL05Wcnppa1VsNE8y?=
 =?utf-8?B?T2RsN3lXRUUyYm9YMlR3ZHZ2c1EvMTdlM2NaRTE5bkl6UHFrVGhSek0yWDFJ?=
 =?utf-8?B?LyszMGJPcVlGdzlKWnlJZzZSbGRrdEM0SXh3dVRwMFVsL21EMFljSzJMdVJr?=
 =?utf-8?B?Qm9ZajN2dlhSKzU0VlQrRkJPSlhYd0pFZ0VHM082UmdvV1R2RDNRSlVFMDBl?=
 =?utf-8?B?UFdEZjMyc3FiSmdPZ2krZmV1bjg3TWpmcmNSeHNtVnR6eWlENmlKVUJJeHB4?=
 =?utf-8?B?Zzg3dGt0TUxHNHNkcHhlREN3K0owUXBRb0ZzemE1S2JobVRVZkVMamNaSXZX?=
 =?utf-8?B?eU5DY2Z1dC9GNmxjR2wxZWtYWGs0U2Q3K2RWNllHbVViYzBwZHpIVXd3MXNx?=
 =?utf-8?B?aENkakR3aDBSK1lPbkNucStNallDWTdSdjF0QXN0cWZyUTNSUVZ2aXJPNDkx?=
 =?utf-8?B?cVhhbW5PbE5ud3hiOXpIcXRpeXFhZlpiUHBhUTQzWk45YXg2OFhSRzNnVjR5?=
 =?utf-8?B?OVlHaXVPWUFOV3RnQWV4RTViQmdXN2lEVGdRZzFCaDF5Qk4xQXl0cXZTRDdI?=
 =?utf-8?B?TWxOVUVOM3l0aU5qL2h6QmFMWjdJTkMxUTFaUlBsTWtUUUVDZzZWSkFVdEhl?=
 =?utf-8?B?VDNYRm9mVWRFN056RnUvMDZmRHBCMEtBeThaNlB3b0JLbkVXU1JVaUd0TFJM?=
 =?utf-8?B?Zmd2MldyWFVpc3FGRWsrUXkvd1VDeVR3TmVEUGdMc1Q2LzMvbnJJMWhQdm82?=
 =?utf-8?B?K0lCYVZRSXVOV1QyS0I0cnZ3SDRCTWw2VkRaNXRDd1VOdzVqaTJGUC9uMTNQ?=
 =?utf-8?B?NUdpeldNaWpzUXNQS3hBMk5qMHFpbzVzalRzUVJxaWxGUkdKVWpmRGM5Qktv?=
 =?utf-8?Q?NKBCDbqFsq8pXtzMulQJgGpyF0f3UrFPZ96ppi4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877702e4-bc99-450a-28c0-08d8e951fc75
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:01.7940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0g4zYqsOu5dDFZxmPNZSMSbK6Q98jpt52baPoQ5Xo3dNDBEnOXrhaORLkf6zGq6o3kOH3DbB4PoqXg8hMqafzF+Ry0pLn8Z9YhEOKrHfhDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
Received-SPF: pass client-ip=40.107.20.126;
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

Finally, I finished v3. Phew.

Missed a soft-freeze. Should we consider it a bugfix? There are bugfixes
here but they are mostly theoretical. So, up to Kevin, should it go to
current release or to the next..

The main point of the series is fixing some permission update problems
(see patches 01-03 as examples), that in turn makes possible more clean
inserting and removing of filters (see patch 26 where .active field is
dropped finally from backup-top filter, we don't need a workaround
anymore).

The series brings util/transactions.c (patch 10) and use of it in
block.c, which allows clean block graph change transactions, with
possibility of reverting all modifications (movement and removement of
children, changing aio context, changing permissions) in reverse order
on failure path.

The series also helps Alberto's "Allow changing bs->file on reopen"
which we want to merge prior dropping x- prefix from blockdev-reopen
command.

v3:
git: https://src.openvz.org/scm/~vsementsov/qemu.git
tag: up-block-topologic-perm-v3

01: move bdrv_ref(), add comment, add missed bdrv_unref(), update copyright msg
02: move bdrv_ref(), add comments, add assertions and missed bdrv_unref()
03: new
04: drop questionable comment, rebased
07: add r-bs
08: improve wording, add more comments
    refactor to use explicit Transaction structure type and typed list
    add note in MAINTAINERS
09: renamed, was "[PATCH v2 11/36] block: bdrv_refresh_perms: check parents compliance"
    function renamed to bdrv_parent_perms_conflict() (and return value is the opposite)
12: add Alberto's r-b
13: check outer condition in outer loop, add comments
17: rebased, fixup of another patch is moved out
18: avoid forward declaration
    keep old logic for error path in bdrv_attach_child_common()
20: rebased, now EINVAL should be first error in new bdrv_replace_node_noperm()
21: rebased, add comments, add missed call to bdrv_refresh_limits()
    new test append-greedy-filter(patch 03) becomes enabled here
22: was "[PATCH v2 24/36] block: add bdrv_remove_backing transaction action"
    Rewrite to support filter child
23: improve comment, add assertion, support removing file-child-based filters
24: rebased. It now effectively reverts 705dde27c6c53b73.
26: new
27: new
28: rewrite with more clean transaction actions (no nested transaction!) and closer to original logic
29: new, instead of worse "[PATCH v2 29/36] blockdev: qmp_x_blockdev_reopen: acquire all contexts"
30: remove unused fields (perm, shared_perm)
    keep "ret = -1" at top, set it to 0 before "goto cleanup"
    add comments
36: update error message, update comment

Vladimir Sementsov-Ogievskiy (36):
  tests/test-bdrv-graph-mod: add test_parallel_exclusive_write
  tests/test-bdrv-graph-mod: add test_parallel_perm_update
  tests/test-bdrv-graph-mod: add test_append_greedy_filter
  block: bdrv_append(): don't consume reference
  block: BdrvChildClass: add .get_parent_aio_context handler
  block: drop ctx argument from bdrv_root_attach_child
  block: make bdrv_reopen_{prepare,commit,abort} private
  util: add transactions.c
  block: bdrv_refresh_perms: check for parents permissions conflict
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
  block: add bdrv_remove_filter_or_cow transaction action
  block: introduce bdrv_drop_filter()
  block/backup-top: drop .active
  block: drop ignore_children for permission update functions
  block: make bdrv_unset_inherits_from to be a transaction action
  block: make bdrv_refresh_limits() to be a transaction action
  block: add bdrv_set_backing_noperm() transaction action
  block: bdrv_reopen_multiple(): move bdrv_flush to separate pre-prepare
  block: bdrv_reopen_multiple: refresh permissions on updated graph
  block: drop unused permission update functions
  block: inline bdrv_check_perm_common()
  block: inline bdrv_replace_child()
  block: refactor bdrv_child_set_perm_safe() transaction action
  block: rename bdrv_replace_child_safe() to bdrv_replace_child()
  block: refactor bdrv_node_check_perm()

 include/block/block.h            |   13 +-
 include/block/block_int.h        |    8 +-
 include/qemu/transactions.h      |   63 ++
 block.c                          | 1322 ++++++++++++++++++------------
 block/backup-top.c               |   48 +-
 block/block-backend.c            |   13 +-
 block/commit.c                   |    1 +
 block/file-posix.c               |   91 +-
 block/io.c                       |   31 +-
 block/mirror.c                   |    3 -
 blockdev.c                       |    4 -
 blockjob.c                       |   11 +-
 tests/unit/test-bdrv-drain.c     |    2 +-
 tests/unit/test-bdrv-graph-mod.c |  208 ++++-
 util/transactions.c              |   96 +++
 MAINTAINERS                      |    6 +
 tests/qemu-iotests/245           |    2 +-
 tests/qemu-iotests/283.out       |    2 +-
 util/meson.build                 |    1 +
 19 files changed, 1252 insertions(+), 673 deletions(-)
 create mode 100644 include/qemu/transactions.h
 create mode 100644 util/transactions.c

-- 
2.29.2


