Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685842DCCF0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 08:27:18 +0100 (CET)
Received: from localhost ([::1]:32870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpngy-0005st-Kh
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 02:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpneC-0005Mh-63
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:24:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpne9-0002LY-By
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608189859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2b/GF7vMaHEWOjCvTEfhBaakMZZs/XYaZ1XrKlJ6Hd8=;
 b=AV6DAF9TKbM2b8N6RAe0uQETxN+1TCh9GCw7zlZekhYeZbr/vwd4LXqPkq/vUQSVK6yeky
 rphYjKwH7P89LEs+8o5wIdogCIRny74R/TWApbkHMk3nw/4zLLctmeS6wsJlC9ok1Fwvjn
 GICGlga7mlRGEMCZ0P0Uc4f8FkMunpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-sWzPTciyMTCD6XWlIeLsCg-1; Thu, 17 Dec 2020 02:24:17 -0500
X-MC-Unique: sWzPTciyMTCD6XWlIeLsCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1C0E1842140
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 07:24:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C1C9704DA;
 Thu, 17 Dec 2020 07:24:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D731411329A5; Thu, 17 Dec 2020 08:24:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 04/12] qapi/gen: assert that _start_if is not None in
 _wrap_ifcond
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-5-jsnow@redhat.com>
 <87a6uetavs.fsf@dusky.pond.sub.org>
 <e5b561c5-8360-a54b-6720-c2822289d6b9@redhat.com>
Date: Thu, 17 Dec 2020 08:24:05 +0100
In-Reply-To: <e5b561c5-8360-a54b-6720-c2822289d6b9@redhat.com> (John Snow's
 message of "Wed, 16 Dec 2020 12:13:38 -0500")
Message-ID: <87y2hwlwtm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 12/16/20 3:26 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> We already assert this in end_if, but that's opaque to mypy. Do it in
>>> _wrap_ifcond instead. Same effect at runtime, but mypy can now infer
>>> the type in _wrap_ifcond's body.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/gen.py | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>>> index b40f18eee3cd..a6dc991b1d03 100644
>>> --- a/scripts/qapi/gen.py
>>> +++ b/scripts/qapi/gen.py
>>> @@ -130,11 +130,11 @@ def start_if(self, ifcond: List[str]) -> None:
>>>           self._start_if = (ifcond, self._body, self._preamble)
>>>   
>>>       def end_if(self) -> None:
>>> -        assert self._start_if
>>>           self._wrap_ifcond()
>>>           self._start_if = None
>>>   
>>>       def _wrap_ifcond(self) -> None:
>>> +        assert self._start_if
>>>           self._body = _wrap_ifcond(self._start_if[0],
>>>                                     self._start_if[1], self._body)
>>>           self._preamble = _wrap_ifcond(self._start_if[0],
>> 
>> Drawback: the public method's precondition is now more opaque.  Do we
>> care?
>> 
>
> Ish. If you call end_if before start_if, what did you want to have happen?

Point.

> Or more to the point: do you want the assertion in both places?

What about inlining QAPIGenCCode._wrap_ifcond() into .end_if()?


