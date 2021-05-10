Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82963782D5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:39:59 +0200 (CEST)
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg3KR-00028g-0y
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3JQ-0001S2-Qh
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:38:56 -0400
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:12833 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3JN-0006Dp-Er
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:38:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBQje82lduoIB+6yklnJ0pJOxeoaePVYj2lSZ1Ocv70DsYibvOg9PMDs04vnd2vaco71wPkp9jF6+KOj/xAdZ0AXOUJ7uRDYGccgMgZ/RE4XOOYs80W2222iei8yMP+AoVgiNrj2bgcBqBHTZ0S56l+j2a+bMbg/HlOpI7WxzYwZgvFoMTOyQG7hDNavTvTC9d7aOmq4FMFnTMTQB0Y0vrPjBCWWivHraAQGckwnAFREJvjGlAgnm0luB99zEwVAWA48uN+TduvW1s079/zgEMIAzPZd9/8iDNpv8HZZ3ABFXcw7xGGEzF8S7KTa0FbDhlokLYox3TLyHtmsVgpufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkxue1pK96lnDO5nDEdLuzVhiThiNl9v9GDzgl3n2Qo=;
 b=FB0oA0G11pxdW/krTiLHFLPO95KhyMiQnCI0+07+sF0qsFAYCLaBeyFhejZ2UEWl0kMe5DH2iIZkDAUMyqRCfd+c4OWjqVVtftxNJOaEg7YN/rZLai4xRH4nkZ18NT622Pvd0oAc9ymfBZ1tcBkKUK0BlWfXrYHvS0SdMa657KGrZuG4nyeX54Tx8MGAb+wpYV4KjAyutBcWpbP1SCSBjAuz+Xf/J06YXdSUEtNDYmqhXJfQOcLf3DMD8y9qmdagtr3ngozBRu7Q48mZFmKwV5EBEAB6lMIJqwgC7WEAhXPtyy0N5Fuu3HYJ+Q8616zWaMJ40ciUHkqomWQUDo4MnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkxue1pK96lnDO5nDEdLuzVhiThiNl9v9GDzgl3n2Qo=;
 b=MIiEGf+hm9zAT9WZY6ji0wy5VVDh+sYzNKHvA4wEhJNI6Gvzx6wV+uRNBMOTnrNfNuqeWas6Z/Mupt8ptGlDFc0L/TaYlNU/P0zTg3e+7V9cPxEV66LbOp/VqovcT9Y1qEC1mkYBfk+4i6yCddCJk5AL+PtVK8z6Ql1YXHRRkzI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7010.eurprd08.prod.outlook.com (2603:10a6:20b:34d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 10:38:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 10:38:49 +0000
Subject: Re: [PATCH 5/6] coroutine-sleep: replace QemuCoSleepState pointer
 with struct in the API
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com
References: <20210503112550.478521-1-pbonzini@redhat.com>
 <20210503112550.478521-6-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1ae98c0d-edbb-e7a9-c04a-837ecddfe7fe@virtuozzo.com>
Date: Mon, 10 May 2021 13:38:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210503112550.478521-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM0PR02CA0153.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM0PR02CA0153.eurprd02.prod.outlook.com (2603:10a6:20b:28d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Mon, 10 May 2021 10:38:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19e82265-aad7-4a4c-722d-08d9139fcbf2
X-MS-TrafficTypeDiagnostic: AS8PR08MB7010:
X-Microsoft-Antispam-PRVS: <AS8PR08MB7010417FDF5B005A836ABA2FC1549@AS8PR08MB7010.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UOMAqUbUZopVweeopfcNyIs6G34Txja3pWRFoCxzYOJuxMZIuA3hqtkM94EmXQQ9V9mM12uHjL3MqV8XzudNZYOOvwBF6wO5HUe0+XccQJLSyW7Bq9QhCn4RRfSqtkVDt530awjnWzfW3Tpi7TYGW47j0MFbldZH2D16VKcHfJg85WJ/R6J+pWSmhi29qlB+wuUyXDTgFz9gziMeXh/mayeE83YgWGYixTdePVrgN/06owOanAnqE6ByyMfHrp8+qRJcmRigIKzm51UD4/S1prvfLamtMC93vf8WuLFPUJeIHf9DORJSfAOtK6UcuRSmclJWEttbdCH3yznHeVC7jGcDnCJU3wZekItVLpv3nLhC4PaM+Xuv0Dn4js3era3h5Vb/pWnBjuHoCW1t8IMWHzxpRELEFZOF4bwwbZv/bSuefYkKkzs6hlBSBDT6/5bo9+W2kQJi13iuYOtxHb0Oa24bkajJTvHnfqnlEsSz84NbmYQSKdEGSuxt+6Mc5/26cWBgYW2cfuJciWaG/AjQMAWlk6nZDhTbtMfzTGsfHKIg1tZk7jcj3q2h+aqCRTIXYbv3Er7O4wGoT9jFZ8vUukfrnO/scCtxrZaSDJeatgQQIDD8HE3gIBkpC5PVNe0mKpuf0KbWWxCuFmMhRdDVHofp/7ks6TmNK11ctdv3N29UxbuOtHtD40XgQpMSxHOUAVQzygPf9TwJt/FVsC9MQRtr3quQnw5e2Bn8xNbGxXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(39840400004)(396003)(366004)(136003)(346002)(376002)(86362001)(38350700002)(38100700002)(52116002)(5660300002)(31686004)(6486002)(8676002)(36756003)(478600001)(31696002)(8936002)(2906002)(26005)(4326008)(956004)(2616005)(66476007)(66556008)(66946007)(16576012)(186003)(16526019)(83380400001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVVwMVpYcGwzWnJkM2tkekRoSjAxR1dWZkNGbXhwZ1FUNmdzeEE3aXhoWDRj?=
 =?utf-8?B?OWtyM09uS1FQdVhWTVJHSGtrbEZtVWV0UWI4d0lzcjFPbFRsK3o1bUlHZ0FH?=
 =?utf-8?B?d2xlNXVKL0JINXpxN1VZc0xkMkhZamNuYXdEVjdvbnovR2s0bmJpczc0cWhi?=
 =?utf-8?B?d3FDcDFIbEdQcHhndStGbm1NSzQrbUk4ODl1NWtzelNoUGxjdWlQNm8zdzIz?=
 =?utf-8?B?cDR1KzRSQ0loQWpiRjhXQ205dm02ajI4QXZwZkpvRkZRZmRIYWpWOXB1N0Fy?=
 =?utf-8?B?c1gzODVNS2l4ekFudmVxcVl2Qk9WZ253R1U4WWtqWGdnZVZFYWxodkVYN3BR?=
 =?utf-8?B?NkZBeTFtOE5ZSzhFTjNINGkzOWhLQUc0TmU2MnFiVzVxUjQxanVjRjZzUHpp?=
 =?utf-8?B?ZXlKY200ZTRjNHhVR1Q3R1lJeXBTelowc2grMXBQdnZyV29QV0ttR1ZrTDh2?=
 =?utf-8?B?ME9ZM2dHWHhlVEd5NTl5ci9zNm1wckRnWjNxTU5hd1cyZ09zaHFkbFBxMklN?=
 =?utf-8?B?N3pEOGRVYnU3aXZKd1BIRHE3LzU5cFE4bkpIU1IwS3hVMmZTZGtYN0l2UFhB?=
 =?utf-8?B?QkQwUUNBUkNGdmRHcjNQY1dIaWIzejI4T2ZveGJMbWNnRUNNVFIyWThqdStQ?=
 =?utf-8?B?c2tWcDM2d2J4eGRpVld2OEFOcWQ1STBYUDE5ejVCeDQ3R0ZVWDNENGtkd3Fi?=
 =?utf-8?B?UlVEek1IREJHbDZha2JCa0xMNGMwTUZrMUJEbEJhK2pDVUFQcHl3dU1UeERp?=
 =?utf-8?B?WWpWUlhRWXpySU13OHRYNzRDTUtjOE5leEVWZ0Y4MVk1cW5OTjVWenNHeEFH?=
 =?utf-8?B?Tks5N0pQeXVCcE9sZGZQa3NWM0pSbFE4c0VwRThaOFJDenhSZVVuZ2JpRkcy?=
 =?utf-8?B?Z3E0bWJtVWY4M3lhNmFrSm1MVFhUVEtnMlR0UUpNSm1vWDFiQ3ZLUTN6bkZF?=
 =?utf-8?B?T29oZEZPUDlhU2pyTllOMnVEeFRqV1RCWHgxZnlnRnhmUGsyZElCN1g5RG9j?=
 =?utf-8?B?VGhvMTRsMzY5Z1o4Y3EvcDZtM3l1Wks2WW5uOEx6OHcxV2NuVjhyWG5hZlR5?=
 =?utf-8?B?M01FeThXVG1CdnRjS3V5NG0vei9vdnArUklCVEZyUi9KaGV4b1RKZ3QxcEFP?=
 =?utf-8?B?NjdzMXZKSytaN0VDRHptbDV5bGpYYU1DUGhJOWwvaTRNcy95NE0rUzVKSEJj?=
 =?utf-8?B?U0pJc3RHWkV5N2REZTBManJyaGlzRDFmUGZoWWhlcnVGaEZZSmFMMmY5QjMv?=
 =?utf-8?B?WGROeDJPVGNMRHYrUnBhTG9mc1BMTGtKcE1zWG5aM3FxSENtYmFWWGJ1K0t5?=
 =?utf-8?B?bFNtekJuNUx4dHdmbENHdnFyV3RLYVdrZ2lUaGUvSzltL0h3bUxJN2VXNU9G?=
 =?utf-8?B?TzdZRHpTdVRUZWhEaHIreVRrOFZUemVmU05rcE9YUktGcWVLc1JtSy9wbGNS?=
 =?utf-8?B?QW1rR0lUMGhESzFXMkdISlNmLzBRWWY2cWJTYnNqeXdmRGFJWlgwL0dqcFZx?=
 =?utf-8?B?b3VCc2JMZitLR296WXhrcWwxYnNYQ3poZzJPQTk3R0R3SEtYUFA3Y0czSzhp?=
 =?utf-8?B?REJnKytUZ2VNRWxaWE1UV09JUjhKcitGUGYxeU96RThjeXZTMUd1ZzBvV29t?=
 =?utf-8?B?anZJWHN2VEFucGFkRHBaK0lxYk5FMFpJb2kyMnhzemFKYjdYOGFvT0lUdHBS?=
 =?utf-8?B?MHVTUWFTa3lMWTNMd2N0MzdIVXVaVWo3djFxVXlOcVhuYW5QdlU5MGFYSHBE?=
 =?utf-8?Q?p5hLgfyW5DbUL037iwMqoAO2+DZCPPwWdfsobz0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e82265-aad7-4a4c-722d-08d9139fcbf2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 10:38:49.3949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+LuQlq3qSKUK6s+E6NSwyIF0ENX5rnJntmDj/h22tmbysVrt1mt1DXCi0wKlqYLoZU1FPj7gMp4yZNFs5I6gOp4OyCsFs5+s280F3IlUdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7010
Received-SPF: pass client-ip=40.107.21.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

03.05.2021 14:25, Paolo Bonzini wrote:
> Right now, users of qemu_co_sleep_ns_wakeable are passing
> a pointer to QemuCoSleepState by reference to the function, but
> QemuCoSleepState really is just a Coroutine*.  Making the
> content of the struct public is just as efficient and lets us
> skip the user_state_pointer indirection: the Coroutine* is
> cleared directly, rather than the pointer to it.
> 
> Since the usage is changed, take the occasion to rename the
> struct to QemuCoSleep.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-copy.c          |  8 +++----
>   block/nbd.c                 | 10 ++++-----
>   include/qemu/coroutine.h    | 22 +++++++++----------
>   util/qemu-coroutine-sleep.c | 43 ++++++++++++++++---------------------
>   4 files changed, 39 insertions(+), 44 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index f896dc56f2..c2e5090412 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -50,7 +50,7 @@ typedef struct BlockCopyCallState {
>       /* State */
>       int ret;
>       bool finished;
> -    QemuCoSleepState *sleep_state;
> +    QemuCoSleep sleep;
>       bool cancelled;
>   
>       /* OUT parameters */
> @@ -625,8 +625,8 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
>                   if (ns > 0) {
>                       block_copy_task_end(task, -EAGAIN);
>                       g_free(task);
> -                    qemu_co_sleep_ns_wakeable(QEMU_CLOCK_REALTIME, ns,
> -                                              &call_state->sleep_state);
> +                    qemu_co_sleep_ns_wakeable(&call_state->sleep,
> +                                              QEMU_CLOCK_REALTIME, ns);
>                       continue;
>                   }
>               }
> @@ -674,7 +674,7 @@ out:
>   
>   void block_copy_kick(BlockCopyCallState *call_state)
>   {
> -    qemu_co_sleep_wake(call_state->sleep_state);
> +    qemu_co_sleep_wake(&call_state->sleep);
>   }
>   
>   /*
> diff --git a/block/nbd.c b/block/nbd.c
> index 1c6315b168..616f9ae6c4 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -116,7 +116,7 @@ typedef struct BDRVNBDState {
>       CoQueue free_sema;
>       Coroutine *connection_co;
>       Coroutine *teardown_co;
> -    QemuCoSleepState *connection_co_sleep_ns_state;
> +    QemuCoSleep reconnect_sleep;
>       bool drained;
>       bool wait_drained_end;
>       int in_flight;
> @@ -289,7 +289,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>   
>       s->drained = true;
> -    qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
> +    qemu_co_sleep_wake(&s->reconnect_sleep);
>   
>       nbd_co_establish_connection_cancel(bs, false);
>   
> @@ -328,7 +328,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>   
>       s->state = NBD_CLIENT_QUIT;
>       if (s->connection_co) {
> -        qemu_co_sleep_wake(s->connection_co_sleep_ns_state);
> +        qemu_co_sleep_wake(&s->reconnect_sleep);
>           nbd_co_establish_connection_cancel(bs, true);
>       }
>       if (qemu_in_coroutine()) {
> @@ -685,8 +685,8 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
>               }
>               bdrv_inc_in_flight(s->bs);
>           } else {
> -            qemu_co_sleep_ns_wakeable(QEMU_CLOCK_REALTIME, timeout,
> -                                      &s->connection_co_sleep_ns_state);
> +            qemu_co_sleep_ns_wakeable(&s->reconnect_sleep,
> +                                      QEMU_CLOCK_REALTIME, timeout);
>               if (s->drained) {
>                   continue;
>               }
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index c5d7742989..77cb8ce459 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -291,21 +291,21 @@ void qemu_co_rwlock_wrlock(CoRwlock *lock);
>    */
>   void qemu_co_rwlock_unlock(CoRwlock *lock);
>   
> -typedef struct QemuCoSleepState QemuCoSleepState;
> +typedef struct QemuCoSleep {
> +    Coroutine *to_wake;
> +} QemuCoSleep;
>   
>   /**
> - * Yield the coroutine for a given duration. During this yield, @sleep_state
> - * is set to an opaque pointer, which may be used for
> - * qemu_co_sleep_wake(). Be careful, the pointer is set back to zero when the
> - * timer fires. Don't save the obtained value to other variables and don't call
> - * qemu_co_sleep_wake from another aio context.
> + * Yield the coroutine for a given duration. During this yield, @w
> + * can be used with qemu_co_sleep_wake() to terminate the sleep.

I'd add that function initializes @w.

>    */
> -void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
> -                                            QemuCoSleepState **sleep_state);
> +void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
> +                                            QEMUClockType type, int64_t ns);
> +
>   static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
>   {
> -    QemuCoSleepState *unused = NULL;
> -    qemu_co_sleep_ns_wakeable(type, ns, &unused);
> +    QemuCoSleep w = { 0 };
> +    qemu_co_sleep_ns_wakeable(&w, type, ns);
>   }
>   
>   /**
> @@ -314,7 +314,7 @@ static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
>    * qemu_co_sleep_ns() and should be checked to be non-NULL before calling
>    * qemu_co_sleep_wake().
>    */
> -void qemu_co_sleep_wake(QemuCoSleepState *sleep_state);
> +void qemu_co_sleep_wake(QemuCoSleep *w);
>   
>   /**
>    * Yield until a file descriptor becomes readable
> diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
> index 68e9505b2e..89c3b758c5 100644
> --- a/util/qemu-coroutine-sleep.c
> +++ b/util/qemu-coroutine-sleep.c
> @@ -19,42 +19,37 @@
>   
>   static const char *qemu_co_sleep_ns__scheduled = "qemu_co_sleep_ns";
>   
> -struct QemuCoSleepState {
> +void qemu_co_sleep_wake(QemuCoSleep *w)
> +{
>       Coroutine *co;
> -    QemuCoSleepState **user_state_pointer;
> -};
>   
> -void qemu_co_sleep_wake(QemuCoSleepState *sleep_state)
> -{
> -    if (sleep_state) {
> +    co = w->to_wake;
> +    w->to_wake = NULL;

Don't you like g_steal_pointer()?

> +    if (co) {
>           /* Write of schedule protected by barrier write in aio_co_schedule */
> -        const char *scheduled = qatomic_cmpxchg(&sleep_state->co->scheduled,
> -                                               qemu_co_sleep_ns__scheduled, NULL);
> +        const char *scheduled = qatomic_cmpxchg(&co->scheduled,
> +                                                qemu_co_sleep_ns__scheduled, NULL);

indentation fixed, but not over-80 line )

