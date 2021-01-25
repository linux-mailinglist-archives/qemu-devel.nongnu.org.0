Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39AF302817
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:44:04 +0100 (CET)
Received: from localhost ([::1]:33438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44yB-0000Xb-P7
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l44w3-0007TR-4j
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:41:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l44w1-0002BT-3K
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611592908;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XwS9t41eqIw3AQobUMb1+r3g55FxUrUjMv3I7M6RHts=;
 b=Bj3E9z+bb8UbsIUUsGFxyPKmC9Zd6dvHaxBbXoUjaREU9fwnX6a57pkDPvtEce8i+gJmix
 MIByPCP6lvtCTSOvw2lKdfSzgHF7a58mzX9wKYTCYoiHgzk4xwM+9UUHy9On1Vyl2KjcDy
 gOyzVzCXJRDleN6UeFeTXeTMmjwvYXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-KBmSq4-bNzyymKtUNasPyw-1; Mon, 25 Jan 2021 11:41:29 -0500
X-MC-Unique: KBmSq4-bNzyymKtUNasPyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 150E4801817;
 Mon, 25 Jan 2021 16:41:27 +0000 (UTC)
Received: from redhat.com (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E65760C0F;
 Mon, 25 Jan 2021 16:41:07 +0000 (UTC)
Date: Mon, 25 Jan 2021 16:41:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v20 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Message-ID: <20210125164104.GA3538803@redhat.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
 <ac1c0900ed34c8bf4e93dd77507fc34169bb8ee4.1611081587.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <ac1c0900ed34c8bf4e93dd77507fc34169bb8ee4.1611081587.git.jag.raman@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 03:28:25PM -0500, Jagannathan Raman wrote:
> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> 
> Adds qio_channel_readv_full_all_eof() and qio_channel_readv_full_all()
> to read both data and FDs. Refactors existing code to use these helpers.
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/io/channel.h |  53 ++++++++++++++++++++++++++
>  io/channel.c         | 106 +++++++++++++++++++++++++++++++++++++++++----------
>  2 files changed, 138 insertions(+), 21 deletions(-)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 19e76fc..8898897 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -778,6 +778,59 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
>                                      void *opaque);
>  
>  /**
> + * qio_channel_readv_full_all_eof:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to read data to
> + * @niov: the length of the @iov array
> + * @fds: an array of file handles to read
> + * @nfds: number of file handles in @fds
> + * @errp: pointer to a NULL-initialized error object
> + *
> + *
> + * Performs same function as qio_channel_readv_all_eof.
> + * Additionally, attempts to read file descriptors shared
> + * over the channel. The function will wait for all
> + * requested data to be read, yielding from the current
> + * coroutine if required. data refers to both file
> + * descriptors and the iovs.
> + *
> + * Returns: 1 if all bytes were read, 0 if end-of-file
> + *          occurs without data, or -1 on error
> + */
> +
> +int qio_channel_readv_full_all_eof(QIOChannel *ioc,
> +                                   const struct iovec *iov,
> +                                   size_t niov,
> +                                   int **fds, size_t *nfds,
> +                                   Error **errp);
> +
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
> + * Performs same function as qio_channel_readv_all_eof.
> + * Additionally, attempts to read file descriptors shared
> + * over the channel. The function will wait for all
> + * requested data to be read, yielding from the current
> + * coroutine if required. data refers to both file
> + * descriptors and the iovs.
> + *
> + * Returns: 0 if all bytes were read, or -1 on error
> + */
> +
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                               const struct iovec *iov,
> +                               size_t niov,
> +                               int **fds, size_t *nfds,
> +                               Error **errp);
> +
> +/**
>   * qio_channel_writev_full_all:
>   * @ioc: the channel object
>   * @iov: the array of memory regions to write data from
> diff --git a/io/channel.c b/io/channel.c
> index 0d4b8b5..b12db9d 100644
> --- a/io/channel.c
> +++ b/io/channel.c


> +int qio_channel_readv_full_all_eof(QIOChannel *ioc,
> +                                   const struct iovec *iov,
> +                                   size_t niov,
> +                                   int **fds, size_t *nfds,
> +                                   Error **errp)
> +{
>      int ret = -1;
>      struct iovec *local_iov = g_new(struct iovec, niov);
>      struct iovec *local_iov_head = local_iov;
>      unsigned int nlocal_iov = niov;
> +    int **local_fds = fds;
> +    size_t *local_nfds = nfds;
>      bool partial = false;
>  
> +    if (nfds) {
> +        *nfds = 0;
> +    }
> +
> +    if (fds) {
> +        *fds = NULL;
> +    }
> +
>      nlocal_iov = iov_copy(local_iov, nlocal_iov,
>                            iov, niov,
>                            0, iov_size(iov, niov));
>  
> -    while (nlocal_iov > 0) {
> +    while ((nlocal_iov > 0) || local_fds) {
>          ssize_t len;
> -        len = qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
> +        len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
> +                                     local_nfds, errp);
>          if (len == QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_IN);
> @@ -112,20 +140,53 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                  qio_channel_wait(ioc, G_IO_IN);
>              }
>              continue;
> -        } else if (len < 0) {
> -            goto cleanup;
> -        } else if (len == 0) {
> -            if (partial) {
> -                error_setg(errp,
> -                           "Unexpected end-of-file before all bytes were read");
> -            } else {
> -                ret = 0;
> +        }
> +
> +        if (len <= 0) {
> +            size_t fd_idx;
> +
> +            if (!len && !niov && (nfds && *nfds)) {
> +                break;
> +            }
> +
> +            if (!partial && (!nfds || !(*nfds))) {
> +                ret = len;
> +                goto cleanup;
>              }
> +
> +            error_prepend(errp,
> +                          "Unexpected end-of-file before all data were read.");
> +
> +            if (!nfds || !(*nfds)) {
> +                goto cleanup;
> +            }

I'm finding it really hard to understand what scenario each of
these three if() tests is validating, so can't be confident that
we've dealt with the failure cases correctly.

In the  len < 0 case, we shouldn't be reporting the "unexpected end-of-file"
message at all, as it won't be and end of file - its some other failure
condition.

In the len == 0 case, we should be using error_setg not error_prepend
AFAIK.

> +
> +            /*
> +             * If (len < 0) and fds are returned, it's not clear if the
> +             * returned fds are valid to be closed. Just free'ing the
> +             * allocated memory for fds in this case
> +             */
> +            fd_idx = *nfds;
> +            while (fd_idx && !len) {
> +                close((*fds)[fd_idx - 1]);
> +                fd_idx--;
> +            }

