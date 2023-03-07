Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DE56AE7D5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZagQ-0007fN-Fi; Tue, 07 Mar 2023 12:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZagM-0007bO-RL
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:00:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZagL-0002pd-6K
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678208455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1td8ybDP1TufmK21JdQKQrgj5cNw0xJ6P0ka1zyKT8=;
 b=a1oBCpaf4kAQV3pWwTWA0xmbecZQJCLNNXrebN5RjTFNrvEZm05ZEtooZZukroW6Az9vKq
 14tilQSZm7Z/cRfKYVHXucCd507O4Hhd0dY8ScCn/oVQ8tjsrd7EDK194gOo28Sd5xexB7
 uciLmK8GSybZEwvsOxcOemeg2zl7j0o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148--ALcMOGzOVeUPRJgvdHWig-1; Tue, 07 Mar 2023 12:00:53 -0500
X-MC-Unique: -ALcMOGzOVeUPRJgvdHWig-1
Received: by mail-ed1-f69.google.com with SMTP id
 y24-20020aa7ccd8000000b004be3955a42eso20040806edt.22
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208450;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f1td8ybDP1TufmK21JdQKQrgj5cNw0xJ6P0ka1zyKT8=;
 b=yre6LTpBszkbr4Nh8+Zl67ZRgfOtZjMVmIXa7RUcXyjXeq9cmN2BdCeaozrUR72UeJ
 h3/8tJVciJl+M8Nb3qUkV4yI7+MAg1LYsSQun3FqbUscbegALNoPkLcX86CyA2JqRT7y
 q7x+IVOoAsRIuqN5BTiu4hl8Jzg69ECXCKCNXmTXe8fdOAde6DnvVK0MToY7NjqEspMf
 7qYd+cmv5zH6NrZwyn0uJmGae4zzdu9I3hPpXvsK4eIAOGZhupHbMcXV2p2a3xb3se4T
 YM/1qodT/NGFhwT5KGVeWHCtbEt739jB9falYkRoYA6D5j3dSIzsCLNCcm+GZuW9lBic
 IISw==
X-Gm-Message-State: AO0yUKVzfz91bHTN0vmGWL2gPIv1p1fsOqEdWrvv4OAINYCS+9YR2s9u
 odvlpKqW+nSFlw/FJStW0ILwrOpCINimRdYoP7mCeYxEWe0xUhv79bcvrqZEVHI/13Z6KAr/XCp
 WvJUEi7QruUVieoA=
X-Received: by 2002:aa7:d7ca:0:b0:4ad:7c6c:537d with SMTP id
 e10-20020aa7d7ca000000b004ad7c6c537dmr13062990eds.33.1678208449883; 
 Tue, 07 Mar 2023 09:00:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+RImqsc9ZoifhYxLNa06ZKCWhJuJfMJ0/N1HEqTn85zUMlWsC3qhlFp6DKIgEkx3p+k8MaWA==
X-Received: by 2002:aa7:d7ca:0:b0:4ad:7c6c:537d with SMTP id
 e10-20020aa7d7ca000000b004ad7c6c537dmr13062969eds.33.1678208449609; 
 Tue, 07 Mar 2023 09:00:49 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 j12-20020a1709062a0c00b008f14cb68ddbsm6382286eje.91.2023.03.07.09.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 09:00:48 -0800 (PST)
Message-ID: <d33a6fda-5b38-c136-9ec0-3c07b2031cd4@redhat.com>
Date: Tue, 7 Mar 2023 18:00:47 +0100
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
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <d661c4dd-309b-be7c-e60e-a035ae787c14@linaro.org>
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

On 3/7/23 16:54, Richard Henderson wrote:
>>
>> Just to be safe, I tried modeling this with cppmem 
>> (http://svr-pes20-cppmem.cl.cam.ac.uk/cppmem/); support for 
>> compare-and-swap is very limited, therefore the test looks nothing 
>> like the C code(*), but it should be ok:
> 
> You do realize that QSLIST_REMOVE_HEAD is not a compare-and-swap, right?
> 
> #define QSLIST_REMOVE_HEAD(head, field) do {                             \
>          typeof((head)->slh_first) elm = (head)->slh_first;               \
>          (head)->slh_first = elm->field.sle_next;                         \
>          elm->field.sle_next = NULL;                                      \
> } while (/*CONSTCOND*/0)

Yes, the compare-and-swap is just how I modeled the enqueuing thread's 
fetch_or

         cas_strong_explicit(&x, 0, 1, mo_acquire, mo_acquire);
         x.load(mo_relaxed).readsvalue(1); // fetch_or returned 0
         y.store(1, mo_release);           // bh inserted

while QSLIST_REMOVE_HEAD in the dequeuing thread is not ordered at all:

         y.store(0, mo_relaxed);           // QSLIST_REMOVE_HEAD
         x.store(0, mo_release);           // fetch_and

> As I read aio_bh_queue, this is exactly the situation you describe in 
> patch 1 justifying the introduction of the new barriers.

Only store-store reordering is required between QSLIST_REMOVE_HEAD and 
atomic_fetch_and(); and that one *is* blocked by atomic_fetch_and(), 
since mo_seq_cst is a superset of both mo_release.  The new barriers are 
needed for store-load reordering.

Paolo


