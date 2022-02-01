Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B181A4A595A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:39:38 +0100 (CET)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpdR-0005VH-QE
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:39:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEpZG-0002dN-EF
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEpZE-0005VD-F0
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643708115;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmWOsRK4InqPZkTqmwP3ZcEJjLEll2w1Q9dwu+V+J2E=;
 b=WsXx3RnUX1VUWrwu3+11nRM28Kvb8X+6F5imFft8/OM5O93uG9GKcoA+oGdKtqArPUpowy
 BxbN3z+16o5O2D2wpnM8tNWxreftsOmAukmxeZoNxlF8NYTJGTSp8nFypanLvscJ1BDbeY
 78wpAKa7DJI43CVgLHA3YcbBff3de74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-_Ujhgp_VMiOGML8wCl8BkA-1; Tue, 01 Feb 2022 04:35:12 -0500
X-MC-Unique: _Ujhgp_VMiOGML8wCl8BkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 907EF8143EA;
 Tue,  1 Feb 2022 09:35:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 831F95F910;
 Tue,  1 Feb 2022 09:35:08 +0000 (UTC)
Date: Tue, 1 Feb 2022 09:35:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v8 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
Message-ID: <Yfj+yTzzNgL80scj@redhat.com>
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220201062901.428838-2-leobras@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 03:28:59AM -0300, Leonardo Bras wrote:
> Add flags to io_writev and introduce io_flush as optional callback to
> QIOChannelClass, allowing the implementation of zero copy writes by
> subclasses.
> 
> How to use them:
> - Write data using qio_channel_writev*(...,QIO_CHANNEL_WRITE_FLAG_ZERO_COPY),
> - Wait write completion with qio_channel_flush().
> 
> Notes:
> As some zero copy write implementations work asynchronously, it's
> recommended to keep the write buffer untouched until the return of
> qio_channel_flush(), to avoid the risk of sending an updated buffer
> instead of the buffer state during write.
> 
> As io_flush callback is optional, if a subclass does not implement it, then:
> - io_flush will return 0 without changing anything.
> 
> Also, some functions like qio_channel_writev_full_all() were adapted to
> receive a flag parameter. That allows shared code between zero copy and
> non-zero copy writev, and also an easier implementation on new flags.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel.h                | 38 ++++++++++++++++++++-
>  chardev/char-io.c                   |  2 +-
>  hw/remote/mpqemu-link.c             |  2 +-
>  io/channel-buffer.c                 |  1 +
>  io/channel-command.c                |  1 +
>  io/channel-file.c                   |  1 +
>  io/channel-socket.c                 |  2 ++
>  io/channel-tls.c                    |  1 +
>  io/channel-websock.c                |  1 +
>  io/channel.c                        | 53 +++++++++++++++++++++++------
>  migration/rdma.c                    |  1 +
>  scsi/pr-manager-helper.c            |  2 +-
>  tests/unit/test-io-channel-socket.c |  1 +
>  13 files changed, 92 insertions(+), 14 deletions(-)
> 
> diff --git a/io/channel.c b/io/channel.c
> index e8b019dc36..b8b99fdc4c 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -72,18 +72,32 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
>                                  size_t niov,
>                                  int *fds,
>                                  size_t nfds,
> +                                int flags,
>                                  Error **errp)
>  {
>      QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
>  
> -    if ((fds || nfds) &&
> -        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
> +    if (fds || nfds) {
> +        if (!qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
> +            error_setg_errno(errp, EINVAL,
> +                             "Channel does not support file descriptor passing");
> +            return -1;
> +        }
> +        if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> +            error_setg_errno(errp, EINVAL,
> +                             "Zero Copy does not support file descriptor passing");
> +            return -1;
> +        }

Here you gracefully reject FD passing when zero copy is requested
which is good.

> +    }
> +

> @@ -235,10 +249,16 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
>                            iov, niov,
>                            0, iov_size(iov, niov));
>  
> +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> +        assert(fds == NULL && nfds == 0);
> +    }

But here you  abort QEMU if FD passing is requested when zero copy
is set.

AFAICT, if you just delete this assert, the code to gracefully
report errors will do the right thing.

Without the assert:

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


