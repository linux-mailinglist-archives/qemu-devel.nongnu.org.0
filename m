Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9C47631B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:22:00 +0100 (CET)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaml-0001H0-Kh
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:21:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mxafr-0005qO-02
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:14:51 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:38904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mxafn-0000rf-VW
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:14:50 -0500
Received: from smtpclient.apple (lfbn-bor-1-1317-97.w193-250.abo.wanadoo.fr
 [193.250.130.97])
 by beetle.greensocs.com (Postfix) with ESMTPSA id AD37020787;
 Wed, 15 Dec 2021 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639599284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XX2IC4C6dF8LldsUXygm6T7c3f0eUyKA00w2MLwiYb4=;
 b=X6WZ5Gdby5Ei1/AiuOeDiLFTySpMt3dznAaVq106HO6YdW5VXyBISGjbv5RUJKZKUmSIfK
 GfF2nskbrAMrcKBYFVpnYM1sTEcSnFUXyvKqXFAzsuWu0KUzY1/E6Gdrv+dyXOQXgVcUCF
 AsaZpGdbVxrUkCIaopi76FpLJk8hjGE=
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Redesign of QEMU startup & initial configuration
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <da52f408-6037-20a9-78a9-77f12d86f620@redhat.com>
Date: Wed, 15 Dec 2021 21:14:44 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <500D0A58-A328-4E71-A2FD-23515E2ED4CC@greensocs.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <877dc7tnjf.fsf@dusky.pond.sub.org>
 <da52f408-6037-20a9-78a9-77f12d86f620@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mark.burton@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


FWIW I Agree.

(Which probably means somethings hiding somewhere :-) )

Cheers
Mark.

> On 15 Dec 2021, at 21:00, Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> On 12/14/21 12:48, Markus Armbruster wrote:
>> Let's start with where we (hopefully) agree:
>=20
> More or less I do agree with this, except for a couple points below =
where I think we disagree.
>=20
>> * We need a single, cohesive, low-level interface suitable for
>>   management applications.
>> * The existing interface is specified in QAPI.  Its concrete =
transport
>>   is QMP.
>> * The existing interface is not complete: certain things can only be
>>   done with the CLI.
>>=20
>> * The existing transport is not available early enough to permit
>>   completing the interface.
>=20
> So far so good.
>=20
>> * Fixing that involves a rework of startup.
>> * Reworking the existing startup and managing incompatible changes is
>>   impractical, and likely to make the mess we have on our hands =
worse.
>=20
> Not really, in particular the startup has been mostly reworked already =
and I disagree that it is messy.  softmmu/vl.c is messy, sure: it has N =
different command line parser for command line options, magic related to =
default devices, and complicated ordering of -object creation.
>=20
> But the building of emulator data structures is not messy; only the =
code that transforms the user's instructions into startup commands.  The =
messy parts are almost entirely contained within softmmu/vl.c.
>=20
> The one (and important, but fixable) exception is backends for =
on-board devices: serial_hd, drive_get, and nd_table.
>=20
>> * A new binary sidesteps the need to manage incompatible change.
>=20
> More precisely, a new binary sidesteps the need to integrate an =
existing mechanism with a new transport, and deal with the =
incompatibilities that arise.
>=20
>> Any objections so far?
>> Now let me make a few more points:
>> * Single, cohesive interface does not require single transport.  In
>>   fact, we already have two: QMP and the (internal) C interface.
>> * QMP encodes the abstract interface in JSON, and offers the result =
on a
>>   Unix domain socket[1].
>> * The (internal) C interface encodes the abstract interface as a set =
of
>>   C data types and functions.
>> * Consider a configuration file transport that encodes the abstract
>>   interface in JSON.  The only wart this adds is syntax that is
>>   arguiably ill-suited to the purpose.  More suitable syntax exists.
>> * Similar for CLI.
>> * To get a "a second set of warts layered on top", we actually have =
to
>>   layer something on top that isn't utterly trivial.  Like a
>>   higher-level interface.  The "second set of warts" objection does =
not
>>   apply to (sane) transports.
>=20
> The problem is that CLI and HMP, being targeted to humans (and as you =
say below humans matter), are not necessarily trivial transports.  If =
people find the trivial transport unusable, we will not be able to =
retire the old CLI.
>=20
> Bad CLI is also very hard to deprecate because, unlike QMP (for which =
you can delegate the workarounds to Libvirt & friends) and HMP (for =
which people can just learn the new thing and type it), it is baked in =
countless scripts.  People hate it when scripts break.
>=20
>> * The old CLI is partly layered on QMP, partly on HMP, and partly on
>>   internal C interfaces.  It's full of warts.
>=20
> I've worked on moving it more towards QMP or at least QOM, and much =
less on internal C interfaces.  It still has warts but they are =
self-contained and due to the baroque ordering of options.  My point is =
that we can continue this work to the point that having separate entry =
points (one CLI-centered, one QMP-only) is not a problem.
>=20
> The issues with the CLI then can be completely self-contained within =
softmmu/vl.c, and will not influence the innards of QEMU.
>=20
> Paolo
>=20
>> * Management applications are not the only users that matter.  Humans
>>   matter.  Simple programs like ad hoc scripts matter.


