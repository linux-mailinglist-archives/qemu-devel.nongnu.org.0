Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDEF571742
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:25:10 +0200 (CEST)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBD4m-00023x-UY
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oBCok-0007Dh-5n
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:08:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oBCoh-0005df-VV
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657620511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5TBqzYWwbtsWIT+aQo5sjIiIFDW7ToxIUygQzu4YMI=;
 b=cuZDDHU651jr12clnP0bxWxgUxot1lBMTx4Zxe/ROzSvAkt+BlxrxqQ1tnu+MDW7LvxAAv
 VBv6EUuc2siFSNUEvdT0gDMNDyftJzJVWlIYdCngs6fsLB+UTyQXCT6RCqamC4leVccxTf
 Zh9FedQsIZBfy9RhcA6rjD8MS1ka/jo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-YSvfdXQoOR27XHo_jsfWCQ-1; Tue, 12 Jul 2022 06:08:27 -0400
X-MC-Unique: YSvfdXQoOR27XHo_jsfWCQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 j16-20020adfa550000000b0021d63d200a8so1259491wrb.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=z5TBqzYWwbtsWIT+aQo5sjIiIFDW7ToxIUygQzu4YMI=;
 b=Q3knslXgrVoxslox1O1OLdOpTFRNYZOWNxfx3zZTRLmrpK+h/KA6KOAHac8ygowzk3
 ulV9QGXk4vi56Xurr0T6GmxSdO/H7OjAOdYyWwR4cj8IUxj2xfroWoIvCawwPmOpZ/od
 sU3zxXYmWnVbT7NAfoA0Rtfx9Tdikg8xpDBH2Ijoagbkx6z8mwzheWKzG+uU+OJNEf0t
 sHF/R2JSSRu8f28GswAUNkihmiStMWhDA/GquZf9cwi/aBA38Dbq4siQx45rQbQAoxIr
 Aslwpwl0mMh64lZOSH9810If/3PSGBQqQCX7lpSScciADo3q6poB688lOoYh5owszRyy
 4ovA==
X-Gm-Message-State: AJIora+RQLChNRoNEDd3htg9sLtmrUIb9pR9F66qagSepAhtpjV6X2hl
 V46mvS79Sw+Vf7y4ipd1EB75pTbUC36U3C3/DQGUQUgZ0tE762p0ePRbfYK7MAm8dlG3PMwjGYd
 nUEaHHl9IQnUJ9Dg=
X-Received: by 2002:adf:f2cd:0:b0:21d:6913:6d32 with SMTP id
 d13-20020adff2cd000000b0021d69136d32mr21198831wrp.438.1657620506586; 
 Tue, 12 Jul 2022 03:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vFPXGqX9DKNKd5EL8C/hod1KIP3nj3o8nwXFhNOXcnrIHsROw0vkkcPWu/LUEkYcQ+dk8FMw==
X-Received: by 2002:adf:f2cd:0:b0:21d:6913:6d32 with SMTP id
 d13-20020adff2cd000000b0021d69136d32mr21198813wrp.438.1657620506295; 
 Tue, 12 Jul 2022 03:08:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d900:a75d:cddc:d29f:bdb3?
 (p200300cbc703d900a75dcddcd29fbdb3.dip0.t-ipconnect.de.
 [2003:cb:c703:d900:a75d:cddc:d29f:bdb3])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a5d4606000000b0021b866397a7sm8044143wrq.1.2022.07.12.03.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 03:08:25 -0700 (PDT)
Message-ID: <2dfdce60-6c8b-4874-a901-01e1ea37d976@redhat.com>
Date: Tue, 12 Jul 2022 12:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20220711185640.3558813-1-iii@linux.ibm.com>
 <20220711185640.3558813-3-iii@linux.ibm.com>
 <dd9d7b97-88c2-f1c3-8b0a-bb090059b180@linaro.org>
 <832533a5b27c9aee11fea7633ed401e655491d5b.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 2/3] hw/misc: Add mmio-debug-exit device
In-Reply-To: <832533a5b27c9aee11fea7633ed401e655491d5b.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.07.22 11:52, Ilya Leoshkevich wrote:
> On Tue, 2022-07-12 at 10:42 +0530, Richard Henderson wrote:
>> On 7/12/22 00:26, Ilya Leoshkevich wrote:
>>> System tests on x86 use isa-debug-exit device in order to signal
>>> success or failure to the test runner. Unfortunately it's not
>>> easily
>>> usable on other architectures, since a guest needs to access
>>> address_space_io, which may not be as straightforward as on x86.
>>> Also, it requires adding ISA bus, which an architecture might not
>>> otherwise need.
>>>
>>> Introduce mmio-debug-exit device, which has the same semantics, but
>>> is
>>> triggered by writes to memory.
>>>
>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>
>> You shouldn't need this for s390x, as there are already (at least)
>> two other paths to 
>> qemu_system_shutdown_request.
>>
>> E.g. SIGP, which has a stop option.
>>
>>
>> r~
>>
> 
> I would normally use lpswe + disabled wait, but this always gives me
> exit status code 0, which doesn't allow easily distinguishing between
> success and failure.
> 
> Code-wise SIGP seems to do roughly the same thing, and a quick
> experiment with:
> 
>     lgfi %r4,-1
>     lgfi %r5,-1
>     larl %r6,_cpuaddr
>     stap 0(%r6)
>     lh %r6,0(%r6)
>     nilh %r6,0
>     sigp %r4,%r6,5
> _cpuaddr: .short 0
> 
> confirmed that we get exit status code 0 as well.

disabled wait should trigger a qemu_system_guest_panicked().

But "panic_action == PANIC_ACTION_SHUTDOWN" seems to only make
qemu_main_loop() return with main_loop_should_exit() == true.

main/qemu_main will always return 0.

We could return != 0 on guest panic, but not sure if that could break
existing scripts. We'd need a new QEMU toggle for that most probably ...

-- 
Thanks,

David / dhildenb


