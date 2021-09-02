Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376013FEB97
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:52:31 +0200 (CEST)
Received: from localhost ([::1]:51182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjOY-0004yH-9O
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLjMC-000386-8m
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLjMA-0007Y8-7v
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630576201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=waSwdUAuWVkTpBXRWp74HWRPOD89GCNz0xwp8l+EhHk=;
 b=GBawIrg4dYwxEZY69+bHJimdZGcUTomLJsQ1ZMSnW296cvs7nYA+xCVGkfZk0DvUM+PeTz
 EDmNNyHkBRNBB/X8SMcH+R126kPC60sYd2SV3nfsJEndkSHDTckt/fRcvrXWeTs83dhaOh
 Na6rQicG4euO/lsenlBCGeLg3GU8j+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-tUQwKgHrOYm0I4h1dXTzyA-1; Thu, 02 Sep 2021 05:50:00 -0400
X-MC-Unique: tUQwKgHrOYm0I4h1dXTzyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE2EF501F6;
 Thu,  2 Sep 2021 09:49:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21FD510493DD;
 Thu,  2 Sep 2021 09:49:43 +0000 (UTC)
Date: Thu, 2 Sep 2021 10:49:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTCeNCEmr3NsQEPR@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

On Thu, Sep 02, 2021 at 06:34:01AM -0300, Leonardo Bras Soares Passos wrote:
> On Thu, Sep 2, 2021 at 5:47 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Sep 02, 2021 at 03:38:11AM -0300, Leonardo Bras Soares Passos wrote:
> >
> > > > I would suggest checkig in close(), but as mentioned
> > > > earlier, I think the design is flawed because the caller
> > > > fundamentally needs to know about completion for every
> > > > single write they make in order to know when the buffer
> > > > can be released / reused.
> > >
> > > Well, there could be a flush mechanism (maybe in io_sync_errck(),
> > > activated with a
> > > parameter flag, or on a different method if callback is preferred):
> > > In the MSG_ZEROCOPY docs, we can see that the example includes using a poll()
> > > syscall after each packet sent, and this means the fd gets a signal after each
> > > sendmsg() happens, with error or not.
> > >
> > > We could harness this with a poll() and a relatively high timeout:
> > > - We stop sending packets, and then call poll().
> > > - Whenever poll() returns 0, it means a timeout happened, and so it
> > > took too long
> > > without sendmsg() happening, meaning all the packets are sent.
> > > - If it returns anything else, we go back to fixing the errors found (re-send)
> > >
> > > The problem may be defining the value of this timeout, but it could be
> > > called only
> > > when zerocopy is active.
> >
> > Maybe we need to check completions at the end of each iteration of the
> > migration dirtypage loop ?
> 
> Sorry, I am really new to this, and I still couldn't understand why would we
> need to check at the end of each iteration, instead of doing a full check at the
> end.

The end of each iteration is an implicit synchronization point in the
current migration code.

For example, we might do 2 iterations of migration pre-copy, and then
switch to post-copy mode. If the data from those 2 iterations hasn't
been sent at the point we switch to post-copy, that is a semantic
change from current behaviour. I don't know if that will have an
problematic effect on the migration process, or not. Checking the
async completions at the end of each iteration though, would ensure
the semantics similar to current semantics, reducing risk of unexpected
problems.


> > > or something like this, if we want it to stick with zerocopy if
> > > setting it off fails.
> > > if (ret >= 0) {
> > >     sioc->zerocopy_enabled = enabled;
> > > }
> >
> > Yes, that is a bug fix we need, but actually I was refering
> > to the later sendmsg() call. Surely we need to clear MSG_ZEROCOPY
> > from 'flags', if zerocopy_enabled is not set, to avoid EINVAL
> > from sendmsg.
> 
> Agree, something like io_writev(,, sioc->zerocopy_enabled ?
> MSG_ZEROCOPY : 0, errp)'
> should do, right?
> (or an io_async_writev(), that will fall_back to io_writev() if
> zerocopy is disabled)

Something like that - depends what API we end up deciding on

> > > We could implement KTLS as io_async_writev() for Channel_TLS, and change this
> > > flag to async_enabled. If KTLS is not available, it would fall back to
> > > using gnuTLS on io_writev, just like it would happen in zerocopy.
> >
> > If gnutls is going to support KTLS in a way we can use, I dont want to
> > have any of that duplicated in QEMU code. I want to be able delegate
> > as much as possible to gnutls, at least so that QEMU isn't in the loop
> > for any crypto sensitive parts, as that complicates certification
> > of crypto.
> 
> Yeah, that's a very good argument :)
> I think it's probably the case to move from the current callback implementation
> to the implementation in which we give gnuTLS the file descriptor.

That would introduce a coupling  between the two QIOChannel impls
though, which is avoided so far, because we didn't want an assuption
that a QIOChannel == a FD.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


