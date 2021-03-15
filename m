Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE92A33BB04
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:15:45 +0100 (CET)
Received: from localhost ([::1]:52518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLo0W-0007tZ-TN
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLnts-00013u-H2; Mon, 15 Mar 2021 10:08:52 -0400
Received: from mail-eopbgr40096.outbound.protection.outlook.com
 ([40.107.4.96]:36161 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLntp-0003Mf-HQ; Mon, 15 Mar 2021 10:08:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkT+wOmqnZcCGESK6q1ZlRzDDO8fiaO2y+0YFSgajePr2ZK+AjvP4mYfv8IyMNDx7mW1VUgIfIQZwaNPTY92GfQt6bujr96hb9vzBfKzII7G7ix3Y4Ca+cY6V1QZFmyfiNLmXrGywlVMrOZofPf706h6iIGTz1IYDwaWSPX3OyojOFHyOO1dd2WV2NsrWxJj2/cDlmwre3ZbOEJ2SOUK9H9YMYqGL+w4d6NKzVCzVjWSPgsq0X9LwRdPKyD5j6wEwHFdX6IjL/CCPBCj4Z6MUiImgE2NKEzbjR52dGwINN/rgkuKuhsT/4Bresa+cyk7cHrb/YDCnlTiDPAEsJYTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4So8iqjP8KwRl5TCZkFuj4bQYuiEe+2PrSEBxxS7Z+s=;
 b=dDmp/L6gbEdXVzAG3dxsWWmk0wkdXLjYz0KLsWtbOv6MxLtGtKWDnp+DiLwKxyc74ECaT7NTIhurdop/qbE1xWZcXBeIxUAVOnRcfiG6RxgdB2u8eUFUXm+EFf1dvqwu63IxJT3hQUMc+5eAEHVH7UZPGKmIeCX1E5ebDLqsMH+DMMUTJn47pvw/IrHXQSl/Fm61RAczUHTsFDkNNXITz3G/sC0xD/3Vm0oGdZ1dDvcMJK6kY/8ZFgu8X1zxLTL6em7quWtt3jwoS5JGkvquqXWYhD2ZqE2znyz9YqIbKOL7YSWzlycXZlufmoSOod0jA8HaiSugCamNI/dWE1q09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4So8iqjP8KwRl5TCZkFuj4bQYuiEe+2PrSEBxxS7Z+s=;
 b=etC5CPQ10ZmrZrgtL+aV13L0QdSgVjGScjYwLtgh+asCnaKAF5fvIzC4NJSvgWuwN33qcxOmW6cG3IIqk7Ozo16XiBFx5/zcnnxHudrJcd0VQXRb32LcKBXGUNdgNpIx1iZzYaIwEk8+OmVFfl17A2odlcHa7ITb7xuhx+49J9s=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 14:08:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:08:46 +0000
Subject: Re: [PATCH 2/9] block: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 "open list:CURL" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-3-ma.mandourr@gmail.com>
 <d74ef980-ad9b-8a97-0bc8-1ecc60a28c65@virtuozzo.com>
 <CAD-LL6jwuO2Wm06eTjhims2DgRA5yT4z1poOGqd8mXs968vc8A@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5336068d-8a33-c01d-94d3-24d959eee69c@virtuozzo.com>
Date: Mon, 15 Mar 2021 17:08:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAD-LL6jwuO2Wm06eTjhims2DgRA5yT4z1poOGqd8mXs968vc8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.11 via Frontend Transport; Mon, 15 Mar 2021 14:08:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64809012-1a2e-42c8-0f72-08d8e7bbd92d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-Microsoft-Antispam-PRVS: <AM6PR08MB33817919CCC03848EBDDF367C16C9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qmXZuZKu3JpW6sVkcfZThcWNmMUkLWTPtLvhfSNs8UI4Q8y+faRwbKldGxP6p+uMatEya0V2rcoAEV0/gfcYWZNDTLUFrb1/27knho9yhfEXVbKsoLEjQPxZjkV+qz+Ncm1mj6DbVt87VZJhv0DtN4uw0+TEqffDkkT1sfPR3IVAj3JYXAdV8ne8Y3IOwMQB/fluyccS4Xn532DjbBYrynA8Uftj1ZlHeNBSdFHeXQrEdNuX8efGKLHi/DfadBCtV8EOa48u8lM+YUfX1l7E1W06Hld+JvA01wSdbSvS9xQLCLluwKeOdGg6zMUPjO8LUT5bgf0XTok89M1GL4qhSau0Gfxr4XxWGWrC/7qYqKIOMyiUyX5hS6SRjgid9/Vp7rDbJGlaA0RwoxpAZPTzm1GFAXRDagxCvffJgk7fxiaHugOtEXCX7J0wVEkzJVcKJqJ7VQB7RUK6KuyGlISdcTnnznh+UpjjQGhzmybbNbHOoyFUbwLzOKxQLE52q/VTXoaWj/JZkBwEBtHpuux2sZrHpzfQCG8TPcjGQVO3YKLd8ywTt7apPTj7CA2Kfhl3dNvHNBUe2e8YErhbKW9G+ad+85BqRu+3COCFBp/WzLc0sBpYC5XYWT1bKLWdEExadYfA7Feka7PLVUJy/+HXMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39840400004)(136003)(6486002)(2906002)(52116002)(16576012)(54906003)(66476007)(8676002)(16526019)(66556008)(86362001)(316002)(31696002)(8936002)(66946007)(31686004)(956004)(4326008)(6916009)(30864003)(186003)(2616005)(5660300002)(83380400001)(36756003)(478600001)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WXl3SzY1YnJrL3ltVU1Qa3hPbEtjNEF5M3kvSmRTZVcyQk5UMzZsRGMwVjdD?=
 =?utf-8?B?ZDR5dUVYYkxHWUYxY2FrNzlFZGVoU3dUdFlXMVBXYlVNOEl2WVhKTXZkVXBt?=
 =?utf-8?B?S21uSWIwTVgvVkJsZGxEVk90ckpsQndlUG5ibFFPaDY3RFl4VHV6anBVZWgv?=
 =?utf-8?B?VzdPYWUzSmY0bW54UXJYa290bk4xUjFjVTZuN3phSXFDYUZlSkkxYzM1SXY2?=
 =?utf-8?B?OVh4K1pFK1RHY1VWUEEycFFwOEloOVdsSlJYR21yVndTbGNoaXYyTC85dnVS?=
 =?utf-8?B?d3RHNXdhbDVVdmI5S1RCZGZVYmdNMFZOSlcwTVk3QmdPNm1CR0VVb3ZNbkpI?=
 =?utf-8?B?eWdZNTlUdDcvZnphYzd3ZTRYeXJuTmpKRDNvNFR1TkY3bnRJdnlhOEhTYW1V?=
 =?utf-8?B?MmNwNnRJSmMvc1F3OUxOY1VHZmdWTitGTnd3Qjl0Smh0ZXA0WmZLRXJKS29z?=
 =?utf-8?B?L3l1Uy9kK3ZocWNxM2ZRTkVNeDgyeG1XaHNRM1kwZmFQYkZLQmhGdUluT28z?=
 =?utf-8?B?RXVVbzlSdC94dnlYcmRTUTgra3FpeTN5cDd3ejQ1QmNScWUvT0plRFJZdXEv?=
 =?utf-8?B?OEhiK3QvSStFTUdqWnNkeHZRcUhmOG9xbjVNbFpJQ3AxdEoydTRkTU1sck1y?=
 =?utf-8?B?VWNVZ2RXOTlaUEVLaUFVVzE4dUZHR0o0RXVvRndkOWplTnNFVEFFZzZzVmZK?=
 =?utf-8?B?ZDkvUjZNZ2xmRlVxTmxFdkRMcXIvdUI5d2VURE9jNlpmNEc4RzZaMFVJSllL?=
 =?utf-8?B?c0EvaG1Sa3N2YkR1cnl5M0hlRVcxUm5OYXB6VGdaM2kzTHpQRVRRQkl2OGdG?=
 =?utf-8?B?Y2ZVOHpwQ3liR2E0dm1NSlI3V2NWRGFxODMyUGQ0d0RMSW1BWHhVcHlVaWJB?=
 =?utf-8?B?MVJWL3BjNkJ2WmNhWnU3WElPWjZQMkZwMVlpSCtON0pXVldXeGVqeFBxUFU5?=
 =?utf-8?B?M1dER29tVWFJVFA1TEwrNVY4YklsNFRhYVRRckl3bHNGT0x6MjdTVVBZaTJ2?=
 =?utf-8?B?ZnpoaWRxRmpqREVnTkV4dXUwSXN1dWd3ZU1KcHg0NFVnR2ltZjJPcWF1SG1Q?=
 =?utf-8?B?WHRIUXc2ajljWkx3bkE1dG5QUTVPUmNsbTZENjhFbVRMWDB3eDcrNHcrNlBT?=
 =?utf-8?B?dFc5K3o5c2xYM3Y1UndVS051UkwzRUpnNzFZS1RwNGxreENkWVZYNzdhcS9O?=
 =?utf-8?B?dGhKQ0w4Z1lsSlJNd1A1ZllrZGpxSEZzY3M2NElTbnpaSWRkbkw4bGR0OU5O?=
 =?utf-8?B?SEJra0tXZzFtUnlNUE9CK0p2b3d2Zll0b24rcmFWWEZxMGRkN0FYN0NTQVBB?=
 =?utf-8?B?ZWhiSkVJUG05dE9QT0ZtOWlwSk9xc3NVRVVaNUxkL1BLWngwZWxWS0MvMS9u?=
 =?utf-8?B?YmFPWGhaUEltL2pkdXBUOTVZMDRjQ1ZWS0ZzTDJHNTVaTmZEVXNkVnlRd1ND?=
 =?utf-8?B?VGc1QXZXYlRvL2tUdUhoRkJLaG82Tyt6L1B4YjlnZUdlZFZMRWxyakw4RzFO?=
 =?utf-8?B?UVNOeCtXem5KL1dVS2tOOEdvZVY0Q20vQWl0UUVnbWxPay9Wc3oyNHorWElB?=
 =?utf-8?B?dVhSWkxMVFFEMjZXaUY1bDFvSnFQRkphTlhVbHBoVmtiUDdjQjlVYnVXcXFK?=
 =?utf-8?B?aFlSK3B0ZVFOSCtpOEE2ZDhJazFTVWEwUVlRVEMvenFCclFFMStPWVAycTlq?=
 =?utf-8?B?T0VNSElzcE9sR0lqdTBvRnUvR1crYm1zbmlQMGdkSE1yNkx6aDJNamUvOXJB?=
 =?utf-8?Q?oX2vyv20aLJEqPj7lQT0gVMqJ0+G8fkpWevqCdN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64809012-1a2e-42c8-0f72-08d8e7bbd92d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 14:08:46.7010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKS8Kjti5KK7exG+8yg24y8b+yYU29SBIs0LNhxjB4cd8GuwmFzNs9FazXAI7P9TDkgZPJdGzyDljsuW8kXzoKpqiBro/j6EUGPhtbXymyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

13.03.2021 08:51, Mahmoud Mandour wrote:
> Thank you for the fast review and I'm sorry for the silly and obvious style
> errors. Unfortunately I did not notice the section on using the checkpatch
> script in the Contributing page on the wiki before committing. But I assure
> you that such errors will not occur again.

Don't worry :)

> 
> On Fri, Mar 12, 2021 at 12:23 PM Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>> wrote:
> 
>     11.03.2021 06:15, Mahmoud Mandour wrote:
>      > Replaced various qemu_mutex_lock/qemu_mutex_unlock calls with
>      > lock guard macros (QEMU_LOCK_GUARD() and WITH_QEMU_LOCK_GUARD).
>      > This slightly simplifies the code by eliminating calls to
>      > qemu_mutex_unlock and eliminates goto paths.
>      >
>      > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com <mailto:ma.mandourr@gmail.com>>
>      > ---
>      >   block/curl.c |  13 ++--
>      >   block/nbd.c  | 188 ++++++++++++++++++++++++---------------------------
> 
>     Better would be make two separate patches I think.
> 
>      >   2 files changed, 95 insertions(+), 106 deletions(-)
>      >
>      > diff --git a/block/curl.c b/block/curl.c
>      > index 4ff895df8f..56a217951a 100644
>      > --- a/block/curl.c
>      > +++ b/block/curl.c
>      > @@ -832,12 +832,12 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>      >       uint64_t start = acb->offset;
>      >       uint64_t end;
>      >
>      > -    qemu_mutex_lock(&s->mutex);
>      > +    QEMU_LOCK_GUARD(&s->mutex);
>      >
>      >       // In case we have the requested data already (e.g. read-ahead),
>      >       // we can just call the callback and be done.
>      >       if (curl_find_buf(s, start, acb->bytes, acb)) {
>      > -        goto out;
>      > +        return;
>      >       }
>      >
>      >       // No cache found, so let's start a new request
>      > @@ -852,7 +852,7 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>      >       if (curl_init_state(s, state) < 0) {
>      >           curl_clean_state(state);
>      >           acb->ret = -EIO;
>      > -        goto out;
>      > +        return;
>      >       }
>      >
>      >       acb->start = 0;
>      > @@ -867,7 +867,7 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>      >       if (state->buf_len && state->orig_buf == NULL) {
>      >           curl_clean_state(state);
>      >           acb->ret = -ENOMEM;
>      > -        goto out;
>      > +        return;
>      >       }
>      >       state->acb[0] = acb;
>      >
>      > @@ -880,14 +880,11 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>      >           acb->ret = -EIO;
>      >
>      >           curl_clean_state(state);
>      > -        goto out;
>      > +        return;
>      >       }
>      >
>      >       /* Tell curl it needs to kick things off */
>      >       curl_multi_socket_action(s->multi, CURL_SOCKET_TIMEOUT, 0, &running);
>      > -
>      > -out:
>      > -    qemu_mutex_unlock(&s->mutex);
>      >   }
> 
>     This change is obvious and good.
> 
>      >
>      >   static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
>      > diff --git a/block/nbd.c b/block/nbd.c
>      > index c26dc5a54f..28ba7aad61 100644
>      > --- a/block/nbd.c
>      > +++ b/block/nbd.c
>      > @@ -407,27 +407,25 @@ static void *connect_thread_func(void *opaque)
>      >           thr->sioc = NULL;
>      >       }
>      >
>      > -    qemu_mutex_lock(&thr->mutex);
>      > -
>      > -    switch (thr->state) {
>      > -    case CONNECT_THREAD_RUNNING:
>      > -        thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
>      > -        if (thr->bh_ctx) {
>      > -            aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);
>      > -
>      > -            /* play safe, don't reuse bh_ctx on further connection attempts */
>      > -            thr->bh_ctx = NULL;
>      > +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
>      > +        switch (thr->state) {
>      > +        case CONNECT_THREAD_RUNNING:
>      > +            thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
>      > +            if (thr->bh_ctx) {
>      > +                aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);
> 
>     over-80 line
> 
>      > +
>      > +                /* play safe, don't reuse bh_ctx on further connection attempts */
> 
>     and here
> 
>      > +                thr->bh_ctx = NULL;
>      > +            }
>      > +            break;
>      > +        case CONNECT_THREAD_RUNNING_DETACHED:
>      > +            do_free = true;
>      > +            break;
>      > +        default:
>      > +            abort();
>      >           }
>      > -        break;
>      > -    case CONNECT_THREAD_RUNNING_DETACHED:
>      > -        do_free = true;
>      > -        break;
>      > -    default:
>      > -        abort();
>      >       }
>      >
>      > -    qemu_mutex_unlock(&thr->mutex);
>      > ->       if (do_free) {
>      >           nbd_free_connect_thread(thr);
>      >       }
>      > @@ -443,36 +441,33 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>      >       BDRVNBDState *s = bs->opaque;
>      >       NBDConnectThread *thr = s->connect_thread;
>      >
>      > -    qemu_mutex_lock(&thr->mutex);
>      > -
>      > -    switch (thr->state) {
>      > -    case CONNECT_THREAD_FAIL:
>      > -    case CONNECT_THREAD_NONE:
>      > -        error_free(thr->err);
>      > -        thr->err = NULL;
>      > -        thr->state = CONNECT_THREAD_RUNNING;
>      > -        qemu_thread_create(&thread, "nbd-connect",
>      > -                           connect_thread_func, thr, QEMU_THREAD_DETACHED);
>      > -        break;
>      > -    case CONNECT_THREAD_SUCCESS:
>      > -        /* Previous attempt finally succeeded in background */
>      > -        thr->state = CONNECT_THREAD_NONE;
>      > -        s->sioc = thr->sioc;
>      > -        thr->sioc = NULL;
>      > -        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
>      > -                               nbd_yank, bs);
>      > -        qemu_mutex_unlock(&thr->mutex);
>      > -        return 0;
>      > -    case CONNECT_THREAD_RUNNING:
>      > -        /* Already running, will wait */
>      > -        break;
>      > -    default:
>      > -        abort();
>      > -    }
>      > -
>      > -    thr->bh_ctx = qemu_get_current_aio_context();
>      > +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
>      > +        switch (thr->state) {
>      > +        case CONNECT_THREAD_FAIL:
>      > +        case CONNECT_THREAD_NONE:
>      > +            error_free(thr->err);
>      > +            thr->err = NULL;
>      > +            thr->state = CONNECT_THREAD_RUNNING;
>      > +            qemu_thread_create(&thread, "nbd-connect",
>      > +                               connect_thread_func, thr, QEMU_THREAD_DETACHED);
>      > +            break;
>      > +        case CONNECT_THREAD_SUCCESS:
>      > +            /* Previous attempt finally succeeded in background */
>      > +            thr->state = CONNECT_THREAD_NONE;
>      > +            s->sioc = thr->sioc;
>      > +            thr->sioc = NULL;
>      > +            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
>      > +                                   nbd_yank, bs);
>      > +            return 0;
>      > +        case CONNECT_THREAD_RUNNING:
>      > +            /* Already running, will wait */
>      > +            break;
>      > +        default:
>      > +            abort();
>      > +        }
>      >
>      > -    qemu_mutex_unlock(&thr->mutex);
>      > +        thr->bh_ctx = qemu_get_current_aio_context();
>      > +    }
>      >
>      >
>      >       /*
>      > @@ -486,46 +481,45 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>      >       s->wait_connect = true;
>      >       qemu_coroutine_yield();
>      >
>      > -    qemu_mutex_lock(&thr->mutex);
>      >
>      > -    switch (thr->state) {
>      > -    case CONNECT_THREAD_SUCCESS:
>      > -    case CONNECT_THREAD_FAIL:
>      > -        thr->state = CONNECT_THREAD_NONE;
>      > -        error_propagate(errp, thr->err);
>      > -        thr->err = NULL;
>      > -        s->sioc = thr->sioc;
>      > -        thr->sioc = NULL;
>      > -        if (s->sioc) {
>      > -            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
>      > -                                   nbd_yank, bs);
>      > -        }
>      > -        ret = (s->sioc ? 0 : -1);
>      > -        break;
>      > -    case CONNECT_THREAD_RUNNING:
>      > -    case CONNECT_THREAD_RUNNING_DETACHED:
>      > -        /*
>      > -         * Obviously, drained section wants to start. Report the attempt as
>      > -         * failed. Still connect thread is executing in background, and its
>      > -         * result may be used for next connection attempt.
>      > -         */
>      > -        ret = -1;
>      > -        error_setg(errp, "Connection attempt cancelled by other operation");
>      > -        break;
>      > +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
>      > +        switch (thr->state) {
>      > +        case CONNECT_THREAD_SUCCESS:
>      > +        case CONNECT_THREAD_FAIL:
>      > +            thr->state = CONNECT_THREAD_NONE;
>      > +            error_propagate(errp, thr->err);
>      > +            thr->err = NULL;
>      > +            s->sioc = thr->sioc;
>      > +            thr->sioc = NULL;
>      > +            if (s->sioc) {
>      > +                yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
>      > +                                       nbd_yank, bs);
>      > +            }
>      > +            ret = (s->sioc ? 0 : -1);
>      > +            break;
>      > +        case CONNECT_THREAD_RUNNING:
>      > +        case CONNECT_THREAD_RUNNING_DETACHED:
>      > +            /*
>      > +             * Obviously, drained section wants to start. Report the attempt as
>      > +             * failed. Still connect thread is executing in background, and its
>      > +             * result may be used for next connection attempt.
>      > +             */
>      > +            ret = -1;
>      > +            error_setg(errp, "Connection attempt cancelled by other operation");
>      > +            break;
>      >
>      > -    case CONNECT_THREAD_NONE:
>      > -        /*
>      > -         * Impossible. We've seen this thread running. So it should be
>      > -         * running or at least give some results.
>      > -         */
>      > -        abort();
>      > +        case CONNECT_THREAD_NONE:
>      > +            /*
>      > +             * Impossible. We've seen this thread running. So it should be
>      > +             * running or at least give some results.
>      > +             */
>      > +            abort();
>      >
>      > -    default:
>      > -        abort();
>      > +        default:
>      > +            abort();
>      > +        }
>      >       }
>      >
>      > -    qemu_mutex_unlock(&thr->mutex);
>      > -
>      >       return ret;
>      >   }
>      >
>      > @@ -546,25 +540,23 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
>      >       bool wake = false;
>      >       bool do_free = false;
>      >
>      > -    qemu_mutex_lock(&thr->mutex);
>      > -
>      > -    if (thr->state == CONNECT_THREAD_RUNNING) {
>      > -        /* We can cancel only in running state, when bh is not yet scheduled */
>      > -        thr->bh_ctx = NULL;
>      > -        if (s->wait_connect) {
>      > -            s->wait_connect = false;
>      > -            wake = true;
>      > -        }
>      > -        if (detach) {
>      > -            thr->state = CONNECT_THREAD_RUNNING_DETACHED;
>      > -            s->connect_thread = NULL;
>      > +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
>      > +        if (thr->state == CONNECT_THREAD_RUNNING) {
>      > +            /* We can cancel only in running state, when bh is not yet scheduled */
> 
>     over-80 line
> 
>      > +            thr->bh_ctx = NULL;
>      > +            if (s->wait_connect) {
>      > +                s->wait_connect = false;
>      > +                wake = true;
>      > +            }
>      > +            if (detach) {
>      > +                thr->state = CONNECT_THREAD_RUNNING_DETACHED;
>      > +                s->connect_thread = NULL;
>      > +            }
>      > +        } else if (detach) {
>      > +            do_free = true;
>      >           }
>      > -    } else if (detach) {
>      > -        do_free = true;
>      >       }
>      >
>      > -    qemu_mutex_unlock(&thr->mutex);
>      > -
>      >       if (do_free) {
>      >           nbd_free_connect_thread(thr);
>      >           s->connect_thread = NULL;
>      >
> 
> 
>     For nbd.c we mostly change simple critical sections
> 
>     qemu_mutex_lock()
>     ...
>     qemu_mutex_unlock()
> 
>     into
> 
>     WITH_QEMU_LOCK_GUARD() {
>     ...
>     }
> 
>     And don't eliminate any gotos.. Hmm. On the first sight increasing nesting of the code doesn't make it more beautiful.
>     But I understand that context-manager concept is safer than calling unlock() by hand, and with nested block the critical section becomes more obvious. So, with fixed over-80 lines:
> 
>     Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>>
> 
>     -- 
>     Best regards,
>     Vladimir
> 


-- 
Best regards,
Vladimir

