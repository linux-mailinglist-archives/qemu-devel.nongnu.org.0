Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E123FEACF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 10:48:59 +0200 (CEST)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLiP4-0006vn-58
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 04:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLiNx-00068O-9W
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:47:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLiNt-0005Kr-3b
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630572463;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1hQxTr8asQ77m5F6GN4FJp56mUoVJQlZIKB/ZXa0nc=;
 b=H30lToztPgvgsOeTIeQIqNWkws07y/cbMslf227EZwcTFNMYUAxXpg3tyMW6NxHKsbT7N7
 /j0oM2mjaMPih9nUyzpzbpXZOGj+SGDJRUDiHBrcFprNyHtByU6Bf/ZFkzLpUlhFUinbpU
 EePM4vo7Fkg7fchSs29VA9CStzlgfuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-eOsxFMAsNCy-Jcihydxcdw-1; Thu, 02 Sep 2021 04:47:42 -0400
X-MC-Unique: eOsxFMAsNCy-Jcihydxcdw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 862A7189C444;
 Thu,  2 Sep 2021 08:47:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C68F25C23A;
 Thu,  2 Sep 2021 08:47:29 +0000 (UTC)
Date: Thu, 2 Sep 2021 09:47:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTCPngNB+l70sl06@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 03:38:11AM -0300, Leonardo Bras Soares Passos wrote:
> Hello Daniel, thank you for the feedback!
> 
> Comments inline.
> 
> On Tue, Aug 31, 2021 at 9:57 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Aug 31, 2021 at 08:02:38AM -0300, Leonardo Bras wrote:
> > > MSG_ZEROCOPY is a feature that enables copy avoidance in TCP/UDP socket
> > > send calls. It does so by avoiding copying user data into kernel buffers.
> > >
> > > To make it work, three steps are needed:
> > > 1 - A setsockopt() system call, enabling SO_ZEROCOPY
> > > 2 - Passing down the MSG_ZEROCOPY flag for each send*() syscall
> > > 3 - Process the socket's error queue, dealing with any error
> >
> > AFAICT, this is missing the single most critical aspect of MSG_ZEROCOPY.
> >
> > It is non-obvious, but setting the MSG_ZEROCOPY flag turns sendmsg()
> > from a synchronous call to an asynchronous call.
> 
> You are correct. I tried to adapt io_writev() interface to use MSG_ZEROCOPY in
> a somehow synchronous way, but returning errp (and sometimes closing the
> channel because of it) was a poor implementation.
> 
> >
> > It is forbidden to overwrite/reuse/free the buffer passed to sendmsg
> > until an asynchronous completion notification has been received from
> > the socket error queue. These notifications are not required to
> > arrive in-order, even for a TCP stream, because the kernel hangs on
> > to the buffer if a re-transmit is needed.
> >
> > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> >
> >   "Page pinning also changes system call semantics. It temporarily
> >    shares the buffer between process and network stack. Unlike with
> >    copying, the process cannot immediately overwrite the buffer
> >    after system call return without possibly modifying the data in
> >    flight. Kernel integrity is not affected, but a buggy program
> >    can possibly corrupt its own data stream."
> >
> 
> By the above piece of documentation, I get there is no problem in
> overwriting the buffer, but a corrupt, or newer version of the memory may
> be sent instead of the original one. I am pointing this out because there
> are workloads like page migration that would not be impacted, given
> once the buffer is changed, it will dirty the page and it will be re-sent.

The idea of having the buffer overwritten is still seriously worrying
me. I get the idea that in theory the "worst" that should happen is
that we unexpectedly transmit newer guest memory contents. There are
so many edge cases in migration code though that I'm worried there
might be scenarios in which that is still going to cause problems.

The current migration code has a synchronization point at the end of
each iteration of the migration loop. At the end of each iteration,
the source has a guarantee that all pages from the dirty bitmap have
now been sent. With the ZEROCOPY feature we have entirely removed all
synchronization points from the source host wrt memory sending. At
best we know that the pages will have been sent if we get to close()
without seeing errors, unless we're going to explicitly track the
completion messages. The TCP re-transmit semantics are especially
worrying to me, because the re-transmit is liable to send different
data than was in the original lost TCP packet.

