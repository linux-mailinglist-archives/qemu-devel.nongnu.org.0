Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D085947464C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:20:22 +0100 (CET)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9bJ-0001fj-Ok
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:20:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx9VQ-0004NO-Qh
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:14:17 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:51890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mx9VJ-00030j-7g
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:14:14 -0500
Received: from smtpclient.apple (lfbn-bor-1-1317-97.w193-250.abo.wanadoo.fr
 [193.250.130.97])
 by beetle.greensocs.com (Postfix) with ESMTPSA id CFC0020780;
 Tue, 14 Dec 2021 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639494845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x79TC9a6y7CbKnykiQo16GSVeb1M6G2xIDmixm32awM=;
 b=19fhHA5GqFQk58hJV0hHoDiiIMJDozDPcCxu0A1VqJgWPMZc5BVQorzxQbkXbeQgboGbjY
 SjtD2iVZdw605kx6HlPrWJzlDmyVkxhryi/c3wqA+AyD8n/WdSqhTf8bcgislD3EDsZ/IG
 6ljh2KESrPW2Di9mXz3RHbobXRZqbZI=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Redesign of QEMU startup & initial configuration
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <87ilvrp6ea.fsf@dusky.pond.sub.org>
Date: Tue, 14 Dec 2021 16:14:04 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <728A7E08-B772-4CC4-9E52-0BAFAAB2BABE@greensocs.com>
References: <87ilvszg52.fsf@dusky.pond.sub.org>
 <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
 <YbeJ/zTV/n+l2CmH@redhat.com>
 <9AF99888-A4BF-4459-92C1-71E5B76A2C79@greensocs.com>
 <YbiWh8nQDWpMegER@redhat.com>
 <4AED38B2-E2DD-46F7-93AA-622D5F6BB570@greensocs.com>
 <YbiaYnPTUZ70hC1j@redhat.com>
 <E52F9A8B-A66C-4E54-8F74-F4F45E3FD7A8@greensocs.com>
 <Ybigt8LMt20L1AqS@redhat.com>
 <B3F81D50-DB24-40EE-BB36-F17FCC3394F0@greensocs.com>
 <Ybiwhfbs+j7RzNrj@redhat.com> <87ilvrp6ea.fsf@dusky.pond.sub.org>
To: Markus Armbruster <armbru@redhat.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mark.burton@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



> On 14 Dec 2021, at 16:12, Markus Armbruster <armbru@redhat.com> wrote:
>=20
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>=20
>> On Tue, Dec 14, 2021 at 03:42:52PM +0100, Mark Burton wrote:
>>> I think we=E2=80=99re talking at cross purposes, and probably we =
agree (not sure). I=E2=80=99ll top quote to try and explain my point of =
view.
>>>=20
>>> I think there are two discussions being mixed:
>>> 1/ A discussion about improving the CLI. (Having a new one, etc etc)
>>> 2/ A discussion about supporting a low level, and complete, API that =
can be used by =E2=80=9Cmanagement layers=E2=80=9D (QAPI).
>>>=20
>>> I think this also gets mixed up with the discussion on migrating the =
CLI to use the low level API.
>>>=20
>>> I want to focus on the low level API.=20
>>>=20
>>> I dont see why we=E2=80=99re discussing a =E2=80=98high level=E2=80=99=
 thing when, for now, we have to support the CLI, and we have work to do =
on QAPI.
>>=20
>> We're discussing both because we're setting out what our end goal is
>> to be, and that end goal should be expected to cover both use cases.
>>=20
>>> If somebody wants to build a new CLI, with a new =E2=80=98high =
level=E2=80=99
>>> interface, using QAPI - let them!
>>=20
>> This is too weak of a statement, as it implies that a replacement

=E2=80=9CReplacement=E2=80=9D=20
	So long as thats really what you want.=20

Cheers
Mark.

>> high level interface is optional and not important for the overall
>> project. I don't believe that to be the case, so I'm saying that
>> our design & impl plan has to demonstrate how we intend to cover
>> both deliverables or use cases. We can't simply ignore the high
>> level API saying it is someone else's problem to worry about.
>=20
> Seconded.
>=20


