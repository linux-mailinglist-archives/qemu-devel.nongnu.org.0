Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26C953622C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 14:15:18 +0200 (CEST)
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuYs9-0003aL-8B
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 08:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nuYq2-00024q-4R; Fri, 27 May 2022 08:13:06 -0400
Received: from mail-he1eur02on072f.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::72f]:58690
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1nuYpw-0000gK-S2; Fri, 27 May 2022 08:13:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N59DBY6TKyxhZaeTFIWgzK+oidl1e8/bJde9HwMDkj9MzWAI3yRkpAEWtL91oqdSIVv+GIXphpuoFYT5EjmVta7/t96JjzRro8S7OyxuMCLaT0YyK2DkM6C++q+UbNahevuQxjxSylYa9rRhHAbpRP5pnSUxt8x+Eij7TaEb88YlCd0ey70cbpZAldBZJR+EpE/HCagm2RPkaw/Fdp0zyyMWp9973AjkgWm//mJRihbs8RrFu8TpXMWuNZZuToOLRm8hi/6Pd89JukuVN90gdycwpAfScvgUWX+33t1I3giMzb3v4CJRdAKMNbQwS1bRTpDk2wKtjOL8W28o1Nfj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeI6Ztwv0VsGTlF5jtWnMUzMWYaWnV4BkSKLYlUH7XA=;
 b=NgvpFwH3BDCNVrViEDP7i+lxsdjMCcYd9sN/TcRBNc8KXCAQ5oPdFA3ka5idHFyXBLred8QWsibWdpiL4tSa2DDxEUhH00Y3m3q/eJUXF4zgtcNfoce4+FD+4vi2qG9vNLkwoeyJYy3Ru/vzjRgYUYrpgFPCIhonUju7zC6dToY1DGt7qNiT1up54wzPqVhK0rC/+kUmKhW/oQkY0Kh5iRYosNM8c5R7IUSB0VoV349FjsdISbPdhoWSsjGBcKYa0mqc3Pu0zo/Brlc1c9+mbOJHjO0kZOvBwf0mcYtm/oY+TXmY4rMpeHk+8HNX2cT/eJKTSCq/Zo1IMyPn5E/i/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeI6Ztwv0VsGTlF5jtWnMUzMWYaWnV4BkSKLYlUH7XA=;
 b=PlQyU82NBpZecKhHDAaTeslWChK3OkPeJvhhLyT0NpEKrCAv8zZ42/po4Jk22k9IljV27/fskOV44bnQEEs3n2+GMZNGQcySxQ/dzC0bWYP9KQvlhzsYJA0P0sMlCQOygZdqdK4AsMCMH6UDRrfrbXD1y4Tdp3FYWK2dYpj2yEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AM6PR08MB3781.eurprd08.prod.outlook.com (2603:10a6:20b:8b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 12:12:54 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::ecb4:b64b:d503:b2c1%6]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 12:12:54 +0000
