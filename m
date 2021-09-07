Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222D34027A7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:16:40 +0200 (CEST)
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZ5j-0006YK-6W
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNZ2o-000464-2Y
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNZ2k-0003pD-E8
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631013213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Twg4jeiFEej76t9ZEl96hMpOC+FS8eOV13iM6+vOH7c=;
 b=dJUKy+EZlXvpnmqf50JI8HYzWJIuZXITzXfXgmDmkiqc4cMLhqXPPJN9762R6P+/icp+Ib
 POv2WscC6qlUaG8n0RLbn1ClFfXsr00SD/2tmDnribgp412CdeWVFwTdnU8y/zp2nBUzzS
 nUatTr66a75j0RfAzrC/B5sriESa3zI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-8aK1V6ehMoGSOl4zARcmqw-1; Tue, 07 Sep 2021 07:13:32 -0400
X-MC-Unique: 8aK1V6ehMoGSOl4zARcmqw-1
Received: by mail-wm1-f71.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so842375wmk.2
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Twg4jeiFEej76t9ZEl96hMpOC+FS8eOV13iM6+vOH7c=;
 b=SuneP2wQY/eo3OC6fJ5YZZOZ6ec94ii1M42aHAhiWN2Cd5X273I8EzQhNw7/LVmVcA
 6NFk0wluJwOkFLcovKb3FKlaSQAOPIBDOQxSzxou2TMJCx2Vh1WiWsDzrKJNPDMSRmjd
 WeH9kUUJYiq6ogOZZqS/C4F7pMzGcvCl4goF0JbAZmtnUaWb4v4CyVJRHfZpqz8XMtKd
 vstRZgpXjW98j8CLEg65BDWaHd2ASkkP3p3dwQ58cGory+SO5Rb1KU/pxMa8UIzVAJ1w
 nVALafbuWQLu0ijOAQ2pFI4Y/0jA4oxNHhw/Z7+G3ADoGhwAPiqBr7yAoyXd3fjsrFyV
 PbiQ==
X-Gm-Message-State: AOAM533MsmyLIpLDOH/siXW6amivPYDwFsA8iCH6ybBlf42KNK8aFQFB
 xoi9Eq2RpO7t0v9zU1EjImUlUPzJNKy1SgcIw2uus6i1c/PTo5LQHo4iB3b1QPdCtYp3t77T/AE
 x1rrBtksV6BQ5yNk=
X-Received: by 2002:a1c:3102:: with SMTP id x2mr3461598wmx.122.1631013210805; 
 Tue, 07 Sep 2021 04:13:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTLyLCCiGBPu/QUHAEWVEhsHBchfXRaTbiYVDPDZ3FkcahS4aUl73uTTZiCEhbHPWFPhPMjQ==
X-Received: by 2002:a1c:3102:: with SMTP id x2mr3461568wmx.122.1631013210542; 
 Tue, 07 Sep 2021 04:13:30 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id r129sm2018871wmr.7.2021.09.07.04.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 04:13:29 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:13:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YTdJWDlQn1h9hB8J@work-vm>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com> <YS6RFcQnZEhE8XpG@t490s>
 <YS8/cxTtiC7QIxTD@redhat.com> <YS+dxUBrhogJQkEY@t490s>
 <YS+f3rgBLMdR2ELE@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YS+f3rgBLMdR2ELE@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Sep 01, 2021 at 11:35:33AM -0400, Peter Xu wrote:
