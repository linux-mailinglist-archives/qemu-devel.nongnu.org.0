Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00B4CC803
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:28:43 +0100 (CET)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPt07-0006fH-0j
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsdi-0000gp-Ma
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:05:34 -0500
Received: from [2607:f8b0:4864:20::1036] (port=46997
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsdh-0005M4-1X
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:05:34 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso6170833pjo.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ebh76ZsF5tTx7gE4d1F5QLSGiYHeR0z5poPTdz7wdAs=;
 b=GBUeof5N1usrWmCSYcWKeE8VA6bpOfu4dGy1mSM+VgZINgpZ/J65vMVtwfNJ2iMiXn
 4CgwurrN0kmjlPeL89cA2+QxiW+KxtE7fAZ1c+S+mSVmG7hgAi0cLCd7UFLDMSPUyOIb
 aiK+P9rbcywVPnLlRKCvbXebgnBOpnNH/EJzkEfQocvIFhuCqK8tkpmx0BYIyK/WQOuc
 +z75bNZYSaQVPtWjtsQF23t8GrU4RGT2hvANSbi2Edh+rvNyowc8XWdmXS3bu2zdVcQY
 qVmAiOrycws6XuprQSLmlkiAJ2zuuWUhnYslB/uSqMEnIMOvK3Z8IiZ4D1eqX76DUvwF
 Nspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ebh76ZsF5tTx7gE4d1F5QLSGiYHeR0z5poPTdz7wdAs=;
 b=GzF02GrbDAk4xv8OfDwezDRXTmUGPxTudxSIhBKHeb3FNKPNQWqh9W79SQiV0724gr
 qYSAO0cWF3iVyTG/+wZQfXL7+S13gH6HkcZgaViroM8OiUvTndJyWI5b6G5C+f9WBHOk
 w7Va+OnaRZClo6upQdlwARa441DhSnhgdNKHNkJ6sIyy2gNXGQfemATrOhbLJj0CF+mz
 2m84XGoMlzAa1AJHFx23JIYShp+Wk7RFxSsDPI6sj51czdg3rn9bRSB8SCTmbgV+dRN8
 p5AzdaheohDGtCxyU9GCAXWEkXuwZ9QCHjpUCFG4t/zDvN1CK1nxV8ZItFS6F8w1jMFE
 wimQ==
X-Gm-Message-State: AOAM530yN++OFMDzOsh/D4uEYqxUf2aT8Zi92p63bJV0K1jeO2EHu2Xx
 n9c0ueJ+4f/y9rW7/slWmPyDRw==
X-Google-Smtp-Source: ABdhPJyHtTX+f1wN+5m5tdpHf4lTGIVtFX19REgjVadOtxoBocp6BMczrR0+pui0s6ZXnl46MZ9COg==
X-Received: by 2002:a17:902:f155:b0:151:8377:9a8e with SMTP id
 d21-20020a170902f15500b0015183779a8emr15608829plb.21.1646341531410; 
 Thu, 03 Mar 2022 13:05:31 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a63ce4f000000b00341c40f913esm2779230pgi.87.2022.03.03.13.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 13:05:30 -0800 (PST)
Message-ID: <2b027e56-dc17-73ed-99e7-a04b38f2a4a5@linaro.org>
Date: Thu, 3 Mar 2022 11:05:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/5] tests/tcg/ppc64le: Use Altivec register names in
 clobbler list
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
 <20220303172041.1915037-6-matheus.ferst@eldorado.org.br>
 <31ce0473-0706-65c1-c54b-4e572defebe7@linaro.org>
 <5fa9dcf4-fcd6-ddb6-ad87-a5a15d283ebb@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5fa9dcf4-fcd6-ddb6-ad87-a5a15d283ebb@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, danielhb413@gmail.com, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 10:53, Matheus K. Ferst wrote:
> On 03/03/2022 16:30, Richard Henderson wrote:
>> On 3/3/22 07:20, matheus.ferst@eldorado.org.br wrote:
>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>
>>> LLVM/Clang doesn't know the VSX registers when compiling with
>>> -mabi=elfv1. Use only registers >= 32 and list them with their Altivec
>>> name.
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> This description isn't quite right.  The change to the m[tf]vsr insns is a generic bug
>> fix, and not related to Clang.
>>
> 
> I'm not sure if I understood. I'm targeting the Clang problem with this patch, is 
> something else being fixed by this change?
> AFAICT, the old "mtvsrd 0, %2" and "mfvsrd %0, 0" were correct, I'm just changing from VSR 
> 0 to VSR 32 to allow the clobber with Clang, but GCC doesn't seem to have this limitation 
> with ELFv1.

Oh, whoops, I mis-read the patch.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

