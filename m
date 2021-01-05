Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E985E2EA145
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 01:08:34 +0100 (CET)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZtq-0007ch-0d
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 19:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZs6-0006mr-20
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 19:06:47 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZs3-00061k-Lt
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 19:06:45 -0500
Received: by mail-pj1-x1035.google.com with SMTP id b5so618560pjk.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 16:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ULVvpVOfV5cifHagk39cX+/hxyRhrvKYcE2+y9e4rNI=;
 b=DgGnvm3ComJz//QKZDR2TFLSFdWFydaMbro5ZIbcOdH93c9iVUfqCb8vgnulErAulu
 1zVPxQEWVWxmBEMBFaqgQ/n+UNvnIhpd5P9KxGyMP7QaoG7KXnD1f4fs1QDZTv8bJCpJ
 Onte51Z/3cSKa5wjTfSyCpY9mSZdOh9dqFIKohK+cplV8C28CM4/Jqr+4cmGeQApTvYd
 eRqhnrSkE0CY79QrGvSeYFM4zH+0I+0bOi1nCOGMkWlEnWYARNz6gad4rjLP4QyEgoAJ
 6VvUXb7gOY9KlvzeKDLHYh0SgTFOxDc9URoraJmLoipi4i2ni7UToTGqCHvdZAwbpBWF
 WI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ULVvpVOfV5cifHagk39cX+/hxyRhrvKYcE2+y9e4rNI=;
 b=Od3f99lx1kWB3xk6OhJzQumz/10Fvw2fk6R0u5oW+LKL18CKUIkQCJ2ynTWpu7MiOV
 /k5bdtHYnSz6E0xMe/ZnIz7YZkd79hTIKnMgl599MVGw8xW8eNaZob95zEwMQz04UtMz
 pOyupDa5KGN2g+0FOCWo/a2ZyZo9bwMbJZAFOVHJwl59OuPWXDLZy5jiaSjP4Egwifwp
 Ailf0I+eneTyFCeYPLH5skf4IvWDOjrobXRL5PCb383eAYUS2sGzsmu04mKkqSaLHp+/
 3GoUw9NfGy5OPD9tysDmH1m1ThQySmqmV7NzRgiMReNJwvFQfhK0Jj9hFuh5pQaW05/0
 Iatg==
X-Gm-Message-State: AOAM5330SCS4g2sH00l7rpq6/Lq/NpCEJ75SYQlvKMVZyZ9DJTh7xuJM
 DsmJ/yM0gswqaTG3qir4/m3OiA==
X-Google-Smtp-Source: ABdhPJy2h4sPC5eDtwPSmlmx0zNmN0eAsaPdsRvJ7ylcs0ksJxwnlJGCvsRACeA+sCVWIKZxjqmsYg==
X-Received: by 2002:a17:90a:d90e:: with SMTP id
 c14mr1294242pjv.85.1609805201834; 
 Mon, 04 Jan 2021 16:06:41 -0800 (PST)
Received: from [10.25.18.35] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id gm18sm440239pjb.55.2021.01.04.16.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 16:06:41 -0800 (PST)
Subject: Re: [PATCH v5 0/2] util/oslib: qemu_try_memalign() improvements
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201021173803.2619054-1-philmd@redhat.com>
 <606cf522-d23e-10aa-2bb5-61c5ba1dcdcb@linaro.org>
Message-ID: <8d2d61a4-5102-bd93-b057-870eb6e805ef@linaro.org>
Date: Mon, 4 Jan 2021 14:06:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <606cf522-d23e-10aa-2bb5-61c5ba1dcdcb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 9:24 AM, Richard Henderson wrote:
> On 10/21/20 12:38 PM, Philippe Mathieu-Daudé wrote:
>> - Use _aligned_malloc for qemu_try_memalign on win32
>> - Assert qemu_try_memalign() alignment is a power of 2
>>
>> Since v4:
>> - Drop superfluous assert (Richard)
>>
>> Philippe Mathieu-Daudé (1):
>>   util/oslib: Assert qemu_try_memalign() alignment is a power of 2
>>
>> Richard Henderson (1):
>>   util/oslib-win32: Use _aligned_malloc for qemu_try_memalign
>>
>>  util/oslib-posix.c |  2 ++
>>  util/oslib-win32.c | 12 +++++-------
>>  2 files changed, 7 insertions(+), 7 deletions(-)
>>
> 
> Ping.

Ping2.  Shall I just queue this to tcg-next?


r~

