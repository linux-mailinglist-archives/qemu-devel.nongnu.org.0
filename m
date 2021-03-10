Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE11333BC9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:50:26 +0100 (CET)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxM9-0005KI-Ai
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJxGF-0008By-LV
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:44:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJxGD-0003Yx-Kz
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615376656;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w9m+xUBVCQqJIx62naRE5hDFWNTNXaS0A37WOoit3qU=;
 b=VwuxFPbD9T9u44jpMrTRvSZsxbOmfHcIijHvUiwLaiQF7pzp8D7lZ7uZ2z2GHrK/3/2h0z
 w6abE15xW2S44mPp3A8COpHrsxH8t/iQfjl3cW/ipml60wnt14rc7GMgKGVE5SRKdHhVzM
 2cBo+e7kCo3IVkvGYM7s60Wpdh7dh5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-Cy8ctHvIMkWIBpGD87WvBg-1; Wed, 10 Mar 2021 06:44:11 -0500
X-MC-Unique: Cy8ctHvIMkWIBpGD87WvBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10F36804333;
 Wed, 10 Mar 2021 11:44:10 +0000 (UTC)
Received: from redhat.com (ovpn-115-24.ams2.redhat.com [10.36.115.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9556460CE9;
 Wed, 10 Mar 2021 11:44:01 +0000 (UTC)
Date: Wed, 10 Mar 2021 11:43:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/4] vhost-user: Convert slave channel to QIOChannelSocket
Message-ID: <YEiw/v3vhB7y6ve3@redhat.com>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-3-groug@kaod.org>
 <YEeRgY2WEFSw+1qG@stefanha-x1.localdomain>
 <20210309212322.3ab5809d@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210309212322.3ab5809d@bahia.lan>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 09:23:22PM +0100, Greg Kurz wrote:
> On Tue, 9 Mar 2021 15:17:21 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> 
> > On Mon, Mar 08, 2021 at 01:31:39PM +0100, Greg Kurz wrote:
> > > +    g_autofree int *fd = NULL;
> > > +    size_t fdsize = 0;
> > > +    int i;
> > >  
> > >      /* Read header */
> > >      iov.iov_base = &hdr;
> > >      iov.iov_len = VHOST_USER_HDR_SIZE;
> > >  
> > >      do {
> > > -        size = recvmsg(u->slave_fd, &msgh, 0);
> > > -    } while (size < 0 && (errno == EINTR || errno == EAGAIN));
> > > +        size = qio_channel_readv_full(ioc, &iov, 1, &fd, &fdsize, NULL);
> > > +    } while (size == QIO_CHANNEL_ERR_BLOCK);
> > 
> > Is it possible to leak file descriptors and fd[] memory if we receive a
> > short message and then loop around? qio_channel_readv_full() will
> > overwrite &fd and that's how the leak occurs.
> > 
> 
> qio_channel_readv_full() only returns QIO_CHANNEL_ERR_BLOCK when the
> channel is non-blocking mode and no data is available. Under the hood,
> this translates to this code in qio_channel_socket_readv():
> 
>  retry:
>     ret = recvmsg(sioc->fd, &msg, sflags);
>     if (ret < 0) {
>         if (errno == EAGAIN) {
>             return QIO_CHANNEL_ERR_BLOCK;
>         }
>         if (errno == EINTR) {
>             goto retry;
>         }
> 
>         error_setg_errno(errp, errno,
>                          "Unable to read from socket");
>         return -1;
>     }
> 
> This is strictly equivalent to what we currently have. This cannot
> leak file descriptors because we would only loop until the first
> byte of real data is available and ancillary data cannot fly without
> real data, i.e. no file descriptors when recvmsg() returns EAGAIN.

Yep, EAGAIN will only happen if you have no data AND no FDs.

> 
> > On the other hand, it looks like ioc is in blocking mode. I'm not sure
> > QIO_CHANNEL_ERR_BLOCK can occur?
> > 
> 
> You're right but the existing code is ready to handle the non-blocking
> case, so I just kept this behavior.

The existing code is *not* handling the non-blocking case in any
useful way IMHO. It will block execution of this QEMU thread, and
sit in a tight loop burning CPU in the EAGAIN case.

Handling non-blocking means using an I/O watch with the event loop
to be notified when something becomes ready.

I notice the code that follows is also doing


    if (size != VHOST_USER_HDR_SIZE) {
        error_report("Failed to read from slave.");
        goto err;
    }

which is also dubious because it assumes the previous recvmsg is
guaranteed to return VHOST_USER_HDR_SIZE bytes of data in a single
call.

It does at least look like the code is intentionally blocking
execution fo the QEMU thread until the expected amount of I/O
is receieved.

Given this, you should remove the while loop entirely and
just call

   qio_channel_readv_full_all()

this will block execution until *all* the requestd data bytes
are read. It will re-try the recvmsg in the event of a partial
data read, and will intelligently wait in poll() on EAGAIN.

> 
> > > @@ -1500,8 +1479,8 @@ static void slave_read(void *opaque)
> > >  
> > >      /* Read payload */
> > >      do {
> > > -        size = read(u->slave_fd, &payload, hdr.size);
> > > -    } while (size < 0 && (errno == EINTR || errno == EAGAIN));
> > > +        size = qio_channel_read(ioc, (char *) &payload, hdr.size, NULL);
> > > +    } while (size == QIO_CHANNEL_ERR_BLOCK);
> > 
> > Same question here.
> 
> This also ends up in qio_channel_socket_readv().



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


