Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E586337C6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxP90-0003zR-D1; Tue, 22 Nov 2022 04:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxP8q-0003xG-FI
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxP8m-0007PN-DT
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669107625;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3YWq1WKimve8JRI6qMlg0HTN6cerAbIIkbckl8c1yY=;
 b=PiZ1tsy3xyjEkS24cTprJ6qyO1nvV52Ext7sfzEMGxBChyFjpZrrbjshb1PYeWHOcXUH8f
 oCESvdX4Y+FcrU+0Cp0GTBzDxIFiMI9DmV/tafLHQKIUyUk3Mwa+el8xgTybKdI2iOu7Vp
 1SoOBxjUNuBPJDzUatU/1O0jAXObFAA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-b_-9yaOdN5meys7OVBk-hw-1; Tue, 22 Nov 2022 04:00:21 -0500
X-MC-Unique: b_-9yaOdN5meys7OVBk-hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 965A6811E7A;
 Tue, 22 Nov 2022 09:00:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72A1E40C2086;
 Tue, 22 Nov 2022 09:00:20 +0000 (UTC)
Date: Tue, 22 Nov 2022 09:00:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v3 1/2] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y3yPoFAo5l/vmB/y@redhat.com>
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
 <20221119093615.158072-4-manish.mishra@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221119093615.158072-4-manish.mishra@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Sat, Nov 19, 2022 at 09:36:14AM +0000, manish.mishra wrote:
> MSG_PEEK reads from the peek of channel, The data is treated as
> unread and the next read shall still return this data. This
> support is currently added only for socket class. Extra parameter
> 'flags' is added to io_readv calls to pass extra read flags like
> MSG_PEEK.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> ---
>  chardev/char-socket.c               |  4 +-
>  include/io/channel.h                | 83 +++++++++++++++++++++++++++++
>  io/channel-buffer.c                 |  1 +
>  io/channel-command.c                |  1 +
>  io/channel-file.c                   |  1 +
>  io/channel-null.c                   |  1 +
>  io/channel-socket.c                 | 16 +++++-
>  io/channel-tls.c                    |  1 +
>  io/channel-websock.c                |  1 +
>  io/channel.c                        | 73 +++++++++++++++++++++++--
>  migration/channel-block.c           |  1 +
>  scsi/qemu-pr-helper.c               |  2 +-
>  tests/qtest/tpm-emu.c               |  2 +-
>  tests/unit/test-io-channel-socket.c |  1 +
>  util/vhost-user-server.c            |  2 +-
>  15 files changed, 179 insertions(+), 11 deletions(-)



> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index b76dca9cc1..a06b24766d 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
>      }
>  #endif /* WIN32 */
>  
> +    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
> +

This covers the incoming server side socket.

This also needs to be set in outgoing client side socket in
qio_channel_socket_connect_async


> @@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>  }
>  #endif /* WIN32 */
>  
> -
>  #ifdef QEMU_MSG_ZEROCOPY
>  static int qio_channel_socket_flush(QIOChannel *ioc,
>                                      Error **errp)

Please remove this unrelated whitespace change.


> @@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>      return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
>  }
>  
> +int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
> +                                   const struct iovec *iov,
> +                                   size_t niov,
> +                                   Error **errp)
> +{
> +   ssize_t len = 0;
> +   ssize_t total = iov_size(iov, niov);
> +
> +   while (len < total) {
> +       len = qio_channel_readv_full(ioc, iov, niov, NULL,
> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
> +
> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(ioc, G_IO_IN);
> +            } else {
> +                qio_channel_wait(ioc, G_IO_IN);
> +            }
> +            continue;
> +       }
> +       if (len == 0) {
> +           return 0;
> +       }
> +       if (len < 0) {
> +           return -1;
> +       }
> +   }

This will busy wait burning CPU where there is a read > 0 and < total.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


