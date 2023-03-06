Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C793D6AC16D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:36:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAzL-0001y5-3J; Mon, 06 Mar 2023 08:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAyV-0001kA-5b
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:33:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAyA-00083b-AN
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:33:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VAdPYUQ6/bVhAqJhrqJB7n2pZziU0nuC+ragjlpKgM=;
 b=KLZ42f0NCPpb7CgVz319TJ53mC4NrM2K+1Dwnz+ItHJOqjtDSzVR/VXx3OnmwO8FAFZTxd
 q3dyqdDx2OEAGqzDuDVK88ZsKfM0iKpuvZaYQFaopD8PKyr3NNYDmHPj03eQREH3dvLGcX
 tiip+gFDySftdXfR96Cb4Pm5ojd7dLk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-KiH5e01GPoueetrVZ0zy6A-1; Mon, 06 Mar 2023 08:33:36 -0500
X-MC-Unique: KiH5e01GPoueetrVZ0zy6A-1
Received: by mail-wm1-f70.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so6749156wmj.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109615;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3VAdPYUQ6/bVhAqJhrqJB7n2pZziU0nuC+ragjlpKgM=;
 b=kSsvEssnLjuykcyzCWjnyqLuCNsZWr3dd/JV3oSB/+rTeE9tlFSxHjo2xkntiTRY1a
 gQUuS3UyD6LS1JpmCRojCksUEoF95pV2iVq2qiBByCTFmhAu7F3HxbxHtW3GdAA7CNuZ
 BPfVdTYXkPNa4M6EXKwNdDDgWRwXuVOR0dm2oFPbB21YhLl/+u2hYhDPgnotXZPweN8X
 mAOGCUh/sTgbeW7fOuAsppGAy7hItGUn+f9mEvnfTLcQSC4+hJ0E0E6LEZDFAcuyUNIM
 PUfJkvOemk1YZ81iDaRdi/9l4ieGwPFRPgpHwQTnPzC6qybJE72R53BmAxjVqSoiciIB
 HliA==
X-Gm-Message-State: AO0yUKX1SqTYi10ECfWjMukYJDOIPDiUcGug9UA96vicbusSWRA+d9kz
 eynXlFGFF+tlcN1QaC31RGmxL+AM74V7CVDURbm00NlhKFCrkmsG497CHwqgVh03+xVjptmKpHC
 AiK9To+RA11ripOA=
X-Received: by 2002:adf:f58d:0:b0:2ca:8da1:db96 with SMTP id
 f13-20020adff58d000000b002ca8da1db96mr7442314wro.50.1678109614967; 
 Mon, 06 Mar 2023 05:33:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8ADUEUnYYyZ5IXlAnu0Q2WRMkfKxH82kEtilnPIKEF60BDWgi/8dz1bfT03mfDmQJamUzPNQ==
X-Received: by 2002:adf:f58d:0:b0:2ca:8da1:db96 with SMTP id
 f13-20020adff58d000000b002ca8da1db96mr7442299wro.50.1678109614639; 
 Mon, 06 Mar 2023 05:33:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a5d5150000000b002c559843748sm9925277wrt.10.2023.03.06.05.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:33:34 -0800 (PST)
Message-ID: <476a9abf-a4f4-bc0c-02f6-06c24061b782@redhat.com>
Date: Mon, 6 Mar 2023 14:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 7/8] qemu-coroutine-lock: add smp_mb__after_rmw()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-8-pbonzini@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230303171939.237819-8-pbonzini@redhat.com>
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
> mutex->from_push and mutex->handoff in qemu-coroutine-lock implement
> the familiar pattern:
> 
>     write a                                  write b
>     smp_mb()                                 smp_mb()
>     read b                                   read a
> 
> The memory barrier is required by the C memory model even after a
> SEQ_CST read-modify-write operation such as QSLIST_INSERT_HEAD_ATOMIC.
> Add it and avoid the unclear qatomic_mb_read() operation.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   util/qemu-coroutine-lock.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
> index 58f3f771817b..84a50a9e9117 100644
> --- a/util/qemu-coroutine-lock.c
> +++ b/util/qemu-coroutine-lock.c
> @@ -201,10 +201,16 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
>       trace_qemu_co_mutex_lock_entry(mutex, self);
>       push_waiter(mutex, &w);
>   
> +    /*
> +     * Add waiter before reading mutex->handoff.  Pairs with qatomic_mb_set
> +     * in qemu_co_mutex_unlock.
> +     */
> +    smp_mb__after_rmw();
> +
>       /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
>        * a concurrent unlock() the responsibility of waking somebody up.
>        */
> -    old_handoff = qatomic_mb_read(&mutex->handoff);
> +    old_handoff = qatomic_read(&mutex->handoff);
>       if (old_handoff &&
>           has_waiters(mutex) &&
>           qatomic_cmpxchg(&mutex->handoff, old_handoff, 0) == old_handoff) {
> @@ -303,6 +309,7 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
>           }
>   
>           our_handoff = mutex->sequence;
> +        /* Set handoff before checking for waiters.  */
>           qatomic_mb_set(&mutex->handoff, our_handoff);
>           if (!has_waiters(mutex)) {
>               /* The concurrent lock has not added itself yet, so it

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


