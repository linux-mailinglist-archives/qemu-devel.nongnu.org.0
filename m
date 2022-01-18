Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E1492FBA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 21:53:39 +0100 (CET)
Received: from localhost ([::1]:49404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9vU2-00064j-CM
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 15:53:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1n9vMS-00035t-93
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 15:45:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1n9vMP-0004Nv-He
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 15:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642538728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qAcmyJ7dDHapcGQZln70x9dUK0Z7lwL0SZ2yMQYEPAQ=;
 b=ZsQPgoEAR7DCe6mQb+CVkGISeirGDyK/KFvnV3QSodq6klUUSkOcVEZ37/AkG1tEpZRQxB
 qZYAGKIDX4EsA9hlT1c6tmBY765/V0rvFrhmyjTyMOzS1ZmB59O/27T74rcjUQjIRcG8jF
 3xI7RrHKf01B/n/NX8+Yxbb1iPmB1yo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-SZsHrLrSN--dGthjyUf7gA-1; Tue, 18 Jan 2022 15:45:22 -0500
X-MC-Unique: SZsHrLrSN--dGthjyUf7gA-1
Received: by mail-lf1-f69.google.com with SMTP id
 c7-20020ac24147000000b0042ac92336d1so62868lfi.2
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 12:45:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qAcmyJ7dDHapcGQZln70x9dUK0Z7lwL0SZ2yMQYEPAQ=;
 b=TOAhVlstf3JAOcorAAr2IeUNAxrr30hCbbjS3aUMYejdzby1ACvz3MgKw66Yds74I8
 bKEnX3fMJq/7wdPeisFUipMW6cfBKk5eQnXsnWZajzel89xIt2y+UIPoBbUEYwr5zCrA
 bNByG4O74TE3iaghPxXCQ76XfkWBityECFVd7Ad5Dy1HxklInCXrakMhB4iq3OimXd/Q
 5FMkW9wA5OQQMCehHYdAjOVBkQvrRzTClHL6by4IzdsoJ7Sv9/ILYyAVs6vmJ1MEQQcQ
 cQEFc0fnjyMDO0BsvVyhWUMw5TtF8e5m+jgF4XvDMhQ2FErhVjHtPRL7Mmdi0H6Arsq7
 JQSA==
X-Gm-Message-State: AOAM530ZSAa5I+V5V4wiqe7KLFH0GusQ45XIK107Kks2zvlWgnsB/Sm6
 RZJebibLUO4yFwovnKOSCdUa8lNDj/gxS83gbvD6dz0cSa/XxybpgfxPyui54KDd3gXcN8UENVj
 /u2OtvOd//0AiT9jDYXblcAZzGfiOesA=
X-Received: by 2002:a19:ad41:: with SMTP id s1mr23523735lfd.169.1642538720692; 
 Tue, 18 Jan 2022 12:45:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztYwokdzmqKzTd0DmPkS6dl4TR7PUcSXeG7pP95JcsDgTH4N0GXEAICfzc01qCdMnqRqPLw/np0S6x44Xk8Q0=
X-Received: by 2002:a19:ad41:: with SMTP id s1mr23523714lfd.169.1642538720435; 
 Tue, 18 Jan 2022 12:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-2-leobras@redhat.com>
 <Yd/GhH1fExRgd4yA@xz-m1.local>
In-Reply-To: <Yd/GhH1fExRgd4yA@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 18 Jan 2022 17:45:09 -0300
Message-ID: <CAJ6HWG6_JEyH0dohWa=p9vePGb3f1jRaT_z6viDTQobXGW9oiA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Thu, Jan 13, 2022 at 3:28 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jan 06, 2022 at 07:13:38PM -0300, Leonardo Bras wrote:
> > diff --git a/io/channel.c b/io/channel.c
> > index e8b019dc36..904855e16e 100644
> > --- a/io/channel.c
> > +++ b/io/channel.c
> > @@ -67,12 +67,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
> >  }
> >
> >
> > -ssize_t qio_channel_writev_full(QIOChannel *ioc,
> > -                                const struct iovec *iov,
> > -                                size_t niov,
> > -                                int *fds,
> > -                                size_t nfds,
> > -                                Error **errp)
> > +ssize_t qio_channel_writev_full_flags(QIOChannel *ioc,
> > +                                      const struct iovec *iov,
> > +                                      size_t niov,
> > +                                      int *fds,
> > +                                      size_t nfds,
> > +                                      int flags,
> > +                                      Error **errp)
> >  {
> >      QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> >
> > @@ -83,7 +84,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
> >          return -1;
> >      }
>
> Should we better also check QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY here when
> QIO_CHANNEL_WRITE_FLAG_ZERO_COPY is set?  Just like what we do with:

Yes, that's correct.
I will also test for fds + zerocopy_flag , which should also fail here.

>
>     if ((fds || nfds) &&
>         !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
>         error_setg_errno(errp, EINVAL,
>                          "Channel does not support file descriptor passing");
>         return -1;
>     }
>
> I still think it's better to have the caller be crystal clear when to use
> zero_copy feature because it has implication on buffer lifetime.

I don't disagree with that suggestion.

But the buffer lifetime limitation is something on the socket
implementation, right?
There could be some synchronous zerocopy implementation that does not
require flush, and thus
don't require the buffer to be treated any special. Or am I missing something?

>
> I might have commented similar things before, but I have missed a few versions
> so I could also have missed some previous discussions..
>

That's all great suggestions Peter!  Thanks for that!

Some of the previous suggestions may have been missed because a lot of
code moved.
Sorry about that.

Best regards,
Leo


