Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B229443C318
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:38:12 +0200 (CEST)
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfcZf-00029P-RN
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfcSS-0006qH-TU
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfcSB-00053Q-UI
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635316224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sgMFLWm+FHFo3vieHbs7wbs3iS1zffnuA3iFOBHVmdg=;
 b=NaR2vEXWfvOlCEc6vwAf4dd5eH06NV6fitu6C1fZDLvQJ9GnAnzzXgkQxyeu4KnHLZFuPC
 kUAe1l3oX1s3Y1bHkmV7bCK+zf/2IGdb6cJE2msU+A0s+Bgf46B/14vnU/Qch7jW8U0p4H
 C+b/kvwQ6WUYUnL0gN46CEsKb02WpEo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-O_roTCw2Pquk5dgCLS9c2Q-1; Wed, 27 Oct 2021 02:30:22 -0400
X-MC-Unique: O_roTCw2Pquk5dgCLS9c2Q-1
Received: by mail-lf1-f71.google.com with SMTP id
 bq29-20020a056512151d00b003ffce2467adso928415lfb.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 23:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgMFLWm+FHFo3vieHbs7wbs3iS1zffnuA3iFOBHVmdg=;
 b=cdNh+A2yZzJMgB1hsh6bbOZPhcCNgFObar/HLKRA2BdFKJxtstYUWtAPcmLGkzh9b1
 gD+mxO88aJCdTHA/2GSQAiqBsQ3XKso57pXMhE+saJg5+Zj4mpsN3u/utW9PzXX1ra2/
 0T1BbPl7HrHVmem70ZdT3asvxHOpI1hveqtLna+vOvnJl89nhsgmub2fW4gbSdX7b7L4
 N5kgGpmcWVm/I+fayo2aFHxeS4/ODjQ1/CA/EgBUo3epV+mYEMN3OT0OLpcy3KojtUfo
 s+jZ0C39WuP3AHa+UewUGcNi/FWa5yTbhasaiflJXTceLg4TSeS7iQ6omShA7ZTuWaNt
 bWGQ==
X-Gm-Message-State: AOAM532p1UXyDS4fdX8GSQH9EdiNP2RwHRft68e2SxpRB8gCuCs2GXrS
 MRfxDw8erSkaAmGIzKthYZgeJi3MrckznufEewpc8hJzA+AMdeRuweKqirTSGM3ltHSGMHeXXh0
 0aqSxL6v3VcjN62PtEiJ09dnY7PCa8nY=
X-Received: by 2002:ac2:5978:: with SMTP id h24mr18017716lfp.370.1635316221365; 
 Tue, 26 Oct 2021 23:30:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2vcnOYqu3sBBBMAkltcDEP1r6gLM2weD0BtiZLkK9xtm3XqH63MBuCPIBV7yjCgTNC2OApBp+Tjnh5r48DU4=
X-Received: by 2002:ac2:5978:: with SMTP id h24mr18017689lfp.370.1635316221137; 
 Tue, 26 Oct 2021 23:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-3-leobras@redhat.com>
 <YWZ6JIstNuvuOWtt@t490s>
In-Reply-To: <YWZ6JIstNuvuOWtt@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 27 Oct 2021 03:30:22 -0300
Message-ID: <CAJ6HWG6gPWHeoNUdJtDbUr=ZdWp9C5aKQXH-Af6TtS-Fqb3hjQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 3:18 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Sat, Oct 09, 2021 at 04:56:12AM -0300, Leonardo Bras wrote:
> > @@ -154,6 +161,17 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
> >          return -1;
> >      }
> >
> > +#ifdef CONFIG_LINUX
> > +    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> > +    if (ret < 0) {
> > +        /* Zerocopy not available on host */
> > +        return 0;
> > +    }
> > +
> > +    qio_channel_set_feature(QIO_CHANNEL(ioc),
> > +                            QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY);
>
> This is okay I think, but looks a bit weird.  Maybe nicer to be written as:
>
> #if LINUX
>       ret = setsockopt();
>       if (ret == 0) {
>           qio_channel_set_feature(...);
>       }
> #endif
>       return 0;
>
> ?

Yeah, I also questioned myself about this one.
At the time I ended up writing like this because the lines above used
the behavior "if error, then exit/abort", and so I thought that this
would be the better way to include this feature.
But I did not consider that this is not an error exit, but a 'maybe
feature instead'.

So, I will change that like you suggested.

>
> > +#endif
> > +
> >      return 0;
> >  }
>
> [...]
>
> > +static ssize_t qio_channel_socket_writev_zerocopy(QIOChannel *ioc,
> > +                                                  const struct iovec *iov,
> > +                                                  size_t niov,
> > +                                                  Error **errp)
> > +{
> > +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> > +    ssize_t ret;
> > +
> > +    ret = qio_channel_socket_writev_flags(ioc, iov, niov, NULL, 0,
> > +                                          MSG_ZEROCOPY, errp);
> > +    if (ret == QIO_CHANNEL_ERR_NOBUFS) {
> > +        if (errp && *errp) {
>
> Hmm this seems wrong, *errp should be NULL in most cases, meanwhile I think
> error_setg*() takes care of errp==NULL too, so maybe we can drop this?

Yeah, you are correct.
I ended up confused about how to use err, thanks for making it more clear!

>
> > +            error_setg_errno(errp, errno,
> > +                             "Process can't lock enough memory for using MSG_ZEROCOPY");
> > +        }
> > +        return -1;
> > +    }
> > +
> > +    sioc->zerocopy_queued++;
> > +    return ret;
> > +}
>
> --
> Peter Xu
>

Best regards,
Leonardo Bras


