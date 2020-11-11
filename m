Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84A2AEE2D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:55:03 +0100 (CET)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmqE-0006Nu-D5
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcmp5-0005pi-3L
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcmp2-0000rY-Fn
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605088426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CdGTJLdGqphjwPtbNOKMMo6blOW78QJL+V8LxLcGje8=;
 b=Ui5zK7Zkssl+gZVbZDdfr6XBfiKQv8j0Vl5CoHzli9zPhUub5xWR+bapN11lFSPws+ZSkT
 48ve7kuUAHH+vY8GVBZEXYgMIw0yk4XjMQOM/WvpM6mQyqMGiHNMN37IZcQbKcgwHVFDG6
 SdY2AQdcYKNRaJ3Z8ODLGl+b0qM8k8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-m0EjaTOnMGasyn7TwF7gEA-1; Wed, 11 Nov 2020 04:53:44 -0500
X-MC-Unique: m0EjaTOnMGasyn7TwF7gEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B4AC1084D61;
 Wed, 11 Nov 2020 09:53:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E348D6EF5B;
 Wed, 11 Nov 2020 09:53:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6334011386A0; Wed, 11 Nov 2020 10:53:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qtest: Fix bad printf format specifiers
References: <5FA28117.3020802@huawei.com>
 <67eca43e-99ea-f2ce-5d9e-a9cb5c7a3a83@redhat.com>
 <5FA38A32.2020008@huawei.com>
 <18690aa2-3de9-70ad-477f-934724b284a0@redhat.com>
 <87wnyzouy4.fsf@dusky.pond.sub.org>
 <1fd5965d-cf5e-b41b-2029-bd3e52c3e498@redhat.com>
 <8f5ef0b8-4c43-034f-f609-e7e5ca013970@redhat.com>
 <87d00narns.fsf@dusky.pond.sub.org> <5FA91234.1010708@huawei.com>
 <877dqupudg.fsf@dusky.pond.sub.org>
 <91546693-57fa-94f5-f42f-2c24eb994c33@redhat.com>
Date: Wed, 11 Nov 2020 10:53:41 +0100
In-Reply-To: <91546693-57fa-94f5-f42f-2c24eb994c33@redhat.com> (Thomas Huth's
 message of "Tue, 10 Nov 2020 09:09:03 +0100")
Message-ID: <87imacp6ca.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: lvivier@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>, Alex Chen <alex.chen@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 09/11/2020 13.50, Markus Armbruster wrote:
>> Alex Chen <alex.chen@huawei.com> writes:
>>=20
>>> On 2020/11/9 15:57, Markus Armbruster wrote:
>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>
>>>>> On 06/11/2020 15.18, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>> On 11/6/20 7:33 AM, Markus Armbruster wrote:
>>>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>>>
>>>>>>>> On 05/11/2020 06.14, AlexChen wrote:
>>>>>>>>> On 2020/11/4 18:44, Thomas Huth wrote:
>>>>>>>>>> On 04/11/2020 11.23, AlexChen wrote:
>>>>>>>>>>> We should use printf format specifier "%u" instead of "%d" for
>>>>>>>>>>> argument of type "unsigned int".
>>>>>>>>>>>
>>>>>>>>>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>>>>>>>>>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>>>>>>>>>>> ---
>>>>>>>>>>>  tests/qtest/arm-cpu-features.c | 8 ++++----
>>>>>>>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>>>>>>>
>>> [...]
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> max_vq and vq are both "uint32_t" and not "unsigned int" ... so =
if you want
>>>>>>>>>> to fix this really really correctly, please use PRIu32 from intt=
ypes.h instead.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Hi Thomas,
>>>>>>>>> Thanks for your review.
>>>>>>>>> According to the definition of the macro PRIu32(# define PRIu32  =
       "u"),
>>>>>>>>> using PRIu32 works the same as using %u to print, and using PRIu3=
2 to print
>>>>>>>>> is relatively rare in QEMU(%u 720, PRIu32 only 120). Can we conti=
nue to use %u to
>>>>>>>>> print max_vq and vq in this patch.
>>>>>>>>> Of course, this is just my small small suggestion. If you think i=
t is better to use
>>>>>>>>> PRIu32 for printing, I will send patch V2.
>>>>>>>>
>>>>>>>> Well, %u happens to work since "int" is 32-bit with all current co=
mpilers
>>>>>>>> that we support.
>>>>>>>
>>>>>>> Yes, it works.
>>>>>>>
>>>>>>>>                  But if there is ever a compiler where the size of=
 int is
>>>>>>>> different, you'll get a compiler warning here again.
>>>>>>>
>>>>>>> No, we won't.
>>>>>>>
>>>>>>> If we ever use a compiler where int is narrower than 32 bits, then =
the
>>>>>>> type of the argument is actually uint32_t[1].  We can forget about =
this
>>>>>>> case, because "int narrower than 32 bits" is not going to fly with =
our
>>>>>>> code base.
>>>>>
>>>>> Agreed.
>>>>>
>>>>>>> If we ever use a compiler where int is wider than 32 bits, then the=
 type
