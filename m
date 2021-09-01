Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDABE3FD765
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:11:49 +0200 (CEST)
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNDh-0004o6-0R
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLNCO-0003wA-8I; Wed, 01 Sep 2021 06:10:28 -0400
Received: from mail-am6eur05on20707.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::707]:36064
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLNCM-0007xR-AR; Wed, 01 Sep 2021 06:10:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nia3U7CYCjzp3SW02hPF7RliwkyBu1c7eVw8nI+uL2b+NdMWMAYY+QAZ8Qx9a+6BSQXSw1ZYr4sK6D0G7bxvZFaRYbzfZ66GXturDv2Nmt9XOk9VamjswHpnUYMIXQkHKUmNIEsu20J7rCTWrwR7DaRGwH0/Fnn1FZNMAqNWE7j5H/8JO+YEfkHheh5G29SHEWeL3Hr6iFlHkkTRtp9KWNWt2xQI/wHPDavt7wSWIy/lfq8EFez4mq6i3CwQxcXerueeQkAsYPlCdDB/Ipdl69xIGRUFoTlxitePNbwxtwQW35gXACDQpcp/jKXPB/U5XkfqX419rClE4GG2OiXnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=OglroIHGxBft0rQSJz5RlRPvyDOa/u5hErEFrfm7IYE=;
 b=BnTa46fvNFW6qbFxCFqcQM98MbB6J6lnwiChdxXw4LeSA0ig3iANyCeZudDkjYdn1U9YdAJlcG2SA7l4YPCAqTiW/hq4C2D1CMoB1/YoJmnFnuJd75CMzdEVSm+FCyHz3VZ5t4iQYudo+sc2Hkv4OSYZRk56z01XaB5WVaAnJ4fOGO202H9QYNLNbnLrRJZxkDiJTE+xkYy25fkGFA3anlw+fpH5/lBGDgC9eBlEPGVZi5CH/nfyX+eywWhuWEWfxLAjkk78LKRX0J2+V/Beg92NBUKyXsyUlYBTNUaf1mMN4NO2IfD3CMhFb0VnMh9wXMfnZGBACfxWf3FnxcRhLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OglroIHGxBft0rQSJz5RlRPvyDOa/u5hErEFrfm7IYE=;
 b=UwQXuXiRE3NKZmwFWMMl6gkWKeUflXgqx7Aixvq9DZTuYuhrfFb1Maq/khsBgUZ8m9ebHF4A/LeMo0+nYnoh7Dow+6UGDcOMGcJaKF2dyhev4JMz5En+FsTuF9fX8Rn+jBYSCuOG7+QW/M3kgsVK/TFAFK41v1Huvt0PLVm2Qd4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3792.eurprd08.prod.outlook.com (2603:10a6:803:bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 10:05:18 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 10:05:18 +0000
Subject: Re: [PATCH for-6.2 v3 01/12] job: Context changes in
 job_completed_txn_abort()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bfffbce1-c62f-5ae2-0de3-202b97fd593b@virtuozzo.com>
Date: Wed, 1 Sep 2021 13:05:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210806093859.706464-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0127.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::44) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR10CA0127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 10:05:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15351911-4fd2-4ea8-ea86-08d96d300019
X-MS-TrafficTypeDiagnostic: VI1PR08MB3792:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3792163E8271A740D212760AC1CD9@VI1PR08MB3792.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAzGh8u/lcPr8B11/FHzphYW/v7xlRn9Ks91Xqxs7qqndMNIu1msq7q50g4hqmM+FtmOL6wXGG0tUegNRS4SLhQCfGJTIVeqh/FF3DI0dhV/NTCznTUxmNjfPgPX7ffFCIcjzYycQeUnYk56KLRlLOIhpIHyVzogbfXPPXJ2T/xHjv9yYzFUtTu5lSfPLlOPUs3c2OchqTRkIXkBZQBwqloGMAH5Ud9t7BD4xZcPTQ+5oRGOdewWNzv0/IpbxAszWhE/0GK8G5Jg11aWTUEe0rGl9+R9BjxMEnbJ+D+r2/ivOarka6S7oYN9T1ekAfxSxS2+YWIsxJXxLNN2Tt8S5p0aqWrI4xr/MGKxI8Hs26NgCR617Q9yqQNWriMOMaU/xkh7ok4HKe6EUxdejqBlUnt16MGl+29nCoVVvAyFyJxb13UXdsrX/O0YSikp2ZW/8zzGFAKHYvLtitFEO0deF+gn+X0RwhefOI6DO0iEGO8WglS1ele+GWOVRieKBuUkIvn8sLi/0mpwIP9QuPCqjvOGfHf4mjpKMcuE5xeqxIBByWQe5INzNtBbjp2+CAtdRqrFDMdOe1MN5lPi2vUMBVMDoxtr7Pp5cBgV0vXwLqOF5egMUDdp1Y2YNw6dR90xYB7vpA6NOvYD/dEfQVWA2UNCnEzDJhz+784Wz63kIIM7PESeWbLzVcl2JL0ez1VIy6EZyiPNc6p16SlpUdNxpK/ooH2vpbq54m56ptXMnSpL+vXQ4bJHSriUti7SgpPckxdtu+tb8TYTigQCOuogIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(38100700002)(8676002)(6486002)(83380400001)(38350700002)(508600001)(2906002)(2616005)(86362001)(66476007)(36756003)(956004)(31696002)(26005)(186003)(31686004)(66946007)(316002)(16576012)(52116002)(66556008)(5660300002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWcxQ0pDNDVwV1d4eld2RzRrTzk3cDhOeHFPaXV3dmtCVVRFbHdMbm1IeVdh?=
 =?utf-8?B?S2lUbllSUXpzNTcwNDFKWkdkYzVhdmVIYWxEc29XWmJKRnk0OU5SS2tZWVFt?=
 =?utf-8?B?ZFl4RWdQSUd6akp6T092TEpuL3NaZlEzNnJvbkFnbFR0T2Z6ZUY1KzJhZWlv?=
 =?utf-8?B?ZkhkWTBnRHhEMFM4Z2lza1A0R0hyYUFqb3d3UTE0TXBLVUJWRHQ5bTRpV2pF?=
 =?utf-8?B?QTU0S3J2U0I5VHMwSmd3R1lCSzdldjhTWkhNY1V4c0l4eWw0Qms0dW5ZVHNk?=
 =?utf-8?B?LzFKMmJVUmNzUklWeVZSSjNsZWdMYVkxa1RBV2txZm9ybHZ2NHpFczdHV0dp?=
 =?utf-8?B?aE9ZZURTOHpSNEZ1cko2Q1NPbGZvR1hiTkYvNnMybk9iQlJXeEtoODJ3WXFZ?=
 =?utf-8?B?T3l5UGNyTUNTaVpETWRQZ1E0dW8yYmdpYXVnZjhVUkRkQ0tJalJzUUZLbmls?=
 =?utf-8?B?ekhGTWZVYXRub1JZY1pnamV4MzJ5ZE9hZUwyWXFhQ1JaeE5Rb3hFUGt3dG5l?=
 =?utf-8?B?K0tZUnp4MENhQTdMZjM1YWQ2eEVRL3pPM1ZBUTRlWG0vOTMzNDYxbHF1V2RJ?=
 =?utf-8?B?blJSclhYelhIUklLNmV3QlZhcm1nZlBMdUxYZ2d2Wjg3SFJ2dTJEblFIZ1Z5?=
 =?utf-8?B?MmF2L0NOUG5ESGl3ZWJ3b3V2SGdzejZWUHVuNFdRNTgwd2hJTjFOQXMzYlln?=
 =?utf-8?B?cnNGMVN3MUM1VWFsbFdYdTE0N1dXVGJiV25jRXFBS0kzUVA2aDhaeStGdlZi?=
 =?utf-8?B?bmZvcnFkTGJLUVJqSTNMSUltVk8zdGdkMVU2LzdtRE1UT25mMHVqRjREZDl4?=
 =?utf-8?B?QWhEWnpSblFTcS9DaHAyaWtMRXNYNzdzaFF6cHVFU0MwZlBOUjNkeXNPTDcr?=
 =?utf-8?B?OGQveFhtcVkvNmNzQ1ZtVHZvcmZvZWh4NmcwaGZUWWNWekFrRWRjRjVDTFZB?=
 =?utf-8?B?K3BnaEFoYmpDMEhqdW1wemIvdkFVQ0x4Vm1NSjZFeFZyaERIcnpiZUt0Rm82?=
 =?utf-8?B?VFNURGY3TnRxRW5hdnpoZ0Ura3hvaHovb0JVTXdWNHZSMmw5dWY3cjhWV3NO?=
 =?utf-8?B?cWxZNHBVVTBYK3VyR0dLWjl0SDRJVHRDZXY2eGxPa0dsUlROMktjaXAxVHY3?=
 =?utf-8?B?R0NlL29ZN1hjc2N4VzBvWmpPUXRpV0JkaU1rUENXRU5UMHYrMnVDUHVXczE0?=
 =?utf-8?B?OEdJMVJRZjArcGxoMzBmRloyRnFDaVpTTXQwT3EwMjFHZjR6V1pTSWVDTE1V?=
 =?utf-8?B?ZUZROEhmRW1QY1doTm9HNVdwaUwyN2ZJOUZERHVoRDhoSUFBRWxxN1JTK0xj?=
 =?utf-8?B?a2UvL2lxM1NCR0h3OWRaVkxSNzB2YnZSTGxTNTY2aEVmVG9VYiszcnh6RTlU?=
 =?utf-8?B?dEpTa0wyS05FWDRjYlZZMGZpV3RoakI1b3lsQ05ldWVzUzNXM3Rxa0Vjb3lY?=
 =?utf-8?B?QVlwZ0ZMSFhmeTJoT280VTJ1bjlySUp2aGZ2SEhsSllLTXdyeitnd2x4M0Ji?=
 =?utf-8?B?WC9hSUczYUUzVWJtRTdPSURJTmNub2pEOTBDWHhUQzNLamZkemxMaTFEalht?=
 =?utf-8?B?SFhnZHJTcGp1Y2VPYXpPTzRaOXd4aklzTE9QU2I1NlZPUWpyZTNmWTBxTUph?=
 =?utf-8?B?eTlMaTFqWGJRdEtBdC84YWlZZTZvNkhNTUlkUzR0bENBS3UydnZFZFlRT1FX?=
 =?utf-8?B?dlM4K0Fwam1weURjTXJxbVcvdVk2dmNCU1BCZWdPenpkUGZGbS85U3JFRTZI?=
 =?utf-8?Q?BlQPimzbyCEYuYbtAXItEhkqAQa/WJBcKcKwT6+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15351911-4fd2-4ea8-ea86-08d96d300019
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 10:05:17.9472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sfYEWATLsAX2UDiCsYP7FPD3/6uuC0q8eeJevyhqVmbw1aquvYMyAlz2wHzU7AhZWq9rIP6IyNDpiVDvz+Smv35kh7lPA7TC8Uq5qP/weM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3792
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_NONE=-0.0001,
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

06.08.2021 12:38, Max Reitz wrote:
> Finalizing the job may cause its AioContext to change.  This is noted by
> job_exit(), which points at job_txn_apply() to take this fact into
> account.
> 
> However, job_completed() does not necessarily invoke job_txn_apply()
> (through job_completed_txn_success()), but potentially also
> job_completed_txn_abort().  The latter stores the context in a local
> variable, and so always acquires the same context at its end that it has
> released in the beginning -- which may be a different context from the
> one that job_exit() releases at its end.  If it is different, qemu
> aborts ("qemu_mutex_unlock_impl: Operation not permitted").
> 
> Drop the local @outer_ctx variable from job_completed_txn_abort(), and
> instead re-acquire the actual job's context at the end of the function,
> so job_exit() will release the same.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   job.c | 23 ++++++++++++++++++-----
>   1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/job.c b/job.c
> index e7a5d28854..3fe23bb77e 100644
> --- a/job.c
> +++ b/job.c
> @@ -737,7 +737,6 @@ static void job_cancel_async(Job *job, bool force)
>   
>   static void job_completed_txn_abort(Job *job)
>   {
> -    AioContext *outer_ctx = job->aio_context;
>       AioContext *ctx;
>       JobTxn *txn = job->txn;
>       Job *other_job;
> @@ -751,10 +750,14 @@ static void job_completed_txn_abort(Job *job)
>       txn->aborting = true;
>       job_txn_ref(txn);
>   
> -    /* We can only hold the single job's AioContext lock while calling
> +    /*
> +     * We can only hold the single job's AioContext lock while calling
>        * job_finalize_single() because the finalization callbacks can involve
> -     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise. */
> -    aio_context_release(outer_ctx);
> +     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
> +     * Note that the job's AioContext may change when it is finalized.
> +     */
> +    job_ref(job);
> +    aio_context_release(job->aio_context);
>   
>       /* Other jobs are effectively cancelled by us, set the status for
>        * them; this job, however, may or may not be cancelled, depending
> @@ -769,6 +772,10 @@ static void job_completed_txn_abort(Job *job)
>       }
>       while (!QLIST_EMPTY(&txn->jobs)) {
>           other_job = QLIST_FIRST(&txn->jobs);
> +        /*
> +         * The job's AioContext may change, so store it in @ctx so we
> +         * release the same context that we have acquired before.
> +         */
>           ctx = other_job->aio_context;
>           aio_context_acquire(ctx);
>           if (!job_is_completed(other_job)) {
> @@ -779,7 +786,13 @@ static void job_completed_txn_abort(Job *job)
>           aio_context_release(ctx);
>       }
>   
> -    aio_context_acquire(outer_ctx);
> +    /*
> +     * Use job_ref()/job_unref() so we can read the AioContext here
> +     * even if the job went away during job_finalize_single().
> +     */
> +    ctx = job->aio_context;
> +    job_unref(job);
> +    aio_context_acquire(ctx);


why to use ctx variable and not do it exactly same as in job_txn_apply() :

    aio_context_acquire(job->aio_context);
    job_unref(job);

?

anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

