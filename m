Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB2042B77B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:37:46 +0200 (CEST)
Received: from localhost ([::1]:60422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXtZ-0006wX-Ri
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maXp7-0003Iu-48
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:33:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maXp3-0000LZ-IC
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634106784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M+LPrtsTH2xYnVNl5SE9QbQMpgvdGIjAA8SIwYEH5+c=;
 b=HigGorq63MPQqoOXAtxGpq4NlMbIvWzihwT8FMwAX1nTXKkg/6nj+sWObMsOYgJhTJrRpo
 Y6J5DbORN0o7E67Xrunftx577piN0DozSGSUafD9RovBbkw+rSe5XBSJaTI+hJR1qaxZ60
 EFk3Gijv18qOqJTX6i+LgQdNRb1guaY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-0_SRBR_yPvORuT4eE_adtQ-1; Wed, 13 Oct 2021 02:33:01 -0400
X-MC-Unique: 0_SRBR_yPvORuT4eE_adtQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 q7-20020a170902edc700b0013f15c17dd0so593466plk.23
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 23:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M+LPrtsTH2xYnVNl5SE9QbQMpgvdGIjAA8SIwYEH5+c=;
 b=gdhttCZUnD9tAReqcn43Vcpdm4JPVAs+GBldSLs5iTkyG2XS2ezgOrg9rzl6ZcFaFd
 exzbGe358uBdYVC7m874vJ6CpjflaZ24nhmoW6f/E0MmdG3Ugb/lzHhhnpqlecJg/0YC
 nrMYYvCiBST7HF24YT13JZrgZXexBq5USP4bLNW9Li2/ZNGaPlPzDywvX4SAZDpi/A83
 964A/0WHiI45hNvvVjt91i358PtyLE4bg78yoBjPJjR0W66RkVhR+BqiTnl2nsILBRA+
 4qYXLoEjWnxpWUhJfMvX/0PlXTCoVQP2mcwczTGK9ZZHmzXRM/VI3W8qmYeKakaFCAZx
 2O7A==
X-Gm-Message-State: AOAM5307Jp+WK6fUvyPzHwL3jw1+vRljLBvwLnV0ZcQC3UNbX7LAm8oL
 B/4HFEC8P/32NDADRc/IOe3pSYZJv/ffKj0gCp30PoA4Hm9K2950z7euVnuK2UlYmufHzCWDEuf
 N/CYGc6+VW8M96Z8=
X-Received: by 2002:a17:90a:7345:: with SMTP id
 j5mr11447985pjs.48.1634106780400; 
 Tue, 12 Oct 2021 23:33:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTdHUOXtiOoQBTScPwHoZfKNIHWSlDVoyZVoTO8Xnm7SVznIsQrSM3RS8Ql0eRir1bGEzSnw==
X-Received: by 2002:a17:90a:7345:: with SMTP id
 j5mr11447950pjs.48.1634106780105; 
 Tue, 12 Oct 2021 23:33:00 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id i124sm13198314pfc.153.2021.10.12.23.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:32:59 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:32:53 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 1/3] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
Message-ID: <YWZ9lWKsU83JCZxS@t490s>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-2-leobras@redhat.com>
 <YWZ3kbsbUmCyr6Ot@t490s>
MIME-Version: 1.0
In-Reply-To: <YWZ3kbsbUmCyr6Ot@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 02:07:13PM +0800, Peter Xu wrote:
> On Sat, Oct 09, 2021 at 04:56:11AM -0300, Leonardo Bras wrote:
> > -int qio_channel_writev_full_all(QIOChannel *ioc,
> > -                                const struct iovec *iov,
> > -                                size_t niov,
> > -                                int *fds, size_t nfds,
> > -                                Error **errp)
> > +int qio_channel_writev_full_all_flags(QIOChannel *ioc,
> > +                                      const struct iovec *iov,
> > +                                      size_t niov,
> > +                                      int *fds, size_t nfds,
> > +                                      int flags, Error **errp)
> >  {
> >      int ret = -1;
> >      struct iovec *local_iov = g_new(struct iovec, niov);
> > @@ -237,8 +250,8 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
> >  
> >      while (nlocal_iov > 0) {
> >          ssize_t len;
> > -        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
> > -                                      errp);
> > +        len = qio_channel_writev_full_flags(ioc, local_iov, nlocal_iov, fds, nfds,
> > +                                          flags, errp);
> 
> IMHO we can keep qio_channel_writev_full() untouched, as it is the wrapper for
> io_writev() hook right now (and it allows taking fds).  Then here instead of
> adding a new flags into it, we can introduce qio_channel_writev_zerocopy_full()
> and directly call here:
> 
>            if (flags & ZEROCOPY) {
>                assert(fds == NULL && nfds == 0);
>                qio_channel_writev_zerocopy_full(...[no fds passing in]);
>            } else {
>                qio_channel_writev_full(...[with all parameters]);
>            }
> 
> Then qio_channel_writev_zerocopy_full() should be simplely the wrapper for the
> new io_writev_zerocopy() hook.

Sorry I think the name doesn't need to have "_full" - that should be used for
io_writev() when we need to pass in fds.  zerocopy doesn't have that, so I
think we can just call it qio_channel_writev_zerocopy() as it simply does what
writev() does.

> 
> >          if (len == QIO_CHANNEL_ERR_BLOCK) {
> >              if (qemu_in_coroutine()) {
> >                  qio_channel_yield(ioc, G_IO_OUT);
> > @@ -474,6 +487,31 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
> >  }
> >  
> >  
> > +ssize_t qio_channel_writev_zerocopy(QIOChannel *ioc,
> > +                                    const struct iovec *iov,
> > +                                    size_t niov,
> > +                                    Error **errp)
> > +{
> > +    return qio_channel_writev_full_flags(ioc, iov, niov, NULL, 0,
> > +                                         QIO_CHANNEL_WRITE_FLAG_ZEROCOPY,
> > +                                         errp);
> > +}
> 
> This function is never used, right? qio_channel_writev_all_flags() is used in
> patch 3, with proper flags passed in.  Then IMHO we can drop this one.
> 
> The rest looks good, as long as with Eric's comment addressed.
> 
> Thanks,
> 
> > +
> > +
> > +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> > +                               Error **errp)
> > +{
> > +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> > +
> > +    if (!klass->io_flush_zerocopy ||
> > +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
> > +        return 0;
> > +    }
> > +
> > +    return klass->io_flush_zerocopy(ioc, errp);
> > +}
> > +
> > +
> >  static void qio_channel_restart_read(void *opaque)
> >  {
> >      QIOChannel *ioc = opaque;
> > -- 
> > 2.33.0
> > 
> 
> -- 
> Peter Xu

-- 
Peter Xu


