Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A91F36BC59
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 01:49:48 +0200 (CEST)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbAz4-0006O4-L7
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 19:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbAxj-0005fE-V7
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 19:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbAxc-0004dC-SJ
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 19:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619480895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgmRwqrPUtKQ896zuQi93vZv54yPTw5xyrRXt3xcuCs=;
 b=He8Bxwyj3ibrzG/4crH1cwpy5VKPuEL/BYRkg7mj7eRzShMXxOG6G4fj8WGhcrVAWGynup
 7PJJ5Heqtm6ZC94dgy7Z04AS5ys7hE2r3iV8TtIsW81CXj8F9TQgHPrUXvJ5ri8AqvGobi
 zcAIS9rLL+kIVzbsUBkzHe33MJaKHC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-_FmILl2jN4GfCTig_jFtVg-1; Mon, 26 Apr 2021 19:48:13 -0400
X-MC-Unique: _FmILl2jN4GfCTig_jFtVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BBEF18397A8;
 Mon, 26 Apr 2021 23:48:12 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D1095C234;
 Mon, 26 Apr 2021 23:48:11 +0000 (UTC)
Subject: Re: [PATCH 11/22] qapi/parser: Rework _check_pragma_list_of_str as a
 TypeGuard
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-12-jsnow@redhat.com>
 <871ray7dfd.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <83aa318c-1a54-35a2-2cec-8d4503392c2f@redhat.com>
Date: Mon, 26 Apr 2021 19:48:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <871ray7dfd.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/21 8:32 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> TypeGuards wont exist in Python proper until 3.10. Ah well. We can hack
>> up our own by declaring this function to return the type we claim it
>> checks for and using this to safely downcast object -> List[str].
>>
>> In so doing, I bring this function in-line under _pragma so it can use
>> the 'info' object in its closure. Having done this, _pragma also now
>> no longer needs to take a 'self' parameter, so drop it.
>>
>> Rename it to just _check(), to help us out with the line-length -- and
>> now that it's contained within _pragma, it is contextually easier to see
>> how it's used anyway -- especially with types.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>>
>> ---
>>
>> I left (name, value) as args to avoid creating a fully magic "macro",
>> though, I thought this was too weird:
>>
>>      info.pragma.foobar = _check()
>>
>> and it looked more reasonable as:
>>
>>      info.pragma.foobar = _check(name, value)
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/parser.py | 26 +++++++++++++-------------
>>   1 file changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>> index 16fd36f8391..d02a134aae9 100644
>> --- a/scripts/qapi/parser.py
>> +++ b/scripts/qapi/parser.py
>> @@ -17,6 +17,7 @@
>>   from collections import OrderedDict
>>   import os
>>   import re
>> +from typing import List
>>   
>>   from .common import match_nofail
>>   from .error import QAPISemError, QAPISourceError
>> @@ -151,28 +152,27 @@ def _include(include, info, incl_fname, previously_included):
>>               ) from err
>>   
>>       @staticmethod
>> -    def _check_pragma_list_of_str(name, value, info):
>> -        if (not isinstance(value, list)
>> -                or any([not isinstance(elt, str) for elt in value])):
>> -            raise QAPISemError(
>> -                info,
>> -                "pragma %s must be a list of strings" % name)
>> +    def _pragma(name, value, info):
>> +
>> +        def _check(name, value) -> List[str]:
>> +            if (not isinstance(value, list) or
>> +                    any([not isinstance(elt, str) for elt in value])):
>> +                raise QAPISemError(
>> +                    info,
>> +                    "pragma %s must be a list of strings" % name)
>> +            return value
>>   
>> -    def _pragma(self, name, value, info):
>>           if name == 'doc-required':
>>               if not isinstance(value, bool):
>>                   raise QAPISemError(info,
>>                                      "pragma 'doc-required' must be boolean")
>>               info.pragma.doc_required = value
>>           elif name == 'command-name-exceptions':
>> -            self._check_pragma_list_of_str(name, value, info)
>> -            info.pragma.command_name_exceptions = value
>> +            info.pragma.command_name_exceptions = _check(name, value)
>>           elif name == 'command-returns-exceptions':
>> -            self._check_pragma_list_of_str(name, value, info)
>> -            info.pragma.command_returns_exceptions = value
>> +            info.pragma.command_returns_exceptions = _check(name, value)
>>           elif name == 'member-name-exceptions':
>> -            self._check_pragma_list_of_str(name, value, info)
>> -            info.pragma.member_name_exceptions = value
>> +            info.pragma.member_name_exceptions = _check(name, value)
>>           else:
>>               raise QAPISemError(info, "unknown pragma '%s'" % name)
> 
> While I appreciate the terseness, I'm not sure I like the generic name
> _check() for checking one of two special cases, namely "list of string".
> The other case being "boolean".  We could acquire more cases later.
> 

Yeah, sorry, just trying to make the line fit ...

The important thing is that we need to make sure this routine returns 
some known type. It's just that the block down here has very long lines.

Recommendations?


