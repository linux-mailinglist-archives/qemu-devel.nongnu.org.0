Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73B4A81AE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 10:47:21 +0100 (CET)
Received: from localhost ([::1]:33576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFYi0-0004ve-Bb
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 04:47:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFYZu-0002LI-P9
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 04:38:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFYZr-0008Lb-AY
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 04:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643881126;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SslTK8QoyCTGVwAXAFE46fB/gCOWN7ta7zg4E3n+lVE=;
 b=FSeasIri+F6xnZfLfpFNw7VjjzAKfLFFPt506iefEqzTovRleebhhqzugFRrkmsUqCqvnb
 jD4Jv+D/QMv4P4YwaV4WfrBQ7PpdB354/6+nY3pIvY9TYSCS8lQJcTakngxNFGFvw6L46U
 ZXuQHVId4g+9qSZ+6rYVNc20DckkcBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-MiVPlTP6PBWlSYYVLBnkkg-1; Thu, 03 Feb 2022 04:38:38 -0500
X-MC-Unique: MiVPlTP6PBWlSYYVLBnkkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C132874983;
 Thu,  3 Feb 2022 09:38:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EAFD5E49C;
 Thu,  3 Feb 2022 09:38:34 +0000 (UTC)
Date: Thu, 3 Feb 2022 09:38:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 4/4] python/aqmp: add socket bind step to legacy.py
Message-ID: <Yfuil8CJf6cgzMEv@redhat.com>
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <20220201041134.1237016-5-jsnow@redhat.com>
 <YfkzwdbIaGF5TcVZ@redhat.com>
 <CAFn=p-YKS8UXm3+LPsbjKh-_EkQ--efTW60KfQDa8ZAOVMmHjQ@mail.gmail.com>
 <YfmN+w7zh4qx27q/@redhat.com>
 <CAFn=p-bTFrJSF+TtkzyjQhBcTKe3AeWoJJT=O+mS-LiKZVHDnQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bTFrJSF+TtkzyjQhBcTKe3AeWoJJT=O+mS-LiKZVHDnQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 02, 2022 at 02:08:59PM -0500, John Snow wrote:
> On Tue, Feb 1, 2022 at 2:46 PM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 01.02.2022 um 19:32 hat John Snow geschrieben:
> > > On Tue, Feb 1, 2022 at 8:21 AM Kevin Wolf <kwolf@redhat.com> wrote:
> > > >
> > > > Am 01.02.2022 um 05:11 hat John Snow geschrieben:
> > > > > The synchronous QMP library would bind to the server address during
> > > > > __init__(). The new library delays this to the accept() call, because
> > > > > binding occurs inside of the call to start_[unix_]server(), which is an
> > > > > async method -- so it cannot happen during __init__ anymore.
> > > > >
> > > > > Python 3.7+ adds the ability to create the server (and thus the bind()
> > > > > call) and begin the active listening in separate steps, but we don't
> > > > > have that functionality in 3.6, our current minimum.
> > > > >
> > > > > Therefore ... Add a temporary workaround that allows the synchronous
> > > > > version of the client to bind the socket in advance, guaranteeing that
> > > > > there will be a UNIX socket in the filesystem ready for the QEMU client
> > > > > to connect to without a race condition.
> > > > >
> > > > > (Yes, it's a bit ugly. Fixing it more nicely will have to wait until our
> > > > > minimum Python version is 3.7+.)
> > I guess the relevant question in the context of this patch is whether
> > sync.py will need a similar two-phase setup as legacy.py. Do you think
> > you can do without it when you have to reintroduce this behaviour here
> > to fix bugs?
> >
> 
> Hm, honestly, no. I think you'll still need the two-phase in the sync
> version no matter what -- if you expect to be able to launch QMP and
> QEMU from the same process, anyway. I suppose it's just a matter of
> what you *call* it and what/where the arguments are.
> 
> I could just call it bind(), and it does whatever it needs to (Either
> creating a socket or, in 3.7+, instantiating more of the asyncio loop
> machinery).
> The signature for accept() would need to change to (perhaps)
> optionally accepting no arguments; i.e. you can do either of the
> following:
> 
> (1) qmp.bind('/tmp/sock')
>     qmp.accept()
> 
> (2) qmp.accept('/tmp/sock')
> 
> The risk is that the interface is just a touch more complex, the docs
> get a bit more cluttered, there's a slight loss of clarity, the
> accept() method would need to check to make sure you didn't give it an
> address argument if you've already given it one, etc. Necessary
> trade-off for the flexibility, though.

Doing a bind() inside an accept() call is really strange
design IMHO.

bind() is a one-time-only initialization operation for startup,
where as accept() is a runtime operation invoked repeatedly.

bind() is also an op that is reasonably likely to fail
due to something already holding the socket address, and thus
an error condition that you want to report to an application
during its early startup phase.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


