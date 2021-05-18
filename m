Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EB9387C2D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:13:53 +0200 (CEST)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1Ps-0005kz-Kf
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj13X-00006L-PM; Tue, 18 May 2021 10:50:47 -0400
Received: from mail-vi1eur05on2110.outbound.protection.outlook.com
 ([40.107.21.110]:42976 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj13N-00066L-PR; Tue, 18 May 2021 10:50:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPtwodKj1AOrW9hOSDTvoNkFYXqt4BmYvGhRNb89vTJQuBcvcDsDk9f1Ukqi95Ks9WZ748zeO9NyrPFXSYxzLqhskuGW4qJ1y2GGMDm2bvElI3+AJ3hbkOU8hog1b3Bji6H6joDdZ3uMv3wFWsey9td53EqZ3h779UYj5raTiuZNnNX1Qc/DSOwSVGSrOakIdXsAa3UoyxVV39dNiIwtAEnZ9OR+gFauP3Orc5WlzXz6HN4uArpP/8ovH/R6PHPI8VtY3LN+csa0wGcOfasqOmWtDFNlv31qKbITwQ5OFCQozI1e3yGy2P4hnGeLR5ncC+U84Z3hwrfINexQWjxHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/vLzUpR7ZyN19InCLP/sVmb3JJ+j5BAEB7mkmL4u4s=;
 b=WHcS137pjm3Zlqd7ISA0nPt31rt4x0inRczteBT16GyZFF+P894Juv6s5kKtxBkUHoVq4uTr0bydcIpfzMi4kiNbQwaII3i2CyIHpKkATHdSriLFbx5jX4xA4h/tdcJXnwvqlPDmBuO85ngny1Tm+JrBUF48CW0bw5cXdFGLsNDuZHyWkZmXwRY0lVXcTtOs9tBxY/WvdNQP0aY1PWF4cFPXDHKINLQCc5FB09zqIffPH7i85Ff/PuDpP/gE2ifrl+5THCXrojiWixgC48CGsZwnjwpXksODX+y0+98s7EE8dWsFB1ld3AgncTfUH3g3sdhkaCDuhxfYdWRwXremzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/vLzUpR7ZyN19InCLP/sVmb3JJ+j5BAEB7mkmL4u4s=;
 b=tKBfi9lixrgb/0YGZO7rxd/0zJ5E0BrSs/Uv0veczi2rACmpdgS/FF2XNA377yZWT3VofjOTBdrqOn1yCu/cg3fBKpjI2aJgrXq7nbGCShMojegYw5cIWhlfzeqZLtUBWBNd8jUxlccwZFtiZd2JPjNzY7R0YQg2YB85gaL5k70=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3958.eurprd08.prod.outlook.com (2603:10a6:20b:a6::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 14:50:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:50:31 +0000
Subject: Re: [PATCH v2 5/5] co-shared-resource: protect with a mutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210518094058.25952-1-eesposit@redhat.com>
 <20210518094058.25952-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <230633b5-72cf-31f2-5c22-564a0f2b5c3f@virtuozzo.com>
Date: Tue, 18 May 2021 17:50:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210518094058.25952-6-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: HE1PR0501CA0034.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 HE1PR0501CA0034.eurprd05.prod.outlook.com (2603:10a6:3:1a::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 14:50:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e304ffd2-c200-4e36-4286-08d91a0c48d1
X-MS-TrafficTypeDiagnostic: AM6PR08MB3958:
X-Microsoft-Antispam-PRVS: <AM6PR08MB39585101894AE76F89AC6200C12C9@AM6PR08MB3958.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AxW2zjL/efJ2izGdfaWEHBgUkwMRpZGF2R7herBnaOBEKB7jtMwKPWCOQ1WnTncCe3FjoKEoBNdgiIukyEVHrLumuIopFKm+gKXXesFmlNVbWq3o7A5xEJkC/osBY2favue4A3o7JngrQf1x2S9qmw4VrcHKD6zzkUdjIU6fYkp3jxZ+AcImdKZX1jteHsyzu451xWDiBwm+F8I444uwHqjvXUZK1MOh9Nx3Ei9MF663XXl3vkA9eaDMXnfqiyUsu3phJMk2ttU9HSQI+OmQZk0RfwPVqWF/F8yN+7H7AQB8aRY1SKmuRzYoETxPT3CXj+CDF6ntJC7lt+6do1/x2N6hw2IZbH1NgjxVTmJlDWyvyTk8uqtaj3A3sVwsavgJ1mnsPqHlKdmnKPN+BXBlpfRWTGiBU83BsHsL4aziDlQ/1A1tmJ6kUBQ0TCMpJQHa/50iYevGfMQjB+Ufahw8+781zd+P1ZYUoyKRW2SEO3kT6A1ItONOiF2B/53l7Mhsxj8teE/uD03xhr2dXgSt+ez79J5gBY3uXG+S0GL+uR0BFNNHUxX+WVhMtykFT0hz3PMtBJ4vhTBi6EWNGrvHItYpkQg9CEDXN8vIEIw5VqELif1wxOabwfQf3KFZhbLK+LBsTBi4hVBlpgCbQEw81kcubxqPIrwW9FlP7YJufBkPzyqXCGSTNEvG22qCWX/LspOWRank3tYpZGOiPdMiN9H/lQPhXpc3xJynODPTsJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(376002)(396003)(346002)(4326008)(54906003)(86362001)(26005)(8676002)(478600001)(5660300002)(186003)(31686004)(2906002)(66946007)(16526019)(66556008)(38350700002)(52116002)(36756003)(6486002)(38100700002)(8936002)(16576012)(2616005)(83380400001)(956004)(66476007)(31696002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QmZBVXozQ0c5RjB4aFdGZmlRKzBGOHlteFRqUitsQWs1ZnM4V095d0UxaUo1?=
 =?utf-8?B?VFl5OXpRTVIxNXVsNnJ2RzZ4eERZWnZuVDRDZFBpOEpxZzErWHEybUhrZlRN?=
 =?utf-8?B?MHdZMisvQ1JwWXRaL3VNUVQxNUdodFNtMTNYYTYvaXhHNVVJYk8rUHJiUjJP?=
 =?utf-8?B?ZDEwT2RLengwK1ZSWGU5dFFoL24xakhyanIyNW9zWGhENEtBY0tDOE80QjM1?=
 =?utf-8?B?dWkxNGUyYnk4VTBpQ2piT2JUUExSRm5BUzRWV01lWU9KU1ZVTENka0JTQmxV?=
 =?utf-8?B?dlg5QjNiNFVmdUpnMnRtNzM4OW9HWGhFZEhTcDhYUWR6V0RjaENiN2pycDlD?=
 =?utf-8?B?RUVqK01LTVpucCtPemtoK3B0MExqNzNiWEJRZlZUbzBpcUx6WmljVXpJY1pF?=
 =?utf-8?B?R25WWmFuVituQ2tHSzJINVpUK3lsd2FYUEgyYUp1NWZhcFRSandpRy9EbzBy?=
 =?utf-8?B?cS9wWVAzN09XVGRCNXNrN09vTGVpVmlWcUp0c3V1cG5kbG9CMnY1MktWdHVm?=
 =?utf-8?B?SkFwNm5PT3h3cEtaU2dGZFZkM0lSajVzTzdCbTdEUU9kZkVXU1ZWTCs1c3RK?=
 =?utf-8?B?VzJvWk1mWFEyNEdsK240MW5XVlg3Z2pFejRuQllvK2t4dmtEQlNwWDFVMkJ2?=
 =?utf-8?B?K1YwY2VJTlJpUW1tMUZSS3JGOEV1M0lHTWd3K1QzeHpOQjBxeXd6VXhvdFhQ?=
 =?utf-8?B?YkN1Wkp1ai9JV3I3UHRJOVFPRnNUcGZ1WXFVbWNMUVRCbFFQWkZvQ0FSNzk1?=
 =?utf-8?B?b05peU1FQWZIb21haGVHRjN4RHBoWEdscVZHaW9MZFNMZy9jeWNLMnZzK0xp?=
 =?utf-8?B?bzNMYkl6c2dJS1ZWTnNDTVVuZVVKclY1dnc1M1psMTVVblZtMUFhRVFqN01X?=
 =?utf-8?B?NEppNXA0ZXp4Z0d6Tzg5cVJTY0FpbHZIazlvKy85QUxkMVpPbHZ3VVRrQmRr?=
 =?utf-8?B?NE5wSFRvblI5bTd6eVFLRDdxQ0h4VWJBeHB4K0Fmdm5pWmh2dUtTWGkrM3lW?=
 =?utf-8?B?Qzl2c2E1RG85d3MvSnlsSElvNTdDbmFpZDFKYnJrZWtJbVdPVzJIK242eFhL?=
 =?utf-8?B?ZWlVei8wU1c2SmkzUTJ4MjJtSTdlcHoyaFNGWW5uTWpQdzk1SnFNUHkxVEF1?=
 =?utf-8?B?MS8yZFdMdFowMk94b21XTzFBMHl0K3lGQUEvaTlRbFp0ZDh1TVpsaC9ycmwx?=
 =?utf-8?B?R2haZCtzNU0zbjE3bXBrODdGL1liK0I2T3dPd3NWRVRlSDVrWDVjUXZLTXY3?=
 =?utf-8?B?enFPS3JUdVRjVExGMUtHN2o4RlRxWkk4K3RpWXpQRUJFSDQ3RVF6aGxaMVNz?=
 =?utf-8?B?NmxmNjd5SjZUMFpEUkM0MVRiN2F4Zzd1RngrbSt3V2U1U2xPbGdUdjMwZWFm?=
 =?utf-8?B?aXN4N0xoQ01pRnBYY1RkMW1ZazEyMWZkdUV2NTVnbCsvTlJtVFQ5WmV0UGYw?=
 =?utf-8?B?b2x3N21qNkZmdUlrbWI0SWVRR2paeldSNnhaNkx3L1BOMDlWWC8waGFHVUo4?=
 =?utf-8?B?RXBtVFAvb29zZDRaZFp1bHZTVXlwQ29vYzRsNzZZS1pySEVEQWp0a2k1ZHZX?=
 =?utf-8?B?MFlGVVZsWTEzOWZObUV5dEl5YjZFT1M2ejVVMER2QkNzaGVPQ0ZJVW16R0xO?=
 =?utf-8?B?UlZHQy95UXh2eHpkNk5mVUpUSXdqODkwKzRrSTM2OXRJeVZIcjJRUzZHZ3NQ?=
 =?utf-8?B?cHNGLzJ3SktUdndBNjR1U3QwcXptd0svYXJzT1VRRVcxWTlNSlYvcUIvZjA2?=
 =?utf-8?Q?S3CWrKsze7amueenO1N0yzKMBWjT/+7qVd5yx2F?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e304ffd2-c200-4e36-4286-08d91a0c48d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:50:31.4613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5HTPkaRa+ieGRUoGG1joiWmUJQ0BoAYo5Smyj0yP/Cvxp4Wf/wYihrL4K0RyFC2R++DUp+grMfkBpX8nq+NqjDZUKoDhYzTr1GKT8N4Abg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3958
Received-SPF: pass client-ip=40.107.21.110;
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

18.05.2021 12:40, Emanuele Giuseppe Esposito wrote:
> co-shared-resource is currently not thread-safe, as also reported
> in co-shared-resource.h. Add a QemuMutex because co_try_get_from_shres
> can also be invoked from non-coroutine context.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/qemu/co-shared-resource.h |  4 +---
>   util/qemu-co-shared-resource.c    | 27 ++++++++++++++++++++++-----
>   2 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/include/qemu/co-shared-resource.h b/include/qemu/co-shared-resource.h
> index 4e4503004c..78ca5850f8 100644
> --- a/include/qemu/co-shared-resource.h
> +++ b/include/qemu/co-shared-resource.h
> @@ -26,15 +26,13 @@
>   #ifndef QEMU_CO_SHARED_RESOURCE_H
>   #define QEMU_CO_SHARED_RESOURCE_H
>   
> -
> +/* Accesses to co-shared-resource API are thread-safe */
>   typedef struct SharedResource SharedResource;
>   
>   /*
>    * Create SharedResource structure
>    *
>    * @total: total amount of some resource to be shared between clients
> - *
> - * Note: this API is not thread-safe.
>    */
>   SharedResource *shres_create(uint64_t total);
>   
> diff --git a/util/qemu-co-shared-resource.c b/util/qemu-co-shared-resource.c
> index 1c83cd9d29..bb875a86be 100644
> --- a/util/qemu-co-shared-resource.c
> +++ b/util/qemu-co-shared-resource.c
> @@ -28,10 +28,13 @@
>   #include "qemu/co-shared-resource.h"
>   
>   struct SharedResource {
> -    uint64_t total;
> -    uint64_t available;
> +    uint64_t total; /* Set in shres_create() and not changed anymore */
>   
> +    /* State fields protected by lock */
> +    uint64_t available;
>       CoQueue queue;
> +
> +    QemuMutex lock;
>   };
>   
>   SharedResource *shres_create(uint64_t total)
> @@ -40,6 +43,7 @@ SharedResource *shres_create(uint64_t total)
>   
>       s->total = s->available = total;
>       qemu_co_queue_init(&s->queue);
> +    qemu_mutex_init(&s->lock);
>   
>       return s;
>   }
> @@ -47,10 +51,12 @@ SharedResource *shres_create(uint64_t total)
>   void shres_destroy(SharedResource *s)
>   {
>       assert(s->available == s->total);
> +    qemu_mutex_destroy(&s->lock);
>       g_free(s);
>   }
>   
> -bool co_try_get_from_shres(SharedResource *s, uint64_t n)
> +/* Called with lock held. */
> +static bool co_try_get_from_shres_locked(SharedResource *s, uint64_t n)
>   {
>       if (s->available >= n) {
>           s->available -= n;
> @@ -60,16 +66,27 @@ bool co_try_get_from_shres(SharedResource *s, uint64_t n)
>       return false;
>   }
>   
> +bool co_try_get_from_shres(SharedResource *s, uint64_t n)
> +{
> +    bool res;
> +    QEMU_LOCK_GUARD(&s->lock);
> +    res = co_try_get_from_shres_locked(s, n);
> +
> +    return res;
> +}

it can be two lines:

QEMU_LOCK_GUARD(&s->lock);
return co_try_get_from_shres_locked(s, n);

> +
>   void coroutine_fn co_get_from_shres(SharedResource *s, uint64_t n)
>   {
>       assert(n <= s->total);
> -    while (!co_try_get_from_shres(s, n)) {
> -        qemu_co_queue_wait(&s->queue, NULL);
> +    QEMU_LOCK_GUARD(&s->lock);
> +    while (!co_try_get_from_shres_locked(s, n)) {
> +        qemu_co_queue_wait(&s->queue, &s->lock);
>       }
>   }
>   
>   void coroutine_fn co_put_to_shres(SharedResource *s, uint64_t n)
>   {
> +    QEMU_LOCK_GUARD(&s->lock);
>       assert(s->total - s->available >= n);
>       s->available += n;
>       qemu_co_queue_restart_all(&s->queue);
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

