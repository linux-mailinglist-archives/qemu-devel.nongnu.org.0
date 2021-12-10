Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BE14702B8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:22:20 +0100 (CET)
Received: from localhost ([::1]:40250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvgmx-0000KO-TG
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:22:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mvggo-0004xq-1z
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:15:58 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:37316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mvggk-00009S-PL
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:15:57 -0500
Received: from smtpclient.apple (lfbn-bor-1-1317-97.w193-250.abo.wanadoo.fr
 [193.250.130.97])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E02E321A87;
 Fri, 10 Dec 2021 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639145751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PKVNAHp4BydPhKhoxnDx+Z5H+U3VcNphElySXBcAgw=;
 b=sJbznqM9REmgCpLsRzjHGW6cRqfh/hEuV5c9AK9uycEyrcGRfqywjdQ2IoX67bN8hMnNgm
 rHvGiReM45uJTbRHL2p+b0t+QfVpxoPHlZBPZwp6j8uDjDLxBOdwmGklc0AoC3TqiBvNC7
 X0PX34JOy8ALKMiY1blipe553sGspcw=
From: Mark Burton <mark.burton@greensocs.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Redesign of QEMU startup & initial configuration
Date: Fri, 10 Dec 2021 15:15:50 +0100
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <YbM5Q+gq89rWoPt8@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
In-Reply-To: <YbM5Q+gq89rWoPt8@redhat.com>
Message-Id: <A220E257-3378-4E43-86B6-4ED84E3CA3E8@greensocs.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 10 Dec 2021, at 12:25, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Fri, Dec 10, 2021 at 09:34:41AM +0100, Paolo Bonzini wrote:
>> On 12/9/21 20:11, Daniel P. Berrang=C3=A9 wrote:
>>>>    They still need to bootstrap a QMP monitor, and for that, CLI is =
fine
>>>>    as long as it's simple and stable.
>>=20
>> I would go a step further and say that the QMP monitor socket should =
be
>> created by whoever invoked QEMU and passed down via systemd's socket
>> activation protocol, with a fallback to stdin/stdout.

Could we take one more small step =E2=80=A6.=20
(Sorry - I=E2=80=99m sure you=E2=80=99ll all hate me for pointing at the =
elephant in the room=E2=80=A6.)

Why should QEMU itself handle this? You may want to use systemd socket =
activation, I may be happier with a different approach. The commonality =
is surely at the level of the underlying QAPI.
Being able to build QEMU as a =E2=80=A6.. library, with a single entry =
point to access the QAPI would allow the QEMU community to focus on =
it=E2=80=99s key =E2=80=98kernel=E2=80=99, while others are able to =
propose integrated solutions like activation through systemd an/or =
whatever libvirt does etc etc=E2=80=A6. By all means there can be a =
systemd-qemu project=E2=80=A6. But does that have to be baked into QEMU?
I know there=E2=80=99s a history on the use of the =E2=80=9CLibrary=E2=80=9D=
 word - equally there is a notion of a library needing a static =
interface etc - I propose we agree upon a single access mechanism to the =
QAPI - who=E2=80=99s existence and stability we have already (I think) =
agreed upon.

This requires a =E2=80=98full=E2=80=99 QAPI, of course, and a bit of =
care in the build system. It allows total flexibility, and the =
guarantees of stability reach no further than what we're proposing =
anyway. The existing CLI can migrate (fast or slow) to using QAPI=E2=80=A6=
.

Cheers
Mark.


>=20
> That's an interesting idea, firmly relegating any "human friendly"
> targetted CLI to a separate program, that in turn invokes this
> low level QEMU binary. I do like the simplicity of this and the
> strict division of the layers it provides us, as it will help keep
> us honest when designing human friendly interfaces.
>=20
> To be clear, I do think the QEMU project should be delivering a
> nice simple human targetted interface, and ideally using the
> '/usr/bin/qemu' binary name, and able to deliver users a machines
> with a modern hardware config that can evolve over time.
>=20
>>>> =3D Appendix: Why further incremental change feels impractical =3D
>>>>=20
>>>> Crafting a big change in small steps sounds great.  It isn't when =
we
>>>> have to make things worse before they can get better, and every =
step is
>>>> painfully slow because it's just too hard, and the end state we aim =
for
>>>> isn't really what we want.
>>>=20
>>> I can't disagree with this. If we carry on trying to evolve vl.c
>>> incrementally we are doomed to be stuck with a horrible starstup
>>> process for enternity (or at least as long as I'll still be
>>> working as QEMU maintainer).
>>=20
>> ... and if you compare vl.c in 5.2 and now, and consider current vl.c =
to be
>> horrible, my knowedge of English does not include an adjective to =
describe
>> the 5.2 state.  Some incremental work _is_ possible or even =
necessary, and
>> has been done already.
>=20
> Right, I'm not saying vl.c hasn't improved, but we're never going
> to get out of the peculiar historical startup ordering rules we
> have today by incremental fixes, without breaking people.
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    =
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            =
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    =
https://www.instagram.com/dberrange :|
>=20


