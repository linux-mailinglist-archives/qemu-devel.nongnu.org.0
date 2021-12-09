Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C4F46F3B0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 20:13:35 +0100 (CET)
Received: from localhost ([::1]:56606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvOrG-00046V-Iw
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 14:13:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mvOpe-0003NM-3U
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 14:11:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mvOpZ-00021O-Ui
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 14:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639077109;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cp65in747b7oAmJzg4YCkzJYYlRSEMhGHTsk+/kokyE=;
 b=UJ/c2l8cQW12JsWeAASyGhDbHCdoHrwY+dWMJQagDyLZIrP3tvW3mmgPMvPyJCiUmovows
 8bGmliNSRYf3KHC6Eb+JSvkTa9l8ZWxcBkcRxW8+7Deq3fj3EQUQBWifWDrqARFO7IglHA
 tskknuRguAGxCtWf8m3sn32Nljmc3aM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-7hIU2sQgML6BqUKkct1Kdg-1; Thu, 09 Dec 2021 14:11:40 -0500
X-MC-Unique: 7hIU2sQgML6BqUKkct1Kdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92F321006AA1;
 Thu,  9 Dec 2021 19:11:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1161019729;
 Thu,  9 Dec 2021 19:11:36 +0000 (UTC)
Date: Thu, 9 Dec 2021 19:11:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <YbJU5vVdesoGuug9@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lf13cx3x.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02, 2021 at 07:57:38AM +0100, Markus Armbruster wrote:
> = Motivation =
> 
> QEMU startup and initial configuration were designed many years ago for
> a much, much simpler QEMU.  They have since changed beyond recognition
> to adapt to new needs.  There was no real redesign.  Adaption to new
> needs has become more and more difficult.  A recent example for
> "difficult" is Damien's "[RFC PATCH v3 0/5] QMP support for
> cold-plugging devices".
> 
> I think it's time for a redesign.
> 
> 
> = What users want for initial configuration =
> 
> 1. QMP only
> 
>    Management applications need to use QMP for monitoring anyway.  They
>    may want to use it for initial configuration, too.  Libvirt does.

Essentially, as soon as you need to deal with hotplug, you need QMP/QAPI.
As soon as you need QMP/QAPI, it is horrible to also need to use something
that isn't JSON for the coldplug configuration approach, as you've doubled
the number of things to write + test.

>    They still need to bootstrap a QMP monitor, and for that, CLI is fine
>    as long as it's simple and stable.

Since you mentioned 'simple', allow me to go down a slight
tangent...

Incidentally, I often wish we didn't use -chardevs anywhere near
as much as we do. Chardev was OK when we used it for backing
simple guest devices that just had a single host endpoint that
was considered permanently connected.

Everywhere we've used it for things that really want socket
semantics we've created so much pain. The things we've done
with chardevs for vhostuser in particular horrify me. I'm
glad the block layer resisted the tempetation and just
directly used the SocketAddress QAPI type with a QIOChannel
objects.

I would say the monitor would be better without chardevs
too. Having to create multiple monitor instances so that
you can have multiple clients is insane. The complexity
of course is the need for 'mux' with HMP. If it were not
for that, we could use QIOChannel and SocketAddress for
the monitor code.

Maybe if we one day get HMP fully  separated from QMP such
that it is independant code, we can simplify internally.
Meanwhile, I think we should consider the QMP CLI at least
to only use SocketAddress for config, and secretly turn
it into a chardev internally. 

> 2. CLI and configuration files
> 
>    Human users want a CLI and configuration files.
> 
>    CLI is good for quick tweaks, and to explore.
> 
>    For more permanent, non-trivial configuration, configuration files
>    are more suitable, because they are easier to read, edit, and
>    document than long command lines.

And you can start doing things like "includes" or templating
to make the config more manageable / scalable.


It is also nice to not have human and machines in completely
separate worlds. Humans will often look at what machines do and
then try to replicate that. eg people often ask to see the libvirt
QEMU config and then want to run that directly themselves, or use
libvirt CLI passthrough to add on features that libvirt does not
native support yet.

As libvirt makes more & more use of QAPI, we are increasing the
divide betweeen what machines and humans target.

I'd note that Kubernetes doesn't bother with a human CLI at
all, and just expects everyone/everything to use JSON/YAML
config files. So there's no divide between what syntax humans
and machines use - humans just send the config via the CLI
tool which uploads it to the REST API that machines use
directly. 


> = What we have for initial configuration =
> 
> Half of 1. and half of 2., satisfying nobody's needs.
> 
> Management applications need to do a lot of non-trivial initial
> configuration with the CLI.
> 
> Human users struggle with inconsistent syntax, insufficiently expressive
> configuration files, and huge command lines.

The QEMU CLI was nice because you could historically do simple
stuff really simply eg

  qemu-system-x86_64 mydisk.img

or

  qemu-system-x86_64 -hda mydisk.img -cdrom mydistro.iso

The challenge is how CLI usage evolves as you need to finese
the config you're using. Using this simple CLI approach, our
defaults still largely give you a VM from 1995. If people
want a modern guest setup, the simple syntax quickly stops
being simple.

You very easily get to a point where passing stuff on the
CLI gets out of control. IMHO if the CLI is over 100 characters
long, a config file is the way to go. Given that I really
wonder whether direct configuration of hardware on the CLI
is worthwhile at all, and users should instead /always/ be
using a config file, albeit indirectly.


This doesn't mean simple things become harder.


I'm thinking of a config file that supports a standard
template language supporting variable substitution,
loops, conditionals. The CLI then does not need to
represent anything related to hardware config schemas
at all. Instead it just needs to take the name of a
config file and ability to set variables.  We could
then ship  some standard configs for the simple cases,
which would solve the problem of us being stuck on
ancient defaults for the simple CLI configs.

  $QEMU  virtiovm.cfg  root=mydisk.img cdrom=mydistro.iso

where virtiovm.cfg contains

  {
     "machine": {
       "type": "q35",
       "memory": "2G",
     },
     "disks": [
       {
         "type": "virtio-blk",
	 "file": @@ VAR root@@
       },
       @@ IF defined cdrom @@
       {
         "type": "sata",
	 "media": "cdroM"
	 "file": @@ VAR cdrom @@
       }
       @@ END @@
     ]
  }

Don't pay close attention to my suggesting JSON syntax
here. I just invented something for sake of illustration.
A real config would be more complex  than this and follow
the QAPI schemas.

The key is that the complexity of the config file does
not matter so much, because the user isn't directly
interacting with it for simple tasks. They just have
a nice high level CLI taking a few useful variables.
The simple CLI becomes massively more useful than
our current simple CLI, because it can support modern
VMs of arbitrary complexity while still remaining
simple.


> = Why startup matters for initial configuration =
> 
> Startup and initial configuration are joined at the hip: the way startup
> works limits how initial configuration can work.
> 
> Consider the startup we had before -prefconfig:
> 
> 0. Basic, configuration-independent initialization
> 
> 1. Parse and partially process CLI
> 
> 2. Startup with the remaining CLI processing mixed in
> 
> 3. Startup complete, run main loop
> 
> Note:
> 
> * CLI is processed out of order.
> 
>   Few people understand the order, and only while starting at the code.
>   Pretty much every time we mess with the order, we break something.
> 
> * QMP monitors become available only at 3, i.e. after startup is
>   complete.  Precludes use of QMP for initial configuration.
> 
> The current startup with -preconfig permits a bit of initial
> configuration with QMP, at the cost of complicating startup code and
> interfaces.  More in "Appendix: Why further incremental change feels
> impractical".
> 
> 
> = Ways forward =

Just to clarify or remind ourselves of scope.

When I think about startup/cli in QEMU, I essentially consider
this to mean all softmmu/vl.c code.  Of course there are
supporting pieces splattered around, but IMHO 90% of the pain
is resulting from the code in the vl.c file.

> 0. This is too hard, let's go shopping
> 
>    I can't really blame people for not wanting to mess with startup.  It
>    *is* hard, and there's plenty of other useful stuff to do.
> 
>    However, I believe we have to mess with it, i.e. this is not actually
>    a way forward.

Yeah, we hurt ourselves by not being able to move forward with
a better approach to startup and configuration.

> 1. Improve what we have step by step, managing incompatible changes
> 
>    We tried.  It has eaten substantial time and energy, it has
>    complicated code and interfaces further, and we're still nowhere near
>    where we need to be.  Does not feel like a practical way forward to
>    me.
> 
>    If you don't believe me, read the long version in "Appendix: Why
>    further incremental change feels impractical".

Essentially death by 1000 cuts.

> 2. Start over with a QMP-only QEMU, keep the traditional QEMU forever
> 
>    A QMP-only QEMU isn't just a matter of providing an alternate main()
>    where we ditch most of the CLI for QMP replacements.  It takes a
>    rework of the startup code as "phase transitions" triggered by QMP
>    commands.  Similar to how -preconfig triggers some startup work.
> 
>    To reduce code duplication, we'll probably want to rework the
>    traditional QEMU's startup code some, too.

Refering back to my earlier note, when I've suggested this approach
in the past, I've basically considered it to mean stop touching
softmmu/vl.c, and create a softmmu/vl2.c. The existing binaries
remain using vl.c, we get legacy free binaries built from vl2.c

Overtime we might get confidence to refactor bits of vl.c to
reduce duplication, but I would consider that not a priority
at least in the short term.

Part of the reason why vl.c is so painful is danger of breaking
existing apps, especially mgmt tools like libvirt. If we did
have a vl.c and vl2.c in parallel, creating separate binaries
for each we could finese our support guarantees.

ie once we consider the new vl2.c to be feature complete for
typical production usage, we could declare that mgmt apps
should exclusively use the new binaries, and the old binaries
are no longer guaranteed CLI stable. This would unlock thue
ability to make more risky changes to vl.c to reduce the
duplication / maint burden of two binaries.

On the other hand if we do a good job with the new binaries
maybe there ceases to be any reason to keep the old binaries
at all after a few years.

> 3. Start over with the aim to replace the traditional QEMU
> 
>    I don't want an end game where we have two QEMUs, one with bad CLI
>    and limited QMP, and one without real CLI and decent QMP.  I want one
>    QEMU with decent CLI and decent QMP.
> 
>    I propose that a QEMU with decent CLI and decent QMP isn't really
>    harder than a QMP-only QEMU.  CLI is just another transport that
>    happens to be one-way, i.e. the QMP commands encoded as CLI options
>    can't return a value.  Same for configuration files.  I believe the
>    parts that are actually hard are shared with QMP-only: QAPIfying
>    initial configuration and reworking the startup code as phase
>    transitions.
> 
>    When that decent QEMU is ready, we can deprecate and later drop the
>    traditional one.

Right, so this is essentially what I've just suggested as a possible
evoluation of (2). The only difference here is that you're setting
the death of the old QEMU as an explicit end gaol in (3), while
in (2) it is merely a nice-to-have.

In practical terms I don't think (2) and (3) are that different
from each other for the first 2 years or so.  A lot can change in
that time, so I don't think we need to fixate on a choice of
(2) vs (3) upfront, just make it clear that the death of the old
binaries is "on the table" as an outcome if we do well.

> = A design proposal =
> 
> 0. Basic, configuration-independent initialization
> 
> 1. Start main loop
> 
> 2. Feed it CLI left to right.  Each option runs a handler just like each
>    QMP command does.
> 
>    Options that read a configuration file inject the file into the feed.
> 
>    Options that create a monitor create it suspended.
> 
>    Options may advance the phase / run state, they may require certain
>    phase(s), and semantics may depend on the phase.
> 
> 3. When we're done with CLI, resume any monitors we created.
> 
>    As a convenience, provide an easy way to auto-advance phase / run
>    state to "guest runs" right here.  The traditional way would be to
>    auto-advance unless the user gives -S.
> 
> 4. Monitors now feed commands to the main loop.  Commands may advance
>    the phase / run state, and they may require certain phase(s), and
>    semantics may depend on the phase.
> 
>    In particular, command "cont" advances phase / run state to "guest
>    runs".
> 
> Users can do as much or as little with the CLI as they want.  A
> management application might want to set up a QMP monitor and no more.

As illustrated earlier, I'd really like us to consider being a bit
more adventurous on the CLI side. I'm convinced that a CLI for
directly configurable hardware is doomed to be horrible no matter
what, if you try to directly expose all QAPI configuration
flexibilty. Whether key/value, JSON, whatever, it will become
unmanagable on the CLI because VM hardware config is inherantly
complicated.

Thus my though that config files or QMP should be the only two
places where the full power of QAPI config is exposed. Use CLI
as just a way to interact with config files in a simple way
with templates.

We can really think of QEMU's original simple CLI from 15
years ago as being a kind of templating frontend for a config
file. The config file just happened to be written as C code,
and so not user edittable if going outside the common cases.

> = A way to get to the proposed design =
> 
> Create an alternate QEMU binary with the CLI taken out and shot:
> 
> 0. Basic, configuration-independent initialization
> 
> 2. Startup
> 
> 3. Startup complete, run main loop
> 
> Maybe hardcode a few things so we can actually run something without any
> configuration.  To be ditched when we can configure again.

I wouldn't bother trying to keep things working in the intermediate
steps, as if we go with "new binary" we basically assume a clean
slate and can just build things up in understandable chunks  even
if they're not runnable initially.

> Rework 2. Startup as a sequence of state transitions we can later
> trigger from commands / options.
> 
> Create a quasi-monitor so we can feed QMP commands to the main loop.
> 
> Make QMP command "cont" transition to "guest runs".
> 
> Feed "cont" to the main loop, and drop 2. Startup.
> 
> Create QAPI/CLI infrastructure, so we can define CLI options like QMP
> commands.  I have (dusty and likely quite bit-rotten) RFC patches.
> 
> Feed CLI options to the main loop, and only then feed "cont".
> 
> Create option -S to suppress feeding "cont".
> 
> Create / reuse / rework QMP commands and CLI options to create QMP
> monitors.  Monitors created by CLI start suspended, and get resumed only
> when we're done with the CLI.  This is so monitor commands can't race
> with the CLI.
> 
> Create CLI option to read a configuration file, and feed its contents to
> the main loop.  Recursively.  We'll likely want nicer syntax than CLI or
> QMP for configuration files.
> 
> At this point, we have all the infrastructure we need.  What's still
> missing is filling gaps in QMP and in CLI.
> 
> I believe "QMP only" would only be marginally easier.  Basically, it
> processes (a minimal) CLI before the main loop, not in it.  We could
> leave it unQAPIfied.  I can't quite see offhand how to do configuration
> files sanely.
> 
> Stretch goals:
> 
> * Throw in QAPIfying HMP.
> 
> * Dust with syntactic sugar (sparingly, please) to make CLI/HMP easier
>   to use for humans.
> 
> 
> = Initial exploration, a.k.a. talk's cheap, show me the code =
> 
> I'm going to post "[PATCH RFC 00/11] vl: Explore redesign of startup"
> shortly.

So in your RFC you've basically modified the existing startup
code in vl.c, but I presume that was just expediant for the
purpose of a quickish illustration.

None the less I feel that all the patches cutting cruft are
perhaps a distraction to understanding the proposal. Might
have been clearer to just start from a vl2.c file and build
up from nothing.  Anyway, I don't want was our time arguing
over that approach for an RFC, so I won't say more here
at least :-)

> = Appendix: Why further incremental change feels impractical =
> 
> Recall from "Why startup matters for initial configuration" how the
> traditional startup code made initial configuration with QMP impossible.

snip

> Crafting a big change in small steps sounds great.  It isn't when we
> have to make things worse before they can get better, and every step is
> painfully slow because it's just too hard, and the end state we aim for
> isn't really what we want.

I can't disagree with this. If we carry on trying to evolve vl.c
incrementally we are doomed to be stuck with a horrible starstup
process for enternity (or at least as long as I'll still be
working as QEMU maintainer).


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


