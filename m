Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC34638010B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 02:03:19 +0200 (CEST)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhLIU-0002WM-Tt
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 20:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhLHK-00018X-St
 for qemu-devel@nongnu.org; Thu, 13 May 2021 20:02:07 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:39806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhLHF-0001cD-KD
 for qemu-devel@nongnu.org; Thu, 13 May 2021 20:02:05 -0400
Received: by mail-qk1-x733.google.com with SMTP id k127so27274875qkc.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 17:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XPBzir3nbxQ7EiCnQijWKttO1krLhtAIVE00sPWyXWg=;
 b=v2T02dWBNBLVCufeABQhoIqHgzZahw5E7DFMGWKbuSKkXlOe4naiHVLBSZO6rQYQ9I
 4fyda7Q/UojsWyDNKzaKpc8FQvduLVmcciPBHiv84ZGk24f9IsPcMBJilFonI8pOpiM4
 JzXlVM8S0Jd4F/prue8lapqrfSL9IeNW2VzC9cZDXbxdK11jCZMxy7t+ioRxkH94zzy8
 Ejm7VOjy39HmC3bxiWRonDf6rEupL/5OQ68l93pbHllBWnzgaYULFa/V4/VZDYfZzJoc
 DVJlmqmgJGka1ZdQBArYUAMf2AYJ/GKhzuNROZiHmhA9BTXJyQRHbmD/vGLDu4m49VEc
 9GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XPBzir3nbxQ7EiCnQijWKttO1krLhtAIVE00sPWyXWg=;
 b=IlZ6vTKdOJr4trBupxIBSj/qvXc+p51dO3IhU0x1UXkyyZJ1JmsQQ+hfbJc1M9YLSb
 owxYxtfLcAjN44bc/XWwwgiwx/sg3qhPjzfdE2c1uIQIOZh/Y8m8ILgIK935W7/vPsBh
 PN8/3VmW3kb7fQqBj1hBsTBwXoPvy21MB0s2z4RppYwVOYidTq1gHarVR7MwTvShMifQ
 A9NnTJ13D8I4RLDQDtUo8HLyUeIlyvUVReYHjm5T2+ZPmKm51WPWtHIYnwUjJZ0jAl0A
 VgpwogvaDVs+ttdFSlMeIt0PYtavyN+TlxDp3MnDU/V7NXb3MfxcfcdSVqEBzbtrVlUO
 X5UQ==
X-Gm-Message-State: AOAM5324zFJTcCf24ZUVJJpPfi4HS6UNijNSDhmaOwIu+EJ8ZDLeDR1b
 WcdaddEPyt9acOQX2bbYVyYqYw==
X-Google-Smtp-Source: ABdhPJwdkTd3iBS6knCSvCkbcZxZ0rd+RvYhjsilBed5YO5AisxjWDXho15eLB6iUPwD1bM7yOkUZw==
X-Received: by 2002:a37:67c9:: with SMTP id
 b192mr20328146qkc.144.1620950520528; 
 Thu, 13 May 2021 17:02:00 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id t5sm3567622qtr.19.2021.05.13.17.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 17:02:00 -0700 (PDT)
Subject: Re: [PATCH v4 29/31] target/ppc: Implement cfuged instruction
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-30-matheus.ferst@eldorado.org.br>
 <49b2a677-a3cc-b944-dd4d-edd115c81039@linaro.org>
 <60f639cf-50e6-d967-a24b-a862b5a9e8fd@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3fc1c7f5-a837-ffe0-a1b3-f94262dfba2f@linaro.org>
Date: Thu, 13 May 2021 19:01:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <60f639cf-50e6-d967-a24b-a862b5a9e8fd@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 7:24 AM, Matheus K. Ferst wrote:
>>> +static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
>>> +{
>>> +    REQUIRE_64BIT(ctx);
>>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
>>> +#if defined(TARGET_PPC64)
>>> +    gen_helper_cfuged(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
>>> +#else
>>> +    gen_invalid(ctx);
>>> +#endif
>>> +    return true;
>>> +}
>>
>> Given that this helper will also be used by vcfuged, there's no point in 
>> hiding it in a TARGET_PPC64 block, and thus you can drop the ifdefs.
>>
>>
>> r~
>>
> 
> If I remove it, the build for ppc will fail, because cpu_gpr is declared as 
> TCGv, and the helper uses i64 to match {get,set}_cpu_vsr{l,h}. REQUIRE_64BIT 
> makes the helper call unreachable for ppc, but it's a runtime check. At build 
> time, the compiler will check the types anyway, and give us an error.

Hmm, yes.  Just change the gen_invalid above to qemu_build_not_reached().


r~

