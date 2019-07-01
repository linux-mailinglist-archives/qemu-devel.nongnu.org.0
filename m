Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DFFEAB5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 21:14:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLBjM-0005Kb-3U
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 15:14:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hLBiL-0004yh-A8
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 15:13:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hLBiJ-00088O-A2
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 15:13:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38849)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hLBiI-00087m-7p
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 15:13:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A95E35D5EF;
	Mon, 29 Apr 2019 19:13:15 +0000 (UTC)
Received: from [10.40.205.1] (unknown [10.40.205.1])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F6EF87CC;
	Mon, 29 Apr 2019 19:13:10 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20190429134757.13570-1-marcandre.lureau@redhat.com>
	<6f4b8998-341a-9169-b368-db4a6b00b65d@redhat.com>
	<CAJ+F1C+aXyC8UAaCKU7sD9LTZPDEaYhSufp9auxipxavDj3F+A@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <b34321fc-2c10-d930-c735-5490e704a101@redhat.com>
Date: Mon, 29 Apr 2019 21:13:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+aXyC8UAaCKU7sD9LTZPDEaYhSufp9auxipxavDj3F+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 29 Apr 2019 19:13:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] vl: fix -sandbox parsing crash when
 seccomp support is disabled
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Otubo <otubo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU <qemu-devel@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/04/2019 16:46, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Mon, Apr 29, 2019 at 4:26 PM Laurent Vivier <lvivier@redhat.com> wro=
te:
>>
>> On 29/04/2019 15:47, Marc-Andr=C3=A9 Lureau wrote:
>>> $ ./x86_64-softmmu/qemu-system-x86_64 -sandbox off
>>> qemu-system-x86_64: -sandbox off: There is no option group 'sandbox'
>>> Segmentation fault
>>>
>>> Commit 5780760f5e ("seccomp: check TSYNC host capability") wrapped on=
e
>>> use of the sandbox option group to produce a sensible error, it didn'=
t
>>> do the same for another call to qemu_opts_parse_noisily():
>>>
>>> (gdb) bt
>>>     at util/qemu-option.c:829
>>>  #0  0x00000000105b36d8 in opts_parse (list=3D0x0, params=3D0x3ffffff=
ffab5 "off", permit_abbrev=3Dtrue, defaults=3Dfalse, errp=3D0x3ffffffff08=
0)
>>>      at util/qemu-option.c:829
>>>  #1  0x00000000105b3b74 in qemu_opts_parse_noisily (list=3D<optimized=
 out>, params=3D<optimized out>, permit_abbrev=3D<optimized out>) at util=
/qemu-option.c:890
>>>  #2  0x0000000010024964 in main (argc=3D<optimized out>, argv=3D<opti=
mized out>, envp=3D<optimized out>) at vl.c:3589
>>>
>>> Fixes: 5780760f5ea6163939a5dabe7427318b4f07d1a2
>>> Cc: david@gibson.dropbear.id.au
>>> Cc: otubo@redhat.com
>>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>  vl.c | 18 ++++++++++--------
>>>  1 file changed, 10 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/vl.c b/vl.c
>>> index 4019a4387d..5fc4994d3c 100644
>>> --- a/vl.c
>>> +++ b/vl.c
>>> @@ -3866,17 +3866,19 @@ int main(int argc, char **argv, char **envp)
>>>                  qtest_log =3D optarg;
>>>                  break;
>>>              case QEMU_OPTION_sandbox:
>>> -#ifdef CONFIG_SECCOMP
>>> -                opts =3D qemu_opts_parse_noisily(qemu_find_opts("san=
dbox"),
>>> -                                               optarg, true);
>>> +                olist =3D qemu_find_opts("sandbox");
>>> +                if (!olist) {
>>> +#ifndef CONFIG_SECCOMP
>>
>> Why do you move the #ifdef? We have two separate error cases here.
>> And it seems better no to check for "-sandbox" when seccomp is disable=
d.
>=20
> I tried to remove the #ifdef altogether to simplify the code, then
> realized the error message could be useful.
>=20
> I don't think it's a problem to lookup "-sandbox" when seccomp is disab=
led.
>=20

ok, so:

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


