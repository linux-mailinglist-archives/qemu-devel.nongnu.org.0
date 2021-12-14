Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C673247458F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 15:49:54 +0100 (CET)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx97p-0007Sc-CH
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 09:49:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx918-0005Zx-Pj
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:42:58 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:51316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx915-0007Kq-H9
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:42:58 -0500
Received: from smtpclient.apple (lfbn-bor-1-1317-97.w193-250.abo.wanadoo.fr
 [193.250.130.97])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A2FAA20785;
 Tue, 14 Dec 2021 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639492972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OnHU5qz+9HP5yehxyjxOuc15oGcSs5VN64fQE9HI4U4=;
 b=GpbjAkhtZMOPw12H7ZX/LSmGBZdI9hE6MuuNBrmULPNrmpPTBdK+I7SZp0WAX4DBYdNoDC
 KngS4+A87d55lN0PD46/hUa5plr2PmlCmSjceY0/e8hPWqVWqJPP5hJDVkca0UsmrnYqFM
 1bFd/1uO/VX5ih4+Q6yBLbiaN6YDkxA=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Redesign of QEMU startup & initial configuration
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <Ybigt8LMt20L1AqS@redhat.com>
Date: Tue, 14 Dec 2021 15:42:52 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3F81D50-DB24-40EE-BB36-F17FCC3394F0@greensocs.com>
References: <87czm47a77.fsf@dusky.pond.sub.org> <YbN0zLsDVr3B/s3+@redhat.com>
 <87ilvszg52.fsf@dusky.pond.sub.org>
 <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
 <YbeJ/zTV/n+l2CmH@redhat.com>
 <9AF99888-A4BF-4459-92C1-71E5B76A2C79@greensocs.com>
 <YbiWh8nQDWpMegER@redhat.com>
 <4AED38B2-E2DD-46F7-93AA-622D5F6BB570@greensocs.com>
 <YbiaYnPTUZ70hC1j@redhat.com>
 <E52F9A8B-A66C-4E54-8F74-F4F45E3FD7A8@greensocs.com>
 <Ybigt8LMt20L1AqS@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
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
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think we=E2=80=99re talking at cross purposes, and probably we agree =
(not sure). I=E2=80=99ll top quote to try and explain my point of view.

I think there are two discussions being mixed:
1/ A discussion about improving the CLI. (Having a new one, etc etc)
2/ A discussion about supporting a low level, and complete, API that can =
be used by =E2=80=9Cmanagement layers=E2=80=9D (QAPI).

I think this also gets mixed up with the discussion on migrating the CLI =
to use the low level API.

I want to focus on the low level API.=20

I dont see why we=E2=80=99re discussing a =E2=80=98high level=E2=80=99 =
thing when, for now, we have to support the CLI, and we have work to do =
on QAPI.=20

If somebody wants to build a new CLI, with a new =E2=80=98high level=E2=80=
=99 interface, using QAPI - let them!

Cheers
Mark.



