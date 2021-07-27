Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693183D7597
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:07:20 +0200 (CEST)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Mnn-0005Wv-Eo
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8Mlj-0003bR-1e; Tue, 27 Jul 2021 09:05:11 -0400
Received: from mail-db8eur05on2111.outbound.protection.outlook.com
 ([40.107.20.111]:18656 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8Mlf-0008Pz-96; Tue, 27 Jul 2021 09:05:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6vYMSVaoie60gWUu8qN4HoOVLLBzEao/z5eyT+OdglaijIHfiTA7Y0HbHgQOCc0naAoTb8xdcugrL8QrdTAw1KSQ//xsq0ZNyAJKDzD7aWs5vWtZj4sJcz+r2fF+++LQWr7Pq9jsCY03/Ras93QIiBsAQ2ZCwJLTbsJgPCZkbauw6PGc80ibSIVCkdKB2y2KJ5/lNSmHbZYNv1LH8hSzPlQe/+YCySFupYU593RfjnREy3I99zUQMJ++Vghd9Q85tP1hKIN7ja3nId+OFDLif2qpyJgn/ZuTJdzz6zh6/YCvNGc3AP9qrB19wL1vsC6j040ZXpmzBLndV8sfZydXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2H9HHsB3tITfswjqmxdaR+/3S4xz7VtZFx0ILmXeCc=;
 b=fjjFeQ/FCD/aeJO7HtcuHghwiXWEBhk7Sxb39Fer4TmVui7OmnGloHVvT0L7QmXcjucptwgjGqwh8vbz/Be6yW1Sgh32brJ2O1alEF7UzoTP5Stn6UHHLs3EI78MaeDPku/2dRR18z198NI8AgoYNmnyOOI6+1/uCMqC6fQm3DqfgHC/eUgNZV2BuIlnjkH71wNJUYnFj/PLqRR6e7WLz/jz77SGK6KnUAI19/X9u6/8LDgjONt/5HcqWF91hRsWdshyXt0XkIyoe/XxlIF0PfqqMdou8LefukDvHds1NH/V11d8QwUHVXF1wW5SizkI8ZQFkGR3dZylfnumZVmf1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2H9HHsB3tITfswjqmxdaR+/3S4xz7VtZFx0ILmXeCc=;
 b=cv/J43CGEEUlSGNbf+icftvI8FupOQ0B3BPZIvB3l8SQHXXfS0BG0zrS5ZRCQGqFUZxskZ4kEaXkoSHQME2QdBfmZI8gWgr7YQmuPGmRE2KoOwR3uceecdCckuZat3J0Ko4R7CZPTEkqDmasapXeRjOFFWN30YDPQuxV3MCBthM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6117.eurprd08.prod.outlook.com (2603:10a6:20b:292::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 13:05:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 13:05:03 +0000
Subject: Re: [PATCH for-6.1? v2 5/7] job: Add job_cancel_requested()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-6-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <cf6bbb03-b9d6-c24e-3e0b-38d375c855a5@virtuozzo.com>
Date: Tue, 27 Jul 2021 16:04:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726144613.954844-6-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 PR0P264CA0164.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Tue, 27 Jul 2021 13:05:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a654a3f8-f633-4033-7a3d-08d950ff2604
X-MS-TrafficTypeDiagnostic: AS8PR08MB6117:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6117CC2D7B0D0494AFF42C93C1E99@AS8PR08MB6117.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a0vgvpFUGJyqmXkTa7zXpArN8yAbNsIJK6aJewLy+bvnmoG6N0YxniLqry/GWwfYn7VXZ4hAIXBML7EaKItRYXspu5BaUPU8l58zBZ2W29b1l+hgxxTQZmMOFlTzFF+6cXdNtAPT43pm6+lCcvZBn1eCRSOgNb7Yse2W5zr3tMog+Flr02GhCrpc8p8JQeOuAcZKh1fdNwqbGR/EkL2aK2Tqs0BcHuQJQpjxnT28ISO0yrKMdGZxR1CxMpuneHvjnmf6+U8OwLQXKSq+euXdWpU7xW4kEh+KBppXXzwTbOiRreUQ6LCeA15Ld8l6ZXtwhVkhlsPTi8cY1ukBXYA1On1vIUOPnO2valFNMvuZIZujAD0pg3dycU2tG6ON91M1C3CUbHTEJH3b8M7f9QxZkDz/nz4o9OtwhLYkW91FoVNnWtQGAxtV2jX9/DBFixxWe8m/Owl3b/1t7+/iVEcbC9SBbglg5f7s7A6FLww5KbhkIWwuBiQWzmvchAhCU0bYXX+BZmjIQ3wdQ3RUt7LbooEqGQvvdMAhLfVDCkX0sN0FKmhax/1whj2wwgTBATHY8kZdbP3kYXPacHS2YaozJ3ZdQ7zvhzccMk3eagCEOSfwkGZGr0QFMo0iV0/f/f++GmQb9AVqRuXugRKogggFGnRt2N6DFwsvlxod2EQYxUgPQmh2lRIjMKUDKWSWxMjbsU+wTs9YYbCOuC9Ks83uY9k1C06bZ0pTQP5JVQD11EUshjdjK0Xe7dbwXj2FRvzy/ZaWGGdtPEwwaqYafUIqEZQExud6b9T4HKvAf44RbvjbItK2s28ajds7UnN2VUNWL3iQh5rtRQJC5wQtfeXnmgaid4rzW/0AXfCte8SDTQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(52116002)(2616005)(966005)(8936002)(508600001)(66946007)(31696002)(2906002)(316002)(186003)(66476007)(4326008)(6666004)(956004)(31686004)(86362001)(5660300002)(16576012)(54906003)(38100700002)(83380400001)(8676002)(66556008)(26005)(36756003)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUZYbWtuMGhQNXE5b1k1NytzVEhaY1VtQVY5WWdwbFpJUWlnMEJmaDNITkFI?=
 =?utf-8?B?UE1MamFSeGxpMUNpNU5LaDFvTlRzdmtkMnNXVldDZFpoQzlXZjFJeENQckVN?=
 =?utf-8?B?c2dJLzlFTWpUVDlNc3BNeGpIMUQxZnUwR2FGVkI1bklnVGFQZDB1N3Njb283?=
 =?utf-8?B?a1VkWVlrVXZUVHVyUkZxRkUvM1U2ellTRU1raFBXOUh1NG9xM0FKK1lvSmdR?=
 =?utf-8?B?bVo5eHJ2M2c4UGROT1gzd284a3Qzd2Zta2VTODBMM3JONitFYzBwTHhsV1Ew?=
 =?utf-8?B?ZHNDRG1wTkdBRFNWdjArbDlpWGF3SWYycWhJdS9ab0pMaFhXRzdVTjVrZ3Bq?=
 =?utf-8?B?Q3hXN05BcUhXeWNPekE5V0RLNXFleGM4SlE4T1NhejBEQnhWRHZwUVg2Tmdy?=
 =?utf-8?B?OXI5YlVJeG9LcW5yYTJxc1haRHg5NXQwUzhMemxEdlZSTEJqZjFWMXB1S0lD?=
 =?utf-8?B?aDZwVFBxWFR4U3M3VlExREVTajROaUZkdk04dTRNQnhZTjFwbktBN3BFK1NT?=
 =?utf-8?B?UktPRE8wWVJ2QURFS2taWkt6aFgyWXdVUjJ0SldieHRPeTZSbVNyeXZXeEV1?=
 =?utf-8?B?cmlPOTNmZk56elRRU285cGd0UktQSGY1aVdjOTJQaVRuanZWUVpMVHl1VEhF?=
 =?utf-8?B?ZEhmQ2dRaHFIK2xKZXNjbE5FR05ydm9ORmVDZTlHd2xjcXV2ampDc3pVVUFK?=
 =?utf-8?B?VU9TNE0yYjBLYlNuZWk0ZStSUWlLSWRRYXQwS0d1dTM4V1l6R3hHbUZCZ2ha?=
 =?utf-8?B?MldwOUNhS2VBNjd1bHBjcHhueEpJbW80K0xGbStQMVhjQmg5RG1CaXFEMk1r?=
 =?utf-8?B?UnNvd0w3aTROZmJyMjJrV3Q5NzRpQmxqeTRUSnBlT3NzeWlTeGRncHhzcXpp?=
 =?utf-8?B?NWQ3RGdDOEs0MnV1ZjFOekU2endKUjdZVFNEMCswUFBUT2xTcVN0dWhlY0Yy?=
 =?utf-8?B?a1o0MVZFcUw5WTZveXZPYXV1cEE1aWZkVE55ODlUempUdXJ2YXI1VW9GWGJD?=
 =?utf-8?B?TmVsT2F0NUxvei9DWFI2bEVzaWtlZ1pqVVlWQXdHRTNsZGFHTEdWSXJxQlVN?=
 =?utf-8?B?TGpyQzdubnNSMVFhNExwV1dWdlpWN3dLSURCME5ObkxJL0RZRzU3NTdta04x?=
 =?utf-8?B?eG9aUnBzLy9NelZBSmxpNjZRZTEvcjRONFF1NmpXYmlJMFd4QmwveGJNVEF5?=
 =?utf-8?B?dEc1RjBqNzNhU3BGemUwOEU0c1J6Q1ZRdWUyejV3VENScUUvL1QzWnU0Rlpi?=
 =?utf-8?B?R1R2OUJsMmo2S2VjaEhwMEJ6d3MrK3hVZHBTNUVIZXpFQnh0d0Z3OWdnbDM3?=
 =?utf-8?B?S1BXSnVWeVVucjVlMDlJYVRsamExQzRzOGc4dTlBZ1FFVVRXdGtDVi9BUzVD?=
 =?utf-8?B?ZHhmZmIzSWk4a2JFeVRmRHJGYXRRcGJaUmVKUEptMTRzNkdNMDAxbytRMUdt?=
 =?utf-8?B?dFZUaVdrcWZlaXh1T2d6aDR0RkdFMTZka1plZlRCMCtvU0JSQ1ZZdW1wMC90?=
 =?utf-8?B?dmkyRnVBTVdNcnJ0QzdCYmJNb0NvNmMxc1Z6WEtjWU5KMzJGOURqczhkdzZC?=
 =?utf-8?B?WmpmQ0ZyRkdkRmhDazhIQlJqbW00S1EzOGxiTnppSnhiQXhtOXpCSWFVclNX?=
 =?utf-8?B?L3RwSU0valVHeVNBV0c1bzJYL2pUZjJwUmErRmhmU2s3MERqTm5HamhUVzdx?=
 =?utf-8?B?QWUwVG5XVGM1NHRzQ0xEaGl1N3owUENCWUo4bXpsckpvYnJJMDdkTjloN1ZO?=
 =?utf-8?Q?/1XrRhNus34W/D6LHAVgc4IzOPZ3roUrp8N9AQE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a654a3f8-f633-4033-7a3d-08d950ff2604
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 13:05:03.5112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VPL7bkuqITyGI+2PXZZL6+Z+RwaJGvU6AJFeXeDIhFMWTyqPqOR76A8zRKZHSZGFPWSygRIJmZGyVSrliW2mJnvXdtoXIekOTOuvHJ013k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6117
Received-SPF: pass client-ip=40.107.20.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_NONE=-0.0001,
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

26.07.2021 17:46, Max Reitz wrote:
> Most callers of job_is_cancelled() actually want to know whether the job
> is on its way to immediate termination.  For example, we refuse to pause
> jobs that are cancelled; but this only makes sense for jobs that are
> really actually cancelled.
> 
> A mirror job that is cancelled during READY with force=false should
> absolutely be allowed to pause.  This "cancellation" (which is actually
> a kind of completion) may take an indefinite amount of time, and so
> should behave like any job during normal operation.  For example, with
> on-target-error=stop, the job should stop on write errors.  (In
> contrast, force-cancelled jobs should not get write errors, as they
> should just terminate and not do further I/O.)
> 
> Therefore, redefine job_is_cancelled() to only return true for jobs that
> are force-cancelled (which as of HEAD^ means any job that interprets the
> cancellation request as a request for immediate termination), and add
> job_cancel_request() as the general variant, which returns true for any

job_cancel_requested()

> jobs which have been requested to be cancelled, whether it be
> immediately or after an arbitrarily long completion phase.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   include/qemu/job.h |  8 +++++++-
>   block/mirror.c     | 10 ++++------
>   job.c              |  7 ++++++-
>   3 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 8aa90f7395..032edf3c5f 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
>   /** Returns true if the job should not be visible to the management layer. */
>   bool job_is_internal(Job *job);
>   
> -/** Returns whether the job is scheduled for cancellation. */
> +/** Returns whether the job is being cancelled. */
>   bool job_is_cancelled(Job *job);
>   
> +/**
> + * Returns whether the job is scheduled for cancellation (at an
> + * indefinite point).
> + */
> +bool job_cancel_requested(Job *job);
> +
>   /** Returns whether the job is in a completed state. */
>   bool job_is_completed(Job *job);
>   
> diff --git a/block/mirror.c b/block/mirror.c
> index e93631a9f6..72e02fa34e 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -936,7 +936,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>           /* Transition to the READY state and wait for complete. */
>           job_transition_to_ready(&s->common.job);
>           s->actively_synced = true;
> -        while (!job_is_cancelled(&s->common.job) && !s->should_complete) {
> +        while (!job_cancel_requested(&s->common.job) && !s->should_complete) {
>               job_yield(&s->common.job);
>           }
>           s->common.job.cancelled = false;
> @@ -1043,7 +1043,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>               }
>   
>               should_complete = s->should_complete ||
> -                job_is_cancelled(&s->common.job);
> +                job_cancel_requested(&s->common.job);
>               cnt = bdrv_get_dirty_count(s->dirty_bitmap);
>           }
>   
> @@ -1087,7 +1087,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>           trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
>                                     delay_ns);
>           job_sleep_ns(&s->common.job, delay_ns);
> -        if (job_is_cancelled(&s->common.job) && s->common.job.force_cancel) {
> +        if (job_is_cancelled(&s->common.job)) {
>               break;
>           }
>           s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
> @@ -1099,9 +1099,7 @@ immediate_exit:
>            * or it was cancelled prematurely so that we do not guarantee that
>            * the target is a copy of the source.
>            */
> -        assert(ret < 0 ||
> -               (s->common.job.force_cancel &&
> -                job_is_cancelled(&s->common.job)));
> +        assert(ret < 0 || job_is_cancelled(&s->common.job));
>           assert(need_drain);
>           mirror_wait_for_all_io(s);
>       }
> diff --git a/job.c b/job.c
> index e78d893a9c..dba17a680f 100644
> --- a/job.c
> +++ b/job.c
> @@ -216,6 +216,11 @@ const char *job_type_str(const Job *job)
>   }
>   
>   bool job_is_cancelled(Job *job)
> +{
> +    return job->cancelled && job->force_cancel;

can job->cancelled be false when job->force_cancel is true ? I think not and worth an assertion here. Something like

if (job->force_cancel) {
    assert(job->cancelled);
    return true;
}

return false;

> +}
> +
> +bool job_cancel_requested(Job *job)
>   {
>       return job->cancelled;
>   }
> @@ -1015,7 +1020,7 @@ void job_complete(Job *job, Error **errp)
>       if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
>           return;
>       }
> -    if (job_is_cancelled(job) || !job->driver->complete) {
> +    if (job_cancel_requested(job) || !job->driver->complete) {
>           error_setg(errp, "The active block job '%s' cannot be completed",
>                      job->id);
>           return;
> 

I think it's a correct change, although there may be unexpected side-effects, it's hard to imagine all consequences of changing job_is_cancelled() semantics called in several places in job.c.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

