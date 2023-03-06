Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CDA6AC35C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:33:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBtR-0004eb-OR; Mon, 06 Mar 2023 09:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZBt9-0004XH-V8
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:32:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZBt8-00053e-Ed
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678113146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKgCkURhYrc+f3m8VJeb4O209C7X2YrG4/RROikl9D4=;
 b=FlDiymFAZRsIrAu3RhkoTWs4AkD9bjTuohlTnRbKDcpc66aXmGBEjwUzqHxuiE6kr8rhqN
 +iJoa4z7+JbYtSKpiNGQ9CIEsyV1oQrtB94JqHM2acWVAIHcakRJ/F8d/4cqN+9B/bFLuT
 PKnkTr+XHuqhv+i5hMSDathd8fIA03c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-YCLwlmwkOYCF1iQm818big-1; Mon, 06 Mar 2023 09:32:24 -0500
X-MC-Unique: YCLwlmwkOYCF1iQm818big-1
Received: by mail-wr1-f71.google.com with SMTP id
 bx25-20020a5d5b19000000b002c7ce4ce3c3so1543483wrb.13
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678113143;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DKgCkURhYrc+f3m8VJeb4O209C7X2YrG4/RROikl9D4=;
 b=VpChDJAhSPhRmlIHnALvVyJrLVfNPPBByDu0ToQxy3SVWTjZ030CI6a+nmTkwcO3qm
 Knabtsrq3ORapLZyEOGlj6+MY57rR3bjfxnMibSANNef+U8MD2dzPt3UvFVNrqpH+d/p
 925cdQxDz4bl4EUUrjWowOxI/IJzdGFL5rsbLzsNt0Tz9dKGjhZ8DF3Lw0a1uMIoH3DL
 ZVJQPTkgCSCHZDfHIAZkVhmssXNAziyLmd7VmxCus1dmG1q0+Yx4qEl4IxJ9R9pVOBKr
 G/uluO0zDP+JNZd+VJ1r5F1yAI5yiUdGU97y+47SjhQxGSSnJTg0Jpe9KfjyQqShbTQ6
 xgEw==
X-Gm-Message-State: AO0yUKUgX7my+EfigI80+iOilHRVaFGNBpJjH1DpnSHhmoIEI37Dm+WB
 1QUNYjtKrxoQ2Q/fibV8mVYpBBlY/43p/emvdZ9dzTlnv9o4EhMhzQ9RXnwge0JieHoMlKFvi6b
 GrAH6PXH/9+qfyLc=
X-Received: by 2002:adf:fc52:0:b0:2c5:4a22:937c with SMTP id
 e18-20020adffc52000000b002c54a22937cmr9610248wrs.27.1678113143566; 
 Mon, 06 Mar 2023 06:32:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9Nl/i8vofcYTKJDo5Hm5JhWfPh7B7RhgUUtSMHvFtI8EE94fSUicowDQMZV49PSBXqhvoWfg==
X-Received: by 2002:adf:fc52:0:b0:2c5:4a22:937c with SMTP id
 e18-20020adffc52000000b002c54a22937cmr9610230wrs.27.1678113143225; 
 Mon, 06 Mar 2023 06:32:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 j4-20020adfff84000000b002cda9aa1dc1sm10045243wrr.111.2023.03.06.06.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:32:22 -0800 (PST)
Message-ID: <b6e703b4-d89e-e74e-985e-1d0f483719a4@redhat.com>
Date: Mon, 6 Mar 2023 15:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/8] qemu-thread-win32: cleanup, fix, document QemuEvent
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-4-pbonzini@redhat.com>
 <080ab2d0-1a6f-47e9-0f3f-33f5ef98d411@redhat.com>
 <5123f794-0d28-bfb6-3e79-41cfb70a9318@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <5123f794-0d28-bfb6-3e79-41cfb70a9318@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 06.03.23 15:20, Paolo Bonzini wrote:
> On 3/6/23 14:31, David Hildenbrand wrote:
>>>
>>> -    smp_mb_acquire();
>>> -    if (value == EV_SET) {
>>> -        /* If there was a concurrent reset (or even reset+wait),
>>> -         * do nothing.  Otherwise change EV_SET->EV_FREE.
>>> -         */
>>> -        qatomic_or(&ev->value, EV_FREE);
>>> -    }
>>> +
>>
>> [had the same thought on patch #2]
>>
>> IIUC, the "read first" is an optimization to not unconditionally dirty
>> the cache-line. But I assume we don't particularly care about that
>> optimization on the reset path.
> 
> Thinking more about it, the intended usage of QemuEvent is either
> 
>       qemu_event_reset();
>       if (!check()) {
>            qemu_event_wait());
>       }
> 
> or
> 
>       if (!check()) {
>           qemu_event_reset();
>           if (!check()) {
>                qemu_event_wait());
>           }
>       }
> 
> If we don't care on the reset path we care much less on the wait path.
> Should I remove it and go straight to the cmpxchg, just for peace of mind?

Sounds reasonable to me at could simplify qemu_event_wait a bit.

-- 
Thanks,

David / dhildenb


