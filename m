Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49061459F78
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 10:47:11 +0100 (CET)
Received: from localhost ([::1]:56698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpSOM-0007d5-53
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 04:47:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpSN5-0006yA-JM
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 04:45:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpSN1-0002Wc-Mn
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 04:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637660746;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItZp09yEEUgHuG63hVHMZ52G30yJlbwzqhUKDeuWSwE=;
 b=eicUrwrIsLpE65/NWDvSP8dF8OTAseI7iQX+AKxqKoRfFQEUz0f2WGbtAwxWh8uVeX6cR1
 ZdSIRpEiUsDrfiKau8TAc51yQ/CkcOKZlgCPgybTimcYFiBleiZ4Gf6eRbre9GU5QmRXrZ
 aPUYQRgqEMVA0lopCdy+0Qb0HUK50q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-YLkEJcZHOg2Jx3NWDlovCA-1; Tue, 23 Nov 2021 04:45:42 -0500
X-MC-Unique: YLkEJcZHOg2Jx3NWDlovCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DD07873073
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:45:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B74AA10023AB;
 Tue, 23 Nov 2021 09:45:18 +0000 (UTC)
Date: Tue, 23 Nov 2021 09:45:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v5 1/6] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
Message-ID: <YZy4Kz/H/9sZpjCi@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-2-leobras@redhat.com>
 <YY4+LWnRTV7iaErs@redhat.com>
 <CAJ6HWG4Z7Y=qvp4SZE1+hsk-imouHrsBr9M8Seo1_zPvMtOWjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG4Z7Y=qvp4SZE1+hsk-imouHrsBr9M8Seo1_zPvMtOWjg@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 08:18:09PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Daniel,
> Thanks for the feedback!
> 
> On Fri, Nov 12, 2021 at 7:13 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Fri, Nov 12, 2021 at 02:10:36AM -0300, Leonardo Bras wrote:
> > > -int qio_channel_writev_all(QIOChannel *ioc,
> > > -                           const struct iovec *iov,
> > > -                           size_t niov,
> > > -                           Error **erp);
> > > +int qio_channel_writev_all_flags(QIOChannel *ioc,
> > > +                                 const struct iovec *iov,
> > > +                                 size_t niov,
> > > +                                 int flags,
> > > +                                 Error **errp);
> > > +#define qio_channel_writev_all(ioc, iov, niov, errp) \
> > > +    qio_channel_writev_all_flags(ioc, iov, niov, 0, errp)
> >
> > We already have separate methods for zerocopy, instead of adding
> > flags, so we shouldn't add flags to this either.
> >
> > Add a qio_channel_writev_zerocopy_all method instead.
> >
> > Internally, we can still make both qio_channel_writev_zerocopy_all
> > and qio_channel_writev_all use the same helper method, just don't
> > expose flags in the public API. Even internally we don't really
> > need flags, just a bool
> 
> I see.
> The idea of having a flag was to make it easier to expand the
> interface in the future.
> I got some feedback on v1 that would suggest it would be desired:
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210831110238.299458-2-leobras@redhat.com/
> 
> 
> >
> [...]
> > > +#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
> > > +    qio_channel_writev_full_all_flags(ioc, iov, niov, fds, nfds, 0, errp)
> >
> > There's no need for this at all. Since fd passing is not supported
> > with zerocopy, there's no reason to ever use this method.
> >
> > > +/**
> > > + * qio_channel_writev_zerocopy:
> > > + * @ioc: the channel object
> > > + * @iov: the array of memory regions to write data from
> > > + * @niov: the length of the @iov array
> > > + * @errp: pointer to a NULL-initialized error object
> > > + *
> > > + * Behaves like qio_channel_writev_full_all_flags, but may write
> >
> > qio_channel_writev
> >
> > > + * data asynchronously while avoiding unnecessary data copy.
> > > + * This function may return before any data is actually written,
> > > + * but should queue every buffer for writing.
> >
> > Callers mustn't rely on "should" docs - they must rely on the
> > return value indicating how many bytes were accepted.
> >
> > Also mention that this requires locked memory and can/will fail if
> > insufficient locked memory is available.
> >
> 
> Sure, I will update that.
> 
> > > +/**
> > > + * qio_channel_flush_zerocopy:
> > > + * @ioc: the channel object
> > > + * @errp: pointer to a NULL-initialized error object
> > > + *
> > > + * Will block until every packet queued with
> > > + * qio_channel_writev_zerocopy() is sent, or return
> > > + * in case of any error.
> > > + *
> > > + * Returns -1 if any error is found, 0 otherwise.
> >
> >   Returns -1 if any error is found, 0 if all data was sent,
> >            or 1 if all data was sent but at least some was copied.
> >
> 
> I don't really get the return 1 part, I mean, per description it will
> 'block until every queued packet was sent, so "at least some was
> copied" doesn't seem to fit here.
> Could you elaborate?

Passing the ZEROCOPY flag to the kernel does not guarantee
that the copy is avoided, it is merely a hint to the kernel

When getting the notification, the ee_code  field in the
notification struct will have the flag
SO_EE_CODE_ZEROCOPY_COPIED  set if the kernel could not
avoid the copy.

In this case, it is better for the application to stop
using the ZEROCOPY flag and just do normal writes, so
it avoids the overhead of the the notifications.

This is described in "Deferred copies" section of the
Documentation/networking/msg_zerocopy.rst in linux.git

So I'm suggesting that the return value of this method
be '0' if SO_EE_CODE_ZEROCOPY_COPIED was *NOT* set in
/all/ notifications, or '1' if SO_EE_CODE_ZEROCOPY_COPIED
was set in at least one notification.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


