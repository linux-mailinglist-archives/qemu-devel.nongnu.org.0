Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F54193BF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:58:59 +0200 (CEST)
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUpHe-0005yu-0W
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mUpGU-0005Ff-GU; Mon, 27 Sep 2021 07:57:46 -0400
Received: from mail-eopbgr60116.outbound.protection.outlook.com
 ([40.107.6.116]:57543 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mUpGR-0002CV-9K; Mon, 27 Sep 2021 07:57:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agItbbxMvyfpaTwVMWV/KP2B3D1X8fuublA8mPIZEDuaLXWOIoOne6NMr5xQh28pT/gBs8CgStZih+vkLYM2LOW9WsQ2xLFrDy9w976C6Sq/QUsba1BpJ+x+Kejeer5fxL9YzmJpG10L7HUzuyLlxFuadj7jdnayCvQs9JWgeBTZcNsJ4PCBII3oAvYYJ9w2x4tazur2hf0KMbegoL9OUAObKXpuT1KyRnjxEP73bLP4Gcz7gfNUvQ1r7EDgnJIZxIad+PZxppfUDXt/szolNhp2V/lHhwqZkij40tsD1p1AsbxWcJD8z8tulQJkJEoIWP5nORGzJsKZRvB7CZWyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=psB7R3glqNbL7WZpa5IN6qShFwbhN1ie1RxWVIocSC8=;
 b=MunsKiOf6W9lcI0l3Ef1z6TBQoBaa1XgqAetztWn5ot5FIALUlCaHCGBGEssQam9YvV77GSW+Ny/uWGXL/ob70mB4l0XA4mW+PH0dAXBkvu2i563iDT/zjVV4E4wDe1pDq95nqqvw90LnxNGdavWn3b84aqPKMvwFNPADuRUZw2tH+Vp/ACEs8PuvqMJKU6hUyciulQrOiw470BBGPOi7ewbAFjODhw98M2Kp2DVtKcEzxHaQEJet4WYpSlXhY7TggN4RBYB2K2SXQDegP4xhPoX8n8LrxTFyNc4KE4imcO1M/wD3/fheAMv9sn3rgO0FSFKa6cEfLdroxijyJTSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psB7R3glqNbL7WZpa5IN6qShFwbhN1ie1RxWVIocSC8=;
 b=s6/bNyl5zUVKu/L/fSmuwB3c56//71xK0XC1O7wes/lH4mI1nFu+ad/KUfxwB4TCKxd72h+6ufGkhAnkUnSp5sgDynAxPGA/pwMRDBkACykf9BOUhKh928/7TNB91INUSqIS1B7is34qrS+F6YpNGsT4Gox0w1gFnb7gq5wOi2A=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 11:57:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 11:57:38 +0000
Subject: Re: [PATCH v6 4/5] block/nbd: drop connection_co
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, rkagan@virtuozzo.com
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
 <20210902103805.25686-5-vsementsov@virtuozzo.com>
 <20210924174439.jphzecreh7usmecj@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6bdbd25a-666e-be2e-bbe4-da9317ef9f62@virtuozzo.com>
Date: Mon, 27 Sep 2021 14:57:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210924174439.jphzecreh7usmecj@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0255.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::27)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.13] (185.215.60.205) by
 PR0P264CA0255.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 11:57:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2782e75a-9ed9-4fd3-15be-08d981ae00b0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65513F0B769F43C62C6D7D2CC1A79@AS8PR08MB6551.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJeFYeaQ5CqB4He3vtqxJVZaDhGhHK8m7FYOVusP4xgJWZ5dx41+dcXIq0v7TlJspFnX6+hYoxEW70HqCftCX35vjQnhi+fd++r1DHFkQWIET0TCYUCaYj2n0oXmTf5TA11yb1Ss0uVlwPLhlE5CAW2eGGAL4BFPWupeDA81MIpywUisJTRxli7AYY+RQ5DhiaWFWOuk2SOKWLP0lK+uMIFy64IjLfIm3PFsyVeNoUkJX4RpsHcqGjVoi5RUMt2ztGllHOEZr8CSzBtFOxbu6bJPxkWx3Ken+QZ+X4XhpGzVq7oAzV79FN7MEGFYwr6NhIH9l+XpzYfbSB4SboKsk7Y7XBY6S9HCtUyi+knZNd9WDQWyf8o1beUXwLEDK4xJIK7uAYJ9USK5OSmitErHZZZB/h/m3WL6n6BkjuRCtccR9+n3pfPp73RPwVdZW1LO+jpUE1vhkFS2eEdt+m3LaJrOO0PV32jdwyDGdRf/DNz5xImoPIAAaxDWe5pjY7goYdJavHF+G5OEdjFl6GwLCTEVAwNow/xH9lHGdfsbL+N63QPFGYn2ebG9CXd0B2kgiLnD4yA1I8EU5VeYWvzDc8EZJ08YO76F02IemNGq018U6b2KsfEvhiiQUSGzga/oxoUhiy3TsxTE2rLaM+7fa4Nv92xX5KZOFTpSz/B27iv0db76mKJrbW9vvAzyC8BluXV/ki9rmodn+tMqj74W0P+q8BEEw1cvSRFtdSqxngB9VtqEqDFE9w3zPus0+0L/KVIKsW3o98M3RnQBuFm42g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(956004)(2906002)(26005)(107886003)(38100700002)(31696002)(38350700002)(83380400001)(508600001)(186003)(36756003)(52116002)(5660300002)(6916009)(30864003)(66556008)(86362001)(66946007)(316002)(66476007)(16576012)(31686004)(8676002)(4326008)(8936002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUN1SXczRmFHcElrZjd4dGIzMU9OZUl6YVAvUStHM05jcWlwRCs3Nm1adjBn?=
 =?utf-8?B?a0tjSWlyWVljcjNsYTFXUzJHbW01SVRJR3UxQjFXbDJnNEtya0o4RlVaUzVF?=
 =?utf-8?B?ekY1QVhwMmlLYUp2T1ZaTzh0ZVBnOEtwelRwMWZBK1MxdW9NS2F6czVmTnRx?=
 =?utf-8?B?Q25sVy9TNzIvMTI2Zmh0alBqU1VZRHNHMFZ2U2xBeVhtQ3VDZURMTWkzRTIz?=
 =?utf-8?B?L0pFb0l3Y3MwZzQ2MmNqOTNYR2NaT1NvbmZlZUE5M0Q3MXRMK2VXYWp0REVt?=
 =?utf-8?B?RzRqWGFLU2poVmZBeVhYWlcxZ1JZRzUrK1BCWUJUZ2ZLQlg3VnRFemRnT1R4?=
 =?utf-8?B?b0IvcERHd090TThaaklXTFBOR09QSVEyUzZwNUVubEt1ZUJWYzZ5MkM1N1lh?=
 =?utf-8?B?UFNyMTc1NzBoVmxxdVpoTjlja1g2MUNyNUNyaktOVzIvQzQxSmdRLzgzK0xR?=
 =?utf-8?B?SEdHN2JnaHhmNnlGRGZFclJsVXBGTmRZUmZGMWx1dzYwWlFVdHRjYTVPazZT?=
 =?utf-8?B?NHBsbjd0bUE2VDdXbGVZWk5UbkZOYVFXVTNhVVlHVStWd0FHVUdPdVU3ZFJU?=
 =?utf-8?B?MHRyakZqWm50QlhMa1FFQ0o3Y3FUbFhtalREOWhzR2J5NDc5eFhxSzNQSy9j?=
 =?utf-8?B?bDRqQkExUkdpWExDYUlBSGFNSk14K2haN09vbUsxUldzcFVJSXkzWXVENjZO?=
 =?utf-8?B?TTZZMEJ3UzR0REtXa2FQbXJ1dURCWWp4Y3VhV0xMNHd4REF4OHBqbGhwSG9G?=
 =?utf-8?B?V3dxUzVKYnlvRnp4ZFlUTUxsYitLc1U0VGZTQXlrVnhBWFlnTExIeW1Qa05C?=
 =?utf-8?B?WFJzRFEvd0VPZlBxZDZBYkhadlI3VjFjMmpGMkVKNTFaTVpsb045MlNOZE52?=
 =?utf-8?B?Y1psaEJFbVhUdEJ2YVJDL1BVVDhZZ1lBYkVobTZ1bzRFZ3dGQXhjRzdVcG5N?=
 =?utf-8?B?cFcxd1hGOFJRMjhaOE5lQVhHZ1FBRGkrSnZKUDFyejhvbTJLUHI3UkoxanNu?=
 =?utf-8?B?Z01oajN4a2JTSUEvaS8vZnZJcWViQzQvSU5lTGMyM0ZyNFBISHI2bmxGNU1R?=
 =?utf-8?B?b24xcVVhUDJJM3NNaTQzY3FoVVhXNHh1cm9KZjY5VVVNNkNLdHdxbzlPWmxj?=
 =?utf-8?B?azZ1MUtTY3A1M1J6bWltTFh0OHRIdU4xa2pCWEVOUytwd0RXVlQyVVFuYWI5?=
 =?utf-8?B?TTZ1SlJ1a0tTeUg0alhlR0xXbkN0UWsyWlVnaG0xYnRJb3VNUyt4ek9JbkNl?=
 =?utf-8?B?UGVGWUkwWnBVTkE1VlR5UkpoZTdCRmNRWTZZb1RXVWZEWWViYitRc2ozUVVU?=
 =?utf-8?B?bkwwMTloS0czZm4zOXp2OGZaY1VQSTFNMWEwOHc1cmlpVzlPd3dFNVVDbUpt?=
 =?utf-8?B?bGthaUhhRE9hM0tVUTlWVm5BY2daL3c5VTU4cGNrUTFxYUN6RXBvVDVadHV1?=
 =?utf-8?B?WVNYWDJZS3djTmw5Vm5jVUQ5bkRkRGtuMHM4WDA3ZlhsUnpjTnpHODdBU0o4?=
 =?utf-8?B?TFlpcDdXWGtFeVNnUklwZkd5bmZEMzZBV1RwZGNpM0FQbVBuSmk0SmQxQnMy?=
 =?utf-8?B?V2lOQTlRYU5oSEViSlgyckU1bFNMeTdIUnJXdGh2SkV2dmJBSmR5V0V1c3E0?=
 =?utf-8?B?cXQ0ZHJLWjR5YlZ4NEhsRS9lV05ieDkrQ3JkNHZQckxpVTBSVWVrS0lxTFE3?=
 =?utf-8?B?TE9RQit6RnN6eGNHVU9jRjMwdWNaYkZveDQ0bTNNR0dOVnJ6WEZuSjZyNktW?=
 =?utf-8?Q?bvEd8+0Np6OBrW/Xk9tBH1cWfGuQVurIxJo2y2w?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2782e75a-9ed9-4fd3-15be-08d981ae00b0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 11:57:38.7320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQTxV4LmgCOBog9oeQd5o3W9mbd2sF/38im0n5FhTZrBmdyHerfvVe7b9esK0QGhcDqFSTqHRHx1QB1qUHd0j+pgsXFzkw/LYPQVOj6vp00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Received-SPF: pass client-ip=40.107.6.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_NONE=-0.0001,
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

24.09.2021 20:44, Eric Blake wrote:
> On Thu, Sep 02, 2021 at 01:38:04PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> OK, that's a big rewrite of the logic.
> 
> And a time-consuming review on my part!
> 
>>
>> Pre-patch we have an always running coroutine - connection_co. It does
>> reply receiving and reconnecting. And it leads to a lot of difficult
>> and unobvious code around drained sections and context switch. We also
>> abuse bs->in_flight counter which is increased for connection_co and
>> temporary decreased in points where we want to allow drained section to
>> begin. One of these place is in another file: in nbd_read_eof() in
>> nbd/client.c.
>>
>> We also cancel reconnect and requests waiting for reconnect on drained
>> begin which is not correct. And this patch fixes that.
>>
>> Let's finally drop this always running coroutine and go another way:
>> do both reconnect and receiving in request coroutines.
>>
>> The detailed list of changes below (in the sequence of diff hunks).
> 
> Well, depending on the git order file in use ;)
> 
>>
>> 1. receiving coroutines are woken directly from nbd_channel_error, when
>>     we change s->state
>>
>> 2. nbd_co_establish_connection_cancel(): we don't have drain_begin now,
>>     and in nbd_teardown_connection() all requests should already be
>>     finished (and reconnect is done from request). So
>>     nbd_co_establish_connection_cancel() is called from
>>     nbd_cancel_in_flight() (to cancel the request that is doing
>>     nbd_co_establish_connection()) and from reconnect_delay_timer_cb()
>>     (previously we didn't need it, as reconnect delay only should cancel
>>     active requests not the reconnection itself. But now reconnection
> 
> Missing )
> 
>>     itself is done in the separate thread (we now call
>>     nbd_client_connection_enable_retry() in nbd_open()), and we need to
>>     cancel the requests that waits in nbd_co_establish_connection()
> 
> Singular/plural disagreement. I think the intended meaning is
> 'requests that wait' and not 'request that waits'.
> 
>>     now).
>>
>> 2. We do receive headers in request coroutine. But we also should
> 
> Second point 2; I'll call it 2A below, because it looks related to
> point 8.

