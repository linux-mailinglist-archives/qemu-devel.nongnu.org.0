Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C44745B8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 15:58:31 +0100 (CET)
Received: from localhost ([::1]:34844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9GA-00022H-Hc
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 09:58:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mx9CO-0007Sn-IV
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:54:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mx9CM-0000Tk-Tj
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639493674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J2VOhYENKcUqVimOm0IguABbDbvpr3mvcNJ3z8+xWrM=;
 b=BsdKFY9M5TPsBit94fzVeo7hRCpJmEro2mftVUCYxuF6Nhrr/bZkt4lyp+X/xKJ3sDnNJV
 SuBHvkNn8ao/7BJeP8PYWI2vO2CHt/c05DP1dNhtGL8mdKTxmoOhCjO9isXKPD30xTuJoA
 sjOruAMqxMBp3XsAtgZ+caiXmmPabFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-zkAD_64oPbO5dOYDT8A38Q-1; Tue, 14 Dec 2021 09:54:29 -0500
X-MC-Unique: zkAD_64oPbO5dOYDT8A38Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FDD31006AA1;
 Tue, 14 Dec 2021 14:54:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C843B78C2C;
 Tue, 14 Dec 2021 14:54:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 57728113865F; Tue, 14 Dec 2021 15:54:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Burton <mark.burton@greensocs.com>
Subject: Re: Redesign of QEMU startup & initial configuration
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <877dc7tnjf.fsf@dusky.pond.sub.org>
 <9A2428AE-9EDC-4E2E-BA1F-07BBCF841DEA@greensocs.com>
Date: Tue, 14 Dec 2021 15:54:06 +0100
In-Reply-To: <9A2428AE-9EDC-4E2E-BA1F-07BBCF841DEA@greensocs.com> (Mark
 Burton's message of "Tue, 14 Dec 2021 14:00:38 +0100")
Message-ID: <877dc7qltd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Burton <mark.burton@greensocs.com> writes:

>> On 14 Dec 2021, at 12:48, Markus Armbruster <armbru@redhat.com> wrote:
>>=20
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>=20
>>> On 12/13/21 16:28, Markus Armbruster wrote:
>>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>>=20
>>>>> On 12/10/21 14:54, Markus Armbruster wrote:
>>>>>> I want an open path to a single binary.  Taking years to get there i=
s
>>>>>> fine.
>>>>>=20
>>>>> The single binary is a distraction in my opinion.  Imagine
>>>>> instead of vl.c you have this in your second binary:
>>=20
>> [...]
>>=20
>>>>> This is the ultimate QEMU startup code.  If we can get this code to
>>>>> actually build a machine, you've reached the point where you don't ca=
re
>>>>> about what is in the command line parser; and consequently you don't =
care
>>>>> if there is one binary or two.
>>>>=20
>>>> Define "you".  Also explain why it should include me, because I think =
it
>>>> doesn't :)
>>>=20
>>> Impersonal you. :)
>>=20
>> Unfortunate choice of a word.
>>=20
>>>> By when can we have this second binary in master?  Opinion, please, no=
t
>>>> promise.
>>>=20
>>> Define "have":
>>>=20
>>> - a binary that builds
>>>=20
>>> - a binary that builds a bootable guest
>>>=20
>>> - a binary that builds any guest that the current well-maintained
>>>  targets can build, using a given (but roughly full-featured) subset
>>> of options
>>>=20
>>> Estimates for the first are easy (it's in my tree), estimates for the
>>> second depends on somebody helping (upstreaming -M smp took months=20
>>> between me being busy, reviewers being busy, and releases freezing
>>> development), estimates for the third are hard.
>>=20
>> Thanks.
>>=20
>>>> Would you object to me expanding the CLI here to the point where I thi=
nk
>>>> we can deprecate the old binary?
>>>>=20
>>>> If yes, why?
>>>=20
>>> Yes, for two reasons.
>>>=20
>>> First, because there will be usually differences between the command
>>> lines as mentioned elsewhere in the thread.  qemu-system-* is a good=20
>>> name, but one that is already taken by 15 years of docs using the
>>> existing command line.
>>=20
>> A new CLI is pointless unless there are differences to the old one.
>>=20
>> It is unadvisable unless we can eventually retire the old one.
>>=20
>> While they coexist, the old binary name should use the old CLI, to
>> reduce confusion.
>>=20
>>> Second, because a command line is really hard to get right as
>>> complexity increases.  QMP is the way to go to get as clean as
>>> possible a configuration mechanism.  There *will* be a second set of
>>> warts layered on top of the above code, and I don't want that.
>>=20
>> We do not have consensus.  We may have misunderstandings.
>>=20
>> Let's start with where we (hopefully) agree:
>>=20
>> * We need a single, cohesive, low-level interface suitable for
>>  management applications.
>>=20
>> * The existing interface is specified in QAPI.  Its concrete transport
>>  is QMP.
>>=20
>> * The existing interface is not complete: certain things can only be
>>  done with the CLI.
>>=20
>> * The existing transport is not available early enough to permit
>>  completing the interface.
>>=20
>> * Fixing that involves a rework of startup.
>>=20
>> * Reworking the existing startup and managing incompatible changes is
>>  impractical, and likely to make the mess we have on our hands worse.
>
> For =E2=80=9CCompleting=E2=80=9D the interface, I agree.=20
> To add a certain number of use cases - many of those can be (have been - =
aka preconfig) done, if with some degree of unpleasant-ness NOW without ful=
l re-working. That would give us test cases that we can subsequently use to=
 test against as we move forward.

I'd be okay with hacking up the current mess some more so it can serve
as a test bed, as long as we all understand that the hacks are to be
reverted.

>> * A new binary sidesteps the need to manage incompatible change.
>>=20
>> Any objections so far?
>>=20
>> Now let me make a few more points:
>>=20
>> * Single, cohesive interface does not require single transport.  In
>>  fact, we already have two: QMP and the (internal) C interface.
>>=20
>> * QMP encodes the abstract interface in JSON, and offers the result on a
>>  Unix domain socket[1].
>>=20
>> * The (internal) C interface encodes the abstract interface as a set of
>>  C data types and functions.
>>=20
>> * Consider a configuration file transport that encodes the abstract
>>  interface in JSON.  The only wart this adds is syntax that is
>>  arguiably ill-suited to the purpose.  More suitable syntax exists.
>>=20
>> * Similar for CLI.
>>=20
>> * To get a "a second set of warts layered on top", we actually have to
>>  layer something on top that isn't utterly trivial.  Like a
>>  higher-level interface.  The "second set of warts" objection does not
>>  apply to (sane) transports.
>>=20
>> * We already layer an interface on top: HMP[2].  It has its warts.
>>=20
>> * The old CLI is partly layered on QMP, partly on HMP, and partly on
>>  internal C interfaces.  It's full of warts.
>>=20
>> * Management applications are not the only users that matter.  Humans
>>  matter.  Simple programs like ad hoc scripts matter.
>>=20
> (Unless one considers that a =E2=80=98human=E2=80=99 and/or =E2=80=99scri=
pt=E2=80=99 interface would just be =E2=80=98yet another management interfa=
ce=E2=80=99=E2=80=A6. And can/should be relegated to Somebody Else=E2=80=99=
s Problem)

I really hate relying on this Somebody guy, he never gets anything done.

[...]


