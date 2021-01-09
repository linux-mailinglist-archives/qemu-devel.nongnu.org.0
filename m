Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA782EFEEA
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 11:14:10 +0100 (CET)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyBG5-0000mX-7p
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 05:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyBF0-0008V0-LK; Sat, 09 Jan 2021 05:13:02 -0500
Received: from mail-he1eur04on0722.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::722]:22532
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyBEy-00029q-Hm; Sat, 09 Jan 2021 05:13:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcjH+AdsRJWxKrtEPTGJ2h7e3PQHsIrpayn/OucuIVk7yxJQQdWD1UqNWDFot4YVzDA3Ac8GbJzNKmgXqlEloP+Ib2uK274datJcF6D2uhvc7CExaujtxkm/QLoW6OzFfKLbkUU65MNxKt2a3YTVHeG1Br3jFte0Bru0wu6sh6TV4EuW6lDSNTvFOeMFK373Uxo72djY8UfK27PqQqYsJksqdIOEjgTRp9tHVDlW9kp/UfiYuNGsv9ZwA4igk+PdB36C/+9cB8hbe2BSAnIvZPevpC0YROm4YZc/nTK5GgIs7IfQ+xygDY/xv4WG3KFPeOJft6boyDlHkj8BHf3N9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7rhwYBpB+YG33pVQenmlCPZOeIooiy31gZpb0lDSFw=;
 b=Vrnxn2GQK7H8ClffIu9/Rk5RqBzMHZw6N5rXkmVkevoHg1a1gTu5OR6N2TQGsyMb2IEtMoRhI78c3M+opBDJ1Y9GzVe66Qs53PvO4Q9pMH0kN572apRjwxN0ijDfx2V5oNt1PTNexLddDY/c/QGqelQgMuesa/5e0aoIeh3+uKRq/KGldkVnD5aO4xQjBwgg4/uik4qvK1yjZ0zC20UmlsHHn+sxBTgtK187CqALtkFXM7gW1HVoSZ14Tg3Ni1p2QPhF+9CK1xTsmgsXptYbvu4V01hE/RsLPcT9sTubDux3nTiU0wTIES/DKDSkJuFGoyJ3XJfbj9y4XBTKDG3xsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7rhwYBpB+YG33pVQenmlCPZOeIooiy31gZpb0lDSFw=;
 b=Dorjk6/D4XotD1PzkFRTbuaeBheaSSgBy44bGpxL2DHPOjqPOk4kdwDbELHr9vP3HLvqgWRj9arxHE3ECw8n8CiBywUzhK4fprQOj8sbvpworvFJi+ahZ3oiR4g5EskxG3N7W0MPIFpwv4rxKdaQbFXYiZX+2Cc5I34hApX6/6M=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 10:12:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 10:12:44 +0000