Ohh. OK.

> 
>>     dispatch replies for another pending requests. So,
> 
> s/another/other/
> 
>>     nbd_connection_entry() is turned into nbd_receive_replies(), which
>>     does reply dispatching until it receive another request headers, and
> 
> s/until/while/, s/another/other/
> 
>>     returns when it receive the requested header.
> 
> receives
> 
>>
>> 3. All old staff around drained sections and context switch is dropped.
>>     In details:
>>     - we don't need to move connection_co to new aio context, as we
>>       don't have connection_co anymore
>>     - we don't have a fake "request" of connection_co (extra increasing
>>       in_flight), so don't care with it in drain_begin/end
>>     - we don't stop reconnection during drained section anymore. This
>>       means that drain_begin may wait for a long time (up to
>>       reconnect_delay). But that's an improvement and more correct
>>       behavior see below[*]
>>
>> 4. In nbd_teardown_connection() we don't have to wait for
>>     connection_co, as it is dropped. And cleanup for s->ioc and nbd_yank
>>     is moved here from removed connection_co.
>>
>> 5. In nbd_co_do_establish_connection() we now should handle
>>     NBD_CLIENT_CONNECTING_NOWAIT: if new request comes when we are in
>>     NBD_CLIENT_CONNECTING_NOWAIT, it still should call
>>     nbd_co_establish_connection() (who knows, maybe connection already
>>     established by thread in background). But we shouldn't wait: if
> 
> maybe the connection was already established by another thread in the background

