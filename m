Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7E53D754A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 14:47:59 +0200 (CEST)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8MV3-00033X-Td
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 08:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8MT3-00029D-1G; Tue, 27 Jul 2021 08:45:53 -0400
Received: from mail-vi1eur04on0725.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::725]:9698
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8MSz-0002Te-4L; Tue, 27 Jul 2021 08:45:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4VFuFfu7j60CiqZexlsTQPsqThRkf7YIsMToeyf5yzhCsIRV1X2dfqNflLN+b6S7026vK90eGBkYftgG36VFvzwPr+9N4AmwbVOumVwmOJesKAyOo63IVqyx4qvOZ4rnNq2Bp2YiClDFJyG4kBZVP7CbpwDmqfJ5P29jhU6CvxANPrECiY0c35IvFG+5j0/TGQvPUgdVWIzxdxTYd/Px6UXqADonfgQIzOmdg7iSInH+asovdnyG4aEAR7oOKrck1DM9bUqqtbKgOXTi/igoPXOLxkW5ckFvlzZaPQWAaKk/fBw6BrRynohFB4K5LZF+8EgrPh1MbsdOn0pT4AVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAxO/0RvTSAeEN+TRAqugpNf4RwdGbI8K9SIPrK37o4=;
 b=KmWuskHZRWstj4MwC+3gwpa/4HMqliZl9cfaGWly7bLjBWD/BnindVg0K2gjBPNaLaNaZEZqi2jdaRdc7Ect0Kls2ydbs38K6yVX4p/s1qlx4+NvQybmFYkPbAtgEtzBCrYogAnALpyfCDFabevj4BvpV4XCnPaA1H/7fsOZCkdvFoY3iNasYe+Gw0mW8P88vKFs0mltVsqYU+hlKFxmNeFfL0hkycxcFcbf95jbONrNFet2sf2GsW81NKnWoGpdCGSlr3vAl5yh3cmj4Jkiz0pTMGt9Gq04LUjiSiAbmi+6+HKcmrH9zOmvd8mS9WBlpwB+pBsFZ9qG1LPMpLMEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAxO/0RvTSAeEN+TRAqugpNf4RwdGbI8K9SIPrK37o4=;
 b=tzCuU1FllmujwvF0FhrRRKCh11i7IpzgEgTisXcGBHrVyJII1Yz2vX0qz+qFgoC+Rm/U939lGtJTC3bS5wAy28AfCabXd9iNSMRrXAYIBZbCd6TPMWpd/XyvyE8IImsO5Pag/iqh2TzPDUJlofXg6AIUZoBVEfq/SB99v54/aEo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 12:40:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 12:40:42 +0000
