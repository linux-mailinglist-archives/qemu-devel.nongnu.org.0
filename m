Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC043FBE7F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:47:26 +0200 (CEST)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKp7l-0006CT-M7
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mKozN-0001En-9i
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:38:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mKozJ-0002AQ-3S
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:38:44 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id ABC3740798;
 Tue, 31 Aug 2021 00:38:37 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 13F6F7D;
 Tue, 31 Aug 2021 00:38:38 +0300 (MSK)
Subject: Re: [PATCH] util: fix abstract socket path copy
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <12894fce-38cd-8d29-9c2b-fc2d8f73a42f@msgid.tls.msk.ru>
Date: Tue, 31 Aug 2021 00:38:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210719130112.932069-1-marcandre.lureau@redhat.com>
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

19.07.2021 16:01, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Commit 776b97d360 "qemu-sockets: add abstract UNIX domain socket
> support" neglected to update socket_sockaddr_to_address_unix() and
> copied the whole sun_path without taking "salen" into account.
> 
> Later, commit 3b14b4ec49 "sockets: Fix socket_sockaddr_to_address_unix()
> for abstract sockets" handled the abstract UNIX path, by stripping the
> leading \0 character and fixing address details, but didn't use salen
> either.
> 
> Not taking "salen" into account may result in incorrect "path" being
> returned in monitors commands, as we read past the address which is not
> necessarily \0-terminated.
> 
> Fixes: 776b97d3605ed0fc94443048fdf988c7725e38a9
> Fixes: 3b14b4ec49a801067da19d6b8469eb1c1911c020
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   util/qemu-sockets.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 080a240b74..f2f3676d1f 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,13 +1345,16 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>       SocketAddress *addr;
>       struct sockaddr_un *su = (struct sockaddr_un *)sa;
>   
> +    assert(salen >= sizeof(su->sun_family) + 1 &&
> +           salen <= sizeof(struct sockaddr_un));
> +

This seems to be wrong and causes this assert in the existing qemu code to fire up.
I can't say for *sure* but it *seems* the issue is the trailing null terminator
in the case of abstract sockets on linux where the path name is exactly equal
to 108 bytes (including the leading \0).

The prob seems to be that socket_local_address() initially allocates
sockaddr_storage bytes for the getsockname() call - which is larger
than sizeof(sockaddr_un). So the kernel is able to add the zero terminator,
and return 111 bytes in salen, not 110 as the size of sockaddr_un.
And later on the above assert will fire up..

We have a bug in debian about this very issue:
http://bugs.debian.org/993145

The fix is a bit more complex than adding a +1 to the sizeof in the last
condition of the assert...

Thanks,

/mjt

>       addr = g_new0(SocketAddress, 1);
>       addr->type = SOCKET_ADDRESS_TYPE_UNIX;
>   #ifdef CONFIG_LINUX
>       if (!su->sun_path[0]) {
>           /* Linux abstract socket */
>           addr->u.q_unix.path = g_strndup(su->sun_path + 1,
> -                                        sizeof(su->sun_path) - 1);
> +                                        salen - sizeof(su->sun_family) - 1);
>           addr->u.q_unix.has_abstract = true;
>           addr->u.q_unix.abstract = true;
>           addr->u.q_unix.has_tight = true;
> 


