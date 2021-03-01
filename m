Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725973284F8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:49:58 +0100 (CET)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlk5-0004F7-0g
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1lGlip-0003kt-03
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:48:39 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:13b:3ad0:1::3]:54892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1lGlik-0006xN-Ay
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:48:38 -0500
Received: from blackfin.pond.sub.org
 (p200300d36f3cab00dacb8afffee0c842.dip0.t-ipconnect.de
 [IPv6:2003:d3:6f3c:ab00:dacb:8aff:fee0:c842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by oxygen.pond.sub.org (Postfix) with ESMTPSA id AA1631FF56;
 Mon,  1 Mar 2021 17:48:20 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 609E2113860F; Mon,  1 Mar 2021 17:48:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 02/16] qapi/expr.py: Check for dict instead of
 OrderedDict
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-3-jsnow@redhat.com>
 <87a6rt7qzf.fsf@dusky.pond.sub.org>
 <10b0905f-2c36-48f1-fef4-ac96417e48d8@redhat.com>
 <87r1l4toq0.fsf@dusky.pond.sub.org>
 <b1ff239d-f4d5-26ed-0a94-13096e78a903@redhat.com>
Date: Mon, 01 Mar 2021 17:48:20 +0100
Message-ID: <877dmqes6j.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2a01:4f8:13b:3ad0:1::3;
 envelope-from=armbru@pond.sub.org; helo=oxygen.pond.sub.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

John Snow <jsnow@redhat.com> writes:

> On 2/25/21 5:40 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 2/24/21 4:30 AM, Markus Armbruster wrote:
>>>> John Snow <jsnow@redhat.com> writes:
>>>>
>>>>> OrderedDict is a subtype of dict, so we can check for a more general
>>>>> form. These functions do not themselves depend on it being any
>>>>> particular type.
>>>>
>>>> True.  The actual arguments can only be OrderedDict, though.  I think we
>>>> refrained from relaxing to dict in these helpers because we felt
>>>> "staying ordered" is clearer.
>>>>
>>>
>>> As a habit, I tend towards declaring the least specific type possible
>>> for input and declaring the most specific type possible for output.
>> 
>> This maximimizes generality, which can be quite worthwhile.  Maximizing
>> generality by default is not a bad habit, I guess.  But cases exist
>> where generality is not needed, and other considerations take
>> precedence.
>> 
>>>> We're *this* close to mooting the point, because
>>>>
>>>>       Changed in version 3.7: Dictionary order is guaranteed to be
>>>>       insertion order. This behavior was an implementation detail of
>>>>       CPython from 3.6.
>>>>
>>>> https://docs.python.org/3.7/library/stdtypes.html
>>>>
>>>> Is messing with it necessary for later work?  If not, is it a worthwhile
>>>> improvement?
>>>>
>>>
>>> Not strictly necessary, but if the expression checkers here don't
>>> *require* the type be an ordereddict, why bother to enforce that here?
>>>
>>> It's just a bid to slacken the type (my type hints will look for Dict,
>>> not OrderedDict) and leave the use of OrderedDict as an "implementation
>>> detail" that only parser.py knows about.
>> 
>> "Orderedness" is anything but a detail only parser.py knows about.
>> 
>> Example:
>> 
>>      { 'command': 'blockdev-insert-medium',
>>        'data': { 'id': 'str',
>>                  'node-name': 'str'} }
>> 
>> AST:
>> 
>>      OrderedDict([('command', 'blockdev-insert-medium'),
>>                   ('data',
>>                    OrderedDict([('id', {'type': 'str'}),
>>                                 ('node-name', {'type': 'str'})]))])
>> 
>> For the inner dictionary, order matters, because the difference between
>> 
>>      void qmp_blockdev_insert_medium(const char *id, const char *node_name,
>>                                      Error **errp);
>> 
>> and
>> 
>>      void qmp_blockdev_insert_medium(const char *node_name, const char *id,
>>                                      Error **errp);
>> 
>> matters.
>> 
>> For the outer dictionary, order carries no semantic meaning.
>> 
>> My point is: parser.py fundamentally builds *ordered* dicts.  We're
>> certainly free to relax them to more general types wherever
>> "orderedness" is not needed.  However, one of the main aims of this
>> typing exercise is to make the code easier to read, and I doubt making
>> things more general helps there.
>> 
>
> I primarily I saw the writing on the wall that we *will* be abandoning 
> the use of OrderedDict and so I preferred to type in terms of just Dict, 
> using the fact that Dict < OrderedDict anyway, asserting that parser.py 
> uses OrderedDict as an "implementation detail".
>
> Later, parser.py may abandon its use of OrderedDict without changes to 
> the rest of the code.

I'm tempted to do it now.

This could theoretically break running the QAPI code generator with a
Python 3.6 other than CPython.  Would we care?

If not, we can both have what we want: I can have the same type
everywhere (consistent, obvious), and you can have dict in expr.py.

It would also cut through the somewhat pedantic argument we're having on
"all objects in the AST are OrderedDict, always" [me] vs. "OrderedDict
is a detail I'd prefer to forget at first opportunity [totally and
intentionally unfair caricature of you ;-P]

> The alternative is to use OrderedDict everywhere here in expr.py, but I 
> would *prefer* not to, as it will inhibit prototyping and 
> experimentation efforts where we might use a parser that doesn't use 
> OrderedDict.
>
> What I absolutely did not want to do was type in terms of Dict[str, 
> object] but then use isinstance checks for OrderedDict.
>
> My preference is still, I think, to just go all-in on dict. I am 
> personally comfortable trusting that parser.py creates an ordered 
> implementation of the type.

... and nothing else creates instances.

> As for these specific checks:
>
> - normalize_members doesn't assert that it has an OrderedDict, it only 
> normalizes *if* it gets one. I don't think this is helpful behavior.
>
> - check_type has an error message that doesn't square with the check: we 
> can give it a dict and it will pretend like we didn't give it one. I 
> don't think that's helpful either.

I figure you mean

        raise QAPISemError(info,
                           "%s should be an object or type name" % source)

The error message says "object".  It's about the part to the right of
the ':' in this grammar production:

    MEMBER = STRING : TYPE-REF
           | STRING : { 'type': TYPE-REF,
                        '*if': COND,
                        '*features': FEATURES }

"Pidgin-JSON object" would be more exact than "object", but also more
confusing.

(Pidgin-JSON) objects are represented by OrderedDict in the AST.  Giving
check_type() something that is not an AST is out of spec.  check_type()
happens to cope with dict as well, but only because the difference to
OrderedDict doesn't matter for this particular piece of the AST.

I don't understand what "doesn't square".

>> Related: the type aliases for the AST you define later in this series.
>> I figure relaxing these to more general types where possible would
>> actually reduce their value.  TopLevelExpression tells me more than
>> dict.
>> 
>> I'm not against relaxing types per se.  Judicious relaxation is often
>> useful to keep code more generally useful.  When to relax isn't always
>> obvious.
>> 
>>> (I needed to change it for prototyping using an off-the-shelf parser, so
>>> it was annoying to have it check for a stronger type if it doesn't
>>> absolutely have to.)
>> 
>> If your off-the-shelf parse doesn't preserve order, it's not fit for the
>> purpose :)
>> 
>
> It does, but in 3.6 that might be relying on CPython details. This is a 
> pretty frustrating place to be in, support-wise.

Santa will bring us Python 3.6 EOL this year.  Thanks, Santa, can't
wait!

(Yes, I know, we'll likely have to endure the frustration even longer
for the sake of "distributions with long-lifetime releases".)

>>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>

