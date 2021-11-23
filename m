Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98268459FA1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 10:57:48 +0100 (CET)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpSYd-0004QC-6W
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 04:57:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpSX7-0002eZ-4I
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 04:56:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpSX1-0003xU-Qb
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 04:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637661364;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xkivJHbtLcVAI5xuV8qsloLjm+W5wQir50qi1n5otSA=;
 b=WMOz+hj3YbAND6xVxZxzF+19PosMIEjGXxv6O5AQ/OLBppJ455oEuixPmAIovv9KzzgxFL
 4sAHwEMSUOBNS7parKfMIN3w4hQBge+AYJU2/EvDaXIWdjEm3FYDGGOb1eEUjJdR30h+Vb
 cfwhsUZINHtU0awW78vV3m+LZQQzoi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-229-QxhV9CVsPyqRDAR7Lnc2kQ-1; Tue, 23 Nov 2021 04:55:59 -0500
X-MC-Unique: QxhV9CVsPyqRDAR7Lnc2kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9CCE18125C1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:55:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 399E279454;
 Tue, 23 Nov 2021 09:55:57 +0000 (UTC)
Date: Tue, 23 Nov 2021 09:55:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v5 3/6] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
Message-ID: <YZy6qifB8JNwYEkp@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-4-leobras@redhat.com>
 <YY5H2ixqGpfbo5jI@redhat.com>
 <CAJ6HWG6TczHZC6EFcicG8irVb3XKdhB05bcyOb0ANAZKmRWqZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG6TczHZC6EFcicG8irVb3XKdhB05bcyOb0ANAZKmRWqZg@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 23, 2021 at 01:46:44AM -0300, Leonardo Bras Soares Passos wrote:
> Hello Daniel,
> 
> On Fri, Nov 12, 2021 at 7:54 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> [...]
> > > @@ -561,12 +577,15 @@ static ssize_t qio_channel_socket_writev_flags(QIOChannel *ioc,
> > >   retry:
> > >      ret = sendmsg(sioc->fd, &msg, flags);
> > >      if (ret <= 0) {
> > > -        if (errno == EAGAIN) {
> > > +        switch (errno) {
> > > +        case EAGAIN:
> > >              return QIO_CHANNEL_ERR_BLOCK;
> > > -        }
> > > -        if (errno == EINTR) {
> > > +        case EINTR:
> > >              goto retry;
> > > +        case ENOBUFS:
> > > +            return QIO_CHANNEL_ERR_NOBUFS;
> >
> > Why does ENOBUFS need handling separately instead of letting
> > the error_setg_errno below handle it ?
> >
> > The caller immediately invokes error_setg_errno() again,
> > just with different error message.
> >
> > No code in this series ever looks at QIO_CHANNEL_ERR_NOBUFS
> > either, so we don't even need that special error return code
> > added AFAICT ?
> >
> 
> The idea was to add a custom message for ENOBUFS return when sending
> with MSG_ZEROCOPY.
> I mean, having this message is important for the user to understand
> why the migration is failing, but it would
> not make any sense to have this message while a non-zerocopy sendmsg()
> returns with ENOBUFS.
> 
> ENOBUFS : The output queue for a network interface was full.  This
> generally indicates that the interface has stopped sending, but may be
> caused by transient congestion.
> 
> As an alternative, I could add this message inside the switch, inside
> an if (flags & MSG_ZEROCOPY) on qio_channel_socket_writev_flags()
> instead of in it's caller.
> But for me it looks bloated, I mean, dealing with an error for
> ZEROCOPY only in the general function.

It is perfectly reasonable to check flags in this method.

> OTOH, if you think that it's a better idea to deal with every error in
> qio_channel_socket_writev_flags() instead of in the caller, I will
> change it for v6. Please let me know.

Yes, this method is already taking an ERror **errp parameter and
reporting a user facing error. If we need to report different
message text for ENOBUFS, it should be done in this method too.

The reason QIO_CHANNEL_ERR_BLOCK is special is because we are
explicitly not treating it as an error scenario at all.  That's
different to the ENOBUFS case.


> 
> > >          }
> > > +
> > >          error_setg_errno(errp, errno,
> > >                           "Unable to write to socket");
> > >          return -1;
> > > @@ -670,6 +689,127 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > >  }
> > >  #endif /* WIN32 */
> > >
> > > +
> > > +#ifdef CONFIG_LINUX
> > > +
> > > +static int qio_channel_socket_poll(QIOChannelSocket *sioc, bool zerocopy,
> > > +                                   Error **errp)
> >
> > There's only one caller and it always passes zerocopy=true,
> > so this parmeter looks pointless.
> 
> I did that for possible reuse of this function in the future:
> - As of today, this is certainly compiled out, but if at some point
> someone wants to use poll for something other
> than the reading of an zerocopy errqueue, it could be reused.
> 
> But sure, if that's not desirable, I can remove the parameter (and the
> if clause for !zerocopy).
> 
> >
> > > +{
> > > +    struct pollfd pfd;
> > > +    int ret;
> > > +
> > > +    pfd.fd = sioc->fd;
> > > +    pfd.events = 0;
> > > +
> > > + retry:
> > > +    ret = poll(&pfd, 1, -1);
> > > +    if (ret < 0) {
> > > +        switch (errno) {
> > > +        case EAGAIN:
> > > +        case EINTR:
> > > +            goto retry;
> > > +        default:
> > > +            error_setg_errno(errp, errno,
> > > +                             "Poll error");
> > > +            return ret;
> >
> >        return -1;
> >
> > > +        }
> > > +    }
> > > +
> > > +    if (pfd.revents & (POLLHUP | POLLNVAL)) {
> > > +        error_setg(errp, "Poll error: Invalid or disconnected fd");
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (!zerocopy && (pfd.revents & POLLERR)) {
> > > +        error_setg(errp, "Poll error: Errors present in errqueue");
> > > +        return -1;
> > > +    }
> >
> > > +
> > > +    return ret;
> >
> >   return 0;
> 
> In the idea of future reuse I spoke above, returning zero here would
> make this function always look like the poll timed out. Some future
> users may want to repeat the waiting if poll() timed out, or if
> (return > 0) stop polling.

Now that I'm looking again, we should not really use poll() at all,
as GLib provides us higher level APIs. We in fact already have the
qio_channel_wait() method as a general purpose helper for waiting
for an I/O condition to occur.;


> I understand the idea of testing SO_EE_CODE_ZEROCOPY_COPIED to be able
> to tell whenever zerocopy fell back to copying for some reason, but I
> don't see how this can be helpful here.
> 
> Other than that I would do rv++ instead of rv=1 here, if I want to
> keep track of how many buffers were sent with zerocopy and how many
> ended up being copied.

Sure, we could do   "ret > 0 == number of buffers that were copied"
as the API contract, rather than just treating it as a boolean.



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


