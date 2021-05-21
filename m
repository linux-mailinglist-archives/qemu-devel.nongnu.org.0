Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D216938C984
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:50:05 +0200 (CEST)
Received: from localhost ([::1]:36628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6TU-0003P8-Vb
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk6SG-0002TV-No
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk6SE-0008Al-U5
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621608526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0EtWCDiHlfg5D529z/JGEPMspdwZmJ/BwhJIRo71/rs=;
 b=Gs6/vYOf5DnG0pvOqB9EqS7BnSFN480Cw1eUL6r3TJkaBcblD7uhpim3jkMYZi02u3czwB
 0W5iDoRQAQCS3oH4icO7rZ69nhhz5mba6HQ9vPvASxOmVEbx/hyb3C8l4t3QAzRHJiCGBa
 0QQ5ai7qKcLQzYfOkCG1H5y7gf4ZDkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-Me57qwfwPiCOdhqIH0yPeA-1; Fri, 21 May 2021 10:48:44 -0400
X-MC-Unique: Me57qwfwPiCOdhqIH0yPeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92B20107ACF7
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 14:48:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9581B5D6DC;
 Fri, 21 May 2021 14:48:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3124B113865F; Fri, 21 May 2021 16:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 3/9] qapi: start building an 'if' predicate tree
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-4-marcandre.lureau@redhat.com>
 <5d0a776e-e597-6996-c407-cd2d91883eac@redhat.com>
Date: Fri, 21 May 2021 16:48:38 +0200
In-Reply-To: <5d0a776e-e597-6996-c407-cd2d91883eac@redhat.com> (John Snow's
 message of "Wed, 12 May 2021 17:39:16 -0400")
Message-ID: <87eee02ldl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Beware, I'm skimming, not really reviewing.

John Snow <jsnow@redhat.com> writes:

> On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> The following patches are going to express schema 'if' conditions in
>> a
>> target language agnostic way. For that, let's start building a predicate
>> tree of the configuration options.
>> This intermediary steps still uses C-preprocessor expressions as
>> the predicates:
>> "if: [STR, ..]" is translated to a "IfCond -> IfAll ->
>> [IfOption, ..]" tree, which will generate "#if STR && .." C code.
>> Once the boolean operation tree nodes are introduced, the 'if'
>> expressions will be converted to replace the C syntax (no more
>> !defined(), &&, ...) and based only on option identifiers.
>> For now, the condition tree will be less expressive than a full C
>> macro
>> expression as it will only support these operations: 'all', 'any' and
>> 'not', the only ones needed so far.
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>   docs/sphinx/qapidoc.py                 |  6 +--
>>   scripts/qapi/common.py                 | 54 +++++++++++++++++++++++-
>>   scripts/qapi/schema.py                 | 42 ++++++++++++-------
>>   tests/qapi-schema/doc-good.out         | 12 +++---
>>   tests/qapi-schema/qapi-schema-test.out | 58 +++++++++++++-------------
>>   5 files changed, 116 insertions(+), 56 deletions(-)
>> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
>> index b737949007..a93f3f1c4d 100644
>> --- a/docs/sphinx/qapidoc.py
>> +++ b/docs/sphinx/qapidoc.py
>> @@ -112,12 +112,10 @@ def _make_section(self, title):
>>       def _nodes_for_ifcond(self, ifcond, with_if=3DTrue):
>>           """Return list of Text, literal nodes for the ifcond
>>   -        Return a list which gives text like ' (If: cond1, cond2,
>> cond3)', where
>> -        the conditions are in literal-text and the commas are not.
>> +        Return a list which gives text like ' (If: condition)'.
>>           If with_if is False, we don't return the "(If: " and ")".
>>           """
>> -        condlist =3D intersperse([nodes.literal('', c) for c in ifcond.=
ifcond],
>> -                               nodes.Text(', '))
>
> was this the last user of intersperse?
>
> mm, no, there's one more.
>
>> +        condlist =3D [nodes.literal('', ifcond.gen_doc())]
>>           if not with_if:
>>               return condlist
>>   diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
>> index b7f475a160..59a7ee2f32 100644
>> --- a/scripts/qapi/common.py
>> +++ b/scripts/qapi/common.py
>> @@ -11,8 +11,9 @@
>>   # This work is licensed under the terms of the GNU GPL, version 2.
>>   # See the COPYING file in the top-level directory.
>>   +from abc import ABC, abstractmethod
>>   import re
>> -from typing import Optional
>> +from typing import Optional, Sequence
>>    =20
>>   #: Magic string that gets removed along with all space to its right.
>> @@ -192,3 +193,54 @@ def guardend(name: str) -> str:
>>   #endif /* %(name)s */
>>   ''',
>>                    name=3Dc_fname(name).upper())
>> +
>> +
>> +class IfPredicate(ABC):
>> +    @abstractmethod
>> +    def cgen(self) -> str:
>
> Like the review to patch 2, I'm not sure we want to bake cgen stuff
> directly into this class. Are you going to have cgen() and rustgen()=20
> methods all here?
>
>> +        pass
>> +
>
> I think you want raise NotImplementedError to specify a function that
> the inheriting class MUST implement. Otherwise, there's little value
> to allow a child class to call super() on a method that doesn't have a=20
> default implementation.
>
> You *could* drop the (ABC) and the @abstractmethod decorators if you do s=
o.
>
> Matters of taste and style.

We're not coding a library for use by thousands of people.  If we did,
then complicating the code to guard against misuse could be a win.  But
we don't.

schema.py is full of methods that pass.  Maybe some of them need to be
overriden by any conceivable subtype.  Who cares?  The subtypes either
work or they don't.  I prefer

    def frobnicate:
        pass

to

    def frobnicate:
        raise NotImplementedError

One, pass is easier on the eyes.  Two, a subtype's .frobnicate() can
blindly call super().frobnicate().

I don't see a need to fuzz around with module abc, either.  Let's stick
to the stupidest solution that could possibly work.

[...]


