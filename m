Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE4C3FBEE2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:15:09 +0200 (CEST)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpYa-0006yQ-Hu
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mKpQA-0001vW-Vj
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:06:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mKpQ9-0002tq-2N
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:06:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 970DC40798;
 Tue, 31 Aug 2021 01:06:21 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id F01707D;
 Tue, 31 Aug 2021 01:06:21 +0300 (MSK)
Subject: Re: [PATCH] util: fix abstract socket path copy
From: Michael Tokarev <mjt@tls.msk.ru>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
 <12894fce-38cd-8d29-9c2b-fc2d8f73a42f@msgid.tls.msk.ru>
Message-ID: <1706f18b-d6e3-e88c-ac12-decdfbd7d9b2@msgid.tls.msk.ru>
Date: Tue, 31 Aug 2021 01:06:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <12894fce-38cd-8d29-9c2b-fc2d8f73a42f@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: zxq_yx_007@163.com, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

31.08.2021 00:38, Michael Tokarev wrote:
...
>> @@ -1345,13 +1345,16 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>>       SocketAddress *addr;
>>       struct sockaddr_un *su = (struct sockaddr_un *)sa;
>> +    assert(salen >= sizeof(su->sun_family) + 1 &&
>> +           salen <= sizeof(struct sockaddr_un));
>> +
> 
> This seems to be wrong and causes this assert in the existing qemu code to fire up.
> I can't say for *sure* but it *seems* the issue is the trailing null terminator
> in the case of abstract sockets on linux where the path name is exactly equal
> to 108 bytes (including the leading \0).
> 
> The prob seems to be that socket_local_address() initially allocates
> sockaddr_storage bytes for the getsockname() call - which is larger
> than sizeof(sockaddr_un). So the kernel is able to add the zero terminator,
> and return 111 bytes in salen, not 110 as the size of sockaddr_un.
> And later on the above assert will fire up..

Here's the linux kernel code:

net/unix/af_unix.c
tatic int unix_mkname(struct sockaddr_un *sunaddr, int len, unsigned int *hashp)
{
         *hashp = 0;

         if (len <= sizeof(short) || len > sizeof(*sunaddr))
                 return -EINVAL;
         if (!sunaddr || sunaddr->sun_family != AF_UNIX)
                 return -EINVAL;
         if (sunaddr->sun_path[0]) {
                 /*
                  * This may look like an off by one error but it is a bit more
                  * subtle. 108 is the longest valid AF_UNIX path for a binding.
                  * sun_path[108] doesn't as such exist.  However in kernel space
                  * we are guaranteed that it is a valid memory location in our
                  * kernel address buffer.
                  */
                 ((char *)sunaddr)[len] = 0;
                 len = strlen(sunaddr->sun_path)+1+sizeof(short);
                 return len;
         }
..

Suppose we have sun_path of exactly 108 chars (not counting the trailing
zero terminator), so the total length of the sockaddr is 110 bytes.

After the len = recalculation above, it will be 111 bytes -
  strlen(sun_path)=108 + 1 + sizeof(short)=2 = 111.

And this is the value used to be returned in the getsockname/getpeername
calls.

So this has nothing to do with socket being abstract or not. We asked for
larger storage for the sockaddr structure, and the kernel was able to build
one for us, including the trailing \0 byte. Currently kernel will only
return +1 byte for non-abstract sockets, but this is an implementation
detail. We asked for it. So we - I think - should account for this +1
byte here.

/mjt

