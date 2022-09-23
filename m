Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8B35E737B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 07:37:03 +0200 (CEST)
Received: from localhost ([::1]:47208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obbMz-00026y-P1
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 01:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obbIA-0007Ef-V5
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 01:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obbI5-0000q2-VY
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 01:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663911116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05B0vf8S7g/GCrIavu3Wxkzi7XBjV7EnNTqm+nVedeM=;
 b=Um8J3X/uHnJ8uBtiMFEe7GS3wF1+pbfOg4Wz6KaR6QklIpWJ1sTZtwpYD0EJbdqYfh/0eh
 2ihabDf9VKkuc0UGY3VNQ8X9kuzdW1yRgG3sHIXpsIevUFk1LQLSzQYUMfbyal5tpO+j3r
 2zsr/tVOhmc7rl+H97nnSyVqM/M2U14=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-KPVByw3_NBmX7z5d3hvEmQ-1; Fri, 23 Sep 2022 01:31:53 -0400
X-MC-Unique: KPVByw3_NBmX7z5d3hvEmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37268185A79C;
 Fri, 23 Sep 2022 05:31:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF1512166B29;
 Fri, 23 Sep 2022 05:31:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8C49D21E6900; Fri, 23 Sep 2022 07:31:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org>
 <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org>
 <4a656f0f-1497-5569-e562-f537b115daf3@suse.de>
 <87r103lf4y.fsf@pond.sub.org>
 <f7650e0c-1e18-31ac-4ed5-49777a69ba64@suse.de>
 <87leqbjx28.fsf@pond.sub.org>
 <a30470e4-a861-c88e-e1ef-dfeae3352ad6@suse.de>
Date: Fri, 23 Sep 2022 07:31:50 +0200
In-Reply-To: <a30470e4-a861-c88e-e1ef-dfeae3352ad6@suse.de> (Claudio Fontana's
 message of "Thu, 22 Sep 2022 17:22:11 +0200")
Message-ID: <87edw2hd15.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Claudio Fontana <cfontana@suse.de> writes:

> On 9/22/22 16:36, Markus Armbruster wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> On 9/22/22 15:20, Markus Armbruster wrote:
>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>
>>>> [...]
>>>>
>>>>> I think it would be better to completely make the return value separa=
te from the Error,
>>>>> and really treat Error as an exception and not mix it up with the reg=
ular execution,
>>>>>
>>>>> but if it is the general consensus that I am the only one seeing this=
 conflation problem we can model it this way too.
>>>>
>>>> It's a matter of language pragmatics.  In Java, you throw an exception
>>>> on error.  In C, you return an error value.
>>>>
>>>> Trying to emulate exceptions in C might be even more unadvisable than
>>>> trying to avoid them in Java.  Best to work with the language, not
>>>> against it.
>>>>
>>>> Trouble is the error values we can conveniently return in C can't conv=
ey
>>>> enough information.  So we use Error for that.  Just like GLib uses
>>>
>>> Right, we use Error for that and that's fine, but we should use it _onl=
y Error_ for that.
>>>
>>> Ie map the Exceptions directly to Error.
>>>
>>> So:
>>>
>>> try {
>>>
>>>   rv =3D function_call(...);
>>>
>>>   use_return_value(rv);
>>>
>>> } catch (Exception e) {
>>>
>>>   /* handle exceptional case */
>>>
>>> }
>>>
>>> becomes
>>>
>>> rv =3D function_call(..., Error **errp);
>>>
>>> if (errp) {
>>>   /* handle exceptional case */
>>> }
>>>
>>> use_return_value(rv);
>>=20
>> This is simply not the intended use of Error.
>>=20
>> Also, "trying to emulate exceptions in C might be even more unadvisable
>> than trying to avoid them in Java."
>>=20
>>> Instead we mix up the Exception code path and the regular code path, by=
 having rv carry a mix of the Exception and regular return value,
>>> and this creates problems and confusion.
>>=20
>> "In C, you return an error value."
>>=20
>>> If we put a hard line between the two, I think more clarity emerges.
>>=20
>> Maybe, but consistency matters.  Clarity doesn't emerge in isolation.=20=
=20
>> Deviating from prevailing usage tends to confuse.
>>=20
>>>> GError.
>>>>
>>>> More modern languages do "return error value" much better than C can. =
 C
>>>> is what it is.
>>>>
>>>> We could certainly argue how to do better than we do now in QEMU's C
>>>> code.  However, the Error API is used all over the place, which makes
>>>> changing it expensive.  "Rethinking the whole Error API" (your words)
>>>> would have to generate benefits worth this expense.  Which seems
>>>> unlikely.
>>>>
>>>> [...]
>>>>
>>>
>>> This is all fine, the problem is how we remodel this in C.
>>>
>>> This is how I see the next steps to clarify my position:
>>>
>>> short term:
>>>
>>> - keep the existing API with the existing assumptions, use a separate a=
rgument to carry the pointer to the actual return value (where the function=
 return value as provided by the language is used to return if an exception=
 was generated or not, as we assume today).
>>=20
>> We don't actually need separate values for "actual return value" and
>> "success vs. failure" here.  We can easily encode them in a single
>
> Yes, we do, it would avoid the confusion that we see as soon as people lo=
ok at the module_load_one code the first time.
>
>> return value.  This is *common* in C, for better or worse.
>
> We make our own life difficult, by wasting the very precious space of the=
 return value that should be used to provide the meaning of the function,
>
> and using it to provide a completely useless and redundant bool return va=
lue, that by your own definition,
> is just "errp !=3D NULL".

*errp !=3D NULL, except that doesn't work when the caller NULL to errp.

> The very precious and scarce return value of the C function is completely=
 wasted.

I think you're tilting at windmills :)

error.h again:

 * - Whenever practical, also return a value that indicates success /
 *   failure.  This can make the error checking more concise, and can
 *   avoid useless error object creation and destruction.  Note that
 *   we still have many functions returning void.  We recommend
 *   =E2=80=A2 bool-valued functions return true on success / false on fail=
ure,
 *   =E2=80=A2 pointer-valued functions return non-null / null pointer, and
 *   =E2=80=A2 integer-valued functions return non-negative / negative.

This does *not* ask you to waste the return value on a bool indicating
success.  It asks you to use error values whenever practical, and
recommends common ones, namely:

     =E2=80=A2 When a function returns a non-negative integer on success, u=
se
       negative integers to signify failure.

     =E2=80=A2 When a function returns a non-null pointer on success, use a=
 null
       pointer to signify failure.

     =E2=80=A2 When a function has nothing to return, make it return true on
       success, and false on failure.

Such use of return values is idiomatic C.

When a function can return any value of its return type on success,
there are no error values left.  Unless we can tweak the return type to
accomodate error values, say widen it from unsigned char to int, we're
outside "when practical" territory.

[...]


