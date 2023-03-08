Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9C6B04F1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 11:49:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZrMG-0002ji-Fg; Wed, 08 Mar 2023 05:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZrME-0002iV-ED
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:49:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZrMC-00007p-RL
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678272555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqJj1UZVmQJwZFoyiQEQkhLLtJDeBQh0nVoZ46nZ2gw=;
 b=fGobc6fGYw+EB/eqkfQh6wsFsVUIvQF3STMZ4z4yMul86XJObaGDW9GM+eHSIeMYXu+KF2
 IyDcRsaRPoaGk+RsA6Ktc0uDF1lVcxrjNtVP12cz1tnVog7HvvkgmgRUIdbIog+Yk+4Uul
 8NtoaPDZEZ/9nX0nxTQhAJhGy5a/jic=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-Rv-b2mg-NmaNgvx3JHfVXA-1; Wed, 08 Mar 2023 05:49:14 -0500
X-MC-Unique: Rv-b2mg-NmaNgvx3JHfVXA-1
Received: by mail-ed1-f71.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso23047756edu.17
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 02:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678272553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rqJj1UZVmQJwZFoyiQEQkhLLtJDeBQh0nVoZ46nZ2gw=;
 b=Ik6c28oKH4m4yIHt9FZ8cYYAk9+M79yV0t78sw0R+FskBJZio0hfSvAQ6VBzlTLeeS
 5BpyNyGgyb+sQrCEtW58rTIDAsqdGPhsXbocY+ABV1PaoDZFbwkiAptkvAViCBOLJMGC
 vNkYSWeOcifTTXzdrD3IJv/1NIqB+UZNqe4qbGvB3OdxavErF4vlILSe3q8kduBRNx5j
 ucvD9xBP1tEEUg8/WpF+7IsyB8ypcuRdjZKZWz1GUk1pQpCCm/L9C+mCkeYOkms3FAlQ
 ooGv4FcwLhEVY7NK+fbJ3LOPEV2HfrQhLMX0+YR20y7oeiXu+X1uqdYVXycIyI8ng+iK
 JO5w==
X-Gm-Message-State: AO0yUKVZ21sdkXvkQrf4BskTM5+PXoq9orkfh0dgYoOw7y/V6B2LPosm
 b1Fx6FRdCUmLErwcc/cDzsbgvPpmi3gyPy7I+0wrLWPzDCKtOqvG1LM0rECg9FbgBpplvuIx8Sw
 91w9Da/t7Ey7lRGk=
X-Received: by 2002:a17:906:ce46:b0:8b1:ce91:a40c with SMTP id
 se6-20020a170906ce4600b008b1ce91a40cmr15785695ejb.53.1678272553402; 
 Wed, 08 Mar 2023 02:49:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9FZbH9kkna17lmZ0ntbUZLXVikUE6QObvvTimZyGvARY1GdvT1grGwo14cUCyVBDOHrDlLZg==
X-Received: by 2002:a17:906:ce46:b0:8b1:ce91:a40c with SMTP id
 se6-20020a170906ce4600b008b1ce91a40cmr15785683ejb.53.1678272553087; 
 Wed, 08 Mar 2023 02:49:13 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 e2-20020a170906504200b008f767c69421sm7338514ejk.44.2023.03.08.02.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 02:49:12 -0800 (PST)
Message-ID: <9da5c9c5-0675-157d-f099-2b0b14c26002@redhat.com>
Date: Wed, 8 Mar 2023 11:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 8/9] async: update documentation of the memory barriers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230306223306.84383-1-pbonzini@redhat.com>
 <20230306223306.84383-9-pbonzini@redhat.com>
 <10e49543-b4f8-f22c-a9ab-e6340c6a0074@linaro.org>
 <12ea9d46-1e95-62a1-70f7-d77a66b44bd0@redhat.com>
 <d661c4dd-309b-be7c-e60e-a035ae787c14@linaro.org>
 <d33a6fda-5b38-c136-9ec0-3c07b2031cd4@redhat.com>
 <aa14b8ad-8756-082b-3694-3c6177f6d46d@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <aa14b8ad-8756-082b-3694-3c6177f6d46d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/7/23 18:26, Richard Henderson wrote:
> On 3/7/23 09:00, Paolo Bonzini wrote:
>> while QSLIST_REMOVE_HEAD in the dequeuing thread is not ordered at all:
>>
>>          y.store(0, mo_relaxed);           // QSLIST_REMOVE_HEAD
>>          x.store(0, mo_release);           // fetch_and
>>
>>> As I read aio_bh_queue, this is exactly the situation you describe in 
>>> patch 1 justifying the introduction of the new barriers.
>>
>> Only store-store reordering is required between QSLIST_REMOVE_HEAD and 
>> atomic_fetch_and(); and that one *is* blocked by atomic_fetch_and(), 
>> since mo_seq_cst is a superset of both mo_release.  The new barriers 
>> are needed for store-load reordering.
> 
> In patch 1 you say:
> 
> # in C11, sequentially consistent atomics (except for seq-cst fences)
> # only affect the ordering of sequentially consistent operations.
> 
> and the store in QSLIST_REMOVE_HEAD is not a sequentially consistent 
> operation.
> Therefore by your own logic we must have a separate barrier here.

You're right that the comment is contradictory.

It's the comment that is wrong.  The right text should be

---
in C11, with the exception of seq-cst fences, the order established by 
sequentially consistent atomics does not propagate to other memory 
accesses on either side of the seq-cst atomic.  As far as those are 
concerned, loads performed by a seq-cst atomic are just acquire loads, 
and stores are just release stores.  Even though loads that occur after 
a RMW operation cannot move above the load, they can still sneak above 
the store!
---

The first sentence is a more accurate way to say the same thing.  The 
rest sentence says what happens (mo_seq_cst downgrades to mo_acq_rel as 
far as those other accesses are concerned) and I missed the opportunity 
to include it because it didn't matter for the cases where the series 
added barriers---except now it matters for *not* adding barriers.

Now, I also said that I don't understand mo_acq_rel and that is indeed 
true.  Instead, in this case I'm basically treating mo_seq_cst as a 
superset of both mo_release (on the dequeue side) or mo_acquire (on the 
enqueue side), individually.

> I wonder if your definition/description of smp_mb__before_rmw() isn't 
> actively misleading in this case.
> 
> - We could drop it entirely and be less confusing, by not having to 
> explain it.
> - We could define it as  signal_barrier() for all hosts, simply to fix the
>    compiler-theoretic reordering problem.

The case that I was imagining for smp_mb__before_rmw() is something like 
this:

	wake_me = true;
	smp_mb__before_rmw();
	if (qatomic_xchg(&can_sleep, true)) { ... }

where you really need a full barrier.

Paolo


