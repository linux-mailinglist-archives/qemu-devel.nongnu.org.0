Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A514F0F61
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 08:30:36 +0200 (CEST)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbGEV-0001SM-7f
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 02:30:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbG8J-0000e8-T8
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 02:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbG8E-0005PJ-SU
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 02:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649053445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hVm4IPSMjuL70Vi4DriMR/QPpw+xesOfdIqo+xFByhA=;
 b=MsugfGhnGWAEV07LWG01enEo4uL23zgTLF26rHylW0/k3dmg5A9znWz+vwpzw2fVVszwTN
 slXoHMHfJFArMKytGu+MAhwWhXShaOjgboYonxRSCqvLP+SbdlY6vxUHTPGtdAOVuqMoVw
 Ty+MxPVzvME8SRTDWeifiPEZpKJh3pE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-TEdNgcM9OSiLK-DEhxmMjg-1; Mon, 04 Apr 2022 02:24:04 -0400
X-MC-Unique: TEdNgcM9OSiLK-DEhxmMjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 162333806721;
 Mon,  4 Apr 2022 06:24:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E75D140F1C2E;
 Mon,  4 Apr 2022 06:24:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BC25021E6906; Mon,  4 Apr 2022 08:24:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: use of uninitialized variable involving visit_type_uint32() and
 friends
References: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
 <CABgObfbu3MK6SCNGOFGGHWO72e3dYygUybgyavALKq5_pnWK0A@mail.gmail.com>
 <87y20p88qq.fsf@pond.sub.org>
 <e17c3f3b-000f-4bab-1e3a-2adbafbcdcbb@redhat.com>
 <875ynt54pk.fsf@pond.sub.org>
 <33548764-9f91-b4df-c2b6-b897713d56fd@redhat.com>
Date: Mon, 04 Apr 2022 08:24:02 +0200
In-Reply-To: <33548764-9f91-b4df-c2b6-b897713d56fd@redhat.com> (Paolo
 Bonzini's message of "Fri, 1 Apr 2022 17:46:39 +0200")
Message-ID: <87ee2d1i4d.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

> On 4/1/22 15:11, Markus Armbruster wrote:
>>> If it can do really serious interprocedural analysis, it _might_ be able
>>> to see through the visitor constructor and know that the "value = *obj"
>>> is not initialized (e.g. "all callers of object_property_set use an
>>> input visitor").  I doubt that honestly, but a man can dream.
>> 
>> I'm wary of arguments based on "a sufficiently smart compiler can"...
>
> Absolutely.
>
>>> Because it communicates what the caller expects: "I have left this
>>> uninitialized because I expect my "v" argument to be the kind of visitor
>>> that fills it in".  It's this argument that gives me the confidence
>>> needed to shut up Coverity's false positives.
>>>
>>> Embedding the visitor type in the signature makes it impossible not to
>>> pass it, unlike e.g. an assertion in every getter or setter.
>> 
>> I think we got two kinds of code calling visitor methods:
>> 
>> 1. Code for use with one kind of visitor only
>> 
>>     We get to pass a literal argument to the additional parameter you
>>     propose.
>> 
>> 2. Code for use with arbitrary visitors (such as qapi-visit*.c)
>> 
>>     We need to pass v->type, where @v is the existing visitor argument.
>>     Except we can't: struct Visitor and VisitorType are private, defined
>>     in <visitor-impl.h>.  Easy enough to work around, but has a distinct
>>     "this design is falling apart" smell, at least to me.
>
> Hmm, maybe that's a feature though.  If we only need v->type in .c files 
> for the generated visit_type_* functions, then it's not a huge deal that 
> they will have to include <visitor-impl.h>.  All callers outside 
> generated type visitors (which includes for example QMP command 
> marshaling), instead, would _have_ to pass visitor type constants and 
> make it clear what direction the visit is going.

I quoted the generated qapi-visit*.c as an example.  There may
handwritten instances, too.

>> Note that "intent explicit in every method call" is sufficient, but not
>> necessary for "intent is locally explicit, which lets us dismiss false
>> positives with confidence".  We could do "every function that calls
>> methods".  Like checking a precondition.  We already have
>> visit_is_input().  We could have visit_is_output().
>> 
>> The sane way to make output intent explicit is of course passing the
>> thing by value rather than by reference.  To get that, we could generate
>> even more code.  So, if the amount of code we currently generate isn't
>> disgusting enough, ...
>
> Yeah, that would be ugly.  Or, we could generate the same code plus some 
> static inline wrappers that take a
>
>    struct InputVisitor {
>        Visitor dont_use_me_it_hurts;
>    }
>    struct OutputVisitor {
>        Visitor dont_use_me_it_hurts;
>    }
>
> That would be zero-cost abstraction at runtime.

Looks worth exploring!


