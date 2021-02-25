Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D615325744
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:06:35 +0100 (CET)
Received: from localhost ([::1]:49700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFMu9-0000Us-RI
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lFMsB-0007Sp-Rq
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:04:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lFMrx-00040k-O8
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614283453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRtVmQCfZusWv8VZxIoW+m10DYdtv0Ri7FtdBQ2URM0=;
 b=N8vcZypfHW93G3KSBtVCVXpfIpWvyUwavgZKR5Pw22xKIOT5G+F0bZI97fDd9C4g4JAqz6
 nDRPxA44QQzCEuT3UH6eU77gwmHBhjo6wKMSC2YFo963DrfAy53VEm5qhdUMp3qteBeE1v
 974vYeg20jDq38U+VSC4LtgSMOh5ORo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-zh4mhHPSOcGuFsfV6s91nA-1; Thu, 25 Feb 2021 15:04:03 -0500
X-MC-Unique: zh4mhHPSOcGuFsfV6s91nA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEF14C295;
 Thu, 25 Feb 2021 20:04:01 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FAB11346D;
 Thu, 25 Feb 2021 20:04:01 +0000 (UTC)
Subject: Re: [PATCH v3 02/16] qapi/expr.py: Check for dict instead of
 OrderedDict
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-3-jsnow@redhat.com>
 <87a6rt7qzf.fsf@dusky.pond.sub.org>
 <10b0905f-2c36-48f1-fef4-ac96417e48d8@redhat.com>
 <87r1l4toq0.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <b1ff239d-f4d5-26ed-0a94-13096e78a903@redhat.com>
Date: Thu, 25 Feb 2021 15:04:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87r1l4toq0.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 2/25/21 5:40 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 2/24/21 4:30 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> OrderedDict is a subtype of dict, so we can check for a more general
>>>> form. These functions do not themselves depend on it being any
>>>> particular type.
>>>
>>> True.  The actual arguments can only be OrderedDict, though.  I think we
>>> refrained from relaxing to dict in these helpers because we felt
>>> "staying ordered" is clearer.
>>>
>>
>> As a habit, I tend towards declaring the least specific type possible
>> for input and declaring the most specific type possible for output.
> 
> This maximimizes generality, which can be quite worthwhile.  Maximizing
> generality by default is not a bad habit, I guess.  But cases exist
> where generality is not needed, and other considerations take
> precedence.
> 
>>> We're *this* close to mooting the point, because
>>>
>>>       Changed in version 3.7: Dictionary order is guaranteed to be
>>>       insertion order. This behavior was an implementation detail of
>>>       CPython from 3.6.
>>>
>>> https://docs.python.org/3.7/library/stdtypes.html
>>>
>>> Is messing with it necessary for later work?  If not, is it a worthwhile
>>> improvement?
>>>
>>
>> Not strictly necessary, but if the expression checkers here don't
>> *require* the type be an ordereddict, why bother to enforce that here?
>>
>> It's just a bid to slacken the type (my type hints will look for Dict,
>> not OrderedDict) and leave the use of OrderedDict as an "implementation
>> detail" that only parser.py knows about.
> 
> "Orderedness" is anything but a detail only parser.py knows about.
> 
> Example:
> 
>      { 'command': 'blockdev-insert-medium',
>        'data': { 'id': 'str',
>                  'node-name': 'str'} }
> 
> AST:
> 
>      OrderedDict([('command', 'blockdev-insert-medium'),
>                   ('data',
>                    OrderedDict([('id', {'type': 'str'}),
>                                 ('node-name', {'type': 'str'})]))])
> 
> For the inner dictionary, order matters, because the difference between
> 
>      void qmp_blockdev_insert_medium(const char *id, const char *node_name,
>                                      Error **errp);
> 
> and
> 
>      void qmp_blockdev_insert_medium(const char *node_name, const char *id,
>                                      Error **errp);
> 
> matters.
> 
> For the outer dictionary, order carries no semantic meaning.
> 
> My point is: parser.py fundamentally builds *ordered* dicts.  We're
> certainly free to relax them to more general types wherever
> "orderedness" is not needed.  However, one of the main aims of this
> typing exercise is to make the code easier to read, and I doubt making
> things more general helps there.
> 

I primarily I saw the writing on the wall that we *will* be abandoning 
the use of OrderedDict and so I preferred to type in terms of just Dict, 
using the fact that Dict < OrderedDict anyway, asserting that parser.py 
uses OrderedDict as an "implementation detail".

Later, parser.py may abandon its use of OrderedDict without changes to 
the rest of the code.

The alternative is to use OrderedDict everywhere here in expr.py, but I 
would *prefer* not to, as it will inhibit prototyping and 
experimentation efforts where we might use a parser that doesn't use 
OrderedDict.

What I absolutely did not want to do was type in terms of Dict[str, 
object] but then use isinstance checks for OrderedDict.

My preference is still, I think, to just go all-in on dict. I am 
personally comfortable trusting that parser.py creates an ordered 
implementation of the type.

As for these specific checks:

- normalize_members doesn't assert that it has an OrderedDict, it only 
normalizes *if* it gets one. I don't think this is helpful behavior.

- check_type has an error message that doesn't square with the check: we 
can give it a dict and it will pretend like we didn't give it one. I 
don't think that's helpful either.

> Related: the type aliases for the AST you define later in this series.
> I figure relaxing these to more general types where possible would
> actually reduce their value.  TopLevelExpression tells me more than
> dict.
> 
> I'm not against relaxing types per se.  Judicious relaxation is often
> useful to keep code more generally useful.  When to relax isn't always
> obvious.
> 
>> (I needed to change it for prototyping using an off-the-shelf parser, so
>> it was annoying to have it check for a stronger type if it doesn't
>> absolutely have to.)
> 
> If your off-the-shelf parse doesn't preserve order, it's not fit for the
> purpose :)
> 

It does, but in 3.6 that might be relying on CPython details. This is a 
pretty frustrating place to be in, support-wise.

>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>


