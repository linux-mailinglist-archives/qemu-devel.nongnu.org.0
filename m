Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA858465E91
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:17:20 +0100 (CET)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgLD-0008C1-MZ
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:17:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg2S-0002kK-Rr
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:57:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg2Q-0005Dw-EE
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=hfai9e4o8YK5JvWxIlkvXvLPO8p7XpYsRk3pyCsAtg8=;
 b=bBRUCjwBFUAOFDSTWy4tXWm2nRdqiPwJiaXjrdlItV4XXpCXVeuldukin12KFxALMm2uW6
 87edwEMbAVi9CzXrLmP/2RkFpeyWDTWoAkT8zMJWSfZKHaOqmUKtCkSpF7u9NixbagRMNe
 OI308EMlgqy8zQfByDkrojXxZvxUKdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-fx7fW-_cOVyouFj3nqt6uA-1; Thu, 02 Dec 2021 01:57:45 -0500
X-MC-Unique: fx7fW-_cOVyouFj3nqt6uA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 569E4801B24;
 Thu,  2 Dec 2021 06:57:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6568D76606;
 Thu,  2 Dec 2021 06:57:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C5C6A113865F; Thu,  2 Dec 2021 07:57:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Redesign of QEMU startup & initial configuration
Date: Thu, 02 Dec 2021 07:57:38 +0100
Message-ID: <87lf13cx3x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Burton <mark.burton@greensocs.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

= Motivation =

QEMU startup and initial configuration were designed many years ago for
a much, much simpler QEMU.  They have since changed beyond recognition
to adapt to new needs.  There was no real redesign.  Adaption to new
needs has become more and more difficult.  A recent example for
"difficult" is Damien's "[RFC PATCH v3 0/5] QMP support for
cold-plugging devices".

I think it's time for a redesign.


= What users want for initial configuration =

1. QMP only

   Management applications need to use QMP for monitoring anyway.  They
   may want to use it for initial configuration, too.  Libvirt does.

   They still need to bootstrap a QMP monitor, and for that, CLI is fine
   as long as it's simple and stable.

2. CLI and configuration files

   Human users want a CLI and configuration files.

   CLI is good for quick tweaks, and to explore.

   For more permanent, non-trivial configuration, configuration files
   are more suitable, because they are easier to read, edit, and
   document than long command lines.


= What we have for initial configuration =

Half of 1. and half of 2., satisfying nobody's needs.

Management applications need to do a lot of non-trivial initial
configuration with the CLI.

Human users struggle with inconsistent syntax, insufficiently expressive
configuration files, and huge command lines.


= Why startup matters for initial configuration =

Startup and initial configuration are joined at the hip: the way startup
works limits how initial configuration can work.

Consider the startup we had before -prefconfig:

0. Basic, configuration-independent initialization

1. Parse and partially process CLI

2. Startup with the remaining CLI processing mixed in

3. Startup complete, run main loop

Note:

* CLI is processed out of order.

  Few people understand the order, and only while starting at the code.
  Pretty much every time we mess with the order, we break something.

* QMP monitors become available only at 3, i.e. after startup is
  complete.  Precludes use of QMP for initial configuration.

The current startup with -preconfig permits a bit of initial
configuration with QMP, at the cost of complicating startup code and
interfaces.  More in "Appendix: Why further incremental change feels
impractical".


= Ways forward =

0. This is too hard, let's go shopping

   I can't really blame people for not wanting to mess with startup.  It
   *is* hard, and there's plenty of other useful stuff to do.

   However, I believe we have to mess with it, i.e. this is not actually
   a way forward.

1. Improve what we have step by step, managing incompatible changes

   We tried.  It has eaten substantial time and energy, it has
   complicated code and interfaces further, and we're still nowhere near
   where we need to be.  Does not feel like a practical way forward to
   me.

   If you don't believe me, read the long version in "Appendix: Why
   further incremental change feels impractical".

2. Start over with a QMP-only QEMU, keep the traditional QEMU forever

   A QMP-only QEMU isn't just a matter of providing an alternate main()
   where we ditch most of the CLI for QMP replacements.  It takes a
   rework of the startup code as "phase transitions" triggered by QMP
   commands.  Similar to how -preconfig triggers some startup work.

   To reduce code duplication, we'll probably want to rework the
   traditional QEMU's startup code some, too.

3. Start over with the aim to replace the traditional QEMU

   I don't want an end game where we have two QEMUs, one with bad CLI
   and limited QMP, and one without real CLI and decent QMP.  I want one
   QEMU with decent CLI and decent QMP.

   I propose that a QEMU with decent CLI and decent QMP isn't really
   harder than a QMP-only QEMU.  CLI is just another transport that
   happens to be one-way, i.e. the QMP commands encoded as CLI options
   can't return a value.  Same for configuration files.  I believe the
   parts that are actually hard are shared with QMP-only: QAPIfying
   initial configuration and reworking the startup code as phase
   transitions.

   When that decent QEMU is ready, we can deprecate and later drop the
   traditional one.