Subject: Re: [PATCH for-6.1? v2 4/7] jobs: Give Job.force_cancel more meaning
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-5-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <578263d0-5c4b-c5bc-b649-fcd14bdccb19@virtuozzo.com>
Date: Tue, 27 Jul 2021 15:40:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726144613.954844-5-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 12:40:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90cd1062-7d74-40f2-3fd1-08d950fbbf57
X-MS-TrafficTypeDiagnostic: AM6PR08MB4214:
X-Microsoft-Antispam-PRVS: <AM6PR08MB42142BF2F86314AC3B5534F8C1E99@AM6PR08MB4214.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YiMdEMpSvwoLOpEdLiav7lzuEEgiRmxramM70v2OyhFBLpQmhNZHF79oXVnLiY2ANf3OcfCnzSUq4NuRVRAyTj0emK+lAwJH3/NFSGa2yFd9CsZRBS7Ck57QLJX9ba3i4/LjH7W5WNnowf5XNqp4Wj1HSoAkx4U03grotbgHo+bFdAxMNvdN4EClNvmJbf9iRr285Gpb2bqZaEBKdQ5EQijW6Wr1cQ5kiHj7KtKjKY0Oyu0PVnp4a1xT63G7p07JjHuTkpFUNJ3laPEJT8uqMaaYS/JD9R0Ukk8mn50jTv9yEmiotb0PaJFZYt3Gth1Vs4U0eoQTUQf7Brjv9gxoo5d1uGGr1swp4OPaq3RT8PN0ZBaYvWuHpcvZs8Qb3l8bPJ+uVo26dMblz4MdIKqNYpfpKIiwzgTlHrEn2J/kHYy5e/j1m/JYNdTGCLBI/RJDPLuC5WN0Gna+y84qOhI2JqoB7Bg6alp0XM2eSnIKFAFKEJfrHMsy5JYJvndq8CIaeeLKSYGxVTwZJqEn7MX8qdGwXqUqvHkyg+umbbGfcNm87AQW/F3BqAxWfJCofS4c23yXm6ciYheSGhOJLv3G3eySEOVkaS+QP/KQaxX3vD1TsK4WuGeh04EfCu85pg3mP3X3hBYbyHxb8xfz36xpnIKOuq6HPJPqHP5Us50Pc+LoPsqQWld5gpAcHplk1j2XiZ49HUBLIxBz6QVtT9GQYtc2T+869AH8h6qdmH7eSTiuwZdm/iRFokpSzZDVsUm2tRj/4MdyIb03zcR0OjCiqFIMDIxXcphitQO+KTIXh+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39840400004)(366004)(2616005)(956004)(316002)(8936002)(4326008)(5660300002)(36756003)(8676002)(66476007)(186003)(83380400001)(66556008)(66946007)(52116002)(26005)(31686004)(54906003)(38350700002)(38100700002)(478600001)(16576012)(86362001)(2906002)(31696002)(6486002)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3FNY1Mrdmdua1dnaXBYNEpkZlJQQXZDK0JJNGZlTHNIejh6b1hoUVFQdG5I?=
 =?utf-8?B?SnduNysyNWhSV0tNQmlScFdFSjJBZDN3WFFTQ3p2WC80QUNNZWlmUi9XeFho?=
 =?utf-8?B?b0RjWXRhZW0zUHd6U1BzN045Vm9sVGpOQ1R0ekJDekVjRXRCVC8yTUI4QURH?=
 =?utf-8?B?dTVQazBtNzdyR0ZJZmdvQVZuOVZndEFMc2ZjV0R2Q2tMckxSK3B5eHVxVVNz?=
 =?utf-8?B?REQ4a2h3eXVoWWNOWlhCYkNsQjk0dUdmbHZJWkZObFM3dXRUcy9xcytxdTYz?=
 =?utf-8?B?N1B5YVFzSUZCLy9vVUd5K0FYU0lLM245d0ZobVc4TklhcjRabFh3YlBMUzdO?=
 =?utf-8?B?c2NiTEZJeEd4R295MjFDMEVJdVJrdDhJV0M5aGJSdjdJeEgzNjcrZXpHTTRa?=
 =?utf-8?B?V0F4Uzg0U2oyZmcybExvdTRQcUdWMkJZY0VQV3lYTnBTdzJvVWxHOUx6dlZ2?=
 =?utf-8?B?WDhBVlN0SnQ3R0JxRVU4ZjdoYmxiSldsN09VL0R4NllSQ3JrU3Z5YnFmVFgy?=
 =?utf-8?B?MFBmL3laUXQyYW9jRU5iZ0RWZEJtNzlyeElkWForaytrZGJTb2E4UEZXeVdo?=
 =?utf-8?B?NVdMaGZTRTRnNTdYU3hBWHFqWFJmV1gvTXNkWDR2SFhEdVNFc1kvNkUrM3ow?=
 =?utf-8?B?dythVHB2dTczdy96ZjlCTDdidUVWMU5vR3kwMEFZY2NTODZHN2RnQlN0cVNE?=
 =?utf-8?B?R0VldHV6a2hRMjlITDhoSDRKeit3dU05R2pkczR3eUJMMFoxNGQwL3VaTHN0?=
 =?utf-8?B?RGU2UUVzWTlpUnBEUVFuSDlUa3greTRCNWN4L2EyYkdZR21OdzNNNjQrNE5a?=
 =?utf-8?B?N3BBalNxdHltVjZVbDFHOUhudVRwZis1bU5Gb3l1Tnp3NTVzNjRVeTVPZ3pC?=
 =?utf-8?B?eTd1dnFmaFhDTng4RmNNWW5TY1JqYkM5b04vMXVYZE9pK3lGdlFUeEZicENX?=
 =?utf-8?B?ZVBDdGtPUzRzMHJpTXBBWEJJUzJXTUNDVG8yZXk3WHFuVm9JSThKR0hyajFP?=
 =?utf-8?B?R2FLV2hrZzFING5tbEpTOWpFaTQ5WFlGVXZ4QVZiMVh6MWtlSHlaaVIrM3kx?=
 =?utf-8?B?bllwWWhIOW1yZEhITnlPS3lOWkJqVEJDYkNackNCM2xLMkhldHdkWWZ0Rzk3?=
 =?utf-8?B?TkNUdWU3bkdEUWpWQ0V6MWxGK1g2VUhnRUp4ZWFRaXZMTG1uL2h2WU55eFBx?=
 =?utf-8?B?QzVEVXpEMFg4empQb3hwMjZtSE0zTXd5cGtDTmVqTDlpbzFDYjJNTWNoRk9D?=
 =?utf-8?B?Wmd2Qmc5MTBld1k4ZnQ0QytHWFR1dnFINnhuTEY3d0Qwc2JTMnUxT2lzVGRN?=
 =?utf-8?B?TUhYb1drdGMyZGhpenFzZGVQL1o5UWRqUGMvOWRHaVQzNitIQUlkRVlhaDRr?=
 =?utf-8?B?bGNiRTFWem9DOG9IRDhGUG0xYnhOUWdVVEVKcEpLcVB0K0xzZUVpQzRLanN4?=
 =?utf-8?B?YjZISE42N3hoQ3RkMkhrQ1pOdVVaa1pzc1E3TDNEUll5NFdsNFFDVWExazN0?=
 =?utf-8?B?S0Mrc3lMR2ZDN2ZqakJDZm03MFNNajh1L2hrK2dWb2lDUnR5YXAyWG9hOFlP?=
 =?utf-8?B?QnpjMkc4MUxyQXg3eUNDMWlsQVVUbnFIdGc2VEFtZDVySnlEWGdzaGFVaVJQ?=
 =?utf-8?B?WWdyRjdLUWxCNUtoVGY3eU43MnVqakRPRHU0bWR6MFhhQVBCbzJ5U29TRE5O?=
 =?utf-8?B?b0hWQ2hJdDFLYWlhM1lxL2oraDRJamxKU1c3S2dGRzRyVzAwN3pOa2JUM0lq?=
 =?utf-8?Q?GTJ/cRWubYVsD1jVSDAif9+gjbKrcYO8sSsuNwa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cd1062-7d74-40f2-3fd1-08d950fbbf57
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 12:40:42.7751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWALLSZyTMQthalF932VLhXGNut+mqBwi4mN+pyHwIY/d40KaVZwJ8z3hJb+Yf+x2TYa8hZ6q7I85Fjomv7zCVB1j/ZQA4eF29t5VtjizZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4214
Received-SPF: pass client-ip=2a01:111:f400:fe0e::725;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_NONE=-0.0001,
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

