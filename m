Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14B41D58C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:36:07 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrXy-0006dq-1U
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVrWG-0005e4-Rs
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:34:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVrWF-0001sc-8W
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632990858;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swb1DMITHFf4zyHrhwEsJTEJCCYQl4Di7HZHrWlyDz0=;
 b=clDW46OIiU1FUNENohuS5iF/vru7lCoM0QzklVvgvay3bL03u0PezeWx2BKlZTun1NBSV7
 +vKkE6yEuO7lQEbdJ6+iB9gMijdPJvSrHWMlOjWm1U5go3wa7nkKPhLhEtmboVMvdyL8T8
 msr4EvijNqKOOka8vee3uwmCOj0aVw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-2cN7ljbpNqSL_Eoo2c_bUw-1; Thu, 30 Sep 2021 04:34:14 -0400
X-MC-Unique: 2cN7ljbpNqSL_Eoo2c_bUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF2FE835DEB
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:34:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AE3D60877;
 Thu, 30 Sep 2021 08:34:12 +0000 (UTC)
Date: Thu, 30 Sep 2021 09:34:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v3 1/3] QIOChannel: Add io_async_writev & io_async_flush
 callbacks
Message-ID: <YVV2ga3BNL8ubrRr@redhat.com>
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-2-leobras@redhat.com>
 <YU4H1HwsiAO3KM6r@redhat.com> <YVOOhSk2QbTpYP2V@t490s>
 <CAJ6HWG6F9nyJKvS436-NznqEmG_vQ5K=3mxib-5QtkqZ8gqwLQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG6F9nyJKvS436-NznqEmG_vQ5K=3mxib-5QtkqZ8gqwLQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 04:06:33PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Peter, thanks for reviewing!
> 
> On Tue, Sep 28, 2021 at 6:52 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Fri, Sep 24, 2021 at 06:16:04PM +0100, Daniel P. Berrangé wrote:
> > > > +ssize_t qio_channel_async_writev(QIOChannel *ioc,
> > > > +                                 const struct iovec *iov,
> > > > +                                 size_t niov,
> > > > +                                 int *fds,
> > > > +                                 size_t nfds,
> > > > +                                 Error **errp);
> > >
> > > This is missing any flags. We need something like
> > >
> > >    QIO_CHANNEL_WRITE_FLAG_ZEROCOPY
> > >
> > > passed in an 'unsigned int flags' parameter. This in
> > > turn makes me question whether we should have the
> > > common helpers at all, as the api is going to be
> > > different for sync vs async.
> > >
> > > The QIOChannelFeature enum probably ought to be
> > > extended with QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY with
> > > support for probing whether that's supported or not.
> >
> > I'm also wondering whether we could just drop the fds/nfds as per my knowledge
> > SCM_RIGHT is the only user, at the meantime I don't see why an async interface
> > would pass in any fd anyways..  Thanks,
> 
> FWIW, I think it's a great idea.
> Daniel, what do you think?

Yes, FD passing is not compatible with async operations, becuase it is
too complex to deal with FD lifetime on failure to send IO


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


