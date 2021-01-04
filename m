Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA5F2E9812
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 16:07:30 +0100 (CET)
Received: from localhost ([::1]:53694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwRSD-0008V8-3S
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 10:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwRNb-0004tx-KO
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:02:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwRNX-0002UA-Qd
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609772558;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBTjoxBNCRgAeE2hy5gXUSfqj/3+BAUspBw9XpugdDQ=;
 b=YiDzTSusT30YLfLVvEPfm5BZn1d72JJsA4x4Ihxv8WI5xVgOUsR/AJqEvvAGEFkiCzouzW
 wH0oR4qnxSEq/fceaEzm5DFTcouMnUClyg+Q2l+syqLo4HpmyTcLpb64uN2Wpry4zCvX0T
 uWztfGGDZ9ormFV9CRGJ9zbR0OevzoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-G2tmT7fpOy21yykYsi-q2w-1; Mon, 04 Jan 2021 10:02:24 -0500
X-MC-Unique: G2tmT7fpOy21yykYsi-q2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 942C559;
 Mon,  4 Jan 2021 15:02:22 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.ams2.redhat.com [10.36.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 803E35D768;
 Mon,  4 Jan 2021 15:02:07 +0000 (UTC)
Date: Mon, 4 Jan 2021 15:02:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: elena.ufimtseva@oracle.com
Subject: Re: [PATCH v15 07/20] multi-process: add qio channel write function
Message-ID: <20210104150204.GL640208@redhat.com>
References: <cover.1608702853.git.elena.ufimtseva@oracle.com>
 <5326844a151bf409842c8df343a47d019ec9e633.1608702853.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <5326844a151bf409842c8df343a47d019ec9e633.1608702853.git.elena.ufimtseva@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, thuth@redhat.com, ehabkost@redhat.com,
 konrad.wilk@oracle.com, dgilbert@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since this is independent of the multi-process code, it
should have a subject prefix of "io:". I'd suggest

   io: add qio_channel_writev_full_all helper

On Tue, Dec 22, 2020 at 10:14:42PM -0800, elena.ufimtseva@oracle.com wrote:
> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> 
> Adds qio_channel_writev_full_all() to transmit both data and FDs.
> Refactors existing code to use this function.
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/io/channel.h | 25 +++++++++++++++++++++++++
>  io/channel.c         | 17 ++++++++++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 4d6fe45f63..2378567d4b 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -774,4 +774,29 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
>                                      IOHandler *io_write,
>                                      void *opaque);
>  
> +/**
> + * qio_channel_writev_full_all:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to write data from
> + * @niov: the length of the @iov array
> + * @fds: an array of file handles to send
> + * @nfds: number of file handles in @fds
> + * @errp: pointer to a NULL-initialized error object
> + *
> + *
> + * Behaves like qio_channel_writev_full but will attempt
> + * to send all data passed (file handles and memory regions).
> + * The function will wait for all requested data
> + * to be written, yielding from the current coroutine
> + * if required.
> + *
> + * Returns: 0 if all bytes were written, or -1 on error
> + */
> +
> +int qio_channel_writev_full_all(QIOChannel *ioc,
> +                           const struct iovec *iov,
> +                           size_t niov,
> +                           int *fds, size_t nfds,
> +                           Error **errp);

Copy-paste mistake - alignment of parameters is incorrect now.

> +
>  #endif /* QIO_CHANNEL_H */
> diff --git a/io/channel.c b/io/channel.c
> index 93d449dee2..bde1f6d0f4 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -156,11 +156,22 @@ int qio_channel_writev_all(QIOChannel *ioc,
>                             const struct iovec *iov,
>                             size_t niov,
>                             Error **errp)
> +{
> +    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
> +}
> +
> +int qio_channel_writev_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int *fds, size_t nfds,
> +                                Error **errp)
>  {
>      int ret = -1;
>      struct iovec *local_iov = g_new(struct iovec, niov);
>      struct iovec *local_iov_head = local_iov;
>      unsigned int nlocal_iov = niov;
> +    int *local_fds = fds;
> +    size_t local_nfds = nfds;

I don't see any need for these extra variables - just
use the parameters in place

>  
>      nlocal_iov = iov_copy(local_iov, nlocal_iov,
>                            iov, niov,
> @@ -168,7 +179,8 @@ int qio_channel_writev_all(QIOChannel *ioc,
>  
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len = qio_channel_writev(ioc, local_iov, nlocal_iov, errp);
> +        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, local_fds,
> +                                      local_nfds, errp);
>          if (len == QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_OUT);
> @@ -182,6 +194,9 @@ int qio_channel_writev_all(QIOChannel *ioc,
>          }
>  
>          iov_discard_front(&local_iov, &nlocal_iov, len);
> +
> +        local_fds = NULL;
> +        local_nfds = 0;
>      }
>  
>      ret = 0;

If the above tweaks are made then

   Acked-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


