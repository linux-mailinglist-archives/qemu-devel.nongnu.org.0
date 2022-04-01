Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3371E4EEA42
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:19:22 +0200 (CEST)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDRA-0006uL-O9
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:19:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naDNn-0004tS-H4
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naDNk-0006SC-Jy
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648804546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eI1uKUmzguT1RsopZ0k2PCasBvXw1fwEusbJNI63wdM=;
 b=Bz9TX6ytcpS3FaKYvDUEd+rdO8NQLPsL4XIymjtsEA/vPMvIxNq/Up6Rnr1vU9Amzmfcu2
 vv3dekdrqQpgw9xP2r1AKH5clPBo3R779OhJNAcaSR/ocjWI+3WOMkt0CHfdXJk1uNHfWR
 8UbbV4u8Rkh5HSkLhDo28Bq2hefxZSQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-3p10kYM-PB2lQ7qBlEymTw-1; Fri, 01 Apr 2022 05:15:43 -0400
X-MC-Unique: 3p10kYM-PB2lQ7qBlEymTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59ABF811E78;
 Fri,  1 Apr 2022 09:15:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BC4C40CFD02;
 Fri,  1 Apr 2022 09:15:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DD03421E691D; Fri,  1 Apr 2022 11:15:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: use of uninitialized variable involving visit_type_uint32() and
 friends
References: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
 <CABgObfbu3MK6SCNGOFGGHWO72e3dYygUybgyavALKq5_pnWK0A@mail.gmail.com>
Date: Fri, 01 Apr 2022 11:15:41 +0200
In-Reply-To: <CABgObfbu3MK6SCNGOFGGHWO72e3dYygUybgyavALKq5_pnWK0A@mail.gmail.com>
 (Paolo Bonzini's message of "Fri, 1 Apr 2022 10:07:51 +0200")
Message-ID: <87y20p88qq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

> On Thu, Mar 31, 2022 at 7:35 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> Coverity warns about use of uninitialized data in what seems
>> to be a common pattern of use of visit_type_uint32() and similar
>> functions. Here's an example from target/arm/cpu64.c:
>>
>> static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char
>> *name,
>>                                    void *opaque, Error **errp)
>> {
>>     ARMCPU *cpu = ARM_CPU(obj);
>>     uint32_t max_vq;
>>     if (!visit_type_uint32(v, name, &max_vq, errp)) {
>>         return;
>>     }
>>     [code that does something with max_vq here]
>> }
>>
>> This doesn't initialize max_vq, on the apparent assumption
>> that visit_type_uint32() will do so. But that function [...]
>> reads the value of *obj (the uninitialized max_vq).
>>
>
> The visit_type_* functions are written to work for both getters and setters.

Yes.

This is convenient for uses that are actually visitor-agnostic, such as
the generated qapi-visit-FOO.c

It can be really ugly for output-only uses.  In particular for strings,
where we have to pass a char ** instead of a const char *.

> For the leaves, that means potentially reading uninitialized data.  It is
> harmless but very ugly, and with respect to static analysis it was all but
> a time bomb, all the time.
>
> The best (but most intrusive) solution would be to add a parameter to all
> visit_type_* functions with the expected "direction" of the visit, which
> could be checked against v->type.
>
> That is:
>
> bool visit_type_uint32(VisitorType expected_type, Visitor *v, const char
> *name, uint32_t *obj,
>                        Error **errp)
> {
>     uint64_t value;
>     bool ok;
>
>     trace_visit_type_uint32(v, name, obj);
>     assert (v->type == expected_type);
>     if (expected_type & (VISITOR_INPUT | VISITOR_DEALLOC)) {
>         value = *obj;
>     }
>     ok = visit_type_uintN(v, &value, name, UINT32_MAX, "uint32_t", errp);
>     assert (ok || expected_type == VISITOR_INPUT);
>     if (expected_type & VISITOR_OUTPUT) {
>         *obj = value;
>     }
>     return ok;
> }

As diff -w:

 -bool visit_type_uint32(Visitor *v, const char *name, uint32_t *obj,
 +bool visit_type_uint32(VisitorType expected_type, Visitor *v, const char
 +*name, uint32_t *obj,
                         Error **errp)
  {
      uint64_t value;
      bool ok;

      trace_visit_type_uint32(v, name, obj);
 +    assert (v->type == expected_type);
 +    if (expected_type & (VISITOR_INPUT | VISITOR_DEALLOC)) {

Backwards.

With an input visitor @v,

    visit_type_uint32(v, "name", &val, errp)

stores to @val without looking at it first.  In other words,
uninitialized @val is fine, just like for val = ...

Note: you don't actually need VISITOR_DEALLOC here, because a
deallocation visitor isn't going to do anything for non-pointer values.

With an output visitor @v,

    visit_type_uint32(v, "name", &val, errp)

reads from @val without changing it.

      value = *obj;
 +    }
      ok = visit_type_uintN(v, &value, name, UINT32_MAX, "uint32_t", errp);
 +    assert (ok || expected_type == VISITOR_INPUT);
 +    if (expected_type & VISITOR_OUTPUT) {

Also backwards.  

      *obj = value;
 +    }
      return ok;
  }

Two changes:

* Skip copying to and from full-width buffer @value:

  - Skip @value = *obj when we're going to overwrite @value without
    reading it first.

    This leaves @value uninitialized instead of initializing it from a
    (commonly) uninitialized variable.

    I'm not sure how this helps static analysis, but if it does...

  - Skip *obj = @value when value must be *obj anyway.

    Should have no observable effect.

    Again, I'm not sure how this helps static analysis.

  Note that only the functions for types narrower than 64 bits have such
  copying code.  Skipping the assignments creates a tiny inconsistency
  between narrow and fill-width visits.

* Pass visitor type in addition to the visitor.  Can you explain why
  that's useful?

> Probably also renaming VISITOR_* to V_* for conciseness.  That *should*
> quiesce Coverity, and also add some runtime checks.
>
> Paolo


