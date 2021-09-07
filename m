Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D8E402A4D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:58:45 +0200 (CEST)
Received: from localhost ([::1]:60792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbca-00067p-Hi
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mNb0o-0004Ji-CV; Tue, 07 Sep 2021 09:19:42 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:62609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mNb0l-0004M0-U6; Tue, 07 Sep 2021 09:19:41 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id D1FCB445F7;
 Tue,  7 Sep 2021 15:19:28 +0200 (CEST)
Subject: Re: [PATCH v3] qemu-sockets: fix unix socket path copy (again)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
From: Stefan Reiter <s.reiter@proxmox.com>
Message-ID: <4f9e8064-c346-3c54-fa94-1b6a641f9971@proxmox.com>
Date: Tue, 7 Sep 2021 15:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-stable@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the patch, ran into the same issue here and was
about to send my own ;)

On 9/1/21 3:16 PM, Michael Tokarev wrote:
> Commit 4cfd970ec188558daa6214f26203fe553fb1e01f added an
> assert which ensures the path within an address of a unix
> socket returned from the kernel is at least one byte and
> does not exceed sun_path buffer. Both of this constraints
> are wrong:
> 
> A unix socket can be unnamed, in this case the path is
> completely empty (not even \0)
> 
> And some implementations (notable linux) can add extra
> trailing byte (\0) _after_ the sun_path buffer if we
> passed buffer larger than it (and we do).
> 
> So remove the assertion (since it causes real-life breakage)
> but at the same time fix the usage of sun_path. Namely,
> we should not access sun_path[0] if kernel did not return
> it at all (this is the case for unnamed sockets),
> and use the returned salen when copyig actual path as an
> upper constraint for the amount of bytes to copy - this
> will ensure we wont exceed the information provided by
> the kernel, regardless whenever there is a trailing \0
> or not. This also helps with unnamed sockets.
> 
> Note the case of abstract socket, the sun_path is actually
> a blob and can contain \0 characters, - it should not be
> passed to g_strndup and the like, it should be accessed by
> memcpy-like functions.

I know this is already applied now, but I noticed that you
don't actually follow through on that part - g_strndup is
still used in both cases for sun_path.

Haven't run into a bug with this, just noting that the
commit message is a bit confusing paired with the patch.

Might be a bit tricky though, as all callers would need to
be careful too...

> 
> Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f
> Fixes: http://bugs.debian.org/993145
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> CC: qemu-stable@nongnu.org
> ---
>   util/qemu-sockets.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index f2f3676d1f..c5043999e9 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,25 +1345,22 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>       SocketAddress *addr;
>       struct sockaddr_un *su = (struct sockaddr_un *)sa;
>   
> -    assert(salen >= sizeof(su->sun_family) + 1 &&
> -           salen <= sizeof(struct sockaddr_un));
> -
>       addr = g_new0(SocketAddress, 1);
>       addr->type = SOCKET_ADDRESS_TYPE_UNIX;
> +    salen -= offsetof(struct sockaddr_un, sun_path);
>   #ifdef CONFIG_LINUX
> -    if (!su->sun_path[0]) {
> +    if (salen > 0 && !su->sun_path[0]) {
>           /* Linux abstract socket */
> -        addr->u.q_unix.path = g_strndup(su->sun_path + 1,
> -                                        salen - sizeof(su->sun_family) - 1);
> +        addr->u.q_unix.path = g_strndup(su->sun_path + 1, salen - 1);
>           addr->u.q_unix.has_abstract = true;
>           addr->u.q_unix.abstract = true;
>           addr->u.q_unix.has_tight = true;
> -        addr->u.q_unix.tight = salen < sizeof(*su);
> +        addr->u.q_unix.tight = salen < sizeof(su->sun_path);
>           return addr;
>       }
>   #endif
>   
> -    addr->u.q_unix.path = g_strndup(su->sun_path, sizeof(su->sun_path));
> +    addr->u.q_unix.path = g_strndup(su->sun_path, salen);
>       return addr;
>   }
>   #endif /* WIN32 */
> 


