Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88BE30DD2C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:47:42 +0100 (CET)
Received: from localhost ([::1]:47330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JRV-0004d9-Le
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7JOd-00036w-Sw; Wed, 03 Feb 2021 09:44:43 -0500
Received: from mail-eopbgr140132.outbound.protection.outlook.com
 ([40.107.14.132]:7172 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7JOa-0001Q9-Gf; Wed, 03 Feb 2021 09:44:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlqQHfLwNAEm+IH99of4qEvY2b743h38lLxUCctEcblL2upYiREifk53WgYjANl8HR8Rg1sRSbDpFeKW0aZ6z0XHno1/BYGn9CFMWA0vAzpGLWn6jEDuppWchNnFNCsXqWhxF/cagq0fQFX+o5l7tXadTySGPlPMS8XB7L/vE8EVnFAmkyymmnAcfgEteVaq+65PL3Tq+VG24Sj2hbBTQB+T+HyZ4KJ8TUoHT+g+kzm1GzQaFU9TpUeEBI3Fme4fard7fIYCbT9736m1OmLOknj5c8VQyjMoSuzfqGxlBkHVcYZGwC4qMHnvba1Pa3/dtoeA/3Q6kx8qSmczjBnJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ju2XCYNwDSfZbfWRwb7hJeMsalsmb1qahLaL2iiKj3E=;
 b=UIxkMavV8x5JmZnWRRYY51TLG3WVBetfRx5/BMzcTqLkqqZHzUIGvlej718Eb+ZySrSYT6L6EOlHvRu5ueTrR3AQ+uL5hH1Z5YX0C/Q/9giiKuBlGaMTvme7+iUXigkulUMeAxEogBteZ2gnqNVMiz1CTOe6GEk4N2GiE+ku88tkiTbIBQuDM5FXmZkhlW5GnFyOTOQDP+MxvKFzurej7QSfSrYZv//wkiSPJKjwGSVFVLOEot1AqVJhawQ90T29UdAqdatL2a3TuBZifcE0vS+MhFFl3DYNUCcWHWKqOUVOMApcKY//f8KDLe/Sdsd/mJqG+Sxr7xI9iwYE/Ufs2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ju2XCYNwDSfZbfWRwb7hJeMsalsmb1qahLaL2iiKj3E=;
 b=JVu1YHajyNm/kl/8jmaRWE4itFC34q+clpm8IwwLEULgB5g3QQHih1jwkqfRWomVdCgtCs1lNkb7Y9SlYpyJ6G7/V0H8hdNUBzAhfKqHhxtcujQJqMbsPCenTimqA9HAqAjpv84IycFVpwHfzYJVyoMl52YHE+bApYamyu4uEj8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6357.eurprd08.prod.outlook.com (2603:10a6:20b:31b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Wed, 3 Feb
 2021 14:44:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Wed, 3 Feb 2021
 14:44:36 +0000
Subject: Re: [PATCH 1/4] block/nbd: fix drain dead-lock because of nbd
 reconnect-delay
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, den@openvz.org
References: <20200903190301.367620-1-vsementsov@virtuozzo.com>
 <20200903190301.367620-2-vsementsov@virtuozzo.com>
 <20210203105305.GA113539@rvkaganb.lan>
 <903d9c6f-b6ed-cff7-b2d3-29945165f6d0@virtuozzo.com>
 <20210203142140.GD2786@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e4387e05-4963-e335-3002-ddbbcf5aaf82@virtuozzo.com>
Date: Wed, 3 Feb 2021 17:44:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203142140.GD2786@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM4PR07CA0034.eurprd07.prod.outlook.com
 (2603:10a6:205:1::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM4PR07CA0034.eurprd07.prod.outlook.com (2603:10a6:205:1::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Wed, 3 Feb 2021 14:44:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 214cb53d-5c83-47fa-3e29-08d8c8523a36
X-MS-TrafficTypeDiagnostic: AS8PR08MB6357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63579019309C9A4B81F7BFCAC1B49@AS8PR08MB6357.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2eG1aJYEDxvsWKmOsFWXEQ07OyOPFa+m6MmFuT7IjjjE17Z0LhFY0iVW9Rob2/u/5MbI4bRt+c7hr2Xv3MTYQzPB1EPIh3hDbWj7Bunp16u3TMfwa7nBrFovcpCcXk3hBoREnOG70AovVY61S1yYajGxVxBmFWS293hUSfeSwoICJziANPmLlP6aaAcbWhInJSPRgtbhidAzjvwAuO0UxpqD0uqJ7L6Qu8t+PfYq3DR4fBFMnD12ZjZBEqwhpWZn8dvylSaIuGImhtJyeKd4z6tcxFQxlizBIAjKxcQEWpCYeXU9SNjQDxPKhG3C+jpn4CWAxYGTj861D3Q7Xh0JsJmAl9TCTD+EOx3yGUtYvRy51dwIX5ON8EQNw8HrWZDnqVYIt/97blBN7sVSHf41m6+cy+v95nSqoxpVkgXmvGMzwiA0grlfbi0VyWbxjqHHuozM24XBXAcjgH0GE7ukh+j0xwRYwAcalVMmh+I/27a5GHEYLykrUnRh+FlDVYvFJHNxLAb2i5RknTihQFhGgyDKY3pYbTEY+uF+PqxTuQDqRAMatV7Q1d8mGrK8juAiAcpf4c8a/rblj3qgufF2QPJfNTgjMuxdzJJev6pRqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(956004)(66946007)(2616005)(16526019)(26005)(36756003)(31696002)(16576012)(8676002)(31686004)(8936002)(66476007)(66556008)(52116002)(2906002)(83380400001)(498600001)(86362001)(186003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cWZnaFVNTk5TSldyMW9aU1VCNlhETWdxdnY3cjVRRTRaVXFwU0Y4Umg0dEZD?=
 =?utf-8?B?ckN2R1BSRlhKUXBJQ21UdW1JOTYyanZWWFgzYUFNT0lreERkNnJORnNpUjMr?=
 =?utf-8?B?b1lQL0F3L3d3WmYvSE1sUmE5RjloNkkzZ25TWENOdkdvb0h4Q294WXIrMlR3?=
 =?utf-8?B?OVhEUXFadm4yLzlMM2dNVkx2L2FibGxybHRMSks4U3RWeW5ydzZ4N3FYNDlR?=
 =?utf-8?B?V1dEV1pTRjhsdm5HTVRPdjZRZUR1cVBWd0pYcExpZnhmMWw0c0lhZXBoSm80?=
 =?utf-8?B?MG4xWUl0S1hwWHFTZy9HYUFrUmxWMTN1VVdjc0s4dkJ0eXRRVFdHOXJBODFR?=
 =?utf-8?B?MDZlbCtmaHNXMVpjYlNVeFpmRGZOaWx3dEt5MnVXb2h5NTNxZ0VvMG5CdGJa?=
 =?utf-8?B?WDdsUXFZYkRWajYxR0ZjMEE3VDQ0eElBODZaa29mbkVlcElZZTR6NmNqUEUw?=
 =?utf-8?B?VCtqclVSbWZaUHZqMUxUSVd2MlRwQUlYbVlPT1lGTDNGOEhhWDhOR21vNFA4?=
 =?utf-8?B?cTUrU1dkQ2JSdkpyQmhrcEN5dnJJemdkUm5hNUIxS0U2czRSOUcyTmcrVDk2?=
 =?utf-8?B?RG1pSDU5cmtRd3BiNjRkbmgwd1NHUGJUbTZWelJNMjVETStBTHZva0QwOTMx?=
 =?utf-8?B?MU12K0dtTkU5bXNlK3lRb0p4c1ZVaEVuNXI2YUJZbVJBaG41U0dCdHlualA3?=
 =?utf-8?B?WDI5V1BMMDV1TkoxWG4ydjgwbldDMkJTNlJyZy9TQ3VETm5oY2kzaitsc09a?=
 =?utf-8?B?bWRqaVhJZU1xeERRc2t6bDhxLytocmdWVUVlL0lXUEdJbGNhdVB6NzhJdngz?=
 =?utf-8?B?N3ZZaFFKcTdCam5zck9TSEFrdVl0MHVZQnhIL2QwTzIvNzBOdEM1RkpDSWJF?=
 =?utf-8?B?OUQyWUFPYTBlOVBaYXc1WXBNVStnNit2RUp6N0M4WlVLeHFwdzBzL2pWd0cx?=
 =?utf-8?B?azlyaVNTc1NGWUprb3pHMXQ5dklGQmJaZjJWcitramkwdklpT1BoajJQSEVs?=
 =?utf-8?B?UUZNSGt2YzVsTnlJbkJHVm4wRWliRGx6NkVJejQwcEFxK1ZvbHQwTEZ3TlJT?=
 =?utf-8?B?c1JOQ3VKQjlOcEJXbHRYck5JbXZCQ2w2bTA1NmZEQWFLNjBHbGNJSlJ0eHlF?=
 =?utf-8?B?bVgzajNzYVRjbGVJcUxSMnBWdmhPYUlZS2xDYmYwK0U3SDZIbFQxeVQzRGZN?=
 =?utf-8?B?bEtXNkN6SFVnVXZpekpOL3diT2ZDUUNNc2FFL01zcktEZ01TVW5KbUlHVWlB?=
 =?utf-8?B?TXo2SDdIaFozS1daTlhOMXlHekw0dExZaWNsSlZIbGJJVHEzOS9zV0I0UFVq?=
 =?utf-8?B?ZEVTTk56K1d4bE9yKzhoTm5UKzJLOVplczdRczdtMFF1SXRibUdJc2dWTnEy?=
 =?utf-8?B?dnJnaVdaNGk4NEU5NkdCYyt6Z2RYOXBPalRVdjRWN1VSREpzUkFEdEkrV3pq?=
 =?utf-8?B?M3R2WEZwVWlnNDFSdzNBak5OQ2Y3Ny9STkE3Qk5BPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214cb53d-5c83-47fa-3e29-08d8c8523a36
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 14:44:36.3596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNUmH98LJozFcnQv5slgKvtxXuPTGQPnVp7XZ/997uWcWDoSwpYR5nqURQzuMsonJVCnuC0ta2klu/UnRDOHoeeuS7+vH14qswqmenSOUVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6357
Received-SPF: pass client-ip=40.107.14.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7,
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

03.02.2021 17:21, Roman Kagan wrote:
> On Wed, Feb 03, 2021 at 04:10:41PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 03.02.2021 13:53, Roman Kagan wrote:
>>> On Thu, Sep 03, 2020 at 10:02:58PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> We pause reconnect process during drained section. So, if we have some
>>>> requests, waiting for reconnect we should cancel them, otherwise they
>>>> deadlock the drained section.
>>>>
>>>> How to reproduce:
>>>>
>>>> 1. Create an image:
>>>>      qemu-img create -f qcow2 xx 100M
>>>>
>>>> 2. Start NBD server:
>>>>      qemu-nbd xx
>>>>
>>>> 3. Start vm with second nbd disk on node2, like this:
>>>>
>>>>     ./build/x86_64-softmmu/qemu-system-x86_64 -nodefaults -drive \
>>>>        file=/work/images/cent7.qcow2 -drive \
>>>>        driver=nbd,server.type=inet,server.host=192.168.100.5,server.port=10809,reconnect-delay=60 \
>>>>        -vnc :0 -m 2G -enable-kvm -vga std
>>>>
>>>> 4. Access the vm through vnc (or some other way?), and check that NBD
>>>>      drive works:
>>>>
>>>>      dd if=/dev/sdb of=/dev/null bs=1M count=10
>>>>
>>>>      - the command should succeed.
>>>>
>>>> 5. Now, kill the nbd server, and run dd in the guest again:
>>>>
>>>>      dd if=/dev/sdb of=/dev/null bs=1M count=10
>>>>
>>>> Now Qemu is trying to reconnect, and dd-generated requests are waiting
>>>> for the connection (they will wait up to 60 seconds (see
>>>> reconnect-delay option above) and than fail). But suddenly, vm may
>>>> totally hang in the deadlock. You may need to increase reconnect-delay
>>>> period to catch the dead-lock.
>>>>
>>>> VM doesn't respond because drain dead-lock happens in cpu thread with
>>>> global mutex taken. That's not good thing by itself and is not fixed
>>>> by this commit (true way is using iothreads). Still this commit fixes
>>>> drain dead-lock itself.
>>>>
>>>> Note: probably, we can instead continue to reconnect during drained
>>>> section. To achieve this, we may move negotiation to the connect thread
>>>> to make it independent of bs aio context. But expanding drained section
>>>> doesn't seem good anyway. So, let's now fix the bug the simplest way.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    block/nbd.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/block/nbd.c b/block/nbd.c
>>>> index 9daf003bea..912ea27be7 100644
>>>> --- a/block/nbd.c
>>>> +++ b/block/nbd.c
>>>> @@ -242,6 +242,11 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
>>>>        }
>>>>        nbd_co_establish_connection_cancel(bs, false);
>>>> +
>>>> +    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
>>>> +        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
>>>> +        qemu_co_queue_restart_all(&s->free_sema);
>>>> +    }
>>>>    }
>>>>    static void coroutine_fn nbd_client_co_drain_end(BlockDriverState *bs)
>>>
>>> This basically defeats the whole purpose of reconnect: if the nbd client
>>> is trying to reconnect, drain effectively cancels that and makes all
>>> in-flight requests to complete with an error.
>>>
>>> I'm not suggesting to revert this patch (it's now in the tree as commit
>>> 8c517de24a), because the deadlock is no better, but I'm afraid the only
>>> real fix is to implement reconnect during the drain section.  I'm still
>>> trying to get my head around it so no patch yet, but I just wanted to
>>> bring this up in case anybody beats me to it.
>>>
>>
>>
>> What do you mean by "reconnect during drained section"? Trying to
>> establish the connection? Or keeping in-flight requests instead of
>> cancelling them? We can't keep in-flight requests during drained
>> section, as it's the whole sense of drained-section: no in-flight
>> requests. So we'll have to wait for them at drain_begin (waiting up to
>> reconnect-delay, which doesn't seem good and triggers dead-lock for
>> non-iothread environment) or just cancel them..
>>
>> Do you argue that waiting on drained-begin is somehow better than
>> cancelling?
> 
> Sorry I should have used more accurate wording to be clear.
> 
> Yes, my point is that canceling the requests on entry to a drained
> section is incorrect.  And no, it doesn't matter if it can be long:
> that's the price you pay for doing the drain.  Think of reconnect as a
> special case of a slow connection: if an nbd reply from the server is
> delayed for whatever reason without dropping the connection, you have to
> wait here, too.  (In fact, reconnect is even slightly better here since
> it has a configurable finite timeout while the message delay does not
> AFAIK.)
> 
> Does it make sense?

Hmm, yes..

But then we should fix the original deadlock some other way.. Probably it will
be possible only by using iothread for nbd node (I failed to find original
thread where someone said that iothreads is a solution). And than we can do cancel
in nbd_client_co_drain_begin() only if bs doesn't have a separate iothread.

> 
>> Or, the problem is that after drained section (assume it was short) we
>> are in NBD_CLIENT_CONNECTING_NOWAIT ?  Fixing it should be simple
>> enough, we just need to check the time at drained_end and if the delay
>> is not expired enable NBD_CLIENT_CONNECTING_WAIT agaub,,
> 
> Hmm, I didn't get thus far but this is probably an issue too.
> 
> Thanks,
> Roman.
> 


-- 
Best regards,
Vladimir

