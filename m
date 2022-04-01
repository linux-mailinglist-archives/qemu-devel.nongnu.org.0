Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9F04EF5D3
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:48:03 +0200 (CEST)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJVK-0006bs-Kg
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:48:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naJU7-0005po-H6
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:46:47 -0400
Received: from [2a00:1450:4864:20::633] (port=34312
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naJU6-0004cO-0K
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:46:47 -0400
Received: by mail-ej1-x633.google.com with SMTP id o10so6751834ejd.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZjK8GXFWI7sN6kR+P+TjF9qjtKKdk403LI8KucixW2w=;
 b=HRIh9yGScXMnikfVR1Y6otsBJ+4vt2s/etMPIUHwG4IeW28ag4WbMbtC7k+R/oEgkZ
 hBTi4JbL8DAlzINbvYseowXI6Ngr10Kk1M7IJ00Zxp7omMkmSgAXFo2e/AQh9vabkqJn
 ELXoU5GEk8DT+xkjH0kcecYCN5wSLi9XBGZ44aphBPoY+jvt18PtEgGVVVivbo/8Hj7b
 AWrVab0R+NBaWumtHPdoKg7aqFabITa65Uy6wNArflk8OlkUUNQaW80x2WaJOl81tv4+
 AUYewJlONhEhqlwgKX7QFbX7a+ZTbyGpJ3qoDjCykYkvcSWcs2kY7mhQnX4X5rH8S6SQ
 WLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZjK8GXFWI7sN6kR+P+TjF9qjtKKdk403LI8KucixW2w=;
 b=oeaPr365f8E39qJtlP2hHebjZSmNpCCMT/Rw+n1Z/I8j0Jjbqb3XEOR+SbiVfyt+Et
 bTlcmIex67Ez+zZEsxuNUDLPxRmutn8xQakHioFfKQjy6Rjy6LO41iNJuiR5+DAZvM8f
 /nxtbe0u+keymE/lUPg/Tq4noFdsX9cDCrFZyFYCYPFJq4aMHTSn2ZzNkGqgiMNBxT5P
 VVD1V6YKMKQsZx+VciJJ+YbpBnUeFpISrv0ndijJEthechVtoGXvrtuE5lTYzQZgYVAh
 +M8Wk7Zau85vGqsvc3mTYi28gngvk5MHwMWSs8EgbA3fMPO6l+b83OxAfFZYUOZpR02p
 NiYg==
X-Gm-Message-State: AOAM530UFFcPn6E7pApo0S4w8MsjLHxdzHMm9Pig0bMwUAFzCRmD4gz7
 W13swWLNl/cSim2Qbnoe6L4=
X-Google-Smtp-Source: ABdhPJxFvgrcVOa9LfLGI1XLE9xjMBFZRkjWVbYRfcsUoS7dRG7zPYLBwQtsZHwOkB+QZ7cd0q9zvA==
X-Received: by 2002:a17:907:d05:b0:6e4:49ac:9b26 with SMTP id
 gn5-20020a1709070d0500b006e449ac9b26mr357467ejc.133.1648828004006; 
 Fri, 01 Apr 2022 08:46:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 l2-20020a1709060cc200b006d3d91e88c7sm1149767ejh.214.2022.04.01.08.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 08:46:43 -0700 (PDT)
Message-ID: <33548764-9f91-b4df-c2b6-b897713d56fd@redhat.com>
Date: Fri, 1 Apr 2022 17:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: use of uninitialized variable involving visit_type_uint32() and
 friends
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
 <CABgObfbu3MK6SCNGOFGGHWO72e3dYygUybgyavALKq5_pnWK0A@mail.gmail.com>
 <87y20p88qq.fsf@pond.sub.org>
 <e17c3f3b-000f-4bab-1e3a-2adbafbcdcbb@redhat.com>
 <875ynt54pk.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <875ynt54pk.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 4/1/22 15:11, Markus Armbruster wrote:
>> If it can do really serious interprocedural analysis, it _might_ be able
>> to see through the visitor constructor and know that the "value = *obj"
>> is not initialized (e.g. "all callers of object_property_set use an
>> input visitor").  I doubt that honestly, but a man can dream.
> 
> I'm wary of arguments based on "a sufficiently smart compiler can"...

Absolutely.

>> Because it communicates what the caller expects: "I have left this
>> uninitialized because I expect my "v" argument to be the kind of visitor
>> that fills it in".  It's this argument that gives me the confidence
>> needed to shut up Coverity's false positives.
>>
>> Embedding the visitor type in the signature makes it impossible not to
>> pass it, unlike e.g. an assertion in every getter or setter.
> 
> I think we got two kinds of code calling visitor methods:
> 
> 1. Code for use with one kind of visitor only
> 
>     We get to pass a literal argument to the additional parameter you
>     propose.
> 
> 2. Code for use with arbitrary visitors (such as qapi-visit*.c)
> 
>     We need to pass v->type, where @v is the existing visitor argument.
>     Except we can't: struct Visitor and VisitorType are private, defined
>     in <visitor-impl.h>.  Easy enough to work around, but has a distinct
>     "this design is falling apart" smell, at least to me.

Hmm, maybe that's a feature though.  If we only need v->type in .c files 
for the generated visit_type_* functions, then it's not a huge deal that 
they will have to include <visitor-impl.h>.  All callers outside 
generated type visitors (which includes for example QMP command 
marshaling), instead, would _have_ to pass visitor type constants and 
make it clear what direction the visit is going.

> Note that "intent explicit in every method call" is sufficient, but not
> necessary for "intent is locally explicit, which lets us dismiss false
> positives with confidence".  We could do "every function that calls
> methods".  Like checking a precondition.  We already have
> visit_is_input().  We could have visit_is_output().
> 
> The sane way to make output intent explicit is of course passing the
> thing by value rather than by reference.  To get that, we could generate
> even more code.  So, if the amount of code we currently generate isn't
> disgusting enough, ...

Yeah, that would be ugly.  Or, we could generate the same code plus some 
static inline wrappers that take a

   struct InputVisitor {
       Visitor dont_use_me_it_hurts;
   }
   struct OutputVisitor {
       Visitor dont_use_me_it_hurts;
   }

That would be zero-cost abstraction at runtime.

Paolo

