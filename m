Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286753780E2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:10:33 +0200 (CEST)
Received: from localhost ([::1]:56986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2rm-0007pJ-2f
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2lR-0003xy-RV
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:03:50 -0400
Received: from mail-vi1eur05on2117.outbound.protection.outlook.com
 ([40.107.21.117]:5409 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2lM-0002Eo-2j
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:03:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZqbv97mk8IJ48xURLAn9WJakM+d7+/YQf97AG2seep8v+gDR7CTE7RH5cvJpOeHbhh8mJvAZ678r3doRCdp7/8wJlKQBHZ5qo1yF3S3d+PczCF+MT2reixbhP65bXV96DxuxNUpUP+ipoZJm263OGpwZ9BVNqyHuNY8nz5Y+y/hsv1++LwutLwOszj8sT6nX165IhjmjrI6BuEB8BVvQYjgYfkTy3hedzP8Dl5T9bjaolwEi+yI05E/P9fnr7oYM37uqEz89I/4Yt+UC6Uv5CT91yBUjK4St5VZCX/WI3YrvDJE69bN9ciBCOH7DuV06fZFFToqPGIq/nKQSjL1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fj7b/wO30KzCWU5+6x/LUrDdcySEoyanUTvcJt7fxA=;
 b=Rhh308XL4dPYMfp1dOCp/WJHo5xO3z7efy/bXATj+SVAh9LNvlgoG3AaUlhg0x0kM3tEarS8ZIEvo6H5qIKOIYu5nZmNMiCQcUzcBsnOBgBASIQLMscwDHlqCR07INYueQ8eVulzIKD56v7u2iRkx1cweG0mXTjBAGr+w5O606vC5Uxo8qIEUlbwGADKNIHKIwjFHMLrQnzFQaJSYIU/mnCdhzW8RprTR+iagVpQD41ZDbTSPm+Dxvn47VkQezGGE5YilsQ6fLwjsG2Wad+DFXDIOI3VdUcuHVHhTVFDIkCuWPveqR4aNmoHr8x68V3zVdL51CrSNfNI672213FZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fj7b/wO30KzCWU5+6x/LUrDdcySEoyanUTvcJt7fxA=;
 b=sKJD1FOTLIK35PLqwZJQpwnNFxvxuzq/Nz/Mf+H10+76yoczq/DI+PTNnjAUQ9RLcNuRzsLXlcnf9bwD3ThT4j4bGkzLEUnqLQ0V1IDEEx2OYP9RwU+hCe7mYmZGojJrEm8gMpmKCxlxQoNSB3joKyB0oVHcyxnmvP4qtdSKssc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Mon, 10 May
 2021 10:03:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 10:03:41 +0000
Subject: Re: [PATCH 2/6] coroutine-sleep: disallow NULL QemuCoSleepState**
 argument
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com
References: <20210503112550.478521-1-pbonzini@redhat.com>
 <20210503112550.478521-3-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <77a5fe42-bb33-8e55-6030-962bad1b9c73@virtuozzo.com>
Date: Mon, 10 May 2021 13:03:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210503112550.478521-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.20 via Frontend Transport; Mon, 10 May 2021 10:03:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9221ee88-5259-41e3-1f6b-08d9139ae361
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2034AC64F3C7AFCD7CC2B13FC1549@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHO2GHg94sIbyH9re+MWNMVMP6BQk3X9gmpAUC0bvdDkTq8IjcqWEuTzdIDpb1QQgAc5MEOlgJAwxo4/Fp1FDJ+UekIAY4qGdjfO9Idc0qazxGC4g1sx+806nSzCPHdXa38M+kroNDC/MHRouLbcTKy4k6qjx2wt0E4Begt2z1yRQBkrujvtv6Ckngw9Cm5WTDRqPyVho+TuxkKhBp8dh4j3DoSHBqqOU20Hq5uJwyS7GDvG+704TauUpjTvZc784xXhBn2BO7XAu4ZGN9FMFzmYsmA0/ujn0nxc3HhKGrtcqDOn7NoHU+rG01Em4KVMRbOMRcnC2I2WDWTC2FvyjEdEJ9dpNqQBLYSfVWSkHdk8dVVxTWBZDsZ/1Sl+1ZfXm50+snK+v254SggSF6mhPq6P3FdV9ownxsPuSEbE6kuQ1098dMN56VaZW0Qd5m1zblCKmjGt6M6ugbMCuG/Tusr1gxc6NUxQFxNDZ49E7On+WGKI261hosZSEeLse48lGH31TedJYrUv9dUcDPrDXYwQ0VfLY0YfcGiNVZte1b0n7NSNLia0w31fupmyAJHbwIYIdKkq3IT7Qzfy7POaBdx+50gslno3hPaJPI1Av3l0NiPebgHZSVchorb/NHGlTs6bmELQkjFCCuzs3SLYExa5TPpjVSbJ1qMyaQOmwJ6XXShzFk9WXKi8ZXHYTSh1sQtZkCWi6BNA0TtJsjgDmuZrgCSiqiwJuheehPZ7iFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(346002)(39840400004)(366004)(136003)(376002)(396003)(38350700002)(316002)(38100700002)(6486002)(2616005)(16576012)(4326008)(186003)(16526019)(2906002)(31686004)(8936002)(36756003)(86362001)(66476007)(31696002)(26005)(8676002)(52116002)(66946007)(478600001)(956004)(83380400001)(66556008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VURIU3dSNW13dTBTZkYvZUNkZ1F1em9hYzhOWDduUkJjeEkzeUd2LzVSNWRj?=
 =?utf-8?B?bXRYVUxUaDNVcDVKUHUzVnFicGRpUGRiWGFPN3k2Z1RaZlhteXNXS29PNzRJ?=
 =?utf-8?B?Q2JJMFlRVUNiSHd4ZlFQM2FzbU9JdUl4TTFwMUREVlN4NTJXMElrV3NwamNK?=
 =?utf-8?B?cnFiWFhGd0g1VzdDVnFFRFpxSk1uQVlwdE5vVUFRK2hiZjUzcmRkY1ZYTlpH?=
 =?utf-8?B?Q2dzMlJ0ZjZmWmwrNVVkbU1uZURtbXp2cGxBYjlYeHhDRG10bFhvbHRJdjFq?=
 =?utf-8?B?R2dxK1dheld6R3BFMC9uL1ZyUXlydkl6dDVhOXp0YWVucnpEZ3BndlFQQVNj?=
 =?utf-8?B?dXlaQklOdHQ5RS8xbFRkS2FzWVo1dEtLVDJiQm5tM1RWbWx6QlZxNWZHb2ll?=
 =?utf-8?B?bTNNN2NWdFc5S1hOcUQvTjhDTWgyZmVyMmI3TWk0cm5xZG5iOFQ1QTBpUXlY?=
 =?utf-8?B?Y1dkbnFUK25QMHd5NDh4dDNOaTdibU51NEppV3NSdnlOT0ZjdmN1YUx2TnJ0?=
 =?utf-8?B?bERCRm1iTTVLNEdaaVZhcUh2RUpjekQycmlQVG5lT3Q0a2hLR1FlZUVQdzNr?=
 =?utf-8?B?c1dRNzZaRUI2aTBjbnU5QkNKYVVqcGdqNnJMSkFITGp2MW8ySDJBU2pycEk0?=
 =?utf-8?B?cXNsWFkvZUZucFkzb3pSL2Z2MVJzQzdaNXNCZXZ4Y2lhaDc5MGp3V2FpWFVu?=
 =?utf-8?B?cFBPKzBkL0ppZ2RRL1RZODR4d3kwYURsUUJoOHg1eEt2UHNtcGdjMGhyeTJS?=
 =?utf-8?B?dWxsSEZUaVBCaVFlZk5wNkVjdWkvb3hPc1BhUnJTdW9zUXhXbExWeWhuWlNM?=
 =?utf-8?B?NjJPSkpKVkhzK2k2T2l0SUpRRkdUUmpqU0RUYmhTT3RVcEFoR3gwYzdzWEZq?=
 =?utf-8?B?M3RzSFkvYzVTZTJBbGE2blV5Q3BLVElxd1BPQ0Z1dGpmSmNwaVFXV0VDTjU4?=
 =?utf-8?B?NVk0MVVSSEdQWWd2dS9YWGNHeSsxdjVQSGUzek9yY0sxMURlQm1HY21sbWpX?=
 =?utf-8?B?V3VzNmN4RWxINXZPeXRxblNTQ0d4TVE5NlZrSTY1cERuTnBVek1JMm1vK0k2?=
 =?utf-8?B?M3pnbW9UOVRTc0UrZzZZZXc3Sm9idURFc3ZNekNmcjk4cGlVRUQ3bG4vYVE2?=
 =?utf-8?B?UEJVMHVMMzNLOXdCbXJaaUo5UWFoUXB2NXFsNHZ0dDhsUUZubUVsMTVVREZD?=
 =?utf-8?B?T1hweS8ydzcxeFQ4MnRMQk10UDF3UzBiSENEdVgxSjlyNUdXMUh2ZVFVWGNM?=
 =?utf-8?B?RnpmN2U3TlZIT0swVHdzQm1ta3dzSjJLRGNDME51V1Nrbms5TS9xYSt3VHQ2?=
 =?utf-8?B?dEFNVlp2YTNhWEFYalB0aVlteDYrQkZ0azdqLzZuZVJ2Q2wzQ2R3NEdMcXQ5?=
 =?utf-8?B?MjAyNWkwMlpxYjhtbStCSzJnSUd2Z0xJUE4rdWV0ZUlHblBhYVJTYk9YNUdt?=
 =?utf-8?B?RmlzcEdKcUNnYkNwd0RXQmdnVEVmR1ppWW8zaFI1TzQvWTZUWTc5ZklvTTZq?=
 =?utf-8?B?ZVNPNHVYV0hOR2xRQmp6OU1keEZhVXJDTytSRXdqa3A5Y0krZ2NIWTVDR2JV?=
 =?utf-8?B?VHdiRHNXQ3NoNE9LSnJTR0d2SUJ0S25IMDlOMkxtS2lCb3ExMk9OVlEreWc5?=
 =?utf-8?B?alc5blFtbVZkNGZKbGJIZXFzb1RLUVBqN3p2a0dBRTF2TDkvUGkvMk1zVEdN?=
 =?utf-8?B?L2pSWlVvRFJueHg5NHJKd1BWKzdtQUZsa2s5NmI3K1NmM2NlV0xtbzRFc240?=
 =?utf-8?Q?r7PspmuaTdYIlUQBwAv76AEPlnPlAH1p+9inPug?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9221ee88-5259-41e3-1f6b-08d9139ae361
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 10:03:41.1903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyY/ZZ01Zwhnvw20cMHKSv8GsLdKXiHSnybh9jcPA+lstu05e3TQWPc78kkTwqATkq9kCfPJlaAV+GIiU0uYc+/oaWO/ofZgu63FoIU+Moo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.21.117;
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

03.05.2021 14:25, Paolo Bonzini wrote:
> Simplify the code by removing conditionals.  qemu_co_sleep_ns
> can simply use point the argument to an on-stack temporary.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   include/qemu/coroutine.h    |  5 +++--
>   util/qemu-coroutine-sleep.c | 18 +++++-------------
>   2 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index ce5b9c6851..c5d7742989 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -295,7 +295,7 @@ typedef struct QemuCoSleepState QemuCoSleepState;
>   
>   /**
>    * Yield the coroutine for a given duration. During this yield, @sleep_state
> - * (if not NULL) is set to an opaque pointer, which may be used for
> + * is set to an opaque pointer, which may be used for
>    * qemu_co_sleep_wake(). Be careful, the pointer is set back to zero when the
>    * timer fires. Don't save the obtained value to other variables and don't call
>    * qemu_co_sleep_wake from another aio context.
> @@ -304,7 +304,8 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
>                                               QemuCoSleepState **sleep_state);
>   static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
>   {
> -    qemu_co_sleep_ns_wakeable(type, ns, NULL);
> +    QemuCoSleepState *unused = NULL;
> +    qemu_co_sleep_ns_wakeable(type, ns, &unused);
>   }
>   
>   /**
> diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
> index eec6e81f3f..3f6f637e81 100644
> --- a/util/qemu-coroutine-sleep.c
> +++ b/util/qemu-coroutine-sleep.c
> @@ -32,9 +32,7 @@ void qemu_co_sleep_wake(QemuCoSleepState *sleep_state)
>                                              qemu_co_sleep_ns__scheduled, NULL);
>   
>       assert(scheduled == qemu_co_sleep_ns__scheduled);
> -    if (sleep_state->user_state_pointer) {
> -        *sleep_state->user_state_pointer = NULL;
> -    }
> +    *sleep_state->user_state_pointer = NULL;
>       timer_del(&sleep_state->ts);
>       aio_co_wake(sleep_state->co);
>   }
> @@ -63,16 +61,10 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
>       }
>   
>       aio_timer_init(ctx, &state.ts, type, SCALE_NS, co_sleep_cb, &state);
> -    if (sleep_state) {
> -        *sleep_state = &state;
> -    }
> +    *sleep_state = &state;
>       timer_mod(&state.ts, qemu_clock_get_ns(type) + ns);
>       qemu_coroutine_yield();
> -    if (sleep_state) {
> -        /*
> -         * Note that *sleep_state is cleared during qemu_co_sleep_wake
> -         * before resuming this coroutine.
> -         */
> -        assert(*sleep_state == NULL);
> -    }
> +
> +    /* qemu_co_sleep_wake clears *sleep_state before resuming this coroutine.  */

over-80 line

> +    assert(*sleep_state == NULL);
>   }
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

