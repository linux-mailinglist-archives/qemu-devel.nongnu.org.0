Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99859441F1C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:21:02 +0100 (CET)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhazV-0004h9-P5
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhatB-00043a-Gy
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:14:34 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhaqy-0005lY-Ur
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:14:15 -0400
Received: by mail-qt1-x829.google.com with SMTP id v17so16491170qtp.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QKmjFMzhXqIkyFtEorbaU1b9LnT4HKrwQB0tuHu+0XI=;
 b=IumvoRzSBSqeaFeW3rPtXnSB6TlShk9Putekt2sGH5W0kq41tO8dpaoXMGYaNYt2e6
 26AY2t8cWWKmOtzcMTJPvKNQklWaC6zfRM+eIFq05A+E8Z4/OUybG77i5bs40a/ZvzoL
 2FO0pQ8RA6rDKeUsjtIZWc+O+3ttZXVNV0UWNhi5y2E9zLzAwvRmTiSNBoBsRQAORHuX
 X4n6utBkXxVG+UmQMKqQNzg8ERMb2icm7LrDYjEFh4JliYMCAAGae91aikpyG2b+nWo9
 Z7AoaeKXkT/+cn4W56raSVoflkATxAqeQmpIjXvcD1v95ueWPHAiH0XcOw7RSUdBMc10
 iPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QKmjFMzhXqIkyFtEorbaU1b9LnT4HKrwQB0tuHu+0XI=;
 b=GOxXi1bm6r5+uN8LcOjzhKaC/FnAVmBnAl9km4o/pwUVm/z0ZgH1FhU/HijVEgecRy
 QOY04OrroK8V3y8hdLX3ZzCyDXgPtqek71RxNhBT5tA+aP6m8tkd/sufli3pUnfnKqy1
 GqB0ffWYQ/Ty7vrl7LAe+U07AL2Co/UlD1W7rleUhh6cCjaf2WdIWZQp/pSSBv/I66S+
 Q/4eI3GhtU8QplFAcVAcnIOmeNz2ugYyIditRxxHgZQCyMNgZBY4L9nfxeNI+d24veoI
 HFQ9YD9yXkFS6VHCzX/r4yuYrHH4m/atLeu3O71/MbAZ5OpHcGooF/9+0SG+p64Y9E7b
 hHEg==
X-Gm-Message-State: AOAM532G9DGoQ1sDx8z+06ldCXpRgX7NYiFG4izIXsAxA5JzK7eHdqT0
 cJjLkAMTWsnxyTtfBgCaC87yZw==
X-Google-Smtp-Source: ABdhPJyM10CE7oosdAQ200yXjaUJLVb9O8ppXbn44S9mmes53YQZub1QZrDToF9TBzXFNwOgAyYQ/w==
X-Received: by 2002:ac8:7e93:: with SMTP id w19mr31450738qtj.192.1635786585466; 
 Mon, 01 Nov 2021 10:09:45 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id f39sm8292964qtb.20.2021.11.01.10.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:09:44 -0700 (PDT)
Subject: Re: [PATCH v6 23/66] target/arm: Implement arm_cpu_record_sigsegv
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-24-richard.henderson@linaro.org>
 <CAFEAcA-h7xhKFTjOKgOw22Le2wQPUaT2VxtFcNFMP=xHs2stFQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c194f037-87dd-0b6a-2776-0724aef4b223@linaro.org>
Date: Mon, 1 Nov 2021 13:09:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-h7xhKFTjOKgOw22Le2wQPUaT2VxtFcNFMP=xHs2stFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
Cc: f4bug@amsat.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 12:30 PM, Peter Maydell wrote:
> We seem to be restricting tlb_fill to sysemu already.

Not true:

> -#endif /* !defined(CONFIG_USER_ONLY) */
> -
>  bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      ARMMMUFaultInfo fi = {};
> -
> -#ifdef CONFIG_USER_ONLY


r~

