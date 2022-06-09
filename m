Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB1544582
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 10:17:09 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzDLn-0004FR-ST
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 04:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzDF4-0002q8-GZ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzDEy-0005WW-QE
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654762201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6hD0Nkw+zjOKsyuv8+p6zonq+rDBN48CmKoKLr8aSfw=;
 b=PdpAtx7zQjvSXqT3m2Lhk9htcfRllWKcMXaOyF+zST/YUPTDXpHSRUAsz5vXS2Ur/SJcSt
 pHKfZj1SNoOekpVjvI3/fCUvXNsMAXIq/W2IiiXlDWpzfJT38Jugoblgo016RYzTl6xKNM
 rgBkIJ2SHhAm4cxuRR2MTBrogqPau94=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-ep5eorDXNBOPBim8ocPL7w-1; Thu, 09 Jun 2022 04:09:58 -0400
X-MC-Unique: ep5eorDXNBOPBim8ocPL7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA6F785A582;
 Thu,  9 Jun 2022 08:09:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90A8A1121314;
 Thu,  9 Jun 2022 08:09:56 +0000 (UTC)
Date: Thu, 9 Jun 2022 09:09:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,
 David Gilbert <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/2] QIOChannelSocket: Reduce ifdefs to improve
 readability
Message-ID: <YqGq0Bw7V26vaNoI@redhat.com>
References: <20220608210403.84006-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220608210403.84006-1-leobras@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Wed, Jun 08, 2022 at 06:04:02PM -0300, Leonardo Bras wrote:
> During implementation of MSG_ZEROCOPY feature, a lot of #ifdefs were
> introduced, particularly at qio_channel_socket_writev().
> 
> Rewrite some of those changes so it's easier to read.
> 									...
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  io/channel-socket.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index dc9c165de1..ef7c7cfbac 100644
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

There should be a

 #else
    error_setg(errp, "Zero copy not supported on this platform");
    return -1;
 #endif

>  #endif
>  
> @@ -592,15 +594,13 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>              return QIO_CHANNEL_ERR_BLOCK;
>          case EINTR:
>              goto retry;
> -#ifdef QEMU_MSG_ZEROCOPY
>          case ENOBUFS:
> -            if (sflags & MSG_ZEROCOPY) {
> +            if (zero_copy_enabled) {

if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY)

avoids the #ifdef without needing to add yet another
variable expressing what's already expressed in both
'flags' and 'sflags'.

>                  error_setg_errno(errp, errno,
>                                   "Process can't lock enough memory for using MSG_ZEROCOPY");
>                  return -1;
>              }
>              break;
> -#endif
>          }
>  
>          error_setg_errno(errp, errno,
> -- 
> 2.36.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


