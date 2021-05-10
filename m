Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A017378B4A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:07:01 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4ge-0006jK-6m
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg4Wh-00072z-Ug; Mon, 10 May 2021 07:56:44 -0400
Received: from mail-vi1eur05on2094.outbound.protection.outlook.com
 ([40.107.21.94]:27265 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg4We-0002sx-Ta; Mon, 10 May 2021 07:56:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpZgBSPWWITOvZk2J28UImexq7lGhSG3NEhBOovPpS4H49+S9RxNE/24ohVKUvD3HCbgBTzNOukQNrxCxpPbsuTjNVZh5m4KlcTPQqpq2HhZpjWEghgi6UER1eEAIzml5fwAZqGRSO70CUYNlDAGvG6lFf/H3vZKCjtRSHLE/ivRhBVNwJBmP75Wt/4cTwYd5I/o/c9w90eM1qSuRxTNvfmfwozTl++8WGl+TiSvX5oWwpBes/0MdY8+P0QrFJ94edLCh/y+daPuMzOARH4EQktXeYRron0Ate7rcmh6AMdhpHhFWZvolnqbdfhf1rKbaYhzCU9COdgvQJ59jRE/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp/Uo2EWyijhI37OZrTi8yU+kHipEBVG7MbVEwtreDA=;
 b=Mv6bJOP2awQ8S+cAyjBxjv9BYp4XM6EJkgh+OkFFteGBF+a9szWif8gAjDVCAkWxyFt5WUT1FWIHydW+m0lqzshptX5SwKrI5hCJ/Al116Vxlbxxkv/AT995PyZxcFJpkzfdD127VtGEO9KICT2nlYgjUzmlU+dL+e02xKPGT1WnbMUoNl3PUvLukuDFuWVK4IWmDewR+l/m2ylTdLxuHb3XKJM0/f5LcH6InvDtXoIWdECRpw83kwkxu63xGK5yZsfQzYmaX752HYaJ/6z0h/0Tyx39MbkYYCseU+RmZtUUy61F2Uxp1BANmzR4rycNEyzHJR9RzsuTWFRMDIDTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp/Uo2EWyijhI37OZrTi8yU+kHipEBVG7MbVEwtreDA=;
 b=mB7AmvyOOqkQgxtxFPP2l/y0uvFhpruy+j6VBOMUdGFj+2PMicmu2xwx0Ax2miqPseoHlH41iydGAN8ZVB113EiYhZvq68JCywXIHKqlcFz4C4Smrqvwsfm8T+Vt8H88Epc9zc6pe+tM4zU6BGBEAusI9/na/q1OTu4IfbCXr10=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Mon, 10 May
 2021 11:56:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 11:56:35 +0000
Subject: Re: [PATCH 6/6] aiopool: protect with a mutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-7-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bb9be29f-a3ef-3869-ba6f-20a7acc1fe2a@virtuozzo.com>
Date: Mon, 10 May 2021 14:56:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210510085941.22769-7-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.12 via Frontend Transport; Mon, 10 May 2021 11:56:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 075002af-1c5d-44fc-579d-08d913aaa943
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53364C36A71C26E627436FB9C1549@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lW+CDaCejgud1x/pUHmTpsT7djlZD3dOJOMCMl1H27Y0gSSfiht9wWuBIJI2sq2MoTcsrwAQIlfEXNN8BInL3xnNjGdgdJYcq3DHKuWyk5ybaOzjP/LlGTs0u0sCPhb/rH/eLJLV87VmYo9NC5Mndp9hc60bJi56+wqRLVCuQHO93aBwEModLLAkj1OmWo8qSx34TBF73qFWy+6P0q4b9sIneIOkXxKiun6iuVVNRjYX2Vz9ERDw0usfM7YFCfJdRA5Gtrm1uLrvJALMoavGdjY+Po3jwTN/41qZWJFia2elPeLYb7m/hxAFF5V6rlkjo6ya7VmzoByjNHI6rqdHoVFKBjH6uUzL6v46tZDiMYxjzJFLrzdou2xCZUU7oqFjo1VPuHo0V1kPhaRBqfnalWL4Q5nbH/z5AyhYFm7l5GA/z3lruAAJ+OThgIVvJm3O5B1rK9H6F2wlZRm/dnnney64d/wK/ICrRG7ILOaN7WJcLT3uL8IVUxtxZ+ou2H7W1sCWLVEgqGqZFRX3k5+M2EWFNsoz0085cIEkdS2D6pxsZcjtkN76WWCZcB5u2Bq1q1ngbn3uDsUfpcVZFd4MFiJb952gIiVaAju6sQdmQFtZpoKIJ+NoFOzO0fe7+CiJLCfLWGOTyhWJCjZ0FUYjK+9n4/sOXg5gopjbBmy+Yn8CivSY6BpoEE7ciY8SxS12BqDBMZ0g8DNcsnVr3num7s+P8rd+1ynxf1lNmF2o+F1LyuFliZZbotwNumISt61WLSNbkvmz4F1NW8DHT/c+xYyNI+bAo8hbOEwjNvqW+BQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39850400004)(366004)(346002)(86362001)(2616005)(478600001)(956004)(66556008)(66476007)(6486002)(186003)(16526019)(26005)(54906003)(38350700002)(38100700002)(52116002)(8936002)(8676002)(31686004)(31696002)(83380400001)(66946007)(16576012)(5660300002)(107886003)(316002)(2906002)(36756003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WFplVEQ5ZmR2SFlGNlFrenplOGFlOFloSzhTQjJQRDVOc0x2ZDdpUmgrRlpK?=
 =?utf-8?B?dzdJZEp4STgzVUMzbG42VjBycDVuU2hhV2pJVnJDVHZrUTNHeVpCaGJQTjlm?=
 =?utf-8?B?eHVoMzR4ZFZPS0tiUnpPWlhqcnp5ZTFqd2g2YzY1WXFYY0hMN21GV3ZwYUlz?=
 =?utf-8?B?M0VsLzU3eWxUMTdzRnpBd1hIKzFGSVd0K05qTkQ3RzFoWHZJNDRyanBvRVJD?=
 =?utf-8?B?aVI0Wi9xZGZDN1ZqY2NiZmY0NUNhOVJUb2pyWkZ6QWdkWmlCai9xMFVpaHR3?=
 =?utf-8?B?WEZ1VlBJaDF3ak9PUmFtaVVQSU10L2l2cUdoWkxUU1N4cklpUUZrb3ZBVXJU?=
 =?utf-8?B?R2FweXIwcHBYV3hVYmIxckI3REVSSTRRL1FEVWk4NEh3dE1QZ0U1VjExbmNF?=
 =?utf-8?B?NzVaYnBrSHJKdmlYS3ZvN01IMEJVb3c1UXZXSEdGYlFoYlRLMTB5TS84RWRp?=
 =?utf-8?B?dXgrblFmNDRQWVhZVE1OcnB0VElOb1R6eUg3WGR5Yjh2ckU0NzlIVlliSFB3?=
 =?utf-8?B?VXF0aWNHZ1pHYnpSaDRiT0NGUE9WSmlhZU1oek5odEN5TVFGempDZjY1Z0ow?=
 =?utf-8?B?VlAvSFdTRUhzWkNOOXFSa3pHaThLSFRBYnNDMFNXaFVHZW5SMDd0NVhlY1dj?=
 =?utf-8?B?Q3lHNDVTMEdCdTVCQjVUMmdXV1hXdUNWOC9yN0pkNlhvcDJKYXM0MzZpS0RB?=
 =?utf-8?B?R0Zwd3BjUkhJTndqdm9hdzJBUE8zS0pzS0I0MFJYSFpIaUFsUm9xTit2NytV?=
 =?utf-8?B?NEY0TXVTNGpQZytZNFBqUkp3TmlqSkpubWRwRUgvUGdyamowTWFPbXZleHhh?=
 =?utf-8?B?TXlEUzNzQitsb0x5cVhvaTMrRGdrZ0lEYitsVzBBMlVRcmdqVDFtU1FDbFpu?=
 =?utf-8?B?Mk5OS3dpVUY3cWIyQlNJalNZVXlwSCt1Y3FpSERrQ2xjMXoySTZDYWZ6clF3?=
 =?utf-8?B?bzNhb2toU1htY1RqaTYyT2srYjZDaVBLaFpUd1lPMUJjY2o1NWdkT2RXM3Nu?=
 =?utf-8?B?QmJBTnYySWJmMWlYdUxqYU1jUUw0WElvcEU0MjlBd3FLSml0dDE0RzRtRmlF?=
 =?utf-8?B?UFN0TkcvdkFQYjhhdGNqYzRPbXVLb1BZajNSRERPK0VUTkJTTGdQUW5EQUlX?=
 =?utf-8?B?ZWtMak1ibG1JTjA2ellYU3Z3R1VZNTJTRHdRdWRRUmphd1JmcWl6YWhnc1BB?=
 =?utf-8?B?MHF1SEkweFFyaEhoZUJLS3gxdnI0ZDJ4Q0lNT05BRDNwYUMyeFNpWDllVG5K?=
 =?utf-8?B?dk5kQUowVlRzUFhuM2xHTlg0cGdKRjBRbjRkU2c3Z1RtUldQdGV6QTRSckJR?=
 =?utf-8?B?eTNUeThtUnBMc0J4OWl1VmozUzZQMlJ6L3Y2R01XQlI5NXd3bnBrWVFLS1RQ?=
 =?utf-8?B?cFBFeWhiZ3A5NWp5alJrcHorSHpjV1ROZ00yeXZmZ2pvUmlPWVVFL2RMSGxu?=
 =?utf-8?B?T3AzM05BTnBGR2Vyb1pTS2pNcWJNcWF2MHlFdWFPMVFiMzRMWXZVVEhkOFZp?=
 =?utf-8?B?REdBN1pEeWs5S2lGYjNkTEpXYW42Vkg2SnhGUmh5aGh4bk8xd24zZ2wrdU5G?=
 =?utf-8?B?cnI1MG50aXp5Qi9iZlFhSDUxemM3enYyVkV0cmdCcSt0SWlJclpOcUZZbm1P?=
 =?utf-8?B?ZWdkd3JMeXVIRFB2RW55TXZIaWF0TGx5TEhaWlB5MkhKM1dhZWZlS2ZGRUlr?=
 =?utf-8?B?bDc5WlVsWGdpWU43dGpWWGd4Z0ZqY2FQOVpxUFpibHdVTWJnL1VLMWdWME5h?=
 =?utf-8?Q?RqV1q4ifePeDlzht5fBGE4L7wmGxi9x8y7Vt8Ys?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075002af-1c5d-44fc-579d-08d913aaa943
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 11:56:35.5403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XO1yq4tEpeagGUkipjzFfWM1/3/2w4lLLtbV9F6W8gH74s+9RvjoYdGD/VnRrpm2Nsbga0KaCR7hLTLcoWgHqLUT/ESyazBWEO/Wi7J6Bjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.21.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

10.05.2021 11:59, Emanuele Giuseppe Esposito wrote:
> Divide the fields in AioTaskPool in IN and Status, and
> introduce a CoQueue instead of .wait to take care of suspending
> and resuming the calling coroutine, and a lock to protect the
> busy_tasks counter accesses and the AioTask .ret field.

"and" in commit message is almost always a sign, that there should be several commits :)

