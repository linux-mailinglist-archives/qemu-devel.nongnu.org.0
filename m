Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB73245BA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 22:25:20 +0100 (CET)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF1ep-0008Qk-1r
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 16:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF1dP-0007vC-8q
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:23:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF1dN-0001b6-C9
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614201828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iSevqa82q3Z1iSYZwZAdkaTuhtaymTXD4bDeL+6eJe4=;
 b=JHzVGNqmWxLZvxhy7NF1SFS+j0skTDEMjqfYGAMXKQ4BUcZ991xn6GZ426gwopE8VzAO1q
 5eJJstD23zWepZXpAYcKJ57cUU61dvJXFS9DzVE6OVoCoYz0Qyy2RLPYQrZPluIDMRkpKx
 pIAf6K9W3TPO1HQUlMKnU8nYlJ36ElQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-j_2R7O9bOjC2TBrDpwVoMA-1; Wed, 24 Feb 2021 16:23:44 -0500
X-MC-Unique: j_2R7O9bOjC2TBrDpwVoMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BAC3803F4C;
 Wed, 24 Feb 2021 21:23:43 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 796B960862;
 Wed, 24 Feb 2021 21:23:42 +0000 (UTC)
Subject: Re: [PATCH v3 02/16] qapi/expr.py: Check for dict instead of
 OrderedDict
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-3-jsnow@redhat.com>
 <87a6rt7qzf.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <10b0905f-2c36-48f1-fef4-ac96417e48d8@redhat.com>
Date: Wed, 24 Feb 2021 16:23:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87a6rt7qzf.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 2/24/21 4:30 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> OrderedDict is a subtype of dict, so we can check for a more general
>> form. These functions do not themselves depend on it being any
>> particular type.
> 
> True.  The actual arguments can only be OrderedDict, though.  I think we
> refrained from relaxing to dict in these helpers because we felt
> "staying ordered" is clearer.
> 

As a habit, I tend towards declaring the least specific type possible 
for input and declaring the most specific type possible for output.

> We're *this* close to mooting the point, because
> 
>      Changed in version 3.7: Dictionary order is guaranteed to be
>      insertion order. This behavior was an implementation detail of
>      CPython from 3.6.
> 
> https://docs.python.org/3.7/library/stdtypes.html
> 
> Is messing with it necessary for later work?  If not, is it a worthwhile
> improvement?
> 

Not strictly necessary, but if the expression checkers here don't 
*require* the type be an ordereddict, why bother to enforce that here?

It's just a bid to slacken the type (my type hints will look for Dict, 
not OrderedDict) and leave the use of OrderedDict as an "implementation 
detail" that only parser.py knows about.

(I needed to change it for prototyping using an off-the-shelf parser, so 
it was annoying to have it check for a stronger type if it doesn't 
absolutely have to.)

>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   scripts/qapi/expr.py | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index 35695c4c653..5694c501fa3 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -14,7 +14,6 @@
>>   # This work is licensed under the terms of the GNU GPL, version 2.
>>   # See the COPYING file in the top-level directory.
>>   
>> -from collections import OrderedDict
>>   import re
>>   
>>   from .common import c_name
>> @@ -131,7 +130,7 @@ def check_if_str(ifcond):
>>   
>>   
>>   def normalize_members(members):
>> -    if isinstance(members, OrderedDict):
>> +    if isinstance(members, dict):
>>           for key, arg in members.items():
>>               if isinstance(arg, dict):
>>                   continue
>> @@ -162,7 +161,7 @@ def check_type(value, info, source,
>>       if not allow_dict:
>>           raise QAPISemError(info, "%s should be a type name" % source)
>>   
>> -    if not isinstance(value, OrderedDict):
>> +    if not isinstance(value, dict):
>>           raise QAPISemError(info,
>>                              "%s should be an object or type name" % source)


