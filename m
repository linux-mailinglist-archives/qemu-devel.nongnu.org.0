Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A026718ED
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 11:27:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI5eB-0006tB-8q; Wed, 18 Jan 2023 05:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI5e9-0006sM-3a
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:26:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI5e7-0001vj-GK
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674037578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFemePCEp1/bfwSzBa9WjqHldOuSGzjyVm7zYuBjk4U=;
 b=Zrjidi78y35NBGVn1w498yGFLPwUmUL63Lesjjeo8uAwfHiWNZUvGPwQzxlm/eHZrHZ5HD
 YYpSv1LlxATt2d865EdxaST0gAXkGQXlZvkMc4JoXTAT8HFYrnhQG3tGOWP+DTbZ5E99sk
 PJVzTfZvoJg8qYxp6xjOh8oey5qkjRU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-CaeFxPWBNvyZlBty-gPD7g-1; Wed, 18 Jan 2023 05:26:16 -0500
X-MC-Unique: CaeFxPWBNvyZlBty-gPD7g-1
Received: by mail-qv1-f70.google.com with SMTP id
 y10-20020a056214016a00b0053545fd8b7fso100260qvs.5
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 02:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eFemePCEp1/bfwSzBa9WjqHldOuSGzjyVm7zYuBjk4U=;
 b=g6CN95+q9cHJ577GKlOcAiEs5rIiVw/f70u0Gaa/aEeiq1qu74qaYVcH5OMzZU+Bq9
 hd3hRGa1GjD+RUxBr7Kv4UnLH8gPPlxG1qjapuSEDQ3fib1izrxjokNkCvhMIxKrOVhI
 uBRw9wx+5ZrsxmDIYkTWe9UenRKEAnm+HTwOymaT4iyF9JUqFVLcxxeTsAHwx+muc8B9
 W4DbXMSCThsnWohAwcuj8foFDSByhFPNkzFNZRHlupGR0Q6I4krVr8peFRd1hX2hzlcJ
 t3aEyfrZg7kTMn1JS9P9IYKoXJCck4eEXKWKtMBtDxvzZk0+MHjNfONdQoij7kmcUQWj
 +9Lw==
X-Gm-Message-State: AFqh2kru4XEITLsaPhf8hUie++Zj473fRSjr80vw+pIc94NLXUUFMjOw
 bE5FuoMdr+vhXI6G5BzSBQk+WW8wBfWBoIzPustSzWRMcAtFdBDD5aZ5TuU75m84KEny0LkCsBd
 WPoyiH5aX6K0E4X0=
X-Received: by 2002:a05:622a:995:b0:3ad:797e:7314 with SMTP id
 bw21-20020a05622a099500b003ad797e7314mr10364233qtb.1.1674037576229; 
 Wed, 18 Jan 2023 02:26:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXudDkWgwOi9ZwnyExyAX7M8A9ZGc6gHYBf0AT5S02JnfiUXAryiHYP0Veq6K1X+LW6lTWflvg==
X-Received: by 2002:a05:622a:995:b0:3ad:797e:7314 with SMTP id
 bw21-20020a05622a099500b003ad797e7314mr10364203qtb.1.1674037575988; 
 Wed, 18 Jan 2023 02:26:15 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 r3-20020ac84243000000b003a5430ee366sm17142668qtm.60.2023.01.18.02.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 02:26:15 -0800 (PST)
Message-ID: <9bf4841b-57a6-b08d-3d39-cd79ad0036e3@redhat.com>
Date: Wed, 18 Jan 2023 11:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-4-pmorel@linux.ibm.com>
 <5cf19913-b2d7-d72d-4332-27aa484f72e4@redhat.com>
 <01782d4e-4c84-f958-b427-ff294f6c3c3f@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v14 03/11] target/s390x/cpu topology: handle STSI(15) and
 build the SYSIB
In-Reply-To: <01782d4e-4c84-f958-b427-ff294f6c3c3f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17/01/2023 17.56, Pierre Morel wrote:
> 
> 
> On 1/10/23 15:29, Thomas Huth wrote:
>> On 05/01/2023 15.53, Pierre Morel wrote:
>>> On interception of STSI(15.1.x) the System Information Block
>>> (SYSIB) is built from the list of pre-ordered topology entries.
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
...
>>> +typedef struct SysIBTl_container {
>>> +        uint8_t nl;
>>> +        uint8_t reserved[6];
>>> +        uint8_t id;
>>> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_container;
>>> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_container) != 8);
>>> +
>>> +/* CPU type Topology List Entry */
>>> +typedef struct SysIBTl_cpu {
>>> +        uint8_t nl;
>>> +        uint8_t reserved0[3];
>>> +        uint8_t reserved1:5;
>>> +        uint8_t dedicated:1;
>>> +        uint8_t polarity:2;
>>
>> Hmmm, yet another bitfield...
> 
> Yes, this is the firmware interface.
> If it makes problem I can use masks and logic arithmetic

It depends ... if we are sure that this will ever only be used with KVM on 
real s390x hardware, then bitfields are OK. If we think that this is 
something that could be implemented in TCG, too, I'd scratch the bitfields 
and use logic arithmetic instead...

I'm not too experienced with this CPU topology stuff, but it sounds like it 
could be implemented in TCG without too much efforts one day, too, so I'd 
rather go with the logic arithmetic immediately instead if it is not too 
annoying for you right now.

>>> diff --git a/target/s390x/kvm/cpu_topology.c 
>>> b/target/s390x/kvm/cpu_topology.c
>>> new file mode 100644
>>> index 0000000000..3831a3264c
>>> --- /dev/null
>>> +++ b/target/s390x/kvm/cpu_topology.c
>>> @@ -0,0 +1,136 @@
>>> +/*
>>> + * QEMU S390x CPU Topology
>>> + *
>>> + * Copyright IBM Corp. 2022
>>
>> Happy new year?
> 
> So after Nina's comment what do I do?
> let it be 22 because I started last year or update because what is important 
> is when it comes into mainline?

Honestly, I don't have a really good clue either... But keeping 2022 is 
certainly fine for me, too.

  Thomas


