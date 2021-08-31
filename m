Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277363FC54E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 12:24:30 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL0wE-0008Ny-Gc
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 06:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mL0q1-0006dF-1w
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 06:17:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mL0pz-0000wv-1b
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 06:17:52 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4826C40838;
 Tue, 31 Aug 2021 13:17:46 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 9982123D;
 Tue, 31 Aug 2021 13:17:46 +0300 (MSK)
Subject: Re: [PATCH] util: fix abstract socket path copy
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
 <12894fce-38cd-8d29-9c2b-fc2d8f73a42f@msgid.tls.msk.ru>
 <1706f18b-d6e3-e88c-ac12-decdfbd7d9b2@msgid.tls.msk.ru>
 <6dd4a9d9-c264-a747-0fb5-2d470f19ad16@msgid.tls.msk.ru>
 <CAFEAcA-XyxFpVD--uO9QzVWirYb7RE=OoAewueFy1AN0zyz++Q@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <314d03f8-1270-e146-3806-74752fe970f5@msgid.tls.msk.ru>
Date: Tue, 31 Aug 2021 13:17:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-XyxFpVD--uO9QzVWirYb7RE=OoAewueFy1AN0zyz++Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

31.08.2021 12:53, Peter Maydell wrote:
> On Mon, 30 Aug 2021 at 23:30, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>
>> 31.08.2021 01:06, Michael Tokarev wrote:
>> ...
>>> And this is the value used to be returned in the getsockname/getpeername
>>> calls.
>>>
>>> So this has nothing to do with socket being abstract or not. We asked for
>>> larger storage for the sockaddr structure, and the kernel was able to build
>>> one for us, including the trailing \0 byte.
> 
>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> index f2f3676d1f..83926dc2bc 100644
>> --- a/util/qemu-sockets.c
>> +++ b/util/qemu-sockets.c
>> @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>>        SocketAddress *addr;
>>        struct sockaddr_un *su = (struct sockaddr_un *)sa;
>>
>> +    /* kernel might have added \0 terminator to non-abstract socket */
>>        assert(salen >= sizeof(su->sun_family) + 1 &&
>> -           salen <= sizeof(struct sockaddr_un));
>> +           salen <= sizeof(struct sockaddr_un) + su->sun_path[0] ? 1 : 0);
> 
> Q: Why are we imposing an upper limit on salen anyway?
> We need the lower limit because salen is supposed to include
> the whole of the 'struct sockaddr_un' and we assume that.
> But what's the upper limit here protecting?

It is not about protection really, it is about correctness.
This is actually a grey area. This single trailing \0 byte
depends on the implementation. Please read man 7 unix -
especially the "Pathname sockets" and BUGS sections.


> Q2: why does our required upper limit change depending on whether
> there happens to be a string in the sun_path array or not ?

Because for abstract sockets (the ones whos name starts with \0
byte) the sun_path is treated as a blob of given length, without
the additional trailing \0, and neither the kernel nor userspace
is trying to add the terminator, while for pathname sockets this
is not the case and someone has to add the trailing \0 somewhere.

> Q3: when we copy the sun_path, why do we skip the first character?
> 
>          addr->u.q_unix.path = g_strndup(su->sun_path + 1,
>                                          salen - sizeof(su->sun_family) - 1);

Because this is the case of abstract socket. Actual name is a blob
starting from the sun_path+1. I dunno if this is correct to use
g_strndup there - will it terminate at first \0 encountered or not,
but this is another question. The difference between this place
and regular pathname socket below is this: addr->u.q_unix.abstract = true;

We have the issue only whith regular traditional unix pathname sockets
whose name is exactly 108 bytes long.  I provided the code from
the kernel in another thread showing how it increases the len by
one in this case and returns it in getsockname() if userspace
provided enough room.

/mjt

