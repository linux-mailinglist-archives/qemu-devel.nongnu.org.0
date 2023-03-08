Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FCF6B10A5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 19:08:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZyD0-0007tG-CT; Wed, 08 Mar 2023 13:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZyCx-0007sv-TN
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 13:08:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZyCw-0006jH-7y
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 13:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678298889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCXWBkgrtGbv73GhMdtn4/zVRMru4ez1GoDPsj8CV7I=;
 b=SIERLPJrIaiyTDVQyyBUZzA32cUGJx9NkPbxxLk9iI9I3MBwvXpKPTfkZByFQYcBaRJXSA
 O6mO8/49oixsRrDkxdb1/6IGSioJvYMQARDLg8DjE+ubP2MVQ7t6EiCYfMHOCTl257M7j1
 eaLWi/9s8ULHqS+cPyHU/eIKr7ogYZw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-O9fCpXeNM3W9rbtohqVYDg-1; Wed, 08 Mar 2023 13:08:08 -0500
X-MC-Unique: O9fCpXeNM3W9rbtohqVYDg-1
Received: by mail-ed1-f70.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so25343273edb.21
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 10:08:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678298887;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CCXWBkgrtGbv73GhMdtn4/zVRMru4ez1GoDPsj8CV7I=;
 b=G2OoiAfxObfIZ3Ar2PQAs3F0Hnh+h3bvH+6BZndrF58ia0P47faoprCuKe/1w/9A+7
 STmoBIvZCVe6DnsXKDz6g5HMuHIsNZNhUH97cJE+EHwSUOzBocriPz4SfdRlZCEoOG3M
 LsnwwRViNvu9BQxJr0ioPu8Jekt6WhxTNG0G5pJyZcjNQ6R0f+F6R/uFelG0HobRPRpC
 X7VHPl6IQHjeH7jjhNGKzyuR1KL+uiFDhtnzMVEdUJHBhJS7bdM7kKB8DZ+u+c/4nGv/
 2kpIUDOEIQBADooilczG+x1NUrbZJjZ+dPgBe7os88Jnk8L4jvNJEcIYIu0PwhYsnfLB
 nXdg==
X-Gm-Message-State: AO0yUKVQx1vHRRU9hg1dJ2exHYF6H8p1lYw/SadjBAtkhbxeyCEp7pl2
 HXQKd62D+O/do/6LqVEamDGH+a4ZhpYiT1iiNhNZAx2xQl/HC7j588kaRCH5fA06eyaRemxBETY
 eMyn3I7djn45p+4A=
X-Received: by 2002:a17:906:ee9:b0:8af:2bb3:80d7 with SMTP id
 x9-20020a1709060ee900b008af2bb380d7mr23239647eji.31.1678298887397; 
 Wed, 08 Mar 2023 10:08:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8OIOjZjsXhCRzHZnJswLiKEFcgLBcLkjHJM7EXotLCb3OmK5pRpH11cYFRz6Rqr1/SttZ+2A==
X-Received: by 2002:a17:906:ee9:b0:8af:2bb3:80d7 with SMTP id
 x9-20020a1709060ee900b008af2bb380d7mr23239620eji.31.1678298887080; 
 Wed, 08 Mar 2023 10:08:07 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 v16-20020a50a450000000b004af6c5f1805sm8575826edb.52.2023.03.08.10.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 10:08:06 -0800 (PST)
Message-ID: <b7af7150-af5d-de86-e237-7dafa326b862@redhat.com>
Date: Wed, 8 Mar 2023 19:08:05 +0100
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
 <9da5c9c5-0675-157d-f099-2b0b14c26002@redhat.com>
 <3c2362c4-1d2f-f749-db1e-201d985e67be@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <3c2362c4-1d2f-f749-db1e-201d985e67be@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 3/8/23 17:47, Richard Henderson wrote:
>> The case that I was imagining for smp_mb__before_rmw() is something 
>> like this:
>>
>>      wake_me = true;
>>      smp_mb__before_rmw();
>>      if (qatomic_xchg(&can_sleep, true)) { ... }
>>
>> where you really need a full barrier.
> 
> What is different about this that doesn't apply to the remove-head case 
> we've been talking about?

For remove-head, nothing is going to change the BH_PENDING flag while 
the code runs.  This would be an okay transformation of the code, at 
both the compiler and the processor level:

   // first part of atomic_fetch_and
   old_flags = LDAXR of bh->flags

   // QSLIST_REMOVE_HEAD ends up between load and store of
   // atomic_fetch_and
   all the loads and stores for remove-head

   // second part of atomic_fetch_and
   new_flags = old_flags & ~(BH_PENDING|BH_SCHEDULED|BH_IDLE);
   (successful) STLXR of new_flags into bh->flags


Instead in the case above, I was thinking you would get a missed wakeup 
without the barriers.  Here is the full pseudocode:

   // this store can move below the load of can_sleep
   qatomic_set(&wake_me, true);
   if (qatomic_xchg(&can_sleep, true)) sleep;

   // this store can move below the load of wake_me
   qatomic_set(&can_sleep, false);
   if (qatomic_xchg(&wake_me, false)) wake them;

The buggy case is where the threads observe can_sleep = true, wake_me = 
false, i.e. the original value of the variables.  Let's look at it with 
CPPMEM.

Like before, the CPPMEM test must use CAS and .readsvalue() to hack 
around the lack of "if"s.  Two .readsvalue() clauses represent the buggy 
case, so we are all good if there is *no* consistent executions.

Unfortunately, it fails:

   // 2 consistent (i.e. buggy) executions
   int main() {
     atomic_int w = 0;
     atomic_int s = 1;
     {{{
       { w.store(1, mo_relaxed);
         // the buggy case is the one in which the threads read the
         // original value of w and s.  So here the CAS writes a
         // dummy value different from both 0 and 1
         cas_strong_explicit(&s, 0, 99, mo_seq_cst, mo_seq_cst);
         s.load(mo_relaxed).readsvalue(1); }
     |||
       { s.store(0, mo_relaxed);
         // same as above
         cas_strong_explicit(&w, 1, 99, mo_seq_cst, mo_seq_cst);
         w.load(mo_relaxed).readsvalue(0); }
     }}}
   }

It works with barriers, which models the extra smp_mb__before_rmw():

   // no consistent executions (i.e. it works)
   int main() {
     atomic_int w = 0;
     atomic_int s = 1;
     {{{
       { w.store(1, mo_relaxed);
         atomic_thread_fence(mo_seq_cst);
         cas_strong_explicit(&s, 0, 99, mo_relaxed, mo_relaxed);
         s.load(mo_relaxed).readsvalue(1); }
     |||
       { s.store(0, mo_relaxed);
         atomic_thread_fence(mo_seq_cst);
         cas_strong_explicit(&w, 1, 99, mo_relaxed, mo_relaxed);
         w.load(mo_relaxed).readsvalue(0); }
     }}}
   }

I think I agree with you that _in practice_ it's going to work at the 
processor level; the pseudo-assembly would be

   r1 = LDAXR(can_sleep);
                                    r2 = LDAXR(wake_me);
                                    STR(can_sleep, false);
                                    STLXR(wake_me, false); // successful
   STR(wake_me, true);
   STLXR(can_sleep, true); // successful (?)
   if r1 == 0 { ... }
                                    if r2 != 0 { ... }

and I can't think of a way in which both store-exclusives (or xchg, or 
cmpxchg) would succeed.  So perhaps smp_mb__before_rmw() could indeed be 
a signal_fence().  But that's quite scary even for the standards of this 
discussion...

Paolo


