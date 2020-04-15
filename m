Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13E91AAFEC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 19:40:37 +0200 (CEST)
Received: from localhost ([::1]:53227 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOm1c-0007Dg-Uw
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 13:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jOm0O-0006M0-EZ
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 13:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jOm0M-0007RI-4B
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 13:39:19 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:53116)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jOm0L-0007Ol-Aa; Wed, 15 Apr 2020 13:39:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4AD6F747E06;
 Wed, 15 Apr 2020 19:39:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 21D6A747DF8; Wed, 15 Apr 2020 19:39:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 209E6747DFB;
 Wed, 15 Apr 2020 19:39:14 +0200 (CEST)
Date: Wed, 15 Apr 2020 19:39:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH-for-5.0 v2] hw/display/sm501: Avoid heap overflow in
 sm501_2d_operation()
In-Reply-To: <alpine.BSF.2.22.395.2004151923090.92157@zero.eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2004151934110.92157@zero.eik.bme.hu>
References: <20200413220100.18628-1-f4bug@amsat.org>
 <CAFEAcA8kF1dhR0k2kgEr-KxBspxcqLXxVqWcMadDns3-SYKrAQ@mail.gmail.com>
 <alpine.BSF.2.22.395.2004151923090.92157@zero.eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1809492258-1586972354=:92157"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Zhang Zi Ming <1015138407@qq.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1809492258-1586972354=:92157
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Apr 2020, BALATON Zoltan wrote:
> On Wed, 15 Apr 2020, Peter Maydell wrote:
>> On Mon, 13 Apr 2020 at 23:01, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org>=20
>> wrote:
>>>=20
>>> Zhang Zi Ming reported a heap overflow in the Drawing Engine of
>>> the SM501 companion chip model, in particular in the COPY_AREA()
>>> macro in sm501_2d_operation().
>>>=20
>>> Add a simple check to avoid the heap overflow.
>>=20
>>> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
>>> index de0ab9d977..902acb3875 100644
>>> --- a/hw/display/sm501.c
>>> +++ b/hw/display/sm501.c
>>> @@ -726,6 +726,12 @@ static void sm501_2d_operation(SM501State *s)
>>>      int crt =3D (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 :=
 0;
>>>      int fb_len =3D get_width(s, crt) * get_height(s, crt) * get_bpp(=
s,=20
>>> crt);
>>>=20
>>> +    if (rtl && (src_x < operation_width || src_y < operation_height)=
) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "sm501: Illegal RTL address (=
%i,=20
>>> %i)\n",
>>> +                      src_x, src_y);
>>> +        return;
>>> +    }
>>=20
>> This does fix an issue, but I have a feeling that there are
>> other possible guest register value combinations that might
>> cause us to index off one end or the other of the local_mem.
>
> That's what I've meant by it should be reimplemented eventually to fix =
all=20
> possible problems but could not do that before 5.0. Since this is exist=
ing=20
> bug ever since this device is first committed not patching it now is pr=
obably=20
> not a big deal if this is not considered a security problem. (And if it=
 is=20
> then all the abort() calls are probably a problem too although less ser=
ious.)
>
>> The SM501 datasheet is entirely unhelpful on this question, but
>> my suggestion is that we should convert the code so that instead
>> of operating directly on pointers into the middle of the local_mem
>> buffer all the accesses to local_mem go via functions which mask
>> off the high bits of the index. That effectively means that the
>> behaviour if we index off the end of the graphics memory is
>> that we just wrap round to the start of it. It should be fairly
>> easy to be confident that the code isn't accessing off the end
>> of the array and it might even be what the hardware actually does
>> (since it would correspond to 'use low bits of the address to
>> index the ram, ignore high bits')...
>
> Does that make it even slower than it is already? I think it should rat=
her be=20
> changed to do what I've done in ati_2d.c and call optimised functions t=
o do=20
> the blit operation instead of implementing it directly. Then we'll need

As blits are common operation in several video cards, such as sm501,=20
cirrus and ati-vga at least maybe we could also split off some common=20
helpers to have one implementation of these which could be secured and=20
optimised once and not have to fix it in every device separately. I don't=
=20
volunteer to do that by maybe there's someone who wants to try that?

Regards,
BALATON Zoltan
--3866299591-1809492258-1586972354=:92157--