I'm not sure ignoring the len < 0 case is correct. The first time we
call qio_channel_readv_full(), we can receive some FDs, either with
or without some data bytes.

The second time we call qio_channel_readv_full we can get len == -1
and so need to return an error. We must close the FDs we received on
the previous iteration at this point.



> +
> +            g_free(*fds);
> +            *fds = NULL;
> +            *nfds = 0;
> +
>              goto cleanup;
>          }

I'm thinking the above error handling would be clearer if we could
separate out the len == 0 case from the len == -1 case initially.

eg, would this logic do what we need:

        if (len == 0) {
            if (local_nfds && *local_nfds) {
                /* got some FDs, but not data yet. This isn't an EOF
                 * scenario (yet), so carry on to try to read data
                 * on next loop iteration */
            } else if (!partial) {
                /* no fds and no data, must be an expected EOF */
                ret = 0;
                goto cleanup;
            } else {
                len = -1;
                error_setg(errp,
                           "Unexpected end-of-file before all data were read.");
                /* fallthrough into len < 0 handling now */
            }
        }

        if (len < 0) {
            /* Close any FDs we previously received */
            if (nfds && fds) {
                size_t i;
                for (i = 0; nfds && i < *nfds; i++) {
                    close((*fds)[i]);
                }

                g_free(*fds);
                *fds = NULL;
                *nfds = 0;
            }

            goto cleanup;
        }

>  
>          partial = true;
> -        iov_discard_front(&local_iov, &nlocal_iov, len);
> +
> +        if (nlocal_iov) {
> +            iov_discard_front(&local_iov, &nlocal_iov, len);
> +        }
> +
> +        local_fds = NULL;
> +        local_nfds = NULL;
>      }
>  
>      ret = 1;
> @@ -135,20 +196,23 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>      return ret;
>  }
>  
> -int qio_channel_readv_all(QIOChannel *ioc,
> -                          const struct iovec *iov,
> -                          size_t niov,
> -                          Error **errp)
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                               const struct iovec *iov,
> +                               size_t niov,
> +                               int **fds, size_t *nfds,
> +                               Error **errp)
>  {
> -    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
> +    int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);
>  
>      if (ret == 0) {
> -        ret = -1;
> -        error_setg(errp,
> -                   "Unexpected end-of-file before all bytes were read");
> -    } else if (ret == 1) {
> -        ret = 0;
> +        error_prepend(errp,
> +                      "Unexpected end-of-file before all data were read.");
> +        return -1;
>      }
> +    if (ret == 1) {
> +        return 0;
> +    }
> +
>      return ret;
>  }
>  
> -- 
> 1.8.3.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


