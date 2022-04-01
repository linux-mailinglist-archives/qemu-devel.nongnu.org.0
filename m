Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ECA4EEDE5
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:13:05 +0200 (CEST)
Received: from localhost ([::1]:58158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naH5L-00021A-Tp
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:13:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naH3Z-0008Qs-3K
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naH3V-0005Is-MR
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648818668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7QzhvMgRSG7uxMleh/UexUJtViOTgZ11K3uZvY68ki8=;
 b=HdjKWFM5X7N4YfxCog7pqkzIeQWsjFbhqQ76Rq7Z1K0HeytS176IIVqXN68cDB2cP+NLIs
 NpZ6pqveuC4Sg/RcB7d6lxevMyXF4OktItZ8LZvONfTivn1LFYYNDT+SIPGDt8o9PnsQsB
 M9UDzaESzN5svWWAsEBXQY2HkLUgPaA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-mD_i2nkuPuKS5Nq9iP1MPQ-1; Fri, 01 Apr 2022 09:11:05 -0400
X-MC-Unique: mD_i2nkuPuKS5Nq9iP1MPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 263AC80418F;
 Fri,  1 Apr 2022 13:11:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1EE9C28102;
 Fri,  1 Apr 2022 13:11:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A4F4C21E691D; Fri,  1 Apr 2022 15:11:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: use of uninitialized variable involving visit_type_uint32() and
 friends
References: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
 <CABgObfbu3MK6SCNGOFGGHWO72e3dYygUybgyavALKq5_pnWK0A@mail.gmail.com>
 <87y20p88qq.fsf@pond.sub.org>
 <e17c3f3b-000f-4bab-1e3a-2adbafbcdcbb@redhat.com>
Date: Fri, 01 Apr 2022 15:11:03 +0200
In-Reply-To: <e17c3f3b-000f-4bab-1e3a-2adbafbcdcbb@redhat.com> (Paolo
 Bonzini's message of "Fri, 1 Apr 2022 13:16:19 +0200")
Message-ID: <875ynt54pk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 4/1/22 11:15, Markus Armbruster wrote:
>>   +    assert (v->type == expected_type);
>>   +    if (expected_type & (VISITOR_INPUT | VISITOR_DEALLOC)) {
>> 
>> Backwards.
>
> Yes, I always get input vs output wrong.

Output becomes input becomes output.  How not to be confused!

>> With an input visitor @v,
>> 
>>      visit_type_uint32(v, "name", &val, errp)
>> 
>> stores to @val without looking at it first.  In other words,
>> uninitialized @val is fine, just like for val = ...
>> 
>> Note: you don't actually need VISITOR_DEALLOC here, because a
>> deallocation visitor isn't going to do anything for non-pointer values.
>
> There's a philosophical question on whether other deallocation visitors 
> can exist than "the" deallocation visitor, but it's not particularly 
> germane to the topic.

Agreed.  Same for "the" clone visitor.

>> Two changes:
>> 
>> * Skip copying to and from full-width buffer @value:
>> 
>>    - Skip @value = *obj when we're going to overwrite @value without
>>      reading it first.
>> 
>>      This leaves @value uninitialized instead of initializing it from a
>>      (commonly) uninitialized variable.
>> 
>>      I'm not sure how this helps static analysis, but if it does...
>
> If it can do really serious interprocedural analysis, it _might_ be able 
> to see through the visitor constructor and know that the "value = *obj" 
> is not initialized (e.g. "all callers of object_property_set use an 
> input visitor").  I doubt that honestly, but a man can dream.

I'm wary of arguments based on "a sufficiently smart compiler can"...

> If the conditionals are enough to shut it up, then we won the battle 
> (for now).

If they get us more milage per unit of work out of Coverity, I'm in
favor.  I'll want a comment explaining the conditionals, though.

> If the conditionals are not enough to shut it up, then you have a bit 
> more confidence when marking the false positives.
>
>>    - Skip *obj = @value when value must be *obj anyway.
>> 
>>      Should have no observable effect.
>> 
>>      Again, I'm not sure how this helps static analysis.
>
> Mostly consistency, could also be changed to an assert(*obj == value); 
> /* output visitors don't really need obj to be passed by reference */

I guess whatever is easier to explain in a comment.

>> * Pass visitor type in addition to the visitor.  Can you explain why
>>    that's useful?
>
> Because it communicates what the caller expects: "I have left this 
> uninitialized because I expect my "v" argument to be the kind of visitor 
> that fills it in".  It's this argument that gives me the confidence 
> needed to shut up Coverity's false positives.
>
> Embedding the visitor type in the signature makes it impossible not to 
> pass it, unlike e.g. an assertion in every getter or setter.

I think we got two kinds of code calling visitor methods:

1. Code for use with one kind of visitor only

   We get to pass a literal argument to the additional parameter you
   propose.

2. Code for use with arbitrary visitors (such as qapi-visit*.c)

   We need to pass v->type, where @v is the existing visitor argument.
   Except we can't: struct Visitor and VisitorType are private, defined
   in <visitor-impl.h>.  Easy enough to work around, but has a distinct
   "this design is falling apart" smell, at least to me.

Note that "intent explicit in every method call" is sufficient, but not
necessary for "intent is locally explicit, which lets us dismiss false
positives with confidence".  We could do "every function that calls
methods".  Like checking a precondition.  We already have
visit_is_input().  We could have visit_is_output().

The sane way to make output intent explicit is of course passing the
thing by value rather than by reference.  To get that, we could generate
even more code.  So, if the amount of code we currently generate isn't
disgusting enough, ...


