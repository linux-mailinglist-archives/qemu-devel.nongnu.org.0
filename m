Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC14F48D7FE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 13:32:06 +0100 (CET)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7zGv-0004T5-GT
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 07:32:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7yxp-0008GX-7S
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 07:12:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7yxm-0000D2-8C
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 07:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642075937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LgXD6by68sK7sov52fChVttnSTc0a4orE24gzbJY5I=;
 b=Yu0IPSrHDSfnVMRyos7N0XFbFWHR0LgaY9wtZzqMrBXih2K9h7HTmaNVqNqYovd8PdSiKV
 9NsUpzLerY/L06HKfzWgYEyVQ2QrPh72o/NQSnYv/K9KL1JUGnhAmBDhhh6OV5tcsq8f38
 wneNVJlriEyL7QNGLuk+WHWBXrsen+g=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-vPGnvXJ1MkaxY3P_PYwHFw-1; Thu, 13 Jan 2022 07:12:16 -0500
X-MC-Unique: vPGnvXJ1MkaxY3P_PYwHFw-1
Received: by mail-pj1-f70.google.com with SMTP id
 k2-20020a17090a658200b001b399622095so6666728pjj.9
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 04:12:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4LgXD6by68sK7sov52fChVttnSTc0a4orE24gzbJY5I=;
 b=bEVAybP5MjdWfwuvYk3+YH/OWXKByQT9dSovYkohma8LEg0gnkZl3ebRcTQuOR3esT
 QXrncP4Cc2ur2VFMnCxtdIClzrbGE5ouHjPsuqwk0xTVCqlNd0C3gIwFtLtAoqsBMZ8Y
 OPL9a4XitdUucfGfWHBQJABTCzdpMMcW+abZD/DodyYOMUIKJQun4QOSxpNNRjiXJa2r
 BAcp5p8iG79d5cnqbnJ6e/I9kHDFT/cEOjgMsX89uLU/5LW5vviX3dL0TC0ePfRLNHlk
 ooufNcS8ysBlxijAszfiW8uql3cSWy89KgwswFv+G8cNf4mjm8tGi91MklwIYtS3IGG/
 L+0w==
X-Gm-Message-State: AOAM533TgcJ1W4ib+HDaP2JijHeZBXD1F44Tfzy9ugy0Aj5VbaMXpG+g
 JIqOBxa+K2SCkbfNHEYn/KIHLfMEgqUVlzQuG0iQke72qdLSGH+Vq+kXZDLqO/dOjRRNa6ICW0f
 ITOjOTpZvMF0h6tM=
X-Received: by 2002:a05:6a00:2487:b0:4bc:315d:21f4 with SMTP id
 c7-20020a056a00248700b004bc315d21f4mr4107425pfv.55.1642075935702; 
 Thu, 13 Jan 2022 04:12:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhlwEhm2Gke8yzmea5nyUzdRhX2jH/UbD2+M0s9Sgtkj4hJPnecYZZBhzEfNohKvuX5YUs0w==
X-Received: by 2002:a05:6a00:2487:b0:4bc:315d:21f4 with SMTP id
 c7-20020a056a00248700b004bc315d21f4mr4107408pfv.55.1642075935420; 
 Thu, 13 Jan 2022 04:12:15 -0800 (PST)
Received: from xz-m1.local ([191.101.132.233])
 by smtp.gmail.com with ESMTPSA id j4sm2910123pfj.217.2022.01.13.04.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 04:12:14 -0800 (PST)
Date: Thu, 13 Jan 2022 20:12:09 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YeAXGejEayv8V/b/@xz-m1.local>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <Yd/LLxNCItAIX3eN@xz-m1.local> <Yd/5lhcW6IHlVOBz@redhat.com>
 <YeAAJLYeImjPwW0f@xz-m1.local> <YeACHxbPt1SV9cx8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YeACHxbPt1SV9cx8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 10:42:39AM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 13, 2022 at 06:34:12PM +0800, Peter Xu wrote:
> > On Thu, Jan 13, 2022 at 10:06:14AM +0000, Daniel P. Berrangé wrote:
> > > On Thu, Jan 13, 2022 at 02:48:15PM +0800, Peter Xu wrote:
> > > > On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> > > > > @@ -558,15 +575,26 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > > > >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> > > > >      }
> > > > >  
> > > > > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > > > > +        sflags = MSG_ZEROCOPY;
> > > > > +    }
> > > > > +
> > > > >   retry:
> > > > > -    ret = sendmsg(sioc->fd, &msg, 0);
> > > > > +    ret = sendmsg(sioc->fd, &msg, sflags);
> > > > >      if (ret <= 0) {
> > > > > -        if (errno == EAGAIN) {
> > > > > +        switch (errno) {
> > > > > +        case EAGAIN:
> > > > >              return QIO_CHANNEL_ERR_BLOCK;
> > > > > -        }
> > > > > -        if (errno == EINTR) {
> > > > > +        case EINTR:
> > > > >              goto retry;
> > > > > +        case ENOBUFS:
> > > > > +            if (sflags & MSG_ZEROCOPY) {
> > > > > +                error_setg_errno(errp, errno,
> > > > > +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> > > > > +                return -1;
> > > > > +            }
> > > > 
> > > > I have no idea whether it'll make a real differnece, but - should we better add
> > > > a "break" here?  If you agree and with that fixed, feel free to add:
> > > > 
> > > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > > 
> > > > I also wonder whether you hit ENOBUFS in any of the environments.  On Fedora
> > > > here it's by default unlimited, but just curious when we should keep an eye.
> > > 
> > > Fedora doesn't allow unlimited locked memory by default
> > > 
> > > $ grep "locked memory" /proc/self/limits 
> > > Max locked memory         65536                65536                bytes     
> > > 
> > > And  regardless of Fedora defaults, libvirt will set a limit
> > > for the guest. It will only be unlimited if requiring certain
> > > things like VFIO.
> > 
> > Thanks, I obviously checked up the wrong host..
> > 
> > Leo, do you know how much locked memory will be needed by zero copy?  Will
> > there be a limit?  Is it linear to the number of sockets/channels?
> 
> IIRC we decided it would be limited by the socket send buffer size, rather
> than guest RAM, because writes will block once the send buffer is full.
> 
> This has a default global setting, with per-socket override. On one box I
> have it is 200 Kb. With multifd you'll need  "num-sockets * send buffer".
> 
> > It'll be better if we can fail at enabling the feature when we detected that
> > the specified locked memory limit may not be suffice.
> 
> Checking this value against available locked memory though will always
> have an error margin because other things in QEMU can use locked memory
> too

We could always still allow false positive in this check, so we can fail if we
have a solid clue to know we'll fail later (e.g. minimum locked_vm needed is
already less than total).  But no strong opinion; we could have this merged and
see whether that's needed in real life.  Thanks,

-- 
Peter Xu


