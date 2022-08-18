Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1365982CC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 13:59:34 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOeBR-0007G6-84
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 07:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oOe3R-0000Xg-5x
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 07:51:17 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:46274
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oOe3N-0007Uw-TA
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 07:51:16 -0400
HMM_SOURCE_IP: 172.18.0.48:43546.589888453
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id A5E072800DC;
 Thu, 18 Aug 2022 19:50:55 +0800 (CST)
X-189-SAVE-TO-SEND: tugy@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 770ece916c804cff905ec32c996657a6 for
 peter.maydell@linaro.org; Thu, 18 Aug 2022 19:50:58 CST
X-Transaction-ID: 770ece916c804cff905ec32c996657a6
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <d6a583c6-f20f-f2c7-2c18-b199911208fb@chinatelecom.cn>
Date: Thu, 18 Aug 2022 19:50:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] osdeps: Introduce qemu_socketpair()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: f4bug@amsat.org, marcandre.lureau@redhat.com, qemu_oss@crudebyte.com,
 richard.henderson@linaro.org, berrange@redhat.com, mst@redhat.com,
 kraxel@redhat.com, qemu-devel@nongnu.org
References: <cover.1660303075.git.tugy@chinatelecom.cn>
 <211833676831b86d70af12df9912aa971d46092b.1660303075.git.tugy@chinatelecom.cn>
 <CAFEAcA-So11YhE=P2Xb2FXG4-dbG_gq2eg60O9q=ejh+bBC4NA@mail.gmail.com>
From: Guoyi Tu <tugy@chinatelecom.cn>
In-Reply-To: <CAFEAcA-So11YhE=P2Xb2FXG4-dbG_gq2eg60O9q=ejh+bBC4NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.228; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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



On 8/12/22 19:49, Peter Maydell wrote:
> On Fri, 12 Aug 2022 at 12:44, <tugy@chinatelecom.cn> wrote:
>>
>> From: Guoyi Tu <tugy@chinatelecom.cn>
>>
>> qemu_socketpair() will create a pair of connected sockets
>> with FD_CLOEXEC set
>>
>> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
>> ---
>>   include/qemu/sockets.h |  3 +++
>>   util/osdep.c           | 24 ++++++++++++++++++++++++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
>> index 038faa157f..52cf2855df 100644
>> --- a/include/qemu/sockets.h
>> +++ b/include/qemu/sockets.h
>> @@ -14,6 +14,9 @@ int inet_aton(const char *cp, struct in_addr *ia);
>>   /* misc helpers */
>>   bool fd_is_socket(int fd);
>>   int qemu_socket(int domain, int type, int protocol);
>> +#ifndef WIN32
>> +int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
> 
> Any new function declaration in a header file needs a
> doc-comment documenting what it does, please.

OK, I'll add some comments

>> +#endif
>>   int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
>>   int socket_set_cork(int fd, int v);
>>   int socket_set_nodelay(int fd);
>> diff --git a/util/osdep.c b/util/osdep.c
>> index 60fcbbaebe..4b1ab623c7 100644
>> --- a/util/osdep.c
>> +++ b/util/osdep.c
>> @@ -481,6 +481,30 @@ int qemu_socket(int domain, int type, int protocol)
>>       return ret;
>>   }
>>
>> +#ifndef _WIN32
> 
> If this function only exists and is usable on posix
> hosts, put it in util/oslib-posix.c rather than having
> it here with a win32 ifdef.
> 
will do

Thanks.

> thanks
> -- PMM
> 

