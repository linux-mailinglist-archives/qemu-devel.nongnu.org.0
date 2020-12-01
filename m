Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82842CAFC1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 23:11:27 +0100 (CET)
Received: from localhost ([::1]:47288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkDro-0006Yg-DH
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 17:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkDpg-0005bD-Pk
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 17:09:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkDpa-0003oi-Pf
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 17:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606860545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mGQYosAPpiGxcSPkqhAiLfaIC7Znf9agR7P7zPtor5c=;
 b=UnQHYl7IBQW1/kIxLhCP7DBvbWzqhN+Clk1jOj9w4cDFlh2iLo/Bf0uY3upbXVhZ5FcI1F
 cHwAAdh+UYHaPgXp4NfhZwJPPdRf/jUsJ1MNUjxAfdZ+0l3y4dv2oPCayzAEZ53EUjO0lD
 8VMnWAo8VCr+uw/ORrCU9/KGQV+r0og=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-uYtvzPnbOm-QQi1EbNDvOw-1; Tue, 01 Dec 2020 17:09:03 -0500
X-MC-Unique: uYtvzPnbOm-QQi1EbNDvOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 792621005E49;
 Tue,  1 Dec 2020 22:09:02 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 272D819C47;
 Tue,  1 Dec 2020 22:08:55 +0000 (UTC)
Date: Tue, 1 Dec 2020 17:08:54 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201201220854.GC3836@habkost.net>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 01, 2020 at 10:23:57PM +0100, Paolo Bonzini wrote:
> On 01/12/20 20:35, Kevin Wolf wrote:
> > Am 01.12.2020 um 18:16 hat Paolo Bonzini geschrieben:
> > I don't think this is actually a new things. We already have types and
> > commands declared with things like 'if': 'defined(TARGET_S390X)'.
> > As far as I understand, QAPI generated files are already built per
> > target, so not compiling things into all binaries should be entirely
> > possible.
> 
> There is some complication due to having different discriminators per
> target.  So yes it should be possible.  But probably best left after objects
> because it's so much bigger a task and because objects have a bit more
> freedom for experimentation (less ties to other qdev-specific concepts, e.g.
> the magic "bus" property).
> 
> > So maybe only the abstract base class that actually defines the machine
> > properties (like generic-pc-machine) should be described in QAPI, and
> > then the concrete machine types would inherit from it without being
> > described in QAPI themselves?
> 
> Yes, maybe.
> 
> > > 1) whether to generate _all_ boilerplate or only properties
> > 
> > I would like to generate as much boilerplate as possible. That is, I
> > don't want to constrain us to only properties, but at the same time, I'm
> > not sure if it's possible to get rid of all boilerplate.
> > 
> > Basically, the vision I have in mind is that QAPI would generate code
> > that is the same for most instances, and then provide an option that
> > prevents code generation for a specific part for more complicated cases,
> > so that the respective function can (and must) be provided in the C
> > source.
> 
> Ok, so that's a bit different from what I am thinking of.  I don't care very
> much about the internal boilerplate, only the external interface for
> configuration.  So I don't care about type registration, dynamic cast macros
> etc., only essentially the part that leads to ucc->complete.
> 
> > > 2) whether we want to introduce a separation between configuration
> > > schema and run-time state
> > 
> > You mean the internal run-time state? How is this separation not already
> > present with getter/setter functions for each property? In many cases
> > they just directly access the run-time state, but there are other cases
> > where they actually do things.
> 
> I mean moving more towards the blockdev/chardev way of doing things,
> increasing the separation very much by having separate configuration structs
> that have (potentially) no link to the run-time state struct.
> 
> > > 3) in the latter case, whether properties will survive at all---iothread and
> > > throttle-groups don't really need them even if they're writable after
> > > creation.
> > 
> > How do you define properties, i.e. at which point would they stop
> > existing and what would be a non-property alternative?
> 
> Properties are only a useful concept if they have a use.  If
> -object/object_add/object-add can do the same job without properties,
> properties are not needed anymore.

