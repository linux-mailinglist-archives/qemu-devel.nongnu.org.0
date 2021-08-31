Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4F83FCC41
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:23:31 +0200 (CEST)
Received: from localhost ([::1]:53202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7Tl-00059y-Cf
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mL7Nr-0000TE-AV; Tue, 31 Aug 2021 13:17:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mL7Np-0001a8-EU; Tue, 31 Aug 2021 13:17:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B660040835;
 Tue, 31 Aug 2021 20:17:09 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 9417671;
 Tue, 31 Aug 2021 20:17:09 +0300 (MSK)
Subject: Re: qemu-sockets: account for trailing \0 byte in unix socket pathname
To: qemu-devel@nongnu.org
References: <20210830225449.1509719-1-mjt@msgid.tls.msk.ru>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <c5887473-1df2-5827-e9c7-e6f0470ab332@msgid.tls.msk.ru>
Date: Tue, 31 Aug 2021 20:17:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210830225449.1509719-1-mjt@msgid.tls.msk.ru>
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

31.08.2021 01:54, Michael Tokarev wrote:
> Linux kernel can return size of af_unix socket to be
> one byte larger than sockaddr_un structure - adding
> the trailing zero byte.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)
> Cc: qemu-stable@nongnu.org
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index f2f3676d1f..83926dc2bc 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>       SocketAddress *addr;
>       struct sockaddr_un *su = (struct sockaddr_un *)sa;
>   
> +    /* kernel might have added \0 terminator to non-abstract socket */
>       assert(salen >= sizeof(su->sun_family) + 1 &&
> -           salen <= sizeof(struct sockaddr_un));
> +           salen <= sizeof(struct sockaddr_un) + su->sun_path[0] ? 1 : 0);
>   
>       addr = g_new0(SocketAddress, 1);
>       addr->type = SOCKET_ADDRESS_TYPE_UNIX;

Actually, this is not sufficient.

While this change fixes one issue (the famous trailing null byte \0),
the actual assertion failure occurs because salen = 2, ie, too SMALL,
not too large.

So it looks like libvirt provides an unnamed socket there, --
maybe from a socketpair(2)?

Hwell..

/mjt

