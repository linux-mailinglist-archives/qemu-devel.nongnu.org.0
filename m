Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3239F845
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:59:56 +0200 (CEST)
Received: from localhost ([::1]:41680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcGp-0000mX-Dm
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqcF9-0006po-Jw
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:58:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqcF7-00030a-R2
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623160689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nF7BbbMTeb5Hv0gLSwq/6DTZ2e57AiBEzIs/3sjKQLE=;
 b=X9u1H7cdhKOZyu1SXHV0NB/LypQtsS7cZsAeC7WoZvSGtg02jAG7HzxINqIQYozQFxCYdP
 lEfzUzlHwjgjkioEjtP7eQiPUtDc6TpyokpP0Ef04V4qdlX4WqbXLbfnIbSfQxelAzK6LM
 AR4bLj7ZSLeGhdS8LN4DYhT7sFdweKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-ZX1KM5Z6Nxu4OwMQQd0Egw-1; Tue, 08 Jun 2021 09:58:05 -0400
X-MC-Unique: ZX1KM5Z6Nxu4OwMQQd0Egw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2473B107ACE6
 for <qemu-devel@nongnu.org>; Tue,  8 Jun 2021 13:58:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7CA55C1D1;
 Tue,  8 Jun 2021 13:58:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E76A113865F; Tue,  8 Jun 2021 15:57:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 3/9] qapi: start building an 'if' predicate tree
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-4-marcandre.lureau@redhat.com>
 <5d0a776e-e597-6996-c407-cd2d91883eac@redhat.com>
 <87eee02ldl.fsf@dusky.pond.sub.org>
 <12434341-9054-8c35-e8a4-59087548b59e@redhat.com>
Date: Tue, 08 Jun 2021 15:57:59 +0200
In-Reply-To: <12434341-9054-8c35-e8a4-59087548b59e@redhat.com> (John Snow's
 message of "Fri, 21 May 2021 12:18:03 -0400")
Message-ID: <87v96oxxug.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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

John Snow <jsnow@redhat.com> writes:

> On 5/21/21 10:48 AM, Markus Armbruster wrote:
>> Beware, I'm skimming, not really reviewing.
>>=20
>> John Snow <jsnow@redhat.com> writes:
>>=20
>>> On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:

[...]

>>>> index b7f475a160..59a7ee2f32 100644
>>>> --- a/scripts/qapi/common.py
>>>> +++ b/scripts/qapi/common.py
>>>> @@ -11,8 +11,9 @@
>>>>    # This work is licensed under the terms of the GNU GPL, version 2.
>>>>    # See the COPYING file in the top-level directory.
>>>>    +from abc import ABC, abstractmethod
>>>>    import re
>>>> -from typing import Optional
>>>> +from typing import Optional, Sequence
>>>>     =20
>>>>    #: Magic string that gets removed along with all space to its right=
.
>>>> @@ -192,3 +193,54 @@ def guardend(name: str) -> str:
>>>>    #endif /* %(name)s */
>>>>    ''',
>>>>                     name=3Dc_fname(name).upper())
>>>> +
>>>> +
>>>> +class IfPredicate(ABC):
>>>> +    @abstractmethod
>>>> +    def cgen(self) -> str:
>>>
>>> Like the review to patch 2, I'm not sure we want to bake cgen stuff
>>> directly into this class. Are you going to have cgen() and rustgen()
>>> methods all here?
>>>
>>>> +        pass
>>>> +
>>>
>>> I think you want raise NotImplementedError to specify a function that
>>> the inheriting class MUST implement. Otherwise, there's little value
>>> to allow a child class to call super() on a method that doesn't have a
>>> default implementation.
>>>
>>> You *could* drop the (ABC) and the @abstractmethod decorators if you do=
 so.
>>>
>>> Matters of taste and style.
>>=20
>> We're not coding a library for use by thousands of people.  If we did,
>> then complicating the code to guard against misuse could be a win.  But
>> we don't.
>>=20
>> schema.py is full of methods that pass.  Maybe some of them need to be
>> overriden by any conceivable subtype.  Who cares?  The subtypes either
>> work or they don't.  I prefer
>>=20
>>      def frobnicate:
>>          pass
>>=20
>> to
>>=20
>>      def frobnicate:
>>          raise NotImplementedError
>>=20
>> One, pass is easier on the eyes.  Two, a subtype's .frobnicate() can
>> blindly call super().frobnicate().
>>=20
>
> "pass" here operates as a syntactic sugar for "return None" which has=20
> implications on the return type. It's short, but wrong.

Nitpicking...

pass is not specified as syntactic sugar:

    7.4. The pass statement

    pass_stmt ::=3D  "pass"

    pass is a null operation =E2=80=94 when it is executed, nothing happens=
. It is useful as a placeholder when a statement is required syntactically,=
 but no code needs to be executed, for example:

    def f(arg): pass    # a function that does nothing (yet)

    class C: pass       # a class with no methods (yet)

What really happens in

    def foo(): pass

is what *always* happens when control reaches the end of the function
body: the function returns None.

Further evidence:

    >>> def baz():
    ...     pass
    ...     return 42
    ...=20
    >>> baz()
    42

> raise NotImplementedError means something different semantically.
>
> To me, pass is *NOT* easier on the eyes, it is misleading. It is=20
> idiomatic to use NotImplementedError if it is not acceptable for a=20
> default implementation to return None.
>
> I understand perfectly well the desire to keep things simple, but what=20
> is actually "simple" depends on the expectations of the programmer. I=20
> err towards idiomatic Python.

What's your take on "Two, a subtype's .frobnicate() can blindly call
super().frobnicate()"?

[...]