= A design proposal =

0. Basic, configuration-independent initialization

1. Start main loop

2. Feed it CLI left to right.  Each option runs a handler just like each
   QMP command does.

   Options that read a configuration file inject the file into the feed.

   Options that create a monitor create it suspended.

   Options may advance the phase / run state, they may require certain
   phase(s), and semantics may depend on the phase.

3. When we're done with CLI, resume any monitors we created.

   As a convenience, provide an easy way to auto-advance phase / run
   state to "guest runs" right here.  The traditional way would be to
   auto-advance unless the user gives -S.

4. Monitors now feed commands to the main loop.  Commands may advance
   the phase / run state, and they may require certain phase(s), and
   semantics may depend on the phase.

   In particular, command "cont" advances phase / run state to "guest
   runs".

Users can do as much or as little with the CLI as they want.  A
management application might want to set up a QMP monitor and no more.


= A way to get to the proposed design =

Create an alternate QEMU binary with the CLI taken out and shot:

0. Basic, configuration-independent initialization

2. Startup

3. Startup complete, run main loop

Maybe hardcode a few things so we can actually run something without any
configuration.  To be ditched when we can configure again.

Rework 2. Startup as a sequence of state transitions we can later
trigger from commands / options.

Create a quasi-monitor so we can feed QMP commands to the main loop.

Make QMP command "cont" transition to "guest runs".

Feed "cont" to the main loop, and drop 2. Startup.

Create QAPI/CLI infrastructure, so we can define CLI options like QMP
commands.  I have (dusty and likely quite bit-rotten) RFC patches.

Feed CLI options to the main loop, and only then feed "cont".

Create option -S to suppress feeding "cont".

Create / reuse / rework QMP commands and CLI options to create QMP
monitors.  Monitors created by CLI start suspended, and get resumed only
when we're done with the CLI.  This is so monitor commands can't race
with the CLI.

Create CLI option to read a configuration file, and feed its contents to
the main loop.  Recursively.  We'll likely want nicer syntax than CLI or
QMP for configuration files.

At this point, we have all the infrastructure we need.  What's still
missing is filling gaps in QMP and in CLI.

I believe "QMP only" would only be marginally easier.  Basically, it
processes (a minimal) CLI before the main loop, not in it.  We could
leave it unQAPIfied.  I can't quite see offhand how to do configuration
files sanely.

Stretch goals:

* Throw in QAPIfying HMP.

* Dust with syntactic sugar (sparingly, please) to make CLI/HMP easier
  to use for humans.


= Initial exploration, a.k.a. talk's cheap, show me the code =

I'm going to post "[PATCH RFC 00/11] vl: Explore redesign of startup"
shortly.


= Appendix: Why further incremental change feels impractical =

Recall from "Why startup matters for initial configuration" how the
traditional startup code made initial configuration with QMP impossible.

We added -preconfig (v3.0.0 in 2018) to support a bit of it.  If given,
we delay part of the startup until QMP command x-exit-preconfig, like
this:

0. Basic, configuration-independent initialization

1. Parse and partially process CLI left to right

2. Some startup with some of the remaining CLI processing mixed in

3. Run main loop

3.1. Execute QMP commands that are allowed before x-exit-preconfig

3.2. x-exit-preconfig: Remaining startup with the remaining CLI
     processing mixed in

3.3. Startup complete

Note:

* (Out of order) CLI processing is interleaved with (in-order) QMP
  execution.

  One word: ugh!

* QMP becomes available earlier, but still not early enough to support
  "QMP only".

* The initial implementation of -preconfig was a hack.  Getting to the
  current implementation took effort.

  Actually, *any* non-trivial change in this area now takes more effort
  than it should.  See also "pretty much every time [...] we break
  something" above.

We can try to push more and more startup work from 2. to 3 until "QMP
only" becomes possible.

Damien's "[RFC PATCH v3 0/5] QMP support for cold-plugging devices" is a
modest step in this direction.  Since the work to be pushed needs to
move to a different point than x-exit-preconfig, we need another command
x-machine-init to provide a suitable point.

At this point, we complicated startup code and interfaces (and arguably
compromised CLI sanity further), with more of the same needed to get
anywhere near "QMP only".

There is plenty of doubt on the interfaces going around, and that's why
-preconfig is still not a stable interface.

Crafting a big change in small steps sounds great.  It isn't when we
have to make things worse before they can get better, and every step is
painfully slow because it's just too hard, and the end state we aim for
isn't really what we want.


