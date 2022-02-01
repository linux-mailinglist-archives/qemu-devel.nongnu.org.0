Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08AE4A69BE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 02:58:19 +0100 (CET)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF4uY-0003vK-Bs
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 20:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEz6V-0001Y1-EI
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:46:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEz6S-0004fu-ER
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643744771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ROz0rYSRnGaj704IlfnRaGg3VjyKC2VbS4Q219qSAsw=;
 b=YNO7Y0uYry1m3PpFAn11kbC+aaER1RB0P7dMLooz1jnVIyq8UsQps3MrklulPIvwHLj491
 EgmsJsEJaOSnwhY24kTNVCnEZdKohcLqddReqwhg+VR2Fc1/V5oBjOR0LW33uW42P0tLum
 OCfQOGvm3ScBAeB0G5yoat4EdyeYnxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-35nR1FCxM--C8KcPqi3o0g-1; Tue, 01 Feb 2022 14:46:08 -0500
X-MC-Unique: 35nR1FCxM--C8KcPqi3o0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FEE6100C663;
 Tue,  1 Feb 2022 19:46:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1845512E12;
 Tue,  1 Feb 2022 19:46:04 +0000 (UTC)
Date: Tue, 1 Feb 2022 20:46:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 4/4] python/aqmp: add socket bind step to legacy.py
Message-ID: <YfmN+w7zh4qx27q/@redhat.com>
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <20220201041134.1237016-5-jsnow@redhat.com>
 <YfkzwdbIaGF5TcVZ@redhat.com>
 <CAFn=p-YKS8UXm3+LPsbjKh-_EkQ--efTW60KfQDa8ZAOVMmHjQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-YKS8UXm3+LPsbjKh-_EkQ--efTW60KfQDa8ZAOVMmHjQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2022 um 19:32 hat John Snow geschrieben:
> On Tue, Feb 1, 2022 at 8:21 AM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 01.02.2022 um 05:11 hat John Snow geschrieben:
> > > The synchronous QMP library would bind to the server address during
> > > __init__(). The new library delays this to the accept() call, because
> > > binding occurs inside of the call to start_[unix_]server(), which is an
> > > async method -- so it cannot happen during __init__ anymore.
> > >
> > > Python 3.7+ adds the ability to create the server (and thus the bind()
> > > call) and begin the active listening in separate steps, but we don't
> > > have that functionality in 3.6, our current minimum.
> > >
> > > Therefore ... Add a temporary workaround that allows the synchronous
> > > version of the client to bind the socket in advance, guaranteeing that
> > > there will be a UNIX socket in the filesystem ready for the QEMU client
> > > to connect to without a race condition.
> > >
> > > (Yes, it's a bit ugly. Fixing it more nicely will have to wait until our
> > > minimum Python version is 3.7+.)
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >  python/qemu/aqmp/legacy.py   |  3 +++
> > >  python/qemu/aqmp/protocol.py | 41 +++++++++++++++++++++++++++++++++---
> > >  2 files changed, 41 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> > > index 0890f95b16..6baa5f3409 100644
> > > --- a/python/qemu/aqmp/legacy.py
> > > +++ b/python/qemu/aqmp/legacy.py
> > > @@ -56,6 +56,9 @@ def __init__(self, address: SocketAddrT,
> > >          self._address = address
> > >          self._timeout: Optional[float] = None
> > >
> > > +        if server:
> > > +            self._aqmp._bind_hack(address)  # pylint: disable=protected-access
> >
> > I feel that this is the only part that really makes it ugly. Do you
> > really think this way is so bad that we can't make it an official public
> > interface in the library?
> >
> > Kevin
> >
> 
> Good question.
> 
> I felt like I'd rather use the 'start_serving' parameter of
> loop.create_server(...), added in python 3.7; see
> https://docs.python.org/3/library/asyncio-eventloop.html#asyncio.loop.create_server
> Python 3.6 is already EOL, but we still depend on it for our build and
> I wasn't prepared to write the series that forces us on to 3.7,
> because RHEL uses 3.6 as its native python. I'll have to update the
> docker files, etc -- and I'm sure people will be kind of unhappy with
> this, so I am putting it off. People were unhappy enough with the move
> to Python 3.6.

Yes, I understand. In theory - I haven't really thought much about it -
it feels like whether you create a separate socket in a first step and
pass it to the server that is created in the second step (for 3.6) or
you start an idle server in the first step and then let it start serving
in the second step (for 3.7+) should be an implementation detail if we
get the external API right.

> I also felt as though the async version has no real need for a
> separate bind step -- you can just start the server in a coroutine and
> wait until it yields, then proceed to launch QEMU. It's easy in that
> paradigm. If this bind step is only for the benefit of the legacy.py
> interface, I thought maybe it wasn't wise to commit to supporting it
> if it was something I wanted to get rid of soon anyway. There's also
> the ugliness that if you use the early bind step, the arguments passed
> to accept() are now ignored, which is kind of ugly, too. It's not a
> *great* interface. It doesn't spark joy.

Right, that's probably a sign that the interfaces aren't completely
right. I'm not sure which interfaces. As long as it's just _bind_hack()
and it's only used in an API that is going away in the future, that's no
problem. But it could also be a sign that the public interfaces aren't
flexible enough.

> I have some patches that are building a "sync.py" module that's meant
> to replace "legacy.py", and it's in the development of that module
> that I expect to either remove the bits I am unhappy with, or commit
> to supporting necessary infrastructure that's just simply required for
> a functional synchronous interface to work. I planned to start
> versioning the "qemu.qmp" package at 0.0.1, and the version that drops
> legacy.py I intend to version at 0.1.0.

If I understand these version numbers correctly, this also implies that
there is no compatibility promise yet. So maybe what to make a public
interface isn't even a big concern yet.

I guess the relevant question in the context of this patch is whether
sync.py will need a similar two-phase setup as legacy.py. Do you think
you can do without it when you have to reintroduce this behaviour here
to fix bugs?

> All that said, I'm fairly wishy-washy on it, so if you have some
> strong feelings, lemme know. There may be some real utility in just
> doubling down on always creating our own socket object. I just haven't
> thought through everything here, admittedly.

No, I don't have strong feelings about this. I don't even really know
the code. I just saw that you were unhappy with the solution and thought
I could try to be the rubber duck that makes you figure out something
that you're happy with. ;-)

Kevin


