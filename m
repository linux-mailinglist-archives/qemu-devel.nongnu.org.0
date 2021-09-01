Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA423FD78F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:21:41 +0200 (CEST)
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNND-0002A5-3w
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLNLu-0001Gn-LY; Wed, 01 Sep 2021 06:20:18 -0400
Received: from mail-eopbgr30105.outbound.protection.outlook.com
 ([40.107.3.105]:57265 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLNLs-0007uM-0t; Wed, 01 Sep 2021 06:20:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNmJuzGXgJK+Mw6wuHUQvTn3tqtrHJ0BZPNC3Au3zXnXt3cpz+8uQi4GdFEfyJn5HjrFty8/Y4W5GMaAaa3fS827FOpw218CiKyDcJC7ZmzP0yj+JNBs5UHE61QZAbj/qruaa5aoMmdu0LJboRs3Df5BBcG1ah8AcoqwplknoKRK7JmNcd07zlcYrKw71wCr/y1Pevu5M6vSJIgVBzrH0ydf86svikA5Md3xIAE4PUk3yr4wCqT5cjHjNm4MFhVH9PoKYhmh4wuUraCJrTI8MGjSDJEiSgvIioBwWP1/Y2SwB7FE2wgPuQuPW7AFYmABtcVl53RW5hQcfOFw39DkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEoR2ZU8QuJ2ZyocPYIhdEHmL7g5r1wdcdfbOKAJeVE=;
 b=SHEnAaAMMSSfFgcvr4Kh1BGhF7zvyPjpau1sktCdOeaKM4LAQKfaY0nUIFqMwC5niFJWAZhVIEOygeRidKCmntwHSk286cnCmBlEyihdFRARRrRdxWEf2NwX5X2QBrWqt468Lv2WrJqfpVh1IE43aZjAKnMtctfsyU+0SAIVYRX6KyOb1+zy7+gHXzmX/nQ4XHwrdEDkG9wYf/eI1REB5PVuSBAFpMhsDu06IxaqR6CtEwo/PsJ5Bck+CjzzILfaxxhWSe5LDMKr6gCMUjy8meJqwwBLkf9ESYzYb0IWpqSp0Fq6BXYl4AEFfVIVc0M840cK51SSYhUBbosKtFRbYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEoR2ZU8QuJ2ZyocPYIhdEHmL7g5r1wdcdfbOKAJeVE=;
 b=RWh9jkiRNMXCA0ejmaOwvWNTBJuwg3W3aQ+5UpuMCj8itXZvZLALC0DT4XBlXrPZm1iozZSg5NL7Mttn69DM2dUha1fcDsK1dlMxXPlXhsoptIbJcp6jp/0fluGpMDyNiQwSqxhijHDe1jSS/ikQ6/rgVwwES+/82JP+4DD1HNg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB1872.eurprd08.prod.outlook.com (2603:10a6:800:86::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Wed, 1 Sep
 2021 10:20:11 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 10:20:11 +0000
Subject: Re: [PATCH for-6.2 v3 05/12] job: @force parameter for
 job_cancel_sync{,_all}()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-6-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <efd845f6-e62a-88a1-2ef7-0960714ba63d@virtuozzo.com>
Date: Wed, 1 Sep 2021 13:20:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210806093859.706464-6-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::26) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR3P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23 via Frontend Transport; Wed, 1 Sep 2021 10:20:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dac254a-66f0-47fc-464d-08d96d32147b
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1872:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB18722CD41D0DEC4776451B78C1CD9@VI1PR0801MB1872.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qa+H4+zia3XHqyEWaPlUTauaFPryOGN6dquqzCRFDRKE3sLwBM86G1cjVQLjsb2lGP1En3Bu7uAqZZQqHy6kwCnK5e591L/kxZiG1qT9IYp/HJzO+zXkq7F/j14Net6jht6I5csNFdzEV1U2QyE5CLuAxgwreQ8VcuE+oTSywsee6UsLjwEDKCM09ythmIG4KY30SKWFZ/Ocu7YIiddqAZRVL1RGGAlTo0/v44EmUFQJxI+ozmCictHosRTzipLJjMq/VV0p3pQLOsODbPpLZvolJ9AgMtPWDOoA7RLlGq2ylCarjLTkB1fVEuwGzMbBwJawhMY+HqOW1iazEZhEd1e1SADpt7B+nmDyFt/yWYAYjBB4AVeWLEvXB/QCnC3XwlBYpzkpdPOtFZnCbaLRwbgT3pyhUeaCdvliXfNPSs4Br9z6+aBYiBbYU/TYhmVoqLbTNE1f6bXrlcpSiaFRJa+vCK/brplXqpjRtvoWEpUnnP9pSUYIJykNaX0f+Xe0HZXzsT9LTR9xdqxRr6WvGxhOx8fJLeQbnk6eUZfquMnNDBo80j48T2dAzfPRJ8yDjJ2QQDeCg2gY6mmtndtd8a5u0QHxrkZ+y9yrgYhQgjknZsa81I69e0Joh1W0dWg1qbZ7CRJEoQH8QS5KvrcU4bHD/AJab4zDtNd1ZYutdCn4GB5iF7Ccgs9rAQE+ToYzAItVPZ3C3hpL4UCqz+/C+0NZMbDk9rrrRIwbA97Mtw48YVOhYgCS4FDCJKGwDeFJe6ylMPRW+A1CEAIpawTCPaATYD8aKzh89o2Kvpj6/bzrd0v6HhSsA79g1uzANw2DZpubQIzguNcf9NABbyc/E8WPUW4pPibapIIPWWHiCQw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(16576012)(38100700002)(2616005)(38350700002)(316002)(86362001)(83380400001)(2906002)(36756003)(8676002)(26005)(6486002)(508600001)(31696002)(186003)(5660300002)(8936002)(66556008)(66476007)(52116002)(66946007)(4326008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUdHRFRwa2xuUG1PRC84bS93c09rMlJPSVJ1UHlPa1hkY0tJTkVSQmtqOHV0?=
 =?utf-8?B?R1poNElYVldoRnI5c1o5b1lHa1J0MXFpc2s5LzUxZnpoZVNRWnlORTFjamtI?=
 =?utf-8?B?TUFNQlhrcVowTzJrWEZEQjB1VFdyQWtCcE8zcUIrY09NNmcyanN1cmhpWWFs?=
 =?utf-8?B?UmsyUmljWmQzRUVtOXFVK0h5UHQ1MGRWNGQvYzI3am5KUVlkMGNxVW1HTXFU?=
 =?utf-8?B?aEdFYkZ4VHkvbUZBNXRhZVlMUXowKzhHSDlENE43RU1BQnNVczVxVVY4MFJz?=
 =?utf-8?B?SDFTOEtYV3NSZTZtUkVqd3E5NStLMEZjTU9rTnpKeUhtU1FlYVo0OUZsL3Fi?=
 =?utf-8?B?TXE3Z2tzNnVrR1hJZGFZdE1tTjVyN09zTU0xNUQzS2JNMDVDcmNDTTQ0V2dO?=
 =?utf-8?B?eG1EK0lGK2hia05Fcm9QNHZGUUdSWkV6MGJlTnZTdTZCUklhOWpjeEViUHpj?=
 =?utf-8?B?ZWFmdjlhL2hmcm9YTVFzSjNDUTlSQndhbkdkYTRVT2dMT2dLTDh3UHdaWWFv?=
 =?utf-8?B?MmtFaHZROHZYc2pkdWZRN0QwaTJlN1J6Z3RhaGY0a2FvNlBpb2JOa05JS0pj?=
 =?utf-8?B?R09lUjE0dVB0ZnR2UXhuc2psbk4wUVNhMzExc1l5emc4UE9YUnAzZmZCS2Vz?=
 =?utf-8?B?RFgxT0p1dUNBTDFTV2Vkb3pSNU84WDVYbWw2dFZLUU1UdXZFRmhHb0FjWUcz?=
 =?utf-8?B?UGIySmhYaktwUmhzRmpqRDdXdmRHTnBqR1VBTjdlbStXU3J1NnVsUkloNzN2?=
 =?utf-8?B?RTlmNkUyZXJ0SU9CY0lDRnVUSDJrcWcrVzVnREltc3BXamJJWkU5YU5XTmpB?=
 =?utf-8?B?djlaeThhd09ZN2tOdTg3b240TWI1cDVrbmt4QVRPd2tkV1F0bWRwdU1XRzN1?=
 =?utf-8?B?bmlua1NWZHQ4ZSt3ZFc1VERyVDRLZzdFMDZ4S2Vya21CNCtjbmJSMUNKNGw1?=
 =?utf-8?B?VHREODk1c1RMbjBjWG9ITWhHVEJnNmgxTnlIMzZpbG5QVDhQZUpsWGw3N0N4?=
 =?utf-8?B?Z0I4NnpZSTk4Yi85aG1DV29Da2ZSU2diQmZhL3JGZEVQdDU0MEVla1ZBSVdX?=
 =?utf-8?B?eHlzNGhjQm9GUDFBRXYyNEZueUIrY01uK0tnT29DT3h6SzJwL2JnbU8yZWZw?=
 =?utf-8?B?L3Zzeld6U3RXN00xTUM3bnViYjBEMHBTVy9iZUtkZ200VmFXSzR4cU5jNWEw?=
 =?utf-8?B?SDIybHEwckZGMnNZZnVpTGVIcEQ3S2IzaWFrT2xlekF6SkNuSjJnQnA5YWNP?=
 =?utf-8?B?Q3hNV2VIUHBNQkluMGlnQVlUaVo1eXVzNTM5RmZmaHVidTNOYjlZTi8rM3Ns?=
 =?utf-8?B?VVRadVVlS240K1YwMHljbk5KN3lUZVN4Rlc1dWI2NjlKVVRqQjZFdFJmWEtK?=
 =?utf-8?B?RytVYmtXd0pxRVpaQUdYdS9oM1BtdEEwMFFsOHkrOXNOQ0d4c3BSNFBlYU16?=
 =?utf-8?B?QUpWWS9EZUZLQldCajJKZktpV28wdGpKZ1VDL1BsSThxS1M2ZFR0K0xITlJS?=
 =?utf-8?B?QzI3NjBhNHVheXNyd1VHZmJFeVNaODZHakFtR2pBUGJyTDBOZzRIdHUxZkxo?=
 =?utf-8?B?R2dTS2FDMXJ2QTVtbndKUnJzcWw0dlNZOUFLZThqTVJLdXVjVjJVcTR2UUl1?=
 =?utf-8?B?a0lyUWdyNG4wa0c2OUJOT3pOMlFwZG1CSm5mZ2pxWktlSTBoWjBxYTNqaVo2?=
 =?utf-8?B?Y1A2cGVjVzc4Yi9WVGRsNzA2T05odjNCUENYS0sxUXRZTmlJUFpvaFN5ekVS?=
 =?utf-8?Q?DA8ulxjLWsJ/OdhwCRRLwENWks3hRwyzbbHlw+U?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dac254a-66f0-47fc-464d-08d96d32147b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 10:20:11.0505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZ8Vem7ZGds975A4VTXX0ivk3AkICzvWNn6xjiV7quGmLmNTeHzI3i9iaX1r+/NcbQ+Pl8M84w7l/jyIsYYV8JsNX+zyOST77Oazm1y4HHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1872
Received-SPF: pass client-ip=40.107.3.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_NONE=-0.0001,
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

06.08.2021 12:38, Max Reitz wrote:
> Callers should be able to specify whether they want job_cancel_sync() to
> force-cancel the job or not.
> 
> In fact, almost all invocations do not care about consistency of the
> result and just want the job to terminate as soon as possible, so they
> should pass force=true.  The replication block driver is the exception.
> 
> This changes some iotest outputs, because quitting qemu while a mirror
> job is active will now lead to it being cancelled instead of completed,
> which is what we want.  (Cancelling a READY mirror job with force=false
> may take an indefinite amount of time, which we do not want when
> quitting.  If users want consistent results, they must have all jobs be
> done before they quit qemu.)
> 
> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz<mreitz@redhat.com>
> ---
>   include/qemu/job.h                    | 10 ++---
>   block/replication.c                   |  4 +-
>   blockdev.c                            |  4 +-
>   job.c                                 | 20 +++++++--
>   qemu-nbd.c                            |  2 +-
>   softmmu/runstate.c                    |  2 +-
>   storage-daemon/qemu-storage-daemon.c  |  2 +-
>   tests/unit/test-block-iothread.c      |  2 +-
>   tests/unit/test-blockjob.c            |  2 +-
>   tests/qemu-iotests/109.out            | 60 +++++++++++----------------
>   tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
>   11 files changed, 55 insertions(+), 55 deletions(-)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 41162ed494..5e8edbc2c8 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -506,19 +506,19 @@ void job_user_cancel(Job *job, bool force, Error **errp);
>   
>   /**
>    * Synchronously cancel the @job.  The completion callback is called
> - * before the function returns.  The job may actually complete
> - * instead of canceling itself; the circumstances under which this
> - * happens depend on the kind of job that is active.
> + * before the function returns.  If @force is false, the job may
> + * actually complete instead of canceling itself; the circumstances
> + * under which this happens depend on the kind of job that is active.
>    *
>    * Returns the return value from the job if the job actually completed
>    * during the call, or -ECANCELED if it was canceled.
>    *
>    * Callers must hold the AioContext lock of job->aio_context.
>    */
> -int job_cancel_sync(Job *job);
> +int job_cancel_sync(Job *job, bool force);
>   
>   /** Synchronously cancels all jobs using job_cancel_sync(). */
> -void job_cancel_sync_all(void);
> +void job_cancel_sync_all(bool force);

I think it would be better to keep job_cancel_sync_all(void) prototype and just change its behavior to do force-cancel. Anyway, this patch always pass true to it. And it would be strange to do soft-cancel-all, keeping in mind that soft cancelling only make sense for mirror in ready state.

Anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

