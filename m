Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738F46923D1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWj3-0003Y1-2m; Fri, 10 Feb 2023 11:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQWj0-0003XZ-M6
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:58:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQWiy-0003zB-LB
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676048291;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiLNcLWwnmtJI9QLCDi1/ww3J50XSemCDDUDadzNGBQ=;
 b=QiTtX3yjgO4aB4IiDLT8X6CfPLmBJgF09sq/ouQFKYu75jNydwleviNHAhgIHBKn7McUVN
 b7sY1ZWwv0GvtMRfyy7kSMiLr4U/1IP9Xqnlo5SvqVX21AVuLi/HktaoNIF4B7SBj8M3vp
 zhuOd8KV08qZwDsZQwvTY5veTMT6ets=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-9n4dNUsXOOmsehk_HCJsFw-1; Fri, 10 Feb 2023 11:58:10 -0500
X-MC-Unique: 9n4dNUsXOOmsehk_HCJsFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A554F1C08797;
 Fri, 10 Feb 2023 16:58:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DE0440CF8F0;
 Fri, 10 Feb 2023 16:58:08 +0000 (UTC)
Date: Fri, 10 Feb 2023 16:58:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>, dgilbert@redhat.com,
 qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com
Subject: Re: [PATCH v3 04/14] io: Add generic pwritev/preadv interface
Message-ID: <Y+Z3nGUC/Xmw6ULQ@redhat.com>
References: <20221028103914.908728-1-nborisov@suse.com>
 <20221028103914.908728-5-nborisov@suse.com>
 <Y+ZwLm52JzNaGT8N@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+ZwLm52JzNaGT8N@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
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

On Fri, Feb 10, 2023 at 04:26:22PM +0000, Daniel P. Berrangé wrote:
> On Fri, Oct 28, 2022 at 01:39:04PM +0300, Nikolay Borisov wrote:
> > Introduce basic pwriteve/preadv support in the generic channel layer.
> > SPecific implementation will follow for the file channel as this is
> > required in order to support migration streams with fixed location of
> > each ram page.
> > 
> > Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> > ---
> >  include/io/channel.h | 49 ++++++++++++++++++++++++++++++++++++++++++++
> >  io/channel.c         | 26 +++++++++++++++++++++++
> >  2 files changed, 75 insertions(+)
> > 
> > diff --git a/include/io/channel.h b/include/io/channel.h
> > index c680ee748021..6b10bce8bbdf 100644
> > --- a/include/io/channel.h
> > +++ b/include/io/channel.h
> > @@ -124,6 +124,16 @@ struct QIOChannelClass {
> >                             Error **errp);
> >  
> >      /* Optional callbacks */
> > +    ssize_t (*io_pwritev)(QIOChannel *ioc,
> > +                       const struct iovec *iov,
> > +                       size_t niov,
> > +                       off_t offset,
> > +                       Error **errp);
> > +    ssize_t (*io_preadv)(QIOChannel *ioc,
> > +                      const struct iovec *iov,
> > +                      size_t niov,
> > +                      off_t offset,
> > +                      Error **errp);
> 
> nit-pick the alignment of the 2nd line of parameters onwards,
> needs to be indented by 3 more spaces.
> 
> 
> > +/**
> > + * qio_channel_io_pwritev
> > + * @ioc: the channel object
> > + * @iov: the array of memory regions to write data from
> > + * @niov: the length of the @iov array
> > + * @offset: offset in the channel where writes should begin
> > + * @errp: pointer to a NULL-initialized error object
> > + *
> > + * Not all implementations will support this facility, so may report an error.
> > + * To avoid errors, the caller may check for the feature flag
> > + * QIO_CHANNEL_FEATURE_SEEKABLE prior to calling this method.
> > + *
> > + * Behaves as qio_channel_writev_full, apart from not supporting sending of file
> 
> Given this, we should have  "_full" suffix on these methods
> too for consistent naming policy.
> 
> > + * handles as well as beginning the write at the passed @offset
> > + *
> > + */
> > +ssize_t qio_channel_io_pwritev(QIOChannel *ioc, const struct iovec *iov,
> > +                               size_t niov, off_t offset, Error **errp);

In addition to giving this method the '_full' suffix, we should also
add the qio_channel_io_pwritev entrypoint which takes a single
buffer instead of iovec. The migration code in QEMUFile that is
added in a later patch in this series doesn't actually want to
use iovecs in the first place. So having the non-iov entrypoints
in QIOChannel will simplify the migration code.

> > +
> > +
> > +/**
> > + * qio_channel_io_preadv
> > + * @ioc: the channel object
> > + * @iov: the array of memory regions to read data into
> > + * @niov: the length of the @iov array
> > + * @offset: offset in the channel where writes should begin
> > + * @errp: pointer to a NULL-initialized error object
> > + *
> > + * Not all implementations will support this facility, so may report an error.
> > + * To avoid errors, the caller may check for the feature flag
> > + * QIO_CHANNEL_FEATURE_SEEKABLE prior to calling this method.
> > + *
> > + * Behaves as qio_channel_readv_full, apart from not supporting receiving of file
> > + * handles as well as beginning the read at the passed @offset
> > + *
> > + */
> > +ssize_t qio_channel_io_preadv(QIOChannel *ioc, const struct iovec *iov,
> > +                             size_t niov, off_t offset, Error **errp);
> >  /**
> >   * qio_channel_shutdown:
> >   * @ioc: the channel object
> > diff --git a/io/channel.c b/io/channel.c
> > index 0640941ac573..f5ac9499a7ad 100644
> > --- a/io/channel.c
> > +++ b/io/channel.c
> > @@ -437,6 +437,32 @@ GSource *qio_channel_add_watch_source(QIOChannel *ioc,
> >  }
> >  
> >  
> > +ssize_t qio_channel_io_pwritev(QIOChannel *ioc, const struct iovec *iov,
> > +                               size_t niov, off_t offset, Error **errp)
> > +{
> > +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> > +
> > +    if (!klass->io_pwritev) {
> > +        error_setg(errp, "Channel does not support pwritev");
> > +        return -1;
> > +    }
> 
> This also possibly benefits from a validation check
> 
>     if (!qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_SEEKABLE)) {
>         error_setg_errno(errp, EINVAL,
>                          "Requested channel is not seekable")
>         return -1;
>     }
> 
> because the QIOChannelFile impl will support io_pwritev callback,
> but not all the FDs it can use will support seeking.
> 
> Same check for preadv
> 
> > +
> > +    return klass->io_pwritev(ioc, iov, niov, offset, errp);
> > +}
> > +
> > +ssize_t qio_channel_io_preadv(QIOChannel *ioc, const struct iovec *iov,
> > +                               size_t niov, off_t offset, Error **errp)
> > +{
> > +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> > +
> > +    if (!klass->io_preadv) {
> > +        error_setg(errp, "Channel does not support preadv");
> > +        return -1;
> > +    }
> > +
> > +    return klass->io_preadv(ioc, iov, niov, offset, errp);
> > +}
> > +
> >  int qio_channel_shutdown(QIOChannel *ioc,
> >                           QIOChannelShutdown how,
> >                           Error **errp)
> > -- 
> > 2.34.1
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


