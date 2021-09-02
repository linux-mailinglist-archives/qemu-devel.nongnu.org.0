Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6DD3FEA9B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 10:27:28 +0200 (CEST)
Received: from localhost ([::1]:58758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLi4F-0008LD-9S
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 04:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLi2r-00073T-Uc
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLi2p-0003iN-S3
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630571159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EhR0MKDl0ymk1iI+myy91ULcM3jOYC1j0v9WizRUeS4=;
 b=CzbKZjDgcUrP5/eaZXARo/BoQeVFk3YnWl0fq7N4gn/CSd0x6wOFm76pKfId9baD4ChsZk
 JmevJP6g8c7DY1uqMuvbWew/BmCA8YgKMy3mjaDGtyxxdAK3F7OXtNxH8hsxjEQ1FucfTk
 tmVaZdiG04W9zB1e7nESr6F45xPRVD0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-3UseXp2AMTq0ciuxXitDqw-1; Thu, 02 Sep 2021 04:25:56 -0400
X-MC-Unique: 3UseXp2AMTq0ciuxXitDqw-1
Received: by mail-lj1-f197.google.com with SMTP id
 a38-20020a05651c212600b001ca48d59b47so343230ljq.22
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 01:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EhR0MKDl0ymk1iI+myy91ULcM3jOYC1j0v9WizRUeS4=;
 b=p4pmbPeTwsh1cfwxFQ4JHwm9gjeDCZY76Yv52yqKxFkc02pl9KizUVY0qFFpzXBXLA
 FVgXA8NhtbcYlvd/h8gco6GAxsf3ck4lDZVikImpVhmlaYe6EC6ZPMVhpmKT1T6lcFvF
 ijwz6kbjN0/2jhyA0+anB8NI5IkQeUaFoGc5SXgDiRgZmugiUa+QZNCbsOhFLKTTZiaA
 yeymuP0870lhrpwvHKHkx5icXvlTPTv8g24pwCFc27KpJ5P6kOevrFJIUgOpcqRL7Wgt
 3y/bndWOJew2qWVpf/j8kY3I3VPjfhI++oeS7sIPBArAkveofAyHVWoTBbbC4oURgDrg
 3BGA==
X-Gm-Message-State: AOAM532FPAruvO4Wk6jBguECogTjGP8kP/ED5O9INXjyZiGkGFrQxhvU
 85ifvdQkIYHYpA67ks+WIWitrmSbTmXtcLEIwCETzzsJWTClsxOgpv6SLEDec32VYKghZhlHMtg
 6FfpM51tzyICSPieQCChhbvSB66ju4VI=
X-Received: by 2002:a2e:7a12:: with SMTP id v18mr1546823ljc.204.1630571153360; 
 Thu, 02 Sep 2021 01:25:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9QARmK8uftctJDZIzC3wl2PtupFZKCtg5dUxpRq5OG+CtPh7F3LEW3sp8C545j6ooABlsZKncUeNnta8TnFs=
X-Received: by 2002:a2e:7a12:: with SMTP id v18mr1546789ljc.204.1630571152837; 
 Thu, 02 Sep 2021 01:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-2-leobras@redhat.com>
 <20210901205405.f3dc4vpqinfy7gkx@redhat.com>
In-Reply-To: <20210901205405.f3dc4vpqinfy7gkx@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 05:26:04 -0300
Message-ID: <CAJ6HWG6qNjvcV5CKMSGKjZTXenguiAwN4gt528oSxkv5BqrCDw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] io: Enable write flags for QIOChannel
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the feedback Eric!