>   
>           assert(scheduled == qemu_co_sleep_ns__scheduled);
> -        *sleep_state->user_state_pointer = NULL;
> -        aio_co_wake(sleep_state->co);
> +        aio_co_wake(co);
>       }
>   }
>   
>   static void co_sleep_cb(void *opaque)
>   {
> -    QemuCoSleepState **sleep_state = opaque;
> -    qemu_co_sleep_wake(*sleep_state);
> +    QemuCoSleep *w = opaque;
> +    qemu_co_sleep_wake(w);
>   }
>   
> -void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
> -                                            QemuCoSleepState **sleep_state)
> +void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
> +                                            QEMUClockType type, int64_t ns)
>   {
> +    Coroutine *co = qemu_coroutine_self();
>       AioContext *ctx = qemu_get_current_aio_context();
>       QEMUTimer ts;
> -    QemuCoSleepState state = {
> -        .co = qemu_coroutine_self(),
> -        .user_state_pointer = sleep_state,
> -    };
>   
> -    const char *scheduled = qatomic_cmpxchg(&state.co->scheduled, NULL,
> -                                           qemu_co_sleep_ns__scheduled);
> +    const char *scheduled = qatomic_cmpxchg(&co->scheduled, NULL,
> +                                            qemu_co_sleep_ns__scheduled);

indentation fixed..

>       if (scheduled) {
>           fprintf(stderr,
>                   "%s: Co-routine was already scheduled in '%s'\n",
> @@ -62,12 +57,12 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
>           abort();
>       }
>   
> -    aio_timer_init(ctx, &ts, type, SCALE_NS, co_sleep_cb, sleep_state);
> -    *sleep_state = &state;
> +    w->to_wake = co;
> +    aio_timer_init(ctx, &ts, type, SCALE_NS, co_sleep_cb, w),
>       timer_mod(&ts, qemu_clock_get_ns(type) + ns);
>       qemu_coroutine_yield();
>       timer_del(&ts);
>   
> -    /* qemu_co_sleep_wake clears *sleep_state before resuming this coroutine.  */
> -    assert(*sleep_state == NULL);
> +    /* w->to_wake is cleared before resuming this coroutine.  */
> +    assert(w->to_wake == NULL);
>   }
> 

with indentations and over-80 line fixed in appropriate previous patch:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

