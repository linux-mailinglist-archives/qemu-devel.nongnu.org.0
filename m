Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA842CBAA3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:36:52 +0100 (CET)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPVD-0003HY-W6
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkPMQ-00032a-B8
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:27:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkPMN-0006wT-Al
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606904862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I6NE0xvp5m8OyWtDob7S7a+m+eIKDnYHdtL7KQfvqGY=;
 b=hsJv4YTA03H6NpdKXsWy2ChROzTP8DBYVmCwMfEJalRtG/lzxmvvvLE96lCQZ97pD4ekR2
 sAAOQblg5b+3As67cUYZOnTInc0DwnOVhagdVsACd1D0mOHn4OukKYBZTgob3jBbjzk+Ni
 HfioG2I9ZbsoZo9kXX2OUywic10nArs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-T9YNScCVM9ylLq-fta97IQ-1; Wed, 02 Dec 2020 05:27:40 -0500
X-MC-Unique: T9YNScCVM9ylLq-fta97IQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B95848049C1;
 Wed,  2 Dec 2020 10:27:39 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-199.ams2.redhat.com [10.36.113.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4070D1346F;
 Wed,  2 Dec 2020 10:27:30 +0000 (UTC)
Date: Wed, 2 Dec 2020 11:27:29 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201202102729.GA16765@merkur.fritz.box>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.12.2020 um 22:23 hat Paolo Bonzini geschrieben:
> On 01/12/20 20:35, Kevin Wolf wrote:
> > Am 01.12.2020 um 18:16 hat Paolo Bonzini geschrieben:
> > I don't think this is actually a new things. We already have types and
> > commands declared with things like 'if': 'defined(TARGET_S390X)'.
> > As far as I understand, QAPI generated files are already built per
> > target, so not compiling things into all binaries should be entirely
> > possible.
> 
> There is some complication due to having different discriminators per
> target.  So yes it should be possible.

We have conditional union variants in existing code, too.

> But probably best left after objects because it's so much bigger a
> task and because objects have a bit more freedom for experimentation
> (less ties to other qdev-specific concepts, e.g.  the magic "bus"
> property).

Yes, I would like to get user creatable objects to a state that we
like and only then start converting other object types. I feel user
creatable objects are a nice set of types that aren't so trivial that
major problems could go unnoticed, but still a managable enough number
that it doesn't matter much if we take one or two extra steps until we
find our preferred shape.

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
> Ok, so that's a bit different from what I am thinking of.  I don't
> care very much about the internal boilerplate, only the external
> interface for configuration.  So I don't care about type registration,
> dynamic cast macros etc., only essentially the part that leads to
> ucc->complete.

Once QAPI knows about the class hierarchy you get the internal
boilerplate generation almost for free, so I'm not sure why we would
pass on it. But I agree it's not critical to have it.

> > > 2) whether we want to introduce a separation between configuration
> > > schema and run-time state
> > 
> > You mean the internal run-time state? How is this separation not already
> > present with getter/setter functions for each property? In many cases
> > they just directly access the run-time state, but there are other cases
> > where they actually do things.
> 
> I mean moving more towards the blockdev/chardev way of doing things,
> increasing the separation very much by having separate configuration
> structs that have (potentially) no link to the run-time state struct.

I'm not sure, I'm seeing pros and contras. Also, to be honest, I'm
quite certain that the blockdev/chardev way is accidental rather than
the result of a careful design process.

Having to copy every option from the separate configuration into the
run-time state is somewhat inconvenient. On the other hand, it ensures
that every option is touched in the initialisation function, which
probably increases chances that it's checked for validity.

The separation might have made the kind of bugs more obvious where
property setters just change the configuration without actually applying
the updated value.

I guess we might end up with a mixed model where configuration is
separated into a different struct (the ObjectOptions branches), but
still kept around for the lifetime of the object so that qom-get can
keep working.

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

Yes, I think object creation doesn't need properties. But no, that
doesn't automatically make them useless because of property updates
later on. If you want to get fully rid of them, you need a replacement
for the latter.

