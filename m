Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E0F36DB8C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:26:04 +0200 (CEST)
Received: from localhost ([::1]:56634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbm4h-00027w-Or
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxc-0005c8-U9; Wed, 28 Apr 2021 11:18:45 -0400
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:16352 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxK-0001nK-VI; Wed, 28 Apr 2021 11:18:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6MmsfREtAtH0tqBbf1lGsePYYBS60SmDWEflNUobpiJh68kWVVaXGColio0d4OSjbgEWpJi42W7kZWH3bPmRTdMUFi3NF7W3y9O1dJg3sFA0Y+9C65e0bapHR+RjqxIE1ZvNYKrAoxmyj/XkwPx9otfT/RtHSJh3ecPip6chDtxC4azGu6XrccWDQpBc1g7a3v+2ZdI5RPlxhJclJgfgHZgGHOnkrzduRsY4pHTRFAT6OyTF2+zypTUqulqfN4pxq2LtRZI4eW7B3XS/E/Sjd09XztrSH2GLPNNt+HLSwGEEHMvwkqKugZpsXT9NiUCaEoe5LN62von3TPozpLCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmI/JQpl8tLnlYSqcOP7oHGFsernNWShnkQ9Iq51KUc=;
 b=cS2bXALqxesoJ25/ri2bPFbJqcsjcVRmWiT0MFBGDP0V0HUdgbhjC9k378iAUeEBqViojdfdHUc44xS3ThQ0ed9sOBr5Zrjk2AngjVq471tA9DDE5LgEjgaY7Gtu64++LjNGMr10ft8hhn1uq6x2D8G1jAHIKgLKlF4n8/Lkq+v5TK8YQ+SU4P+V0sRNrYuiCQlKZDqskzWKSyFgB7naASotDxr+oUUuA7gSKItkCepapYp7f162MBHvsQfjiFrA2yulLqfHi0FYEJumcJ/aRTv5xrYpEclgNzkG4ProEMGj2655UyU/FLPs1nBRnQ8xJ29HcejXu5CJxgyXB2qUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmI/JQpl8tLnlYSqcOP7oHGFsernNWShnkQ9Iq51KUc=;
 b=N+mY3KThe/f+VJ0lCXubfOu6YYwNIq+7Mxoxgq3dYDF21eLzVnbJsK4nz49cA18bBsb0p3bm8XIu8zRGGoH/Mlf+S54Vr+VcGdJC/UjmZMwP3Hp/n8n2GiypAo6kVinh2GIgAj9z9hUrGAot05HgVh58WogMBT39W+n6OQJ/pFY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 00/36] block: update graph permissions update
