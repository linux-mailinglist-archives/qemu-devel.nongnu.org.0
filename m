Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E237F424F62
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:41:27 +0200 (CEST)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOxz-0005bH-0q
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYOwJ-0004nX-9v; Thu, 07 Oct 2021 04:39:45 -0400
Received: from mail-eopbgr80107.outbound.protection.outlook.com
 ([40.107.8.107]:21382 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYOwG-0003Rs-FQ; Thu, 07 Oct 2021 04:39:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmpwIranshfB9ffoJtv2l8MC6i30UHdG+Y/R4/XUJKjNxkRjsvuPEPdbseQG0GeHfefFl8Wo/mQbxxPhFqEbXX6vAubBMTkZM3Y8mf3J9iPR/c7kB4P2kWB7Gm329Hs+8p4YZ66MFhoPABwcLP1YYHRU+noOkAM366UvVZ/uUQa9qdmLriHXTNuRcGZPrjerbc6FLpwzxmtC6FK5InD6dO6yOVBzlOOiteR8rUqcRpcZWi/AbPf71CmgY/oPFEmQ1XjTC+sGIpzH2XRZzbgy82VrhthvmMbdkgjo7xfwDdmtOq2/eI5hylKWDMrrA1oAdbr9YpsX/itCg502PlCLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLvlwZidrCrIvu7oijtLefwd5dx0im68yi1uvqETV1I=;
 b=jh4DPc67amVqh2KOfCNrRwGn/6YeMT/sC9o325nHceh/+ULEGG3OE0wPfvcBljrEOebTPft7Bg/sjVmMC3NXDcOZVqUE1Vs9GqBK0jYadsl75dZVRuWcRBsCyjOWuBxClb+s7uzl6fC5Nb2GlOKCWTpBConigC3lJststvehz3vHGDLNZCxVUTE2lbyub4qXd3L4k+Lytso8KgjAifDWdEvBcDiPTT5kjtx5RbpMpHJ3kCr4OVqM0p7+XARECXhu2tKP9MXQ/xV858AF4GHP4A1pchmwNoUf7aEd4inD+gIW3ZrRKKPjdToQBSEq++GeRIHUNp100ycGyvpy/uWMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLvlwZidrCrIvu7oijtLefwd5dx0im68yi1uvqETV1I=;
 b=GgZ2XoagjF+bQ0odmM4izQOjvQcnESTo8peN2aY9n+n0e9HRm8krdrsc0Wu1Shim4MAp3QgDMyyEUq+w/38E433B+RDIJREsRZ0/KnkOB3egILcnKFnzIWq4WHAYFZwHfA0dqjo/GcP9sUhVgvdy7uAkwjg8Hg+8Bkvh1AgyHa0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3384.eurprd08.prod.outlook.com (2603:10a6:20b:4a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 08:39:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 08:39:33 +0000
Message-ID: <18fc52fb-7749-960d-371a-a9291989373f@virtuozzo.com>
Date: Thu, 7 Oct 2021 11:39:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 00/13] mirror: Handle errors after READY cancel
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20211006151940.214590-1-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211006151940.214590-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0178.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.15] (185.215.60.207) by
 AS9PR06CA0178.eurprd06.prod.outlook.com (2603:10a6:20b:45c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 08:39:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1678a5bd-5f17-41fe-2d01-08d9896dfc92
X-MS-TrafficTypeDiagnostic: AM6PR08MB3384:
X-Microsoft-Antispam-PRVS: <AM6PR08MB338446BC85AEB197A7F3D9C3C1B19@AM6PR08MB3384.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +q3w2tMkNU/yK9xglr5jMnjOJ+PhSHPrNyp9tAYcgWpJpZy7Iu1XbEMfeNXCxuATXkJgHih9/zVTOKQLxf3JrMlpUYzBESjKMxmQsERdMizYLdFS8pSxzxsuutzgillBmOw26xn2R+WneBNRwoZ5AI5u0rZN9GL8bAIQC/Iiyoq1o27EvYCM8WR3tRhjGga7XO2UlG1xHIboSa4AKPM0LDR7TSsD029VJ/lZsp/YKwsUwCWrwD4jDIXs0/zm+8TO22M+TYnalV58hP26LpahNErrjcVY8vOswenKNdfc4aQRnIOen9UwwcaFUTk/qG+gCUdPaDSIRhQPxpjJ+lOoBiw7surv8RXUX+kOTvDK5Wz50IyrPBiSSJaVZkl1Q9sqZdCDiXuGgs3qsJjvJNU6hvIMovj+QGy7szNWvyuNpr3P1nLlNc7F0Ylzd/hoLB9IPNknbjCe6KoWkCUzTtv1hdaKX4oXkaajSnvydxaGNVlav90yQiKinEbGl0CPn/rj9gWFX3Vx0qELuclvHPo5utsD+7I1vLqcFeUmi/f1PFoRN2CmdJU/Rd+FUuNczbfZPDVfrWMSuFymPVg8mDHGLK9uX4ekTdHJEyQ850+lEqR5FUrIA5a8bPebNDrJ/eYjz1kIU5NnpLtbdvyUZC8QXvNgutkup+ec+KGMnnttWMe2VsB/hQa3nYJD5/w0kE1AZZkStgb0ksBM1+S1lXTeK0MQ4iJ0vO9RLTLcK13R2U0JwhTbpjzkkF02agraofzSgPRWE/HcE6vkQCoH1sKxenJQ4QZXxjgy2smU3sUY0AN8gMILNyjQrmxPBDpBvD6SX1pFRN2KNKL1apW/e06/FQkWiNLb2+8YpyRrsxgtYYTgc5lyUhJDYOhq39hlH6cGSw0wDinuxiErSHQEQ5S1wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(66946007)(2616005)(83380400001)(31686004)(66476007)(26005)(66556008)(4326008)(31696002)(38100700002)(186003)(38350700002)(86362001)(8936002)(508600001)(5660300002)(956004)(52116002)(316002)(2906002)(966005)(8676002)(54906003)(36756003)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHpsOFlJaU01Y0FUa1hTdFNncExvQWhvbDgvc2d3TFo1RWtzNUwzZXE0SDZL?=
 =?utf-8?B?Qy9qR2dmNHNRbHRWdXRsUnZzUndLcDQ5eDkybERLRXIyYTUwOGZnZTRvNjNy?=
 =?utf-8?B?U2xXWUZFUy84U0N4dUlLOTFsZlFMMnp0RUJPT3FnWGVTMi84U1U0NFowTDlC?=
 =?utf-8?B?UW9MRmg4R2ZqSXZYZWg3VE9HNVZzQzhvamgxbGhod1NWTGtqVlhYVEMrbHhZ?=
 =?utf-8?B?UFFXYm5pTjhtNmc4bUZ1U1UwVHNuVHRRUUlvYSt0cUI4UFgrNC9XVEJEM1p1?=
 =?utf-8?B?U2lEeDdxbjE3Zms4Rk13Z0YwVnE4dEpaYXRLRzIvaGh3SkNWRTkxZHNlZTd0?=
 =?utf-8?B?RDhoK2FxRmhISFN3dWxlV0JlUE41ZTFTQXlVMHJhTlcrMzFVR2VMSURjNHFN?=
 =?utf-8?B?Y1RoTWJPSk50ZHF2NHB5Z1VnWDBVYzl4VE9oakkvL3l4dVNyVEJsSmRyUkFG?=
 =?utf-8?B?aUVEdlcwelUyU1BWQU5aVnlYTWtmY282UDlaa0xERHVja2xSM0NxcmVIbFZX?=
 =?utf-8?B?bWtZRWd3d29FRVBjbVZiQnBuMWZGRks2ZzQ3SWYvd2dLR2M3dEJmTXIyMENL?=
 =?utf-8?B?V3pwVkI0Vm1QVWtQTWFHSE5XZ0JVUHYwTFk2R0FDU3MyYzFzUWR3OHErZnFN?=
 =?utf-8?B?L1VselFFVk5zVDJFYnFYN3VUejZjWmt6VUhEdytpYkVEa2NlMk9SL3NpS2V0?=
 =?utf-8?B?VDY3M3dweFl2NHZNdjczeDlYL1NDS3RrbjI5Q0hDemhMWHRhWXB5cTB6M09r?=
 =?utf-8?B?cXNZNkVQYVRNWkFHaG9ha1pVS1Zzdzcwd0NleHpWTHRnTzZkMDE1cHZMNkpV?=
 =?utf-8?B?V1JvZHdGTlhVM1F0SGk1R0lnL2lhRjEvM2RlZFRGNWdoZE0vS0ErUnpwbkk1?=
 =?utf-8?B?WnNxbThtYUNYSGdTVmRMaittdkxvMk05aS91eEpSc2xzemtsOVBnRisrZU4v?=
 =?utf-8?B?Nm9CUXJjblpTQU1WRW1lRk9qVGREc3JBWEV6VmRCcVIycDVWMGlrcnhFcW5V?=
 =?utf-8?B?aHdmeFVoZVNJckRybi9hdG1FbWUzYVdRU3U2QnV1aytLcWk2NEJoZWE3aHk4?=
 =?utf-8?B?eWtRSGIzNjBXNG85K0xVaXp0Z1hLWmFjbE9hQ25ya2J3MUdLbjJOenFZNTA1?=
 =?utf-8?B?K3QrNlVXc1czRzFVdWRKSHRvRUNGdmVPWi8xWGNNcFFtd0VZYlUrZzlWU2I4?=
 =?utf-8?B?ZUFtcVlnY3Z3aUFOamN0R1lWSWRoVi82QzZ1cHNEZU5oRmpNYldoQjBrbGNO?=
 =?utf-8?B?NTNSVTcrNE5rYlFZTTVqZk43cGNGSlI0MktJUG1paC9mS3phaGN1Uk00SjUy?=
 =?utf-8?B?V3VMTWl6ODMwQkk0NTlkQU9ucWx1ZFBaNWJTNlUyU3NVSDhvYVB0T3VXWlZI?=
 =?utf-8?B?YWx0ZTZ1ekNTd0RpTUM4NFBOOExqdnhNK0hocDdoM1locnRuSm1kNnNIVWFF?=
 =?utf-8?B?QnBjZUNkc3g0dlhhb1ROUzJxaUZoZWcvTnB5SGc3a24vL3FOVE9URndFTHZs?=
 =?utf-8?B?elFMWC9lV2s2UW9mTXNGTmxmNXpWMEdheDVmeUNhUE9qdEZjb2p0bndTeUNr?=
 =?utf-8?B?YzkyUDU3YjJ3ZFQyTFRpQnJodFhQeFV5eGk5ejNIa1dWQjFKbXA4T3ZsRUov?=
 =?utf-8?B?MDJXTmx6eXpSUThyeS9sSUJ4OVoxdks4VlRGYkJkRndUWFgrU0JXVTZneGtu?=
 =?utf-8?B?VFYwZ29sOU1sUmtBb3lQUVJaMFMrMzJOR1JZcHVDMzZyVHFybU9YN2VGZ1FX?=
 =?utf-8?Q?/elXCFdMYWrBuiQwsGGtzCw6hCFwtsW/uTqfTB6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1678a5bd-5f17-41fe-2d01-08d9896dfc92
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:39:33.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5uy6iJuExhxKJT6w5JG57zftL2NJrWwg+A4EjJy6LdTQYMb0VOZSKgpXuONqrFrT+YabZ1Xufh7tLVjo5hX60ItlvQuLzyKiqNWtnu6oDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3384
Received-SPF: pass client-ip=40.107.8.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_NONE=-0.0001,
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

10/6/21 18:19, Hanna Reitz wrote:
> Hi,
> 
> v1 cover letter:
> https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00705.html
> 
> v2 cover letter:
> https://lists.nongnu.org/archive/html/qemu-block/2021-07/msg00747.html
> 
> v3 cover letter:
> https://lists.nongnu.org/archive/html/qemu-block/2021-08/msg00127.html
> 
> v4 cover letter:
> https://lists.nongnu.org/archive/html/qemu-block/2021-09/msg00314.html
> 
> 
> Changes in v5:
> - Added patch 7: When it was soft-cancelled, the mirror job clears
>    .cancelled before leaving its main loop.  The clear intention is to
>    have the job be treated as having completed successfully (and this is
>    also supported by the QMP documentation of block-job-cancel).  It is
>    however possible to cancel the job after it has left its main loop,
>    before it can be unwound, and then the job would again be treated as
>    cancelled.  We don’t want that, so make a soft job-cancel a no-op when
>    .deferred_to_main_loop is true.
>    (This fixes the test-replication failure.)
> 
> - Patch 8: Add a comment in job_cancel() that job_cancel_requested() and
>    job_is_cancelled() are equivalent here, but why we want to inquire
>    job_is_cancelled() instead of job_cancel_requested().
> 
> 
> git-backport-diff against v4:
> 
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/13:[----] [--] 'job: Context changes in job_completed_txn_abort()'
> 002/13:[----] [--] 'mirror: Keep s->synced on error'
> 003/13:[----] [--] 'mirror: Drop s->synced'
> 004/13:[----] [--] 'job: Force-cancel jobs in a failed transaction'
> 005/13:[----] [--] 'job: @force parameter for job_cancel_sync()'
> 006/13:[----] [--] 'jobs: Give Job.force_cancel more meaning'
> 007/13:[down] 'job: Do not soft-cancel after a job is done'
> 008/13:[0005] [FC] 'job: Add job_cancel_requested()'
> 009/13:[----] [--] 'mirror: Use job_is_cancelled()'
> 010/13:[----] [--] 'mirror: Check job_is_cancelled() earlier'
> 011/13:[----] [--] 'mirror: Stop active mirroring after force-cancel'
> 012/13:[----] [--] 'mirror: Do not clear .cancelled'
> 013/13:[----] [--] 'iotests: Add mirror-ready-cancel-error test'
> 
> 
> Hanna Reitz (13):
>    job: Context changes in job_completed_txn_abort()
>    mirror: Keep s->synced on error
>    mirror: Drop s->synced
>    job: Force-cancel jobs in a failed transaction
>    job: @force parameter for job_cancel_sync()
>    jobs: Give Job.force_cancel more meaning
>    job: Do not soft-cancel after a job is done
>    job: Add job_cancel_requested()
>    mirror: Use job_is_cancelled()
>    mirror: Check job_is_cancelled() earlier
>    mirror: Stop active mirroring after force-cancel
>    mirror: Do not clear .cancelled
>    iotests: Add mirror-ready-cancel-error test
> 
>   include/qemu/job.h                            |  29 +++-
>   block/backup.c                                |   3 +-
>   block/mirror.c                                |  56 ++++---
>   block/replication.c                           |   4 +-
>   blockdev.c                                    |   4 +-
>   job.c                                         |  94 ++++++++++--
>   tests/unit/test-blockjob.c                    |   2 +-
>   tests/qemu-iotests/109.out                    |  60 +++-----
>   .../tests/mirror-ready-cancel-error           | 143 ++++++++++++++++++
>   .../tests/mirror-ready-cancel-error.out       |   5 +
>   tests/qemu-iotests/tests/qsd-jobs.out         |   2 +-
>   11 files changed, 312 insertions(+), 90 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
>   create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out
> 

Thanks, applied to my jobs branch.

-- 
Best regards,
Vladimir

