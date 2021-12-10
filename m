Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C1C470229
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 14:56:49 +0100 (CET)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvgOF-0002aN-ML
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 08:56:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mvgMX-0001tQ-U5
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:55:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mvgMU-0007Dq-1M
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639144496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/TmLKgRaaksTXuR9pivDwoKvaxQIh7wm8T1ND4QcYM0=;
 b=efbeRQ55nw0nrVO/dwTx62i+vLnDqo8TG6ZLPZ3ohV2mBTAJ/uAN8B6vAru1YvkPYNWUSr
 CV7nzAiEXTU+FiQ+MrEzpT3B7aAYEqmuwG9rUWLHKUIV312iKnCn9sadGCrYTjSAzZ28Od
 udzKaNhmiPV+8HGf7WBA+XipewjrAXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-cIWYjkrGMpyNl8zkSAhbpA-1; Fri, 10 Dec 2021 08:54:53 -0500
X-MC-Unique: cIWYjkrGMpyNl8zkSAhbpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 955DF85B660;
 Fri, 10 Dec 2021 13:54:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFC7100AE2C;
 Fri, 10 Dec 2021 13:54:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6F6E9113865F; Fri, 10 Dec 2021 14:54:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
Date: Fri, 10 Dec 2021 14:54:36 +0100
In-Reply-To: <YbJU5vVdesoGuug9@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 9 Dec 2021 19:11:34 +0000")
Message-ID: <87mtl88t0j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Dec 02, 2021 at 07:57:38AM +0100, Markus Armbruster wrote:
>> =3D Motivation =3D
>>=20
>> QEMU startup and initial configuration were designed many years ago for
>> a much, much simpler QEMU.  They have since changed beyond recognition
>> to adapt to new needs.  There was no real redesign.  Adaption to new
>> needs has become more and more difficult.  A recent example for
>> "difficult" is Damien's "[RFC PATCH v3 0/5] QMP support for
>> cold-plugging devices".
>>=20
>> I think it's time for a redesign.
>>=20
>>=20
>> =3D What users want for initial configuration =3D
>>=20
>> 1. QMP only
>>=20
>>    Management applications need to use QMP for monitoring anyway.  They
>>    may want to use it for initial configuration, too.  Libvirt does.
>
> Essentially, as soon as you need to deal with hotplug, you need QMP/QAPI.
> As soon as you need QMP/QAPI, it is horrible to also need to use somethin=
g
> that isn't JSON for the coldplug configuration approach, as you've double=
d
> the number of things to write + test.

Yes, having to encode the same information in multiple non-trivial ways
is horrible.

When using nothing but QMP, you deal with just one encoding.

With QMP-like configuration files[1], it's one encoding over two
transports.

A QAPIfied CLI where the option arguments can be JSON would offer yet
another transport with only a slight variation of the encoding.

Any extras need testing.  Okay if their benefits are worth it.

>>    They still need to bootstrap a QMP monitor, and for that, CLI is fine
>>    as long as it's simple and stable.
>
> Since you mentioned 'simple', allow me to go down a slight
> tangent...
>
> Incidentally, I often wish we didn't use -chardevs anywhere near
> as much as we do. Chardev was OK when we used it for backing
> simple guest devices that just had a single host endpoint that
> was considered permanently connected.
>
> Everywhere we've used it for things that really want socket
> semantics we've created so much pain. The things we've done
> with chardevs for vhostuser in particular horrify me. I'm
> glad the block layer resisted the tempetation and just
> directly used the SocketAddress QAPI type with a QIOChannel
> objects.
>
> I would say the monitor would be better without chardevs
> too. Having to create multiple monitor instances so that
> you can have multiple clients is insane. The complexity
> of course is the need for 'mux' with HMP. If it were not
> for that, we could use QIOChannel and SocketAddress for
> the monitor code.
>
> Maybe if we one day get HMP fully  separated from QMP such
> that it is independant code, we can simplify internally.
> Meanwhile, I think we should consider the QMP CLI at least
> to only use SocketAddress for config, and secretly turn
> it into a chardev internally.=20

QMP is used in anger pretty much only with Unix domain sockets, and
maybe Internet domain sockets.  I figure people also use stdio for
messing around, but something like

    $ socat "READLINE,history=3D$HOME/.qmp_history,prompt=3DQMP>" UNIX-CONN=
