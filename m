Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9E42988B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 23:00:55 +0200 (CEST)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma2Pl-0005Zf-Sl
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 17:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1ma2OG-0004tm-NV
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 16:59:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1ma2OD-0000Q6-U5
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 16:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633985956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AAPILaYKmYSTNpLbdlaQJBlTHsqrnUcXUtglqrpDylY=;
 b=BTpC/yKZpV+4QyfJ5ZutKuc4qsx62igxtUA2gSfsKX/5veYw4Wll8+uPcxIhFBVc+/OnLe
 q4aFlSKYOfsbGIEgUotMsqZE5kxN71vVbBTdilFHpXPanZwoeL6ObP5E/cQPgMcUnjXkS0
 oFayYM5QEkefQvSJgPB9p1uABX6C2t4=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-b2a3SZEvOpKeBKqYg8Ryww-1; Mon, 11 Oct 2021 16:59:13 -0400
X-MC-Unique: b2a3SZEvOpKeBKqYg8Ryww-1
Received: by mail-lf1-f70.google.com with SMTP id
 c42-20020a05651223aa00b003fd328cfeccso13594260lfv.4
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 13:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AAPILaYKmYSTNpLbdlaQJBlTHsqrnUcXUtglqrpDylY=;
 b=B7FVvgMA60fGqTGB9Sx26XdfFPYv1CAlErZUopXVzoaLNBZdYx65t0ecFjOl5h+s3k
 65HXZf612xKmctXK1iZlXNuQfLH0CxxIES3CUQzOL4lntBTEUs352W8dsafrbqeqJ8Ay
 qivZfk0yW3Bjc9UcSWrSzRu96k9eC/nQDg0eZXg9qjvhNQ8g2MwZtMjbcCjf1EsU5fhB
 Lt8RaaiskyHaYk/bYYEmu5rRBxxcDCDSf7ak8nBd6wKx9FXkw10O8B0FhG058hxSV7GN
 tp8RKeIaFFal/jB/yJGka5ClkzsvUuH8XdQCi5OUaN8hlkeq3P56vufgBanBGPO2Mup+
 JnQw==
X-Gm-Message-State: AOAM530xYXwkzhgzYX0cJ62okkbD+kelIz+r+ewR6nwU71bOWMzYctn8
 rCv3vFOC3b2+nVdv3QcQaK6ccUY3l7u2qiFlk5LARvxKc/S5dkh9ltAq3xciofXOY11jbKEmh1s
 3Bb0fCI40Jjx6fY3SFge/6m+pIkdJQB4=
X-Received: by 2002:a2e:9947:: with SMTP id r7mr4672964ljj.162.1633985951483; 
 Mon, 11 Oct 2021 13:59:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHd9dx6ifUMhBtbZryBCqoD6srNVqQ4dz90tKjayxJFm6cLiJ2i1KVHoIrIMQ3IRLLxzwX6wLWwiR8B1sM+VE=
X-Received: by 2002:a2e:9947:: with SMTP id r7mr4672930ljj.162.1633985951171; 
 Mon, 11 Oct 2021 13:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-2-leobras@redhat.com>
 <20211011191708.or43v24srlm6srog@redhat.com>
 <CAJ6HWG6jMC__-iQ6Xu6uRmzyUr4u0Pq55POc=J6bhHr9m2Nf+A@mail.gmail.com>
 <20211011204500.wcqid6b5bqog4rci@redhat.com>
In-Reply-To: <20211011204500.wcqid6b5bqog4rci@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 11 Oct 2021 17:59:12 -0300
Message-ID: <CAJ6HWG7k4juT5CyO=HGjzmR+QUy_5qERFS9BhC5PirBY_aTkgA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 5:45 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Mon, Oct 11, 2021 at 04:38:23PM -0300, Leonardo Bras Soares Passos wrote:
> > > >  /**
> > > > - * qio_channel_writev_full:
> > > > + * qio_channel_writev_full_flags:
> > > >   * @ioc: the channel object
> > > >   * @iov: the array of memory regions to write data from
> > > >   * @niov: the length of the @iov array
> > > >   * @fds: an array of file handles to send
> > > >   * @nfds: number of file handles in @fds
> > > > + * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
> > > >   * @errp: pointer to a NULL-initialized error object
> > > >   *
> > > >   * Write data to the IO channel, reading it from the
> > > > @@ -242,6 +252,10 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
> > > >   * guaranteed. If the channel is non-blocking and no
> > > >   * data can be sent, it will return QIO_CHANNEL_ERR_BLOCK
> > > >   *
> > > > + * If flag QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed,
> > > > + * function will return once each buffer was queued for
> > > > + * sending.
> > >
> > > This would be a good place to document the requirement to keep the
> > > buffer unchanged until the zerocopy sequence completes.
> >
> > That makes sense, even though that may be true for just some implementations,
> > it makes sense to document it here.
> >
>
> >
> > Ok,
> > Is it enough to document it in a single one of the places suggested, or
> > would you recommend documenting it in all suggested places?
>
> Ah, the curse of maintaining copy-and-paste.  If you can find a way to
> say "see this other type for limitations" that sounds fine, it avoids
> the risk of later edits touching one but not all identical copies.
> But our current process for generating sphynx documentation from the
> qapi generator does not have cross-referencing abilities that I'm
> aware of.  Markus or John, any thoughts?
>
> > >
> > > > +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> > > > +                               Error **errp)
> > > > +{
> > > > +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> > > > +
> > > > +    if (!klass->io_flush_zerocopy ||
> > > > +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
> > > > +        return 0;
> > >
> > > Matches your documentation, but an ideal app should not be trying to
> > > flush if the write failed in the first place.  So wouldn't it be
> > > better to return -1 or even abort() on a coding error?
> >
> > The point here is that any valid user of zrocopy_flush would have
> > already used zerocopy_writev
> > at some point, and failed if not supported / enabled.
> >
> > Having this not returning error can help the user keep a simpler
> > approach when using
> > a setup in which the writev can happen in both zerocopy or default behavior.
> >
> > I mean, the user will not need to check if zerocopy was or was not
> > enabled, and just flush anyway.
> >
> > But if it's not good behavior, or you guys think it's a better
> > approach to fail here, I can also do that.
>
> Either flush is supposed to be a no-op when zerocopy fails (so
> returning 0 is okay), or should not be attempted unless zerocopy
> succeeded (in which case abort()ing seems like the best way to point
> out the programmer's error).  But I wasn't clear from your
> documentation which of the two behaviors you had in mind.

Oh, sorry about that.
Yeah, I intend to use it as a no-op.
If it's fine I will update the docs for v5.


>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>

Thanks!


