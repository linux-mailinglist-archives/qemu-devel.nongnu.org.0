Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E63FD75C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:09:41 +0200 (CEST)
Received: from localhost ([::1]:55728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNBb-0003Ak-7L
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLNAe-0002Nz-8q; Wed, 01 Sep 2021 06:08:40 -0400
Received: from mail-eopbgr00134.outbound.protection.outlook.com
 ([40.107.0.134]:38305 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLNAY-0006PV-Id; Wed, 01 Sep 2021 06:08:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0lDxhdZ5zyv9bW+pP8s+FepyXOHO1dppQPi3sQONzBRJK9MnVoSGdNfCzLjvnXcf9LgBKrNXfmigISssVMpoxS+W99oW48K2Q7vvxJFw82KN7S9hwSdeEmmytlN2874LIFBx6rxTHl+0yNG7RMagUcsJtVmtGE46f7kqQk8vYOunToIegu1kA/RJTAjoGC4OIkJIbJ48Z8Q/t6G5YWaHJ/x7+GOUTzYqmp2ZQkJrJJUA0NBqEbYJ875dPexQNyEcTYQP2WxQ2PLfW+HElmzfJLF2pae49wKrW9auxrg22g7DzRqwf36YNKMqVBa41+3Xt/BcBk2feRiku6/18x9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=G76GjF7d2D/tF/9Vb7+63L0/NwMBnB+EvfnsHAGN1BY=;
 b=MdZxQKm+1f44FaAzwTPTs/WHNjSr0zXrKYPt662E3YfdEJlNF1GScW5y5BsMyyeICsOU2AqlnaCfrY34FMPo8DOOdO77BJYjYUzcctgl6UHzlHE0/6sXJt3VvHv5THdUlbTzAd+glXS2BPXiecg6EaKVxAl51YrSSVGAtWcvmD9qHAg+JUYWs5WgYdJeAi3SgtCj1pRazbvodUiBXhwbJXqIqBmRro5zKdzAssGpFkSLOfaTLr3GRJ0ySLd8wzQ8ZBrIdBJ3ibzdfoEXo3SH+m9acJz4xAIS3Qrswdqh6GklD6WSL+B9XI/ILerhM7Gz9yl7ybOWHXpuDUCn3IcgCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G76GjF7d2D/tF/9Vb7+63L0/NwMBnB+EvfnsHAGN1BY=;
 b=TqdUlfVQb2tu2gEn+iZEW2n89BPwB7XjtiPEDM5s2YAxyK8XW1GAffcwP1z+f8ybCw+fJUkXI8mj+vAAdQIqSl3pkpqlSx8BTP5gM70JVwK4bLTI3ZbXODJGkFQIUdHKZ0Z8jWZTDctYUC5P6qNZNx4QCAPSk0cbmQZteujVolM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB2687.eurprd08.prod.outlook.com (2603:10a6:802:25::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 10:08:31 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 10:08:31 +0000
Subject: Re: [PATCH for-6.2 v3 04/12] job: Force-cancel jobs in a failed
 transaction
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-5-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <59a8dd10-21da-7068-c1e5-a7a8f2453d58@virtuozzo.com>
Date: Wed, 1 Sep 2021 13:08:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210806093859.706464-5-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0079.eurprd05.prod.outlook.com
 (2603:10a6:208:136::19) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR05CA0079.eurprd05.prod.outlook.com (2603:10a6:208:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Wed, 1 Sep 2021 10:08:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 304a4bde-18d8-48df-b496-08d96d307354
X-MS-TrafficTypeDiagnostic: VI1PR08MB2687:
X-Microsoft-Antispam-PRVS: <VI1PR08MB26878310C4C9E350377570DDC1CD9@VI1PR08MB2687.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRZhh2m9tO/aeWZXBiuv0axQZAyk+STxrwUIrCGFA5ch8dU34vJDuCJYNaliOuDWm5s2YBkLpqfO9wYi5oIvowaQqkLim7TM+2Kq7mgzIrfB3XSYMfO7xNQ358twhKGSeTbZbHb964Chtf2koeawPe0yHbvb50ugjHxP9G3tgaTcmCVucI20heEGoRgYp6bpo8svQA7ScsUYWTYSnguV7n+EdPgJNV7J39CVxn3AZVUNfoKhjAOCkeaVLM+i6HNX9LYseIEjrTZ/JLqCgRDRkwqzpE6CfXz9NXb3ELUHYdDAHu5uYYNBU/Z4R68XKIGD7l+LngNTjciRltcZl7bu7dW6XUlG5qS3LmhTLlH/Va+oZ12LA2gt7Nwd7f4LkQX9DoIGgYOuwTMrkmLfUwT66a1QL3G2Mq56jiJzh+ogBmDEJlfJwRbTmkrgJ6p9rvwI7ATAgsw1YXQyMAxDpG05NToVoyf8Jmio+ZV8vpmXQj2DWFzf2YtwKcNAwA3d1klo7UDJDTLDHMbWkpyJTFVieLQFjQDSvAmQqI0UXfOS+iDqzL6hOa3oOXLGl8h4wAgcNDfbt9f2SSa9l4CqR4L5j2MbpHKaKStKaA+nz60Z5Z9QMkvK0B24O8IvVT0kKqrUVZlYwhYosnKJczUWIKTSgqcfNNACk4S4KLt6P1cyYslpaDu2gTwcWX60HFEg0yAfMNccWsNVNX2k0U1/BvN4bykgdV01OqXZrPWYDsO6Snb8QHgdOLQVRjdYg2lyt3d38aCdYY7Ckx2VOraRYf31+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39840400004)(376002)(52116002)(956004)(38350700002)(38100700002)(8676002)(6486002)(86362001)(2906002)(4326008)(2616005)(478600001)(31686004)(8936002)(66556008)(5660300002)(31696002)(66946007)(26005)(66476007)(186003)(36756003)(16576012)(83380400001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXBwVGZrc1pubndNaXBSSmVXcS9iOXZ4OGJFNFhhU3gzSDFoYTI2dC9uMnhR?=
 =?utf-8?B?TnEreEE5anZ4b3BoTm1jSUVlTCtwdUo3QlVaZWJ1ZHpROTBzajRUN2M5RlNj?=
 =?utf-8?B?NTIyNnNobktQcmVkRU1kS3ZPdi9HRmVqVDloSXgxMGgrWXlsS1Nhb1AzdDhU?=
 =?utf-8?B?Slk5dk1xSEkwM3hDTVUzclVVQm9SYzRJMVpBRUpWMCtHSmkzbkFvSE5uNzVI?=
 =?utf-8?B?elZUb1NtRmV1L2I5K1QySHVPaEdYZEZSb1N4ckc1cWExWWJzVlJQWDY3eEVh?=
 =?utf-8?B?cGFwYzFMV0lrbGtwUzB1NUU0Z1JUNmJ6cjR3MGpXdTdtOWtvbUpYbVNieHRN?=
 =?utf-8?B?SDMxSExrTWl4N1M1WHpWL0hmNy8wWXZIWlpuR2FYQ3lUNDMyMFNqeGVXNXJ4?=
 =?utf-8?B?NFU0UlBlb3ZBMncwak1TVG1TUSsvYzhRdlBHQkhMUU10RjZMU2NNSlVvQ1M2?=
 =?utf-8?B?THBUKzRlZ2R0Ty9PMFk2SG9wR3d4ZUFyTFBFQmJmZlNnNVZBZmRmZnZGRnFT?=
 =?utf-8?B?ZVVENWc1ZE1Uc3hQTHc5TGVsY3JCSHQ5cUwrOWNrcDNLKzdLSDljTTdPWkVR?=
 =?utf-8?B?RTVHck1pVUEvNllFQk94NXMvRzBlTGM3WDNlbzd3RTNQM2w0UE02eHUrZmFa?=
 =?utf-8?B?bmIrNE5yUVlWR1N0Q0VlRm52emNrVUw0SEhJS2lYVEdHSmlQeHliUU9GbERH?=
 =?utf-8?B?YVFyK2gxR2NNZ2tielhBVldNYkpTRDVjSFBBNWcvcEpocFhucGxHY2tMVkxu?=
 =?utf-8?B?ZFdDdHl6dnNYWEV4SFpld214RE1BM1FXWVUrY3gwWFgwaEVVbGQ5SVh5VVFF?=
 =?utf-8?B?TFIvQnhBYm82SzR5dDVqUGxPVDFVTkpWOHV5TUorSTRGdjd0dHl3Nmg2empE?=
 =?utf-8?B?VkFXdFZHUk9aR21ycjlpTWJPTTZLb3lBSTJhQnJDcE10ME8zLzRwdUw4Nlcw?=
 =?utf-8?B?WkNhRXozWGx6ZXRpVXNFYnBhODVORHNBTkprazNTMVppMCtJYlNjYk4ydmpV?=
 =?utf-8?B?cndCZSszUHlRUFRpbGtnYllHY25ZMlR4THg1d3hnN0Nmd1RsWE03K29lZmo0?=
 =?utf-8?B?T3V2R2xwZFEwSGVRNUladGtUV2RyRHQ5dlpoNjB4aVhocld0N0hvUzFtSTg3?=
 =?utf-8?B?ajhlalcwZnNsOHpHU25IWEhtb2JqVHczeXZtT3RmL0wzbUJnVXVSSG43OCth?=
 =?utf-8?B?djh4RjA4bzVYM1NFVEs4b1dBWjAxTUIzQ1FqNzBKeDduY29PZ1laSVNtVEZK?=
 =?utf-8?B?QkMvdnNCU1FRcUZiZkx5S1FRdEtqYi8zV0hKbnJSN0srZW5YRUVZN0xQbWNI?=
 =?utf-8?B?dGluaEh2c0FSeWxXZjlpSkJIenFLa3gwVlZoSEhKUDBoTVZXV1ZwZG5mQi9P?=
 =?utf-8?B?WVR4MGtHak5rZC80NGl1SmpYTFpxZDdoTUJGQnF0Rk1NMGpPU09NNVpLZGM1?=
 =?utf-8?B?c09vcVpOdC8rdUtFYU11b1g1Ly9mSHhwZ2dDcUpoVlpROVVXZExhSW5Gb0hm?=
 =?utf-8?B?aHJxdVNJN2RZZmdNb3hwNG1FbmROS0daSFBsVGZmZDNNYktzZXRVQkJMMTVF?=
 =?utf-8?B?aUdkbEZxS2ZMRG56Uy9lVUsxNXN2WkR1UFBDUXRxaFF2czB6SHFqdFZSNlFU?=
 =?utf-8?B?L1BqdVZNek9rMFBjL2t2aC9yTVhWWXBVQ3pIM2lpVUdlRlVlckNxMi93NTZJ?=
 =?utf-8?B?a3FPN20vQkhTRGhSaGc2RHY0ZlA3ZlpCaEFyWEMwTkZ0ZHFSYnpPTGx0QWsr?=
 =?utf-8?Q?4kXRdTUmQEBUhD4DXh/JdnJ3XbLGbgoo5XUrK9I?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304a4bde-18d8-48df-b496-08d96d307354
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 10:08:31.1728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nmq1YzsRdlzAvPBqx7LMYDWTs3cwkLGMQaXCWYYbadVegmakrwMtAML/LIi90nbQ48wR/EHi77X8XUAnAMTpKMnMoWY2o3djttvl8xfJM1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2687
Received-SPF: pass client-ip=40.107.0.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
> When a transaction is aborted, no result matters, and so all jobs within
> should be force-cancelled.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   job.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/job.c b/job.c
> index 3fe23bb77e..24e7c4fcb7 100644
> --- a/job.c
> +++ b/job.c
> @@ -766,7 +766,12 @@ static void job_completed_txn_abort(Job *job)
>           if (other_job != job) {
>               ctx = other_job->aio_context;
>               aio_context_acquire(ctx);
> -            job_cancel_async(other_job, false);
> +            /*
> +             * This is a transaction: If one job failed, no result will matter.
> +             * Therefore, pass force=true to terminate all other jobs as quickly
> +             * as possible.
> +             */
> +            job_cancel_async(other_job, true);
>               aio_context_release(ctx);
>           }
>       }
> 

Anyway, only backup jobs may be in a transaction, which doesn't distinguish force and soft cancelling. So, that doesn't change any logic.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

