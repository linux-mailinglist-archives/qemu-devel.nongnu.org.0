Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE405F9FC9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:07:07 +0200 (CEST)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtQw-0007WQ-56
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohtMP-0004v0-9h
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:02:30 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohtMN-0001hV-Gg
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:02:24 -0400
Received: by mail-pj1-x102a.google.com with SMTP id fw14so9923947pjb.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bgv08UHk2S0B31vLsGouGppB7GuuH6AAPT6W6fzGvOg=;
 b=OBK3RScLQqXn5IVQRN3r6Oa1Mie03nbtr9DNaaBf0uGV7AmcNE3WMU9b4jKrm+KiqV
 9x1rD1B/JpWLMsuWfF7YEnuAJRywxFkHpPeUNeH+F4fMl3uy21mIx3Geh6lcEt32xVxs
 qCWfF7a1/3MnM+2F+psqlTnkFrtZAg1Ssq/FchLVSijw/D8LL2yIiv/4RmT/UkKPbDrS
 Tzc3+h7hWUSrW+qvTrktZbf8iUXJv13qTmzlCJZGq8Dk6sD9G8ycC//9vWosIZ2Gw9v5
 WKS4FpA/s5/9DY0J6Flds6zsDg1nZfeUxJhsn9PL6TUh9kVFs2xp3kS7/T32omcTuUTK
 LS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bgv08UHk2S0B31vLsGouGppB7GuuH6AAPT6W6fzGvOg=;
 b=Rfe2rRRHqCzq2iBzc7hUWdh7QQ3vDh9xf/99NrTxi6dnaED3eZyVksddyTOzSifmeL
 UnxU1b9p0wqKL7XYKrV2XtUND/1eUcHuxU1px0QrxxNbCyVgKsKe9TQeUCgPYkBkh++x
 p8hI39wucnBQRztoB9lFFjzL2IffWx/2EOYwvSUNAPVu/7NtEQ3SiM7jZMU8lpvwVAQS
 wXXBiXFRfy0/1351PTEVxvkhYpfU+N1XMGcYrXL62AUrDepLJ5ZL8m+NQ8b/gtE/SCc6
 YiXqm2G0P9C+LYeNtqVwbmqr7WMepTtpXyLYxb54VuQ1WfsqXbtlFB93e2TQsn1J3O3c
 M8tQ==
X-Gm-Message-State: ACrzQf3BRfM9w16Bnh6vbBvJdizu1DNzwfHv95e6XIDcllE5SSl4Q09+
 H/dBuJgtA7USNQ92GgIXDpOfqw==
X-Google-Smtp-Source: AMsMyM5j5Uz/liFEaxzj2HqG6uRZcr3Sa5DVnhLELjDsEFtnExvLXuaidlO1rmWV/Nmon60AJU+lwg==
X-Received: by 2002:a17:903:2342:b0:17c:ae18:1c86 with SMTP id
 c2-20020a170903234200b0017cae181c86mr18787808plh.5.1665410541226; 
 Mon, 10 Oct 2022 07:02:21 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 bb2-20020a170902bc8200b001822121c45asm2659438plb.28.2022.10.10.07.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 07:02:20 -0700 (PDT)
Message-ID: <5a67553b-18ab-a70d-95b5-b8b858b888c0@linaro.org>
Date: Mon, 10 Oct 2022 07:02:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] include/qemu/atomic128: Support 16-byte atomic read/write
 for Intel AVX
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20221008153646.1504760-1-richard.henderson@linaro.org>
 <CAFEAcA9WHx6KJF3yeiBvr-f0noco8OfR3zgdDKpTpYSaodzsvA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9WHx6KJF3yeiBvr-f0noco8OfR3zgdDKpTpYSaodzsvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/10/22 02:49, Peter Maydell wrote:
> On Sat, 8 Oct 2022 at 16:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Intel has now given guarantees about the atomicity of SSE read
>> and write instructions on cpus supporting AVX.  We can use these
>> instead of the much slower cmpxchg16b.
>>
>> Derived from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +    /*
>> +     * The xgetbv instruction is not available to older versions of
>> +     * the assembler, so we encode the instruction manually.
>> +     */
>> +    asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (0));
> 
> This would make the third place in the tree where we hand-code
> this asm instruction (we already do it in the xgetbv() function
> in target/i386/hvf/x86_cpuid.c and opencoded in tcg_target_init()):
> can we abstract this out somehow, please?
> 
> (There is also a just-written-out "xgetbv" in init_cpuid_cache(),
> but that one's guarded by ifdefs so presumably OK.)

It's also possible that the Xcode revision that didn't know xgetbv is now unsupported. 
Something to check, I suppose.


r~