>>>>>>> of the argument is *not* uint32_t[2].  PRIu32 will work anyway, bec=
ause
>>>>>>> it will actually retrieve an unsigned int argument, *not* an uint32=
_t
>>>>>>> argument[3].
>>>>>
>>>>> I can hardly believe that this can be true. Sure, it's true for such =
cases
>>>>> like this one here, where you multiply with an "int". But if you just=
 try to
>>>>> print a plain uint32_t variable?
>>>>
>>>> Default argument promotions (=C2=A76.5.2.2 Function calls) still apply=
: "the
>>>> integer promotions are performed on each argument, and arguments that
>>>> have type float are promoted to double."
>>>>
>>>>> I've seen compiler warning in cases one tries to print a 16-bit (i.e.=
 short)
>>>>> variable in the past if you use %d instead of the proper PRId16 (or %=
hd)
>>>>> format specifier - maybe not on x86, but certainly on other architect=
ures.
>>>>> If you're statement was right, that should not have happened, should =
it?
>>>>
>>>> =C2=A77.19.6.1 "The fprintf function" on length modifier 'h':
>>>>
>>>>     Specifies that a following d, i, o, u, x, or X conversion specifie=
r
>>>>     applies to a short int or unsigned short int argument (the argumen=
t
>>>>     will have been promoted according to the integer promotions, but i=
ts
>>>>     value shall be converted to short int or unsigned short int before
>>>>     printing)
>>>>
>>>> Integer promotions preserve value including sign.  So, printing a shor=
t
>>>> value with %hd first promotes it to int, then converts it back to shor=
t.
>>>> Neither conversion has an effect.
>>>>
>>>> However, printing an int with %hd has: it converts int to short.
>>>> Implementation-defined behavior when the value doesn't fit.
>>>>
>>>> Length modifier 'h' is pretty pointless with printf().  So would be a
>>>> warning to nudge people towards its use.
>>>>
>>>> In fact, GNU libc's PRIu32 does not use it.  inttypes.h:
>>>>
>>>>     /* Unsigned integers.  */
>>>>     # define PRIu8=09=09"u"
>>>>     # define PRIu16=09=09"u"
>>>>     # define PRIu32=09=09"u"
>>>>     # define PRIu64=09=09__PRI64_PREFIX "u"
>>>>
>>>> where __PRI64_PREFIX is "l" or "ll" depending on system-dependent
>>>> __WORDSIZE.
>>>>
>>>> In short:
>>>>
>>>>>>> In other words "%" PRIu32 is just a less legible alias for "%u" in =
all
>>>>>>> cases that matter.
>>>>
>>>
>>> Hi Markus,
>>>
>>> Thanks for your reply, I have learned a lot.
>>> May I understand it as follows:
>>> %u is used when there are parameters obtained by arithmetic operation;
>>> otherwise, PRIu32 is used to print uint32_t type parameters?
>>=20
>> No.  Use "%u" unless you need portability to machines where unsigned is
>> narrower than 32 bits (we don't).
>>=20
>> On machines where unsigned int is at least 32 bit wide, "%" PRIu32
>> is the same as "%u".  It's not wrong, just illegible.
>
> Just FYI, there are also apparently toolchains where uint32_t is defined =
as
> unsigned long:
>
> https://patchwork.kernel.org/project/kvm/patch/20201105135936.55088-1-ale=
xandru.elisei@arm.com/

Awesome :)

If the system typedefs uint32_t to unsigned long, the integer promotions
do not apply, even when unsigned long is just as wide as unsigned int.
My take on that is "isn't there enough suffering in the world?"

Since I don't have such a toolchain handy, I faked it (see appended
patch).  The fakery is not expected compile (it triggers compile-time
assertions like the ones in cpu.h, for instance).  It *is* expected to
ferret out use of %u with uint32_t and similar.  And it does: I get

    format =E2=80=98%x=E2=80=99 expects argument of type =E2=80=98unsigned =
int=E2=80=99, but argument 6 has type =E2=80=98uint32_t=E2=80=99 {aka =E2=
=80=98const long unsigned int=E2=80=99} [-Wformat=3D]

and the like almost 15,000 times.  And that's with
--target-list=3Dx86_64-softmmu.  A full compile can only have more.

I think we have better things to do than "fixing" these.




diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f9ec8c84e9..70123f70c1 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -50,6 +50,37 @@
 #define __STDC_FORMAT_MACROS
 #endif
=20
+#define int32_t xxxint32_t
+#define uint32_t xxxuint32_t
+#include <stdint.h>
+#undef int32_t
+#undef uint32_t
+typedef long int32_t;
+typedef unsigned long uint32_t;
+#include <inttypes.h>
+#undef PRId32
+#undef PRIi32
+#undef PRIo32
+#undef PRIu32
+#undef PRIx32
+#undef PRIX32
+#undef SCNd32
+#undef SCNi32
+#undef SCNo32
+#undef SCNu32
+#undef SCNx32
+#define PRId32 "ld"
+#define PRIi32 "li"
+#define PRIo32 "lo"
+#define PRIu32 "lu"
+#define PRIx32 "lx"
+#define PRIX32 "lX"
+#define SCNd32 "ld"
+#define SCNi32 "li"
+#define SCNo32 "lo"
+#define SCNu32 "lu"
+#define SCNx32 "lx"
+
 /* The following block of code temporarily renames the daemon() function s=
o the
  * compiler does not see the warning associated with it in stdlib.h on OSX
  */


