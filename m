Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C212A6AC16C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:36:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZB0i-0004N2-FR; Mon, 06 Mar 2023 08:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZB0U-0003nS-3z
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:36:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZB0R-0000Dt-0g
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QvCg97qR7UykgoWq8lqMjy3/eGpeyrTGqbvUPniglTA=;
 b=b1prnsbCT804vqK1OCEdd6N8xnnbCIlBgSePQF/+7GkEOCGdpaHM3x5NtOMmmxg2yuC/+2
 v3iisY/FS9ig9qN6lO7ptFlxY4IMphoTQkkTuSQVqpgDC4T7d48v+xsZNBkZnyp5QiMkv5
 r4z5ZUuN7Bg6qxYHZo1jk+/SqidDCCw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-CANTiVJHOYu1EE8PpLR6xg-1; Mon, 06 Mar 2023 08:35:55 -0500
X-MC-Unique: CANTiVJHOYu1EE8PpLR6xg-1
Received: by mail-wr1-f71.google.com with SMTP id
 m7-20020a056000008700b002c7047ea429so1494444wrx.21
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109755;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QvCg97qR7UykgoWq8lqMjy3/eGpeyrTGqbvUPniglTA=;
 b=qAF1gW1ERg5hMZKZbicvJ5CQ4CiSnmpKr1A/9QrPAoj2Q6k7p0yCIqWLGGsY+Lrwrp
 m2ukJUDJEVcwkaaIRTm16SNClFYKba16BZnNR7UhCyF1ZYxinHq7EddZuFTU2BtBF7wh
 h+/JVwnI0DnKR+PmD2VgqlYZlCqqIT/AuHZQQy/3YLrN8O6XggQbSEkUpJvfBEs+cvBl
 OzxoI8WcpL/LdOqsNyrwzplf4KX6W2OEuDeC8n/q1mBxZgnfq3kMkFLt3InLS7MLedY7
 goRkq9s82Phplna4plsjnp70A8Xe5yoqhnEo2gRykKqm08xGzekF0ecOM5ZYhbIEo4Fa
 ZI6w==
X-Gm-Message-State: AO0yUKU2eEj206HqKwkvxr+/qOOtlKozFfFFkmB57WwZxGGK7f0RnCrt
 Gg1P6zJEJHRPfUcukU88gmUX8cVmcc0QTnT0DEZXh9du8IsdBM+IfP197Gs6yEOHUMwDXj2gmUD
 kuTCj9Ohvjzu1s3Y=
X-Received: by 2002:a05:600c:1e10:b0:3eb:39e0:3530 with SMTP id
 ay16-20020a05600c1e1000b003eb39e03530mr8929555wmb.41.1678109754821; 
 Mon, 06 Mar 2023 05:35:54 -0800 (PST)
X-Google-Smtp-Source: AK7set9xzEEdNhI9csu/E1uZaz08MunpDBST7z/rImbatxpWJ0eA/zUoHtKyinpRTIBg0sdJh37log==
X-Received: by 2002:a05:600c:1e10:b0:3eb:39e0:3530 with SMTP id
 ay16-20020a05600c1e1000b003eb39e03530mr8929534wmb.41.1678109754451; 
 Mon, 06 Mar 2023 05:35:54 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056000114e00b002c57475c375sm10097553wrx.110.2023.03.06.05.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:35:54 -0800 (PST)