Subject: Re: [PATCH v2 00/36] block: update graph permissions update
To: qemu-block@nongnu.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d0f95cfd-c444-0113-3c80-fe37df3217aa@virtuozzo.com>
Date: Sat, 9 Jan 2021 13:12:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM9P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.119) by
 AM9P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 10:12:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26743a98-3ed1-44eb-665a-08d8b4871b4b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB628063CC3A2E20B2CDD0A5DFC1AD0@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j9puzRTRC+2CQJQPvr6cb7oOlYXqb9LEX4sUF/iq/7tcx9Npkg7UcQqWdROz2PRYcAN4A7y8hpV56ynvWXbdRNWo0dcmbOr6H6TVrEt6wNqaZMLlej7BZoidCNwtWPx9Gv8us0PTkQAJIDQMHRpApxxCBDlYqOsfIFAX4HnNQKswfgEQ/AhVhGrP9BEn5PSfIEfIzIaCwLfyJ/H/ggLPZGBpSJmfwHhMR4eqJ+U8JXmLhpgX3Dd3dNgj7/jjneg0+YntTNjGbqfRYU8W6FpYW++IyFSScb8hEYIlJHihdHobzCsfVGxao/5+cKdb3i2Sq5RP+M0G5CReJ170IsjyVLPz8I1eQqWb6KyLGSUtgF1/NuIOnj6NRzrcctIKk5SI7OocBIeuYHE03k8mD6zryti5STsgzgplqyjgR5tlZb5fh7zKQ/Sw0qAVu4NX/H6tsU7+kMr7ZZNcgJHSSPim/j3FsFhrAtyJBwC8SoENw7d2Se3UZj5dbzP60rn1if2n35tib+QEyJ2r4+Kd5ToBIb3oJ+w9ZVYqiwcMKNWMy+ytiTh4HfDzvlNqhsYeIrug
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39840400004)(6486002)(83380400001)(86362001)(16576012)(36756003)(478600001)(316002)(5660300002)(31696002)(31686004)(66556008)(966005)(2906002)(66946007)(107886003)(6916009)(8936002)(52116002)(2616005)(66476007)(956004)(15650500001)(8676002)(4326008)(26005)(16526019)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUJZOVY1N0NKeE9FZnNTckRNZ1pVRG9SRXA4ZEZ2MWlQOFdyejcyU3BkSEw1?=
 =?utf-8?B?STVieTcrTnRsTy8rSCthTTRZczVPOW1ZSXNSc0xXdnU4TnlBSm14OUs1d0ZP?=
 =?utf-8?B?cDUxNkcydzBIK2hVNXNyeTFrM0UrRU1XVTRzb3B1ME84eEpMcjl0TlFKbkpW?=
 =?utf-8?B?dHREaVJ2M2J0OUs1REx6NldsWnpJdk90eVhzTStnRmFyVGE0ZjArOUNONnpJ?=
 =?utf-8?B?YXpWL0d6cVdtTjY0QmQ0MWpYWUpSY3NNUTVIOVR0ZnlHMWsrSWRUSkoxZzBT?=
 =?utf-8?B?WmVPdU43UDZzMTBlN2lEVUxreDRmeVAwYk9zWGs2M1hGcGpUVERFV0FBMnV5?=
 =?utf-8?B?UXN5dWRHbWdyTW5qcGRKaWNIQ296SDduQitKTmcvMFR0SUJ5elZNNDRGQWxm?=
 =?utf-8?B?MFR5dU5GbzR2Qm02WmtCRlZYNE9lWTFjSG9UdElaYkthQnN4Tkg2Sjh0SGFR?=
 =?utf-8?B?b1VOZUNoT3pLS0pqbUNBY3RTY1llaUlZa082YlNRb1l2dzE3OHNMWUlYcm1q?=
 =?utf-8?B?ZHQweGRJUjNzYWFydlJzOGQ1QnYydkF5ZmhoYU92NnNxYXFEeG5uZnB5UjlF?=
 =?utf-8?B?RktjdjhsM0l1Z0VXTE1SWEJPam1lWUtXdHpKQldjMHNjWGs0dGZXTXRiSURY?=
 =?utf-8?B?dmVad2k4WlhnRkR4QVR0K0J0dzJSeUhQUHVUOXNhb3BuN2Z5Uks5VktrYTJi?=
 =?utf-8?B?bkJOUWN3Ym8zSWt6aEdXQ0E2VFN6U3FkNjV2WHVOYkZlaytwSm5Qd0x5M21D?=
 =?utf-8?B?a1A5NVpkYlZRQ1luTXgrMWtSemFwWHJYL1VIT3ZqTEVpaVMxbWp1aDNmVGNj?=
 =?utf-8?B?UEZoYWNMKzJabDN2U2t0ZWVVMkIxTEtUMXh2Sk1Md21FZklicWlMRk8wbkFM?=
 =?utf-8?B?MTNzM2NxRFd1K1NlWmhyVHQ4eGJ1dldlSkNKZzBGOXk3OC9hSDVDRUJpak5X?=
 =?utf-8?B?Yml3SXVOamdodTVSajF3MmlGT3hXb3RJeExOSVljZm1OVFJXYkx3OXZ4UU1x?=
 =?utf-8?B?Y0JYbXUvUmJWWmlSN05Hc29FYm5udzJNVjdlVFN0TGw4bGMxOFp3U3NEK2Iv?=
 =?utf-8?B?V1NESFBxSm9rSXZoWmRxT2Z4bTRQc05Ld1lPTkI0cVlBcnV2azAvYStwNmdo?=
 =?utf-8?B?MGllaGN2cmZsS2pqcjVPQ2ZpcklYVXNoYlBaQ25nMVd6c1l6MWZOY21tRmF0?=
 =?utf-8?B?NjRsbW93ZmEwanRJcTNBelRUWStYYUxpUHJNVXFqeCt3TlJITVhPbFhXdU85?=
 =?utf-8?B?djVtTk1lZHdlVzVwVVREb3FLNWx3d1I5YlozSVd2ODVJd0t6MkE4ckZxeU5j?=
 =?utf-8?Q?UIgH/7hNOQukIBOqikeOAjeXD1PY+tYLTL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 10:12:44.3868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 26743a98-3ed1-44eb-665a-08d8b4871b4b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjFrLkBU3lFGGGzzJTOMzc+g/9V3Ia7HMJx63yPYRVbEuDanYtH2Yj6T+Jx9uOdhQfH/0UmEsb48Z7hknSM4kGyTElSDDLfqSkHvZwTS6vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=2a01:111:f400:fe0d::722;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.241, SPF_HELO_PASS=-0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