> > On Wed, Sep 01, 2021 at 09:53:07AM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Aug 31, 2021 at 04:29:09PM -0400, Peter Xu wrote:
> > > > On Tue, Aug 31, 2021 at 02:16:42PM +0100, Daniel P. Berrangé wrote:
> > > > > On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> > > > > > Call qio_channel_set_zerocopy(true) in the start of every multifd thread.
> > > > > > 
> > > > > > Change the send_write() interface of multifd, allowing it to pass down
> > > > > > flags for qio_channel_write*().
> > > > > > 
> > > > > > Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping the
> > > > > > other data being sent at the default copying approach.
> > > > > > 
> > > > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > > > ---
> > > > > >  migration/multifd-zlib.c | 7 ++++---
> > > > > >  migration/multifd-zstd.c | 7 ++++---
> > > > > >  migration/multifd.c      | 9 ++++++---
> > > > > >  migration/multifd.h      | 3 ++-
> > > > > >  4 files changed, 16 insertions(+), 10 deletions(-)
> > > > > 
> > > > > > @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
> > > > > >              }
> > > > > >  
> > > > > >              if (used) {
> > > > > > -                ret = multifd_send_state->ops->send_write(p, used, &local_err);
> > > > > > +                ret = multifd_send_state->ops->send_write(p, used, MSG_ZEROCOPY,
> > > > > > +                                                          &local_err);
> > > > > 
> > > > > I don't think it is valid to unconditionally enable this feature due to the
> > > > > resource usage implications
> > > > > 
> > > > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > > > > 
> > > > >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens 
> > > > >    if the socket option was not set, the socket exceeds its optmem 
> > > > >    limit or the user exceeds its ulimit on locked pages."
> > > > > 
> > > > > The limit on locked pages is something that looks very likely to be
> > > > > exceeded unless you happen to be running a QEMU config that already
> > > > > implies locked memory (eg PCI assignment)
> > > > 
> > > > Yes it would be great to be a migration capability in parallel to multifd. At
> > > > initial phase if it's easy to be implemented on multi-fd only, we can add a
> > > > dependency between the caps.  In the future we can remove that dependency when
> > > > the code is ready to go without multifd.  Thanks,
> > > 
> > > Also, I'm wondering how zerocopy support interacts with kernel support
> > > for kTLS and multipath-TCP, both of which we want to be able to use
> > > with migration.
> > 
> > Copying Jason Wang for net implications between these features on kernel side
> > and whether they can be enabled together (MSG_ZEROCOPY, mptcp, kTLS).
> > 
> > From the safe side we may want to only enable one of them until we prove
> > they'll work together I guess..
> 
> MPTCP is good when we're network limited for migration
> 
> KTLS will be good when we're CPU limited on AES for migration,
> which is essentially always when TLS is used.
> 
> ZEROCOPY will be good when we're CPU limited for data copy
> on migration, or to reduce the impact on other concurrent
> VMs on the same CPUs.
> 
> Ultimately we woudld benefit from all of them at the same
> time, if it were technically possible todo.

I think last time I spoke to Paolo Abeni there were some interactions
between them; I can't remember what though (I think mptcp and ktls
didn't play at the time).

Dave

> > Not a immediate concern as I don't really think any of them is really
> > explicitly supported in qemu.
> 
> QEMU has mptcp support already:
> 
>   commit 8bd1078aebcec5eac196a83ef1a7e74be0ba67b7
>   Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
>   Date:   Wed Apr 21 12:28:34 2021 +0100
> 
>     sockets: Support multipath TCP
>     
>     Multipath TCP allows combining multiple interfaces/routes into a single
>     socket, with very little work for the user/admin.
>     
>     It's enabled by 'mptcp' on most socket addresses:
>     
>        ./qemu-system-x86_64 -nographic -incoming tcp:0:4444,mptcp
> 
> > KTLS may be implicitly included by a new gnutls, but we need to mark TLS and
> > ZEROCOPY mutual exclusive anyway because at least the userspace TLS code of
> > gnutls won't has a way to maintain the tls buffers used by zerocopy.  So at
> > least we need some knob to detect whether kTLS is enabled in gnutls.
> 
> It isn't possible for gnutls to transparently enable KTLS, because
> GNUTLS doesn't get to see the actual socket directly - it'll need
> some work in QEMU to enable it.  We know MPTCP and KTLS are currently
> mutually exclusive as they both use the same kernel network hooks
> framework.
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


