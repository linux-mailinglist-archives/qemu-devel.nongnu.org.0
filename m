Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03085484D7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 13:33:44 +0200 (CEST)
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0iKF-0007a0-Uj
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 07:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1o0iGL-0005vq-Hr; Mon, 13 Jun 2022 07:29:41 -0400
Received: from mail-he1eur04on0715.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::715]:43746
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1o0iGG-00010F-5p; Mon, 13 Jun 2022 07:29:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fp5qfIfuCjotIJNEz4oqYJ8fQYkHWFuxNEq5UCL9UQAY9ctbHKs6aovPPIhUZZ2ImCaEH4kxq+0LSN5J+ZbIH9foGkEUWtr3bpz57Ioz/4h/4MK6rT7ZIdIMRdBCNv7S62eLhOzxUurgmYx3vv7HnlutA7vgVSnYsRIJS4uNu9gf0R5ZstPhaG3MV+oFIToKEhucB43K36Oe+wMq2A35WvaWW90D6r4ENaDYwlgnjxplTXMv9GzYytK5Gzj3az1lOZlKbD5ioKQ8QR9r/yj4iEPjU5P8paSIzcVQk7b8xZPflcaDmaEOGZHdCohgYhZq+XPbFJdZ9xW5BsdsU1PqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IjoZiJE7+3DrBGbmRghQmg4ZQgAf3PO5fG4oAydqcU=;
 b=GIO+5KOOALUnpbJUkjeAM2ukeDZ6Alg9HN0Zp4je5Y/ijsemJUKE/w8TS3qBi7QgeqQfUMNNny+OJ4MvX6nTmZT5n1mpzfnJoOEiju3cgCVEpbO/aTHWn1XODi21ECfTw+lKPOc6HUcTmsAp86ykodC+m9ho1agh7B0Ffmm6MAhCeF2zrAkvPDOvX0nyytwIvZN+2kVXrNkk93qBL5mukScTtVMVRh3VKcElzYp2y5pZUYTX7iuFKtXRl0apfEMXGKJf0eXe5fWYXopCf+OkkVZPd9HLEGFBJCoqH84c3jAyEUcghDdOQosN0flyCeM4o+AcchjsVSnYSUFcW+1sYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IjoZiJE7+3DrBGbmRghQmg4ZQgAf3PO5fG4oAydqcU=;
 b=t2LIwvXU3CfUTO+YlGzsalSEJg1XmnbuThZQi2jZAW6ZfVFzvgz6kpM+yxtpjgDsaEsdUDXLr7XhyUhqE7h1RsUwwzw96yjQHQ/sCjkkhmMV1811k142AEI3faqzk8qjjmorzMde8iWSKrfv4/16dBeGaACA34+I0s7WeASQpfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM8PR08MB5665.eurprd08.prod.outlook.com (2603:10a6:20b:1da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 11:29:24 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1%5]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 11:29:24 +0000