ECT:/path/to/qmp-socket

is actually nicer to use (mostly because we restrict readline to HMP,
but our readline is homegrown and can't hold a candle to the real thing
anyway).

>> 2. CLI and configuration files
>>=20
>>    Human users want a CLI and configuration files.
>>=20
>>    CLI is good for quick tweaks, and to explore.
>>=20
>>    For more permanent, non-trivial configuration, configuration files
>>    are more suitable, because they are easier to read, edit, and
>>    document than long command lines.
>
> And you can start doing things like "includes" or templating
> to make the config more manageable / scalable.

A single configuration file would already be an improvement over today's
use of CLI, but as configuration gets more complex, a way to stitch
together multiple configuration files becomes a necessity real fast..
Even now, we keep a few -readconfig files in docs/config/.

Configuration will get a lot more complex once we can wire up devices
from components in configuration instead of C code.

> It is also nice to not have human and machines in completely
> separate worlds. Humans will often look at what machines do and
> then try to replicate that. eg people often ask to see the libvirt
> QEMU config and then want to run that directly themselves, or use
> libvirt CLI passthrough to add on features that libvirt does not
> native support yet.

Yes!  Obvious and easy paths between the different ways to configure
stuff are empowering.  I very much want that.

QemuOpts provides one from CLI to -readconfig: -writeconfig.  Falls well
short of needs mostly because our needs have long outgrown QemuOpts.

> As libvirt makes more & more use of QAPI, we are increasing the
> divide betweeen what machines and humans target.
>
> I'd note that Kubernetes doesn't bother with a human CLI at
> all, and just expects everyone/everything to use JSON/YAML
> config files. So there's no divide between what syntax humans
> and machines use - humans just send the config via the CLI
> tool which uploads it to the REST API that machines use
> directly.=20
>
>> =3D What we have for initial configuration =3D
>>=20
>> Half of 1. and half of 2., satisfying nobody's needs.
>>=20
>> Management applications need to do a lot of non-trivial initial
>> configuration with the CLI.
>>=20
>> Human users struggle with inconsistent syntax, insufficiently expressive
>> configuration files, and huge command lines.
>
> The QEMU CLI was nice because you could historically do simple
> stuff really simply eg
>
>   qemu-system-x86_64 mydisk.img
>
> or
>
>   qemu-system-x86_64 -hda mydisk.img -cdrom mydistro.iso
>
> The challenge is how CLI usage evolves as you need to finese
> the config you're using. Using this simple CLI approach, our
> defaults still largely give you a VM from 1995. If people
> want a modern guest setup, the simple syntax quickly stops
> being simple.
>
> You very easily get to a point where passing stuff on the
> CLI gets out of control. IMHO if the CLI is over 100 characters
> long, a config file is the way to go.

Yes, we want simple things to be simple, and complicated things to be
possible.

Keeping defaults that have long gone bad just to avoid user-visible
change is an issue that won't go away, but can perhaps be mitigated a
bit.  More on that below.

>                                       Given that I really
> wonder whether direct configuration of hardware on the CLI
> is worthwhile at all, and users should instead /always/ be
> using a config file, albeit indirectly.
>
>
> This doesn't mean simple things become harder.

While ridiculously complicated CLI hardware configuration certainly
exists and is a problem, dead simple CLI hardware configuration also
exists.  Doesn't mean your idea is bad, it just raises the bar for it :)

> I'm thinking of a config file that supports a standard
> template language supporting variable substitution,
> loops, conditionals. The CLI then does not need to
> represent anything related to hardware config schemas
> at all. Instead it just needs to take the name of a
> config file and ability to set variables.  We could
> then ship  some standard configs for the simple cases,
> which would solve the problem of us being stuck on
> ancient defaults for the simple CLI configs.
>
>   $QEMU  virtiovm.cfg  root=3Dmydisk.img cdrom=3Dmydistro.iso
>
> where virtiovm.cfg contains
>
>   {
>      "machine": {
>        "type": "q35",
>        "memory": "2G",
>      },
>      "disks": [
>        {
>          "type": "virtio-blk",
> =09 "file": @@ VAR root@@
>        },
>        @@ IF defined cdrom @@
>        {
>          "type": "sata",
> =09 "media": "cdroM"
> =09 "file": @@ VAR cdrom @@
>        }
>        @@ END @@
>      ]
>   }
>
> Don't pay close attention to my suggesting JSON syntax
> here. I just invented something for sake of illustration.
> A real config would be more complex  than this and follow
> the QAPI schemas.
>
> The key is that the complexity of the config file does
> not matter so much, because the user isn't directly
> interacting with it for simple tasks. They just have
> a nice high level CLI taking a few useful variables.
> The simple CLI becomes massively more useful than
> our current simple CLI, because it can support modern
> VMs of arbitrary complexity while still remaining
> simple.