"another thread" sounds vague. I think better: by connection thread.

> 
>>     nbd_co_establish_connection() can't return new channel immediately
>>     the request should fail (we are in NBD_CLIENT_CONNECTING_NOWAIT
>>     state).
>>
>> 6. nbd_reconnect_attempt() is simplified: it's now easier to wait for
>>     other requests in the caller, so here we just assert that fact.
>>     Also delay time is now initialized here: we can easily detect first
>>     attempt and start a timer.
>>
>> 7. nbd_co_reconnect_loop() is dropped, we don't need it. Reconnect
>>     retries are fully handle by thread (nbd/client-connection.c), delay
>>     timer we initialize in nbd_reconnect_attempt(), we don't have to
>>     bother with s->drained and friends. nbd_reconnect_attempt() now
>>     called from nbd_co_send_request().
> 
> A lot going on there, but it's making sense so far.
> 
>>
>> 8. nbd_connection_entry is dropped: reconnect is now handled by
>>     nbd_co_send_request(), receiving reply is now handled by
>>     nbd_receive_replies(): all handled from request coroutines.
>>
>> 9. So, welcome new nbd_receive_replies() called from request coroutine,
>>     that receives reply header instead of nbd_connection_entry().
>>     Like with sending requests, only one coroutine may receive in a
>>     moment. So we introduce receive_mutex, which is locked around
>>     nbd_receive_reply(). It also protects some related fields. Still,
>>     full audit of thread-safety in nbd driver is a separate task.
> 
> It sounds like you're more worried about auditing for which locks are
> held longer than necessary, rather than expecting to find cases where
> we aren't thread-safe because we are lacking locks?  At any rate, as
> this patch is already easier to reason about, I'm okay deferring that
> audit to later patches.

