Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27413FE037
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:41:48 +0200 (CEST)
Received: from localhost ([::1]:45438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTJ4-0005Nu-Kt
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLSXL-0008V9-Iq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLSXF-0006gI-HF
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630511538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQywn3O/daM7Knh1N4Uq3FXm40OAgEaMtmHQm4Rf9lA=;
 b=Z1hcIFtSkToIE875Q8zBqm0lQzyxFfAgNiirne/Yvj41Kd5PuHqr1U3QEMUsW6fBJ96ZqF
 AwSK48eYWoH7VA9WGzr+JcRTbBxQvpe+WCjPbsNbiucGE0pjHa5hhQQSPh8palUzm6tBro
 UVck+anbm3/QOoPPPdTQ8iZV2GBvudY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-eHcuOLR3MJ60Cr2xeJmvfg-1; Wed, 01 Sep 2021 11:52:17 -0400
X-MC-Unique: eHcuOLR3MJ60Cr2xeJmvfg-1
Received: by mail-qk1-f197.google.com with SMTP id
 70-20020a370b49000000b003d2f5f0dcc6so3429078qkl.9
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AQywn3O/daM7Knh1N4Uq3FXm40OAgEaMtmHQm4Rf9lA=;
 b=HYdXKJkIPx8+Laius/Ji9TRIGgAFiYZ02Sj6/YPu1mRQ3DmrgJev2XefrH/0JVksvC
 4nsobG+EJZ1NYyhHmrSUK/I6ytElLV4aOT6anaxWIowSMm+hdBv1eZlsmHmeALu1Rp5s
 Z0a3ZifvIp6lKXLTf/9iIEQJw8F/z+ii083FLMX0r3WGabipRKsoGlaT9quM5/5159vB
 7ns5Gy9/TIwky+uN33mvpSuA6elZowueIXzUv0hs8TgtdNviPw+H0q4zLCtDvl8DVTfS
 Of/skyFmuFyrNcdSF5ZZap7nWzZZYCVMdCmIKrrd7rb2StN3rzfwAJ7I9o5x0+UrgfhY
 /c7Q==
X-Gm-Message-State: AOAM533+EQ05E8EQFnrDi3uJjar1gQ0AGnJ4wIPY4DZfHfzGtGbIFqkC
 +L9+Nb2zW6MjUXkgSW0v/1Nng4Rh0jIUu6UDh6kpftNnHBeWS8ICePbgAAi5gVjYP19S7HVt/QQ
 jSl6L4R5A0rP17ik=
X-Received: by 2002:a37:b606:: with SMTP id g6mr300054qkf.476.1630511536553;
 Wed, 01 Sep 2021 08:52:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOISP5goCAI+5PYD3QNyXBJ+3K8sowzBxXSTEMze/qlAghQDapzKE5qY60ROz24/TqgcFP7A==
X-Received: by 2002:a37:b606:: with SMTP id g6mr300006qkf.476.1630511535922;
 Wed, 01 Sep 2021 08:52:15 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id x2sm115111qtr.6.2021.09.01.08.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:52:15 -0700 (PDT)
Date: Wed, 1 Sep 2021 11:52:13 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YS+hrV7Rz5iiwRlH@t490s>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com> <YS6QmOrN4qr055vR@t490s>
 <YS8+8EKboNvsB0zP@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YS8+8EKboNvsB0zP@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 09:50:56AM +0100, Daniel P. Berrangé wrote:
> On Tue, Aug 31, 2021 at 04:27:04PM -0400, Peter Xu wrote:
> > On Tue, Aug 31, 2021 at 01:57:33PM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Aug 31, 2021 at 08:02:38AM -0300, Leonardo Bras wrote:
> > > > MSG_ZEROCOPY is a feature that enables copy avoidance in TCP/UDP socket
> > > > send calls. It does so by avoiding copying user data into kernel buffers.
> > > > 
> > > > To make it work, three steps are needed:
> > > > 1 - A setsockopt() system call, enabling SO_ZEROCOPY
> > > > 2 - Passing down the MSG_ZEROCOPY flag for each send*() syscall
> > > > 3 - Process the socket's error queue, dealing with any error
> > > 
> > > AFAICT, this is missing the single most critical aspect of MSG_ZEROCOPY.
> > > 
> > > It is non-obvious, but setting the MSG_ZEROCOPY flag turns sendmsg()
> > > from a synchronous call to an asynchronous call.
> > > 
> > > It is forbidden to overwrite/reuse/free the buffer passed to sendmsg
> > > until an asynchronous completion notification has been received from
> > > the socket error queue. These notifications are not required to
> > > arrive in-order, even for a TCP stream, because the kernel hangs on
> > > to the buffer if a re-transmit is needed.
> > > 
> > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > > 
> > >   "Page pinning also changes system call semantics. It temporarily 
> > >    shares the buffer between process and network stack. Unlike with
> > >    copying, the process cannot immediately overwrite the buffer 
> > >    after system call return without possibly modifying the data in 
> > >    flight. Kernel integrity is not affected, but a buggy program
> > >    can possibly corrupt its own data stream."
> > > 
> > > AFAICT, the design added in this patch does not provide any way
> > > to honour these requirements around buffer lifetime.
> > > 
> > > I can't see how we can introduce MSG_ZEROCOPY in any seemless
> > > way. The buffer lifetime requirements imply need for an API
> > > design that is fundamentally different for asynchronous usage,
> > > with a callback to notify when the write has finished/failed.
> > 
> > Regarding buffer reuse - it indeed has a very deep implication on the buffer
> > being available and it's not obvious at all.  Just to mention that the initial
> > user of this work will make sure all zero copy buffers will be guest pages only
> > (as it's only used in multi-fd), so they should always be there during the
> > process.
> 
> That is not the case when migration is using TLS, because the buffers
> transmitted are the ciphertext buffer, not the plaintext guest page.

Agreed.

> 
> > In short, we may just want to at least having a way to make sure all zero
> > copied buffers are finished using and they're sent after some function returns
> > (e.g., qio_channel_flush()).  That may require us to do some accounting on when
> > we called sendmsg(MSG_ZEROCOPY), meanwhile we should need to read out the
> > ee_data field within SO_EE_ORIGIN_ZEROCOPY msg when we do recvmsg() for the
> > error queue and keep those information somewhere too.
> > 
> > Some other side notes that reached my mind..
> > 
> > The qio_channel_writev_full() may not be suitable for async operations, as the
> > name "full" implies synchronous to me.  So maybe we can add a new helper for
> > zero copy on the channel?
> 
> All the APIs that exist today are fundamentally only suitable for sync
> operations. Supporting async correctly will definitely a brand new APIs
> separate from what exists today.

Yes.  What I wanted to say is maybe we can still keep the io_writev() interface
untouched, but just add a new interface at qio_channel_writev_full() level.

IOW, we could comment on io_writev() that it can be either sync or async now,
just like sendmsg() has that implication too with different flag passed in.
When calling io_writev() with different upper helpers, QIO channel could
identify what flag to pass over to io_writev().

-- 
Peter Xu