But you're right that I would like to make property setters only about
runtime changes (i.e. changes after creation) rather than part of the
creation itself. When they have only one job to do, it's more likely
that they actually implement something working for it.

I guess fully getting rid of them and removing qom-set/get in favour of
something new could be a future step, but feature removal requires code
changes in libvirt etc. so let's try to stay compatible for now. It's
hard enough without dealing with changes to external interfaces.

> Right now QOM is all about exposing properties, and having multiple
> interfaces to set them (by picking a different visitor).  But in practice
> most QOM objects have a lifetime that consists of 1) set properties 2) flip
> a switch (realized/complete/open) 3) let the object live on its own.  1+2
> are a single monitor command or CLI option; during 3 you access the object
> through monitor commands, not properties.

True, and you don't need properties for this case.

> > So in summary, it seems to me that the QOM way is more flexible because
> > you can get both models out of it. Whether we actually need this
> > flexibility I can't say.
> 
> I'm thinking there's no need for it, but maybe I'm overly optimistic.

I think you can express everything with the blockdev-reopen style. The
client just happens to repeat itself a lot then, and updating the full
state atomically might be a bit harder than doing just every property
change individually. But there is probably nothing that can be done with
individual properties, but not with an all-or-nothing update mechanism.

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

Trivial sounds like it's something the computer should be doing.

But there are two more important reasons why I think QAPI should take
care of this:

The first is that I want to get rid of the duplication that properties
have to be defined both in the code and as creation options in QAPI. One
place to describe them is enough. Otherwise you might end up with
options that can't be queried later because you forgot to manually add
the trivial getter property.

The second is that the QAPI schema should actually be a full description
of the external interface of an object, and properties are part of this.
So if we don't describe in it which options are available as (writable)
properties after object creation, the schema will tell only half of the
story.

> > So while this series is doing only one part of the whole solution, that
> > the second part is missing doesn't make the first part wrong.
> 
> Yeah, I think it's clear that for the long term we're not really disagreeing
> (or perhaps I'm even more radical than you :)).  I'm just worried about
> having yet another incomplete transition.

Would you really feel at home in a QEMU without incomplete transitions?
:-)

More seriously, I'm certain that we can get the transition completed for
user creatable options in a reasonable timeframe. And they form a
separate group, as your suggestion to use ucc->complete to implement
things shows, so it wouldn't even be an incomplete transition if we
stopped there instead of extending the concept to other parts.

qdev is a lot larger and it's unrealistic to change all devices at once,
so I can see the risk of an incomplete transition there. But if you
don't want to take this risk, you can't change anything.

> > I was hoping that by converting object-add in this series, and the CLI
> > options soon afterwards, it would be very obvious if you forget to
> > change the schema because your new property just wouldn't work (at least
> > not during creation).
> 
> Converting the CLI options is not entirely trivial due to -readconfig and
> friends, so I was expecting that to last until that part of my 6.0 keyval
> work goes in.  (It's almost ready for posting BTW,
> https://gitlab.com/bonzini/qemu/-/commit/b59288c86c).

Yes, -readconfig is what would be in the way when doing the change on
master. But since you had already posted RFC patches a while ago to
address this, I considered it solved.

> As soon as we have an idea of what we want UserCreatable to look in the end,
> on both the QAPI side and the object implementation side.  That's also the
> part where we have the biggest need to document the schema. With that part
> at least roughly sketched out (no code needed), I'm okay with this series
> going in.

I think so far we agree on these steps:

1. This series (mostly for documentation and introspection)

2. -object and HMP object_add (so that we get QAPI's validation, and to
   make sure that forgetting to update the schema means that the new
   options just doesn't work)

3. Create a separate 'object' entity in QAPI, generate ucc->complete
   implementations that call a create function in the C source code with
   type-specific parameters (like QMP command handlers)

What's still open: Should QAPI cover run-time properties, too? Should
run-time properties even exist at all in the final state? What is the
exact QAPI representation of everything? (The last one includes that I
need to have a closer look at how QAPI can best be taught about
inheritance.)

Kevin


