Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1BD47432C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:07:48 +0100 (CET)
Received: from localhost ([::1]:45010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7X1-0006Os-K1
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:07:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx7QC-0005M3-ON
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:00:46 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx7QA-0007YR-2b
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:00:44 -0500
Received: from smtpclient.apple (lfbn-bor-1-1317-97.w193-250.abo.wanadoo.fr
 [193.250.130.97])
 by beetle.greensocs.com (Postfix) with ESMTPSA id AB76020785;
 Tue, 14 Dec 2021 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639486838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NQRIv40ws3lv4s1LEtstO83s36E5dYdogqJcZH0gag=;
 b=oqe8reIhIEa4vRzXFrXilWQe7j12cj0IfQl+9j14XL59ebutznPmBQGjThvhRilNE2D/g8
 qyGrBDKTEo30mc49mYqDdkUE2pg/tBY+ZICOFULOu4dJq4TXEhDco6ETk6+QYHcPUXfome
 GhY9UqkRtCXMCPJNm/tQg37szHTMFWU=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Redesign of QEMU startup & initial configuration
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <877dc7tnjf.fsf@dusky.pond.sub.org>
Date: Tue, 14 Dec 2021 14:00:38 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A2428AE-9EDC-4E2E-BA1F-07BBCF841DEA@greensocs.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <877dc7tnjf.fsf@dusky.pond.sub.org>
To: Markus Armbruster <armbru@redhat.com>
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
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 14 Dec 2021, at 12:48, Markus Armbruster <armbru@redhat.com> wrote:
>=20
> Paolo Bonzini <pbonzini@redhat.com> writes:
>=20
>> On 12/13/21 16:28, Markus Armbruster wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>=20
>>>> On 12/10/21 14:54, Markus Armbruster wrote:
>>>>> I want an open path to a single binary.  Taking years to get there =
is
>>>>> fine.
>>>>=20
>>>> The single binary is a distraction in my opinion.  Imagine
>>>> instead of vl.c you have this in your second binary:
>=20
> [...]
>=20
>>>> This is the ultimate QEMU startup code.  If we can get this code to
>>>> actually build a machine, you've reached the point where you don't =
care
>>>> about what is in the command line parser; and consequently you =
don't care
>>>> if there is one binary or two.
>>>=20
>>> Define "you".  Also explain why it should include me, because I =
think it
>>> doesn't :)
>>=20
>> Impersonal you. :)
>=20
> Unfortunate choice of a word.
>=20
>>> By when can we have this second binary in master?  Opinion, please, =
not
>>> promise.
>>=20
>> Define "have":
>>=20
>> - a binary that builds
>>=20
>> - a binary that builds a bootable guest
>>=20
>> - a binary that builds any guest that the current well-maintained
>>  targets can build, using a given (but roughly full-featured) subset
>> of options
>>=20
>> Estimates for the first are easy (it's in my tree), estimates for the
>> second depends on somebody helping (upstreaming -M smp took months=20
>> between me being busy, reviewers being busy, and releases freezing
>> development), estimates for the third are hard.
>=20
> Thanks.
>=20
>>> Would you object to me expanding the CLI here to the point where I =
think
>>> we can deprecate the old binary?
>>>=20
>>> If yes, why?
>>=20
>> Yes, for two reasons.
>>=20
>> First, because there will be usually differences between the command
>> lines as mentioned elsewhere in the thread.  qemu-system-* is a good=20=

>> name, but one that is already taken by 15 years of docs using the
>> existing command line.
>=20
> A new CLI is pointless unless there are differences to the old one.
>=20
> It is unadvisable unless we can eventually retire the old one.
>=20
> While they coexist, the old binary name should use the old CLI, to
> reduce confusion.
>=20
>> Second, because a command line is really hard to get right as
>> complexity increases.  QMP is the way to go to get as clean as
>> possible a configuration mechanism.  There *will* be a second set of
>> warts layered on top of the above code, and I don't want that.
>=20
> We do not have consensus.  We may have misunderstandings.
>=20
> Let's start with where we (hopefully) agree:
>=20
> * We need a single, cohesive, low-level interface suitable for
>  management applications.
>=20
> * The existing interface is specified in QAPI.  Its concrete transport
>  is QMP.
>=20
> * The existing interface is not complete: certain things can only be
>  done with the CLI.
>=20
> * The existing transport is not available early enough to permit
>  completing the interface.
>=20
> * Fixing that involves a rework of startup.
>=20
> * Reworking the existing startup and managing incompatible changes is
>  impractical, and likely to make the mess we have on our hands worse.

For =E2=80=9CCompleting=E2=80=9D the interface, I agree.=20
To add a certain number of use cases - many of those can be (have been - =
aka preconfig) done, if with some degree of unpleasant-ness NOW without =
full re-working. That would give us test cases that we can subsequently =
use to test against as we move forward.

>=20
> * A new binary sidesteps the need to manage incompatible change.
>=20
> Any objections so far?
>=20
> Now let me make a few more points:
>=20
> * Single, cohesive interface does not require single transport.  In
>  fact, we already have two: QMP and the (internal) C interface.
>=20
> * QMP encodes the abstract interface in JSON, and offers the result on =
a
>  Unix domain socket[1].
>=20
> * The (internal) C interface encodes the abstract interface as a set =
of
>  C data types and functions.
>=20
> * Consider a configuration file transport that encodes the abstract
>  interface in JSON.  The only wart this adds is syntax that is
>  arguiably ill-suited to the purpose.  More suitable syntax exists.
>=20
> * Similar for CLI.
>=20
> * To get a "a second set of warts layered on top", we actually have to
>  layer something on top that isn't utterly trivial.  Like a
>  higher-level interface.  The "second set of warts" objection does not
>  apply to (sane) transports.
>=20
> * We already layer an interface on top: HMP[2].  It has its warts.
>=20
> * The old CLI is partly layered on QMP, partly on HMP, and partly on
>  internal C interfaces.  It's full of warts.
>=20
> * Management applications are not the only users that matter.  Humans
>  matter.  Simple programs like ad hoc scripts matter.
>=20
(Unless one considers that a =E2=80=98human=E2=80=99 and/or =E2=80=99scrip=
t=E2=80=99 interface would just be =E2=80=98yet another management =
interface=E2=80=99=E2=80=A6. And can/should be relegated to Somebody =
Else=E2=80=99s Problem)

Cheers
Mark.


> Objections to these?
>=20
> [...]
>=20
>=20
> [1] Actually a QEMU character device now, but let's ignore that.
>=20
> [2] Except where we choose to bypass QMP, but that's unimportant here.
>=20