There are also cases where the user's configuration is structurally
simple, just too long to do comfortably in CLI.  A configuration file
with comments is better.

For persistent configuration, writing a configuration file beats writing
a shell script for me.

Not arguments against your templating idea.  I'm merely pointing out
human end users will find (simple!) configuration files useful, too.

>> =3D Why startup matters for initial configuration =3D
>>=20
>> Startup and initial configuration are joined at the hip: the way startup
>> works limits how initial configuration can work.
>>=20
>> Consider the startup we had before -prefconfig:
>>=20
>> 0. Basic, configuration-independent initialization
>>=20
>> 1. Parse and partially process CLI
>>=20
>> 2. Startup with the remaining CLI processing mixed in
>>=20
>> 3. Startup complete, run main loop
>>=20
>> Note:
>>=20
>> * CLI is processed out of order.
>>=20
>>   Few people understand the order, and only while starting at the code.
>>   Pretty much every time we mess with the order, we break something.
>>=20
>> * QMP monitors become available only at 3, i.e. after startup is
>>   complete.  Precludes use of QMP for initial configuration.
>>=20
>> The current startup with -preconfig permits a bit of initial
>> configuration with QMP, at the cost of complicating startup code and
>> interfaces.  More in "Appendix: Why further incremental change feels
>> impractical".
>>=20
>>=20
>> =3D Ways forward =3D
>
> Just to clarify or remind ourselves of scope.
>
> When I think about startup/cli in QEMU, I essentially consider
> this to mean all softmmu/vl.c code.  Of course there are
> supporting pieces splattered around, but IMHO 90% of the pain
> is resulting from the code in the vl.c file.
>
>> 0. This is too hard, let's go shopping
>>=20
>>    I can't really blame people for not wanting to mess with startup.  It
>>    *is* hard, and there's plenty of other useful stuff to do.
>>=20
>>    However, I believe we have to mess with it, i.e. this is not actually
>>    a way forward.
>
> Yeah, we hurt ourselves by not being able to move forward with
> a better approach to startup and configuration.
>
>> 1. Improve what we have step by step, managing incompatible changes
>>=20
>>    We tried.  It has eaten substantial time and energy, it has
>>    complicated code and interfaces further, and we're still nowhere near
>>    where we need to be.  Does not feel like a practical way forward to
>>    me.
>>=20
>>    If you don't believe me, read the long version in "Appendix: Why
>>    further incremental change feels impractical".
>
> Essentially death by 1000 cuts.
>
>> 2. Start over with a QMP-only QEMU, keep the traditional QEMU forever
>>=20
>>    A QMP-only QEMU isn't just a matter of providing an alternate main()
>>    where we ditch most of the CLI for QMP replacements.  It takes a
>>    rework of the startup code as "phase transitions" triggered by QMP
>>    commands.  Similar to how -preconfig triggers some startup work.
>>=20
>>    To reduce code duplication, we'll probably want to rework the
>>    traditional QEMU's startup code some, too.
>
> Refering back to my earlier note, when I've suggested this approach
> in the past, I've basically considered it to mean stop touching
> softmmu/vl.c, and create a softmmu/vl2.c. The existing binaries
> remain using vl.c, we get legacy free binaries built from vl2.c
>
> Overtime we might get confidence to refactor bits of vl.c to
> reduce duplication, but I would consider that not a priority
> at least in the short term.
>
> Part of the reason why vl.c is so painful is danger of breaking
> existing apps, especially mgmt tools like libvirt. If we did
> have a vl.c and vl2.c in parallel, creating separate binaries
> for each we could finese our support guarantees.
>
> ie once we consider the new vl2.c to be feature complete for
> typical production usage, we could declare that mgmt apps
> should exclusively use the new binaries, and the old binaries
> are no longer guaranteed CLI stable. This would unlock thue
> ability to make more risky changes to vl.c to reduce the
> duplication / maint burden of two binaries.
>
> On the other hand if we do a good job with the new binaries
> maybe there ceases to be any reason to keep the old binaries
> at all after a few years.

