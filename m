Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43792CA7C4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:08:59 +0100 (CET)
Received: from localhost ([::1]:44896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8D4-0005wf-Vz
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kk8BO-0005D4-V2; Tue, 01 Dec 2020 11:07:15 -0500
Received: from mail-am6eur05on2115.outbound.protection.outlook.com
 ([40.107.22.115]:33889 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kk8BK-0003jS-PL; Tue, 01 Dec 2020 11:07:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVQbsnrnaEeb74oYSwQknm4qQlnmchReSQeIiytL5Odxt/X7FXyBo6OEGQgUXiRjTFWUXH09siOosckH1sej9BI3+Swg1O6BRKYQcpCEVxprBEvwaR6BLOvFHsfnkjs2IWDALBKt8HiWWWkX3DWgdUnugxjv6U3VpfgcsSf1wM4pV1BaPQmskc4OXpqyhmZzrLyh/yBovO6Vklhnqbdf0QjerQ55vtS0ljJ1FuCTMZbywz+jVIN/4EomG0IXGx98UqD6WiSb7SCbGJzihJwlzgH8SJt85Aov0tUQKX/MxIvgkP1NVhcZztJI0+2QRvi7JqC9EMz0kaP/AN+KSirhdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrBDVMlKG8Y2xSAA0u3dFsovcvQH9AZ4Pmg+GzBUZUQ=;
 b=YjKScaervyLA3PinidestdLoolnMV9t5PhMI0RXx4KRicR5+S3IHKbHEEZc5LAVd2oBnDzC4Uve+HAHWP5Uvjs9SgxZMaDmMT7j6nULXVTRvX2cQo5VKzZFeh535g3l79TL7FxTH6P98rZ5vrFfImoSw51r9WH651MAAB6mzDmNUNucv4nn6YAkEBvTkKr0HOgR8fHNbHbrmi+ZTzU3TupaUFOw3GBXUGiujBSLHHIqtFKKuU/WgsUCq2vI3Goy4VXxikKyFWYpH4X05wjcgOB32BwxrX9XcO/TSXCLjKUK3I8g54zVkdxYPct4GRN2YlT8fzMtygZoXG9JpWHuwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrBDVMlKG8Y2xSAA0u3dFsovcvQH9AZ4Pmg+GzBUZUQ=;
 b=JsnpLuIRufx/cuXVasEy5i4B+yFkdyTdCdlqHQ68O7PoisPSRamSNUKGfFowIoA14gLaYU0bSYwX+zhtOg8c168TB6pSH6ebf3DY+37l/2ucu4GvlrdM9U/Flqq3tq7Q8n4RsPfsCwh73LRwFNdB3dmmnWNvP4sVvsmS11URMNw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4342.eurprd08.prod.outlook.com (2603:10a6:20b:b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Tue, 1 Dec
 2020 16:07:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 16:07:05 +0000
Subject: Re: [PATCH v3 00/17] 64bit block-layer
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, mreitz@redhat.com, ari@tuxera.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, stefanha@redhat.com,
 jsnow@redhat.com, sw@weilnetz.de, fam@euphon.net, ronniesahlberg@gmail.com,
 pl@kamp.de, eblake@redhat.com, berto@igalia.com, dillaman@redhat.com,
 namei.unix@gmail.com, qemu-devel@nongnu.org, integration@gluster.org,
 sheepdog@lists.wpkg.org, den@openvz.org
References: <20200430111033.29980-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2a61f322-b274-f642-2d5d-6664d653adc4@virtuozzo.com>
Date: Tue, 1 Dec 2020 19:07:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20200430111033.29980-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0101CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM4PR0101CA0045.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 1 Dec 2020 16:07:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54743ab4-73b9-4f3f-e841-08d89613257f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB43427DB2731AD43B6B014DA6C1F40@AM6PR08MB4342.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x8yKeXX8VlW3xs3O1ENjQyyd3ELx1yAkom0xNN9eOWSos3DHN2MrAQmWjMWc0HSjTj2q1LWjXT8yK/c25hP6JWbpLjH5F5zcowN0+frMxW8kEmKLziM+IET/hfgd0rMMcVnb3oHwDvNzl6RnPDZZFNf9iOW9YuI5uURmdUW6sexvsnwm3/pGvGTkXzH7YMLO8qExSmHRDM4snFB7JzILCOz97efsHPdaetuRAAFGJ6PGuSwcZD5mE5GD91iaoMOxT3wYnq8rIRfIkes93bUCuOg+3dZMNiiiRq4YHCTocgcFJV+ecHkHZihA+a/bOQAlFlIkltjwpV3sreuGZBxe7t9XnzvVMFQIQkNM0UTMR83d26Gxb73L7AO8X9ExsYXYdKDsCNsfD0192ThMTq1q7UA06G5W/qzcDjbKZDGkn7bJJZTqt9mkByqNzUvDf4KQ7dYNsGBBvgx9DDuIHU0y9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(366004)(396003)(346002)(376002)(52116002)(5660300002)(16576012)(966005)(8676002)(4326008)(956004)(316002)(6486002)(2906002)(26005)(8936002)(2616005)(107886003)(478600001)(31686004)(186003)(7416002)(16526019)(31696002)(6916009)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OUZYbEkwZ2lEbGNXZVNsTUF0Q2ZRVVJFSWtnRFVySzRaV0lnZXdpUnRRV2Ft?=
 =?utf-8?B?WUFLRVVYWG5xNlpaOWhtYlZJYzh4OW9KRHFtbktxZWpZR3kwT2FiSWdNTGxV?=
 =?utf-8?B?Y3I1M3dJKzhjWkVTZjdCWnBCa2g0WUZhR2hhSjFXSDhKQ1l2bnA4Uyt2ZmtO?=
 =?utf-8?B?YmRQNnduSXdldG5CMTBxbXd5WW5aT2VGS1BZdVdMZ1pKbmE0QkJNV0M1V1Fp?=
 =?utf-8?B?T0hVWmFFYTF6aEpoaTdBUC9sM1h6d3YwU0JMci91L1Jia0RKTnEwOFYvQll2?=
 =?utf-8?B?SHBBdE1sQlMxcXgwOThKaGR6b1dzQ1R5dTFIMTVJWDFKd3VrK2pYaUhJT3B1?=
 =?utf-8?B?cW1SdGpLQkJYcUpLN0VLZktyczllQlZDVFNQekhXQzdVK09Ra2pCMWtTTDVi?=
 =?utf-8?B?UEl3YTRFT29EbE9PYkhXeUNpZ3dhTXdtVlZZMXBmOEFYMTNRRHlIbDNsL04v?=
 =?utf-8?B?QlJEWjZvM0FPeTJhUkY4TG5BZDZDWTQ2Tkw2bHF4VUpZTHNRbERjb1pUOTl3?=
 =?utf-8?B?TE02TFlBSFMzNEpvVlBuOVFPbWtDNDlSLzNIREFqUVY3Vjc4Tkt1aExqRlAz?=
 =?utf-8?B?TVRvU2hGbG92QUVySW5yUlBtakoxL0NBL3llZlRUTzF0Y0VTSzJUU0tqQldG?=
 =?utf-8?B?SEVkaGkrbmFlZVhFRit0MHpPa0RMV2l3ZVNXQy9oSENiQ3NUOThxajliODJ6?=
 =?utf-8?B?aWh1MEkwMWk1TGZZNCszRWNWbEVTS0Y0bHRwcFlucUloMGpUaE1YOHczdk9V?=
 =?utf-8?B?cVpaUk9hcmNQK1RPRGlhZFpRaEx4RW02UXFpeTN1WStQZDdTNTYrcEVrY0sr?=
 =?utf-8?B?S2hIVUdkUk8rSTZ5UkVGaEt0RTJsbDJsSlFpVUxQVE1ESEV4Mk9ndDk2QjVL?=
 =?utf-8?B?KzNobzZtTFBjZ2FJSzFsT2wvOHR0bmF3bnZrMTBxamhwZWFpZk11VmEzR0xP?=
 =?utf-8?B?QUdyS0F5YVQwZ0lmN3NsTlFEWjhnVWxKcDJ4UEpyYnpGNXptYXNiOHFHaVdx?=
 =?utf-8?B?WW5nQUNoMHlaWGJTY1FQcytLUGFuYnBoZVFOYlR5NnpGa2VQN1FwSW44ZmVP?=
 =?utf-8?B?bG1JblJNM2JmL0VmOGpFNnJJL2cwQjNGcWNvaVAwcWJ0QmhQL0JMbVp5QUM1?=
 =?utf-8?B?MHYxeklwK0hWUnJneXd5c1o5b29UczErRFFKUHhRVlhpNWNHSFJWNGZjY0N1?=
 =?utf-8?B?dVNzeEpyS24vSDBYbms3MGpoMlBuYmQ2enVzbWFSNlRCbU0wRkZ0dTQ5U0k1?=
 =?utf-8?B?UzI3Sm05bHNGTjgrSHNIMWNjQ1ZsOXpOaDFSUVQ5bnF1dGIwRE01YXJiWmhP?=
 =?utf-8?Q?1ZoKsBr2tmJe9FAyhUeMYJYYe1ty2hNl0/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54743ab4-73b9-4f3f-e841-08d89613257f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 16:07:05.3984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M89636lHz6le6SZIKh8L/kayKrid3SsErOCsjAsTGCbUrsWz68gecpZ3zg6xxYUqoCmCicqUNsrUEvgj3E5A/WIUJoVQV+EjyqwqusJChb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4342
Received-SPF: pass client-ip=40.107.22.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

Hi!

I'm sorry, I should have pinged it, or resend, or suggest to pull at least a half long ago :(

I've rebased it on master and make some fixes.

What to do next? I can just resend. But I'm afraid that Eric's careful audits may be out of date: time passed, there is no guarantee that callers are not changed. Really sorry :(
So r-b marks are not applicable as well, yes?

But if I just resend it with no r-bs, is it feasible to review/merge it in a finite time? So that audits of patches will not become outdated?

Any ideas?

I have an idea: instead of auditing each function callers, can we just make some good assumptions (like that the whole offset/bytes request being aligned to bs->request_alignement doesn't lay inside [0..INT64_MAX] region), check it once in bdrv_check_bytes_request() and assert in each function we convert to int64_t.

Then, if somewhere our assumption is wrong, we'll have a crash and fix the bug.

30.04.2020 14:10, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> We want 64bit write-zeroes, and for this, convert all io functions to
> 64bit.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> Please refer to initial cover-letter
>   https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg08723.html
> for more info.
> 
> v3 is available at
>   https://src.openvz.org/scm/~vsementsov/qemu.git #tag up-64bit-block-layer-v3
> 
> v3: Based on "[PATCH v2 0/9] block/io: safer inc/dec in_flight sections"
> Add Eric's r-bs, improve commit message with short reasoning of the whole
> thing, and Eric's audits (if you don't like something, I'll change or drop for
> next series).
> 
> Add "Series:" tag to each patch. Just an idea, if it's inappropriate thing,
> I'll drop it.
> 
> 01: add assertion that bytes > 0
> 02: fix indentation
> 06: refactor calculations in bdrv_co_write_req_prepare
> 09,10: simple rebase conflicts solved
> 
> Also, cover more drivers by driver-updating patches and fix int flags
> to be BdrvRequestFlags flags.
> 
> Based-on: <20200427143907.5710-1-vsementsov@virtuozzo.com>
> Series: 64bit-block-status
> 
> Vladimir Sementsov-Ogievskiy (17):
>    block/throttle-groups: throttle_group_co_io_limits_intercept(): 64bit
>      bytes
>    block: use int64_t as bytes type in tracked requests
>    block/io: use int64_t bytes parameter in bdrv_check_byte_request()
>    block/io: use int64_t bytes in driver wrappers
>    block/io: support int64_t bytes in bdrv_co_do_pwrite_zeroes()
>    block/io: support int64_t bytes in bdrv_aligned_pwritev()
>    block/io: support int64_t bytes in bdrv_co_do_copy_on_readv()
>    block/io: support int64_t bytes in bdrv_aligned_preadv()
>    block/io: support int64_t bytes in bdrv_co_p{read,write}v_part()
>    block/io: support int64_t bytes in read/write wrappers
>    block/io: use int64_t bytes in copy_range
>    block/block-backend: convert blk io path to use int64_t parameters
>    block: use int64_t instead of uint64_t in driver read handlers
>    block: use int64_t instead of uint64_t in driver write handlers
>    block: use int64_t instead of uint64_t in copy_range driver handlers
>    block: use int64_t instead of int in driver write_zeroes handlers
>    block: use int64_t instead of int in driver discard handlers
> 
>   include/block/block.h           |  17 +++--
>   include/block/block_int.h       |  67 ++++++++---------
>   include/block/throttle-groups.h |   2 +-
>   include/sysemu/block-backend.h  |  26 +++----
>   block/backup-top.c              |  14 ++--
>   block/blkdebug.c                |  12 +--
>   block/blklogwrites.c            |  16 ++--
>   block/blkreplay.c               |   8 +-
>   block/blkverify.c               |  10 +--
>   block/block-backend.c           |  60 +++++++--------
>   block/bochs.c                   |   4 +-
>   block/cloop.c                   |   4 +-
>   block/commit.c                  |   2 +-
>   block/copy-on-read.c            |  14 ++--
>   block/crypto.c                  |   8 +-
>   block/curl.c                    |   3 +-
>   block/dmg.c                     |   4 +-
>   block/file-posix.c              |  46 ++++++++----
>   block/file-win32.c              |   8 +-
>   block/filter-compress.c         |  15 ++--
>   block/gluster.c                 |  14 ++--
>   block/io.c                      | 126 +++++++++++++++++---------------
>   block/iscsi.c                   |  34 ++++++---
>   block/mirror.c                  |   8 +-
>   block/nbd.c                     |  18 +++--
>   block/nfs.c                     |  12 +--
>   block/null.c                    |  18 +++--
>   block/nvme.c                    |  38 +++++++---
>   block/qcow.c                    |  16 ++--
>   block/qcow2.c                   |  34 +++++----
>   block/qed.c                     |  17 ++++-
>   block/quorum.c                  |   9 ++-
>   block/raw-format.c              |  36 ++++-----
>   block/rbd.c                     |  10 ++-
>   block/sheepdog.c                |  11 ++-
>   block/throttle-groups.c         |   5 +-
>   block/throttle.c                |  14 ++--
>   block/vdi.c                     |   8 +-
>   block/vmdk.c                    |  14 ++--
>   block/vpc.c                     |   8 +-
>   block/vvfat.c                   |  12 +--
>   block/vxhs.c                    |   8 +-
>   tests/test-bdrv-drain.c         |  16 ++--
>   tests/test-block-iothread.c     |  19 +++--
>   block/trace-events              |  14 ++--
>   45 files changed, 488 insertions(+), 371 deletions(-)
> 


-- 
Best regards,
Vladimir

