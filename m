Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E53F1E5D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:52:32 +0200 (CEST)
Received: from localhost ([::1]:57924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGlHL-00032H-P4
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGlFt-00023l-87
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:51:01 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGlFr-0000Hi-Mu
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:51:00 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t1so6468931pgv.3
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DAy9K5Dk6cCjC8JMG7DbxZJASbH7spHP3sfgl78LUxk=;
 b=K/R/NKuG85OtmCXEVXW/aGrlt8WCvMOptDDuTY3nZpHftgZ4M6av9Wi/hUj8WeNp3a
 BRI2b/hAlcn/IimlK7zDyzRQETAe8i5Iy5OIeF5mPIIZdEfWqmXtRFcD7luJW73D/4pI
 XxNJKYOEjSbJlvs7p+jODWHp/Wq4eO3g94ciBE1IFWYZigNWMS6Cv+m53n6MxdQLuq97
 mGCrl7aOyd3TjT61dFoK+E+5o3EeI1tObkvQfDof8rHHZ38rfVnW196zC7b+veLFHSXN
 D38Gb81IS2Pm/aZrlvyEpokyiVfqQt0+jFFDOxMeiONhS9ChCQIy/8bfV1ZMl4wCCE/4
 HF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DAy9K5Dk6cCjC8JMG7DbxZJASbH7spHP3sfgl78LUxk=;
 b=h6btlb4GUtpk6D8L1p9g/u8SJlwiXe2TNiEPKQ3NRKn0Ogah866GU16FkqaJMUGosw
 Q3+8aIyBYW8cWIL9qlF6BlkoeDOr2PPRQJcEqWL/A2MMN3rXshgZK22kDtO82ExQg6cy
 /OR6rhGcPpWinljewwuvC6BMf/bKsSBwRMHUNS7EJ9xl8KjdUb1K2It2dGsiRN9D5izV
 yMLgK0wRHPuaEqToxmbl8xl2MsgkcBUnoGR2LGIntSjbfIyBxCh8T6mKyMpqvUqkt9Y3
 rTDgFMtQQKJe+ZIrsBJXV1exULJ0EoJMw+gJuDUwpj7Cf3ODhEk7r5vYCj1tki78ayGZ
 xsuw==
X-Gm-Message-State: AOAM5332oPu5MuT4iGJ0nj7y5T6IjtudOzxDIgCbjg3oBfaOI4iCQxHy
 nEPnHFD/+/+5A97x03U/tKmXWQ==
X-Google-Smtp-Source: ABdhPJyVGcTSNFZIYNf8GV/W4Y8OONfH4lCxSEPeWBkYnLm4bQgxGzmuQK64IKqyD1TEmCrKNT9ioA==
X-Received: by 2002:a63:595f:: with SMTP id j31mr14789519pgm.109.1629391857649; 
 Thu, 19 Aug 2021 09:50:57 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id c2sm4115656pfp.138.2021.08.19.09.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 09:50:57 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
 <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb739396-f8d1-a5a8-ab1a-61892d9c84e6@linaro.org>
Date: Thu, 19 Aug 2021 06:50:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 3:40 AM, Peter Maydell wrote:
>>       uint32_t insn;
>>       bool is_16bit;
>>
>> -    if (arm_pre_translate_insn(dc)) {
>> +    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
> 
> 
> Is it not possible to get a misaligned PC in the Thumb case ?

No.  The thumb bit is always removed, leaving all pc aligned mod 2.
Both BXWritePC and BranchWritePC do this, as do we in gen_bx and store_reg.


r~

