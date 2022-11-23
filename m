Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6CE636524
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxs9T-0000pW-Um; Wed, 23 Nov 2022 10:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxs9P-0000mE-TH
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:59:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxs9N-00089C-AV
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:59:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669219140;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQXCgwUQ2ydLqdyzr7DpLLwk/ZoH+QHtysUU9GJpC+E=;
 b=J4z6rAeT1XcJ0o7NWRMxmcKeMhUWNfX8NPqcZgfRYBQR+aVcu43aUPCgAcDmJx9fX+Zyg+
 wNmt3/OQm2u6ny0Qrrch7JETFNFo0JRRUflO3SRL1uY/6XmY11DL6Rg/n4s2yNU1Iu6Xly
 EagKcXDDVTkUQiuj8T2lBlZpD6RtZ6k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-9Kf0zxegMa-t2bZRRFVY0Q-1; Wed, 23 Nov 2022 10:58:56 -0500
X-MC-Unique: 9Kf0zxegMa-t2bZRRFVY0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8ED531C07825;
 Wed, 23 Nov 2022 15:58:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32BEDC15BB1;
 Wed, 23 Nov 2022 15:58:55 +0000 (UTC)
Date: Wed, 23 Nov 2022 15:58:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v4 2/2] migration: check magic value for deciding the
 mapping of channels
Message-ID: <Y35DOkfHr2+2PwSe@redhat.com>
References: <20221123150527.24608-1-manish.mishra@nutanix.com>
 <20221123150527.24608-3-manish.mishra@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221123150527.24608-3-manish.mishra@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 23, 2022 at 03:05:27PM +0000, manish.mishra wrote:
> Current logic assumes that channel connections on the destination side are
> always established in the same order as the source and the first one will
> always be the main channel followed by the multifid or post-copy
> preemption channel. This may not be always true, as even if a channel has a
> connection established on the source side it can be in the pending state on
> the destination side and a newer connection can be established first.
> Basically causing out of order mapping of channels on the destination side.
> Currently, all channels except post-copy preempt send a magic number, this
> patch uses that magic number to decide the type of channel. This logic is
> applicable only for precopy(multifd) live migration, as mentioned, the
> post-copy preempt channel does not send any magic number. Also, tls live
> migrations already does tls handshake before creating other channels, so
> this issue is not possible with tls, hence this logic is avoided for tls
> live migrations. This patch uses read peek to check the magic number of
> channels so that current data/control stream management remains
> un-effected.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> ---
>  migration/channel.c      | 46 ++++++++++++++++++++++++++++++++++++++++
>  migration/channel.h      |  5 +++++
>  migration/migration.c    | 45 ++++++++++++++++++++++++++++-----------
>  migration/multifd.c      | 12 ++++-------
>  migration/multifd.h      |  2 +-
>  migration/postcopy-ram.c |  5 +----
>  migration/postcopy-ram.h |  2 +-
>  7 files changed, 91 insertions(+), 26 deletions(-)
> 
> diff --git a/migration/channel.c b/migration/channel.c
> index 1b0815039f..a4600f52c5 100644
> --- a/migration/channel.c
> +++ b/migration/channel.c
> @@ -92,3 +92,49 @@ void migration_channel_connect(MigrationState *s,
>      migrate_fd_connect(s, error);
>      error_free(error);
>  }
> +
> +
> +/**
> + * @migration_channel_read_peek - Read from the peek of migration channel,
> + *    without actually removing it from channel buffer.
> + *
> + * @ioc: the channel object
> + * @buf: the memory region to read data into
> + * @buflen: the number of bytes to read in @buf
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Returns 0 if successful, returns -1 and sets @errp if fails.
> + */
> +int migration_channel_read_peek(QIOChannel *ioc,
> +                                const char *buf,
> +                                const size_t buflen,
> +                                Error **errp)
> +{
> +   ssize_t len = 0;
> +   struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
> +
> +   while (len < buflen) {
> +       len = qio_channel_readv_full(ioc, &iov, 1, NULL,
> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
> +
> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                /* 1ms sleep. */
> +                qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 1000000);
> +            } else {
> +                qio_channel_wait(ioc, G_IO_IN);
> +            }
> +            continue;
> +       }
> +       if (len == 0) {
> +           error_setg(errp,
> +                      "Unexpected end-of-file on channel");
> +           return -1;
> +       }
> +       if (len < 0) {
> +           return -1;
> +       }
> +   }

This busy waits when len > 0 and < buflen


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


