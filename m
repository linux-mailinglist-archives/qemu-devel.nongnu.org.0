Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF719C5E5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 17:29:40 +0200 (CEST)
Received: from localhost ([::1]:43348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK1ml-00078W-D1
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 11:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jK1lX-0006VT-TM
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 11:28:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jK1lT-0005FY-5c
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 11:28:23 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:15574)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1jK1lS-00057I-QU
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 11:28:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6A02D747DF8;
 Thu,  2 Apr 2020 17:28:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 38B18747871; Thu,  2 Apr 2020 17:28:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 372DF74638A;
 Thu,  2 Apr 2020 17:28:15 +0200 (CEST)
Date: Thu, 2 Apr 2020 17:28:15 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Questionable aspects of QEMU Error's design
In-Reply-To: <87pncq0xdt.fsf@dusky.pond.sub.org>
Message-ID: <alpine.BSF.2.22.395.2004021716130.78264@zero.eik.bme.hu>
References: <87o8sblgto.fsf@dusky.pond.sub.org>
 <CAFEAcA_b1gZ-B4NaEdQS2zffdvobW=FUx4ysEgXVAz+=cZ+R3Q@mail.gmail.com>
 <a3ca8c60-dd83-ea7b-c268-0c94e441bb52@virtuozzo.com>
 <alpine.BSF.2.22.395.2004021132270.75834@zero.eik.bme.hu>
 <53df0069-8a7a-9de8-29cb-21362d88bb4e@virtuozzo.com>
 <87pncq0xdt.fsf@dusky.pond.sub.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-195688340-1585841295=:78264"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-195688340-1585841295=:78264
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Apr 2020, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 02.04.2020 12:36, BALATON Zoltan wrote:
>>> On Thu, 2 Apr 2020, Vladimir Sementsov-Ogievskiy wrote:
>>>> 01.04.2020 23:15, Peter Maydell wrote:
>>>>> On Wed, 1 Apr 2020 at 10:03, Markus Armbruster <armbru@redhat.com> =
wrote:
>>>>>>
>>>>>> QEMU's Error was patterned after GLib's GError.=C2=A0 Differences =
include:
>>>>>
>>>>> =C2=A0From my POV the major problem with Error as we have it today
>>>>> is that it makes the simple process of writing code like
>>>>> device realize functions horrifically boilerplate heavy;
>>>>> for instance this is from hw/arm/armsse.c:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_property_se=
t_link(cpuobj, OBJECT(&s->cpu_container[i]),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "memory", &err);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 error_propagate(errp, err);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_property_se=
t_link(cpuobj, OBJECT(s), "idau", &err);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 error_propagate(errp, err);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_property_se=
t_bool(cpuobj, true, "realized", &err);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 error_propagate(errp, err);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>
>>>>> 16 lines of code just to set 2 properties on an object
>>>>> and realize it. It's a lot of boilerplate and as
>>>>> a result we frequently get it wrong or take shortcuts
>>>>> (eg forgetting the error-handling entirely, calling
>>>>> error_propagate just once for a whole sequence of
>>>>> calls, taking the lazy approach and using err_abort
>>>>> or err_fatal when we ought really to be propagating
>>>>> an error, etc). I haven't looked at 'auto propagation'
>>>>> yet, hopefully it will help?
>>>>
>>>> Yes, after it the code above will look like this:
>>>>
>>>> ... some_func(..., errp)
>>>> {
>>>> =C2=A0=C2=A0 ERRP_AUTO_PROPAGATE(); # magic macro at function start,=
 and no "Error *err" definition
>>>>
>>>> ...
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_property_set=
_link(cpuobj, OBJECT(&s->cpu_container[i]),
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "memory", errp);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*errp) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_property_set=
_link(cpuobj, OBJECT(s), "idau", errp);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*errp) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_property_set=
_bool(cpuobj, true, "realized", errp);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*errp) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> ...
>>>> }
>>>>
>>>> - propagation is automatic, errp is used directly and may be safely =
dereferenced.
>>>
>>> Not much better. Could it be something like:
>>
>> Actually, much better, as it solves some real problems around error pr=
opagation.
>
> The auto propagation patches' stated aim is to fix &error_fatal not to
> eat hints, and to provide more useful stack backtraces with
> &error_abort.  The slight shrinking of boilerplate is a welcome bonus.
>
> For a bigger improvement, have the functions return a useful value, as
> discussed elsewhere in this thread.
>
>>>
>>>  =C2=A0=C2=A0=C2=A0 ERRP_RET(object_property_set_link(cpuobj, OBJECT(=
&s->cpu_container[i]),
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "memory", errp));
>>>  =C2=A0=C2=A0=C2=A0 ERRP_RET(object_property_set_link(cpuobj, OBJECT(=
s), "idau", errp));
>>>  =C2=A0=C2=A0=C2=A0 ERRP_RET(object_property_set_bool(cpuobj, true, "=
realized", errp));
>>>
>>
>> and turn all
>>
>> ret =3D func(...);
>> if (ret < 0) {
>>     return ret;
>> }
>>
>> into
>>
>> FAIL_RET(func(...))
>>
>> ?
>>
>> Not a problem to make such macro.. But I think it's a bad idea to turn=
 all the code
>> into sequence of macro invocations. It's hard to debug and follow.
>
> Yes.  Hiding control flow in macros is almost always too much magic.
> There are exceptions, but this doesn't look like one.

I did't like this idea of mine too much either so I agree but I see no=20
other easy way to simplify this. If you propose changing function return=20
values maybe these should return errp instead of passing it as a func=20
parameter? Could that result in simpler code and less macro magic needed?

Regards,
BALATON Zoltan
--3866299591-195688340-1585841295=:78264--

