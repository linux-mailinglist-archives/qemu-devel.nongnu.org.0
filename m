Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227AA39C911
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 16:34:03 +0200 (CEST)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpXNC-0005IQ-5G
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 10:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpXLz-0004Vh-UY; Sat, 05 Jun 2021 10:32:47 -0400
Received: from mail-am6eur05on2115.outbound.protection.outlook.com
 ([40.107.22.115]:26176 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpXLx-0007BF-PE; Sat, 05 Jun 2021 10:32:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJVUmoDSi7vBZvPAbSeX0Ka86DfxlQSYVDSjr6bkuuHRIQzdQLGDxJM6kmx2VQENJQq18sMgRrU8o+bdaIEOEUuwHsF0DcD6bD41aqlpmKUPcyg4l6M4EaL0BMH7I8STd2LpJhZhH36cRhX+Tsk6EvLsm/Qo1jQAuRtD8Sj2xfnY/TYHAaoPktTYeHEqlPtwkFXl7xEKacJ9r/TARueyW7WoT4qvYFRKilEVI5wIqrlhp+ELRC9Mif01omrHJV8ePAhYUZ6dawy98ayqvs77huJVg9d4Pog0WM++mLuN5OrlK4GcWQ/socTePDbFk4v4kCf+NLLJHQ7PE79SPqgYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOneRUFVtyKLMqeFdMk8orzk0oknBPgoGzSx0wN1Huk=;
 b=AlVr1Ti8SMBd5omZjFE8kQ6zAc+H5bPyAILqAfAF9H7j3VmHsv05yeA/5JnNv+HFf88QdIDopXJD65YjpQbuNkckIXISGfAftSpq/m12gTrBzMFbfvz7Zhj6IrrE1Wc2V1SKysKFImtnSeulLasfgzTsWmOs/mQr2SmNfrGThPCBXnpHoe6dWHCl1ljQq8nQ1kY5MEevNjeepWyRW3MkrdVtdre2F5DehRk8zDDIh5XPP3fnDbWfBLSMYcI+3LDNeb+ySpqkxQc5xbNms7X0mfCUkjC33kWtWxlLp9RT57y692xvHhR6k6endLtVeRqXreCDgTmhdJkxsGzJPTxzZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOneRUFVtyKLMqeFdMk8orzk0oknBPgoGzSx0wN1Huk=;
 b=OmXbzYqnehjfQznw6ZzEHz5EU9unLA8c68fCIkvPDShWXEvjZP0gQSWk9O6MAXtUU8/BSZ7qUqh6tntCFEhCAgvYuQsAj5WplnaGVqTiEBGFCV5ebMbY8sOK+1WC1O64GqzLMrgIgFNOypk7EeF+/r5fm1YPXPimwLEXx16TKLU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5382.eurprd08.prod.outlook.com (2603:10a6:20b:108::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Sat, 5 Jun
 2021 14:32:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 14:32:41 +0000
Subject: Re: [PATCH v4 5/6] block/blkdebug: remove new_state field and instead
 use a local variable
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
References: <20210604100741.18966-1-eesposit@redhat.com>
 <20210604100741.18966-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1edff381-7e11-c92d-26b4-d62f88fe2fd3@virtuozzo.com>
Date: Sat, 5 Jun 2021 17:32:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210604100741.18966-6-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.208]
X-ClientProxiedBy: AM8P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.208) by
 AM8P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Sat, 5 Jun 2021 14:32:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0af3600-ec21-45c5-3f25-08d9282ec628