On Wed, Sep 1, 2021 at 5:54 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Tue, Aug 31, 2021 at 08:02:37AM -0300, Leonardo Bras wrote:
> > Some syscalls used for writting, such as sendmsg(), accept flags that
> > can modify their behavior, even allowing the usage of features such as
> > MSG_ZEROCOPY.
> >
> > Change qio_channel_write*() interface to allow passing down flags,
> > allowing a more flexible use of IOChannel.
> >
> > At first, it's use is enabled for QIOChannelSocket, but can be easily
> > extended to any other QIOChannel implementation.
>
> As a followup to this patch, I wonder if we can also get performance
> improvements by implementing MSG_MORE, and using that in preference to
> corking/uncorking to better indicate that back-to-back short messages
> may behave better when grouped together over the wire.  At least the
> NBD code could make use of it (going off of my experience with the
> libnbd project demonstrating a performance boost when we added
> MSG_MORE support there).

That's interesting!
We could use this patchset for testing that out, as I believe it's easy
to add those flags to the sendmsg() we want to have it enabled.

>
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  chardev/char-io.c                   |  2 +-
> >  hw/remote/mpqemu-link.c             |  2 +-
> >  include/io/channel.h                | 56 ++++++++++++++++++++---------
> >  io/channel-buffer.c                 |  1 +
> >  io/channel-command.c                |  1 +
> >  io/channel-file.c                   |  1 +
> >  io/channel-socket.c                 |  4 ++-
> >  io/channel-tls.c                    |  1 +
> >  io/channel-websock.c                |  1 +
> >  io/channel.c                        | 53 ++++++++++++++-------------
> >  migration/rdma.c                    |  1 +
> >  scsi/pr-manager-helper.c            |  2 +-
> >  tests/unit/test-io-channel-socket.c |  1 +
> >  13 files changed, 81 insertions(+), 45 deletions(-)
> >
> > diff --git a/chardev/char-io.c b/chardev/char-io.c
> > index 8ced184160..4ea7b1ee2a 100644
> > --- a/chardev/char-io.c
> > +++ b/chardev/char-io.c
> > @@ -122,7 +122,7 @@ int io_channel_send_full(QIOChannel *ioc,
> >
> >          ret = qio_channel_writev_full(
> >              ioc, &iov, 1,
> > -            fds, nfds, NULL);
> > +            fds, 0, nfds, NULL);
>
> 0 before nfds here...

Good catch! I will fix that for v2!

>
> >          if (ret == QIO_CHANNEL_ERR_BLOCK) {
> >              if (offset) {
> >                  return offset;
> > diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> > index 7e841820e5..0d13321ef0 100644
> > --- a/hw/remote/mpqemu-link.c
> > +++ b/hw/remote/mpqemu-link.c
> > @@ -69,7 +69,7 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
> >      }
> >
> >      if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
> > -                                    fds, nfds, errp)) {
> > +                                     fds, nfds, 0, errp)) {
>
> Thanks for fixing the broken indentation.

I kept questioning myself if I was breaking something here :)

>
> ...but after nfds here, so one is wrong; up to this point in a linear
> review, I can't tell which was intended...
>
> > +++ b/include/io/channel.h
> > @@ -104,6 +104,7 @@ struct QIOChannelClass {
> >                           size_t niov,
> >                           int *fds,
> >                           size_t nfds,
> > +                         int flags,
> >                           Error **errp);
>
> ...and finally I see that in general, you wanted to add the argument
> after.  Looks like the change to char-io.c is buggy.

Yeap!

>
> (You can use scripts/git.orderfile as a way to force your patch to
> list the .h file first, to make it easier for linear review).

Nice tip! just added to my qemu gitconfig :)

>
> >      ssize_t (*io_readv)(QIOChannel *ioc,
> >                          const struct iovec *iov,
> > @@ -260,6 +261,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
> >                                  size_t niov,
> >                                  int *fds,
> >                                  size_t nfds,
> > +                                int flags,
> >                                  Error **errp);
> >
> >  /**
> > @@ -325,6 +327,7 @@ int qio_channel_readv_all(QIOChannel *ioc,
> >   * @ioc: the channel object
> >   * @iov: the array of memory regions to write data from
> >   * @niov: the length of the @iov array
> > + * @flags: optional sending flags
> >   * @errp: pointer to a NULL-initialized error object
> >   *
> >   * Write data to the IO channel, reading it from the
> > @@ -339,10 +342,14 @@ int qio_channel_readv_all(QIOChannel *ioc,
> >   *
> >   * Returns: 0 if all bytes were written, or -1 on error
> >   */
> > -int qio_channel_writev_all(QIOChannel *ioc,
> > -                           const struct iovec *iov,
> > -                           size_t niov,
> > -                           Error **erp);
> > +int qio_channel_writev_all_flags(QIOChannel *ioc,
> > +                                 const struct iovec *iov,
> > +                                 size_t niov,
> > +                                 int flags,
> > +                                 Error **errp);
>
> You changed the function name here, but not in the comment beforehand.
>

