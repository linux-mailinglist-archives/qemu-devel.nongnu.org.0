Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A59D3E29C4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:34:36 +0200 (CEST)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBy7X-0006Ha-LP
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBy4V-0003Jl-Tl
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:31:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBy49-00018Q-RU
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628249461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUOsgoLnzDJ5/+lcojwXbP6VPE+ZXcwPP/UxgvUIVNU=;
 b=dZwTJnYnPI03aQDYQqj7fqhi75fnPaEgwerXRkpeBfwaRcMi3G1ePyiUq7R0RSXgf5qvCu
 I5JuUWIqXIjAnULCibnd/vxuPWpwiG3jBWq6rXY9dlWvtBdL5rMiK9RW5BQ9itY2eRS9r1
 Q2usqaD3krQKLzzVk5s0qoKJAcJdC3s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-8pe2b71bNl-Vzr-XuzP9Og-1; Fri, 06 Aug 2021 07:31:00 -0400
X-MC-Unique: 8pe2b71bNl-Vzr-XuzP9Og-1
Received: by mail-wr1-f70.google.com with SMTP id
 o4-20020a5d47c40000b0290154ad228388so3029229wrc.9
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 04:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OUOsgoLnzDJ5/+lcojwXbP6VPE+ZXcwPP/UxgvUIVNU=;
 b=HAXoXTUXS8t5Ie2muKp0B8xsvQbYijTxdXGC6UI8GoOtw1iYpb5VjjHxafq4o8Zd8o
 nR+qXdePMC/rIHsQsm+FOsuDmR4zxIRKjycI1G++ZwLpG9IC8SEASiYX+6u7Gld5OPvO
 DunJT9n1j5cA+CgOD3BbYbYW6AQn0Y1wxTl+0GegzUSKqRHG5h2UuByH+jrRpveOdnpN
 DG7UNgFMc0phObpQ7ZQ9tWAOUlNy26Sor3ttax02UF+y2FI5+MAnYzGZKVg5Qu/W6hmZ
 Ss5zWH+RAjpFPwxJ6vmlXl4ZojBEYtnDlkNUipWEG5p47mNsQiJwpikBz59rGcYAwRoU
 O4Lg==
X-Gm-Message-State: AOAM531ARDvnhL3eA4pDNU7kHQK6PprTOl9iamx6fcZ0rbck1g7GQf8K
 kpZPVaSy0sQREJR3EaljqfJrCu5az4q3XJABr1+bn54bVuKBktE30BY9SBAKuQ219h1UYBwo4qH
 It7FA6MPZVo4Um8M=
X-Received: by 2002:adf:f710:: with SMTP id r16mr10361184wrp.124.1628249459634; 
 Fri, 06 Aug 2021 04:30:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyORR/dt8IRNjKq3R6HI5VvqwmAHvuT/HYmSscsB59csT5S/jS2qR9a7dmarM7HFYMa13tK3w==
X-Received: by 2002:adf:f710:: with SMTP id r16mr10361175wrp.124.1628249459468; 
 Fri, 06 Aug 2021 04:30:59 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id c204sm11660333wme.15.2021.08.06.04.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 04:30:59 -0700 (PDT)
Subject: Re: [PATCH v1] s390x/ioinst: Fix wrong MSCH alignment check on little
 endian
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20210805143753.86520-1-david@redhat.com>
 <875ywizupc.fsf@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <f699dbe2-1cbb-478a-3330-bd207da12055@redhat.com>
Date: Fri, 6 Aug 2021 13:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <875ywizupc.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 13:19, Cornelia Huck wrote:
> On Thu, Aug 05 2021, David Hildenbrand <david@redhat.com> wrote:
> 
>> schib->pmcw.chars is 32bit, not 16bit. This fixes the kvm-unit-tests
>> "css" test, which fails with:
>>
>>    FAIL: Channel Subsystem: measurement block format1: Unaligned MB origin:
>>    Program interrupt: expected(21) == received(0)
>>
>> Because we end up not injecting an operand program exception.
>>
>> Fixes: a54b8ac340c2 ("css: SCHIB measurement block origin must be aligned")
>> Cc: Halil Pasic <pasic@linux.ibm.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: Pierre Morel <pmorel@linux.ibm.com>
>> Cc: qemu-s390x@nongnu.org
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   target/s390x/ioinst.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Same question here: still -rc worthy, or not?
> 

It's been broken forever, this can also wait I guess.

-- 
Thanks,

David / dhildenb


