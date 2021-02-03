Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C631A30E429
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 21:44:46 +0100 (CET)
Received: from localhost ([::1]:33842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7P0y-00018W-5l
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 15:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7OzP-0000XJ-4s
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:43:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7OzM-0002Zp-I9
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612384979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkrY0+yaQQ0R8aDwSKGGm2it/TGKNdVYJt6gzRa3pgQ=;
 b=PrIcTBENm6QmrghXFE7PbGDTwXl/Zn8Q66/gA5D8X/ZTSxrZYBXK2lIIgoFRXJdA5oDpv3
 1LoDRGRjcnskZRb5CWfOxcGYLWSQpwhNuTVMhuIxv/1nQOg4lSrd3TbgsXUKquQ+uRVcr/
 fyxJ8E2yZUTgciXjuPg7n4HB61CBuzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-XfxOrRjOOWiYpROhFTND_A-1; Wed, 03 Feb 2021 15:42:56 -0500
X-MC-Unique: XfxOrRjOOWiYpROhFTND_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B305D874980;
 Wed,  3 Feb 2021 20:42:55 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 229A81A266;
 Wed,  3 Feb 2021 20:42:55 +0000 (UTC)
Subject: Re: [PATCH v4 04/14] qapi/introspect.py: guard against ifcond/comment
 misuse
To: Markus Armbruster <armbru@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-5-jsnow@redhat.com>
 <874kitutv4.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <fc2f7fd7-b212-ca3a-ef87-a05c4cd297cf@redhat.com>
Date: Wed, 3 Feb 2021 15:42:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <874kitutv4.fsf@dusky.pond.sub.org>
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

On 2/3/21 9:08 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> _tree_to_qlit is called recursively on dict values alone; at such a
>> point in generating output it is too late to apply an ifcond. Similarly,
>> comments do not necessarily have a "tidy" place they can be printed in
>> such a circumstance.
>>
>> Forbid this usage.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index 4749f65ea3c..ccdf4f1c0d0 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -43,6 +43,12 @@ def indent(level):
>>           ifobj, extra = obj
>>           ifcond = extra.get('if')
>>           comment = extra.get('comment')
>> +
>> +        # NB: _tree_to_qlit is called recursively on the values of a key:value
>> +        # pair; those values can't be decorated with comments or conditionals.
>> +        msg = "dict values cannot have attached comments or if-conditionals."
>> +        assert not suppress_first_indent, msg
>> +
>>           ret = ''
>>           if comment:
>>               ret += indent(level) + '/* %s */\n' % comment
> 
> This uses @suppress_first_indent as a proxy for "@obj is a value in a
> dict".  Works, because we pass suppress_first_indent=True exactly
> there.  Took me a minute to see, though.
> 

Yes, the link is a little tenuous; in truth, the field could be renamed 
"dict_value: bool" or so to make it more clear, at the expense of making 
the inner workings of _tree_to_qlit more opaque.

So we happen to know that only dict values want to suppress the indent; 
and the error message explains what went wrong in language 
(subjectively, again) more directly helpful to the theoretical hapless user.

(Tentatively: I'll amend the parameter name to make the relationship 
more concrete, but I expect you'll have more to say.)

> Do you need this assertion to help mypy over the hump?
> 

It was added as a result of an observation by Eduardo that by always 
generating annotation data (To make the return type from _make_tree not 
conditional) that there were cases where you could conceivably call 
_tree_to_qlit that didn't make sense; or at least we couldn't prove 
easily that it wouldn't happen.

(Of course, in practice, it does not.)

I added the assertion to call attention to the limitations of this 
existing code: passing annotations alongside dict values made no sense.

(Or maybe made no sense.)

Conceptually it makes sense that some keys of a dict might be 
conditionally compiled out, but in terms of the actual data structures 
we use to convey this information, we don't actually use dicts to 
represent keys like that ... we use a list, actually.

(See visit_object_type_flat)

Anyway, this was an attempt to clear up that misunderstanding for 
reviewers less familiar with these structures, and to guard against 
future code in particular that may misunderstand it.

It isn't (to my recollection) necessary for mypy. If you want to remove 
it, I think I'd like Eduardo to sign off on that matter.

(We both found this code very, very confusing to read and modify. For 
whatever reason, I still find it fairly hard to reason about clearly.)

> Perhaps we'd be better off with two functions, one that takes possibly
> annotated @obj, and one that takes only plain @obj.  "Yes, but not now"
> woule be one acceptable answer to that.
> 

Yes, I tried to prototype this a few times but found that it quickly 
touched too many things and I was losing appetite for re-spins. Recent 
reviews urged a focus on "typing what we have, where possible" before 
making alterations. The debate between "fix-then-type" or 
"type-then-fix" is valid, but largely intractable.

Since my only immediate goal was "Get everything typed", the 
"type-then-fix" approach has the side-effect of dropping improvements 
that aren't strictly needed whenever possible.

LONG STORY SHORT: Yes, I think that design would be better overall, but 
I think it should wait for later. In particular, if you embark upon your 
more radical rewrite of introspection, it could just be handled at that 
time.

(My careful separation of scalars vs non-scalars in the typing comment 
later in this series is an artifact of the time spent playing around 
with splitting this function out into two mutually recursive functions, 
but found it was too noisy in an already long-challenged series.)

--js


