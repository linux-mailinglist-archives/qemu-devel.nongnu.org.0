Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2B7442ED6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:08:38 +0100 (CET)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtWn-0001Sk-EN
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhtIQ-00035m-5p; Tue, 02 Nov 2021 08:53:46 -0400
Received: from mail-vi1eur04on071e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::71e]:22742
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhtIK-0003XT-JO; Tue, 02 Nov 2021 08:53:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf6Qsy2osYO3SEY84URXzsSr7E0XGTC3FL/M4IqwKhWekvXHrA2JeqPS07lb8NBUQdInZaIKul/ak9oB9z8UG7I4kGxwxSP33uG/1jiNx0eGmcl6q9h+Ea86d+VyFQu1RB3NAR4q50KQgy+uEGPxDimGzT7aq7CgZxhvShHfAMdxmMHwn0vbnVmA2XmyqKEZBFsgJtq0OVQ7MSwjl8GgvkbGxvxdfuBzirEnyQF0TrZ/gtcZ5vCOfr6Hzipcnt+eeBUp/d9RK9YrRG8pbPcp+eTqZHMqddksVBqqQcAs4mKOt58YbLhyhQGthZhpLUa7StOmJJ4Pgq5TmYgtc7BAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Skj8Lovju18Tx0tdpx5+rf1+FK9y89rQFdgJy8A8tCs=;
 b=gGkOIzXEU+FTv1XgTuLwn+C+XuTlBzgiz+qYnbMtxg770536Vp5xUHNILx7nIHHcU5XguRgNvPH5KKp8I7eePt2bdR2UoXhe9O5Xz/cAwVvr1e1m3VjkJgwWAqhRMw3186SnMw08Egcc2btttaVvKDCfy2kN2vsc0JH/tQ9fq2t6+0BuwuIh94N2NuBfxRXMyNgKqUtTo1DV/flTOVDMWeRmUYcXfgPQP+6Krcrh7MdxEdTdwPydCYrIV72q3eWNR9ZARp75U3Vt+YYlimONsxdtCChKxKmAlK+Vs0b2iuBGQ13wwC+77Mb6Zb1gZ2u1s1xgWizD2L0PFKQ7W9qAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Skj8Lovju18Tx0tdpx5+rf1+FK9y89rQFdgJy8A8tCs=;
 b=CqKDx62LWOGElMYxeaCchSpCYv5wW3VLRjyH5Gd+XNT9MqRJtOfedjzsu/NJ9UpeD0ilVhZ/oCSnjpLQFNmmytulXBLd5pv2J4bDEkfPKvnxSP0EG7jk/VIYssU4XuStbqp+sc6Ss3BPEoDo6trCGlNXnvv321T8Abo2hgSvbhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 12:53:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 12:53:34 +0000
