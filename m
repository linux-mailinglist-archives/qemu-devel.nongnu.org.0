Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93406470086
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 13:17:37 +0100 (CET)
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mveqG-0006ic-N5
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 07:17:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mveos-00061J-Mv
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mveon-0006EO-HW
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639138564;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2vR7aiPamFeIEjrkRwZAnojnNyOBkz9Rl3WdGbB+ndU=;
 b=abkV1w7dmwSXiI8YRTUWJqMORX0GDWsC551wOqNjcFJ4efpIQO50GkPehqdWsCvpXFbl0v
 cKulyolo50qWqzXynHbjhOTZRyutd7WapmNWI4v62pSbliTkAGnpzOmHe/DFvSgClVEdz7
 DSKyxwqw63NEB9xClk11itNPZTaU8xQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-lSjeyMdNOryOZUDO8jnphQ-1; Fri, 10 Dec 2021 07:16:03 -0500
X-MC-Unique: lSjeyMdNOryOZUDO8jnphQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96876100C662
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 12:16:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 706AA10013D0;
 Fri, 10 Dec 2021 12:16:00 +0000 (UTC)
Date: Fri, 10 Dec 2021 12:15:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v6 1/6] QIOChannel: Add io_writev_zero_copy &
 io_flush_zero_copy callbacks
Message-ID: <YbNE/TGeChoP28ns@redhat.com>
References: <20211209093923.1293701-1-leobras@redhat.com>
 <20211209093923.1293701-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211209093923.1293701-2-leobras@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 09, 2021 at 06:39:19AM -0300, Leonardo Bras wrote:
> Adds io_writev_zero_copy and io_flush_zero_copy as optional callback to QIOChannelClass,
> allowing the implementation of zero copy writes by subclasses.
> 
> How to use them:
> - Write data using qio_channel_writev_zero_copy(),
> - Wait write completion with qio_channel_flush_zero_copy().
> 
> Notes:
> As some zero copy implementations work asynchronously, it's
> recommended to keep the write buffer untouched until the return of
> qio_channel_flush_zero_copy(), to avoid the risk of sending an updated
> buffer instead of the one at the write.
> 
> As the new callbacks are optional, if a subclass does not implement them, then:
> - io_writev_zero_copy will return -1,
> - io_flush_zero_copy will return 0 without changing anything.
> 
> Also, some functions like qio_channel_writev_full_all() were adapted to
> receive a flag parameter. That allows shared code between zero copy and
> non-zero copy writev, and also an easier implementation on new flags.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  include/io/channel.h | 98 +++++++++++++++++++++++++++++++++++++++-----
>  io/channel.c         | 66 +++++++++++++++++++++++------
>  2 files changed, 142 insertions(+), 22 deletions(-)
> 
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 88988979f8..83fa970a19 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -32,12 +32,15 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
>  
>  #define QIO_CHANNEL_ERR_BLOCK -2
>  
> +#define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
> +
>  typedef enum QIOChannelFeature QIOChannelFeature;
>  
>  enum QIOChannelFeature {
>      QIO_CHANNEL_FEATURE_FD_PASS,
>      QIO_CHANNEL_FEATURE_SHUTDOWN,
>      QIO_CHANNEL_FEATURE_LISTEN,
> +    QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
>  };
>  
>  
> @@ -136,6 +139,12 @@ struct QIOChannelClass {
>                                    IOHandler *io_read,
>                                    IOHandler *io_write,
>                                    void *opaque);
> +    ssize_t (*io_writev_zero_copy)(QIOChannel *ioc,
> +                                   const struct iovec *iov,
> +                                   size_t niov,
> +                                   Error **errp);
> +    int (*io_flush_zero_copy)(QIOChannel *ioc,
> +                              Error **errp);
>  };

I've still got the same feedback as previous iterations. It
does not make sense to having both separate callbacks / APIs
and also add flags to existing methods. It just solves thue
same problem twice which si redundant.

I had suggested separate callbacks originally because I
thought we would need to have different signature with
ability to get completions. We've done completions with
a separate API call though.

So the separate zero_copy methods aren't so compelling
as an idea, and we could just use flags only in
retrospect.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


