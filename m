Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2838E3FDFC0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:22:45 +0200 (CEST)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLT0e-0004ZI-5h
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLSH5-0007vi-Py
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLSH4-0001fX-4o
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630510537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z6sLstogk54QyIwEOdle0W4NaqeLdhk62N+bfZkarac=;
 b=K4gucaLy3AOGBLzeif8GwoFQ1H8mpupzqWOT2DBCKcYoNyMi4T6t3jeELz72oWp83lH9XJ
 L6wUvyDRNnZfS88YfHNDMM0BdI4a/JMf4RK8syHFbbJmLTn3+47ha3yjPTAmUEjy4S1QMf
 uZkJ54oJSKhDfYOZ/EliPnQzVMXJ6Ug=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-EmTSmNA2M7KG1S2559V51w-1; Wed, 01 Sep 2021 11:35:36 -0400
X-MC-Unique: EmTSmNA2M7KG1S2559V51w-1
Received: by mail-qv1-f72.google.com with SMTP id
 l3-20020a056214104300b00366988901acso3491725qvr.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Z6sLstogk54QyIwEOdle0W4NaqeLdhk62N+bfZkarac=;
 b=TCX82YY5equYnKQqYENZRMTtpU+4pCNtiYO+WITzkUpuDto78EMhq2CNMxKWIhpQ0R
 q32XaXUTBsj3bGE78SzcWKeDEL2Ek3JDUipXvrpvv1sY4dR2bbNmNWqmMbNF4Rfhtr7k
 cewLJFhmR5HYibqPrOx89xdc7/1HPoDE5c3j2sg+DvLkL5O0Vdfos+chgVFcInZ5jZoN
 PbPwtYrpRJSK/F1eBA2nMKXWKM4NlUGKFKr35TnYZl3tovzLWRO8HQOTs4qIDFMsh2RL
 cRRBvMmbUPeUFU14KyyzZ6MEHPV/gtawGOB+Mr/4fmQHU7Bab06ML4YsScvA87Q/zy6U
 bPfg==
X-Gm-Message-State: AOAM53321z+CGCpjnCWcnKCy6CrtBNRn/3QZblnGlE4Rih6FwGWKTFZI
 6NOkpjm3snJlrZQl+f7oakCNgnMt0Dy4OTKEO1vmR6KrgSYTeNEadfhbpSsWyrjThyYh/tbyAuU
 r5Kq759sxmcnNgCw=
X-Received: by 2002:a37:b686:: with SMTP id g128mr253956qkf.68.1630510536024; 
 Wed, 01 Sep 2021 08:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA9Ms0UnrncxjXL6/uLh49a0eYdl0/hg3Z+GAiXX2/ZgvonLl7pPKx0YNXAUhCssoIAAb8nQ==
X-Received: by 2002:a37:b686:: with SMTP id g128mr253924qkf.68.1630510535738; 
 Wed, 01 Sep 2021 08:35:35 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id l7sm215318qki.99.2021.09.01.08.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:35:35 -0700 (PDT)
Date: Wed, 1 Sep 2021 11:35:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YS+dxUBrhogJQkEY@t490s>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com> <YS6RFcQnZEhE8XpG@t490s>
 <YS8/cxTtiC7QIxTD@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YS8/cxTtiC7QIxTD@redhat.com>
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
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 09:53:07AM +0100, Daniel P. Berrangé wrote:
> On Tue, Aug 31, 2021 at 04:29:09PM -0400, Peter Xu wrote:
> > On Tue, Aug 31, 2021 at 02:16:42PM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> > > > Call qio_channel_set_zerocopy(true) in the start of every multifd thread.
> > > > 
> > > > Change the send_write() interface of multifd, allowing it to pass down
> > > > flags for qio_channel_write*().
> > > > 
> > > > Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping the
> > > > other data being sent at the default copying approach.
> > > > 
> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > ---
> > > >  migration/multifd-zlib.c | 7 ++++---
> > > >  migration/multifd-zstd.c | 7 ++++---
> > > >  migration/multifd.c      | 9 ++++++---
> > > >  migration/multifd.h      | 3 ++-
> > > >  4 files changed, 16 insertions(+), 10 deletions(-)
> > > 
> > > > @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
> > > >              }
> > > >  
> > > >              if (used) {
> > > > -                ret = multifd_send_state->ops->send_write(p, used, &local_err);
> > > > +                ret = multifd_send_state->ops->send_write(p, used, MSG_ZEROCOPY,
> > > > +                                                          &local_err);
> > > 
> > > I don't think it is valid to unconditionally enable this feature due to the
> > > resource usage implications
> > > 
> > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > > 
> > >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens 
> > >    if the socket option was not set, the socket exceeds its optmem 
> > >    limit or the user exceeds its ulimit on locked pages."
> > > 
> > > The limit on locked pages is something that looks very likely to be
> > > exceeded unless you happen to be running a QEMU config that already
> > > implies locked memory (eg PCI assignment)
> > 
> > Yes it would be great to be a migration capability in parallel to multifd. At
> > initial phase if it's easy to be implemented on multi-fd only, we can add a
> > dependency between the caps.  In the future we can remove that dependency when
> > the code is ready to go without multifd.  Thanks,
> 
> Also, I'm wondering how zerocopy support interacts with kernel support
> for kTLS and multipath-TCP, both of which we want to be able to use
> with migration.

Copying Jason Wang for net implications between these features on kernel side
and whether they can be enabled together (MSG_ZEROCOPY, mptcp, kTLS).

From the safe side we may want to only enable one of them until we prove
they'll work together I guess..

Not a immediate concern as I don't really think any of them is really
explicitly supported in qemu.

KTLS may be implicitly included by a new gnutls, but we need to mark TLS and
ZEROCOPY mutual exclusive anyway because at least the userspace TLS code of
gnutls won't has a way to maintain the tls buffers used by zerocopy.  So at
least we need some knob to detect whether kTLS is enabled in gnutls.

-- 
Peter Xu


