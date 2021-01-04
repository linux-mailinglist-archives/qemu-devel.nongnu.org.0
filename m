Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707782E9840
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 16:18:49 +0100 (CET)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwRdA-0007zk-84
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 10:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwRbz-0007ZB-Fl
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:17:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwRbw-0007Y3-Jd
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609773451;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dqnDTZrNodWjgcuLyV9KwUrxGrsW6aL6wUkxskQX4JU=;
 b=Yzl/5ZyFU2lDasnjJ9PpFEKriLDD4nftF8zZyYO5D8csF7iCsGuObjjcoUD8luG0P42LrX
 t8lNdgA6ddolykapSVH1a1dvfECr7D1lIThunqyzvwtZx2A2twRrAVcraPDI8eyEfwFHNA
 GBgXihKwhEB+QEHG4VYXpB6RGU+EpNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551--icnRImIPkyIBNa3Me5iWw-1; Mon, 04 Jan 2021 10:17:26 -0500
X-MC-Unique: -icnRImIPkyIBNa3Me5iWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2829107ACE6;
 Mon,  4 Jan 2021 15:17:23 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.ams2.redhat.com [10.36.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E27E5C8AA;
 Mon,  4 Jan 2021 15:16:56 +0000 (UTC)
Date: Mon, 4 Jan 2021 15:16:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: elena.ufimtseva@oracle.com
Subject: Re: [PATCH v15 08/20] multi-process: add qio channel read function
Message-ID: <20210104151653.GM640208@redhat.com>
References: <cover.1608702853.git.elena.ufimtseva@oracle.com>
 <42569c768066e334186ea8567847d96c8ebb0ad9.1608702853.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <42569c768066e334186ea8567847d96c8ebb0ad9.1608702853.git.elena.ufimtseva@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Dec 22, 2020 at 10:14:43PM -0800, elena.ufimtseva@oracle.com wrote:
> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> 
> Adds qio_channel_readv_full_all() to read both data and FDs.
> Refactors existing code to use this function.
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/io/channel.h | 25 +++++++++++++
>  io/channel.c         | 85 +++++++++++++++++++++++++++++++-------------
>  2 files changed, 85 insertions(+), 25 deletions(-)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 2378567d4b..429ece9a05 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -774,6 +774,31 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
>                                      IOHandler *io_write,
>                                      void *opaque);
>  
> +/**
> + * qio_channel_readv_full_all:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to read data to
> + * @niov: the length of the @iov array
> + * @fds: an array of file handles to read
> + * @nfds: number of file handles in @fds
> + * @errp: pointer to a NULL-initialized error object
> + *
> + *
> + * Behaves like qio_channel_readv_full but will attempt
> + * to read all data specified (file handles and memory regions).
> + * The function will wait for all requested data
> + * to be read, yielding from the current coroutine
> + * if required.
> + *
> + * Returns: 0 if all bytes were read, or -1 on error
> + */
> +
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int **fds, size_t *nfds,
> +                                Error **errp);

There parameters are one character mis-aligned here.

> diff --git a/io/channel.c b/io/channel.c
> index bde1f6d0f4..5edaea1fac 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -91,11 +91,49 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                                const struct iovec *iov,
>                                size_t niov,
>                                Error **errp)
> +{
> +    int ret = qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL, errp);
> +
> +    if (ret == -ECANCELED) {
> +        error_prepend(errp,
> +                      "Unexpected end-of-file before all bytes were read: ");
> +        ret = -1;
> +    }
> +
> +    return ret;
> +}
> +
> +int qio_channel_readv_all(QIOChannel *ioc,
> +                          const struct iovec *iov,
> +                          size_t niov,
> +                          Error **errp)
> +{
> +    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
> +
> +    if (ret == 0) {
> +        error_setg(errp,
> +                   "Unexpected end-of-file before all bytes were read");
> +        return -1;
> +    }
> +    if (ret == 1) {
> +        return 0;
> +    }
> +
> +    return ret;
> +}
> +
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int **fds, size_t *nfds,
> +                                Error **errp)
>  {
>      int ret = -1;
>      struct iovec *local_iov = g_new(struct iovec, niov);
>      struct iovec *local_iov_head = local_iov;
>      unsigned int nlocal_iov = niov;
> +    int **local_fds = fds;
> +    size_t *local_nfds = nfds;

It doesn't look like we actually need these as local variables,
as opposed to just replacing the parameters.

>      bool partial = false;
>  
>      nlocal_iov = iov_copy(local_iov, nlocal_iov,
> @@ -104,7 +142,8 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>  
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len = qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
> +        len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
> +                                     local_nfds, errp);
>          if (len == QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_IN);
> @@ -112,20 +151,33 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                  qio_channel_wait(ioc, G_IO_IN);
>              }
>              continue;
> -        } else if (len < 0) {
> -            goto cleanup;
> -        } else if (len == 0) {
> -            if (partial) {
> -                error_setg(errp,
> -                           "Unexpected end-of-file before all bytes were read");
> +        }
> +
> +        if (len <= 0) {
> +            size_t fd_idx = nfds ? *nfds : 0;
> +            if (partial && (len == 0)) {
> +                ret = -ECANCELED;

As Marc-Andre mentioned, we intentionally avoid returning 'errno' from
any of the QIO functions, so I definitely don't want to see this added.

If I look at the current set of APIs:

qio_channel_readv_full

qio_channel_readv
qio_channel_readv_all
qio_channel_readv_all_eof

qio_channel_read
qio_channel_read_all
qio_channel_read_all_eof

I think the problem is that you're introducing just 1 new function,
when we really should have two in order to complete the code pattern
we have. ie

  qio_channel_readv_full_all
  qio_channel_readv_full_all_eof

the former should call the latter.


>              } else {
> -                ret = 0;
> +                ret = len;
> +            }
> +
> +            while (fds && fd_idx) {
> +                close(*fds[fd_idx - 1]);
> +                fd_idx--;
> +            }
> +
> +            if (fds) {
> +                g_free(*fds);
>              }
> +
>              goto cleanup;
>          }
>  
>          partial = true;
>          iov_discard_front(&local_iov, &nlocal_iov, len);
> +
> +        local_fds = NULL;
> +        local_nfds = 0;
>      }
>  
>      ret = 1;
> @@ -135,23 +187,6 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>      return ret;
>  }
>  
> -int qio_channel_readv_all(QIOChannel *ioc,
> -                          const struct iovec *iov,
> -                          size_t niov,
> -                          Error **errp)
> -{
> -    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
> -
> -    if (ret == 0) {
> -        ret = -1;
> -        error_setg(errp,
> -                   "Unexpected end-of-file before all bytes were read");
> -    } else if (ret == 1) {
> -        ret = 0;
> -    }
> -    return ret;
> -}
> -

Try not to mix in code movement with functional changes, as it obscures
the diffs. IOW, if you want to re-arrange funtions in the file, do this
as a separate patch first.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


