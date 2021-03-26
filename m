Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068B334A119
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 06:42:04 +0100 (CET)
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfEQ-0002Ue-Rd
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 01:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPfCo-0001vI-Lu
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 01:40:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPfCm-0000xV-NF
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 01:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616737218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TCuVboz/IHQVJ03ut9iGSYEEt9cmKee0CLbwydKgKek=;
 b=diMUU0Smtto6WM6NsLTEOPEudhX2NTQl5CzlVJXpzU8darkkViNFLcgAx/O1YrMl8nKNQP
 FfNMwLwI39Rfbf7ZdWX9g1NbMNzApopgAIUyOpta/EgcBs3EovjFaxsui7NskDKLVZVyAF
 VwTU9kDEW/SuG1jTkE3Hzbi06dxCE+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-_D2iAXOtOJ2Wdepy9D-Rsg-1; Fri, 26 Mar 2021 01:40:15 -0400
X-MC-Unique: _D2iAXOtOJ2Wdepy9D-Rsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05760180FCA5;
 Fri, 26 Mar 2021 05:40:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A760261F49;
 Fri, 26 Mar 2021 05:40:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3BD7811327E1; Fri, 26 Mar 2021 06:40:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 05/19] qapi/expr.py: constrain incoming expression types
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-6-jsnow@redhat.com>
 <871rc3tjlt.fsf@dusky.pond.sub.org>
 <a2e23408-1885-3ce1-8328-47f5d837971c@redhat.com>
Date: Fri, 26 Mar 2021 06:40:12 +0100
In-Reply-To: <a2e23408-1885-3ce1-8328-47f5d837971c@redhat.com> (John Snow's
 message of "Thu, 25 Mar 2021 16:48:57 -0400")
Message-ID: <87sg4ia2wz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 3/25/21 10:04 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> mypy does not know the types of values stored in Dicts that masquerade
>>> as objects. Help the type checker out by constraining the type.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/expr.py | 26 +++++++++++++++++++++++---
>>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>> index b4bbcd54c0..b75c85c160 100644
>>> --- a/scripts/qapi/expr.py
>>> +++ b/scripts/qapi/expr.py
>>> @@ -15,9 +15,18 @@
>>>   # See the COPYING file in the top-level directory.
>>>   
>>>   import re
>>> +from typing import Dict, Optional
>>>   
>>>   from .common import c_name
>>>   from .error import QAPISemError
>>> +from .parser import QAPIDoc
>>> +from .source import QAPISourceInfo
>>> +
>>> +
>>> +# Deserialized JSON objects as returned by the parser;
>>> +# The values of this mapping are not necessary to exhaustively type
>> 
>> Not necessary and also not practical with current mypy.  Correct?
>
> Neither necessary nor practical. Typing as 'object' guarantees that 
> these values will never be used in a manner not supported by all python 
> objects. Mypy does not complain, so we know that we don't misuse the type.
>
> This is helpful for proving the validity of the expr.py validator 
> itself: we know that we are not forgetting to perform type narrowing and 
> using the value contained therein inappropriately.
>
> Adding a more exhaustive typing here is impractical (for reasons we 
> learned during introspect.py), but also provides no benefit to the 
> static analysis here anyway.
>
> (None of the functions written here *assume* the shape of the structure, 
> so there are no functions that benefit from having a more laboriously 
> specified type.)
>
> If the comment needs more work, suggest away -- I tried to follow our 
> last discussion here as best as I was able.

"Needs more work" sounds like "inadequate", which isn't the case.

The comment focuses on what we need from mypy here.  We may or may not
want to hint at the other aspect: what mypy can provide.

>>> +# here, because the purpose of this module is to interrogate that type.
>>> +_JSONObject = Dict[str, object]
[...]

If we want to, maybe:

     # Deserialized JSON objects as returned by the parser.
     # The values of this mapping are not necessary to exhaustively type
     # here (and also not practical as long as mypy lacks recursive
     # types), because the purpose of this module is to interrogate that
     # type.

Thoughts?


