Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9950F30E4DF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:23:26 +0100 (CET)
Received: from localhost ([::1]:36076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PcT-0000FK-Ly
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7Pau-0007mz-Th
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:21:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7Paq-0002YL-Gb
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612387303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0cGBGFNFLqS/e0Gpx/E+eFILqb3dvdOVBLKsfesX9o=;
 b=e2Nbj/mI7vhUK6i408K2qEX3NDqkBYcV1AKWn0lmTF1sirwv2wmM0kfE0LmrV/djzhZtEk
 QTyiowA3BURlK4/t23sVsO7OKwucczJ5ImSQCQNT5pIlNneoxpyFeB325llV/g58oGkZDH
 N7HKyuLWOdCE1+IttJbb95+4XBFsV9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-1a7u40YKPeyPL-g2hYTPtw-1; Wed, 03 Feb 2021 16:21:40 -0500
X-MC-Unique: 1a7u40YKPeyPL-g2hYTPtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC0B6183CD04;
 Wed,  3 Feb 2021 21:21:39 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6127860BFA;
 Wed,  3 Feb 2021 21:21:39 +0000 (UTC)
Subject: Re: [PATCH v4 06/14] qapi/introspect.py: replace 'extra' dict with
 'comment' argument
To: Markus Armbruster <armbru@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-7-jsnow@redhat.com>
 <87tuqtteks.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <fac0a218-2d43-bc70-dadf-1f5da4c5b03f@redhat.com>
Date: Wed, 3 Feb 2021 16:21:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87tuqtteks.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 2/3/21 9:23 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> This is only used to pass in a dictionary with a comment already set, so
>> skip the runaround and just accept the comment.
>>
>> This works because _tree_to_qlit() treats 'if': None; 'comment': None
>> exactly like absent 'if'; 'comment'.
> 
> Confusing, because the two paragraphs talk about two different things:
> 
> 1. Actual arguments for @extra are either None or {'comment': comment}.
>     Simplify: replace parameter @extra by parameter @comment.
> 
> 2. Dumb down the return value to always be of the form
> 
>      (obj {'if': ifcond, 'comment': comment})
> 

I think you are drawing attention to the fact that 'if' and 'comment' 
are now always present in this dict instead of conditionally present.

(else, I have misread you. (I think you are missing a comma.))

> I suspect splitting the patch is easier than crafting a clear commit
> message for the combined one.
> 

I wouldn't have considered to break out such a small change into two 
even smaller changes, but as you are in charge here ... Okey Dokey.

(meta-tangent: [1])

>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index d3fbf694ad2..0aa3b77109f 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -10,6 +10,8 @@
>>   See the COPYING file in the top-level directory.
>>   """
>>   
>> +from typing import Optional
>> +
>>   from .common import (
>>       c_name,
>>       gen_endif,
>> @@ -24,11 +26,11 @@
>>   )
>>   
>>   
>> -def _make_tree(obj, ifcond, extra=None):
>> -    if extra is None:
>> -        extra = {}
>> -    if ifcond:
>> -        extra['if'] = ifcond
>> +def _make_tree(obj, ifcond, comment=None):
>> +    extra = {
>> +        'if': ifcond,
>> +        'comment': comment,
>> +    }
>>       return (obj, extra)
> 
> Obvious way to do just 1.:
> 
>     def _make_tree(obj, ifcond, comment=None):
>         extra = {}
>         if ifcond:
>             extra['if'] = ifcond
>         if comment:
>             extra['comment'] = comment
> 

OK.

>>   
>>   
>> @@ -174,18 +176,18 @@ def _gen_features(features):
>>           return [_make_tree(f.name, f.ifcond) for f in features]
>>   
>>       def _gen_tree(self, name, mtype, obj, ifcond, features):
>> -        extra = None
>> +        comment: Optional[str] = None
>>           if mtype not in ('command', 'event', 'builtin', 'array'):
>>               if not self._unmask:
>>                   # Output a comment to make it easy to map masked names
>>                   # back to the source when reading the generated output.
>> -                extra = {'comment': '"%s" = %s' % (self._name(name), name)}
>> +                comment = f'"{self._name(name)}" = {name}'
>>               name = self._name(name)
>>           obj['name'] = name
>>           obj['meta-type'] = mtype
>>           if features:
>>               obj['features'] = self._gen_features(features)
>> -        self._trees.append(_make_tree(obj, ifcond, extra))
>> +        self._trees.append(_make_tree(obj, ifcond, comment))
>>   
>>       def _gen_member(self, member):
>>           obj = {'name': member.name, 'type': self._use_type(member.type)}


[1] As a matter of process, I sometimes find it cumbersome to 
intentionally engineer an intermediary state when I jumped straight from 
A->C in my actual editing.

I will usually keep such intermediary forms when they come about 
naturally in the course of development, but rarely seek to add them 
artificially -- it feels like a major bummer to engineer, test, and 
scrutinize code that's only bound to be deleted immediately after. 
Sometimes, it feels like a waste of reviewer effort, too.

It's been years and I still don't think I have any real intuitive sense 
for this, which is ...unfortunate.

--js


