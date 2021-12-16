Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20C477924
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:33:40 +0100 (CET)
Received: from localhost ([::1]:51220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxthK-00023V-OX
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:33:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mxtbX-0007sT-Gq
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:27:39 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mxtbU-0004DM-Ms
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:27:38 -0500
Received: from smtpclient.apple (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 8781F20775;
 Thu, 16 Dec 2021 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639672053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWd0kM7H+Xlq6zXd+TfuVp9c1h1zeJ9XpWY3TnjLvh8=;
 b=BspVi/Gskdrs1PZGWtwvxl8+6+Tdf7juOH6g6T1qx68gvy8wQnhli3eCmGiU8Ckja36GyA
 zdf+YTpXZnjrTKPIYO4ApC75SqimJVCXhmTCNXdLB2KzdAHcwDUUzk3PCdjDdSYJeNJDEj
 eEssDOXufdfcrFY7lx2HrwRYyqlhT6g=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Redesign of QEMU startup & initial configuration
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <YbtmJKN4PMheMElx@redhat.com>
Date: Thu, 16 Dec 2021 17:27:33 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <FFD798FB-EFA1-470D-95CE-E645D0F0158E@greensocs.com>
References: <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <877dc7tnjf.fsf@dusky.pond.sub.org>
 <da52f408-6037-20a9-78a9-77f12d86f620@redhat.com>
 <875yroyhih.fsf@dusky.pond.sub.org>
 <8dd178b7-631b-25b4-4f68-334b0d583f72@redhat.com>
 <YbteCdJDt8B95sfj@redhat.com>
 <FA6AC81F-1101-42CD-B3FB-54E4F81CF60D@greensocs.com>
 <YbtmJKN4PMheMElx@redhat.com>
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



>>=20
>> Totally agree on this (of course).
>>=20
>> Thats why I=E2=80=99m here - I care about the people who care about =
emulation  :-)
>>=20
>> In general, what we are working on is exactly the ability to service =
the =E2=80=98complex=E2=80=99 emulation use case. No CLI, nor single =
=E2=80=98config=E2=80=99 file will be good enough, in all cases we will =
need to drive directly into QMP.
>=20
> Can you clarify when you say 'what we are working on' here who & what
> are you refering to ? Something Greensocs is developing or am I
> mis-interpreting ?

Yes - on behalf of Edgar and others.
There are various Device tree (or device tree like) syntaxes that people =
want to use to =E2=80=98configure=E2=80=99 a machine. A typical use case =
could potentially also include =E2=80=98CLI=E2=80=99 features as well =
for users to select files or whatever. (Wether that CLI is interpreted =
by QEMU or another mechanism isn=E2=80=99t very important).
Equally, GreenSocs itself would also like a =E2=80=98cleaner=E2=80=99 =
way to =E2=80=98instantiate=E2=80=99 QEMU within a different simulation =
environment - for that, we want to strip off the startup and essentially =
provide our own (hence Paolo=E2=80=99s rather simple code is very =
appealing). So those are 2 use cases we care about on our side.

Cheers
Mark

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


