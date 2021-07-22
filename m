Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121AB3D2BA0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:01:22 +0200 (CEST)
Received: from localhost ([::1]:56278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6d0b-0000YT-2y
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6cxr-0003cZ-BQ; Thu, 22 Jul 2021 13:58:31 -0400
Received: from mail-db8eur05on2135.outbound.protection.outlook.com
 ([40.107.20.135]:60384 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6cxo-0005qi-OT; Thu, 22 Jul 2021 13:58:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkH3wk6xuP/pqJtq5sIqyF9hd75oBJtb7GJgqwZo0gorBoxiFuE6u2te3sU7UKivYn5knHXopPauP+wRXIAHmJK6xgxmLu45suSkwhg+Nq56GKNn9RvC6Run1zzKo245iMntuOlZHj96j07Xm9S4C2HkdhNNXWgxRNmYb5Bze71FoUZhpLDvbctJ0E2SuD9XqN66U6hfIWF7e/GAO+ONgA8fjrBfmgxgwMEhwuJWURo6SubJsydpTUcBAww1HOQjiojCmuJG4Or8zt/lluJv8SD8Rbb1k2/z0suFrTgMObERp2Un7/Bcy5noC/Ec/fKaq34E2xfZQZbwJs6iEA79nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlIt6jsJzVAXODvBo4By1WOR6Unhz0iA4Sr1nkj3gkQ=;
 b=hJKmdY5GOwQFcz1H88l9NSaqETsN60vf2RLe6Hh9gs46WN9SYNFKp+68CavsO6z/Rp6zWHAoU4fTuQsp1IgvNudJ3nTOCoCtx51mq7yPEOc32rNW/Ku2vq6/wr1GfqBiuVxFBlNaIBYedTRaxuNomtvNrtB1PifTaqFL5ERA3D2WbzWoW/7Mt/ihxv4oKxxx+HG9sOFfzK4ZLzLFvTR6dcDIIBuhXFvQrp+BZVv9o9doJi9fHsoFBq9gfZs1nTuKiDTWNIa2JM7nt+Z29V01mMF0jDLe7IJXVrSHxaYW6GCVp7lqZj8OtnDtf7pPUDDI7ii6BXs7HpU3KX/fL3qNRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlIt6jsJzVAXODvBo4By1WOR6Unhz0iA4Sr1nkj3gkQ=;
 b=EXG4ktXvNgRfT9ITDz240V7SGliulyYmsKnODWMQtwdHA1/+v/FSywvSUFui7k8d2kCifrt1N8F5VHhvNdY/7y9sB4pQl9YhLnyeQKHvQMPrLcda3Cz4mo5YqR0ftWy01APpxPhwqmgxlOh/f0f4/thDIcZu8df/CywAipo2FBM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Thu, 22 Jul
 2021 17:58:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 17:58:25 +0000
Subject: Re: [PATCH for-6.1? 4/6] job: Add job_cancel_requested()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210722122627.29605-1-mreitz@redhat.com>
 <20210722122627.29605-5-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a6a675f1-4ca3-a657-9fe0-35b73a6f441a@virtuozzo.com>
Date: Thu, 22 Jul 2021 20:58:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210722122627.29605-5-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0037.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 PR3P193CA0037.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 22 Jul 2021 17:58:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 204aaf9b-984e-4c57-9d35-08d94d3a4db2
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59095827EA2F1B04D4249020C1E49@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LyuHiehssDU9Kt/ZT8bs17wzpbKc+lHWLuqVS1pDRfRNbChXgBRn3Mrui5wQVBun6REMjTZE/GHur506wxMuA+n1xIM/Seh4BF32lT0Ao/b8HXwGkxTXM3BmpbVZAqusZ/3CxYOxxxPY/Anh9di+rBVj3bdkXiwfRGsGZXRDu2FRpc8/FjypA4Vvjx2QfHYraiWnPmQqc+bYwh+tPVfmHHn1VnrVJYKRce6mEPLPoumzCdcn9lTKiip+WYcYvvgmTVmG2i2+98V6urYeEnUntxCXSfOr7atS3mQAH/tRTeilSosCAomzJ9QpyRrxxqALLLqfcf/RPAheBif9loxHvvDqsqpdSBsiQ7P+BXKxIhjX3YJBMgQx/QAjwVEaJXsb3Nd1090PV3mCg/EjqsnmjIiqVpljWjy6K2EdkveP6ahrN1t9DRcSkE5zEqcuVcRBA2m5bUz8E4R/KUW9kGn6la80tuXKZtJ0Pjz8N2+dn6lcdEQgAPh6eNYBD7AMxcOSJQpciyt0vD6zNGaKd6e0kJpBxrHQwR+zfKeSuV6vHo9gyYeM/KlWFs/nlGw66tbad0u1LHSX9gjCgUtr1Afno5w1W4e0ITPMGlR9sf0fm38saxtZnEUJdc8L05RWmoEZLifru6Gb1ZmNB7O/Ilt1tLdodhM5E6QUlxAQK48kFn9TKzsKzL7EOhGvt+Zwvqu6xNcTmKoFlGOe/r48+hpXguc/sdAl++hlyx01pKtlVv0j+BYR3QaCJZMdXqbRc938WGwl6QeU6PstvOiTkmF4CQ0sYUS3wrrvQz/jD/6xWI+Jofi7NckgHUaNeSnkpRcXQWhluSpLNjv7B4CAm6LIOY0gA6yVMuBY0v7NmJoVQ2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39830400003)(346002)(38350700002)(83380400001)(31686004)(66476007)(66946007)(6666004)(16576012)(956004)(26005)(2616005)(54906003)(8936002)(478600001)(66556008)(2906002)(316002)(186003)(966005)(38100700002)(36756003)(52116002)(4326008)(86362001)(5660300002)(31696002)(8676002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RXSVhBTGN1VHZ6LzFMWFBNcU9hcStEZ3luV2twNnZNa1FRYk9ZcHBaRjBq?=
 =?utf-8?B?ODJLcDdWUW9mM09xWEJhZjFvVlZHMFhzbW14bU4rblNVSXBXRDU5eWxSQWVZ?=
 =?utf-8?B?eHgya1pRZ1k3SC85N2xzTDRSTlZRVFNYTzN5NXFzVG01YmdpSjZhQ09LR2tN?=
 =?utf-8?B?Q09lMVBWNTdmWmxMMndFWFF3clhTWlJod3JLM3JXT2E5QUhkZERtMHNsV2RD?=
 =?utf-8?B?SURIdjVmN3NRQmRsUFJJUHUrQVpITWxXbSt4K0F0eUhkazJwR3BLcTNGQ3Yw?=
 =?utf-8?B?RFlNTklrUGxxSFgzQUtmcHl0THhkR2ZKcmtHenNZdTBCbWlkWmQ5RHVjeWgx?=
 =?utf-8?B?OWtZc0tsR016dGNCZ0YwUXRtNkVtR3JQWVFaUGlScVpsUmZmUHpya0J0MXpZ?=
 =?utf-8?B?eEpqaXc1UFZEQS84UzFWYndLcDJRQUV4YWdMUlNWWmdONVcyY0kwRzlsK2tK?=
 =?utf-8?B?R2hDaU9oTnlGSHNSY0xRWGZKNFgvbnp4KzRzVFNveGd3bTEyODFYSzBLUEZV?=
 =?utf-8?B?aitwaXVybU9BQTVENmNEUlhBQjhZMVpRN0FoRkxXM1R0Sm84OGtubkNuNjMw?=
 =?utf-8?B?SU1RQlBWUVh3aTMvTDREQXF0NEZ5dEZvZFdlOUR6Qm41cUUzL1lXcEZobjda?=
 =?utf-8?B?WEo1SktFeDBsVVRIQTdXb0NrM3l0aFhMeEF3RDZWUGtUTmMzQ2xEVkVGR3VI?=
 =?utf-8?B?bUR4TW9JSlpPT001MXlWMVpzTGQxVlJEMHFPOWZJcDNRRVpUM0dLYjZVM1hy?=
 =?utf-8?B?ZS9UNGVRWWxzY3Q4WEpPT28yNmhoaXVNbkVrN2djWG1tdWJhNjh0YzRDZnBt?=
 =?utf-8?B?dG1XMmFHMzJ5MGpGT3RYdk1WMXJCakMzL1FRQ1VpTWJlYU5BaEUrazN4Rmo3?=
 =?utf-8?B?RUpIRThCb1NGdHZYYlFjUnI3UWVNbHFBRG1uaU1sY010dUZvMytEMHZUVTlG?=
 =?utf-8?B?ZDAwRWN4Nm15dnpRN0tEQjdUQXZ2S3hFY2p0Um9UV1pHWVg2am0wN1plTUM5?=
 =?utf-8?B?U21uM0twbXVlNDhWKzNYd2tjOFZhdW1QbkFyM0VjVmE2Z3ZDWWRJTEU3UkFJ?=
 =?utf-8?B?NUdsNGtHaUpRbk8wQURBYnZjMzlmSjdzcU1wRkRIcG9SaHI1S1VsZkx0MEo5?=
 =?utf-8?B?d0FwTGVXYnpHYzVxTXlhNnFyNXAzQUpNNnpOWDdzdzhsOUVrd0NGVFMvNUg0?=
 =?utf-8?B?Y3BwTFh6NWl6QnlLd3hiNElaZmtRSkFmU1lZR1M5YmlrN3lUa1ppWWRaUm9R?=
 =?utf-8?B?NHl1cEl5RzhiVXF6MUFoVU9FM0FhcWkxS2hNQ2JSMUJ3MEVXNUxuMndmalpu?=
 =?utf-8?B?cDJGVmRPamk4YTZJL1lLWlhiVWxpbkVhY3VDTFh6dmR5MjlTcWtGZHlUbndm?=
 =?utf-8?B?c0k5cDE0ckFpa0NxSFMvbWVoc2VyQkQzUDBnMTdlVXZ5VC9PWTNCcUdPUTR3?=
 =?utf-8?B?eGRabWVpcWJzRzhiVjc5MnYzWGZOM2pqbHNQcmZNNzZsSUlpMi9kWHIyWUpa?=
 =?utf-8?B?dVNVMWgwR3lUY1JIVlpjWis3eWF5S1ZHSzJVVm12cUVlWVBhcThiN3BtWjRn?=
 =?utf-8?B?R1FOMDBYUDJMQTZpREg3Y0diKzhsbEE3bkRkNlBMVGZqV0Y5bHVDSkRxeEFm?=
 =?utf-8?B?UHN6Qi8wazdjQzM0MkxoUVZRY2RiTXcxZEZ6VjFiQmJJV1JGMFhBQnNlNmxF?=
 =?utf-8?B?ZU9PNUF4VlJFNHVZelJGa2Y0ak8yZDRnQjJaeDBaMXFzbVJLWWRDV2R3V3ZL?=
 =?utf-8?Q?yeOKv4I06Mkf+is9JTgxGHk0Rx19AP/8UDY2cVh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204aaf9b-984e-4c57-9d35-08d94d3a4db2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 17:58:25.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JunBgpmAW9GGyeRKaNE8bHzcR/xzF1j7S/y5qrHsB2i60p6qiAWXnIAOy/5NkE1UMyxUnRmi802LSAtYBJ55Fhpq9bxLbnb1j8U9V6Ld/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.20.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_NONE=-0.0001,
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

22.07.2021 15:26, Max Reitz wrote:
> Most callers of job_is_cancelled() actually want to know whether the job
> is on its way to immediate termination.  For example, we refuse to pause
> jobs that are cancelled; but this only makes sense for jobs that are
> really actually cancelled.
> 
> A mirror job that is cancelled during READY with force=false should
> absolutely be allowed to pause.  This "cancellation" (which is actually
> a kind of completion) 

You have to repeat that this "cancel" is not "cancel".

So, the whole problem is that feature of mirror, on cancel in READY state do not cancel but do some specific kind of completion.

You try to make this thing correctly handled on generic layer..

Did you consider instead just drop the feature from generic layer? So that all *cancel* functions always do force-cancel. Then the internal implementation become a lot clearer.

But we have to support the qmp block-job-cancel of READY mirror (and commit) with force=false.

We can do it as an exclusion in qmp_block_job_cancel, something like:

if (job is mirror or commit AND it's ready AND force = false)
    mirror_soft_cancel(...);
else
    job_cancel(...);


> may take an indefinite amount of time, and so
> should behave like any job during normal operation.  For example, with
> on-target-error=stop, the job should stop on write errors.  (In
> contrast, force-cancelled jobs should not get write errors, as they
> should just terminate and not do further I/O.)
> 
> Therefore, redefine job_is_cancelled() to only return true for jobs that
> are force-cancelled (which as of HEAD^ means any job that interprets the
> cancellation request as a request for immediate termination), and add
> job_cancel_request() as the general variant, which returns true for any
> jobs which have been requested to be cancelled, whether it be
> immediately or after an arbitrarily long completion phase.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

[..]

> --- a/job.c
> +++ b/job.c
> @@ -216,6 +216,11 @@ const char *job_type_str(const Job *job)
>   }
>   
>   bool job_is_cancelled(Job *job)
> +{
> +    return job->cancelled && job->force_cancel;
> +}
> +
> +bool job_cancel_requested(Job *job)
>   {
>       return job->cancelled;
>   }
> @@ -650,7 +655,7 @@ static void job_conclude(Job *job)
>   
>   static void job_update_rc(Job *job)
>   {
> -    if (!job->ret && job_is_cancelled(job)) {
> +    if (!job->ret && job_cancel_requested(job)) {

Why not job_is_cancelled() here?

So in case of mirror other kind of completion we set ret to -ECANCELED?

>           job->ret = -ECANCELED;
>       }
>       if (job->ret) {
> @@ -704,7 +709,7 @@ static int job_finalize_single(Job *job)
>   
>       /* Emit events only if we actually started */
>       if (job_started(job)) {
> -        if (job_is_cancelled(job)) {
> +        if (job_cancel_requested(job)) {
>               job_event_cancelled(job);

Same question here.. Shouldn't mirror report COMPLETED event in case of not-force cancelled in READY state?

>           } else {
>               job_event_completed(job);
> @@ -1015,7 +1020,7 @@ void job_complete(Job *job, Error **errp)
>       if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
>           return;
>       }
> -    if (job_is_cancelled(job) || !job->driver->complete) {
> +    if (job_cancel_requested(job) || !job->driver->complete) {
>           error_setg(errp, "The active block job '%s' cannot be completed",
>                      job->id);
>           return;
> @@ -1043,7 +1048,7 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
>       AIO_WAIT_WHILE(job->aio_context,
>                      (job_enter(job), !job_is_completed(job)));
>   
> -    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
> +    ret = (job_cancel_requested(job) && job->ret == 0) ? -ECANCELED : job->ret;
>       job_unref(job);
>       return ret;
>   }
> 


-- 
Best regards,
Vladimir

