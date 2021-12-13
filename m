Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B91A47337E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:02:17 +0100 (CET)
Received: from localhost ([::1]:55332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwpeQ-0002CQ-6q
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:02:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mwpc4-0001B1-5w
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 12:59:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mwpbz-0000UI-A0
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 12:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639418382;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GH7XnsUuA+ay1p+mlESMcbxAmTLGSGqPwzGEdS0wT90=;
 b=Op46+PgeLyIIBfudQBa73lNhWghdlYfK7M6gI6Zc3fCxOsH9xvzWHTQa7m9J8at5Q0/Mfz
 qnBZSY886fFLd2V2Y89PDC4QCRktkXS79ra6OwVaxzsbabs9U18HGi1tzCgtax2LXf7zra
 Py5ZuVEKC+KwtUt5jZ2/He2xPZCc1Os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-b0iMJ1MMPdinzzs3SxOflg-1; Mon, 13 Dec 2021 12:59:34 -0500
X-MC-Unique: b0iMJ1MMPdinzzs3SxOflg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B88394EEE;
 Mon, 13 Dec 2021 17:59:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87FDB196F8;
 Mon, 13 Dec 2021 17:59:30 +0000 (UTC)
Date: Mon, 13 Dec 2021 17:59:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <YbeJ/zTV/n+l2CmH@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <87czm47a77.fsf@dusky.pond.sub.org> <YbN0zLsDVr3B/s3+@redhat.com>
 <87ilvszg52.fsf@dusky.pond.sub.org>
 <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
MIME-Version: 1.0
In-Reply-To: <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Mark Burton <mark.burton@greensocs.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 06:30:45PM +0100, Paolo Bonzini wrote:
> On 12/13/21 16:19, Markus Armbruster wrote:
> > I think it's more often just three: the long one that can do everything,
> > the short one that can do simple things (and doesn't tell you anything
> > about the long one), and the bad one you shouldn't use.
> > 
> > > If we're going to have a good CLI, it would ideally only have
> > > one way to do each given task.
> > Ideally, the long one plus good defaults suffices.
> 
> That's hard to do, because the short one typically creates both a backend
> and a frontend.  It should be possible to macro-expand into the long one + a
> -machine property, but that's extremely tedious work.

I don't think it has to be hard, we just need to approach the
problem differently to how we've done in the past.

As a general point, I think we should probably change our terminology
here. IMHO using "long" and "short" options leads to the idea that
they are alternatives that are both supported directly by the same
binary and users switch between them depending on what they need.
That's true with current QEMU impl, but I don't think we should go
down that same route again, as it is not at all user friendly and
leads to confusing docs due to multiple ways todo the same thing.

I'd call them low-level and high-level config, to make it clearer
that they're operating at different conceptual levels, and potentially
(ideally even) separate binaries.

I'd like a situation where machines always use low level config
and humans can *always* use the high level config. This implies
the high level config needs to cope with everything that the
low level config can. This might sound contradictory but it is
possible, if the user has ability to customize the mapping.


If we assume the low-level config is the QAPI based JSON, then a
high level config is essentially just a mapping of some strings
into JSON. Looking at it in this light, we can then consider the
high level config problem to simply be a JSON templating problem
and pick an off the shelf solution for that such as Jinja. 


To create our so called "short option" high level API we need to
be able to ship a collection of useful JSON config snippets, and
have a tool which reads some CLI args using them as input variables
to something like the Jinja templating engine, and then launching
the low level QEMU using the template output.


The benefit of using a general purpose JSON templating system in a
separate binary is that we no longer have to solve everything
ourselves. We can provide templates that handle some obvious common
cases. If they don't do quite what a user needs, then they can just
clone our template, tweak it, and carry on using the high level
tool.

IOW, the ability to customize the templates, means that when
launching QEMU the user only ever needs to use the high level
config on the CLI, and yet they still have ability to express
every possible QEMU config. THis is quite a different and better
experiance than today where if a short option doesn't do what
you need, you have to stop using it and pick a completely
different low level config instead.

It also means we can ship a variety of templates with mutually
exclusive defaults eg a template targetting a 1990's machine
defaults, a template targetting defaults for a general purpose
maximum portability VM, and a template targetting defaults
for virtio.

Since it would be separate from the low level QEMU, we can
also decide to use a non-C language for the high level tool.
eg write it in python if we want to use Jinja as templating,
which would also open it up as an interesting thing for a
new set of contributors who would not touch C code.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