> On 14 Dec 2021, at 14:48, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Tue, Dec 14, 2021 at 02:36:26PM +0100, Mark Burton wrote:
>>=20
>>=20
>>> On 14 Dec 2021, at 14:21, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>>=20
>>> On Tue, Dec 14, 2021 at 02:11:11PM +0100, Mark Burton wrote:
>>>>=20
>>>>=20
>>>>> On 14 Dec 2021, at 14:05, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>>>>=20
>>>>> On Mon, Dec 13, 2021 at 09:22:14PM +0100, Mark Burton wrote:
>>>>>>=20
>>>>>>=20
>>>>>>> On 13 Dec 2021, at 18:59, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>>>>>>=20
>>>>>>> =E2=80=A6. we no longer have to solve everything
>>>>>>> Ourselves.=20
>>>>>>=20
>>>>>> I support this sentiment.
>>>>>>=20
>>>>>> Lets re-factor the code so people can build what they need using =
an API.
>>>>>> Actually, =E2=80=98QEMU=E2=80=99 only need support the existing =
CLI, and provide a suitable internal API.
>>>>>> If that API was relatively stable, that would help those (few) =
who maintain a different startup mechanism (but its only a =E2=80=99nice =
to have=E2=80=99). (Making that convenient, as Paolo has show, would =
also be =E2=80=99nice to have=E2=80=99).
>>>>>=20
>>>>> To be clear I do strongly believe that the QEMU project needs
>>>>> to deliver the higher level simplified interface too. I just
>>>>> want that higher level interface to be flexible enough to
>>>>> let end users expand on what it offers, without having to
>>>>> write C code nor having to switch entirely to the low level
>>>>> interface like we do today.
>>>>>=20
>>>>> IOW, QEMU needs to deliver more than just a low level building
>>>>> block API.
>>>>=20
>>>> Why?
>>>> Clearly it would be nice if =E2=80=9Chigher level=E2=80=9D =
interfaceS existed in
>>>> the world. Clearly QEMU could provide one, two, or many. But, why
>>>> do you think QEMU =E2=80=98must=E2=80=99 provide them?
>>>=20
>>> To serve our users who are not all wanting to be use a management
>>> layer. They want to be using a simple binary to spin up adhoc
>>> VMs. This is the reason why we've kept most of the short option
>>> CLI args in the existing QEMU binaries, despite having more
>>> comprehensive low level replacement args.=20
>>=20
>> So - there are
>> a) uses today that use the CLI as it exists.
>> b) users who might prefer a better interface if that was made =
available - but, again, that doesn=E2=80=99t require QEMU itself to do =
anything. If we provide a low-level API, and somebody else (you for =
instance) provides a =E2=80=99nice=E2=80=99 =E2=80=98friendly=E2=80=99 =
CLI or config file reader - those users would be happy.
>>=20
>> I still dont see why QEMU itself needs to provide this =E2=80=98high =
level=E2=80=99 thing.
>=20
> The QEMU project has provided this high level CLI itself historically.
> In previous discussions about dropping the simplified options, leaving
> only the QAPI based options, that idea has always been rejected by a
> non-trivial number of QEMU maintainers who consider it a core part of
> our deliverable as a project.
>=20
>>=20
>> I think we all agree (correct me if I=E2=80=99m wrong) :
>> * We all want a low level interface
>> * We all want the current CLI to be supported (at least for now, =
though it could change in time)
>> * We all want the CLI to be based on the low level interface
>>=20
>> I=E2=80=99m just asking why we ALSO want to support =E2=80=9Cyet =
another high level interface=E2=80=9D=E2=80=A6.
>=20
> You're arguing for a significant change in the scope of what QEMU
> delivers to its users, punting a bunch of functionality to be
> someone else's problem.
>=20
>=20
>>> If we just declare we're not going to provide this simple binary
>>> any more, then we're just casting these users adrift. This in
>>=20
>> =E2=80=9CAny more=E2=80=9D - Are you talking about the existing CLI =
users?
>=20
> Yes.
>=20
>>> effect means they'll just carry on existing the historical QEMU
>>> binaries and we'll never be able to eliminate them, so we'll be
>>> maintaining two things forever.
>>=20
>> A CLI and the low level interface? - Yes? Can we remove the CLI
>> and only support the low-level interface ? But here you seem to
>> be arguing against yourself, so I guess I misunderstood.
>=20
> The current qemu-system-$TARGET emulators have a variety of
> CLI args, some low level QAPI driven, and some higher level
> simplified args. Mgmt app consumers tend to use the former,
> while our humans userbase tends to use the latter.  I'm
> saying we need to carry on serving both userbases, unless
> we get the QEMU maintainers in general to agree to a pretty
> significant change in what the project delivers. Based on
> previous discussions, I'm doubtful we'll get agreement to
> do that.
>=20
> So if we're going to successfully introduce replacement
> for qemu-system-$TARGET, we need to cater for both userbases,
> albeit we can do so with separate binaries, rather than trying
> to cram low level and high level into the same.
>=20
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