I just try to not interduce new not-threadsafe things. But I'm not sure do we have a good kind of threadsafety in nbd driver code now.

> 
>>     New function waits for a reply with specified handle being received
>>     and works rather simple:
>>
>>     Under mutex:
>>       - if current handle is 0, do receive by hand. If another handle
>>         received - switch to other request coroutine, release mutex and
>>         yield. Otherwise return success
>>       - if current handle == requested handle, we are done
>>       - otherwise, release mutex and yield
>>
>> 10: in nbd_co_send_request() we now do nbd_reconnect_attempt() if
>>      needed. Also waiting in free_sema queue we now wait for one of two
>>      conditions:
>>      - connectED, in_flight < MAX_NBD_REQUESTS (so we can start new one)
>>      - connectING, in_flight == 0, so we can call
>>        nbd_reconnect_attempt()
>>      And this logic is protected by s->send_mutex
>>
>>      Also, on failure we don't have to care of removed s->connection_co
>>
>> 11. nbd_co_do_receive_one_chunk(): now instead of yield() and wait for
>>      s->connection_co we just call new nbd_receive_replies().
>>
>> 12. nbd_co_receive_one_chunk(): place where s->reply.handle becomes 0,
>>      which means that handling of the whole reply is finished. Here we
>>      need to wake one of coroutines sleeping in nbd_receive_replies().
>>      If now one sleeps - do nothing. That's another behavior change: we
> 
> s/now one sleeps/none are sleeping/
> 
>>      don't have endless recv() in the idle time. It may be considered as
>>      a drawback. If so, it may be fixed later.
> 
> The case where no coroutine is waiting to receive a reply should only
> happen due to a malicious server (a compliant server will only send
> replies matching an existing pending request).

