Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C916AC302
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:21:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBhg-0003mo-Mr; Mon, 06 Mar 2023 09:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZBhf-0003m7-50
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:20:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZBhd-0002So-N9
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678112437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rs2OAgaBFXxs73i+ItIWzD5wC8CptROjlg7LQbvYKxg=;
 b=XbKyJRmAfkoiQ4jIndHXO3ZNM0epY/UC3vuS3hQEeKALylh62RLbBwqRRkhPGPSilLTjE4
 XS40QgbL4xEcnnWllFVlk0Lp242cqbmk216IYSCH7ULGZG73QL2yBA/7vk2Umtt8qH7sX7
 dlC4dvlGYCq6ZjG+pD7L8ww/PV4jk6M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-6GwzP-llN4ayYSjfufNvOA-1; Mon, 06 Mar 2023 09:20:35 -0500
X-MC-Unique: 6GwzP-llN4ayYSjfufNvOA-1
Received: by mail-ed1-f69.google.com with SMTP id
 d35-20020a056402402300b004e37aed9832so4684214eda.18
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112434;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rs2OAgaBFXxs73i+ItIWzD5wC8CptROjlg7LQbvYKxg=;
 b=eJmRwGjRgGuOddVxIk19tyxn8pjYHugMrNGGY4i7x7L5Z013lnhXPzjsJjAS2bsogC
 CyUdFEXNcncM97Bnt4Lj24Nz8PTu3jELNt26kpFWTLAKZ+PlKZ4uHe1cPOiZD9/MD0je
 tm/zicDpc22RIPu4Z55wMZyihki9OV1m0T8Z4C2NH5Wcry1VYOjo0twyjUy3/i/ucekX
 AExyWYRDPGDL7A7l9cRr0UdTqGhu7nk/s0Ful+So52FxgAIE2dMu+kARkO0ZZ2QYxVeh
 9qg77uvb+IXG7ecNAP5iQQi7fYbnxjYXwKrxTv0h3J+flqFNI6pqEpkHRUeHI0FmuSL8
 dKCw==
X-Gm-Message-State: AO0yUKXwYGmJtxUezZRTd/DFCzMzeOFLKQTM8VGHZvPJLFI4/pBqx7Q3
 +FCeLXpioV1K1MAfqKarbD8J+mHBjuTlwWLLB8kaSEfHwkGuOsDRddZlZ9v2wYwZ/BTXo5LR85H
 fEKXJ8L16HCEfTe4=
X-Received: by 2002:a17:907:8e9a:b0:86a:833d:e7d8 with SMTP id
 tx26-20020a1709078e9a00b0086a833de7d8mr12030857ejc.17.1678112434689; 
 Mon, 06 Mar 2023 06:20:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+QQT2Ml8LBOBv3SaVCQx2LPD3NTpbvN8ey0qyHVeUydqBD4WV/HsZQbz1ZEpDQZLHMwpAitQ==
X-Received: by 2002:a17:907:8e9a:b0:86a:833d:e7d8 with SMTP id
 tx26-20020a1709078e9a00b0086a833de7d8mr12030837ejc.17.1678112434360; 
 Mon, 06 Mar 2023 06:20:34 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 de19-20020a1709069bd300b008ec4333fd65sm4630752ejc.188.2023.03.06.06.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:20:33 -0800 (PST)
Message-ID: <5123f794-0d28-bfb6-3e79-41cfb70a9318@redhat.com>
Date: Mon, 6 Mar 2023 15:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/8] qemu-thread-win32: cleanup, fix, document QemuEvent
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-4-pbonzini@redhat.com>
 <080ab2d0-1a6f-47e9-0f3f-33f5ef98d411@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <080ab2d0-1a6f-47e9-0f3f-33f5ef98d411@redhat.com>
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

On 3/6/23 14:31, David Hildenbrand wrote:
>>
>> -    smp_mb_acquire();
>> -    if (value == EV_SET) {
>> -        /* If there was a concurrent reset (or even reset+wait),
>> -         * do nothing.  Otherwise change EV_SET->EV_FREE.
>> -         */
>> -        qatomic_or(&ev->value, EV_FREE);
>> -    }
>> +
> 
> [had the same thought on patch #2]
> 
> IIUC, the "read first" is an optimization to not unconditionally dirty 
> the cache-line. But I assume we don't particularly care about that 
> optimization on the reset path.

Thinking more about it, the intended usage of QemuEvent is either

     qemu_event_reset();
     if (!check()) {
          qemu_event_wait());
     }

or

     if (!check()) {
         qemu_event_reset();
         if (!check()) {
              qemu_event_wait());
         }
     }

If we don't care on the reset path we care much less on the wait path. 
Should I remove it and go straight to the cmpxchg, just for peace of mind?

Paolo