Will fix this for v2, thanks !

> > +
> > +#define qio_channel_writev_all(ioc, iov, niov, errp) \
> > +    qio_channel_writev_all_flags(ioc, iov, niov, 0, errp)
>
> In most cases, you were merely adding a new function to minimize churn
> to existing callers while making the old name a macro,...
>
> > @@ -853,6 +876,7 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
> >                                  const struct iovec *iov,
> >                                  size_t niov,
> >                                  int *fds, size_t nfds,
> > +                                int flags,
> >                                  Error **errp);
>
> ...but this one you changed in-place.  Any reason?  It might be nice
> to mention how you chose which functions to wrap (to minimize churn to
> existing clients) vs. modify signatures.

It's the first one I did change, TBH.
It just had a few uses. mostly in the same file scope, and a single
use on mpqemu-link.c,
so I thought it would be ok to just change it.

But yeah, it makes sense to also add a macro to this one as well, and
create another function to keep them all looking the same.

>
> >
> >  #endif /* QIO_CHANNEL_H */
> > diff --git a/io/channel-buffer.c b/io/channel-buffer.c
> > index baa4e2b089..bf52011be2 100644
> > --- a/io/channel-buffer.c
> > +++ b/io/channel-buffer.c
> > @@ -81,6 +81,7 @@ static ssize_t qio_channel_buffer_writev(QIOChannel *ioc,
> >                                           size_t niov,
> >                                           int *fds,
> >                                           size_t nfds,
> > +                                         int flags,
> >                                           Error **errp)
> >  {
> >      QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(ioc);
>
> Would it be wise to check that flags only contains values we can honor
> in this (and all other) implementations of qio backends?  Do we need
> some way for a backend to advertise to the core qio code which flags
> it is willing to accept?

That's a good idea, maybe we can do as you suggest below, choose a set of
features we are willing to support and then translate it depending on the
implementation. Then this would only be testing for a mask.

>
> > +++ b/io/channel-socket.c
> > @@ -525,6 +525,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> >                                           size_t niov,
> >                                           int *fds,
> >                                           size_t nfds,
> > +                                         int flags,
> >                                           Error **errp)
> >  {
> >      QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> > @@ -558,7 +559,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> >      }
> >
> >   retry:
> > -    ret = sendmsg(sioc->fd, &msg, 0);
> > +    ret = sendmsg(sioc->fd, &msg, flags);
>
> Because of this line, we are forcing our use of flags to be exactly
> the same set of MSG_* flags understood by sendmsg(), which feels a bit
> fragile.  Wouldn't it be safer to define our own set of QIO_MSG_
> flags, and map those into whatever flag values the underlying backends
> can support?  After all, one thing I learned on libnbd is that
> MSG_MORE is not universally portable, but the goal of qio is to
> abstract away things so that the rest of the code doesn't have to do
> #ifdef tests everywhere, but instead let the qio code deal with it
> (whether to ignore an unsupported flag because it is only an
> optimization hint, or to return an error because we depend on the
> behavior change the flag would cause if supported, or...).  And that
> goes back to my question of whether backends should have a way to
> inform the qio core which flags they can support.

I think you are correct and  having our own QIO_MSG_* would make
sense here. This could allow us to filter incorrect flags easily, and also
have well documented what each implementation supports, by their own
masks.

Thanks!

Leonardo Bras

>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>