27.11.2020 17:44, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Here is a proposal of updating graph changing procedures.
> 
> The thing brought me here is a question about "activating" filters after
> insertion, which is done in mirror_top and backup_top. The problem is
> that we can't simply avoid permission conflict when inserting the
> filter: during insertion old permissions of relations to be removed
> conflicting with new permissions of new created relations. And current
> solution is supporting additional "inactive" mode for the filter when it
> doesn't require any permissions.
> 
> I suggest to change the order of operations: let's first do all graph
> relations modifications and then refresh permissions. Of course we'll
> need a way to restore old graph if refresh fails.
> 
> Another problem with permission update is that we update permissions in
> order of DFS which is not always correct. Better is update node when all
> its parents already updated and require correct permissions. This needs
> a topological sort of nodes prior to permission update, see more in
> patches later.
> 
> Patches plan:
> 
> 01,02 - add failing tests to illustrate conceptual problems of current
> permission update system.
> [Here is side suggestion: we usually add tests after fix, so careful
>   reviewer has to change order of patches to check that test fails before
>   fix. I add tests in the way the may be simply executed but not yet take
>   part in make check. It seems more native: first show the problem, then
>   fix it. And when fixed, make tests available for make check]
> 
> 03-09 - some perparations, refactorings which may go in separate
> 
> 10 - new transaction API
> 
> 15 - toplogical sort implemented for permission update, one of new tests
> now pass
> 
> 19 - improve bdrv_replace_node. second new test now pass
> 
> 26 - drop .active field and activation procedure for backup-top!
> 
> 30 - update bdrv_reopen_multiple. At this point everything is using new
> paradigm of permission update
> 
> 31-36 - post refactoring, drop old interfaces, we are done.
> 
> Note, that this series does nothing with another graph-update problem
> discussed under "[PATCH RFC 0/5] Fix accidental crash in iotest 30".
> 
> The series based on block-next Max's branch and can be found here:
> 
> git: https://src.openvz.org/scm/~vsementsov/qemu.git
> tag: up-block-topologic-perm-v2
> 
> Vladimir Sementsov-Ogievskiy (36):
>    tests/test-bdrv-graph-mod: add test_parallel_exclusive_write
>    tests/test-bdrv-graph-mod: add test_parallel_perm_update
>    block: bdrv_append(): don't consume reference
>    block: bdrv_append(): return status
>    block: add bdrv_parent_try_set_aio_context
>    block: BdrvChildClass: add .get_parent_aio_context handler
>    block: drop ctx argument from bdrv_root_attach_child
>    block: make bdrv_reopen_{prepare,commit,abort} private
>    block: return value from bdrv_replace_node()
>    util: add transactions.c
>    block: bdrv_refresh_perms: check parents compliance
>    block: refactor bdrv_child* permission functions
>    block: rewrite bdrv_child_try_set_perm() using bdrv_refresh_perms()
>    block: inline bdrv_child_*() permission functions calls
>    block: use topological sort for permission update
>    block: add bdrv_drv_set_perm transaction action
>    block: add bdrv_list_* permission update functions
>    block: add bdrv_replace_child_safe() transaction action
>    block: fix bdrv_replace_node_common
>    block: add bdrv_attach_child_common() transaction action
>    block: add bdrv_attach_child_noperm() transaction action
>    block: split out bdrv_replace_node_noperm()
>    block: adapt bdrv_append() for inserting filters
>    block: add bdrv_remove_backing transaction action
>    block: introduce bdrv_drop_filter()
>    block/backup-top: drop .active
>    block: drop ignore_children for permission update functions
>    block: add bdrv_set_backing_noperm() transaction action
>    blockdev: qmp_x_blockdev_reopen: acquire all contexts
>    block: bdrv_reopen_multiple: refresh permissions on updated graph
>    block: drop unused permission update functions
>    block: inline bdrv_check_perm_common()
>    block: inline bdrv_replace_child()
>    block: refactor bdrv_child_set_perm_safe() transaction action
>    block: rename bdrv_replace_child_safe() to bdrv_replace_child()
>    block: refactor bdrv_node_check_perm()
> 
>   include/block/block.h       |   20 +-
>   include/block/block_int.h   |    8 +-
>   include/qemu/transactions.h |   46 ++
>   block.c                     | 1319 ++++++++++++++++++++---------------
>   block/backup-top.c          |   39 +-
>   block/block-backend.c       |   13 +-
>   block/commit.c              |    7 +-
>   block/file-posix.c          |   84 +--
>   block/mirror.c              |    9 +-
>   blockdev.c                  |   33 +-
>   blockjob.c                  |   11 +-
>   tests/test-bdrv-drain.c     |    2 +-
>   tests/test-bdrv-graph-mod.c |  122 +++-
>   util/transactions.c         |   81 +++
>   tests/qemu-iotests/283.out  |    2 +-
>   util/meson.build            |    1 +
>   16 files changed, 1100 insertions(+), 697 deletions(-)
>   create mode 100644 include/qemu/transactions.h
>   create mode 100644 util/transactions.c
> 


-- 
Best regards,
Vladimir