Message-ID: <84e0bb51-c731-eeaa-f042-d8b54022fc2c@redhat.com>
Date: Mon, 6 Mar 2023 14:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/8] Fix missing memory barriers on ARM
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230303171939.237819-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 03.03.23 18:19, Paolo Bonzini wrote:
> This series fixes more instances of the problem fixed by commits
> 5710a3e09f9b ("async: use explicit memory barriers", 2020-04-09) and
> 7455ff1aa015 ("aio_wait_kick: add missing memory barrier", 2022-06-24).
> This is an interesting case where ARM's memory ordering is somewhat
> stronger than what you would expect.
> 
> On ARM, seqcst loads and stores (which QEMU does not use) are compiled
> respectively as LDAR and STLR instructions.  Even though STLR is also
> used for store-release operations, STLR followed by LDAR provides
> store-against-load ordering, which is stronger than a store-release.
> Compare this to ARMv7, where store-release is DMB+STR and store-seqcst
> is DMB+STR+DMB.
> 
> This means that on ARM a sequence of
> 
>    qatomic_store_release(&y, ...);         // STLR
>    a = qatomic_load_acquire(&x);           // LDAR
> 
> provides stronger ordering at the processor level than the two MOV
> instructions you'd get on x86.
> 
> Likewise, on ARM sequentially consistent read-modify-write operations only
> need to use LDAXR and STLXR respectively for the load and the store, which
> is weaker than the LOCK prefix used on x86.
> 
> In a strange twist of events, however, the _stronger_ semantics
> of the ARM instructions can end up causing bugs on ARM, not on x86.
> The problems occur when seqcst atomics are mixed with relaxed atomics.
> Here is how the two are compiled on ARM:
> 
>                     load              store
>     relaxed         LDR               STR
>     seqcst          LDAR              STLR
> 
> QEMU's atomics try to bridge the Linux API (that most of the developers
> are familiar with) and the C11 API, and the two have a substantial
> difference:
> 
> - in Linux, strongly-ordered atomics such as atomic_add_return() affect
>    the global ordering of _all_ memory operations, including for example
>    READ_ONCE()/WRITE_ONCE()
> 
> - in C11, sequentially consistent atomics (except for seqcst fences)
>    only affect the ordering of sequentially consistent operations.
>    In particular, since relaxed loads are done with LDR on ARM, they are
>    not ordered against seqcst stores (which are done with STLR).
> 
> QEMU implements high-level synchronization primitives with the idea that
> the primitives contain the necessary memory barriers, and the callers can
> use relaxed atomics (qatomic_read/qatomic_set) or even regular accesses.
> This is very much incompatible with the C11 view that seqcst accesses
> are only ordered against other seqcst accesses, and requires using
> seqcst fences as in the following example:
> 
>     qatomic_set(&y, 1);            qatomic_set(&x, 1);
>     smp_mb();                      smp_mb();
>     ... qatomic_read(&x) ...       ... qatomic_read(&y) ...
> 
> Bugs ensue when a qatomic_*() read-modify write operation is used instead
> of one or both stores, for example:
> 
>     qatomic_<rmw>(&y, ...);
>     smp_mb();
>     ... qatomic_read(&x) ...
> 
> Developers that are more familiar with the Linux API may be tempted
> to omit the smp_mb() and that's exactly what yours truly did in
> qemu_event_set() and qemu_event_reset().  After a27dd2de68f3 ("KVM:
> keep track of running ioctls", 2023-01-11), this caused hangs due to
> threads sleeping forever in qemu_event_wait().
> 
> This _could_ also have been the cause of occasional hangs of rcutorture,
> though I have not observed them personally.
> 
> (As an aside, GCC's older __sync_* builtins *did* provide a full barrier
> between the RMW operation and loads on the side of the operation.  The
> difference between seqcst C11 atomics and __sync_* atomics is exactly
> an extra memory barrier after the STLXR instruction).
> 
> In order to fix this, while avoiding worse performance from having two
> back-to-back memory barriers on x86, patch 1 introduces optimized
> memory barriers smp_mb__before_rmw() and smp_mb__after_rmw().  The usage
> is similar to Linux's smp_mb__before/after_atomic(), but the name is
> different because they affect _all_ RMW operations.  On Linux, instead,
> they are not needed around those RMW operations that return the old value.
> 
> The remaining patches add them everywhere they are needed.  In the
> case of QemuEvent (patches 2-3), I reviewed the algorithm thoroughly,
> dropping barriers that were not necessary and killing optimizations that
> I wasn't entirely sure about.  For the other cases, instead, the changes
> are minimal.
> 
> Note: I have a follow-up set of patches that gets rid completely of
> atomic_mb_read(); atomic_mb_set() instead can remain and mimic Linux's
> smp_store_mb() operation.  A glimpse of these changes is already visible
> in patches 7 and 8.

That sounds interesting. I was briefly confused about atomic_mb_* ...


... do we want to add some Fixes: tags or is it too hard to come up with 
something reasonable?

-- 
Thanks,

David / dhildenb


