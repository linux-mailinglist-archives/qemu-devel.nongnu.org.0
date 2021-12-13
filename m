Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62D472AB0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:56:08 +0100 (CET)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwj03-0001Ic-1h
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:56:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mwivt-0007rb-Fo
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:51:49 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:38906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mwivp-0002E8-Nh
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:51:49 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7BDCE21C28;
 Mon, 13 Dec 2021 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639392701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1G69qFr2se5J64Cv+Arj0Ht8G/Dr9yLzdkUmIiTyD9I=;
 b=xm15+NV0BYvq+RwLZy5JaWD8eTkBQdUOqufVk0M/N14H5JSjpvuil/2Sb0TyrQrVunJox9
 yuhuHG5okJ8+ecvbfxLRin9rECw7zNbaNqNesOK3TGZyQMm2iXkIA1hVCjLeGp3VWrzaYu
 zwqWxGf79D9CevPZeiiE3PL2N4XUyIw=
Message-ID: <7fece46b-c578-8303-2dec-cf851ff5b61b@greensocs.com>
Date: Mon, 13 Dec 2021 11:51:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Redesign of QEMU startup & initial configuration
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <87mtl88t0j.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
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
Cc: Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/10/21 14:54, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Thu, Dec 02, 2021 at 07:57:38AM +0100, Markus Armbruster wrote:
>>> = Motivation =
>>>
>>> QEMU startup and initial configuration were designed many years ago for
>>> a much, much simpler QEMU.  They have since changed beyond recognition
>>> to adapt to new needs.  There was no real redesign.  Adaption to new
>>> needs has become more and more difficult.  A recent example for
>>> "difficult" is Damien's "[RFC PATCH v3 0/5] QMP support for
>>> cold-plugging devices".
>>>
>>> I think it's time for a redesign.
>>>
>>>
>>> = What users want for initial configuration =
>>>
>>> 1. QMP only
>>>
>>>     Management applications need to use QMP for monitoring anyway.  They
>>>     may want to use it for initial configuration, too.  Libvirt does.
>>
>> Essentially, as soon as you need to deal with hotplug, you need QMP/QAPI.
>> As soon as you need QMP/QAPI, it is horrible to also need to use something
>> that isn't JSON for the coldplug configuration approach, as you've doubled
>> the number of things to write + test.
> 
> Yes, having to encode the same information in multiple non-trivial ways
> is horrible.
> 
> When using nothing but QMP, you deal with just one encoding.
> 
> With QMP-like configuration files[1], it's one encoding over two
> transports.
> 
> A QAPIfied CLI where the option arguments can be JSON would offer yet
> another transport with only a slight variation of the encoding.
> 
> Any extras need testing.  Okay if their benefits are worth it.
> 
>>>     They still need to bootstrap a QMP monitor, and for that, CLI is fine
>>>     as long as it's simple and stable.
>>
>> Since you mentioned 'simple', allow me to go down a slight
>> tangent...
>>
>> Incidentally, I often wish we didn't use -chardevs anywhere near
>> as much as we do. Chardev was OK when we used it for backing
>> simple guest devices that just had a single host endpoint that
>> was considered permanently connected.
>>
>> Everywhere we've used it for things that really want socket
>> semantics we've created so much pain. The things we've done
>> with chardevs for vhostuser in particular horrify me. I'm
>> glad the block layer resisted the tempetation and just
>> directly used the SocketAddress QAPI type with a QIOChannel
>> objects.
>>
>> I would say the monitor would be better without chardevs
>> too. Having to create multiple monitor instances so that
>> you can have multiple clients is insane. The complexity
>> of course is the need for 'mux' with HMP. If it were not
>> for that, we could use QIOChannel and SocketAddress for
>> the monitor code.
>>
>> Maybe if we one day get HMP fully  separated from QMP such
>> that it is independant code, we can simplify internally.
>> Meanwhile, I think we should consider the QMP CLI at least
>> to only use SocketAddress for config, and secretly turn
>> it into a chardev internally.
> 
> QMP is used in anger pretty much only with Unix domain sockets, and
> maybe Internet domain sockets.  I figure people also use stdio for
> messing around, but something like
> 
>      $ socat "READLINE,history=$HOME/.qmp_history,prompt=QMP>" UNIX-CONNECT:/path/to/qmp-socket
> 
> is actually nicer to use (mostly because we restrict readline to HMP,
> but our readline is homegrown and can't hold a candle to the real thing
> anyway).
> 
>>> 2. CLI and configuration files
>>>
>>>     Human users want a CLI and configuration files.
>>>
>>>     CLI is good for quick tweaks, and to explore.
>>>
>>>     For more permanent, non-trivial configuration, configuration files
>>>     are more suitable, because they are easier to read, edit, and
>>>     document than long command lines.
>>
>> And you can start doing things like "includes" or templating
>> to make the config more manageable / scalable.
> 
> A single configuration file would already be an improvement over today's
> use of CLI, but as configuration gets more complex, a way to stitch
> together multiple configuration files becomes a necessity real fast..
> Even now, we keep a few -readconfig files in docs/config/.
> 
> Configuration will get a lot more complex once we can wire up devices
> from components in configuration instead of C code.
> 
>> It is also nice to not have human and machines in completely
>> separate worlds. Humans will often look at what machines do and
>> then try to replicate that. eg people often ask to see the libvirt
>> QEMU config and then want to run that directly themselves, or use
>> libvirt CLI passthrough to add on features that libvirt does not
>> native support yet.
> 
> Yes!  Obvious and easy paths between the different ways to configure
> stuff are empowering.  I very much want that.
> 
> QemuOpts provides one from CLI to -readconfig: -writeconfig.  Falls well
> short of needs mostly because our needs have long outgrown QemuOpts.
> 
>> As libvirt makes more & more use of QAPI, we are increasing the
>> divide betweeen what machines and humans target.
>>
>> I'd note that Kubernetes doesn't bother with a human CLI at
>> all, and just expects everyone/everything to use JSON/YAML
>> config files. So there's no divide between what syntax humans
>> and machines use - humans just send the config via the CLI
>> tool which uploads it to the REST API that machines use
>> directly.
>>
>>> = What we have for initial configuration =
>>>
>>> Half of 1. and half of 2., satisfying nobody's needs.
>>>
>>> Management applications need to do a lot of non-trivial initial
>>> configuration with the CLI.
>>>
>>> Human users struggle with inconsistent syntax, insufficiently expressive
>>> configuration files, and huge command lines.
>>
>> The QEMU CLI was nice because you could historically do simple
>> stuff really simply eg
>>
>>    qemu-system-x86_64 mydisk.img
>>
>> or
>>
>>    qemu-system-x86_64 -hda mydisk.img -cdrom mydistro.iso
>>
>> The challenge is how CLI usage evolves as you need to finese
>> the config you're using. Using this simple CLI approach, our
>> defaults still largely give you a VM from 1995. If people
>> want a modern guest setup, the simple syntax quickly stops
>> being simple.
>>
>> You very easily get to a point where passing stuff on the
>> CLI gets out of control. IMHO if the CLI is over 100 characters
>> long, a config file is the way to go.
> 
> Yes, we want simple things to be simple, and complicated things to be
> possible.
> 
> Keeping defaults that have long gone bad just to avoid user-visible
> change is an issue that won't go away, but can perhaps be mitigated a
> bit.  More on that below.
> 
>>                                        Given that I really
>> wonder whether direct configuration of hardware on the CLI
>> is worthwhile at all, and users should instead /always/ be
>> using a config file, albeit indirectly.
>>
>>
>> This doesn't mean simple things become harder.
> 
> While ridiculously complicated CLI hardware configuration certainly
> exists and is a problem, dead simple CLI hardware configuration also
> exists.  Doesn't mean your idea is bad, it just raises the bar for it :)
> 
>> I'm thinking of a config file that supports a standard
>> template language supporting variable substitution,
>> loops, conditionals. The CLI then does not need to
>> represent anything related to hardware config schemas
>> at all. Instead it just needs to take the name of a
>> config file and ability to set variables.  We could
>> then ship  some standard configs for the simple cases,
>> which would solve the problem of us being stuck on
>> ancient defaults for the simple CLI configs.
>>
>>    $QEMU  virtiovm.cfg  root=mydisk.img cdrom=mydistro.iso
>>
>> where virtiovm.cfg contains
>>
>>    {
>>       "machine": {
>>         "type": "q35",
>>         "memory": "2G",
>>       },
>>       "disks": [
>>         {
>>           "type": "virtio-blk",
>> 	 "file": @@ VAR root@@
>>         },
>>         @@ IF defined cdrom @@
>>         {
>>           "type": "sata",
>> 	 "media": "cdroM"
>> 	 "file": @@ VAR cdrom @@
>>         }
>>         @@ END @@
>>       ]
>>    }
>>
>> Don't pay close attention to my suggesting JSON syntax
>> here. I just invented something for sake of illustration.
>> A real config would be more complex  than this and follow
>> the QAPI schemas.
>>
>> The key is that the complexity of the config file does
>> not matter so much, because the user isn't directly
>> interacting with it for simple tasks. They just have
>> a nice high level CLI taking a few useful variables.
>> The simple CLI becomes massively more useful than
>> our current simple CLI, because it can support modern
>> VMs of arbitrary complexity while still remaining
>> simple.
> 
> There are also cases where the user's configuration is structurally
> simple, just too long to do comfortably in CLI.  A configuration file
> with comments is better.
> 
> For persistent configuration, writing a configuration file beats writing
> a shell script for me.
> 
> Not arguments against your templating idea.  I'm merely pointing out
> human end users will find (simple!) configuration files useful, too.
> 
>>> = Why startup matters for initial configuration =
>>>
>>> Startup and initial configuration are joined at the hip: the way startup
>>> works limits how initial configuration can work.
>>>
>>> Consider the startup we had before -prefconfig:
>>>
>>> 0. Basic, configuration-independent initialization
>>>
>>> 1. Parse and partially process CLI
>>>
>>> 2. Startup with the remaining CLI processing mixed in
>>>
>>> 3. Startup complete, run main loop
>>>
>>> Note:
>>>
>>> * CLI is processed out of order.
>>>
>>>    Few people understand the order, and only while starting at the code.
>>>    Pretty much every time we mess with the order, we break something.
>>>
>>> * QMP monitors become available only at 3, i.e. after startup is
>>>    complete.  Precludes use of QMP for initial configuration.
>>>
>>> The current startup with -preconfig permits a bit of initial
>>> configuration with QMP, at the cost of complicating startup code and
>>> interfaces.  More in "Appendix: Why further incremental change feels
>>> impractical".
>>>
>>>
>>> = Ways forward =
>>
>> Just to clarify or remind ourselves of scope.
>>
>> When I think about startup/cli in QEMU, I essentially consider
>> this to mean all softmmu/vl.c code.  Of course there are
>> supporting pieces splattered around, but IMHO 90% of the pain
>> is resulting from the code in the vl.c file.
>>
>>> 0. This is too hard, let's go shopping
>>>
>>>     I can't really blame people for not wanting to mess with startup.  It
>>>     *is* hard, and there's plenty of other useful stuff to do.
>>>
>>>     However, I believe we have to mess with it, i.e. this is not actually
>>>     a way forward.
>>
>> Yeah, we hurt ourselves by not being able to move forward with
>> a better approach to startup and configuration.
>>
>>> 1. Improve what we have step by step, managing incompatible changes
>>>
>>>     We tried.  It has eaten substantial time and energy, it has
>>>     complicated code and interfaces further, and we're still nowhere near
>>>     where we need to be.  Does not feel like a practical way forward to
>>>     me.
>>>
>>>     If you don't believe me, read the long version in "Appendix: Why
>>>     further incremental change feels impractical".
>>
>> Essentially death by 1000 cuts.
>>
>>> 2. Start over with a QMP-only QEMU, keep the traditional QEMU forever
>>>
>>>     A QMP-only QEMU isn't just a matter of providing an alternate main()
>>>     where we ditch most of the CLI for QMP replacements.  It takes a
>>>     rework of the startup code as "phase transitions" triggered by QMP
>>>     commands.  Similar to how -preconfig triggers some startup work.
>>>
>>>     To reduce code duplication, we'll probably want to rework the
>>>     traditional QEMU's startup code some, too.
>>
>> Refering back to my earlier note, when I've suggested this approach
>> in the past, I've basically considered it to mean stop touching
>> softmmu/vl.c, and create a softmmu/vl2.c. The existing binaries
>> remain using vl.c, we get legacy free binaries built from vl2.c
>>
>> Overtime we might get confidence to refactor bits of vl.c to
>> reduce duplication, but I would consider that not a priority
>> at least in the short term.
>>
>> Part of the reason why vl.c is so painful is danger of breaking
>> existing apps, especially mgmt tools like libvirt. If we did
>> have a vl.c and vl2.c in parallel, creating separate binaries
>> for each we could finese our support guarantees.
>>
>> ie once we consider the new vl2.c to be feature complete for
>> typical production usage, we could declare that mgmt apps
>> should exclusively use the new binaries, and the old binaries
>> are no longer guaranteed CLI stable. This would unlock thue
>> ability to make more risky changes to vl.c to reduce the
>> duplication / maint burden of two binaries.
>>
>> On the other hand if we do a good job with the new binaries
>> maybe there ceases to be any reason to keep the old binaries
>> at all after a few years.
> 
> I want an open path to a single binary.  Taking years to get there is
> fine.
> 
>>> 3. Start over with the aim to replace the traditional QEMU
>>>
>>>     I don't want an end game where we have two QEMUs, one with bad CLI
>>>     and limited QMP, and one without real CLI and decent QMP.  I want one
>>>     QEMU with decent CLI and decent QMP.
>>>
>>>     I propose that a QEMU with decent CLI and decent QMP isn't really
>>>     harder than a QMP-only QEMU.  CLI is just another transport that
>>>     happens to be one-way, i.e. the QMP commands encoded as CLI options
>>>     can't return a value.  Same for configuration files.  I believe the
>>>     parts that are actually hard are shared with QMP-only: QAPIfying
>>>     initial configuration and reworking the startup code as phase
>>>     transitions.
>>>
>>>     When that decent QEMU is ready, we can deprecate and later drop the
>>>     traditional one.
>>
>> Right, so this is essentially what I've just suggested as a possible
>> evoluation of (2). The only difference here is that you're setting
>> the death of the old QEMU as an explicit end gaol in (3), while
>> in (2) it is merely a nice-to-have.
> 
> I'm not sure we all agree it's nice to have.  See Paolo's reply.
> 
>> In practical terms I don't think (2) and (3) are that different
>> from each other for the first 2 years or so.  A lot can change in
>> that time, so I don't think we need to fixate on a choice of
>> (2) vs (3) upfront, just make it clear that the death of the old
>> binaries is "on the table" as an outcome if we do well.
> 
> Yes, the overlap between (2) and (3) is big enough to defer the decision
> some.
> 
> However, I'd like to start working on (3) earlier, time permitting.
> 
>>> = A design proposal =
>>>
>>> 0. Basic, configuration-independent initialization
>>>
>>> 1. Start main loop
>>>
>>> 2. Feed it CLI left to right.  Each option runs a handler just like each
>>>     QMP command does.
>>>
>>>     Options that read a configuration file inject the file into the feed.
>>>
>>>     Options that create a monitor create it suspended.
>>>
>>>     Options may advance the phase / run state, they may require certain
>>>     phase(s), and semantics may depend on the phase.
>>>
>>> 3. When we're done with CLI, resume any monitors we created.
>>>
>>>     As a convenience, provide an easy way to auto-advance phase / run
>>>     state to "guest runs" right here.  The traditional way would be to
>>>     auto-advance unless the user gives -S.
>>>
>>> 4. Monitors now feed commands to the main loop.  Commands may advance
>>>     the phase / run state, and they may require certain phase(s), and
>>>     semantics may depend on the phase.
>>>
>>>     In particular, command "cont" advances phase / run state to "guest
>>>     runs".
>>>
>>> Users can do as much or as little with the CLI as they want.  A
>>> management application might want to set up a QMP monitor and no more.
>>
>> As illustrated earlier, I'd really like us to consider being a bit
>> more adventurous on the CLI side. I'm convinced that a CLI for
>> directly configurable hardware is doomed to be horrible no matter
>> what, if you try to directly expose all QAPI configuration
>> flexibilty. Whether key/value, JSON, whatever, it will become
>> unmanagable on the CLI because VM hardware config is inherantly
>> complicated.
>>
>> Thus my though that config files or QMP should be the only two
>> places where the full power of QAPI config is exposed. Use CLI
>> as just a way to interact with config files in a simple way
>> with templates.
>>
>> We can really think of QEMU's original simple CLI from 15
>> years ago as being a kind of templating frontend for a config
>> file. The config file just happened to be written as C code,
>> and so not user edittable if going outside the common cases.
> 
> Right.
> 
> Painted with a big brush, there are two kinds of code in hw/: actual
> device emulation, and "wiring".  Both in C, and sometimes in the same .c
> file.
> 
> Doing the "wiring" in configuration instead is less powerful (no longer
> Turing complete[2]), but easier to reason about, maintain and change.
> Change is possible even in the field.  The obvious separation between
> emulation and wiring is a nice bonus.
> 
> The wiring C code supports something not unlike templating: we have a
> number of configuration knobs that deposit something for the wiring C
> code to pick up.
> 
> It's rather limited, though: the "variables" are fixed at compile time.
> 
> Aside: the handling of variables that doesn't get substituted is wildly
> inconsistent.
> 
> Perhaps doing wiring in configuration reduces the maintenance burden to
> a degree where we can mitigate the "defaults gone bad, but no want
> change" issue by offering additional, better things instead of changing
> existing, bad things.  I don't know.
> 

We should be careful with config files, because the configuration parser 
can become a real mess. There are 2 kinds of config files:

1. Imperative: an equivalent of QAPI/QMP command script. (eg like CLI 
config files Markus proposed). These are easy to handle because they 
follow the QMP flow. We do one command after the other, the ordering of 
tasks is clear.

2. Descriptive: A description of the configuration where we describe the 
components and the wiring. This can be really complicated because we 
easily end up with ordering/determinism issues when instantiating them 
afterwards. For example the  configuration parser may have to solve : 
Which device do I create first ? I don't think a configuration parser 
should have to solve such issues, but I'm not sure if we can avoid it.

--
Damien

