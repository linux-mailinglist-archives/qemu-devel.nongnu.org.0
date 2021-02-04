Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51B930F606
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:20:30 +0100 (CET)
Received: from localhost ([::1]:60378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gQn-0003R0-Sb
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7gDe-0007rD-8N
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7gDb-0004M6-TL
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612451211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vN3yz2Ih3YEhE8Df+XJ2kPg/dt/Sy1imTSydKVRbSXw=;
 b=TNNVCfl24Bl5LfszIZsekWrS05ae/DeFPNGfs9JtWdRqM4vkJZQFFCo6e7qxVN07o1RVda
 hjKXFCnsn4QzVcsB7m/pipvTlmjbSHPSfXrTpC9Sotc0iViqaoQVkWalEgUxeDYG2F8CC+
 RjBGCCrXsH8KUtmjr13Ekuoh/1HxDYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-3K6mAJERPzCczQHqObcMSg-1; Thu, 04 Feb 2021 10:06:47 -0500
X-MC-Unique: 3K6mAJERPzCczQHqObcMSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BA946D4E0;
 Thu,  4 Feb 2021 15:06:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4707F60C16;
 Thu,  4 Feb 2021 15:06:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CC12A113865F; Thu,  4 Feb 2021 16:06:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 04/14] qapi/introspect.py: guard against
 ifcond/comment misuse
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-5-jsnow@redhat.com>
 <874kitutv4.fsf@dusky.pond.sub.org>
 <fc2f7fd7-b212-ca3a-ef87-a05c4cd297cf@redhat.com>
Date: Thu, 04 Feb 2021 16:06:44 +0100
In-Reply-To: <fc2f7fd7-b212-ca3a-ef87-a05c4cd297cf@redhat.com> (John Snow's
 message of "Wed, 3 Feb 2021 15:42:54 -0500")
Message-ID: <87lfc3dg8r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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

> On 2/3/21 9:08 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> _tree_to_qlit is called recursively on dict values alone; at such a
>>> point in generating output it is too late to apply an ifcond. Similarly,
>>> comments do not necessarily have a "tidy" place they can be printed in
>>> such a circumstance.
>>>
>>> Forbid this usage.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/introspect.py | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>>> index 4749f65ea3c..ccdf4f1c0d0 100644
>>> --- a/scripts/qapi/introspect.py
>>> +++ b/scripts/qapi/introspect.py
>>> @@ -43,6 +43,12 @@ def indent(level):
>>>           ifobj, extra = obj
>>>           ifcond = extra.get('if')
>>>           comment = extra.get('comment')
>>> +
>>> +        # NB: _tree_to_qlit is called recursively on the values of a key:value
>>> +        # pair; those values can't be decorated with comments or conditionals.
>>> +        msg = "dict values cannot have attached comments or if-conditionals."
>>> +        assert not suppress_first_indent, msg
>>> +
>>>           ret = ''
>>>           if comment:
>>>               ret += indent(level) + '/* %s */\n' % comment
>> This uses @suppress_first_indent as a proxy for "@obj is a value in
>> a
>> dict".  Works, because we pass suppress_first_indent=True exactly
>> there.  Took me a minute to see, though.
>> 
>
> Yes, the link is a little tenuous; in truth, the field could be
> renamed "dict_value: bool" or so to make it more clear, at the expense
> of making the inner workings of _tree_to_qlit more opaque.
>
> So we happen to know that only dict values want to suppress the
> indent; and the error message explains what went wrong in language 
> (subjectively, again) more directly helpful to the theoretical hapless user.
>
> (Tentatively: I'll amend the parameter name to make the relationship
> more concrete, but I expect you'll have more to say.)
>
>> Do you need this assertion to help mypy over the hump?
>> 
>
> It was added as a result of an observation by Eduardo that by always
> generating annotation data (To make the return type from _make_tree
> not conditional) that there were cases where you could conceivably
> call _tree_to_qlit that didn't make sense; or at least we couldn't
> prove easily that it wouldn't happen.
>
> (Of course, in practice, it does not.)
>
> I added the assertion to call attention to the limitations of this
> existing code: passing annotations alongside dict values made no
> sense.
>
> (Or maybe made no sense.)
>
> Conceptually it makes sense that some keys of a dict might be
> conditionally compiled out, but in terms of the actual data structures 
> we use to convey this information, we don't actually use dicts to
> represent keys like that ... we use a list, actually.
>
> (See visit_object_type_flat)
>
> Anyway, this was an attempt to clear up that misunderstanding for
> reviewers less familiar with these structures, and to guard against 
> future code in particular that may misunderstand it.

I doubt the guard is needed for code.  This stuff hasn't changed in a
long time.  JSON is set in stone.  If we ever need extras beyond ifcond
and comment (unlikely), we can stuff them in just like ifcond and
comment.

I accept readers and reviewers may find it useful.

> It isn't (to my recollection) necessary for mypy. If you want to
> remove it, I think I'd like Eduardo to sign off on that matter.
>
> (We both found this code very, very confusing to read and modify. For
> whatever reason, I still find it fairly hard to reason about clearly.)

Sorry about that.  If I had known how much trouble the cheap and
somewhat hacky extension of the QLit-generating code for ifcond (commit
d626b6c1ae7) would give you[*], I would've nacked it.

>> Perhaps we'd be better off with two functions, one that takes possibly
>> annotated @obj, and one that takes only plain @obj.  "Yes, but not now"
>> woule be one acceptable answer to that.
>> 
>
> Yes, I tried to prototype this a few times but found that it quickly
> touched too many things and I was losing appetite for re-spins. Recent 
> reviews urged a focus on "typing what we have, where possible" before
> making alterations. The debate between "fix-then-type" or 
> "type-then-fix" is valid, but largely intractable.

Yes, we need to focus, and resist mission creep.

When review uncovers improvement opportunities, we need to decide
whether to pursue within the series, in a follow-up series, or
"later"[**].

This should *not* stop us from pointing out improvement opportunities!

With the benefit of hindsight: I wish we had kicked this one down the
road some.  Sunk cost, though.

> Since my only immediate goal was "Get everything typed", the
> "type-then-fix" approach has the side-effect of dropping improvements 
> that aren't strictly needed whenever possible.
>
> LONG STORY SHORT: Yes, I think that design would be better overall,
> but I think it should wait for later. In particular, if you embark
> upon your more radical rewrite of introspection, it could just be
> handled at that time.

Got it.

> (My careful separation of scalars vs non-scalars in the typing comment
> later in this series is an artifact of the time spent playing around 
> with splitting this function out into two mutually recursive
> functions, but found it was too noisy in an already long-challenged
> series.)
>
> --js


[*] And then indirectly me, to be honest.

[**] Which may well mean "never" in practice.