Please, do at least refactoring to drop "main_co" in separate of adding a mutex.

Hmm, actually, that was done in Denis's series "[PATCH v8 0/6] block: seriously improve savevm/loadvm performance". (https://patchew.org/QEMU/20200709132644.28470-1-den@openvz.org/)

Probably, you could reuse patches 01,02 of it.

(add Den to cc)

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/aio_task.c         | 63 ++++++++++++++++++++++++----------------
>   include/block/aio_task.h |  2 +-
>   2 files changed, 39 insertions(+), 26 deletions(-)
> 
> diff --git a/block/aio_task.c b/block/aio_task.c
> index 88989fa248..7ac6b5dd72 100644
> --- a/block/aio_task.c
> +++ b/block/aio_task.c
> @@ -27,62 +27,70 @@
>   #include "block/aio_task.h"
>   
>   struct AioTaskPool {
> -    Coroutine *main_co;
> -    int status;
> +    /* IN: just set in aio_task_pool_new and never modified */
>       int max_busy_tasks;
> +
> +    /* Status: either atomic or protected by the lock */
> +    int status;
>       int busy_tasks;
> -    bool waiting;
> +    CoQueue queue;
> +    CoMutex lock;
>   };
>   
>   static void coroutine_fn aio_task_co(void *opaque)
>   {
> +    int ret;
>       AioTask *task = opaque;
>       AioTaskPool *pool = task->pool;
>   
> -    assert(pool->busy_tasks < pool->max_busy_tasks);
> -    pool->busy_tasks++;
> +    WITH_QEMU_LOCK_GUARD(&pool->lock) {
> +        assert(pool->busy_tasks < pool->max_busy_tasks);
> +        pool->busy_tasks++;
>   
> -    task->ret = task->func(task);
> +        ret = task->func(task);
> +        task->ret = ret;
>   
> -    pool->busy_tasks--;
> +        pool->busy_tasks--;
> +    }
>   
> -    if (task->ret < 0 && pool->status == 0) {
> -        pool->status = task->ret;
> +    if (ret < 0) {
> +        qatomic_cmpxchg(&pool->status, 0, ret);
>       }

Can we just do it inside critical section above and avoid extra cmpxchg? We'll need just qatomic_set as a pair to qatomic_read()

>   
>       g_free(task);
>   
> -    if (pool->waiting) {
> -        pool->waiting = false;
> -        aio_co_wake(pool->main_co);
> -    }
> +    qemu_co_queue_next(&pool->queue);

this call doesn't need mutex protection? Then we should modify comment insid AioTaskPool structure.

Anyway, I think it's simpler to just have one QEMU_MUTEX_GUARD() for the whole function.

>   }
>   
> -void coroutine_fn aio_task_pool_wait_one(AioTaskPool *pool)
> +/* Called with lock held */

again, such things usually called _locked().

> +static void coroutine_fn aio_task_pool_wait_one_unlocked(AioTaskPool *pool)
>   {
>       assert(pool->busy_tasks > 0);
> -    assert(qemu_coroutine_self() == pool->main_co);
> -
> -    pool->waiting = true;
> -    qemu_coroutine_yield();
> -
> -    assert(!pool->waiting);
> +    qemu_co_queue_wait(&pool->queue, &pool->lock);
>       assert(pool->busy_tasks < pool->max_busy_tasks);
>   }
>   
> +void coroutine_fn aio_task_pool_wait_one(AioTaskPool *pool)
> +{
> +    QEMU_LOCK_GUARD(&pool->lock);
> +    aio_task_pool_wait_one_unlocked(pool);
> +}
> +
>   void coroutine_fn aio_task_pool_wait_slot(AioTaskPool *pool)
>   {
> +    QEMU_LOCK_GUARD(&pool->lock);
>       if (pool->busy_tasks < pool->max_busy_tasks) {
>           return;
>       }
>   
> -    aio_task_pool_wait_one(pool);
> +    aio_task_pool_wait_one_unlocked(pool);
>   }
>   
>   void coroutine_fn aio_task_pool_wait_all(AioTaskPool *pool)
>   {
> +    QEMU_LOCK_GUARD(&pool->lock);
>       while (pool->busy_tasks > 0) {
> -        aio_task_pool_wait_one(pool);
> +        aio_task_pool_wait_one_unlocked(pool);
>       }
>   }
>   
> @@ -98,8 +106,8 @@ AioTaskPool *coroutine_fn aio_task_pool_new(int max_busy_tasks)
>   {
>       AioTaskPool *pool = g_new0(AioTaskPool, 1);
>   
> -    pool->main_co = qemu_coroutine_self();
>       pool->max_busy_tasks = max_busy_tasks;
> +    qemu_co_queue_init(&pool->queue);
>   
>       return pool;
>   }
> @@ -115,10 +123,15 @@ int aio_task_pool_status(AioTaskPool *pool)
>           return 0; /* Sugar for lazy allocation of aio pool */
>       }
>   
> -    return pool->status;
> +    return qatomic_read(&pool->status);
>   }
>   
>   bool aio_task_pool_empty(AioTaskPool *pool)
>   {
> -    return pool->busy_tasks == 0;
> +    int tasks;
> +
> +    qemu_co_mutex_lock(&pool->lock);
> +    tasks = pool->busy_tasks;
> +    qemu_co_mutex_unlock(&pool->lock);
> +    return tasks == 0;
>   }
> diff --git a/include/block/aio_task.h b/include/block/aio_task.h
> index 50bc1e1817..b22a4310aa 100644
> --- a/include/block/aio_task.h
> +++ b/include/block/aio_task.h
> @@ -33,7 +33,7 @@ typedef int coroutine_fn (*AioTaskFunc)(AioTask *task);
>   struct AioTask {
>       AioTaskPool *pool;
>       AioTaskFunc func;
> -    int ret;
> +    int ret; /* atomic */
>   };
>   
>   AioTaskPool *coroutine_fn aio_task_pool_new(int max_busy_tasks);
> 


-- 
Best regards,
Vladimir