X-MS-TrafficTypeDiagnostic: AM7PR08MB5382:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5382492F1E00006E065CDAD7C13A9@AM7PR08MB5382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:277;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iE/YjzJcOut8nAvmrOS2/dpjLA5OWMFG5A+unHpzGXwSLmtKuyX/ci0SohnR02wq67ibchLAdjs6Is6qw4LCs31KVxgwYOFXntC98802TpF3ec4fQhU1BCV6DzwRmNcMpGF/ghBvLhSE/X6YRHISqERb3phGXZLta1ZAZ91E44KnI95WTUDrAvmvr4LXcBhqrG/8xNlVqXPepC6KE6UL6pVgr/PzPTlsBeTRjdMzfRFF8HWn4a1ms7lwVs1EsAriQCnVzvukssbd+kzo+uj+CrnhpvLEVbv1paw5sX5AE6D4SZ5bkwNQLnYUaFiCaD/YTsqJO23a5dqELRZWeFm+ZQgqnlvCpPf7si7g+T+0Vh/hYOgQ5HIGG6/0XbvZKeBRVVX/5/eiXURphZK4PogFd+TEAmQbmoIxH8Go8m8jUOCyMeHlpIOvjvt7R0yETRxN5Y3xZZUckou2nwNVo9HQqe0VtQXGzVC4zIUXhOOGkacF6CSY3e7Kf8/boIag/mdvhxS+wfd/WV6bVKn74nUTlM/dSvuKEYDDakS9rJ6+qLsLah22hgqHgDb8tdrszRHoLbmDEoDD0+UlS/msRe0VCS8jT7Xw0/v+ezx7aNwu7o0bgWc8DImjPwCg5BU6oLAbb+e5oM4DuXwL1eSAOBocjwrNySazfT7qFg5PCuhLdrW8hJTASd9zA81hydaipUedsh/Vwl+5Rt/GqJFuTi1+P5PqQuAuvcpHYhO3mphcn6w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39840400004)(66476007)(66946007)(66556008)(31686004)(956004)(86362001)(8676002)(2616005)(16526019)(186003)(54906003)(16576012)(316002)(26005)(8936002)(6486002)(31696002)(478600001)(4326008)(52116002)(38350700002)(83380400001)(5660300002)(36756003)(38100700002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VlN1WjZzdTh6U3J1RmZtbi91cy9zRzhpUlRaWUhlMlp4eDNqci83Z0M0dElx?=
 =?utf-8?B?aTZrRitMTkh0L2NaTytzRFd6b3QyZU0rSzVVL24rT1BHY0grVkpOcE02a0l3?=
 =?utf-8?B?ZUdtUStFc2hUSDRmZ0QwY0Z2bFlMVlU1eURWZmRIUVhlR1pVM0lUTGNQUjZ6?=
 =?utf-8?B?NUlGZlNxSzU2eWxVZGZGOGlxU2hMa0MvU3Jma3hpMjIxa3pRVzFQb2RRSG9l?=
 =?utf-8?B?REJyckNCZ0l0cFdyUVl6Rk42RFZOaVgwWEE5M2ZKd2Q0RFBYUXZoSmV1WHBB?=
 =?utf-8?B?VThuaXVlUDQ0SDEzbk1vQU0raVg4bDFLYk1uT3dLMkpDWWY3NTNRSS9YQ1lo?=
 =?utf-8?B?bU5pcFFVOFZHNWVVcGdqU28yQzNEVTNDanlkS3RpMUF3UUNuUlJQRG9WUE5Z?=
 =?utf-8?B?SlZDSmFKQ2JYUGVvK1YzdkxoMXE2TTlnRURtdFRBZjVGWk9uVWswTlRMY3pj?=
 =?utf-8?B?VGlMbEdNNU5PdU9WTWFydXNqaXpYM2pBZlorWFdFeHh4aHlFaFZZUDVRMTVv?=
 =?utf-8?B?ejF3bEdIdVR1WWdtTTlwQmpsZHlPM1ZNM2tCK1hMTlN5Z0RKOWREQThLcnIw?=
 =?utf-8?B?MkJ1MTA0LzJtaVFLUWRNNmV2Tm82aGt3eHN1VlgzanlNRGFvdllLQmRDdDhJ?=
 =?utf-8?B?UEpjS3FFVjdLWFhkVFBDeGgyRHJWd1NubnIydmhSaVdBM21PRGI1d1VsaXp1?=
 =?utf-8?B?R1lVM0o5azNaN3pOc1dtSEgwenIyS0lpaXRiaEYzWkRhUE5oai9yQ256MlA2?=
 =?utf-8?B?Um5mQjVhNEVXTXFpL2ZDUHZ0V0FocHB0VHA1VXFUNkMrVW1wQnRpRy9tWXl3?=
 =?utf-8?B?NXdKeTJ3UFp6WGJSeVBkV3BoL2xIak5mWTNxTjBlNlZySzJxejZ5Y25kaEth?=
 =?utf-8?B?L0NmY1FvaWJydVdTZm1veFRyc21wSWRTaWhwTjEwM0lFd0FpSTB0eHJUY3hv?=
 =?utf-8?B?Z3FSZUtxaHZ4M1pRNnJiWFFhZHUwOFY5ZWhYcmp6b3N5NGQzUTlVWXBQK0RN?=
 =?utf-8?B?TzU4WDJnMGZZWE5SNnN4SjJnS2lja0E2RVZmWDBjNGRGZTFOT1ZGRVBQNWs5?=
 =?utf-8?B?bGw5djB5dHdMMnYrVEZYQ1lIMWZmc01BaGNnUWIrOEdyY09iZ2ErVkFKMnNW?=
 =?utf-8?B?NjRMNjRESGdKa2xYUEdpYVlvalV5NlJZYTZwNkhhTXViVHJqRUxSWTY0dnN3?=
 =?utf-8?B?YWwxaDZ6dVQ5d04zN2VBWU9Hd2k5WGhZZU1TWGZjRXVpckxPVEpCeTdJNE1Z?=
 =?utf-8?B?eWJQZXY4T1BsUFlIcTRHN1FHbkIvMWJleUgxWVJqaXVKZHlDdTExL0dvUWtu?=
 =?utf-8?B?Y05PTTBHOEZ6WG40Q21SaVd1Y3RtUWkwS0ZEQ285NEZKWXJzRkV6Z2NPeWs0?=
 =?utf-8?B?L2htcnBCUG1memQvV3dXUDYxVzNxcFZDbU9XMXMrWnVncW1MZkNlTmlRQTJp?=
 =?utf-8?B?OUx1VFdmWHlyVjNHNkNEMFBzajM3RHlUV0paWGQrTzd4NS9GZ0Jaei9UNkhG?=
 =?utf-8?B?dUx6NjV2Q0pBNG1Sc1dvU1UreXJ3L0QraVNuV1I4b1loQ3RCRExsd2ZoRm5q?=
 =?utf-8?B?L1RoQTQ4aERVaWhYaXNUdWU0VzNQMjdwTitBRDluMnRrMWtJUHkyOHdBYVZx?=
 =?utf-8?B?NCs5NVk2Q2dkY1ZUN2NEcDk0VWR1N0tsSjRGa2lMTjgvODljUmtobWROYXJv?=
 =?utf-8?B?TS96ZXR0V2g5STh2ZnYvdzNJMFA3ZHZ1a1M5bUJreXFUZTllZUh1cHo3U2Nv?=
 =?utf-8?Q?HkjHFbyQJ+flgDxGKWbJgg+zzOfNYu5ZABfY4kJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0af3600-ec21-45c5-3f25-08d9282ec628
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 14:32:40.9869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/5fGtXTcqkin3wbnpLUEzyalWyVwNUS9NBSNNl0hXT1Q7ml8dAyAHyP4LhNX+/VNvCFx172SUlDMJkDTbN/N/kRLxRUGL/eBlCp8D70CRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5382
Received-SPF: pass client-ip=40.107.22.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7,
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

04.06.2021 13:07, Emanuele Giuseppe Esposito wrote:
> There seems to be no benefit in using a field. Replace it with a local
> variable.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/blkdebug.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index dffd869b32..d597753139 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -40,7 +40,6 @@
>   
>   typedef struct BDRVBlkdebugState {
>       int state;
> -    int new_state;
>       uint64_t align;
>       uint64_t max_transfer;
>       uint64_t opt_write_zero;
> @@ -792,7 +791,7 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
>   }
>   
>   static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
> -                         int *action_count)
> +                         int *action_count, int *new_state)
>   {
>       BDRVBlkdebugState *s = bs->opaque;
>   
> @@ -812,7 +811,8 @@ static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
>           break;
>   
>       case ACTION_SET_STATE:
> -        s->new_state = rule->options.set_state.new_state;
> +        assert(new_state != NULL);

you don't need additional assertion: crash on dereferencing NULL pointer is not less clear

anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> +        *new_state = rule->options.set_state.new_state;
>           break;
>   
>       case ACTION_SUSPEND:
> @@ -825,13 +825,14 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>   {
>       BDRVBlkdebugState *s = bs->opaque;
>       struct BlkdebugRule *rule, *next;
> +    int new_state;
>       int actions_count[ACTION__MAX] = { 0 };
>   
>       assert((int)event >= 0 && event < BLKDBG__MAX);
>   
> -    s->new_state = s->state;
> +    new_state = s->state;
>       QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
> -        process_rule(bs, rule, actions_count);
> +        process_rule(bs, rule, actions_count, &new_state);
>       }
>   
>       while (actions_count[ACTION_SUSPEND] > 0) {
> @@ -839,7 +840,7 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>           actions_count[ACTION_SUSPEND]--;
>       }
>   
> -    s->state = s->new_state;
> +    s->state = new_state;
>   }
>   
>   static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
> 


-- 
Best regards,
Vladimir

