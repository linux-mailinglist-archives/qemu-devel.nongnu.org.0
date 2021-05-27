Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C26D393331
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:09:28 +0200 (CEST)
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIZZ-0004Fc-6k
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmITN-0003AQ-2P
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmITL-00008O-04
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:00 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n5-20020a1c72050000b0290192e1f9a7e1so794022wmc.2
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 09:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dcrVLvN4A+qu9TBDv4iIICGqez3GB19T7MmUtSlV3jM=;
 b=jaBDHdzaG45TAZbpKNj1T7Bq5YPpqSBGlraoIFcNYTzvBOvpEDmufyNzk/MHx8IIyJ
 C6F3BjAmQoox0sOl2HTn9TVjGoBTscjt/bvipCfl/MNJ+A5evTwFljGieKWBZ2nGMQnt
 Im9cN+pquW6dFENcVIftbERqBHDyXOved1p0j1yfdk0nfM7Bnto8DicLQccP4dKRu12j
 qdM0NGMtkQJGxuNKVkFfpZ+HRn7u4QhxCG1yg7O5SFGgUL+TszX967g7T1YxUUQkaRLK
 y8LDRGfwAZMGKpUzMZFVAqIzEo81uktEFiRABY5GPs9cSWVD8VkeAxJ1u6oUlUbTxJOf
 obJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dcrVLvN4A+qu9TBDv4iIICGqez3GB19T7MmUtSlV3jM=;
 b=dmmakkqeNXKQBI8emAe0cyen5hNOElPUk1Yb7fBywAZJ8pUOyyesCp5xJNIcdPob+3
 0i37bd87eCNyPWtlXaRu8HN5Umj0pw3+rqmisBj7n2ERB1spA0phqhChsw5cXDKOC5FK
 Qx9WehbJDilW3+KmDI0InGu9BsiwdeALM3P/1ODBIXIhvSG8BKffuj6kF9bR1xe4N+7a
 eRbDp+TEAVd+Lqzau1q3AoX08UEo11QuA6myOnooX+y5juv5rGsKVzRN4hUJby8JNIeO
 bvT6wFzGn7B9DpogBDXTfgaEbyfVoRLiWNBGmCDzXjKTLlP2gC8Tyq3abRHWAHo51yFO
 zlpA==
X-Gm-Message-State: AOAM530RHIFkgI0imHekqM4RMBme1asPNDGX72Uy6EAC+TLte71wrv38
 CHsETsjjO0ZTy4pRd3oKIRjYfK+el0kt9g==
X-Google-Smtp-Source: ABdhPJy7PlSo4SMikezakzCLp2WVxqxzeJ03tCAww2xxOCdNY8ImtelHV1jXHqfyR4arYXx2SnO0eQ==
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr4391757wma.169.1622131376972; 
 Thu, 27 May 2021 09:02:56 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id i1sm3442858wmb.46.2021.05.27.09.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 09:02:56 -0700 (PDT)
Subject: Re: [PATCH 0/9] accel/tcg: Add tlb_flush interface for a range of
 pages
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <CAFEAcA863+SFfx8bV-zpw+ZUNAQsSJt_Gm3OA7i83dhPCviRaw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <368e2a71-d7d3-c0b5-7f6e-ae0c3fe43537@amsat.org>
Date: Thu, 27 May 2021 18:02:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA863+SFfx8bV-zpw+ZUNAQsSJt_Gm3OA7i83dhPCviRaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 4:32 PM, Peter Maydell wrote:
> On Sun, 9 May 2021 at 16:20, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Richard,
>>
>> I tried to make sense of the multiple changes in your patch
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg805595.html
>> by splitting it in multiple trivial changes. At least this way
>> it is easier to me to follow / review what you did.
>>
>> The original patch description was:
>>
>>   Add tlb_flush interface for a range of pages.
>>   Call these tlb_flush_range_by_mmuidx*.
>>   Rewrite the_flush_page_bits_by_mmuidx* to use the new
>>   functions, passing in TARGET_PAGE_SIZE for length.
>>
>> If you find it useful, fill free to take / respin / reorder this
>> series, improving descriptions.  Last patch certainly deserves a
>> better description ;)
> 
> Thanks very much for splitting this patch up -- it made it
> a lot easier to review. I've added the commit messages
> Richard has sent, moved the last patch to earlier in the
> series, and applied the whole lot to target-arm.next.

Thank you Peter for doing the extra work, and Richard for
filling the commit descriptions. I took note on how Richard
documented the commits.

Regards,

Phil.

