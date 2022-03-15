Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB7A4DA10E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 18:24:34 +0100 (CET)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUAuP-0004Va-Ja
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 13:24:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUAt9-0003er-J8; Tue, 15 Mar 2022 13:23:15 -0400
Received: from [2a00:1450:4864:20::529] (port=42857
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUAt7-0001nN-9w; Tue, 15 Mar 2022 13:23:15 -0400
Received: by mail-ed1-x529.google.com with SMTP id y8so20042983edl.9;
 Tue, 15 Mar 2022 10:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hDBfD33J4jw6lplYt8WhZXGiQVIGAY4df1jiKD9Fflk=;
 b=HGmyXCD79IOQarQNKNKzLI1KleyLnUcuMqpOmikfJH6JJFkv1f3CCr+pF3RpjNvmy9
 IJhvFLMKI1t2nUiUjoPfRSxGCIDJkZguha3J8yJ/FTAzZ8tFojkUhVAjP614gOjlfngP
 4q4XgS6yfuF6QidcRyyGuKEFO2o/bcMTPKP7deOF54ZK9WztsGZAThEAjB+HVXW3boz+
 NMZELQzbYqhU/Jvr/FzFIOMOG+EXVvczKqpKXn4MajOMYihb7fk4S1oke7Lsbrp84zbW
 84DT16Rpdp2QX2z8Jbz/VlaYU1MGAuYjhPHA7cl+O59KzeeLA1ouFGqnd78eg7QLrfGG
 rlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hDBfD33J4jw6lplYt8WhZXGiQVIGAY4df1jiKD9Fflk=;
 b=cu7jv3PzpajjyMdIKqDijtjtQ0PU+8kfP+hKWbGCZdHfbAPQLoJnV1sRfQw8ut0H+H
 k8Df09cNzKPYptSydhhZ9gNvmpg467yAwmJ9DA72CM5+tCQ8zVRSqsgYmDO50Qo5MeGq
 2kH5g91ygxY0lyuWnh3SrCRqYQh7ai5G7/PzN9vGC+n6xK1sTuI31QwezBwHsyvqszBQ
 5b1SYlujP13RJcn8KXqZI8hbz8u82ORecQplmpVfJzZFnyEWT20OIRKDXQTSO6NqLQN7
 eoehNuVjSugmMfXQlFmHkKFSwsIgybZYPepydRASaB4jFWuBOS7gPC/TuYGwbP1G+9ml
 d0eg==
X-Gm-Message-State: AOAM5300o+EgBvSU4LO9b1mL/ERGdp/0dKt3rzzmyKis/SUna4rtqjU4
 XJvwrdRfiGRAkhTnYxk2zjQ=
X-Google-Smtp-Source: ABdhPJzreVuPswbzJz7YR4gRnRxFn31HcfFHcrAowtZxsr9A1atPWe/1UwfaDlLCuqzOEUMopEA0/Q==
X-Received: by 2002:a05:6402:35c7:b0:418:6577:9eb0 with SMTP id
 z7-20020a05640235c700b0041865779eb0mr14771538edc.343.1647364990709; 
 Tue, 15 Mar 2022 10:23:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 eq18-20020a170907291200b006da97b09661sm8339645ejc.17.2022.03.15.10.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 10:23:10 -0700 (PDT)
Message-ID: <7ad77a37-f828-31a7-baef-a7c8edd471e4@redhat.com>
Date: Tue, 15 Mar 2022 18:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: When and how to use C++ (was Re: [PATCH experiment 00/16] C++20
 coroutine backend)
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain> <YjCnss5W5MhZK1Hw@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YjCnss5W5MhZK1Hw@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: hreitz@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/15/22 15:50, Kevin Wolf wrote:
> I'm not sure what the C++ lock guards offer that our current lock guards
> don't? Passing down lock guards makes sense to me, but why can't you do
> that with QemuLockable?

Passing a QemuLockable alone doesn't ensure that the lock has been 
taken.  I guess we could build a QemuLockGuard on top that ensures that.

> (Hm, or can the C++ version somehow check at
> compile time that it's the _right_ lock that is held rather than just
> any lock? It didn't look like it at the first sight.)

It's not related to lock guards but clang++ has thread-safety analysis 
that checks for the right lock.  It is in theory there for C as well but 
it's mostly a joke.  Ironically, the only good use that I've seen of it 
is Marc-André's never committed work to check coroutine_fn markers at 
compile-time[1].

> But I do see the benefit of a compiler checked CoroutineFn<> return type
> compared to the coroutine_fn markers we have today. On the other hand...
> 
>> Also, once C++ is available people will start submitting C++ patches
>> simply because they are more comfortable with C++ (especially
>> one-time/infrequent contributors).
> 
> ...using C++ in coroutine code means that all of the block layer would
> suddenly become C++ and would be most affected by this effect. I'm not
> sure if that's something I would like to see, at least until there is a
> clear tree-wide policy (that preferably limits it to a subset that I
> understand).

You are the maintainer of the block layer, so you would have the biggest 
impact and obviously have input in such a policy.  I obviously don't 
have a policy ready[2], but I do have some goals:

1) whenever C++ is used to build an API for use in C++ source files:

	Those source files and their debugging experience should look
	like C, and not any more "foreign" than	the "QEMU C" dialect
	that we already have.

	Rationale: we might have funky code in headers, but
	"QEMU_WITH_LOCK_GUARD(x) { }" is understandable; the same would
	hold for "CoroutineFn<void>", "co_await fn();" or if hwaddr
	internally used operator overloading.

2) whenever C and C++ provide two different implementations of an API, 
for use in C and C++ source files respectively:

	If the same API is implemented in different ways for C and C++,
	the semantics should be equivalent, and covered by both
	C and C++ testcases.

	Rationale: this should be a rare occasion, but there are
	features such as _Generic that are C only, so it should be
	catered for; QemuLockable came out already in this proof of
	concept.  The implementation is completely different for C
	and C++, but it works the same (as proved to some extent
	by testcases).

	Looking again at the hwaddr example, it would be okay to forbid
	"hwaddr - hwaddr" subtraction in C++ code.  But it would not be
	okay to have it return a signed integer in C++, while it
	returns an unsigned integer in C.  Could there be a C++-only
	method "hwaddr.diff(hwaddr)" that does return a signed integer?
	That would have to be discussed, right now my opinion is
	"probably not" but see the next point too.