Date: Wed, 28 Apr 2021 18:17:28 +0300
Message-Id: <20210428151804.439460-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc41ce44-7f42-499f-5abd-08d90a58dc0a
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5909ABDCAF6BF7C5292BDAEBC1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBux1HZQ/VG6aufkF0vj3vVL0+TwCLGvBHnka8s7WYg0F5nHjj2nIgys8/s8H+Bbo3Fx8s+Wdo5QR7jPbYubcHlbBTSp6+wVq6IH/L170oUAKnV1nnfyA306aFtOldjd693Ad5oqj17lpgdRfRnce0Gv5HQEVT0c+o5j1Ti6aWpM6Hl6UL8Y6tKfU2h19seB+v53py34OHUlu+Aw8VNvzevs9QBGeIUEvZ2Fj2U2r0bgaTqec5g8a3CqRfNwmd/WSD4y3ZHqcDi3E8dGEwAlMyICwDN1ZVB9aCwrzC9HqT/df1dFk9UNImnzZx1gSDFiXTK575EBy6tK2f4YQ9V20IEig9Nq5TEOIrMxV/Tvxj9FXGTQ6yPszdODi4wGBrvcxdES+QKCgjDYrcAhLu2KEmch+JLIEryTktfbxuqWlsTDACn9YoiQLBM96kZiGhDd7Ds2jfVwZsD6uOXZ4f8XAxSokOQvFFFnYGenjFu9G0WBD5/ruejKgT0+XjvxqpfrA6Fk5XOzC/IdtiKHF4XTk76Wq6sjXolHpJm+afujY4Gh88KL/Srs8a1X5Z0S75r1Kup8J0CyDQ+7afhszt6dXJ8DWJTRV6VDXQZCSx/UFt8wWh6K8IvN+ybVFqeKEWaFjycTE/P7VxUghjKFmHVTVprxHIbcBqKr/JEz1+ldI3W2nCs6AF4cL82+aZHe9xYdpgeUJFqC0R+74/6jvIoAvPqmn0QnlxHW+nHpQJhHr+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39830400003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6506007)(66946007)(26005)(86362001)(38100700002)(966005)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(15650500001)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0kxb0NVdnpVZUNyQkF1RTNBNk9WUXp3U2ZxSWRiZUJQTTdWVUZ2aWc1OU1X?=
 =?utf-8?B?MHJGM1hDTG9zRWZhWDBkRWxSd2dsM1d0aElRM2ljbHhPVElMY1JaNWJmS1Y2?=
 =?utf-8?B?ai9EZTl1WWdYaUR1MklheThkcklWVzhiNU5zQzE3enZFODQxdFFPNjE3SXNV?=
 =?utf-8?B?M2VxRWJVTDBtRjB5b2htMmE4Mk1GOVZhSW02RWhXR1ZoZ05USkp6ZjRIT2lL?=
 =?utf-8?B?ZXdCNGhkbmlMQk1VVmszbk56S2pNbUkySCtnZTdVbytMSmJ5TXhsZ3h5RDA0?=
 =?utf-8?B?eXo4dmdueUNQbURTOElUSGFPTE5SZkJqVTlqdE5ZWTYxWkpZV3dXT00zN2Zk?=
 =?utf-8?B?SlZ0T3BzNlRxZ0Vjald0ZzJXK3JIcE9zamF0QTJJR1hQU0ErVlZqc3RoYnUw?=
 =?utf-8?B?QjlXeTRjWUFwcktPdjRrOFpGNU9mR2VXVXlEZGFhaVdLc2FYVnVscGNveE1a?=
 =?utf-8?B?c0liK0syd1VNNDNFNzVOOXdpcEl2RXFMR1EzTmZUUVJ4YUtkblBpSzU3cDhJ?=
 =?utf-8?B?QXZEV0hkbDN6VEticXVjVFhGS1J3M0dWK09KSlVmaEtiN2dpRVM4RXJCNkgr?=
 =?utf-8?B?MERncGxnYnVYRGNXaTdBYlpTN3VvVjJqTTdmMlBYc2QrS2pQUTlnZFVFekl6?=
 =?utf-8?B?cytNUXRPK3NWSlF3MnNUdUZNUTBsbk8yQnNINS91YTRWQ2lpWTh6SXZNSVhJ?=
 =?utf-8?B?T01BNFBaM2JsNHJIVmhHK09vZDlRMnRiUUk2cE9EaGNMSEdGdkFhZG9ac09s?=
 =?utf-8?B?c0FiUUhvZnUvckRlSmpzanRTeUNSVUVYclJIWjgzSGQ5UjRlRDRYM1lhOERR?=
 =?utf-8?B?ZEJXNkNMdzZoVjZNb1VmR05TdGM2KzVDVkl3S1pUQzZXREs2RmprMHFoTGxS?=
 =?utf-8?B?K3hvdnhDdmpaUkErOWZDUG9pM04waEFSYlVpNyt3M0JTQjU1UFJIZ1NKNENy?=
 =?utf-8?B?c1pacjNGTndwMi94YTI1MlNQYi9nb3JXdWxydWh3aCtTYXJ3MTBmVy8yY3dW?=
 =?utf-8?B?Zk01SytWNlhrb3RPRUpoL1FNWlJwQmk0Z0RhVXNLTVR5QUdnK1dhdC9RZDZk?=
 =?utf-8?B?SStCd0JibWtiMTJsMVpKeWlMaUJVcUNDNWhkL1pZb2VnaHFYb0Y5eDM0MGdj?=
 =?utf-8?B?Qzl2V01RL3JoT3JTN0tjM2VUMWVKQ0NrTWRsalFpN2o1cTRJLytRdkY4eWh0?=
 =?utf-8?B?cEJyT2VqZEthQmx1enVVSjRGOWZQT2NUOHI1M2tTRExxcmVuWkk2Mk5hcnZ3?=
 =?utf-8?B?ZWdXaFh5c1BnZTVXMjVPZWUwV293NCt0U2Nrd1NYcVo0Ykd1Z25zeXNyakl1?=
 =?utf-8?B?elpYYjQ1d2U1ME5oTUhXaEZmYmcwdG5KNHJIR05oTmVTSzFIOXMyRXRxTnBy?=
 =?utf-8?B?bEtoWS92YTQ3dHRZM1hQaFFQTEF6eUp6OUFPZU1sL3NCbHJTSzI1V3RaQWhw?=
 =?utf-8?B?bXZVSEtwMWdjcncwd0FONmFNTW93QTNiMHpWbnlpMFJnMnYyMUVpcEhJclFB?=
 =?utf-8?B?VkpmeEwxWjU4Z0gyc0RkMUsrelJ2aFNkQzNlYTZscHI5MWlHdXRQSWt1V1hz?=
 =?utf-8?B?ZkM2c2ZKOUlBa001aVJiTzFBNlI2MzFIMVhUbE9BQ1lZamJmSG83ODBnMC8y?=
 =?utf-8?B?ZHAzOFRZemhVS21WelZ1dzRUZDlnZEdHemNMdFlVcTFCUWdrcDd5UzhEbksw?=
 =?utf-8?B?WW1HSkY3bWtRVmxrM0dkVWlJUWJGaDJDNEJJbFBXR0IvbVBBZ2lzeEl1dDRI?=
 =?utf-8?Q?nfYeYfrgXS9sQZM7kOCeJMBxZTHV2Kkp0AJQFAv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc41ce44-7f42-499f-5abd-08d90a58dc0a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:21.6588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AhlI4KAPT6rOMP0JdTGLdAn1pZ9wviISbwAtBqfhV8r827w8q6vWoT7GOy8f11W5zYpdMNOFBHo+BXXL33pjoiVU6+4q5w+vhHA7opyZCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.7.127;
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

