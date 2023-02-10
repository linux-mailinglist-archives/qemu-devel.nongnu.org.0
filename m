Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02DC6923E2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 18:02:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWlS-0007uY-81; Fri, 10 Feb 2023 12:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQWkr-0007rD-3d
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:00:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQWkp-0004G9-73
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676048405;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UYAQClpMt3j027Xb4uk0UBZHHGLCI6QcQcrbjiK8UmA=;
 b=faFDpe4ajhgHyNUKdOqt5wTplv6zJemORHR202I54U2rVvYLQ6a5qqG1WCNeJ0JWf2rsiO
 cWoeqACotdaka+cTw7IFRHcDHDY/QDZ4w0jcnzUAJG2r893SjVcvgLBzAZBLj/gXpe4IYN
 syUQ9s5Qlt5ZTHYL94nU5DSV+xn6egI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-5-Z675oHPji8LbJYpKY6ng-1; Fri, 10 Feb 2023 12:00:02 -0500
X-MC-Unique: 5-Z675oHPji8LbJYpKY6ng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 744D0101A52E;
 Fri, 10 Feb 2023 17:00:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C69E1121315;
 Fri, 10 Feb 2023 16:59:59 +0000 (UTC)
Date: Fri, 10 Feb 2023 16:59:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v3 08/14] io: Add preadv support to QIOChannelFile
Message-ID: <Y+Z4DY13AdzgIGXo@redhat.com>
References: <20221028103914.908728-1-nborisov@suse.com>
 <20221028103914.908728-9-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028103914.908728-9-nborisov@suse.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Fri, Oct 28, 2022 at 01:39:08PM +0300, Nikolay Borisov wrote:
> preadv is going to be needed when 'fixed-ram'-enabled stream are to be
> restored. Add a minimal implementation of preadv for file channels and
> expose it via the generic io_preadv interface.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  io/channel-file.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/io/channel-file.c b/io/channel-file.c
> index e213a0fd7cd2..d2f4706b7f6d 100644
> --- a/io/channel-file.c
> +++ b/io/channel-file.c
> @@ -145,6 +145,32 @@ static ssize_t qio_channel_file_writev(QIOChannel *ioc,
>      return ret;
>  }
>  
> +static ssize_t qio_channel_file_preadv(QIOChannel *ioc,
> +                                       const struct iovec *iov,
> +                                       size_t niov,
> +                                       off_t offset,
> +                                       Error **errp)
> +{
> +    QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
> +    ssize_t ret;
> +
> + retry:
> +    ret = preadv(fioc->fd, iov, niov, offset);
> +    if (ret < 0) {
> +        if (errno == EAGAIN) {
> +            return QIO_CHANNEL_ERR_BLOCK;
> +        }
> +        if (errno == EINTR) {
> +            goto retry;
> +        }
> +
> +        error_setg_errno(errp, errno, "Unable to read from file");
> +        return -1;
> +    }
> +
> +    return ret;
> +}
> +
>  static ssize_t qio_channel_file_pwritev(QIOChannel *ioc,
>                                          const struct iovec *iov,
>                                          size_t niov,
> @@ -252,6 +278,7 @@ static void qio_channel_file_class_init(ObjectClass *klass,
>      ioc_klass->io_readv = qio_channel_file_readv;
>      ioc_klass->io_set_blocking = qio_channel_file_set_blocking;
>      ioc_klass->io_pwritev = qio_channel_file_pwritev;
> +    ioc_klass->io_preadv = qio_channel_file_preadv;
>      ioc_klass->io_seek = qio_channel_file_seek;
>      ioc_klass->io_close = qio_channel_file_close;
>      ioc_klass->io_create_watch = qio_channel_file_create_watch;

I'd suggest this patch should just be merged into the patch which
adds the io_pwritev callback.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


