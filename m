Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DD9494591
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 02:33:29 +0100 (CET)
Received: from localhost ([::1]:36168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAMKO-0007Gb-Dm
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 20:33:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAMFy-0006Ga-3D
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 20:28:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAMFu-0001MK-Jt
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 20:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642642128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJOTUnY80n6Z66s1Te9bV95iAmMQTy1h+EbxNUIXM2I=;
 b=aHA7AvgnutDZuJDEEehajkxENcFu4+AYoVpb5i/K0h8/U9knWCsj0hIck2HXpsyoZY+Odr
 0eDmMXZPhOhWj/LCD9lAkb0eyxMT22KUBYNEnSidlhJQAWYiZhWQwWUjbAe2wPEDNEPjgn
 1ZhBMLbS7Ll9AB/dUO79DeLtfoy8RQA=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-lKyOGjXgMb68PzsmjdpRLA-1; Wed, 19 Jan 2022 20:28:47 -0500
X-MC-Unique: lKyOGjXgMb68PzsmjdpRLA-1
Received: by mail-pf1-f200.google.com with SMTP id
 i16-20020aa78d90000000b004be3e88d746so2661087pfr.13
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 17:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hJOTUnY80n6Z66s1Te9bV95iAmMQTy1h+EbxNUIXM2I=;
 b=RgfEMCrupaZqjPrSMnP/Vcsjyo/7oM+ONqnLz18RQHqQfAmx4RvnPKpYVUfe0r3XAC
 MSYEIvBv7IIOWFMjP9QMiSajNApEPwjowQMEPhuQ2zut80Hm+bQnjfCQ45fMpZ90tYwl
 dI3KXbpI9aOjqUGqhIj5t5GbPmVr4gyOu2FAJ38nK7oRveiwDgHCkjk9/sIlYjttvr9/
 URhHe9w5/1pB9ibZ0f65PFv2A9HuZqG38MwKU5K0MK+ceimr8QX/g8nYLgu6sJK6US02
 OW95VdNkmckVd4LMgKHnqRVaekg6NgYJXrpOoL28FLjX5K7PkZbu+V1lsDxQyqErHnJH
 BzlA==
X-Gm-Message-State: AOAM533wmK9mpSQcRute2pptGfycBbv+1Gjq4ru+PkAoC95aDU0eMLSH
 VA2eqFYfRs8poEQsC8K40B6Y8oKG5dRKK+Wkh5SmP3z7eee0D9x6IBDgjcJePToJbeXmPwS4MGu
 9KXry0amZ/gA5p6E=
X-Received: by 2002:a05:6a00:21c7:b0:4bc:1d4d:dfe with SMTP id
 t7-20020a056a0021c700b004bc1d4d0dfemr33229371pfj.15.1642642126015; 
 Wed, 19 Jan 2022 17:28:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjIx/x7HmHFXEeUqwTAceP196ffDb9FxH6QMZgUpkA5XObbsxxC0QNS8PQEl6x6wJWd939wg==
X-Received: by 2002:a05:6a00:21c7:b0:4bc:1d4d:dfe with SMTP id
 t7-20020a056a0021c700b004bc1d4d0dfemr33229338pfj.15.1642642125572; 
 Wed, 19 Jan 2022 17:28:45 -0800 (PST)
Received: from xz-m1.local ([94.177.118.77])
 by smtp.gmail.com with ESMTPSA id e14sm783988pfv.177.2022.01.19.17.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 17:28:44 -0800 (PST)
Date: Thu, 20 Jan 2022 09:28:39 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <Yei6tAN0nKfgalzd@xz-m1.local>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <Yd/LLxNCItAIX3eN@xz-m1.local> <Yd/5lhcW6IHlVOBz@redhat.com>
 <YeAAJLYeImjPwW0f@xz-m1.local> <YeACHxbPt1SV9cx8@redhat.com>
 <CAJ6HWG7R4F4RvsQR-FM5qYyPJL2bzJJ4oADGW0TxDjsATDwkoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG7R4F4RvsQR-FM5qYyPJL2bzJJ4oADGW0TxDjsATDwkoQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Wed, Jan 19, 2022 at 02:22:56PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Daniel,
> 
> On Thu, Jan 13, 2022 at 7:42 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Jan 13, 2022 at 06:34:12PM +0800, Peter Xu wrote:
> > > On Thu, Jan 13, 2022 at 10:06:14AM +0000, Daniel P. Berrangé wrote:
> > > > On Thu, Jan 13, 2022 at 02:48:15PM +0800, Peter Xu wrote:
> > > > > On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> > > > > > @@ -558,15 +575,26 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > > > > >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> > > > > >      }
> > > > > >
> > > > > > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > > > > > +        sflags = MSG_ZEROCOPY;
> > > > > > +    }
> > > > > > +
> > > > > >   retry:
> > > > > > -    ret = sendmsg(sioc->fd, &msg, 0);
> > > > > > +    ret = sendmsg(sioc->fd, &msg, sflags);
> > > > > >      if (ret <= 0) {
> > > > > > -        if (errno == EAGAIN) {
> > > > > > +        switch (errno) {
> > > > > > +        case EAGAIN:
> > > > > >              return QIO_CHANNEL_ERR_BLOCK;
> > > > > > -        }
> > > > > > -        if (errno == EINTR) {
> > > > > > +        case EINTR:
> > > > > >              goto retry;
> > > > > > +        case ENOBUFS:
> > > > > > +            if (sflags & MSG_ZEROCOPY) {
> > > > > > +                error_setg_errno(errp, errno,
> > > > > > +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> > > > > > +                return -1;
> > > > > > +            }
> > > > >
> > > > > I have no idea whether it'll make a real differnece, but - should we better add
> > > > > a "break" here?  If you agree and with that fixed, feel free to add:
> > > > >
> > > > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > > >
> > > > > I also wonder whether you hit ENOBUFS in any of the environments.  On Fedora
> > > > > here it's by default unlimited, but just curious when we should keep an eye.
> > > >
> > > > Fedora doesn't allow unlimited locked memory by default
> > > >
> > > > $ grep "locked memory" /proc/self/limits
> > > > Max locked memory         65536                65536                bytes
> > > >
> > > > And  regardless of Fedora defaults, libvirt will set a limit
> > > > for the guest. It will only be unlimited if requiring certain
> > > > things like VFIO.
> > >
> > > Thanks, I obviously checked up the wrong host..
> > >
> > > Leo, do you know how much locked memory will be needed by zero copy?  Will
> > > there be a limit?  Is it linear to the number of sockets/channels?
> >
> > IIRC we decided it would be limited by the socket send buffer size, rather
> > than guest RAM, because writes will block once the send buffer is full.
> >
> > This has a default global setting, with per-socket override. On one box I
> > have it is 200 Kb. With multifd you'll need  "num-sockets * send buffer".
> 
> Oh, I was not aware there is a send buffer size (or maybe I am unable
> to recall).
> That sure makes things much easier.
> 
> >
> > > It'll be better if we can fail at enabling the feature when we detected that
> > > the specified locked memory limit may not be suffice.
> 
> sure
> 
> >
> > Checking this value against available locked memory though will always
> > have an error margin because other things in QEMU can use locked memory
> > too
> 
> We can get the current limit (before zerocopy) as an error margin:
> req_lock_mem = num-sockets * send buffer + BASE_LOCKED
> 
> Where BASE_LOCKED is the current libvirt value, or so on.

Hmm.. not familiar with libvirt, so I'm curious whether libvirt is actually
enlarging the allowed locked mem on Fedora since the default is 64KB?

I think it'll be great to capture the very major going-to-fail scenarios.  For
example, I'm wondering whether a qemu (without libvirt) will simply fail
directly on Fedora using non-root even with 1 channel due to the 64K limit, or
the other extreme case is when the user does not allow locking mem at all in
some container environment (when we see max locked mem is zero).

It's not only about failing early, it's also about failing with a meaningful
error so the user knows what to tune, while I'm not very sure that'll be easily
understandable when we wait until the failure of io_writev().

Thanks,

-- 
Peter Xu