3) whenever C++ features (templates, classes, etc.) are used in .cc files:

	The features should have a clear benefit over equivalent
	C-only code (e.g. using the preprocessor instead of templates)
	and if applicable they should publish a C API[3] that can be
	consumed outside a particular subsystem.

	If in doubt, err on the side of moderation, i.e. less C++ and
	fewer C++ features.

	Example: I can imagine that in some cases the semantic
	replacement abilities provided by templates will for example
	improve compile-time checking and reduce code duplication
	compared to gcc.  However, QEMU already has a wide range of
	data structures and auxiliary APIs for C, and those should be
	used for C++ code to avoid splitting the code base.

	In turn, this should limit the usage of other C++ features.
	For example, constructors (as opposed to just being able to
	zero-initialize memory) can be more of a pain than a benefit
	if you can't use "new", "delete" or "std::vector<>".  Likewise,
	it's unlikely that we'll have reasons to use anonymous
	namespaces instead of "static", because that's mostly useful
	for classes defined in .cc files and their member functions[5].
	And VMState will prevent the usage of "private:", thus lowering
	the benefit from methods.

Would this kind of formulation be enough?  Maybe, maybe not, but either 
way I don't really believe in prohibiting features by policy.  The QEMU 
community and especially its maintainers won't change overnight if C++ 
is allowed in the codebase; but they should be allowed to evolve their 
opinions as their experience grows.  If some day the block layer 
maintainers want to extend coroutines to variable arguments rather than 
a single void *, they shouldn't be forbidden from doing so just because 
(I guess) it entails using variadic templates.  They should show that 
there is a benefit, though.

In any case, Stefan's suggestion to look into what other projects did, 
especially GCC/GDB is a good one:

- https://gcc.gnu.org/wiki/CppConventions probably is a good start[4], 
but we would probably cut on the "explicitly permitted" parts. 
https://gcc.gnu.org/codingrationale.html also focuses a lot on things 
that QEMU would likely not use.

- the discussion at 
https://gcc.gnu.org/legacy-ml/gcc/2010-05/msg00705.html has some quotes 
that capture interesting the point.  It's possible that I have 
subconsciously introduced it in my two messages on the topic:

	The goal is not to reimplement GCC from the ground up using
	modern OO/C++ techniques.  The goal is simply to permit
	ourselves to use C++ features where appropriate in the codebase.
	---
	The right subset is dependent on context.  We're not in a
	safety-critical environment, we have a large existing C
	codebase, and we have a developer team made up of experienced
	C programmers, not all of whom are used to programming in C++.
	So, we need to take those factors into account.
	---
	Switching to C++ should never be excuse to bring more more
	brittle codes or more obscurities.  Rather, it should be
	opportunity to write simpler and better code.

Also of interest is the replies to less enthusiastic developers starting 
at https://gcc.gnu.org/legacy-ml/gcc/2010-05/msg00744.html at 
https://gcc.gnu.org/legacy-ml/gcc/2010-06/msg00174.html.

- Richard might have some experience here, and his insight is valuable.

Paolo

[1] https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg00793.html

[2] in fact, even if we decided to go with C++ coroutines, it would take 
quite some time to split the coroutine/non-coroutine cases, which is a 
prerequisite for that, so we'd have a lot of time to develop a policy. 
Once the policy is there, there will be even more time before a 
C++-using patch that does something useful gets submitted and approved.

[3] or at least C-like, for example qemu_coroutine_create technically is 
a C++-only API because it takes a CoroutineFn<void>(*)(void *) argument. 
  But it *looks* like C.

[4] lol, there's even a remark fom me in there, but I stopped working on 
GCC about at the time that the document was being written.

[5] 
https://stackoverflow.com/questions/154469/unnamed-anonymous-namespaces-vs-static-functions

