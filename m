Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA955F7B5F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:25:45 +0200 (CEST)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqAS-0005Hq-LJ
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpGY-0002Ri-H6
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:27:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpGW-0007F0-Fj
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:27:57 -0400
Received: by mail-pf1-x435.google.com with SMTP id 204so5172360pfx.10
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PnUODhtfEDlRIhWuUXK5ZGJXQ62a8B59hajbq5RmTxs=;
 b=IrIveoMFb3+CVVb3hPJ+NvhPNgqHSwky+xoGrH5LbVglp3rtRaPhItwvNuTNZ8I7hQ
 c6JuKF7TUDDgz/2DfVTu1zhw/gGEQFH6FuRHEQoRYwCT9vIJNqVCg1MKMIc+OP1Urv3l
 lxDjC1RdossW3gTbjqqe5oKIkX+BYFmlYLXbf4DR7X8IV7bwFAzyerIHNsB/83VDX6/e
 vzBJkWWPqbNhsOk4gbmvIwvCpYRiiVsCWRvMdkXdf2y1koCQI7oKWhZ1g+K+IkYdXiUt
 DoW5YWGiS43p2OpLa29b4zV7+ZU5lK1cR9Gb/Xf/Dj16BIOuukDwqGapKF+mdN3x/df0
 3Ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PnUODhtfEDlRIhWuUXK5ZGJXQ62a8B59hajbq5RmTxs=;
 b=M/3Y15i0NWgESjR3TmHqXEr/XOMvixqzUDiscIFbTlpT0Vb1IUzIyGvf07lb9FIJiZ
 ZtpDo6E1XV0avTjsLum/dSgCeQvqFu56zIC+eKrpfCoB7Wx4hCFqZT4M4nyI0GoQe6DL
 GpzpS9oCIIhIxdBKao4bEDy+UhZGxRVfU1Dt5rMsvLZz8XSpqUkGL/kt5obbI+9Op3Xu
 0aHrFTfhdk+fYdXPdikVsa/GJLLTExgB1KiFh0Qy2YMAwQy0YlUh9hlm8gDuj181IF6G
 2MZL3qztEw6xpv6W3+AEI2rcwloCLhOXgOeeq6ZF+kwF1efQd5R6AnCVM2IhQ7JVjzNv
 ffbw==
X-Gm-Message-State: ACrzQf2RaEGs408sm7z82nvTp023tNeZNUIef1XuLLB+Ow9yST1lxsTN
 A80sKFP1cz62P6R8pYPl78Pkug==
X-Google-Smtp-Source: AMsMyM7BznW8SlHYLB2s8y9C9PnbsloCFF2w/8d7uU+4ADeVHzlB6bo8hE9P/1cFhXBkSkHBvDR2bg==
X-Received: by 2002:a63:fa17:0:b0:43c:3f26:48e3 with SMTP id
 y23-20020a63fa17000000b0043c3f2648e3mr5129676pgh.66.1665156472036; 
 Fri, 07 Oct 2022 08:27:52 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 o39-20020a17090a0a2a00b001f262f6f717sm4835655pjo.3.2022.10.07.08.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 08:27:51 -0700 (PDT)
Message-ID: <92b19bab-1115-cbd2-40e9-45deaa14e857@linaro.org>
Date: Fri, 7 Oct 2022 08:27:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 27/42] target/arm: Use softmmu tlbs for page table
 walking
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-28-richard.henderson@linaro.org>
 <CAFEAcA9Vd6mwMf9-70vo=t_Yec+fPh3kM_jo7wn=oNi1+cvgkQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9Vd6mwMf9-70vo=t_Yec+fPh3kM_jo7wn=oNi1+cvgkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
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

On 10/7/22 02:01, Peter Maydell wrote:
> The upcoming v8R support has its stage 2 attributes in the MAIR
> format, so it might be a little awkward to assume the v8A-stage-2
> format here rather than being able to add the "if !is_s2_format"
> condition. I guess we'll deal with that when we get to it...

Ah.  I had wondered whether it would be better to convert the result here, so that we 
always have the MAIR format.  I decided against it within the scope of this patch set 
because it meant that I kept the existing s1+s2 attribute merging logic unchanged.

>> +    /*
>> +     * Allow S1_ptw_translate to see any fault generated here.
>> +     * Since this may recurse, read and clear.
>> +     */
>> +    fi = cpu->env.tlb_fi;
>> +    if (fi) {
>> +        cpu->env.tlb_fi = NULL;
>> +    } else {
>> +        fi = memset(&local_fi, 0, sizeof(local_fi));
>> +    }
> 
> This makes two architectures now that want to do "call a probe_access
> function, and get information that's known in the architecture-specific
> tlb_fill function", and need to do it via this awkward "have tlb_fill
> know that it should stash the info away in the CPU state struct somewhere"
> trick (the other being s390 tlb_fill_exc/tlb_fill_tec). But I don't
> really have a better idea...

A better idea would be most welcome, if anyone has one...  :-)


r~

