Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD5842985D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 22:47:32 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma2Co-0001lG-IR
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 16:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma2BK-00015C-Hj
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 16:45:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma2BG-0000IV-5t
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 16:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633985151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sjcnr9J+wFjGjVwPk4SoBq16Yd7sHVkY8pHUw0v7PX8=;
 b=ZN8zDVf1MNr4kCx9fhpQjazdVkFyIcVAqmIc1TarLw3VZFxYIwxGlkVq24Pe4e4HK7482O
 kQ1ry2va3FnkCD8449p9n9WxZoYDwlOduNI20R/heYJ8Z+YX1KgaZU0+H2PhDvS6BXmRgI
 kJMOiymD0RuAe5wvHMmUOGCm71Grmoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-cgw6vEW8MOeu9vFo1coqNA-1; Mon, 11 Oct 2021 16:45:49 -0400
X-MC-Unique: cgw6vEW8MOeu9vFo1coqNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E54CF801A93
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 20:45:48 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D65260938;
 Mon, 11 Oct 2021 20:45:02 +0000 (UTC)
Date: Mon, 11 Oct 2021 15:45:00 -0500
From: Eric Blake <eblake@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v4 1/3] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
Message-ID: <20211011204500.wcqid6b5bqog4rci@redhat.com>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-2-leobras@redhat.com>
 <20211011191708.or43v24srlm6srog@redhat.com>
 <CAJ6HWG6jMC__-iQ6Xu6uRmzyUr4u0Pq55POc=J6bhHr9m2Nf+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG6jMC__-iQ6Xu6uRmzyUr4u0Pq55POc=J6bhHr9m2Nf+A@mail.gmail.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 04:38:23PM -0300, Leonardo Bras Soares Passos wrote:
> > >  /**
> > > - * qio_channel_writev_full:
> > > + * qio_channel_writev_full_flags:
> > >   * @ioc: the channel object
> > >   * @iov: the array of memory regions to write data from
> > >   * @niov: the length of the @iov array
> > >   * @fds: an array of file handles to send
> > >   * @nfds: number of file handles in @fds
> > > + * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
> > >   * @errp: pointer to a NULL-initialized error object
> > >   *
> > >   * Write data to the IO channel, reading it from the
> > > @@ -242,6 +252,10 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
> > >   * guaranteed. If the channel is non-blocking and no
> > >   * data can be sent, it will return QIO_CHANNEL_ERR_BLOCK
> > >   *
> > > + * If flag QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed,
> > > + * function will return once each buffer was queued for
> > > + * sending.
> >
> > This would be a good place to document the requirement to keep the
> > buffer unchanged until the zerocopy sequence completes.
> 
> That makes sense, even though that may be true for just some implementations,
> it makes sense to document it here.
> 

> 
> Ok,
> Is it enough to document it in a single one of the places suggested, or
> would you recommend documenting it in all suggested places?

Ah, the curse of maintaining copy-and-paste.  If you can find a way to
say "see this other type for limitations" that sounds fine, it avoids
the risk of later edits touching one but not all identical copies.
But our current process for generating sphynx documentation from the
qapi generator does not have cross-referencing abilities that I'm
aware of.  Markus or John, any thoughts?

> >
> > > +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> > > +                               Error **errp)
> > > +{
> > > +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> > > +
> > > +    if (!klass->io_flush_zerocopy ||
> > > +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
> > > +        return 0;
> >
> > Matches your documentation, but an ideal app should not be trying to
> > flush if the write failed in the first place.  So wouldn't it be
> > better to return -1 or even abort() on a coding error?
> 
> The point here is that any valid user of zrocopy_flush would have
> already used zerocopy_writev
> at some point, and failed if not supported / enabled.
> 
> Having this not returning error can help the user keep a simpler
> approach when using
> a setup in which the writev can happen in both zerocopy or default behavior.
> 
> I mean, the user will not need to check if zerocopy was or was not
> enabled, and just flush anyway.
> 
> But if it's not good behavior, or you guys think it's a better
> approach to fail here, I can also do that.

Either flush is supposed to be a no-op when zerocopy fails (so
returning 0 is okay), or should not be attempted unless zerocopy
succeeded (in which case abort()ing seems like the best way to point
out the programmer's error).  But I wasn't clear from your
documentation which of the two behaviors you had in mind.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


