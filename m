Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C48358AA8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:02:17 +0200 (CEST)
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUY2p-0000YT-Ez
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUXzr-00084Y-Ja; Thu, 08 Apr 2021 12:59:12 -0400
Received: from mail-eopbgr50134.outbound.protection.outlook.com
 ([40.107.5.134]:10055 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUXzh-0000Sf-JU; Thu, 08 Apr 2021 12:59:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6ZWWidnvT/bRtgqCg0ZOSMF0xcGAevG3v6kFKeeRL/SX4/iBc1O6xTRkkv2aDjsU3bTWnPHZ9eDg1it4gXGvRjS34nL0L7HFowjO9oZ0cAgPOT87NxNGIrLoE8bKdzOqcperRA3m7+2eaCqW/iQWojkef2tFOeXrYs+ayI+/N6OX7ZMVVUNHRPDFifWujHVZvkxvAxVbk9JZcgprO7+EMXP36mUlkriAEm2qNJQypC4tW7NNyXQm7S9Se1pyM0QFVLcAbMmSU2broq6S1SMzaaGPNjrzcHSzb67C1UDvyPiYWpwrl3ZpURqB5EkqAHNsbfWSXAccRZ++QMUnbGYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPgLlkfqSzIAx8L7+bH1+xukS8Ne660EYoGH0fgAhQE=;
 b=bbmDRuUWlUoV94OsN6eYFrfGwJjgDXBbwoTbRqAVLxf2D2YfR67XQISZrfpFVK1AvvHihb93uZZL1/q5drBFAuVLg9Ksr9eaBtNKnyxYy7fayj5XsMx3L7hkni9enw7lLkTjOhxidz3u6YNnnvyHutRUlyDGbWMoIPDKaXdSm1+cCdD8/pIVOiOnq9Evf4Z9XejXN7iBlUpfZPHsRtudE7TnEuppR/uIt03lQgnntOtHzet6hNIeAWEWNDLbT2hHKSkfeqmMqtDonWKZUl17Ve6/aoekrz/f1ilEsgzJk/ef7tNFOc1WE4yoJFHoDIjxLvjYQXJq2oljoOe6kuMcrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPgLlkfqSzIAx8L7+bH1+xukS8Ne660EYoGH0fgAhQE=;
 b=VX3f0klLoaSHgVSgs92vPkc3+3vMnUZdvtuhAnzSyM7ICRDcwkuouvPmaRFyx7LBJbtZJL9kGmy/2n2Jg9lnSqq+d5DiJfYWgn+jOp4nx9kyWbAtDAAXtiGdtyCf/T58ZEasgquQvvTZn/lB/4KRXwfbn+JZPXuSOlyKtDcW/7c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6504.eurprd08.prod.outlook.com (2603:10a6:20b:336::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 16:58:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 16:58:58 +0000
Subject: Re: [PATCH for-6.0? 1/3] job: Add job_wait_unpaused() for
 block-job-complete
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210408162039.242670-1-mreitz@redhat.com>
 <20210408162039.242670-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <505ba75a-996b-0c65-0c49-add50e55e3ce@virtuozzo.com>
Date: Thu, 8 Apr 2021 19:58:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210408162039.242670-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 16:58:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aecb4fef-cfe0-4203-69e1-08d8faaf99ff
X-MS-TrafficTypeDiagnostic: AS8PR08MB6504:
X-Microsoft-Antispam-PRVS: <AS8PR08MB65047050178E5949BE4F3E48C1749@AS8PR08MB6504.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pEuUrEiQDz/crN+WTP3P6JT7gqdFUl1HgGc1yFLGl409ptuu4FNANu7ORVazfctpoz37DseEEdLZ9QasoZmL+Vg31oQXfN3TgYsNRBPCEdXiDbw1oH8+SwdnIkUTnr7pFRk66sMbCqjULFEJ7UNUqrwkklhLIpsmL2XeF3JVIu7DGTMac4GlkgPZDqXu4OWVlLzdDyO1MUxd3ULZBHXSh5+hMb/VvplXyqdmqBnB+yCWFroooUusF6voDwqS6UznOC+QEKtCODZitVoEgyh7lq1aWgLJyxGbNykBS8PPgTEGhrptJWTi+3ieTakbSsg+aGcj7i7IqPH/JHSwWexuY1qYofSnbabnTKw4DOSa0JG28DR4KbJGHq52wDF1bAD47mfQGaIsBW/oOPt29ZiYMfaPBnK0snEZ10c67JndAxlPKIVylyy9OKu6z/YBnPh0FkmDuAgbePngZybf09CfFnw3EZvdfj9/FTcqVzFm0eofDVBJC14Hde+40AEEu6h4F2CaR0gziF7eBJZbmPoipUnVRGg12lXSuHNARORzPDma+Q/0gj0MGNioKk5Hd3xP6qNewwc5Xr2iK/aammsxMKwiErlunvHzS+jWInk+NlMKm/v8jcSuggNdof9VRtBw+odJOeONwWnVp25eEUpvmLmQ1YpVTIjXfEh6WBl9ENdUATzVg8hA2T7zFJ1+RGoGlMAubWr4v70L3YnAm/Cj7byJWMqo+Lt4VmYgMW2vIIk0D/vSEkogyOLM46jTNKvYlz5GORa+dQolSsaxW71ikbhWS5b+7ziCC1ygHPLuahXsmrea1fJODPSJ6Y4WBtRfyiHeB8//xx6tl7JJH47Drg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39830400003)(346002)(16576012)(8676002)(54906003)(5660300002)(31696002)(8936002)(966005)(316002)(478600001)(31686004)(66556008)(52116002)(186003)(16526019)(38350700001)(6486002)(38100700001)(26005)(86362001)(66476007)(2906002)(2616005)(956004)(83380400001)(4326008)(36756003)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eHUrbXorNFU5Tisvcjd2WndUYmNhUWxidjRXSTVVQlBFK21hclp1azVvUWxj?=
 =?utf-8?B?OGxSaXYwK3Y4NzNjeDIxM0R3TVVQY3V5SzU0Y3JFL242aG1rNW1VVkdiR1hG?=
 =?utf-8?B?K2JTRGUwRS9rTERSblIrYjBFWXN1eU9YNnJrcVUrYmJRdTFHVWZQV2tmOWJL?=
 =?utf-8?B?ZXpHZlZjMkUyL1RKTG85ckpKNlVpQVluQUFEOUhXYUxyaXFtU08zeG8yb205?=
 =?utf-8?B?ZVVEQzBraE9zWlFIOE0yQVNSN2tEekZmY0wrRTkrcWVpbHlOSm5UbDM0S0Yy?=
 =?utf-8?B?WVdQNkpWamt1dDIwd2pobVRsUGtNOEgvRDhhZVBsU2paalFCTlNscnZuUUFD?=
 =?utf-8?B?M3YyMmlmdFd2VWdGUW9TaTRmU1puK01vM3NsNUlCOFEwVjBPY0pabEpXdTNI?=
 =?utf-8?B?cTBmcGtjSG4vcno1SkJsaU5nUDUrK2Mvb1hzVi9zQjJHTHQzUFViOEc0TmU3?=
 =?utf-8?B?dERqOW1USU01Wk1XVGsrK3ZhOUhMYTNCNElmVDJHR3JSTE1qbjZkdmo3cUgy?=
 =?utf-8?B?czBwcktybjgzdzZIZ0hlY1ZEc0VXQVgzd3ZnQzRtSC9LN29IdnZQSEZsV0kv?=
 =?utf-8?B?YjF1VTFZUCthQlc2Ny9rUHBuVFYxdVRBVjZrU3BoNDZpVmtTTzdPMjBTUkVB?=
 =?utf-8?B?eEpXVzR2OTAzNzdqY1FQM1B0aHJGS1NVV3dYSXhSQTdueUhDZjUxM3k5WU55?=
 =?utf-8?B?VUQ5dzZCQXJpU05mbHBickI3aU1kOHZicFNMZW84cG1DWnByMzVKQzl2TkVL?=
 =?utf-8?B?WGMvNXg1VXFybFdZNHJHdW91M1V2VUR2ajlPZnduR1VJdmVzTTJBcFpHMG9i?=
 =?utf-8?B?SDZkZUZySXE4ZkdJWG1ZMzZubGZnRGhoazh1NmsxNGFJWEVDQnNUMVpqNEZk?=
 =?utf-8?B?WEVtWCtGL0FlTVpEZjh0OGhrYUxiSEl3YWdaMHd1ZXhzTU9UVjRrOXZGcytO?=
 =?utf-8?B?T1ZNNmM2SUVPb2ViZHpJdnZ1dzZKZDhhUDVEUlNhbjVqeVpncHhzRG9FRk1Q?=
 =?utf-8?B?NXE2b3ppL3Jma1MyeEtiNmc4S1R1SW8rNjdjS3M2R0RpaW5pbmZnaEpNZ3Jx?=
 =?utf-8?B?SnU4cmJTOW1LRWd0NUtzRlhTc29tOUVyVkk1dngvVFphQnRqUW8rUEJHbEhr?=
 =?utf-8?B?Rk04V1FqNjFIUTd4NDF1VCtjcHc5SlBHVUZjVG5ZYWJCNk5Ma1doK0lETm40?=
 =?utf-8?B?OGxGVTZCSU1mUUhOWWZtOEFRaU8xdnlwVjNhdHhIZi9Ud2czNndFRTlGZW1Z?=
 =?utf-8?B?YzFYbmo3RWdWVmdZd0xrNXhZZ0U0SS9XdWdxNTYvbkxGTWl6bmRPOVVEQ1FU?=
 =?utf-8?B?NC9nSDl0d1drTXRxbWI0cFo5YkFlWExHeWk2b21kUk9SZHRUY3RGcnRsMWxa?=
 =?utf-8?B?akZ1aklSc2pUWG42ZGluU0RUZ1k2S2k1UXZ6a05mT3Bac1JESlRtZ1BVMEM1?=
 =?utf-8?B?V2pvR2ZXNnc2Y2tieW8xdmdGR3IrVDBPR0JkbWVuUkFIU3crVWN4TWM2R1hz?=
 =?utf-8?B?UC9IdzJXa1pyaERwalNuVUpSNmw5UjNaWEwwR0I0RCtwQ29VQmMyUnN5MjVV?=
 =?utf-8?B?WjFKeTZvVUEwOGxmRDBnRVErTnNoa2Y3MHRZTE5QTDlLYnFXMDBJTDJabUxO?=
 =?utf-8?B?ek12MWxQNGhjSFAwbmJSajZaNXJCNDVJQ3pwZ3lwd0VPSGovdm1OTERpYnZG?=
 =?utf-8?B?M2dYbFdRR0JzcFc5bWZ0SEY3SWJZa0RLYlNXOHYwVGtGVUlJbVNCeE45b0dk?=
 =?utf-8?Q?z8h1A+lmy/fw1FDVvV+eGJv2D2Tw39Jcwgoy9/T?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecb4fef-cfe0-4203-69e1-08d8faaf99ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 16:58:58.4421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lasodVfhZAQgjIFJz28U0qb3Sidz+bBE2DEcvNRTBUFeeLCizB3kvRYOCB0PobXr48ATj6mgX1yiZX5Vi0suZpdkqqQIU+ZUg7DH/oKWGC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6504
Received-SPF: pass client-ip=40.107.5.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

08.04.2021 19:20, Max Reitz wrote:
> block-job-complete can only be applied when the job is READY, not when
> it is on STANDBY (ready, but paused).  Draining a job technically pauses
> it (which makes a READY job enter STANDBY), and ending the drained
> section does not synchronously resume it, but only schedules the job,
> which will then be resumed.  So attempting to complete a job immediately
> after a drained section may sometimes fail.
> 
> That is bad at least because users cannot really work nicely around
> this: A job may be paused and resumed at any time, so waiting for the
> job to be in the READY state and then issuing a block-job-complete poses
> a TOCTTOU problem.  The only way around it would be to issue
> block-job-complete until it no longer fails due to the job being in the
> STANDBY state, but that would not be nice.
> 
> We can solve the problem by allowing block-job-complete to be invoked on
> jobs that are on STANDBY, if that status is the result of a drained
> section (not because the user has paused the job), and that section has
> ended.  That is, if the job is on STANDBY, but scheduled to be resumed.
> 
> Perhaps we could actually just directly allow this, seeing that mirror
> is the only user of ready/complete, and that mirror_complete() could
> probably work under the given circumstances, but there may be many side
> effects to consider.
> 
> It is simpler to add a function job_wait_unpaused() that waits for the
> job to be resumed (under said circumstances), and to make
> qmp_block_job_complete() use it to delay job_complete() until then.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1945635
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   include/qemu/job.h | 15 +++++++++++++++
>   blockdev.c         |  3 +++
>   job.c              | 42 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 60 insertions(+)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index efc6fa7544..cf3082b6d7 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -563,4 +563,19 @@ void job_dismiss(Job **job, Error **errp);
>    */
>   int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp);
>   
> +/**
> + * If the job has been paused because of a drained section, and that
> + * section has ended, wait until the job is resumed.
> + *
> + * Return 0 if the job is not paused, or if it has been successfully
> + * resumed.
> + * Return an error if the job has been paused in such a way that
> + * waiting will not resume it, i.e. if it has been paused by the user,
> + * or if it is still drained.
> + *
> + * Callers must be in the home AioContext and hold the AioContext lock
> + * of job->aio_context.
> + */
> +int job_wait_unpaused(Job *job, Error **errp);
> +
>   #endif
> diff --git a/blockdev.c b/blockdev.c
> index a57590aae4..c0cc2fa364 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -3414,6 +3414,9 @@ void qmp_block_job_complete(const char *device, Error **errp)
>           return;
>       }
>   
> +    if (job_wait_unpaused(&job->job, errp) < 0) {
> +        return;
> +    }
>       trace_qmp_block_job_complete(job);
>       job_complete(&job->job, errp);
>       aio_context_release(aio_context);
> diff --git a/job.c b/job.c
> index 289edee143..1ea30fd294 100644
> --- a/job.c
> +++ b/job.c
> @@ -1023,3 +1023,45 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
>       job_unref(job);
>       return ret;
>   }
> +
> +int job_wait_unpaused(Job *job, Error **errp)
> +{
> +    /*
> +     * Only run this function from the main context, because this is
> +     * what we need, and this way we do not have to think about what
> +     * happens if the user concurrently pauses the job from the main
> +     * monitor.
> +     */
> +    assert(qemu_get_current_aio_context() == qemu_get_aio_context());
> +
> +    /*
> +     * Quick path (e.g. so we do not get an error if pause_count > 0
> +     * but the job is not even paused)
> +     */
> +    if (!job->paused) {
> +        return 0;
> +    }
> +
> +    /* If the user has paused the job, waiting will not help */
> +    if (job->user_paused) {
> +        error_setg(errp, "Job '%s' has been paused by the user", job->id);
> +        return -EBUSY;
> +    }
> +
> +    /* Similarly, if the job is still drained, waiting will not help either */
> +    if (job->pause_count > 0) {
> +        error_setg(errp, "Job '%s' is blocked and cannot be unpaused", job->id);
> +        return -EBUSY;
> +    }
> +
> +    /*
> +     * This function is specifically for waiting for a job to be
> +     * resumed after a drained section.  Ending the drained section
> +     * includes a job_enter(), which schedules the job loop to be run,
> +     * and once it does, job->paused will be cleared.  Therefore, we
> +     * do not need to invoke job_enter() here.
> +     */
> +    AIO_WAIT_WHILE(job->aio_context, job->paused);
> +
> +    return 0;
> +}
> 

Hmm.. It seems that when job->pause_count becomes 0, job_enter is called, and the period when pause_count is 0 but paused is still true should be relatively shot. And patch doesn't help if user call job-complete during drained section. So it looks like the patch will help relatively seldom.. Or I'm missing something?

job-complete command is async. Can we instead just add a boolean like job->completion_requested, and set it if job-complete called in STANDBY state, and on job_resume job_complete will be called automatically if this boolean is true?

-- 
Best regards,
Vladimir

