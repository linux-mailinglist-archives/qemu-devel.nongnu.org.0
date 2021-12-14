Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BEA4743DF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:52:15 +0100 (CET)
Received: from localhost ([::1]:33880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx8E2-00085A-1Q
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx7yv-0007A4-N2
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:36:37 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx7yp-0004Da-Is
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:36:37 -0500
Received: from smtpclient.apple (lfbn-bor-1-1317-97.w193-250.abo.wanadoo.fr
 [193.250.130.97])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A5AB520785;
 Tue, 14 Dec 2021 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639488986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBUy9CNTwUo5wsor+Kw2YisWzHQ6W/3lfB1GYShc0Q4=;
 b=E3Ghp5jnt8BOdAaydCtSLIhM9oJONIVemnB5aWKwjFIltYTSPEeClFKdiSHr5zKPG9PAb+
 RqljKODBMYTm5dk0CgFWVu/dhNQavz2Mg7ukapAndrIl66jGZbd9uikpCvt9Skn+RxMY3m
 X8syGlq+JUvMrmmNMvu3OMI6JAg6ZIE=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Redesign of QEMU startup & initial configuration
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <YbiaYnPTUZ70hC1j@redhat.com>
Date: Tue, 14 Dec 2021 14:36:26 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <E52F9A8B-A66C-4E54-8F74-F4F45E3FD7A8@greensocs.com>
References: <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <87czm47a77.fsf@dusky.pond.sub.org> <YbN0zLsDVr3B/s3+@redhat.com>
 <87ilvszg52.fsf@dusky.pond.sub.org>
 <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
 <YbeJ/zTV/n+l2CmH@redhat.com>
 <9AF99888-A4BF-4459-92C1-71E5B76A2C79@greensocs.com>
 <YbiWh8nQDWpMegER@redhat.com>
 <4AED38B2-E2DD-46F7-93AA-622D5F6BB570@greensocs.com>
 <YbiaYnPTUZ70hC1j@redhat.com>
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



> On 14 Dec 2021, at 14:21, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Tue, Dec 14, 2021 at 02:11:11PM +0100, Mark Burton wrote:
>>=20
>>=20
>>> On 14 Dec 2021, at 14:05, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>>=20
>>> On Mon, Dec 13, 2021 at 09:22:14PM +0100, Mark Burton wrote:
>>>>=20
>>>>=20
>>>>> On 13 Dec 2021, at 18:59, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>>>>=20
>>>>> =E2=80=A6. we no longer have to solve everything
>>>>> Ourselves.=20
>>>>=20
>>>> I support this sentiment.
>>>>=20
>>>> Lets re-factor the code so people can build what they need using an =
API.
>>>> Actually, =E2=80=98QEMU=E2=80=99 only need support the existing =
CLI, and provide a suitable internal API.
>>>> If that API was relatively stable, that would help those (few) who =
maintain a different startup mechanism (but its only a =E2=80=99nice to =
have=E2=80=99). (Making that convenient, as Paolo has show, would also =
be =E2=80=99nice to have=E2=80=99).
>>>=20
>>> To be clear I do strongly believe that the QEMU project needs
>>> to deliver the higher level simplified interface too. I just
>>> want that higher level interface to be flexible enough to
>>> let end users expand on what it offers, without having to
>>> write C code nor having to switch entirely to the low level
>>> interface like we do today.
>>>=20
>>> IOW, QEMU needs to deliver more than just a low level building
>>> block API.
>>=20
>> Why?
>> Clearly it would be nice if =E2=80=9Chigher level=E2=80=9D interfaceS =
existed in
>> the world. Clearly QEMU could provide one, two, or many. But, why
>> do you think QEMU =E2=80=98must=E2=80=99 provide them?
>=20
> To serve our users who are not all wanting to be use a management
> layer. They want to be using a simple binary to spin up adhoc
> VMs. This is the reason why we've kept most of the short option
> CLI args in the existing QEMU binaries, despite having more
> comprehensive low level replacement args.=20

So - there are
a) uses today that use the CLI as it exists.
b) users who might prefer a better interface if that was made available =
- but, again, that doesn=E2=80=99t require QEMU itself to do anything. =
If we provide a low-level API, and somebody else (you for instance) =
provides a =E2=80=99nice=E2=80=99 =E2=80=98friendly=E2=80=99 CLI or =
config file reader - those users would be happy.

I still dont see why QEMU itself needs to provide this =E2=80=98high =
level=E2=80=99 thing.=20

I think we all agree (correct me if I=E2=80=99m wrong) :
* We all want a low level interface
* We all want the current CLI to be supported (at least for now, though =
it could change in time)
* We all want the CLI to be based on the low level interface

I=E2=80=99m just asking why we ALSO want to support =E2=80=9Cyet another =
high level interface=E2=80=9D=E2=80=A6.

Is the argument about whether we re-implement the existing CLI ontop of =
the =E2=80=98low level=E2=80=99 API (aka QAPI)?

>=20
> If we just declare we're not going to provide this simple binary
> any more, then we're just casting these users adrift. This in

=E2=80=9CAny more=E2=80=9D - Are you talking about the existing CLI =
users?

> effect means they'll just carry on existing the historical QEMU
> binaries and we'll never be able to eliminate them, so we'll be
> maintaining two things forever.

A CLI and the low level interface? - Yes? Can we remove the CLI and only =
support the low-level interface ? But here you seem to be arguing =
against yourself, so I guess I misunderstood.

Cheers
Mark.

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


