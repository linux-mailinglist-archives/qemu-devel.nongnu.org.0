Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6AC3A197B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:27:23 +0200 (CEST)
Received: from localhost ([::1]:52658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr070-0004I2-R1
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqzi8-00032R-Qu; Wed, 09 Jun 2021 11:01:41 -0400
Received: from mail-am6eur05on2100.outbound.protection.outlook.com
 ([40.107.22.100]:22112 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqzi5-00073X-OQ; Wed, 09 Jun 2021 11:01:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKZrtMqBsov6AEshOU8sfEFK7QEMG66ALgzIC7FCwTWhiC7i6ujjN8/iDuNOCGjOcvVNhZFRXOPsV7Mv5JYZuD/QIaphvLgaRDeDOIuotx/LT9E2oSSkP3UJk88I6PIGVN5USFle4LkyeruncfcVd8yNo4wn6dxcEV0yY4OSxzedH6byJlNxVocYSvyo//LwAB1DdxPrbD9QndVyd076q/my+vi36hzLLregPOkPbyykJWy+7VPqItLBm90+F9unlwFKujS0sP0/uW0XfJplUKDsqc3TDIpxlgUWVqNtJZvtK7RGjDw+lQ+YFg98LrMAEdFvUPQuQqBFUG+8nJjPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiYMiR3Rm15PvGnqu4b+iTkHM4ZKcjHP0YFwHLQSw40=;
 b=EkC7uEvGDRtFGHSTVSRwe0uE2b5kOc5k5HzFHniD1XjmxxrFwqBoF3wvKfsXVe5bPtKoCPdVmvtI7pHpGMBmRAgT8PebhlUsfj8hp5PIsjF9JJSFdBQmmrKmrCVrORuU6YAaN0FPn6eTyZLdskdMaFJKq5N2Pka5R/h0ylzMNPk+L3bMm3Mc0oTLrUNsAFA5rUoNt3LkhIxuUUNG5P0pFNYD1amV1uRloy6CVffoCZunV4df7ptgWKjybltuStJRRSZ+rA5mHPdH+e3jHF0PzjnK9eV0yCqUlicbt+kFcFE3YmFUvBfyblQll1y32f5NmkQc94M/6c2U9niWtXm69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiYMiR3Rm15PvGnqu4b+iTkHM4ZKcjHP0YFwHLQSw40=;
 b=v9NY9Bd1QbAjyqVa72OSgaXEP7aPj9WcKUksXFID+ugwlwX8AtqUtlqntSJ9kncKTXwsOClqcZ6Ek2vphrb4u1AUkvzJIEE/9gijoKgKHPpslMcEsgEa1nuTT2oojEPev1husolYpREFgLTe3amhHxVGfxFkQoM22Tv7L5SjlZU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4721.eurprd08.prod.outlook.com (2603:10a6:20b:c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 15:01:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 15:01:27 +0000
Subject: Re: [PATCH v2] async: the main AioContext is only "current" if under
 the BQL
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, qemu-block@nongnu.org, eesposit@redhat.com
References: <20210609122234.544153-1-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0f6e48bc-6c72-63b5-a3d5-ec2696437237@virtuozzo.com>
Date: Wed, 9 Jun 2021 18:01:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210609122234.544153-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR08CA0014.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:208:d2::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 15:01:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfd3a186-443f-4bb7-f450-08d92b5774d0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4721:
X-Microsoft-Antispam-PRVS: <AM6PR08MB47218187B474115B9CCF0EECC1369@AM6PR08MB4721.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4vqSZ4xaHoNQ6574sOWUwSxwkC0Oq1emtAe5gSheSzpMKFdYrXMYUo7+OQFLV4gPE3DSINTO0HX23KeiWP6Te0SC46+M4PS5KMzZ9ZIClh1bxdCa+vqq7Eeu9+nOSZ1pFE1DwAf8bRJGQWBaidGWUqLO293Nqe2M0MDiwmIndNMLi+TV9IKKDYwJWcF151p0eEivakZy0GdF7r5fcNc+bM4hMBaOYOc4PkhL0hhTF6noRA/44jdKjRLGREhe4sajAsVDo9DdBmtSXRatrKJDWuZgHt0iJdgd7FGLv5oMx86s9dqMb2lFCNzVZCSC8VFds7QveNawpLOmbgKmfptzi7Yt+LNzd5AMcm2dZxDavmmZ1X5te9KsUpTz3bwjtRBn0OjQH32/3fDy7PS5nz1UPckiICfbTFwWfm2Kf9I7bNLShJ1s0YU2QoNQoL/vwjXfdtgVBi5y44tkYboI9kCNOdBtglv3aqU7OSbGLr1zuTYYE0GMAMZUDxgC3iS9RiOM3X+ZMw2anPHM9IeqRBleYhZfositQ4vSZkWhC3rTFml6sB0hwg8umOCRJa/bYzjR3BglA1Ja4RDa7EDTVl1ZuGPT6Q2Mk6xf1eVLACY+aj63pdL3jWaDv5MAQcLnrpdDNYuOMEaXFd+Zv+3FVG9yoQFvAGmnSb78hOL1LVRhrmHsB3uXR6S0EoQi8ws6jI8QW6s/FuSxqkAo/qbXTVsXzttV3V13j31M98JxBGR9EwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39830400003)(366004)(346002)(136003)(52116002)(38100700002)(26005)(186003)(5660300002)(31696002)(956004)(2616005)(38350700002)(16576012)(316002)(6486002)(31686004)(2906002)(86362001)(66946007)(36756003)(66556008)(4326008)(66476007)(83380400001)(16526019)(8936002)(8676002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEdSSmVBYmdhVHFQTmhYdFJYblhOOUEyWGRxK0lwd002RDFuK3cyalJCaXNM?=
 =?utf-8?B?dVlURTNnMVBwSmFBS29vak9waDEwNXV5a25jWHQrTHZkc015UzJLc2FsZTEw?=
 =?utf-8?B?a1ZhUEpYaW85YkdJSHlHVHVnMk0yVVRHOWxUVFdFbHptMWlWbEUwLzRZcnFj?=
 =?utf-8?B?Y2FLNng0dVF5UlNTbXhrZlJ3TWZxWE5ScmcyQ20wYUIvdjh6TGhhdUhzWVhV?=
 =?utf-8?B?dnM4ZklVa0ZpZlhmdUxFdzgvT2R5dGdzYUFmOUIrQXFJRnRZNVVtdlJkdkx0?=
 =?utf-8?B?b1ErQm5wNzFZLy9SZXRDRG8yeVh6Uzg3RGNKQi94TU5XeGQwenNteVE2Vk42?=
 =?utf-8?B?QzdZTENEQjVXVFBVc00zQ2l0dXNINWNiOXlHdnFzWW1POWZwSEEzWkFPbjRj?=
 =?utf-8?B?TUdNL25vcUZtVUVsSE9yNHhjTUlXNkxFYjlTNHhCb3VlNzIyZFRrRGEvVmQ4?=
 =?utf-8?B?RE43ZzI2ZWtjZXdtUkRXd1BCWlRPWDdXSUlkZ2Q3eWJ3MTduM1l5SFlmbG5R?=
 =?utf-8?B?anM5bDZCcFczQlVjQk1hZm81L21vdzBSK3kvL3pjWlZOWU5tMkNGa0V6bWpR?=
 =?utf-8?B?QVgrejIvN3VUZllZLzA4Y0Fzb3BXSitaTEhLcFBERVFadFpuUFZPb3RsWEtw?=
 =?utf-8?B?NGJqR2NESFJkTDlHYUdpQUJJOUdLaTZGWmwrRkkwNlJNbVkzc2RaUTZXZFVv?=
 =?utf-8?B?ZDd5ckZvOU9UdytKRGpzZlVmMCs0V3o4QjVydGpRb0lXVE5vcW1tU1ZvNjN2?=
 =?utf-8?B?MU8veEZLbGRGQWErOUNaRFlhejUvQmk1TUxVVnZueU1NaE5HOFJnbmp2TXZu?=
 =?utf-8?B?TC9udHNKbzROWWkwN25vR1hBNkFzWDZQQmJpNG5nSGd0VWd5K1BSMXdJVjFN?=
 =?utf-8?B?eXZLTkdzekc5RjVNNUNJdDNqUzl4V2t1YzBnNnJrOUo2ZWJmTHdNd0dyNmNN?=
 =?utf-8?B?Y0U5UlY2OEsySWpsdmhwS1ZoMFAxMjdoT1lvVmJuTGVMb0dNaytwTFB2OFds?=
 =?utf-8?B?a3RMb0M2OHlaYzFwUEw2bi9LdGRTZWxlS1MvNWt0ODAwcjZyZ3A1Mlp1TnFh?=
 =?utf-8?B?YnFBeFdmSS9CaE11L1dWWFZpODVEc1VrY2tuSVR0TEpncTNQMjJwRUZzTXNJ?=
 =?utf-8?B?NjJBTkF6YWFLR3EwTnA1SFpBb21oTmZkRWpKTlVuS1FpLzJqcjBLaW1ncllH?=
 =?utf-8?B?Zkk1OFN6Z1VqTDkwSUMwTUhBTmFSNjRDdHVkZ2VXUXI1aEtHOFhYS2lEazVw?=
 =?utf-8?B?dkEwVlYyQlZ2NjY0QTd3cTZ0eWJObTVITFhlQTlNNFMvUUhHRzZpdkJ3WTAw?=
 =?utf-8?B?Y2FWRW9lQTJsNHlEZlRvSkxLaTdXeGVldGFSd0JjS1hWcVRvaE1oeTUzanIx?=
 =?utf-8?B?dHptNHljMXVuZ1E3YmZaNjF1WjU5NnBJRE9ZelFCb0hhbnlVSzlzeWw0ZDBZ?=
 =?utf-8?B?dGtTbHlUMk9iaE5GV2hvd2FLTGQzRDI3TkYzQWVzYUFMNEJJc0plencwcVZl?=
 =?utf-8?B?T1hiSkwvTTZzeUZHWm53MUh0UTc2MlFadm1FOFVhNGdOY2RSVyt1Z1FpQTZJ?=
 =?utf-8?B?eFY4VHc5bmFrMXluSStqS202aVNtWHFnaDlnUE9TUEUwbHZtRTNncHkveS9R?=
 =?utf-8?B?YjBBc0hxNnE3UFUxcko5cWZjRUdYekdIWXlrYlNTOXErYXJ5NVpkNEdyZm9w?=
 =?utf-8?B?OUoyZFkrTFd2aU5vVWlUNHk0T3pUVnZMY0RXTFhUVmFqdXM2NVd2U0FWVmhS?=
 =?utf-8?Q?g3pZRqivl/x0FoCcnBiWG49ul4GaOiGk5jMQ0Ap?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd3a186-443f-4bb7-f450-08d92b5774d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 15:01:27.2452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDx+lVHtg66cuXAHQw4QAnewJsKypgcaHQYZvOPN/p0zRCnt6wp544HFF9/PgdfK5QETs2ydNSqELCPjTy9gCutBVpC7jkNIxHFbRtCF6OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4721
Received-SPF: pass client-ip=40.107.22.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

09.06.2021 15:22, Paolo Bonzini wrote:
> If we want to wake up a coroutine from a worker thread, aio_co_wake()
> currently does not work.  In that scenario, aio_co_wake() calls
> aio_co_enter(), but there is no current AioContext and therefore
> qemu_get_current_aio_context() returns the main thread.  aio_co_wake()
> then attempts to call aio_context_acquire() instead of going through
> aio_co_schedule().
> 
> The default case of qemu_get_current_aio_context() was added to cover
> synchronous I/O started from the vCPU thread, but the main and vCPU
> threads are quite different.  The main thread is an I/O thread itself,
> only running a more complicated event loop; the vCPU thread instead
> is essentially a worker thread that occasionally calls
> qemu_mutex_lock_iothread().  It is only in those critical sections
> that it acts as if it were the home thread of the main AioContext.
> 
> Therefore, this patch detaches qemu_get_current_aio_context() from
> iothreads, which is a useless complication.  The AioContext pointer
> is stored directly in the thread-local variable, including for the
> main loop.  Worker threads (including vCPU threads) optionally behave
> as temporary home threads if they have taken the big QEMU lock,
> but if that is not the case they will always schedule coroutines
> on remote threads via aio_co_schedule().
> 
> With this change, qemu_mutex_iothread_locked() must be changed from

Did you miss "qemu_mutex_iothread_locked() stub function"?

> true to false.  The previous value of true was needed because the
> main thread did not have an AioContext in the thread-local variable,
> but now it does have one.
> 
> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Weak as I'm not good in all these iothreads, neither I know does all old callers of qemu_get_current_aio_context() are ok with new behavior. Technically looks OK:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Also, it works well with my nbd upcoming series, thanks:

Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Ask just in case: aio context of iothread is set only once and never changes, yes?


> ---
>   include/block/aio.h   |  5 ++++-
>   iothread.c            |  9 +--------
>   stubs/iothread-lock.c |  2 +-
>   stubs/iothread.c      |  8 --------
>   stubs/meson.build     |  1 -
>   tests/unit/iothread.c |  9 +--------
>   util/async.c          | 20 ++++++++++++++++++++
>   util/main-loop.c      |  1 +
>   8 files changed, 28 insertions(+), 27 deletions(-)
>   delete mode 100644 stubs/iothread.c
> 
> diff --git a/include/block/aio.h b/include/block/aio.h
> index 5f342267d5..10fcae1515 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -691,10 +691,13 @@ void aio_co_enter(AioContext *ctx, struct Coroutine *co);
>    * Return the AioContext whose event loop runs in the current thread.
>    *
>    * If called from an IOThread this will be the IOThread's AioContext.  If
> - * called from another thread it will be the main loop AioContext.
> + * called from the main thread or with the "big QEMU lock" taken it
> + * will be the main loop AioContext.

worth add: In other cases return NULL ?


-- 
Best regards,
Vladimir