Message-ID: <fc3d34f8-ac1a-f5f9-3a1d-d9980597251a@virtuozzo.com>
Date: Fri, 27 May 2022 14:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/1] nbd: trace long NBD operations
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220527084348.68911-1-den@openvz.org>
 <9482b88c-569c-7490-428a-dbd6bc81e3b8@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <9482b88c-569c-7490-428a-dbd6bc81e3b8@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0213.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::34) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d1451ae-8b2f-4ca1-7e79-08da3fda3a4f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3781:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB3781CCBAF5ACDA03B5C4C5FEB6D89@AM6PR08MB3781.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k31fQZFfIx6yRyDe2gKklJbgZMysAwQEMr1y5JTy6LG4lkKeOlXM/WQ7fQHX11vnlVclDfmWGg/uacLRLzApTP6QwE7ZYe/1YwVyjbvpGcEatGK+DyH2qmFxdspLOKOKlBWxdernn0W/AnYxTQf83FZFX3m8XfrqgWA1WAU/rzjYk0EtfCBBNLhwl5GkdVez43CpS7nsyBSIaEDwTrV7+M1AcbrFv1RMVw4m0nOYt3M7TGrgu9Q9mJ8Yxc4GuljhWu4yKAUeAjqs1uNEApgc30igwqJr6Wo6Uj6LKQ7AIctj0e+XXwRSsaH5JYtMAZ5E3YLJUIPC9BAiXAibU6d4qfVvOZqSJxzB2d1ChSoe0M86F6CivmBNR2ZIcur0L3J1SuoU57rfeLwId8AS1Jql0KWqvPR/fbKym43K18JQwy30DZ5+iwDDslEDe0950dGBWwvSSGZPWucSWvV8pAotSAGvFnt8QDFQwe1k/Evj/TAMHjrpgEgPP6o6NuUtI5oUdf4hNR6HNQM12MLZqyUhbGIl6GsyyvZDTUlvNBqBQZp1cXn5yhwvOQBzr3JhXKBFCCr2U0scTt6j3jFAWFDyNFKOoN1c86xlTuQIJinShzGJU6gYT2m3kba5KpaqJPT44nxmGLlXSYnXDppRT919h0t0Tfwq9wAkVR5dHWQ9ww3dWiIcY8jU2i0pOHH4m1kwxzTbYdUWM0PYAdhYBJz/beF9CnBhUbZZIE7PQQ5w4/iiYTSiz1UMUnSCUgJSio/86UKzO8Dr1TtfmocBn8o+bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(86362001)(5660300002)(186003)(6506007)(52116002)(26005)(2906002)(6486002)(2616005)(53546011)(8936002)(508600001)(83380400001)(38350700002)(38100700002)(36756003)(316002)(54906003)(8676002)(66556008)(66476007)(4326008)(66946007)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zi96TGFGRWI0TE94Z3h0VktvOENaSU1EZHFVd1NMMlNiQTdhcHZDZjFvWUVn?=
 =?utf-8?B?ekd2OXRQMnArSFJDcHdJV1FCaGpKQUNseG5TNXNjeGtWZlJzeUFFc3ZkaHNr?=
 =?utf-8?B?UlZoS3lFc2dWQlF5NSsxQnlkT2tyNHIzaEVtMnhCQTRhRHRmNWRBWDRBQ1JG?=
 =?utf-8?B?TUlIM25FYzJBTkxyaDUyZi9RWkUxcHo5SHc2TDh6aExoYTRxVU1qL3BGMG1h?=
 =?utf-8?B?Z2N2dUlBUHZyeXZUakN1aVFha0taeUxhZlZ2aVhzVFFURnVUQ3U2c08xemxu?=
 =?utf-8?B?Q1VSZFpFQlNCc1pPSmxIWCtnY0RmbUg5eFo2bGZ4cDY4S01zbTBWT2cydkxv?=
 =?utf-8?B?ajZzUy9ET2psM3FSSW41bWtjYzRRZXdiaU85VFFwSWVRdTNyTmhxMzB5dHdN?=
 =?utf-8?B?K0dKNEJzUWxYRFY1aEF2MnlYaTBycGlIVWhCMjVFUEJCN0VCNHdPOXNJMldK?=
 =?utf-8?B?K0R2SnVXeC96bWNwNytaeG5aTGcwWHowdlUvUVI2ZzdwaFplMEYzZmtUNTlP?=
 =?utf-8?B?d0dYWFpiWENtQ1lFME1Ua1N4YU1aSDhzZzlJUGdNVFZvTmp3eWExdEFKR1cr?=
 =?utf-8?B?UzUycFQybU1BVTJtQ3N6MzIwNkVHakZHcXhBYlVET21uSFg5OS9va2pNcUxw?=
 =?utf-8?B?WmFVZDBDcWk3MWZFeHZQM1pxZ2xkWGZnQnNyN1ByL2tSeU83S2tKSFJzdDR1?=
 =?utf-8?B?UHpZZXJqOWxLelh2ZVZOSndLN2x3MG5MbEpPOW1WbmhNWGZrd3N0cTZORWow?=
 =?utf-8?B?TndCbzFoTlR6YmszL2Y4VkdmclNBbkNJclBmd0tWZUtxOS9ZV2h1TjZvYnlj?=
 =?utf-8?B?MDgrSlpPWHZuVVpUdER5VyswUkNndm1BV0F2TTZ5YmxHWDJrYVBtelJOWEJ1?=
 =?utf-8?B?QnZ6ZEFhVTMxaHJCZ2htM2EzQUxnK1lBeVpEN1d4MGdNVlFSS2JhNU0zcXJH?=
 =?utf-8?B?aGJhbzhCUmtxc0NkdUpRM211ZWtSekY5eWNUeGtmOFh5TkdzandVcnFSTlVu?=
 =?utf-8?B?OTZMZlB5ZklyRHQzU3lFWjBCL0d0cFVNYXNqRjk3WE9WZW1oN3cxa1lYV0J0?=
 =?utf-8?B?SGZGL2NjUHJUS1QwUWwrODI3UXV2ODBoN2tKQnhmUGJMbC9veWNPZ3JSOVN1?=
 =?utf-8?B?bUpncVRuVCsyUkVyMnpmTm9zYWlpRzlDS0dHTFljZTdXem9EVjJiTHlhVFFH?=
 =?utf-8?B?RXJzVzhiMFpiQ1dUSCt0dnIrWExtZXArMnNmN0RqQlBOdFVPVktxemRCaXA4?=
 =?utf-8?B?OWFEUXZJZlRpQVQ2UGUyMmd0Y1paNkY4dWs0c1pJTE5rdFdVbmNnb2Q4d3lO?=
 =?utf-8?B?REZFV3gzT1dTMzNLMDd0QzFUcE8zMHFmTEpGaUJOSUU1eXBSK04yVSt0bkl0?=
 =?utf-8?B?MFQzeDZmeXNWbGtkczhRdlpwdjRRSStLemJ3MU8yUEEyb3ZaNXpoNGtXVXdi?=
 =?utf-8?B?MlFUQjJMOUd2Vmd4M2toVzM2QzNVQTZkejd0M0RoNGpzZXQ5ejQyb0t0Zllq?=
 =?utf-8?B?VTFUQ0g3OXo2d1pUcFJnYmxZcE5mQUVINTgyTTNYUGhlbnFRVWVyZGg5NWhR?=
 =?utf-8?B?dTkzcVRHUXMrT2I1THVxaWJnK01MdkpNR3FRVkV3R1h2bjAxU292NDJIRkdE?=
 =?utf-8?B?K2Z4aTZzdENKcnEwT3pMbTdNRWVFanNPZkk0Y0JqZkJHNVhwbHVkOXhoQmpv?=
 =?utf-8?B?V3RibkRGWnM2dVlVTlpwRGpuaU10WlJ3UlJHVVFXeWNNWldQT0JYYy9mT3kr?=
 =?utf-8?B?bmRGUTB3bVEvdE1PNjFVV1hFVHZrWDArbjViYWRubEUvMkpMSjFvQlFvOUVB?=
 =?utf-8?B?UTgwUTZwTTYvb21POXB4dFhrcFBWSTZ6NFNLRkdGcmpVWVRaZ0Q3WXNLdW16?=
 =?utf-8?B?b0tvTEt0TWZKZUtVRXVDQ2NSZk4rV090SWFkRVUxcWIzeU1ObDdqaVQxcjMv?=
 =?utf-8?B?NjBZY095R1I5dXcwYVJyb0tmUkx6QVNPaWRjcFp4WG1lSXZ3YkE5c1htSGor?=
 =?utf-8?B?OHY0Vk1GOUUrWHQwWDl4c2FzWDFYNmpCc3FBdFU1YnRxL291ZVIxMk1uNkp3?=
 =?utf-8?B?U2plTE5BNzlvMGp5TlFlbG1ZME1lbnpnNVJrdHY0SytRNTVYWnB4ZlJ2aHB2?=
 =?utf-8?B?elg2bld0STMxRVVINVBQSEZrb01EY3NGQzZ0NmxvLzNRTnpZMElEZk04YXFH?=
 =?utf-8?B?SUtHTC9YcDFORUN1NU9vRGN3UDFKUElIZVlHTWx6VENUQjBLaG5KbEQxQjFZ?=
 =?utf-8?B?S3p2azlKQXpjOUVjTkl3Z3ZwcER1UlJaZzNML1ZhVmF3ZUVRMW1PVDhROVhB?=
 =?utf-8?B?MG9tUWorY0puNlI0MzYwNmhDa09Rd09NZEdxOFltcytWQTZSc0JUQT09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1451ae-8b2f-4ca1-7e79-08da3fda3a4f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 12:12:54.1304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAMszZtjeFHXjLjVUz8n1DBeRqBv4fqRoIKviHjeTHGeS6CIofddQ7LThST4nvMX1UcmDKqQ+OgxZvdb9jQXVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3781