With new code, when we don't have any in-flight requests - there are no waiting coroutines as well.
And nobody will note if connection silently get lost.

With old code, we always have recv() call called from connection_co, so we should catch disconnects (at least some kinds of disconnects or if keep-alive is set up properly) sooner and start reconnection procedure.

> 
>>
>> 13. nbd_reply_chunk_iter_receive(): don't care about removed
>>      connection_co, just ping in_flight waiters.
>>
>> 14. Don't create connection_co, enable retry in the connection thread
>>      (we don't have own reconnect loop anymore)
>>
>> 15. We need now nbd_co_establish_connection_cancel() call in
>>      nbd_cancel_in_flight(), to cancel the request that doing connection
>>      attempt.
> 
> s/need now/now need to add a/
> s/request that doing/request that is doing a/
> 
>>
>> [*], ok, now we don't cancel reconnect on drain begin. That's correct:
>>      reconnect feature leads to possibility of long-running requests (up
>>      to reconnect delay). Still, drain begin is not a reason to kill
>>      long requests. We should wait for them.
>>
>>      This also means, that we can again reproduce a dead-lock, described
>>      in 8c517de24a8a1dcbeb54e7e12b5b0fda42a90ace.
>>      Why we are OK with it:
>>      1. Now this is not absolutely-dead dead-lock: the vm is unfrozen
>>         after reconnect delay. Actually 8c517de24a8a1dc fixed a bug in
>>         NBD logic, that was not described in 8c517de24a8a1dc and led to
>>         forever dead-lock. The problem was that nobody woken free_sema
> 
> s/woken/woke the/
> 
>>         queue, but drain_begin can't finish until there is a request in
>>         free_sema queue. Now we have a reconnect delay timer that works
>>         well.
>>      2. It's not a problem of NBD driver, it's a problem of ide code,
>>         that does drain_begin under global mutex
> 
> I agree that this point means that it is appropriate to address that
> in a separate patch series.  Hopefully someone tackles it before 6.2,
> but even if not, I agree that the worst that happens is that we have a
> command stalled waiting on a long timeout, rather than actual
> deadlock.
> 
>>      3. That doesn't reproduce if chose scsi instead of ide.
> 
> Seems like this sentence fragment fits better as the tail of 2, rather
> than as a separate bullet 3?  I'll reword as:
> 
> ...it's a problem of the ide code, because it does drain_begin under
> the global mutex; the problem doesn't reproduce when using scsi
> instead of ide.

Sounds good

> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---

[..]

> 
> Verdict: I found some typos/grammar fixes, but I think I can touch
> those up.  I'm now hammering on the patches in my NBD tree, and
> barring any surprises, this will be in my next pull request Monday at
> the latest.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

Thanks a lot for reviewing, and time spent to understand and fix my English )

-- 
Best regards,
Vladimir