And here is v4.

v4:
git: https://src.openvz.org/scm/~vsementsov/qemu.git
tag: up-block-topologic-perm-v4

01: drop misleading comment
04: add missed bdrv_unref to new bdrv_append() caller
08: s/Than/Then/ in comment 
18: add missed ".clean = g_free" to bdrv_attach_child_common_drv
    fix typo in comment
    qsd-jobs test output updated 
22: rewrite comment. I've changed your last wording, be free to return
    it back if you like it more. 
    
05,06,09: Add Alberto's r-b

all patches except for 18, for new test output: Add Kevin's r-b

===

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

 include/block/block.h                 |   13 +-
 include/block/block_int.h             |    8 +-
 include/qemu/transactions.h           |   63 ++
 block.c                               | 1329 +++++++++++++++----------
 block/backup-top.c                    |   48 +-
 block/block-backend.c                 |   13 +-
 block/commit.c                        |    1 +
 block/file-posix.c                    |   91 +-
 block/io.c                            |   31 +-
 block/mirror.c                        |    3 -
 blockdev.c                            |    4 -
 blockjob.c                            |   11 +-
 tests/unit/test-bdrv-drain.c          |    2 +-
 tests/unit/test-bdrv-graph-mod.c      |  209 +++-
 util/transactions.c                   |   96 ++
 MAINTAINERS                           |    6 +
 tests/qemu-iotests/245                |    2 +-
 tests/qemu-iotests/283.out            |    2 +-
 tests/qemu-iotests/tests/qsd-jobs.out |    2 +-
 util/meson.build                      |    1 +
 20 files changed, 1261 insertions(+), 674 deletions(-)
 create mode 100644 include/qemu/transactions.h
 create mode 100644 util/transactions.c

-- 
2.29.2


