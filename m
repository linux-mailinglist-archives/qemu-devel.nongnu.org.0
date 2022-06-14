Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6854AC24
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 10:42:57 +0200 (CEST)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o128W-0000hr-3I
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 04:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o124E-00068K-JK
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o124B-0006zH-BH
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655195906;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ED27NWwOr4AaoDkCcDPAHhnNgwBe4QH2mZEuSj08Vc=;
 b=P7CTI7GMNwoiy8G3eUOn4BcEIpSnBiiai8nf8X9vc4X84fwBUdB+CwDMEFHRGG5E78HuUn
 3cbg2SCVh38uh2XXtRm7z8oSOPfstcta5QFhtGagWVBEIYtgctDQPV2lT0VzRib288MpL4
 5TfEeoVlmpzDhhu729TUR4JmMUTq4Xw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-MSr20k6DOgKETfKyhEtKWg-1; Tue, 14 Jun 2022 04:38:25 -0400
X-MC-Unique: MSr20k6DOgKETfKyhEtKWg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D08FA811E76;
 Tue, 14 Jun 2022 08:38:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0FFA416164;
 Tue, 14 Jun 2022 08:38:23 +0000 (UTC)
Date: Tue, 14 Jun 2022 09:38:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,
 David Gilbert <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/2] QIOChannelSocket: Introduce assert and reduce
 ifdefs to improve readability
Message-ID: <YqhI/TzuRezpWR7g@redhat.com>
References: <20220614051725.143985-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220614051725.143985-1-leobras@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Tue, Jun 14, 2022 at 02:17:25AM -0300, Leonardo Bras wrote:
> During implementation of MSG_ZEROCOPY feature, a lot of #ifdefs were
> introduced, particularly at qio_channel_socket_writev().
> 
> Rewrite some of those changes so it's easier to read.
> 
> Also, introduce an assert to help detect incorrect zero-copy usage is when
> it's disabled on build.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  io/channel-socket.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index dc9c165de1..cdce7b0b45 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -578,11 +578,13 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>          memcpy(CMSG_DATA(cmsg), fds, fdsize);
>      }
>  
> -#ifdef QEMU_MSG_ZEROCOPY
>      if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> +#ifdef QEMU_MSG_ZEROCOPY
>          sflags = MSG_ZEROCOPY;
> -    }
> +#else

I would just add a comment:

         /* We expect QIOChannel class entry point to have
	    blocked this code path already */

> +        g_assert_unreachable();
>  #endif
> +    }
>  
>   retry:
>      ret = sendmsg(sioc->fd, &msg, sflags);
> @@ -592,15 +594,13 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>              return QIO_CHANNEL_ERR_BLOCK;
>          case EINTR:
>              goto retry;
> -#ifdef QEMU_MSG_ZEROCOPY
>          case ENOBUFS:
> -            if (sflags & MSG_ZEROCOPY) {
> +            if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
>                  error_setg_errno(errp, errno,
>                                   "Process can't lock enough memory for using MSG_ZEROCOPY");
>                  return -1;
>              }
>              break;
> -#endif
>          }
>  
>          error_setg_errno(errp, errno,

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