Do you mean "not needed for -object anymore"?  Properties are
still used by internal C code (esp. board code),
-device/device_add, -machine, -cpu, and debugging commands (like
"info qtree" and qom-list/qom-get/qom-set).

> 
> Right now QOM is all about exposing properties, and having multiple
> interfaces to set them (by picking a different visitor).  But in practice
> most QOM objects have a lifetime that consists of 1) set properties 2) flip
> a switch (realized/complete/open) 3) let the object live on its own.  1+2
> are a single monitor command or CLI option; during 3 you access the object
> through monitor commands, not properties.

I agree with this, except for the word "all" in "QOM is all
about".  QOM is also an extensively used internal QEMU API,
including internal usage of the QOM property system.

> 
> > So in summary, it seems to me that the QOM way is more flexible because
> > you can get both models out of it. Whether we actually need this
> > flexibility I can't say.
> 
> I'm thinking there's no need for it, but maybe I'm overly optimistic.
> 
> > * Configuration options are described in the QAPI schema. This is mainly
> >    for object creation, but runtime modifiable properties are a subset of
> >    this.
> > 
> > * Properties are generated for each option. By default, the getter
> >    just returns the value from the configuration at creation time, though
> >    generation of it can be disabled so that it can be overridden. Also,
> >    setters just return an error by default.
> > 
> > * Property setters aren't called for object creation. Instead, the
> >    relevant ObjectOptions branch is made available to some init method.
> > 
> > * Runtime modifiable properties (declared as such in the schema) don't
> >    get the default setter, so you have to provide an implementation for
> >    them.
> 
> I wouldn't bother with properties at all in the QAPI schema.  Just do the
> first and third bullet.  Declaring read-only QOM properties is trivial.

I'm liking the direction this is taking.  However, I would still
like to have a clearer and feasible plan that would work for
-device, -machine, and -cpu.

> 
> > So while this series is doing only one part of the whole solution, that
> > the second part is missing doesn't make the first part wrong.
> 
> Yeah, I think it's clear that for the long term we're not really disagreeing
> (or perhaps I'm even more radical than you :)).  I'm just worried about
> having yet another incomplete transition.
> 
> > One possibly nasty detail to consider there is that we sometimes declare
> > the USER_CREATABLE interface in the base class, so ucc->complete is for
> > the base class rather than the actually instantiated class. If we only
> > instantiate leaf classes (I think this is true), we can move
> > USER_CREATABLE there.
> 
> You can also use a while loop covering each superclass to decide how to
> dispatch ucc->complete.  I don't care much about these details, they're
> Simple Matter Of Programming. :)
> 
> > I also had in mind just passing the whole configuration struct
> > (essentially always 'boxed': true), but you're right that individual
> > parameters like for commands would be possible. I'm not entirely
> > convinced that they would be better (there was a reason why we
> > introduced 'boxed': true), but it's an option.
> 
> Having 'boxed': true by default would be just an implementation choice,
> nothing to worry about.  (When I said the arguments would be the
> configuration, having a boxed struct as the argument would fit the
> description just as well).
> 
> > I was hoping that by converting object-add in this series, and the CLI
> > options soon afterwards, it would be very obvious if you forget to
> > change the schema because your new property just wouldn't work (at least
> > not during creation).
> 
> Converting the CLI options is not entirely trivial due to -readconfig and
> friends, so I was expecting that to last until that part of my 6.0 keyval
> work goes in.  (It's almost ready for posting BTW,
> https://gitlab.com/bonzini/qemu/-/commit/b59288c86c).
> 
> As soon as we have an idea of what we want UserCreatable to look in the end,
> on both the QAPI side and the object implementation side.  That's also the
> part where we have the biggest need to document the schema. With that part
> at least roughly sketched out (no code needed), I'm okay with this series
> going in.
> 
> I still don't like the triplication, but as George Michael puts it I just
> gotta have faith---because I must admit, I'm positively surprised at the
> ideas that came out of the discussion.
> 
> Paolo
> 

-- 
Eduardo