Received-SPF: pass client-ip=2a01:111:f400:fe05::72f;
 envelope-from=den@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

On 27.05.2022 11:33, Vladimir Sementsov-Ogievskiy wrote:
> On 5/27/22 11:43, Denis V. Lunev wrote:
>> At the moment there are 2 sources of lengthy operations if configured:
>> * open connection, which could retry inside and
>> * reconnect of already opened connection
>> These operations could be quite lengthy and cumbersome to catch thus
>> it would be quite natural to add trace points for them.
>>
>> This patch is based on the original downstream work made by Vladimir.
>>
>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>> CC: Eric Blake <eblake@redhat.com>
>> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> CC: Kevin Wolf <kwolf@redhat.com>
>> CC: Hanna Reitz <hreitz@redhat.com>
>> CC: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   block/nbd.c             | 11 ++++++++---
>>   block/trace-events      |  2 ++
>>   nbd/client-connection.c |  2 ++
>>   nbd/trace-events        |  3 +++
>>   4 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 6085ab1d2c..f1a473d36b 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -371,6 +371,7 @@ static bool nbd_client_connecting(BDRVNBDState *s)
>>   /* Called with s->requests_lock taken.  */
>>   static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>>   {
>> +    int ret;
>>       bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;
>>         /*
>> @@ -380,6 +381,8 @@ static coroutine_fn void 
>> nbd_reconnect_attempt(BDRVNBDState *s)
>>       assert(nbd_client_connecting(s));
>>       assert(s->in_flight == 1);
>>   +    trace_nbd_reconnect_attempt(s->bs->in_flight);
>> +
>>       if (blocking && !s->reconnect_delay_timer) {
>>           /*
>>            * It's the first reconnect attempt after switching to
>> @@ -401,7 +404,7 @@ static coroutine_fn void 
>> nbd_reconnect_attempt(BDRVNBDState *s)
>>       }
>>         qemu_mutex_unlock(&s->requests_lock);
>> -    nbd_co_do_establish_connection(s->bs, blocking, NULL);
>> +    ret = nbd_co_do_establish_connection(s->bs, blocking, NULL);
>>       qemu_mutex_lock(&s->requests_lock);
>>         /*
>> @@ -410,6 +413,8 @@ static coroutine_fn void 
>> nbd_reconnect_attempt(BDRVNBDState *s)
>>        * this I/O request (so draining removes all timers).
>>        */
>>       reconnect_delay_timer_del(s);
>> +
>> +    trace_nbd_reconnect_attempt_result(ret, s->bs->in_flight);
>
> May be better trace exactly after nbd_co_do_establish_connection(). 
> Doesn't really matter, just simpler code.
>
ya, I'll change this


>>   }
>>     static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, 
>> uint64_t handle)
>> @@ -1856,8 +1861,8 @@ static int nbd_process_options(BlockDriverState 
>> *bs, QDict *options,
>>           goto error;
>>       }
>>   -    s->reconnect_delay = qemu_opt_get_number(opts, 
>> "reconnect-delay", 0);
>> -    s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 0);
>> +    s->reconnect_delay = qemu_opt_get_number(opts, 
>> "reconnect-delay", 300);
>> +    s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 300);
>
> That's changing defaults. Should not be in this patch. And I don't 
> think we can simply change upstream default of open-timeout, as it 
> breaks habitual behavior.
>
whoops :( used for testing, cut before sending once but somehow
this goes out anyway.

Thanks for pointing this.


>>         ret = 0;
>>   diff --git a/block/trace-events b/block/trace-events
>> index 549090d453..caab699c22 100644
>> --- a/block/trace-events
>> +++ b/block/trace-events
>> @@ -172,6 +172,8 @@ nbd_read_reply_entry_fail(int ret, const char 
>> *err) "ret = %d, err: %s"
>>   nbd_co_request_fail(uint64_t from, uint32_t len, uint64_t handle, 
>> uint16_t flags, uint16_t type, const char *name, int ret, const char 
>> *err) "Request failed { .from = %" PRIu64", .len = %" PRIu32 ", 
>> .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " 
>> (%s) } ret = %d, err: %s"
>>   nbd_client_handshake(const char *export_name) "export '%s'"
>>   nbd_client_handshake_success(const char *export_name) "export '%s'"
>> +nbd_reconnect_attempt(int in_flight) "in_flight %d"
>> +nbd_reconnect_attempt_result(int ret, int in_flight) "ret %d 
>> in_flight %d"
>
> bs->in_flight is "unsigned int", so a bit better would be use 
> "unsigned int" and "%u" here
>
noted


