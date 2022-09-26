Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECB45E9BE5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 10:22:33 +0200 (CEST)
Received: from localhost ([::1]:60776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocjNn-0006Nq-Qb
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 04:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ocjJI-0003Gj-M6
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 04:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ocjJA-0005TS-C1
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 04:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664180261;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OB5IGlS133L4OkQQ8dFyesfex3bEBrtmEj2WcixXX2k=;
 b=GC4WcVV+ZiqPApJRfs0fdNDMFVz2rPYRfZJ4Gjd57LexsKVO10s1sWAUMkIb2/H+uXszlj
 KrhP36/XzajWiqp2IlBATf/JtlD4FfkJ3YQkGumovph4LE1PHV58jJ+HxBqLUsxzYZwEro
 9hPfp4kX1npcdqZDizF1+BlF7SEYlsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-AoPAzbGhMSSPXyETjDfADg-1; Mon, 26 Sep 2022 04:17:37 -0400
X-MC-Unique: AoPAzbGhMSSPXyETjDfADg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 142F8101A528;
 Mon, 26 Sep 2022 08:17:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CA14492CA2;
 Mon, 26 Sep 2022 08:17:36 +0000 (UTC)
Date: Mon, 26 Sep 2022 09:17:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Maximum QMP reply size
Message-ID: <YzFgHRkaTymb9NnR@redhat.com>
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 <87v8pzwgbm.fsf@pond.sub.org>
 <CAFn=p-bR8BZ_7D+GiLAqO83ACxKNDg6+pZC0smZjYVFc_Y7viw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFn=p-bR8BZ_7D+GiLAqO83ACxKNDg6+pZC0smZjYVFc_Y7viw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 23, 2022 at 03:51:48PM -0400, John Snow wrote:
> On Wed, Sep 7, 2022 at 7:54 AM Markus Armbruster <armbru@redhat.com> wrote:
> >
> > John Snow <jsnow@redhat.com> writes:
> >
> > > Hi, I suspect I have asked this before, but I didn't write it down in
> > > a comment, so I forget my justification...
> > >
> > > In the QMP lib, we need to set a buffering limit for how big a QMP
> > > message can be -- In practice, I found that the largest possible
> > > response was the QAPI schema reply, and I set the code to this:
> > >
> > >     # Maximum allowable size of read buffer
> > >     _limit = (64 * 1024)
> > >
> > > However, I didn't document if this was a reasonable limit or just a
> > > "worksforme" one. I assume that there's no hard limit for the protocol
> > > or the implementation thereof in QEMU. Is there any kind of value here
> > > that would be more sensible than another?
> > >
> > > I'm worried that if replies get bigger in the future (possibly in some
> > > degenerate case I am presently unaware of) that the library default
> > > will become nonsensical.
> > >
> > > Any pointers/tips?
> >
> > Peter and Daniel already provided some.  I can add a bit of insight into
> > how QMP output works in QEMU, which may or may not help you.
> >
> > QEMU executes one command after the other.  A command's response
> > (success or failure) is a QDict.  Which is then formatted as JSON and
> > appended to the monitor's output buffer.
> >
> > Events work similarly.
> >
> > The conversion to JSON does not limit the resulting string's size.  If
> > it runs out of memory, QEMU dies.
> >
> > The output buffer is also unbounded.  It drains into the monitor's
> > character device.
> >
> > If the QMP client sends enough commands without reading their responses,
> > QEMU can run out of memory and die.
> >
> > Now I'm ready to go back to your question, which is about a *single*
> > message (QMP command response or event): nothing in QEMU limits the size
> > of the QMP output message text.
> >
> > Weak consolation: I guess QEMU is somewhat likely to run out of memory
> > and die before your client software does.  That's because QDict is a
> > pig: an empty one eats 4120 Bytes on my system.  Compares unfavourable
> > to its text representation "{}".
> >
> 
> (Oops, I realize that my response was never sent, sending that now:)
> 
> Thanks for the responses, everyone.
> 
> I think I will leave it at 64KB for now, but the limit is absolutely
> configurable; I will just document what the limit is and document how
> to change it in the case you want to use QMP to do some really heavy
> lifting. In practice, there's no unit test in our tree currently that
> seems to blow through the 64KB, but I'll just make sure to pay some
> attention to it in the docs.
>
> ... Or, maybe I'll set it to 10MB to match libvirt ("Well, it's good
> enough for this other project" is always a fantastic justification),
> but I need to profile how Python actually behaves in this case. If
> it's just an upper-bound, I think that's no problem at all.

I feel like we should have a spec update that gives some guidance for
conforming impls in a few areas now. The current spec as written is
quite flexible, but in practice impls have made some assumptions to
simplify life, and we ought to try to include those as recomendations
to keep alignment. I feel this is especially valuable now that we're
talking about providing many official QEMU language bindings. On my
list so far I see

  1. Maximum message size
  2. Maximum structure nesting
  2. Messages terminated by a newline


> PS: After reading further discussion that has happened since: The
> problem is the readline buffer size in Python; since we don't have a
> "streaming" JSON parser, we rely on readline to get "the next chunk of
> data", and that buffer has a limit it adheres to. It is possible that
> in the future if we switch to a different parsing method that this
> limit would "go away", but it's not clear that this is a great idea.
> In practice, it's probably reasonable that the client dies on input of
> a certain size. Probably.

AFAIK, the readline method does not limit itself by default, it will
just read until newline. It is unsafe to use readline on untrusted
input sources unless you pass the 'limit' parameter to set an upper
limit for line length.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


