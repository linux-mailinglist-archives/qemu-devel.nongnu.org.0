Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EE74932AA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 03:02:40 +0100 (CET)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA0J4-0003FW-WE
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 21:02:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA0FO-0002TZ-Dm
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 20:58:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA0FD-00080b-BD
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 20:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642557517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pvh7yRUY4f31ryXH4Vry+J5kIWZdIIztYz+eundYQus=;
 b=Eb3Y5Am6JCL9wV+6PRlRenGNn6hFt7PZ3YRBxQrZP9FNVOWPZBdlJe1tIOpvZKLZ3Q+/cr
 lKtJ18MXK4vf5n5sIktjBIFCwlAMDbYOn+TNowFg7mq839AnxUZmoaolVKLBX4M7RIb4vE
 RFCAaPopimyEaEkS2HnA+SMjA/E34rw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-LZzKo_YEPqi2Z8WEverP6w-1; Tue, 18 Jan 2022 20:58:36 -0500
X-MC-Unique: LZzKo_YEPqi2Z8WEverP6w-1
Received: by mail-pl1-f197.google.com with SMTP id
 p17-20020a170903249100b0014af06caa65so172186plw.6
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 17:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pvh7yRUY4f31ryXH4Vry+J5kIWZdIIztYz+eundYQus=;
 b=IIR2UrQGLlY2YJVAFr904j5uESlJbzwQCNbb/Y3KN3CstoVhnIuF9tgKJ+SfMvMe+Q
 rGGtjvpSVp0S5g8boGhGnr1XZNixdpZk243EcMs9nVYEFAHufnibvx7iH0jlOsC20+rK
 +ykdMQpw7BZgpPYDAavmVBlOJu9Jct5rgcXDVFOwhkBwfUE/a7YkHVaQWty2pH8pdUD9
 F3sYlDArw+XYyNdzpgX8verKU/naMLBAxnZ/X9e/UrRBj6RxM7nXuMzC13NmB5e4ucy3
 OfluO1Slbtc2sFQWoeg20OADLyWv5IncTMpfV3qMs1VZOAQA5HrFvDVRfhM0zLBns/64
 sG6Q==
X-Gm-Message-State: AOAM5319dkaarPqIVctLKKSZTeJ9vAopooj+7CXQShfG0y78sHDYLLgF
 Fp9s5cZx7Y8OzAGfMX2wW8iIyLmFOgSA1ftsfl9hEfitcxgQYSbZoNgR9BBs386U2t2kfmpIR72
 +/m9qHfbgvZ49LWo=
X-Received: by 2002:a65:6093:: with SMTP id t19mr23656177pgu.566.1642557515359; 
 Tue, 18 Jan 2022 17:58:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlgSQP2Kw56RTTfF9if7LrYfOEPqZn5kL4oz5GgfanKSdavCFNXCabFUOUX4vyFaY0zq4+7Q==
X-Received: by 2002:a65:6093:: with SMTP id t19mr23656158pgu.566.1642557515051; 
 Tue, 18 Jan 2022 17:58:35 -0800 (PST)
Received: from xz-m1.local ([191.101.132.241])
 by smtp.gmail.com with ESMTPSA id na16sm4159633pjb.7.2022.01.18.17.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 17:58:33 -0800 (PST)
Date: Wed, 19 Jan 2022 09:58:19 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v7 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
Message-ID: <YedwO5krFYGoDKCt@xz-m1.local>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-2-leobras@redhat.com>
 <Yd/GhH1fExRgd4yA@xz-m1.local>
 <CAJ6HWG6_JEyH0dohWa=p9vePGb3f1jRaT_z6viDTQobXGW9oiA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG6_JEyH0dohWa=p9vePGb3f1jRaT_z6viDTQobXGW9oiA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 05:45:09PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Peter,
> 
> On Thu, Jan 13, 2022 at 3:28 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Thu, Jan 06, 2022 at 07:13:38PM -0300, Leonardo Bras wrote:
> > > diff --git a/io/channel.c b/io/channel.c
> > > index e8b019dc36..904855e16e 100644
> > > --- a/io/channel.c
> > > +++ b/io/channel.c
> > > @@ -67,12 +67,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
> > >  }
> > >
> > >
> > > -ssize_t qio_channel_writev_full(QIOChannel *ioc,
> > > -                                const struct iovec *iov,
> > > -                                size_t niov,
> > > -                                int *fds,
> > > -                                size_t nfds,
> > > -                                Error **errp)
> > > +ssize_t qio_channel_writev_full_flags(QIOChannel *ioc,
> > > +                                      const struct iovec *iov,
> > > +                                      size_t niov,
> > > +                                      int *fds,
> > > +                                      size_t nfds,
> > > +                                      int flags,
> > > +                                      Error **errp)
> > >  {
> > >      QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> > >
> > > @@ -83,7 +84,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
> > >          return -1;
> > >      }
> >
> > Should we better also check QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY here when
> > QIO_CHANNEL_WRITE_FLAG_ZERO_COPY is set?  Just like what we do with:
> 
> Yes, that's correct.
> I will also test for fds + zerocopy_flag , which should also fail here.
> 
> >
> >     if ((fds || nfds) &&
> >         !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
> >         error_setg_errno(errp, EINVAL,
> >                          "Channel does not support file descriptor passing");
> >         return -1;
> >     }
> >
> > I still think it's better to have the caller be crystal clear when to use
> > zero_copy feature because it has implication on buffer lifetime.
> 
> I don't disagree with that suggestion.
> 
> But the buffer lifetime limitation is something on the socket
> implementation, right?
> There could be some synchronous zerocopy implementation that does not
> require flush, and thus
> don't require the buffer to be treated any special. Or am I missing something?

Currently the flush() is required for zerocopy and not required for all the
existing non-zerocopy use cases, that's already an API difference so the caller
needs to identify it anyway.  Then I think it's simpler we expose all of it to
the user.

Not to mention IIUC if we don't fail here, it will just fail later when the
code will unconditionally convert the flags=ZEROCOPY into MSG_ZEROCOPY in your
next patch:

    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
        sflags = MSG_ZEROCOPY;
    }

So AFAIU it'll fail anyway, either here with the cap check I mentioned, or
later in sendmsg().

IOW, I think it fails cleaner here, rather than reaching sendmsg().

> 
> >
> > I might have commented similar things before, but I have missed a few versions
> > so I could also have missed some previous discussions..
> >
> 
> That's all great suggestions Peter!  Thanks for that!
> 
> Some of the previous suggestions may have been missed because a lot of
> code moved.
> Sorry about that.

Not a problem at all, I just want to make sure my question still makes
sense. :)

-- 
Peter Xu