I want an open path to a single binary.  Taking years to get there is
fine.

>> 3. Start over with the aim to replace the traditional QEMU
>>=20
>>    I don't want an end game where we have two QEMUs, one with bad CLI
>>    and limited QMP, and one without real CLI and decent QMP.  I want one
>>    QEMU with decent CLI and decent QMP.
>>=20
>>    I propose that a QEMU with decent CLI and decent QMP isn't really
>>    harder than a QMP-only QEMU.  CLI is just another transport that
>>    happens to be one-way, i.e. the QMP commands encoded as CLI options
>>    can't return a value.  Same for configuration files.  I believe the
>>    parts that are actually hard are shared with QMP-only: QAPIfying
>>    initial configuration and reworking the startup code as phase
>>    transitions.
>>=20
>>    When that decent QEMU is ready, we can deprecate and later drop the
>>    traditional one.
>
> Right, so this is essentially what I've just suggested as a possible
> evoluation of (2). The only difference here is that you're setting
> the death of the old QEMU as an explicit end gaol in (3), while
> in (2) it is merely a nice-to-have.

I'm not sure we all agree it's nice to have.  See Paolo's reply.

> In practical terms I don't think (2) and (3) are that different
> from each other for the first 2 years or so.  A lot can change in
> that time, so I don't think we need to fixate on a choice of
> (2) vs (3) upfront, just make it clear that the death of the old
> binaries is "on the table" as an outcome if we do well.

Yes, the overlap between (2) and (3) is big enough to defer the decision
some.

However, I'd like to start working on (3) earlier, time permitting.

>> =3D A design proposal =3D
>>=20
>> 0. Basic, configuration-independent initialization
>>=20
>> 1. Start main loop
>>=20
>> 2. Feed it CLI left to right.  Each option runs a handler just like each
>>    QMP command does.
>>=20
>>    Options that read a configuration file inject the file into the feed.
>>=20
>>    Options that create a monitor create it suspended.
>>=20
>>    Options may advance the phase / run state, they may require certain
>>    phase(s), and semantics may depend on the phase.
>>=20
>> 3. When we're done with CLI, resume any monitors we created.
>>=20
>>    As a convenience, provide an easy way to auto-advance phase / run
>>    state to "guest runs" right here.  The traditional way would be to
>>    auto-advance unless the user gives -S.
>>=20
>> 4. Monitors now feed commands to the main loop.  Commands may advance
>>    the phase / run state, and they may require certain phase(s), and
>>    semantics may depend on the phase.
>>=20
>>    In particular, command "cont" advances phase / run state to "guest
>>    runs".
>>=20
>> Users can do as much or as little with the CLI as they want.  A
>> management application might want to set up a QMP monitor and no more.
>
> As illustrated earlier, I'd really like us to consider being a bit
> more adventurous on the CLI side. I'm convinced that a CLI for
> directly configurable hardware is doomed to be horrible no matter
> what, if you try to directly expose all QAPI configuration
> flexibilty. Whether key/value, JSON, whatever, it will become
> unmanagable on the CLI because VM hardware config is inherantly
> complicated.
>
> Thus my though that config files or QMP should be the only two
> places where the full power of QAPI config is exposed. Use CLI
> as just a way to interact with config files in a simple way
> with templates.
>
> We can really think of QEMU's original simple CLI from 15
> years ago as being a kind of templating frontend for a config
> file. The config file just happened to be written as C code,
> and so not user edittable if going outside the common cases.

Right.

Painted with a big brush, there are two kinds of code in hw/: actual
device emulation, and "wiring".  Both in C, and sometimes in the same .c
file.

Doing the "wiring" in configuration instead is less powerful (no longer
Turing complete[2]), but easier to reason about, maintain and change.
Change is possible even in the field.  The obvious separation between
emulation and wiring is a nice bonus.

The wiring C code supports something not unlike templating: we have a
number of configuration knobs that deposit something for the wiring C
code to pick up.