Message-ID: <94ed6a53-e50a-98f5-9f57-24146e2ea77e@virtuozzo.com>
Date: Tue, 2 Nov 2021 15:53:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 12/15] jobs: protect jobs with job_lock/unlock
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211029163914.4044794-1-eesposit@redhat.com>
 <20211029163914.4044794-13-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211029163914.4044794-13-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0045.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AS9PR05CA0045.eurprd05.prod.outlook.com (2603:10a6:20b:489::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 12:53:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfdeefca-ce81-449f-9bfd-08d99dffc7a2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6568:
X-Microsoft-Antispam-PRVS: <AS8PR08MB65686158FEDE8842817A8FE2C18B9@AS8PR08MB6568.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:78;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JC6Cv6nRDVn1DaZtJ/GHmjig+XmBLOJgJj/ZUW+0GDoJnranabXIkR57f4ep5vy4ruk7j8a++XgOlkxuHdKX2pCczaXAWQtt1MitHF+zqa51qCVUM9HxuBkh7vicC0ceSv5ywb4Ebx7elbKiWOdi7jeSzYqgZgocBQIGE6o1vm+CtJQonfy48ojxUXwPeKoxBvCXKN3UOXiZ5bLhfi0kIleadEkSRsbs0FGfNyQVolDQ3YwZRYB/wuFgQYU3F5pHc5+rdSfz7S+DAEaDciaCi8mKqiK2TEhFt6HzBOkvq1d0M660cX+ppNN3PV8FbXCdj8Xu9Zgqsk/H3lTblBmeiLXebHjsmtPR53139gC8OncYnnLA4mbEhlh2yNjE63zjCqg1U7L2wJN7br8fr6pXw2WaG7cTmBrrapjcozxqQLzBSM2q2x6DIBXv+XJ+Pw/53e2B5ZSsxTiJcSOwA9I9Hg8ElftKAhO06rmXuRt3x9GXpZwvqUdnDQFtoAgHEA7vc8QBBjp7MfU2ElO4qqD/ublyU7ImXdAmWRtqHZltoD0YERsPuvzY+daeu6o3b4c+tgDH+iDdKQDu44xPY2lwysTqXvf0EUPidpCikuU5mmhA/pNggBlzufq3RikpeQyOrvvD4mky1UPo4JNL4AjYm6UU+GJUXnCI59b9/wtB1+0CwMaCYHXRst0lJNBilyS2jDXltu962TnjmWw+D19J553qDsW/NyGdMCdsuZvZMUvd0v1AW5gjWiegoig/xtWzuKK2an23vXFp1+ozbJm16w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(508600001)(66476007)(83380400001)(16576012)(54906003)(66556008)(66946007)(316002)(5660300002)(36756003)(30864003)(26005)(8676002)(2906002)(4326008)(86362001)(186003)(19627235002)(2616005)(8936002)(31696002)(956004)(31686004)(7416002)(38100700002)(52116002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE1zcmdxN2ZrajhHL240QXBkclNpZDQ1dnBsU1RBUnhWSTh2V1Z6ZzF2Mmly?=
 =?utf-8?B?MW9oN2h5TGxQeWs1YmlMUjdlOVVIZUk3ZGdheWJaUUpkSTBPZXVRZmZiSW4r?=
 =?utf-8?B?bnRQZHB4S3lMVy9IcmZSS3hnWjVPWVdnZGdqSmVnYXdsN09Od0c5ODAzbW5l?=
 =?utf-8?B?SW9jRVpJckdrLy9lWDUrYi9TMlZOeHBlTjNnVGcrN2ZxdkQ0bzdYM0w2a1F5?=
 =?utf-8?B?cTZSOC9RbEhJdU01YTFGUGErcTFlK3lmd3ZlTzdoMEdSQkhMV3JvbUV6WE00?=
 =?utf-8?B?VzZpc1RHS25kNzVxbzFweGFWVDdSNHRJL2psOHFVeW1LOExpYytrWE5ITm5Z?=
 =?utf-8?B?T09VT3Bhc2UyZ2VBY0lNMGVkdVU3T1pGTDJseUNTSHJQQVBxa1k3RStTNWV1?=
 =?utf-8?B?MFpFdk1USGlJZi9uVWVzMFhpKytSRlRuRWVmdTVsZk9jdlBmSXNIM2ptcjRL?=
 =?utf-8?B?UmZzeFlCU2VHRC9VcW9zeGE3OXZ2WE5iYXRmaWx5eVVxTGptc052bUxSdGNE?=
 =?utf-8?B?Nkh4MlhCVkpFQlVvZ1I0THFoN3kybVpzTVEvVWZVZTNwVEM5K0ErbXU5MEJW?=
 =?utf-8?B?SmNZSzBzNi9GcEVhWFdsNGtrczFsWVc5KyttdzBtVGgzWTBwOXRxeW8xdGNa?=
 =?utf-8?B?OGtTRVZXTzUyeWY4TWZYc2NGa1BiUERZYk9wOGdZZ2d4N0VkZytrODZqeW04?=
 =?utf-8?B?cWt3enhwQUJWNkphSWNNenA1OThKZGJLa2F2eDRFQ1hTME9SRzIvdEF6b1pl?=
 =?utf-8?B?S1A0YUY1MGNrUkNheElmcEhlUzFmeVhVc3Iyc3NOR3B3bUFDamV3RjZHZHFQ?=
 =?utf-8?B?WHJKN0FVT24xTXZsN3daM3pycmMxOUloL1ArTWdOTDg5cUl2RmljRytGRmdp?=
 =?utf-8?B?cTU2M1BaRnZkVXR0NHEyKzRpdjAwOG43ME1jSEozbFEwcVlDZDU5M2lIWTk2?=
 =?utf-8?B?WGJwcXRkancxSGtFSjl3bXNEdi9PK0tCVVFYV0ZPZnllbnRvV2d1V2pUcm83?=
 =?utf-8?B?bmhENGtVVGVibzVOL0FGSlNDVEF1ZDErOWw0aGk3cCsrZ2ZZWG9iTXYyR3Y2?=
 =?utf-8?B?a0gxL2hNdExnUVpmWEVNMDV6cXRjSjRSMUxmdG4rODFQTUl1SDBHeXNmVDMv?=
 =?utf-8?B?dXRhQXFRZzJHMGh6S1NSc3crT0Q5Zm95cWlGa2hqY3ZFNUZ3NUZIYmdyZjJr?=
 =?utf-8?B?ZktCbmRibXE1NnNjeTliN1JIRGJpdG0vTHgycVBKdWE4YWlQbllWVzZpcFNm?=
 =?utf-8?B?Q2NQS0dvbVlrMFI2dWdVSXg4c0IrcWRCWW9MOEVoQmo3YU5CY1ZYV3B1bUw0?=
 =?utf-8?B?eXZIdGRhVWNBUkYvVjJQWFhQbnpLcU9RRHhWNk84MXJiUFJpU2dHdXE3K1U2?=
 =?utf-8?B?Q1RvZ0J1eXl0WUhOYktwYlRBSEZuYWlheHFnWU9aYkRiUytGN2VnQ1B1WXZH?=
 =?utf-8?B?OEtoVW0wdGVxMnBnV3J1T2haYVU3NTlwRktZOU5yTy9aZmxHQURxb1lSREhK?=
 =?utf-8?B?RVdSS0htRDJCNFBtZm11c01nMHJBT0xFblBVdDVnM3ZiVjU0WDdLUmdVemR2?=
 =?utf-8?B?cHpDeCtKem1FbFNlU2Z2TTMwb2x4N0VraTZXZkFTS0NaN3N0d3JJNzhTc2lz?=
 =?utf-8?B?VzhjVU9IWHJmZ04vdThSNFZZQStqRXR2VDFUWS9wYlU1ZmNKZ3cwNWRyN2pk?=
 =?utf-8?B?N2xZZFhWMk5tWFphWVNXWUdTenljdFo0WStNZ2dkSlY4N011bDk2a1hGSkN0?=
 =?utf-8?B?K1B0eG0zcE90L3k3elNsb0hlNm5jYm1SblptM0ZHaHpIV3ZRYlFpSExJc0lj?=
 =?utf-8?B?ZjFPWWd6bDBiL1BjeWxhSC9uUE40RVRjeXpHdXNMaHlRdUthc0ZHQTVsV2Ri?=
 =?utf-8?B?YkhNSVhHZkkwSjJ6cm5EaWh5Q05HMG9URjY3eHk5cS9rM0tRYjRjbnowcWpQ?=
 =?utf-8?B?VzVDelVGdE1IS3J2UmFuS3NBd3ltTE90dHpNQ3R5bjZQNThyWHM0V0JGNnFT?=
 =?utf-8?B?em8zUEkzZkpMY1kyUUdsc1RzK3dtUkJLcHptbVZmTkF2TldFenlxWC91Mkhy?=
 =?utf-8?B?Y0dGL0d4WkxmMkozczRFUStET2o1dVo3b2tRdTRJZTBNejdndXcvR0xWYTJP?=
 =?utf-8?B?MC8zeTVGTThQU2JlSndEa05BZ2ExSUdHQm1jYWNSV1JCTmZqTEVHL2RuRkJp?=
 =?utf-8?B?TjZURURRZGRGdmJ6WFp6bVZDLzdSVjR0bVgzUjFOOUhFbXJKcUxVQVVEVy9t?=
 =?utf-8?Q?2zqYJirRSwZmr0niJuNdhqF0a+CzseSD2G1T01x6xo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdeefca-ce81-449f-9bfd-08d99dffc7a2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:53:34.2583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZI56Sf5fUzYazBzmF7M5ztBHLeMSgjUxM9qZNhb9sy3VS3Z/hCMykdSYbNLa6Q6BehpaodpFbyGX3gl17ErVe6Z2P2tVPtEwhpiAfSe3UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6568
Received-SPF: pass client-ip=2a01:111:f400:fe0e::71e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.549, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

29.10.2021 19:39, Emanuele Giuseppe Esposito wrote:
> Introduce the job locking mechanism through the whole job API,
> following the comments and requirements of job-monitor (assume
> lock is held) and job-driver (lock is not held).
> 
> At this point, we do not care if the job lock is inside or outside
> the aiocontext. The aiocontext is going away and it is useless
> to add additional temporary job_lock/unlock pairs just to keep
> this commit valid.

Probably that means that we have to merge it with commit that finally removes these aio context locks. It's better to have big commit than commit that breaks things.

> 
> For example:
> 
> /* assumes job_lock *not* held */
> static void job_exit(void *opaque) {
>      job_lock();
>      job_ref(job); // assumes job_lock held
>      aio_context_acquire(job->aio_context); // we do not want this!
> 
> However, adding an additional unlock after job_ref() and lock
> under the aiocontext acquire seems unnecessary, as it will all
> go away in the next commits.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c             |   6 ++
>   block/mirror.c      |   8 +-
>   block/replication.c |   4 +
>   blockdev.c          |  13 +++
>   blockjob.c          |  42 +++++++++-
>   job-qmp.c           |   4 +
>   job.c               | 190 ++++++++++++++++++++++++++++++++++++--------
>   monitor/qmp-cmds.c  |   2 +
>   qemu-img.c          |   8 +-
>   9 files changed, 232 insertions(+), 45 deletions(-)
> 
> diff --git a/block.c b/block.c
> index da80e89ad4..a6dcd9eb36 100644
> --- a/block.c
> +++ b/block.c
> @@ -4826,7 +4826,9 @@ static void bdrv_close(BlockDriverState *bs)
>   
>   void bdrv_close_all(void)
>   {
> +    job_lock();
>       assert(job_next(NULL) == NULL);
> +    job_unlock();
>       assert(qemu_in_main_thread());
>   
>       /* Drop references from requests still in flight, such as canceled block
> @@ -5965,6 +5967,8 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
>           }
>       }
>   
> +    job_lock();
> +
>       for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>           GSList *el;
>   
> @@ -5975,6 +5979,8 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
>           }
>       }
>   
> +    job_unlock();
> +
>       QTAILQ_FOREACH(bs, &graph_bdrv_states, node_list) {
>           xdbg_graph_add_node(gr, bs, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_DRIVER,
>                              bs->node_name);
> diff --git a/block/mirror.c b/block/mirror.c
> index 00089e519b..5c4445a8c6 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -653,7 +653,7 @@ static int mirror_exit_common(Job *job)
>       BlockDriverState *target_bs;
>       BlockDriverState *mirror_top_bs;
>       Error *local_err = NULL;
> -    bool abort = job->ret < 0;
> +    bool abort = job_has_failed(job);
>       int ret = 0;
>   
>       if (s->prepared) {
> @@ -1161,9 +1161,7 @@ static void mirror_complete(Job *job, Error **errp)
>       s->should_complete = true;
>   
>       /* If the job is paused, it will be re-entered when it is resumed */
> -    if (!job->paused) {
> -        job_enter(job);
> -    }
> +    job_enter_not_paused(job);
>   }
>   
>   static void coroutine_fn mirror_pause(Job *job)
> @@ -1182,7 +1180,7 @@ static bool mirror_drained_poll(BlockJob *job)
>        * from one of our own drain sections, to avoid a deadlock waiting for
>        * ourselves.
>        */
> -    if (!s->common.job.paused && !job_is_cancelled(&job->job) && !s->in_drain) {
> +    if (!job_not_paused_nor_cancelled(&s->common.job) && !s->in_drain) {

hmm. pre-patch if conditino is !paused and !cancelled.

after-patch = !(!paused && !cancelled) which is opposite..

>           return true;
>       }
>   
> diff --git a/block/replication.c b/block/replication.c
> index 55c8f894aa..0f487cc215 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -149,7 +149,9 @@ static void replication_close(BlockDriverState *bs)
>       if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>           commit_job = &s->commit_job->job;
>           assert(commit_job->aio_context == qemu_get_current_aio_context());
> +        job_lock();
>           job_cancel_sync(commit_job, false);
> +        job_unlock();
>       }
>   
>       if (s->mode == REPLICATION_MODE_SECONDARY) {
> @@ -726,7 +728,9 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
>            * disk, secondary disk in backup_job_completed().
>            */
>           if (s->backup_job) {
> +            job_lock();
>               job_cancel_sync(&s->backup_job->job, true);
> +            job_unlock();
>           }
>   
>           if (!failover) {


Hmm. These chunks break your idea that drivers call functions from job-driver.h and monitor call functions from job-monitor.h.

So, drivers may call any functions, sometimes they have to take lock by hand, sometimes not..

Than I don't see real benefit in splitting job.h into job-monitor.h and job-driver.h.

We can simply keep all _locked() and other helpers in one place.


> diff --git a/blockdev.c b/blockdev.c
> index 67b55eec11..c5a835d9ed 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -150,6 +150,8 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>           return;
>       }
>   
> +    job_lock();
> +
>       for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>           if (block_job_has_bdrv(job, blk_bs(blk))) {
>               AioContext *aio_context = job->job.aio_context;
> @@ -161,6 +163,8 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>           }
>       }
>   
> +    job_unlock();
> +
>       dinfo->auto_del = 1;
>   }
>   
> @@ -1844,7 +1848,9 @@ static void drive_backup_abort(BlkActionState *common)
>           aio_context = bdrv_get_aio_context(state->bs);
>           aio_context_acquire(aio_context);
>   
> +        job_lock();
>           job_cancel_sync(&state->job->job, true);
> +        job_unlock();
>   
>           aio_context_release(aio_context);
>       }
> @@ -1945,7 +1951,9 @@ static void blockdev_backup_abort(BlkActionState *common)
>           aio_context = bdrv_get_aio_context(state->bs);
>           aio_context_acquire(aio_context);
>   
> +        job_lock();
>           job_cancel_sync(&state->job->job, true);
> +        job_unlock();
>   
>           aio_context_release(aio_context);
>       }
> @@ -2394,7 +2402,9 @@ exit:
>       if (!has_props) {
>           qapi_free_TransactionProperties(props);
>       }
> +    job_lock();
>       job_txn_unref(block_job_txn);
> +    job_unlock();
>   }
>   
>   BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
> @@ -3717,6 +3727,7 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
>       BlockJobInfoList *head = NULL, **tail = &head;
>       BlockJob *job;
>   
> +    job_lock();
>       for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>           BlockJobInfo *value;
>   
> @@ -3726,10 +3737,12 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
>           value = block_job_query(job, errp);
>           if (!value) {
>               qapi_free_BlockJobInfoList(head);
> +            job_unlock();
>               return NULL;
>           }
>           QAPI_LIST_APPEND(tail, value);
>       }
> +    job_unlock();
>   
>       return head;
>   }
> diff --git a/blockjob.c b/blockjob.c
> index 53c1e9c406..426dcddcc1 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -88,19 +88,25 @@ static char *child_job_get_parent_desc(BdrvChild *c)
>   static void child_job_drained_begin(BdrvChild *c)
>   {
>       BlockJob *job = c->opaque;
> +    job_lock();
>       job_pause(&job->job);
> +    job_unlock();
>   }
>   
>   static bool child_job_drained_poll(BdrvChild *c)
>   {
>       BlockJob *bjob = c->opaque;
>       Job *job = &bjob->job;
> +    bool inactive_incomplete;
>       const BlockJobDriver *drv = block_job_driver(bjob);
>   
>       /* An inactive or completed job doesn't have any pending requests. Jobs
>        * with !job->busy are either already paused or have a pause point after
>        * being reentered, so no job driver code will run before they pause. */
> -    if (!job->busy || job_is_completed(job)) {
> +    job_lock();
> +    inactive_incomplete = !job->busy || job_is_completed(job);
> +    job_unlock();
> +    if (inactive_incomplete) {
>           return false;
>       }
>   
> @@ -116,7 +122,9 @@ static bool child_job_drained_poll(BdrvChild *c)
>   static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
>   {
>       BlockJob *job = c->opaque;
> +    job_lock();
>       job_resume(&job->job);
> +    job_unlock();
>   }
>   
>   static bool child_job_can_set_aio_ctx(BdrvChild *c, AioContext *ctx,
> @@ -236,9 +244,16 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
>       return 0;
>   }
>   
> +/* Called with job_mutex lock held. */
>   static void block_job_on_idle(Notifier *n, void *opaque)
>   {
> +    /*
> +     * we can't kick with job_mutex held, but we also want
> +     * to protect the notifier list.
> +     */
> +    job_unlock();
>       aio_wait_kick();
> +    job_lock();
>   }
>   
>   bool block_job_is_internal(BlockJob *job)
> @@ -257,6 +272,7 @@ static bool job_timer_pending(Job *job)
>       return timer_pending(&job->sleep_timer);
>   }
>   
> +/* Called with job_mutex held. May temporarly release the lock. */
>   bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
>   {
>       const BlockJobDriver *drv = block_job_driver(job);
> @@ -278,7 +294,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
>       job->speed = speed;
>   
>       if (drv->set_speed) {
> +        job_unlock();
>           drv->set_speed(job, speed);
> +        job_lock();
>       }
>   
>       if (speed && speed <= old_speed) {
> @@ -296,6 +314,7 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
>       return ratelimit_calculate_delay(&job->limit, n);
>   }
>   
> +/* Called with job_mutex held */
>   BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>   {
>       BlockJobInfo *info;
> @@ -314,13 +333,13 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>       info = g_new0(BlockJobInfo, 1);
>       info->type      = g_strdup(job_type_str(&job->job));
>       info->device    = g_strdup(job->job.id);
> -    info->busy      = qatomic_read(&job->job.busy);
> +    info->busy      = job->job.busy;
>       info->paused    = job->job.pause_count > 0;
>       info->offset    = progress_current;
>       info->len       = progress_total;
>       info->speed     = job->speed;
>       info->io_status = job->iostatus;
> -    info->ready     = job_is_ready(&job->job),
> +    info->ready     = job_is_ready_locked(&job->job),
>       info->status    = job->job.status;
>       info->auto_finalize = job->job.auto_finalize;
>       info->auto_dismiss  = job->job.auto_dismiss;
> @@ -341,6 +360,7 @@ static void block_job_iostatus_set_err(BlockJob *job, int error)
>       }
>   }
>   
> +/* Called with job_mutex lock held. */
>   static void block_job_event_cancelled(Notifier *n, void *opaque)
>   {
>       BlockJob *job = opaque;
> @@ -360,6 +380,7 @@ static void block_job_event_cancelled(Notifier *n, void *opaque)
>                                           job->speed);
>   }
>   
> +/* Called with job_mutex lock held. */
>   static void block_job_event_completed(Notifier *n, void *opaque)
>   {
>       BlockJob *job = opaque;
> @@ -386,6 +407,7 @@ static void block_job_event_completed(Notifier *n, void *opaque)
>                                           msg);
>   }
>   
> +/* Called with job_mutex lock held. */
>   static void block_job_event_pending(Notifier *n, void *opaque)
>   {
>       BlockJob *job = opaque;
> @@ -398,6 +420,7 @@ static void block_job_event_pending(Notifier *n, void *opaque)
>                                         job->job.id);
>   }
>   
> +/* Called with job_mutex lock held. */
>   static void block_job_event_ready(Notifier *n, void *opaque)
>   {
>       BlockJob *job = opaque;
> @@ -458,6 +481,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>       job->ready_notifier.notify = block_job_event_ready;
>       job->idle_notifier.notify = block_job_on_idle;
>   
> +    job_lock();
>       notifier_list_add(&job->job.on_finalize_cancelled,
>                         &job->finalize_cancelled_notifier);
>       notifier_list_add(&job->job.on_finalize_completed,
> @@ -465,6 +489,7 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>       notifier_list_add(&job->job.on_pending, &job->pending_notifier);
>       notifier_list_add(&job->job.on_ready, &job->ready_notifier);
>       notifier_list_add(&job->job.on_idle, &job->idle_notifier);
> +    job_unlock();
>   
>       error_setg(&job->blocker, "block device is in use by block job: %s",
>                  job_type_str(&job->job));
> @@ -477,14 +502,19 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>       blk_set_disable_request_queuing(blk, true);
>       blk_set_allow_aio_context_change(blk, true);
>   
> +    job_lock();
>       if (!block_job_set_speed(job, speed, errp)) {
> -        job_early_fail(&job->job);
> +        job_early_fail_locked(&job->job);
> +        job_unlock();
>           return NULL;
>       }
> +    job_unlock();
> +
>   
>       return job;
>   }
>   
> +/* Called with job_mutex lock held. */
>   void block_job_iostatus_reset(BlockJob *job)
>   {
>       assert(qemu_in_main_thread());
> @@ -499,7 +529,9 @@ void block_job_user_resume(Job *job)
>   {
>       assert(qemu_in_main_thread());
>       BlockJob *bjob = container_of(job, BlockJob, job);
> +    job_lock();
>       block_job_iostatus_reset(bjob);
> +    job_unlock();
>   }
>   
>   BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
> @@ -532,11 +564,13 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
>                                           action);
>       }
>       if (action == BLOCK_ERROR_ACTION_STOP) {
> +        job_lock();
>           if (!job->job.user_paused) {
>               job_pause(&job->job);
>               /* make the pause user visible, which will be resumed from QMP. */
>               job->job.user_paused = true;
>           }
> +        job_unlock();
>           block_job_iostatus_set_err(job, error);
>       }
>       return action;
> diff --git a/job-qmp.c b/job-qmp.c
> index a6774aaaa5..a355dc2954 100644
> --- a/job-qmp.c
> +++ b/job-qmp.c
> @@ -171,6 +171,8 @@ JobInfoList *qmp_query_jobs(Error **errp)
>       JobInfoList *head = NULL, **tail = &head;
>       Job *job;
>   
> +    job_lock();
> +
>       for (job = job_next(NULL); job; job = job_next(job)) {
>           JobInfo *value;
>   
> @@ -180,10 +182,12 @@ JobInfoList *qmp_query_jobs(Error **errp)
>           value = job_query_single(job, errp);
>           if (!value) {
>               qapi_free_JobInfoList(head);
> +            job_unlock();
>               return NULL;
>           }
>           QAPI_LIST_APPEND(tail, value);
>       }
> +    job_unlock();
>   
>       return head;
>   }
> diff --git a/job.c b/job.c
> index eb6d321960..6b3e860fa7 100644
> --- a/job.c
> +++ b/job.c
> @@ -52,6 +52,7 @@
>   /* job_mutex protects the jobs list, but also makes the job API thread-safe. */
>   static QemuMutex job_mutex;
>   
> +/* Protected by job_mutex */
>   static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
>   
>   /* Job State Transition Table */
> @@ -117,6 +118,7 @@ JobTxn *job_txn_new(void)
>       return txn;
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_txn_ref(JobTxn *txn)
>   {
>       txn->refcnt++;
> @@ -142,6 +144,7 @@ void job_txn_add_job(JobTxn *txn, Job *job)
>       job_txn_ref(txn);
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_txn_del_job(Job *job)
>   {
>       if (job->txn) {
> @@ -151,6 +154,7 @@ static void job_txn_del_job(Job *job)
>       }
>   }
>   
> +/* Called with job_mutex held. */
>   static int job_txn_apply(Job *job, int fn(Job *))
>   {
>       Job *other_job, *next;[отъеду в поликлинику
> @@ -187,6 +191,7 @@ bool job_is_internal(Job *job)
>       return (job->id == NULL);
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_state_transition(Job *job, JobStatus s1)
>   {
>       JobStatus s0 = job->status;
> @@ -384,6 +389,7 @@ static bool job_started(Job *job)
>       return job->co;
>   }
>   
> +/* Called with job_mutex held. */
>   static bool job_should_pause(Job *job)
>   {
>       return job->pause_count > 0;
> @@ -410,6 +416,7 @@ Job *job_get(const char *id)
>       return NULL;
>   }
>   
> +/* Called with job_mutex *not* held. */
>   static void job_sleep_timer_cb(void *opaque)
>   {
>       Job *job = opaque;
> @@ -417,28 +424,31 @@ static void job_sleep_timer_cb(void *opaque)
>       job_enter(job);
>   }
>   
> +/* Called with job_mutex *not* held. */
>   void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
>                    AioContext *ctx, int flags, BlockCompletionFunc *cb,
>                    void *opaque, Error **errp)
>   {
> -    Job *job;
> +    Job *job = NULL;
> +
> +    job_lock();
>   
>       if (job_id) {
>           if (flags & JOB_INTERNAL) {
>               error_setg(errp, "Cannot specify job ID for internal job");
> -            return NULL;
> +            goto out;
>           }
>           if (!id_wellformed(job_id)) {
>               error_setg(errp, "Invalid job ID '%s'", job_id);
> -            return NULL;
> +            goto out;
>           }
>           if (job_get(job_id)) {
>               error_setg(errp, "Job ID '%s' already in use", job_id);
> -            return NULL;
> +            goto out;
>           }
>       } else if (!(flags & JOB_INTERNAL)) {
>           error_setg(errp, "An explicit job ID is required");
> -        return NULL;
> +        goto out;
>       }
>   
>       job = g_malloc0(driver->instance_size);
> @@ -479,6 +489,8 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
>           job_txn_add_job(txn, job);
>       }
>   
> +out:
> +    job_unlock();
>       return job;
>   }
>   
> @@ -497,7 +509,9 @@ void job_unref(Job *job)
>           assert(!job->txn);
>   
>           if (job->driver->free) {
> +            job_unlock();
>               job->driver->free(job);
> +            job_lock();
>           }
>   
>           QLIST_REMOVE(job, job_list);
> @@ -509,16 +523,19 @@ void job_unref(Job *job)
>       }
>   }
>   
> +/* Progress API is thread safe */
>   void job_progress_update(Job *job, uint64_t done)
>   {
>       progress_work_done(&job->progress, done);
>   }
>   
> +/* Progress API is thread safe */
>   void job_progress_set_remaining(Job *job, uint64_t remaining)
>   {
>       progress_set_remaining(&job->progress, remaining);
>   }
>   
> +/* Progress API is thread safe */
>   void job_progress_increase_remaining(Job *job, uint64_t delta)
>   {
>       progress_increase_remaining(&job->progress, delta);
> @@ -542,16 +559,19 @@ static void job_event_completed(Job *job)
>       notifier_list_notify(&job->on_finalize_completed, job);
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_event_pending(Job *job)
>   {
>       notifier_list_notify(&job->on_pending, job);
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_event_ready(Job *job)
>   {
>       notifier_list_notify(&job->on_ready, job);
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_event_idle(Job *job)
>   {
>       notifier_list_notify(&job->on_idle, job);
> @@ -566,14 +586,11 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
>           return;
>       }
>   
> -    job_lock();
>       if (job->busy) {
> -        job_unlock();
>           return;
>       }
>   
>       if (fn && !fn(job)) {
> -        job_unlock();
>           return;
>       }
>   
> @@ -582,11 +599,15 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
>       job->busy = true;
>       job_unlock();
>       aio_co_enter(job->aio_context, job->co);
> +    job_lock();
>   }
>   
> +/* Called with job_mutex *not* held. */
>   void job_enter(Job *job)
>   {
> +    job_lock();
>       job_enter_cond(job, NULL);
> +    job_unlock();
>   }
>   
>   /* Yield, and schedule a timer to reenter the coroutine after @ns nanoseconds.
> @@ -594,10 +615,12 @@ void job_enter(Job *job)
>    * is allowed and cancels the timer.
>    *
>    * If @ns is (uint64_t) -1, no timer is scheduled and job_enter() must be
> - * called explicitly. */
> + * called explicitly.
> + *
> + * Called with job_mutex held, but releases it temporarly.
> + */
>   static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
>   {
> -    job_lock();
>       if (ns != -1) {
>           timer_mod(&job->sleep_timer, ns);
>       }
> @@ -605,27 +628,37 @@ static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
>       job_event_idle(job);
>       job_unlock();
>       qemu_coroutine_yield();
> +    job_lock();
>   
>       /* Set by job_enter_cond() before re-entering the coroutine.  */
>       assert(job->busy);
>   }
>   
> +/*
> + * Called with job_mutex *not* held (we don't want the coroutine
> + * to yield with the lock held!).
> + */
>   void coroutine_fn job_pause_point(Job *job)
>   {
>       assert(job && job_started(job));
>   
> +    job_lock();
>       if (!job_should_pause(job)) {
> +        job_unlock();
>           return;
>       }
> -    if (job_is_cancelled(job)) {
> +    if (job_is_cancelled_locked(job)) {
> +        job_unlock();
>           return;
>       }
>   
>       if (job->driver->pause) {
> +        job_unlock();
>           job->driver->pause(job);
> +        job_lock();
>       }
>   
> -    if (job_should_pause(job) && !job_is_cancelled(job)) {
> +    if (job_should_pause(job) && !job_is_cancelled_locked(job)) {
>           JobStatus status = job->status;
>           job_state_transition(job, status == JOB_STATUS_READY
>                                     ? JOB_STATUS_STANDBY
> @@ -635,45 +668,60 @@ void coroutine_fn job_pause_point(Job *job)
>           job->paused = false;
>           job_state_transition(job, status);
>       }
> +    job_unlock();
>   
>       if (job->driver->resume) {
>           job->driver->resume(job);
>       }
>   }
>   
> +/*
> + * Called with job_mutex *not* held (we don't want the coroutine
> + * to yield with the lock held!).
> + */
>   void job_yield(Job *job)
>   {
> +    job_lock();
>       assert(job->busy);
>   
>       /* Check cancellation *before* setting busy = false, too!  */
> -    if (job_is_cancelled(job)) {
> +    if (job_is_cancelled_locked(job)) {
> +        job_unlock();
>           return;
>       }
>   
>       if (!job_should_pause(job)) {
>           job_do_yield(job, -1);
>       }
> +    job_unlock();
>   
>       job_pause_point(job);
>   }
>   
> +/*
> + * Called with job_mutex *not* held (we don't want the coroutine
> + * to yield with the lock held!).
> + */
>   void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
>   {
> +    job_lock();
>       assert(job->busy);
>   
>       /* Check cancellation *before* setting busy = false, too!  */
> -    if (job_is_cancelled(job)) {
> +    if (job_is_cancelled_locked(job)) {
> +        job_unlock();
>           return;
>       }
>   
>       if (!job_should_pause(job)) {
>           job_do_yield(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
>       }
> +    job_unlock();
>   
>       job_pause_point(job);
>   }
>   
> -/* Assumes the block_job_mutex is held */
> +/* Assumes the job_mutex is held */
>   static bool job_timer_not_pending(Job *job)
>   {
>       return !timer_pending(&job->sleep_timer);
> @@ -683,7 +731,7 @@ void job_pause(Job *job)
>   {
>       job->pause_count++;
>       if (!job->paused) {
> -        job_enter(job);
> +        job_enter_cond(job, NULL);
>       }
>   }
>   
> @@ -738,12 +786,15 @@ void job_user_resume(Job *job, Error **errp)
>           return;
>       }
>       if (job->driver->user_resume) {
> +        job_unlock();
>           job->driver->user_resume(job);
> +        job_lock();
>       }
>       job->user_paused = false;
>       job_resume(job);
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_do_dismiss(Job *job)
>   {
>       assert(job);
> @@ -783,6 +834,7 @@ void job_early_fail(Job *job)
>       job_unlock();
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_conclude(Job *job)
>   {
>       job_state_transition(job, JOB_STATUS_CONCLUDED);
> @@ -791,9 +843,10 @@ static void job_conclude(Job *job)
>       }
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_update_rc(Job *job)
>   {
> -    if (!job->ret && job_is_cancelled(job)) {
> +    if (!job->ret && job_is_cancelled_locked(job)) {
>           job->ret = -ECANCELED;
>       }
>       if (job->ret) {
> @@ -804,42 +857,54 @@ static void job_update_rc(Job *job)
>       }
>   }
>   
> +/* Called with job_mutex held, but releases it temporarly */
>   static void job_commit(Job *job)
>   {
>       assert(!job->ret);
>       assert(qemu_in_main_thread());
>       if (job->driver->commit) {
> +        job_unlock();
>           job->driver->commit(job);
> +        job_lock();
>       }
>   }
>   
> +/* Called with job_mutex held, but releases it temporarly */
>   static void job_abort(Job *job)
>   {
>       assert(job->ret);
>       assert(qemu_in_main_thread());
>       if (job->driver->abort) {
> +        job_unlock();
>           job->driver->abort(job);
> +        job_lock();
>       }
>   }
>   
> +/* Called with job_mutex held, but releases it temporarly */
>   static void job_clean(Job *job)
>   {
>       assert(qemu_in_main_thread());
>       if (job->driver->clean) {
> +        job_unlock();
>           job->driver->clean(job);
> +        job_lock();
>       }
>   }
>   
> +/* Called with job_mutex held, but releases it temporarly. */
>   static int job_finalize_single(Job *job)
>   {
> +    int job_ret;
>       AioContext *ctx = job->aio_context;
>   
>       assert(job_is_completed(job));
> -    aio_context_acquire(ctx);
>   
>       /* Ensure abort is called for late-transactional failures */
>       job_update_rc(job);
>   
> +    aio_context_acquire(ctx);
> +
>       if (!job->ret) {
>           job_commit(job);
>       } else {
> @@ -847,13 +912,18 @@ static int job_finalize_single(Job *job)
>       }
>       job_clean(job);
>   
> +    aio_context_release(ctx);
> +
>       if (job->cb) {
> -        job->cb(job->opaque, job->ret);
> +        job_ret = job->ret;
> +        job_unlock();
> +        job->cb(job->opaque, job_ret);
> +        job_lock();
>       }
>   
>       /* Emit events only if we actually started */
>       if (job_started(job)) {
> -        if (job_is_cancelled(job)) {
> +        if (job_is_cancelled_locked(job)) {
>               job_event_cancelled(job);
>           } else {
>               job_event_completed(job);
> @@ -862,15 +932,18 @@ static int job_finalize_single(Job *job)
>   
>       job_txn_del_job(job);
>       job_conclude(job);
> -    aio_context_release(ctx);
>       return 0;
>   }
>   
> +/* Called with job_mutex held, but releases it temporarly. */
>   static void job_cancel_async(Job *job, bool force)
>   {
>       assert(qemu_in_main_thread());
> +
>       if (job->driver->cancel) {
> +        job_unlock();
>           force = job->driver->cancel(job, force);
> +        job_lock();
>       } else {
>           /* No .cancel() means the job will behave as if force-cancelled */
>           force = true;
> @@ -879,7 +952,9 @@ static void job_cancel_async(Job *job, bool force)
>       if (job->user_paused) {
>           /* Do not call job_enter here, the caller will handle it.  */
>           if (job->driver->user_resume) {
> +            job_unlock();
>               job->driver->user_resume(job);
> +            job_lock();
>           }
>           job->user_paused = false;
>           assert(job->pause_count > 0);
> @@ -900,6 +975,7 @@ static void job_cancel_async(Job *job, bool force)
>       }
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_completed_txn_abort(Job *job)
>   {
>       AioContext *ctx;
> @@ -949,7 +1025,7 @@ static void job_completed_txn_abort(Job *job)
>           ctx = other_job->aio_context;
>           aio_context_acquire(ctx);
>           if (!job_is_completed(other_job)) {
> -            assert(job_cancel_requested(other_job));
> +            assert(job_cancel_requested_locked(other_job));
>               job_finish_sync(other_job, NULL, NULL);
>           }
>           job_finalize_single(other_job);
> @@ -966,26 +1042,33 @@ static void job_completed_txn_abort(Job *job)
>       job_txn_unref(txn);
>   }
>   
> +/* Called with job_mutex held, but releases it temporarly. */
>   static int job_prepare(Job *job)
>   {
> +    int ret;
>       AioContext *ctx = job->aio_context;
>       assert(qemu_in_main_thread());
>   
> -    aio_context_acquire(ctx);
>       if (job->ret == 0 && job->driver->prepare) {
> -        job->ret = job->driver->prepare(job);
> +        job_unlock();
> +        aio_context_acquire(ctx);
> +        ret = job->driver->prepare(job);
> +        aio_context_release(ctx);
> +        job_lock();
> +        job->ret = ret;
>           job_update_rc(job);
>       }
> -    aio_context_release(ctx);
>   
>       return job->ret;
>   }
>   
> +/* Called with job_mutex held. */
>   static int job_needs_finalize(Job *job)
>   {
>       return !job->auto_finalize;
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_do_finalize(Job *job)
>   {
>       int rc;
> @@ -1009,6 +1092,7 @@ void job_finalize(Job *job, Error **errp)
>       job_do_finalize(job);
>   }
>   
> +/* Called with job_mutex held. */
>   static int job_transition_to_pending(Job *job)
>   {
>       job_state_transition(job, JOB_STATUS_PENDING);
> @@ -1018,12 +1102,16 @@ static int job_transition_to_pending(Job *job)
>       return 0;
>   }
>   
> +/* Called with job_mutex *not* held. */
>   void job_transition_to_ready(Job *job)
>   {
> +    job_lock();
>       job_state_transition(job, JOB_STATUS_READY);
>       job_event_ready(job);
> +    job_unlock();
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_completed_txn_success(Job *job)
>   {
>       JobTxn *txn = job->txn;
> @@ -1050,6 +1138,7 @@ static void job_completed_txn_success(Job *job)
>       }
>   }
>   
> +/* Called with job_mutex held. */
>   static void job_completed(Job *job)
>   {
>       assert(job && job->txn && !job_is_completed(job));
> @@ -1063,12 +1152,16 @@ static void job_completed(Job *job)
>       }
>   }
>   
> -/** Useful only as a type shim for aio_bh_schedule_oneshot. */
> +/**
> + * Useful only as a type shim for aio_bh_schedule_oneshot.
> + *  Called with job_mutex *not* held.
> + */
>   static void job_exit(void *opaque)
>   {
>       Job *job = (Job *)opaque;
>       AioContext *ctx;
>   
> +    job_lock();
>       job_ref(job);
>       aio_context_acquire(job->aio_context);
>   
> @@ -1089,27 +1182,35 @@ static void job_exit(void *opaque)
>        */
>       ctx = job->aio_context;
>       job_unref(job);
> +    job_unlock();
>       aio_context_release(ctx);
>   }
>   
>   /**
>    * All jobs must allow a pause point before entering their job proper. This
>    * ensures that jobs can be paused prior to being started, then resumed later.
> + *
> + * Called with job_mutex *not* held.
>    */
>   static void coroutine_fn job_co_entry(void *opaque)
>   {
>       Job *job = opaque;
> -
> +    int ret;
>       assert(job && job->driver && job->driver->run);
>       job_pause_point(job);
> -    job->ret = job->driver->run(job, &job->err);
> +    ret = job->driver->run(job, &job->err);
> +    job_lock();
> +    job->ret = ret;
>       job->deferred_to_main_loop = true;
>       job->busy = true;
> +    job_unlock();
>       aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
>   }
>   
> +/* Called with job_mutex *not* held. */
>   void job_start(Job *job)
>   {
> +    job_lock();
>       assert(job && !job_started(job) && job->paused &&
>              job->driver && job->driver->run);
>       job->co = qemu_coroutine_create(job_co_entry, job);
> @@ -1117,6 +1218,7 @@ void job_start(Job *job)
>       job->busy = true;
>       job->paused = false;
>       job_state_transition(job, JOB_STATUS_RUNNING);
> +    job_unlock();
>       aio_co_enter(job->aio_context, job->co);
>   }
>   
> @@ -1140,11 +1242,11 @@ void job_cancel(Job *job, bool force)
>            * choose to call job_is_cancelled() to show that we invoke
>            * job_completed_txn_abort() only for force-cancelled jobs.)
>            */
> -        if (job_is_cancelled(job)) {
> +        if (job_is_cancelled_locked(job)) {
>               job_completed_txn_abort(job);
>           }
>       } else {
> -        job_enter(job);
> +        job_enter_cond(job, NULL);
>       }
>   }
>   
> @@ -1156,9 +1258,13 @@ void job_user_cancel(Job *job, bool force, Error **errp)
>       job_cancel(job, force);
>   }
>   
> -/* A wrapper around job_cancel() taking an Error ** parameter so it may be
> +/*
> + * A wrapper around job_cancel() taking an Error ** parameter so it may be
>    * used with job_finish_sync() without the need for (rather nasty) function
> - * pointer casts there. */
> + * pointer casts there.
> + *
> + * Called with job_mutex held.
> + */
>   static void job_cancel_err(Job *job, Error **errp)
>   {
>       job_cancel(job, false);
> @@ -1166,6 +1272,8 @@ static void job_cancel_err(Job *job, Error **errp)
>   
>   /**
>    * Same as job_cancel_err(), but force-cancel.
> + *
> + * Called with job_mutex held.
>    */
>   static void job_force_cancel_err(Job *job, Error **errp)
>   {
> @@ -1181,17 +1289,24 @@ int job_cancel_sync(Job *job, bool force)
>       }
>   }
>   
> +/*
> + * Called with job_lock *not* held, unlike most other APIs consumed
> + * by the monitor! This is primarly to avoid adding lock-unlock
> + * patterns in the caller.
> + */
>   void job_cancel_sync_all(void)
>   {
>       Job *job;
>       AioContext *aio_context;
>   
> +    job_lock();
>       while ((job = job_next(NULL))) {
>           aio_context = job->aio_context;
>           aio_context_acquire(aio_context);
>           job_cancel_sync(job, true);
>           aio_context_release(aio_context);
>       }
> +    job_unlock();
>   }
>   
>   int job_complete_sync(Job *job, Error **errp)
> @@ -1207,13 +1322,15 @@ void job_complete(Job *job, Error **errp)
>       if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
>           return;
>       }
> -    if (job_cancel_requested(job) || !job->driver->complete) {
> +    if (job_cancel_requested_locked(job) || !job->driver->complete) {
>           error_setg(errp, "The active block job '%s' cannot be completed",
>                      job->id);
>           return;
>       }
>   
> +    job_unlock();
>       job->driver->complete(job, errp);
> +    job_lock();
>   }
>   
>   int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
> @@ -1232,10 +1349,13 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
>           return -EBUSY;
>       }
>   
> +    job_unlock();
>       AIO_WAIT_WHILE(job->aio_context,
> -                   (job_enter(job), !job_is_completed(job)));
> +                   (job_enter(job), !job_is_completed_unlocked(job)));
> +    job_lock();
>   
> -    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
> +    ret = (job_is_cancelled_locked(job) && job->ret == 0) ?
> +           -ECANCELED : job->ret;
>       job_unref(job);
>       return ret;
>   }
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 5c0d5e116b..a0b023cac1 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -129,9 +129,11 @@ void qmp_cont(Error **errp)
>           blk_iostatus_reset(blk);
>       }
>   
> +    job_lock();
>       for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>           block_job_iostatus_reset(job);
>       }
> +    job_unlock();
>   
>       /* Continuing after completed migration. Images have been inactivated to
>        * allow the destination to take control. Need to get control back now.
> diff --git a/qemu-img.c b/qemu-img.c
> index f036a1d428..170c65b1b7 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -906,9 +906,11 @@ static void run_block_job(BlockJob *job, Error **errp)
>       int ret = 0;
>   
>       aio_context_acquire(aio_context);
> +    job_lock();
>       job_ref(&job->job);
>       do {
>           float progress = 0.0f;
> +        job_unlock();
>           aio_poll(aio_context, true);
>   
>           progress_get_snapshot(&job->job.progress, &progress_current,
> @@ -917,7 +919,8 @@ static void run_block_job(BlockJob *job, Error **errp)
>               progress = (float)progress_current / progress_total * 100.f;
>           }
>           qemu_progress_print(progress, 0);
> -    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
> +        job_lock();
> +    } while (!job_is_ready_locked(&job->job) && !job_is_completed(&job->job));
>   
>       if (!job_is_completed(&job->job)) {
>           ret = job_complete_sync(&job->job, errp);
> @@ -925,6 +928,7 @@ static void run_block_job(BlockJob *job, Error **errp)
>           ret = job->job.ret;
>       }
>       job_unref(&job->job);
> +    job_unlock();
>       aio_context_release(aio_context);
>   
>       /* publish completion progress only when success */
> @@ -1077,7 +1081,9 @@ static int img_commit(int argc, char **argv)
>           bdrv_ref(bs);
>       }
>   
> +    job_lock();
>       job = block_job_get("commit");
> +    job_unlock();
>       assert(job);
>       run_block_job(job, &local_err);
>       if (local_err) {
> 


-- 
Best regards,
Vladimir

