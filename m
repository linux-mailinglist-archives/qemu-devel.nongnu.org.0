Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C05AE1A7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:55:54 +0200 (CEST)
Received: from localhost ([::1]:57510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTR3-0007Ii-Ni
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVTEN-000662-8Y
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:42:47 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVTEH-0004fP-LH
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:42:46 -0400
Received: by mail-wm1-x331.google.com with SMTP id k17so6396885wmr.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=fSAUsbwR0zWqO5Zur6O66fsTnV7KIsoWA8rlL7kmI1Q=;
 b=y5ti53Zz9EYYrVhHgG/eH2OaBswAhyvEkQRXSTXH7Dn5AC2gLSqpive4wk13kxJYgd
 jRvwDiIi0ztLuZxqwcpHVGedULKFu6gRtVyTixeUG+bev7m2nO7X7lUeAKyOhl2S/uDO
 QKdD7gQ1YXTpb6sQka9fTzQ5GpClg9IZI2ITp8eWPqsUiSIV1DI1akiHekvMF5LNxdTM
 b28uYaTRh2nRHXaG67TBXLuneVb8iD1P3ouUSFWbI6XzvaJZHK07bwOh3IPasg0aib1Z
 AOkzfBT7r4ndvC/fRP7UIMiDnjYy6ZQWm9ZP/0+k5vWscf5xpFRGk/vmMf7hMi7opd3/
 d7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fSAUsbwR0zWqO5Zur6O66fsTnV7KIsoWA8rlL7kmI1Q=;
 b=pk7HppmrfzYKAw2evDbYb87m3utvb0uJc7HcsH0Bwa3RoApyMQWWjIRDU8k6P7M2PZ
 aZvkWtwtrCmhuCDs+tL6aT9e4e0efLjyYp/QUHzM0crZStJ4OAwilL+1nSsKSQsY5AIr
 iEDqwDI9LcdBK22Ud/qFcfN9sx5Q0otNtKxK/tIK6lbdrwl+OlZttVnZVZjA861YJ/kj
 e9+mHSyQxmFUjiduUeVtBP0HZsR+4UFuIAwjcpi5qYUQ9vTozkBDX/kNpQvVWE0Ng+Mq
 BJ1r1SIMN8wSuEhRQ5EEpR1N5vJs28tN+30yE627IXxsPS+coGEVKWaQRuTlexdVbpFZ
 MJKg==
X-Gm-Message-State: ACgBeo37gm0YN8ihEqHlsXdiStWkYzr2ZaF2LIzey9AAUEwXQntADVrn
 FhNisxSU7cfHDzG310MGRHcMVA==
X-Google-Smtp-Source: AA6agR5bq7DHyhfQJQAxrZ8CEpfEF58lBABe61E6JH5GhqV7R7PkgcX5DdHlaCgFdIXQmDw2+iC3yQ==
X-Received: by 2002:a05:600c:34c5:b0:3a5:fd9d:7b2b with SMTP id
 d5-20020a05600c34c500b003a5fd9d7b2bmr12868617wmq.1.1662450159151; 
 Tue, 06 Sep 2022 00:42:39 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1?
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c4f8f00b003adf0ae0048sm10115426wmq.45.2022.09.06.00.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 00:42:38 -0700 (PDT)
Message-ID: <ca6afa63-4ba5-ae4a-2af8-d7c1df9fcc1d@linaro.org>
Date: Tue, 6 Sep 2022 08:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 6/6] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-7-richard.henderson@linaro.org>
 <80ce327e-4381-743d-fd63-3b04006e4228@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <80ce327e-4381-743d-fd63-3b04006e4228@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/5/22 22:28, Philippe Mathieu-Daudé wrote:
>> +    /*
>> +     * Allow target-specific additions to this structure.
>> +     * This may be used to cache items from the guest cpu
>> +     * page tables for later use by the implementation.
>> +     */
>> +#ifdef TARGET_PAGE_ENTRY_EXTRA
>> +    TARGET_PAGE_ENTRY_EXTRA
>> +#endif
>>   } CPUTLBEntryFull;
> 
> Alternatively declare a per-target structure in cpu-param.h
> and here:
> 
> typedef struct CPUTLBEntryTarget CPUTLBEntryTarget;
> 
> #ifndef TARGET_HAS_PAGE_ENTRY_EXTRA_STRUCT
> struct CPUTLBEntryTarget { }
> #endif

This was v1, more or less,
https://lore.kernel.org/qemu-devel/20220703082419.770989-2-richard.henderson@linaro.org/

In the end I thought the "extra" part confusing.
I was also concerned that I might be introducing
extra structure padding unnecessarily.


r~