26.07.2021 17:46, Max Reitz wrote:
> We largely have two cancel modes for jobs:
> 
> First, there is actual cancelling.  The job is terminated as soon as
> possible, without trying to reach a consistent result.
> 
> Second, we have mirror in the READY state.  Technically, the job is not
> really cancelled, but it just is a different completion mode.  The job
> can still run for an indefinite amount of time while it tries to reach a
> consistent result.
> 
> We want to be able to clearly distinguish which cancel mode a job is in
> (when it has been cancelled).  We can use Job.force_cancel for this, but
> right now it only reflects cancel requests from the user with
> force=true, but clearly, jobs that do not even distinguish between
> force=false and force=true are effectively always force-cancelled.
> 
> So this patch has Job.force_cancel signify whether the job will
> terminate as soon as possible (force_cancel=true) or whether it will
> effectively remain running despite being "cancelled"
> (force_cancel=false).
> 
> To this end, we let jobs that provide JobDriver.cancel() tell the
> generic job code whether they will terminate as soon as possible or not,
> and for jobs that do not provide that method we assume they will.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   include/qemu/job.h | 11 ++++++++++-
>   block/backup.c     |  3 ++-
>   block/mirror.c     | 24 ++++++++++++++++++------
>   job.c              |  6 +++++-
>   4 files changed, 35 insertions(+), 9 deletions(-)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 5e8edbc2c8..8aa90f7395 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -253,8 +253,17 @@ struct JobDriver {
>   
>       /**
>        * If the callback is not NULL, it will be invoked in job_cancel_async
> +     *
> +     * This function must return true if the job will be cancelled
> +     * immediately without any further I/O (mandatory if @force is
> +     * true), and false otherwise.  This lets the generic job layer
> +     * know whether a job has been truly (force-)cancelled, or whether
> +     * it is just in a special completion mode (like mirror after
> +     * READY).
> +     * (If the callback is NULL, the job is assumed to terminate
> +     * without I/O.)
>        */
> -    void (*cancel)(Job *job, bool force);
> +    bool (*cancel)(Job *job, bool force);
>   
>   
>       /** Called when the job is freed */
> diff --git a/block/backup.c b/block/backup.c
> index bd3614ce70..513e1c8a0b 100644
> --- a/block/backup.c
> +++ b/block/backup.c
> @@ -331,11 +331,12 @@ static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
>       }
>   }
>   
> -static void backup_cancel(Job *job, bool force)
> +static bool backup_cancel(Job *job, bool force)
>   {
>       BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
>   
>       bdrv_cancel_in_flight(s->target_bs);
> +    return true;
>   }
>   
>   static const BlockJobDriver backup_job_driver = {
> diff --git a/block/mirror.c b/block/mirror.c
> index fcb7b65f93..e93631a9f6 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1087,9 +1087,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>           trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
>                                     delay_ns);
>           job_sleep_ns(&s->common.job, delay_ns);
> -        if (job_is_cancelled(&s->common.job) &&
> -            (!job_is_ready(&s->common.job) || s->common.job.force_cancel))
> -        {
> +        if (job_is_cancelled(&s->common.job) && s->common.job.force_cancel) {

Seems, it could it be reduced to

if (s->common.job.force_cancel) {


>               break;
>           }
>           s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
> @@ -1102,7 +1100,7 @@ immediate_exit:
>            * the target is a copy of the source.
>            */
>           assert(ret < 0 ||
> -               ((s->common.job.force_cancel || !job_is_ready(&s->common.job)) &&
> +               (s->common.job.force_cancel &&

and here

>                   job_is_cancelled(&s->common.job)));
>           assert(need_drain);
>           mirror_wait_for_all_io(s);
> @@ -1188,14 +1186,27 @@ static bool mirror_drained_poll(BlockJob *job)
>       return !!s->in_flight;
>   }
>   

anyway:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