It's rather limited, though: the "variables" are fixed at compile time.

Aside: the handling of variables that doesn't get substituted is wildly
inconsistent.

Perhaps doing wiring in configuration reduces the maintenance burden to
a degree where we can mitigate the "defaults gone bad, but no want
change" issue by offering additional, better things instead of changing
existing, bad things.  I don't know.

>> =3D A way to get to the proposed design =3D
>>=20
>> Create an alternate QEMU binary with the CLI taken out and shot:
>>=20
>> 0. Basic, configuration-independent initialization
>>=20
>> 2. Startup
>>=20
>> 3. Startup complete, run main loop
>>=20
>> Maybe hardcode a few things so we can actually run something without any
>> configuration.  To be ditched when we can configure again.
>
> I wouldn't bother trying to keep things working in the intermediate
> steps, as if we go with "new binary" we basically assume a clean
> slate and can just build things up in understandable chunks  even
> if they're not runnable initially.
>
>> Rework 2. Startup as a sequence of state transitions we can later
>> trigger from commands / options.
>>=20
>> Create a quasi-monitor so we can feed QMP commands to the main loop.
>>=20
>> Make QMP command "cont" transition to "guest runs".
>>=20
>> Feed "cont" to the main loop, and drop 2. Startup.
>>=20
>> Create QAPI/CLI infrastructure, so we can define CLI options like QMP
>> commands.  I have (dusty and likely quite bit-rotten) RFC patches.
>>=20
>> Feed CLI options to the main loop, and only then feed "cont".
>>=20
>> Create option -S to suppress feeding "cont".
>>=20
>> Create / reuse / rework QMP commands and CLI options to create QMP
>> monitors.  Monitors created by CLI start suspended, and get resumed only
>> when we're done with the CLI.  This is so monitor commands can't race
>> with the CLI.
>>=20
>> Create CLI option to read a configuration file, and feed its contents to
>> the main loop.  Recursively.  We'll likely want nicer syntax than CLI or
>> QMP for configuration files.
>>=20
>> At this point, we have all the infrastructure we need.  What's still
>> missing is filling gaps in QMP and in CLI.
>>=20
>> I believe "QMP only" would only be marginally easier.  Basically, it
>> processes (a minimal) CLI before the main loop, not in it.  We could
>> leave it unQAPIfied.  I can't quite see offhand how to do configuration
>> files sanely.
>>=20
>> Stretch goals:
>>=20
>> * Throw in QAPIfying HMP.
>>=20
>> * Dust with syntactic sugar (sparingly, please) to make CLI/HMP easier
>>   to use for humans.
>>=20
>>=20
>> =3D Initial exploration, a.k.a. talk's cheap, show me the code =3D
>>=20
>> I'm going to post "[PATCH RFC 00/11] vl: Explore redesign of startup"
>> shortly.
>
> So in your RFC you've basically modified the existing startup
> code in vl.c, but I presume that was just expediant for the
> purpose of a quickish illustration.

Yes.  I wasn't in the mood to figure out the Meson magic to link a new
binary, so I took a shortcut.

> None the less I feel that all the patches cutting cruft are
> perhaps a distraction to understanding the proposal. Might
> have been clearer to just start from a vl2.c file and build
> up from nothing.  Anyway, I don't want was our time arguing
> over that approach for an RFC, so I won't say more here
> at least :-)

Easier to understand, possibly.  Slower to post, certainly.  Happy to
iterate.

Also: cutting the cruft like this demonstrates just how much of it
there is.

>> =3D Appendix: Why further incremental change feels impractical =3D
>>=20
>> Recall from "Why startup matters for initial configuration" how the
>> traditional startup code made initial configuration with QMP impossible.
>
> snip
>
>> Crafting a big change in small steps sounds great.  It isn't when we
>> have to make things worse before they can get better, and every step is
>> painfully slow because it's just too hard, and the end state we aim for
>> isn't really what we want.
>
> I can't disagree with this. If we carry on trying to evolve vl.c
> incrementally we are doomed to be stuck with a horrible starstup
> process for enternity (or at least as long as I'll still be
> working as QEMU maintainer).
>
>
> Regards,
> Daniel


[1] Probably in a superset of JSON, because bare JSON is an awful
configuration file format.

[2] Unless we go apeshit.  Which we shouldn't.