>>     # ssh.c
>>   ssh_restart_coroutine(void *co) "co=%p"
>> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
>> index 2a632931c3..a5ee82e804 100644
>> --- a/nbd/client-connection.c
>> +++ b/nbd/client-connection.c
>> @@ -23,6 +23,7 @@
>>    */
>>     #include "qemu/osdep.h"
>> +#include "trace.h"
>>     #include "block/nbd.h"
>>   @@ -210,6 +211,7 @@ static void *connect_thread_func(void *opaque)
>>               object_unref(OBJECT(conn->sioc));
>>               conn->sioc = NULL;
>>               if (conn->do_retry && !conn->detached) {
>> +                trace_nbd_connect_iteration(timeout);
>
> Here we are going to sleep a bit, before next reconnect attempt. I'd 
> call the trace-point "trace_nbd_connect_thread_sleep" or something 
> like this to be more intuitive.
>
ok

>> qemu_mutex_unlock(&conn->mutex);
>>                     sleep(timeout);
>> diff --git a/nbd/trace-events b/nbd/trace-events
>> index c4919a2dd5..bdadfdc82d 100644
>> --- a/nbd/trace-events
>> +++ b/nbd/trace-events
>> @@ -73,3 +73,6 @@ nbd_co_receive_request_decode_type(uint64_t handle, 
>> uint16_t type, const char *n
>>   nbd_co_receive_request_payload_received(uint64_t handle, uint32_t 
>> len) "Payload received: handle = %" PRIu64 ", len = %" PRIu32
>>   nbd_co_receive_align_compliance(const char *op, uint64_t from, 
>> uint32_t len, uint32_t align) "client sent non-compliant unaligned %s 
>> request: from=0x%" PRIx64 ", len=0x%" PRIx32 ", align=0x%" PRIx32
>>   nbd_trip(void) "Reading request"
>> +
>> +# client-connection.c
>> +nbd_connect_iteration(int in_flight) "timeout %d"
>
>


