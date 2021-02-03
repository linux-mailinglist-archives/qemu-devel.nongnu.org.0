Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A166A30E512
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:45:04 +0100 (CET)
Received: from localhost ([::1]:54482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PxP-0000ua-Cc
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7Psu-00074k-MV
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:40:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7Psl-0001Wk-C2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612388413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSI7NXExjLp4VIUS41KunlU9g66gLs9LO7pBRtOyvWU=;
 b=AKe7Yj+UrAhnrUG99HdJptPZ8w6c6k5OpyUM+UYlM8e+EGf/YiwSAVxCvA1p+f4Xt0MXLz
 hT2zAz+Y43aqz9uTPU60ac2BWDy4GVSaTf7HKhqV31BhI1gW0qJKLkmosLMoBSS5RDyZGm
 6/3lGy0F8nPIDBF1oCdD8yK8bujbEIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-3UvrLcVzNDuk1j0pyiWW3w-1; Wed, 03 Feb 2021 16:40:11 -0500
X-MC-Unique: 3UvrLcVzNDuk1j0pyiWW3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D093CC620;
 Wed,  3 Feb 2021 21:40:10 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D34C1971D;
 Wed,  3 Feb 2021 21:40:09 +0000 (UTC)
Subject: Re: [PATCH v4 07/14] qapi/introspect.py: Introduce preliminary tree
 typing
To: Markus Armbruster <armbru@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-8-jsnow@redhat.com>
 <87im79te9a.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <dd9587ab-07fb-c133-ba9e-7688811675d1@redhat.com>
Date: Wed, 3 Feb 2021 16:40:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87im79te9a.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 2/3/21 9:30 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> The types will be used in forthcoming patches to add typing. These types
>> describe the layout and structure of the objects passed to
>> _tree_to_qlit, but lack the power to describe annotations until the next
>> commit.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 30 +++++++++++++++++++++++++++++-
>>   1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index 0aa3b77109f..b82efe16f6e 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -10,7 +10,13 @@
>>   See the COPYING file in the top-level directory.
>>   """
>>   
>> -from typing import Optional
>> +from typing import (
>> +    Any,
>> +    Dict,
>> +    List,
>> +    Optional,
>> +    Union,
>> +)
>>   
>>   from .common import (
>>       c_name,
>> @@ -26,6 +32,28 @@
>>   )
>>   
>>   
>> +# This module constructs a tree data structure that is used to
>> +# generate the introspection information for QEMU. It behaves similarly
>> +# to a JSON value.
>> +#
>> +# A complexity over JSON is that our values may or may not be annotated.
>> +#
>> +# Un-annotated values may be:
>> +#     Scalar: str, bool, None.
>> +#     Non-scalar: List, Dict
>> +# _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
>> +#
>> +# With optional annotations, the type of all values is:
>> +# TreeValue = Union[_value, Annotated[_value]]
>> +#
>> +# Sadly, mypy does not support recursive types, so we must approximate this.
>> +_stub = Any
>> +_scalar = Union[str, bool, None]
>> +_nonscalar = Union[Dict[str, _stub], List[_stub]]
>> +_value = Union[_scalar, _nonscalar]
>> +# TreeValue = Union[_value, 'Annotated[_value]']
> 
> Why is TreeValue commented out?  Oh, because Annotated doesn't exist,
> yet.
> 

In the comment region specifically, the intent was to give a standalone 
grammar of the structure without regard to implementation limitations. 
It is the "real" type of the tree.

i.e., the grammar is complete and accurate, but abstract.

 From the commit message: "These types describe the layout and structure 
of the objects passed to _tree_to_qlit, but lack the power to describe 
annotations until the next commit."

The second occurrence of that type, commented out, could be removed -- 
see below.

> Possibly less confusing:
> 
>     # A complexity over JSON is that our values may or may not be annotated.
>     #
>     # Un-annotated values may be:
>     #     Scalar: str, bool, None.
>     #     Non-scalar: List, Dict
>     # _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
>     #
>     # With optional annotations, the type of all values is:
>     # TODO

I'd actually prefer to keep that one in;

>     #
>     # Sadly, mypy does not support recursive types, so we must approximate this.
>     _stub = Any
>     _scalar = Union[str, bool, None]
>     _nonscalar = Union[Dict[str, _stub], List[_stub]]
>     _value = Union[_scalar, _nonscalar]

and augment it here instead, with:

# _TreeValue = TODO - defined in a forthcoming commit.

--js

> 
> or even just
> 
>     # A complexity over JSON is that our values may or may not be annotated.
>     #
>     # Un-annotated values may be:
>     #     Scalar: str, bool, None.
>     #     Non-scalar: List, Dict
>     # _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
>     #
>     # Sadly, mypy does not support recursive types, so we must approximate this.
>     _stub = Any
>     _scalar = Union[str, bool, None]
>     _nonscalar = Union[Dict[str, _stub], List[_stub]]
>     _value = Union[_scalar, _nonscalar]
> 
>> +
>> +
>>   def _make_tree(obj, ifcond, comment=None):
>>       extra = {
>>           'if': ifcond,