Maybe everything is still safe because TCP is a reliable ordered
stream, and thus eventually the dst will get the newest guest
page contents. I'm still very worried that we have code in the
source that implicitly relies on there being some synchronization
points that we've effectively removed.

> > AFAICT, the design added in this patch does not provide any way
> > to honour these requirements around buffer lifetime.
> >
> > I can't see how we can introduce MSG_ZEROCOPY in any seemless
> > way. The buffer lifetime requirements imply need for an API
> > design that is fundamentally different for asynchronous usage,
> > with a callback to notify when the write has finished/failed.
> 
> That is a good point.
> Proposing a new optional method like io_async_writev() + an error
> checking mechanism could do the job.
> io_async_writev() could fall-back to io_writev() in cases where it's not
> implemented.
> 
> I am not sure about the error checking yet.
> Options I can see are:
> 1 - A callback, as you suggested, which IIUC would be provided by
> code using the QIOChannel, and would only fix the reported errors,
> leaving the responsibility of checking for errors to the IOChannel code.

A callback is fairly simple, but potentially limits performance. Reading
the kernel docs it seems they intentionally merge notifications to enable
a whole contiguous set to be processed in one go. A callback would
effectively be unmerging them requiring processing one a time. Not
sure how much this matters to our usage.

> 2 - A new method, maybe io_async_errck(), which would be called
> whenever the using code wants to deal with pending errors. It could
> return an array/list of IOVs that need to be re-sent, for example,
> and code using QIOChannel could deal with it however it wants.

Considering that we're using TCP, we get a reliable, ordered data
stream. So there should never be a failure that requires use to
know specific IOVs to re-sent - the kernel still handles TCP
re-transmit - we just have to still have the buffer available.
As noted above though, the re-transmit is liable to send different
data than the original transmit, which worries me.

So the only errors we should get from the completion notifications
would be errors that are completely fatal for the TCP stream. So
for errors, we only need to know whether an error has ocurred or
not. The second reason for the completion notifications is for
providing a synchronization, to know when the buffer can be released
or overwritten. That is the only scenario we need to know list of
IOVs that completed.



> > > @@ -571,6 +623,14 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > >                           "Unable to write to socket");
> > >          return -1;
> > >      }
> > > +
> > > +    if ((flags & MSG_ZEROCOPY) && sioc->zerocopy_enabled) {
> > > +        sioc->errq_pending += niov;
> > > +        if (sioc->errq_pending > SOCKET_ERRQ_THRESH) {
> > > +            qio_channel_socket_errq_proc(sioc, errp);
> > > +        }
> > > +    }
> >
> > This silently looses any errors set from upto the final
> > SOCKET_ERRQ_THRESH write() calls with MSG_ZEROCOPY set.
> 
> You are right.
> 
> >
> > Also means if you have a series of writes without
> > MSG_ZEROCOPY, it'll delay checking any pending
> > errors.
> 
> That's expected... if there are only happening sends without MSG_ZEROCOPY,
> it means the ones sent with zerocopy can wait. The problem would be
> the above case.

Well it depends whether there are synchonization requirements in the
caller. For example, current migration code knows that at the end of
each iteration sending pages, that the data has all actally been
sent. With this new logic, we might have done several more iterations
of the migration loop before the data for the original iteration has
been sent. The writes() for the original iteration may well be sending
the data from the later iterations. Possibly this is ok, but it is
a clear difference in the data that will actually go out on the wire
with this code.

