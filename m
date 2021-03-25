Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22C13488A8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 06:48:29 +0100 (CET)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPIr6-0007AL-Tg
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 01:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPIpU-0006bH-9y
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 01:46:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPIpS-0006c5-DB
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 01:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616651204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qkTTkbmEHDl7sA0q2fOizVXtrifvUuD5V30OlBWoT7Y=;
 b=DrCpvmbxQqSM1yrzrYFza/HgVM1NCCePZftsyIMMZm7bJ01tWVgKthbzc1qiUUU3GoOTNx
 8eyHf2W0RIpB/z/+mw9OT0cjH2td/XGg7rtNf0P+MCi0akCCWKGPGDqYgS1z7rVtfLlO2F
 PP0DHl1P2zLTXig3xlmLdPCgmAfc4Do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-JqOIPwXGPGWX_ZURbjatzQ-1; Thu, 25 Mar 2021 01:46:41 -0400
X-MC-Unique: JqOIPwXGPGWX_ZURbjatzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 298FD18C89D9;
 Thu, 25 Mar 2021 05:46:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D143D9CA0;
 Thu, 25 Mar 2021 05:46:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 66E2111327E1; Thu, 25 Mar 2021 06:46:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 04/16] qapi/expr.py: Add assertion for union type
 'check_dict'
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-5-jsnow@redhat.com>
 <874ki169dg.fsf@dusky.pond.sub.org>
 <f68e0391-a60d-0294-44b2-50c85e92d740@redhat.com>
Date: Thu, 25 Mar 2021 06:46:39 +0100
In-Reply-To: <f68e0391-a60d-0294-44b2-50c85e92d740@redhat.com> (John Snow's
 message of "Wed, 24 Mar 2021 17:09:13 -0400")
Message-ID: <87wntvaips.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> On 2/24/21 5:35 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> mypy isn't fond of allowing you to check for bool membership in a
>>> collection of str elements. Guard this lookup for precisely when we were
>>> given a name.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>   scripts/qapi/expr.py | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>> index 783282b53ce..138fab0711f 100644
>>> --- a/scripts/qapi/expr.py
>>> +++ b/scripts/qapi/expr.py
>>> @@ -173,7 +173,9 @@ def check_type(value, info, source,
>>>           raise QAPISemError(info,
>>>                              "%s should be an object or type name" % source)
>>>   -    permit_upper = allow_dict in info.pragma.name_case_whitelist
>>> +    permit_upper = False
>>> +    if isinstance(allow_dict, str):
>>> +        permit_upper = allow_dict in info.pragma.name_case_whitelist
>>>         # value is a dictionary, check that each member is okay
>>>       for (key, arg) in value.items():
>> 
>> Busy-work like this can make me doubt typing is worth the notational
>> overhead.
>> There must a less awkward way to plumb "upper case okay" through
>> check_type() to check_name_is_str().  But we're typing what we have.
>
> Leaving this as-is for now. There's something I'd like to do about it,
> but it has to happen later.
>
> (I think all the pragma checks should happen in schema.py, and not in
> expr.py. They are by their essence not context-free, since they depend 
> on the context of the pragma.)

True.

Pragmas other than doc-required are an ugly consequence of us having
made a a bit of a mess in the schema.  The oldest parts of the schema
were set in stone before we decided on certain rules, and then we kept
failing at manually enforcing these rules.  To get automatic
enforcement, we needed a way to give a pass to existing rule breakers.
Preferably without rearchitecting the frontend.  Pragmas solve that
problem.  The solution is as ugly as the problem.

Without pragmas, the name checks are context-free.  That's why they are
where they are.