Message-ID: <fa26a953-0647-3962-1062-de8967269164@virtuozzo.com>
Date: Mon, 13 Jun 2022 13:29:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/1] nbd: trace long NBD operations
Content-Language: en-US
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220530103929.629328-1-den@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220530103929.629328-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0701CA0056.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::18) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efc3d737-dd59-41b1-b94d-08da4d2ff7ba
X-MS-TrafficTypeDiagnostic: AM8PR08MB5665:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB566511D3D5E6772EBA79660EB6AB9@AM8PR08MB5665.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZIvf9VhcAJKNaGogyhPuytZIVvGvUcODHcNYE8btuxf4dqnQAa0ezC4fIYx7/I9IxM9jRhxE+Hh8us4XuVw7Yv+ept3eXHPLFo+gp8x7RZZCKSVLAb/6Ul1zwvWDywxllLBdTSxIocDVCZ6VAloysnVhrO1p+LL+ulwz/5JpL1+/EY3L3ZYcjzm2Ux6tnQt6XlikLD0SpbbFvG4rGq7nD+p4FSe80FnZ5t2fam/v5aDFZosqTbkytdJmSdPtaUrt0OXqzZ0xRWQx/k9GSUXNIJfsfCYidRar53IUAQaWtqR8GzvUU5Y7I7CDF3VA2VZu8o0s+nOXqNXg7YjQQ9bYXTevvSw8Z9sJRpfKrl0kNaWW1StjlcrX3h0MffLB8vAYPqTU48DkZaGRzHp11jEcykCOhuNl9kkOfAObBySvjoGM/C9q8OlsUfEVEctHJFqkTi65wvTs/1AGvURHu0Wt9vg5w854SiLJMIiAVk+INGjJJbXg2IUpgekIgYJgtpG6r7hx6aaIk55XGsixcQwhMrPwxmR0Qp3chUpGLeuasyYcK7RH9Ee8EGLXX0EyvMMrta0pfQlXQY0sMDhslxcAiL0eFq+brKuSzqVZnuNXliGh3Lw3mt5dQG3oWiWAGR80nHzaFt3k7mGFTSz4QFCCh8K6Ry48rxg8yeL2joliTTpIJkEE1RX1mYGEoqJc5Co7vowzaQ1nwpOEsV6HeigvGL6JEq0w+5ffB/JDFLp5Kgh9UigSfHNREkfQtmHfZSVcjicNuMjx6kQPaEMliJiAMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(8676002)(4326008)(66556008)(66476007)(2906002)(66946007)(83380400001)(508600001)(8936002)(31686004)(6486002)(5660300002)(38100700002)(26005)(6512007)(6506007)(53546011)(38350700002)(52116002)(31696002)(54906003)(86362001)(316002)(36756003)(2616005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDBBaTRqTm4rNWwwVnhmcW9kd3NPQUZNMXA2RHhIK09sbGtEdzFXUjE3djJr?=
 =?utf-8?B?emhLbnMzR0F0MWV3ZTJzdFdrU3FYUlpDL1JpSHlvSjZZM2VMQldFMHVKVTFO?=
 =?utf-8?B?ZWdGTDR6RmJXVy9EVFVFY2NzRmNBZDNNWW9hMFFYUTVkMzNhZVhnOE1INlRa?=
 =?utf-8?B?VGVaVWpHTUdhWG5EY01OcDYxTlg4YXV3Y3NkcG1ncjBtdW42eHRSQmdHTTlH?=
 =?utf-8?B?VHJueEprVlRxclBjVGxvQXUzMFF2WmtNVSt6UENUS0RrVmEyMlBPVXRIc1Jr?=
 =?utf-8?B?c09BeElqZ1FXcWpGeEdnNkJsU2pab0p1ejBOMkxqelpwUUo3d2VPTWNDQmxa?=
 =?utf-8?B?cmtqcVVxTXF3aURFbkRhWk5JUVJFSlZxbFRyR2xqeHRSMHR1d2NyemFiZ1Bz?=
 =?utf-8?B?VWVQTEJZYWNpYjhMSE1Pdlo5UjBWYTZFcXFkOVVoT3ptb2VPM1d3Ny9VeUtX?=
 =?utf-8?B?YnA1elE3MkFNSlNIYnpPZm1JTWJXRkhwM1haTU1NMUtWZ25WZkN6T2twNnd5?=
 =?utf-8?B?UGg5c1h0eHVJejE0Q3VBeDM1Mld5d2xHYU1UU2w5YkZLTngvdk9pV3Z2RTk2?=
 =?utf-8?B?YUhiTGZQbnEwZFNWWDBXYmc1ZzF1UFlqakEwczh1aXRYbnZwc0s1d2U1Q2RB?=
 =?utf-8?B?VDRSL1RnR2cyQnNlbVovMUs5OFU3d1FmdkVzakdESlBmQjNWM0luTlVQR2or?=
 =?utf-8?B?aG5vYTczQ08yOGJKbmVXZ0FMdnRFSWQrczhqLzR1RzhqYmhJZENGNzJ0dm1M?=
 =?utf-8?B?STlRc1A0Y2JUdi9iSStpRFlMamJhNEdOZ3NxYjBoVFNWRXVVQkJqcnRGMzdR?=
 =?utf-8?B?YmhsV3JuTXBTZFZNazdmWFR5WGpOK1c1aUFJVjRMaStCUVNiY2pmTnpRUy9M?=
 =?utf-8?B?bEQ5U3NFY0tUWkl4d0VMVDN3M0FTclZreHdjeHpIYzk3Z2tGc3dxbGZ1WW5Y?=
 =?utf-8?B?MStLVVlwVEZ0Zldpa2JwTnMrSG14NVBDR1h4OTd5NitHaE8zcEIzOThxSVR1?=
 =?utf-8?B?TUI4N3Q3aXJmUDVTY1NQWnpIVTlmZm8xR29hS25mREpBNXBTRlo4aTdzaHhJ?=
 =?utf-8?B?TXRKNUhYVjdZeDZ2STd2eU1hTHRHVzhXYXVPZTR0UzJIaGlCdnFEeFVPdWhG?=
 =?utf-8?B?d2lUMCtrQ0xOS3lmQitLWG1HNGhqOGNIaWlRL0s2R2hNZFlXOUpzRTBCOG9z?=
 =?utf-8?B?ZXk0THZpTjMwdWZRS1FXU3ZmLyt6TlFnQUNTaG5PYWkvVVBOQVptRFAxbjgy?=
 =?utf-8?B?dGwwblUzWjcrWlQvUlErVXhjVWVDaSt4T2htVnV6bXBIV2lUMGhCaXJ2Y0tL?=
 =?utf-8?B?WkJMSWdiRlJ2QVl6alcydVZSMjJpZjBYRlAzZER3SFZCL002OFZMWWVDS3Fw?=
 =?utf-8?B?Sk1jOTkrenRLUkV6aWxPMEJIS0gyR1BJa0V5aHZidlE4ZzdkVXk2KzMvSy85?=
 =?utf-8?B?aHcrVGRuK0ZsejB6QUlCcjVXZjRMYmdKMjhsV2lKeFk0S3NqMVRqVFUrdk50?=
 =?utf-8?B?Yis3TWdpYzFCd1lrSGVJaUtadks0azdObWU4aWZ4Rk9nNVRzYVhEUnNKZDdL?=
 =?utf-8?B?a0FiNnh4VWNCSkMya1RwdktXUzdLeHpXOWtDbVN3V3cwTWlQZklwWG5NaHVE?=
 =?utf-8?B?YkRQbENpRUtuYXFpUjZKVTBSSVZFVFF5aDA2L2VnTU1CZ3dpYjdlRFdyOWpy?=
 =?utf-8?B?cm9zTmMwQ2VtbUhEWGFxaEpJdFFWR3pUL0pNWHRYUWZqUEExZjlBVDlTUlk0?=
 =?utf-8?B?dEF5U3E4QlMrRlV5YkRZS2MyT2h0Sk50VVVFeTF1aWxsL1Fucm0rZnpKMUlG?=
 =?utf-8?B?L1NnZW8vSk1SQnQ0Y1o0SzlZZEQzeWhXanlaQnlrVFJzenZ3dUxKZmI0SDRC?=
 =?utf-8?B?WDRXa3JBcmJ1dlhLaHM0Yk9JUkZybWJ1YS9ZZ0QwZU9hc2JHUXZucU1pOGNo?=
 =?utf-8?B?N2RKUlJXMlZRenI2RVJLOHI5eVcyandJSHVod001ZU9YbmRsV1dBZ1NhYjAr?=
 =?utf-8?B?VldOQjFMTitldWo2L2lLWGgzUEdMQkVMRkx1YkhEL2FPLzhqSW0ybnNVZThu?=
 =?utf-8?B?UTZTbkxsVnBIc1V1bHZPQlY0OTdDY1lqVlBrTk01Rk5UWjhZcUo4UlZkUm5I?=
 =?utf-8?B?NkhMRWpRdmFMa1p2d3dhU1o5TEpZMDNxbjRVdVFXS1ltNlovQWF4a2orVGgw?=
 =?utf-8?B?RE9TUzdCMGNiNXNCb2xTV3ZvK2JGYzErMGdtdUhPOGluVUJiN0ZON0JOTzVR?=
 =?utf-8?B?TklnVDNsS2NMc1ZGWjU1UVgrNEFOb2RMM0lxcTQ2alltLzd3MGdCaFk5WUkz?=
 =?utf-8?B?c3BmelRaMXFHcTQvYndWTE5OM0s1MXdwaHo3c201L25HVWVUSHN1Zz09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc3d737-dd59-41b1-b94d-08da4d2ff7ba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 11:29:24.2451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1kf8yLNVNnYwW15wSW8+p9w9SYhO0g1kz4+o6+cN0TX4SDmOHr/Xkp8v8g+i1pnSuz2zoaACRuDDLlfe0YT1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5665
Received-SPF: pass client-ip=2a01:111:f400:fe0d::715;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 30.05.2022 12:39, Denis V. Lunev wrote:
> At the moment there are 2 sources of lengthy operations if configured:
> * open connection, which could retry inside and
> * reconnect of already opened connection
> These operations could be quite lengthy and cumbersome to catch thus
> it would be quite natural to add trace points for them.
>
> This patch is based on the original downstream work made by Vladimir.
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Eric Blake <eblake@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/nbd.c             | 6 +++++-
>   block/trace-events      | 2 ++
>   nbd/client-connection.c | 2 ++
>   nbd/trace-events        | 3 +++
>   4 files changed, 12 insertions(+), 1 deletion(-)
>
> Changes from v1:
> - %d -> %u for in_flights
> - renamed open trace-point + fixed timeout type
> - moved trace_nbd_reconnect_attempt_result above
>
> diff --git a/block/nbd.c b/block/nbd.c
> index 512a53bf73..19e773d602 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -371,6 +371,7 @@ static bool nbd_client_connecting(BDRVNBDState *s)
>   /* Called with s->requests_lock taken.  */
>   static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>   {
> +    int ret;
>       bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;
>   
>       /*
> @@ -380,6 +381,8 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>       assert(nbd_client_connecting(s));
>       assert(s->in_flight == 1);
>   
> +    trace_nbd_reconnect_attempt(s->bs->in_flight);
> +
>       if (blocking && !s->reconnect_delay_timer) {
>           /*
>            * It's the first reconnect attempt after switching to
> @@ -401,7 +404,8 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>       }
>   
>       qemu_mutex_unlock(&s->requests_lock);
> -    nbd_co_do_establish_connection(s->bs, blocking, NULL);
> +    ret = nbd_co_do_establish_connection(s->bs, blocking, NULL);
> +    trace_nbd_reconnect_attempt_result(ret, s->bs->in_flight);
>       qemu_mutex_lock(&s->requests_lock);
>   
>       /*
> diff --git a/block/trace-events b/block/trace-events
> index 549090d453..48dbf10c66 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -172,6 +172,8 @@ nbd_read_reply_entry_fail(int ret, const char *err) "ret = %d, err: %s"
>   nbd_co_request_fail(uint64_t from, uint32_t len, uint64_t handle, uint16_t flags, uint16_t type, const char *name, int ret, const char *err) "Request failed { .from = %" PRIu64", .len = %" PRIu32 ", .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " (%s) } ret = %d, err: %s"
>   nbd_client_handshake(const char *export_name) "export '%s'"
>   nbd_client_handshake_success(const char *export_name) "export '%s'"
> +nbd_reconnect_attempt(unsigned in_flight) "in_flight %u"
> +nbd_reconnect_attempt_result(int ret, unsigned in_flight) "ret %d in_flight %u"
>   
>   # ssh.c
>   ssh_restart_coroutine(void *co) "co=%p"
> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
> index 2a632931c3..0c5f917efa 100644
> --- a/nbd/client-connection.c
> +++ b/nbd/client-connection.c
> @@ -23,6 +23,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "trace.h"
>   
>   #include "block/nbd.h"
>   
> @@ -210,6 +211,7 @@ static void *connect_thread_func(void *opaque)
>               object_unref(OBJECT(conn->sioc));
>               conn->sioc = NULL;
>               if (conn->do_retry && !conn->detached) {
> +                trace_nbd_connect_thread_sleep(timeout);
>                   qemu_mutex_unlock(&conn->mutex);
>   
>                   sleep(timeout);
> diff --git a/nbd/trace-events b/nbd/trace-events
> index c4919a2dd5..b7032ca277 100644
> --- a/nbd/trace-events
> +++ b/nbd/trace-events
> @@ -73,3 +73,6 @@ nbd_co_receive_request_decode_type(uint64_t handle, uint16_t type, const char *n
>   nbd_co_receive_request_payload_received(uint64_t handle, uint32_t len) "Payload received: handle = %" PRIu64 ", len = %" PRIu32
>   nbd_co_receive_align_compliance(const char *op, uint64_t from, uint32_t len, uint32_t align) "client sent non-compliant unaligned %s request: from=0x%" PRIx64 ", len=0x%" PRIx32 ", align=0x%" PRIx32
>   nbd_trip(void) "Reading request"
> +
> +# client-connection.c
> +nbd_connect_thread_sleep(uint64_t timeout) "timeout %" PRIu64
ping v2