> > I would suggest checkig in close(), but as mentioned
> > earlier, I think the design is flawed because the caller
> > fundamentally needs to know about completion for every
> > single write they make in order to know when the buffer
> > can be released / reused.
> 
> Well, there could be a flush mechanism (maybe in io_sync_errck(),
> activated with a
> parameter flag, or on a different method if callback is preferred):
> In the MSG_ZEROCOPY docs, we can see that the example includes using a poll()
> syscall after each packet sent, and this means the fd gets a signal after each
> sendmsg() happens, with error or not.
> 
> We could harness this with a poll() and a relatively high timeout:
> - We stop sending packets, and then call poll().
> - Whenever poll() returns 0, it means a timeout happened, and so it
> took too long
> without sendmsg() happening, meaning all the packets are sent.
> - If it returns anything else, we go back to fixing the errors found (re-send)
> 
> The problem may be defining the value of this timeout, but it could be
> called only
> when zerocopy is active.

Maybe we need to check completions at the end of each iteration of the
migration dirtypage loop ?


> > > +static void
> > > +qio_channel_socket_set_zerocopy(QIOChannel *ioc,
> > > +                                bool enabled)
> > > +{
> > > +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> > > +    int v = enabled ? 1 : 0;
> > > +    int ret;
> > > +
> > > +    ret = qemu_setsockopt(sioc->fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> > > +    if (ret >= 0) {
> > > +        sioc->zerocopy_enabled = true;
> > > +    }
> > > +}
> >
> > Surely we need to tell the caller wether this succeeed, otherwise
> > the later sendmsg() is going to fail with EINVAL on older kernels
> > where MSG_ZEROCOPY is not supported.
> 
> Yeah, that was the idea on sioc->zerocopy_enabled, but in fact it
> should have been
> something like 'sioc->zerocopy_enabled = (ret >= 0) && enabled ', this
> way it would
> reflect zerocopy only if it was enabled and the syscall worked, and not_zerocopy
> otherwise.
> 
> or something like this, if we want it to stick with zerocopy if
> setting it off fails.
> if (ret >= 0) {
>     sioc->zerocopy_enabled = enabled;
> }

Yes, that is a bug fix we need, but actually I was refering
to the later sendmsg() call. Surely we need to clear MSG_ZEROCOPY
from 'flags', if zerocopy_enabled is not set, to avoid EINVAL
from sendmsg.

> > > diff --git a/io/channel-tls.c b/io/channel-tls.c
> > > index 4ce890a538..bf44b0f7b0 100644
> > > --- a/io/channel-tls.c
> > > +++ b/io/channel-tls.c
> > > @@ -350,6 +350,16 @@ static void qio_channel_tls_set_delay(QIOChannel *ioc,
> > >      qio_channel_set_delay(tioc->master, enabled);
> > >  }
> > >
> > > +
> > > +static void qio_channel_tls_set_zerocopy(QIOChannel *ioc,
> > > +                                         bool enabled)
> > > +{
> > > +    QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
> > > +
> > > +    qio_channel_set_zerocopy(tioc->master, enabled);
> > > +}
> >
> > This is going to be unsafe because gnutls will discard/reuse the
> > buffer for the ciphertext after every write(). I can't see a
> > way to safely enable MSG_ZEROCOPY when TLS is used.
> 
> Yeah, that makes sense.
> It would make more sense to implement KTLS, as IIRC it kind of does
> 'zerocopy', since it saves the encrypted data directly in kernel buffer.

I would hope it is zerocopy, in so much as the kernel can directly
use the userspace pages as the plaintext, and then the ciphertext
in kernel space can be sent directly without further copies.

What i'm not sure is whether this means it also becomes an effectively
asynchronous API for transmitting data. ie does it have the same
constraints about needing to lock pages, and not modify data in the
pages? I've not investigated it in any detail, but I don't recall
that being mentioned, and if it was the case, it would be impossible
to enable that transparently in gnutls as its a major semantic changed.

> We could implement KTLS as io_async_writev() for Channel_TLS, and change this
> flag to async_enabled. If KTLS is not available, it would fall back to
> using gnuTLS on io_writev, just like it would happen in zerocopy.

If gnutls is going to support KTLS in a way we can use, I dont want to
have any of that duplicated in QEMU code. I want to be able delegate
as much as possible to gnutls, at least so that QEMU isn't in the loop
for any crypto sensitive parts, as that complicates certification
of crypto.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


