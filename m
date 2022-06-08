Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1519543BBB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 20:48:54 +0200 (CEST)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz0jd-0000uA-Jq
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 14:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nz0hg-0008NR-H0
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 14:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nz0hd-0001Sj-8Y
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 14:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654714008;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IL70fl4FLGQlSumvgXqEhZZuO6OGnti6wMTJKPew13k=;
 b=Tls9mBagcwoFnikxw+ovDS/tlcQQAIC7089FECj94e+kGvev4jsslMqPTnTvij1APYdXiR
 cwW8Z2GSsRZ23znXezizDN/QnSpCT4NsRq6VEi3XpjrV8l4q5fEbdB9r6vchMfVXhALEwW
 fDBxd2cngRgzQC7zgSO6zhv6kSLGM84=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-KEP0Y2hyMS2BOs70EXA2Hg-1; Wed, 08 Jun 2022 14:46:46 -0400
X-MC-Unique: KEP0Y2hyMS2BOs70EXA2Hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CFFA3C025BE;
 Wed,  8 Jun 2022 18:46:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D0351121315;
 Wed,  8 Jun 2022 18:46:45 +0000 (UTC)
Date: Wed, 8 Jun 2022 19:46:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>
Subject: Re: [PATCH v1 1/1] QIOChannelSocket: Fix zero-copy send so socket
 flush works
Message-ID: <YqDuk+ZCwMdXRXBH@redhat.com>
References: <20220608181808.79364-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220608181808.79364-1-leobras@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 08, 2022 at 03:18:09PM -0300, Leonardo Bras wrote:
> Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
> part of the flushing mechanism got missing: incrementing zero_copy_queued.
> 
> Without that, the flushing interface becomes a no-op, and there is no
> garantee the buffer is really sent.
> 
> This can go as bad as causing a corruption in RAM during migration.
> 
> Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> Reported-by: 徐闯 <xuchuangxclwt@bytedance.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  io/channel-socket.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index dc9c165de1..ca4cae930f 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -554,6 +554,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>      size_t fdsize = sizeof(int) * nfds;
>      struct cmsghdr *cmsg;
>      int sflags = 0;
> +    bool zero_copy_enabled = false;
>  
>      memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
>  
> @@ -581,6 +582,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>  #ifdef QEMU_MSG_ZEROCOPY
>      if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
>          sflags = MSG_ZEROCOPY;
> +        zero_copy_enabled = true;
>      }
>  #endif
>  
> @@ -592,21 +594,24 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>              return QIO_CHANNEL_ERR_BLOCK;
>          case EINTR:
>              goto retry;
> -#ifdef QEMU_MSG_ZEROCOPY

Removing this ifdef appears incidental to the change. If this is
redundant just remove it in its own patch.

>          case ENOBUFS:
> -            if (sflags & MSG_ZEROCOPY) {
> +            if (zero_copy_enabled) {
>                  error_setg_errno(errp, errno,
>                                   "Process can't lock enough memory for using MSG_ZEROCOPY");
>                  return -1;
>              }
>              break;
> -#endif
>          }
>  
>          error_setg_errno(errp, errno,
>                           "Unable to write to socket");
>          return -1;
>      }
> +
> +    if (zero_copy_enabled) {

What's wrong with

   if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
        sioc->zero_copy_queued++;
    }


Introducing another local variable doesn't really add value IMHO.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


