Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292C349AA2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:45:13 +0100 (CET)
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPVuq-0000vG-7O
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPVsN-0008PG-SE
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:42:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPVsL-0000l2-Vs
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616701357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMRpBGluM6btThMRDpPuLLWyLjMsAcDaUSUXC4TH7Os=;
 b=X6WuwRiRlf+pFjg8s7hDm+ksfRaTrtxxXud0qdhvL8rss0ikPhHeapa4dcByWe749uuY5v
 jq0lXrHHFHhu2e4o5sICPys2wq0o5NCRZrteYDzh0Ri7rguKUDMYHqqqCcQDvUdoSUzY8T
 K9xyJk/bod9SM9R/8lSY/ibJ8BMbTlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-6t1Y4fQ-MuO7h3R49B8YnA-1; Thu, 25 Mar 2021 15:42:33 -0400
X-MC-Unique: 6t1Y4fQ-MuO7h3R49B8YnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18D2B9393D;
 Thu, 25 Mar 2021 19:42:32 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C33719C59;
 Thu, 25 Mar 2021 19:42:31 +0000 (UTC)
Subject: Re: [PATCH v3 04/16] qapi/expr.py: Add assertion for union type
 'check_dict'
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-5-jsnow@redhat.com>
 <874ki169dg.fsf@dusky.pond.sub.org>
 <f68e0391-a60d-0294-44b2-50c85e92d740@redhat.com>
 <87wntvaips.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <dbae4ad0-1d29-a635-8142-84bd104f8907@redhat.com>
Date: Thu, 25 Mar 2021 15:42:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87wntvaips.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 1:46 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 2/24/21 5:35 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> mypy isn't fond of allowing you to check for bool membership in a
>>>> collection of str elements. Guard this lookup for precisely when we were
>>>> given a name.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>>>> ---
>>>>    scripts/qapi/expr.py | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>>> index 783282b53ce..138fab0711f 100644
>>>> --- a/scripts/qapi/expr.py
>>>> +++ b/scripts/qapi/expr.py
>>>> @@ -173,7 +173,9 @@ def check_type(value, info, source,
>>>>            raise QAPISemError(info,
>>>>                               "%s should be an object or type name" % source)
>>>>    -    permit_upper = allow_dict in info.pragma.name_case_whitelist
>>>> +    permit_upper = False
>>>> +    if isinstance(allow_dict, str):
>>>> +        permit_upper = allow_dict in info.pragma.name_case_whitelist
>>>>          # value is a dictionary, check that each member is okay
>>>>        for (key, arg) in value.items():
>>>
>>> Busy-work like this can make me doubt typing is worth the notational
>>> overhead.
>>> There must a less awkward way to plumb "upper case okay" through
>>> check_type() to check_name_is_str().  But we're typing what we have.
>>
>> Leaving this as-is for now. There's something I'd like to do about it,
>> but it has to happen later.
>>
>> (I think all the pragma checks should happen in schema.py, and not in
>> expr.py. They are by their essence not context-free, since they depend
>> on the context of the pragma.)
> 
> True.
> 
> Pragmas other than doc-required are an ugly consequence of us having
> made a a bit of a mess in the schema.  The oldest parts of the schema
> were set in stone before we decided on certain rules, and then we kept
> failing at manually enforcing these rules.  To get automatic
> enforcement, we needed a way to give a pass to existing rule breakers.
> Preferably without rearchitecting the frontend.  Pragmas solve that
> problem.  The solution is as ugly as the problem.
> 
> Without pragmas, the name checks are context-free.  That's why they are
> where they are.
> 

It's not a judgment in the sense that I am disappointed it isn't already 
like that, but I am giving you the opportunity to explicitly reject my 
proposal of how I'd like to eventually fix it.

I want to decouple it from QAPISourceInfo and do the checks in schema.py 
instead. This may mean less restrictive checks in expr.py as an 
acknowledgment of what the "actual" grammar is.

In exchange, schema.py has to apply some of these checks itself, but it 
now has the semantic context of the Pragma and the benefit of a fully 
normalized structure to work against.

Over time, semantic restrictions that have exceptions that we remove can 
be transported back to the grammatical validation layer.

--js


