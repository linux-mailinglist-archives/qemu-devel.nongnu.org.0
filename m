Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3156B337B7C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:00:08 +0100 (CET)
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPbL-0006yA-I6
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKPUC-0001jh-Da
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:52:36 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:42616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKPU5-0003Y9-HW
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:52:35 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so26352ota.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZhjLWsoI3YRLWTRRZuQ9Zr1eUN/TPCxWW+FDLVt/QuM=;
 b=nmT/EgdFigsLqXkctSPEZrQz4JILZ4CgIrwmhBHndXxLJcT13LTD8BYVOA/aEr2f5C
 BJ+uVfmq0QPHakK7OPmcOkDEEYMg8qg9RS7wNO74dRtZRiWosATfstCLZCCUnU3OIhGZ
 oqDag2KVXpfF106Sm3wNMcurHnYJ5VBHZcZPwM54ceCF3ZCG9+wNfNvELYTOEyU+9+V0
 lxYt2VXtUPc9+op7Bk2yF+xW1nIoH/RwHG4RKjOOZ2SJ7RrTbAy7r+0yUQaz7IG8A/OZ
 J2CW2KRHNsNhzapK0vbvNpo43kekTfR7weysG2RTKaolTSZZnISQRgJJQl+jJtNuR8dq
 Y6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZhjLWsoI3YRLWTRRZuQ9Zr1eUN/TPCxWW+FDLVt/QuM=;
 b=GUlcFrH02bUVyiJSzo0ZNVgFHqitsDwsE8dQL3NG2HpXrpS8LhOWscvaLnSCiZyOdk
 tjLaUTtb+VPP+W38Kstr/t9S/g01AB25eFkceuusuamtYJYum6CaDMpUaZEpMADFYSE0
 6cjgM0OnUzRxoC+xcd+kDLty71x+c0HbU+MCRnHoD7YFQtU2RKWOlO/+yvo5vDJF5IBq
 Ft5mXOW88pNzHXWdOOTA9+IT/TbNmzYyPfATzW1tjyZSQAV8vbORGcK8Zus4edkxHqeI
 O2BToNyj+c8FV6S90g5GHdXR0cnjEaJ0NcBuWnHqdIevhDWWSPt9FcMpdkJyIaD9PW5u
 dDyQ==
X-Gm-Message-State: AOAM533sbt4EXAdFuM0o7LyRwieTjjZcXP3YUG2HMaj5LDeiTz6DCCYD
 s7PbINlP77joWD9Aa0y3avSHvQ==
X-Google-Smtp-Source: ABdhPJygfyGbDrqpQf8oTWHAcXDNbQpzlWqMzSaVJOquWlejmobyXLKTw0Kv7TYxJyPWEGmTottQvg==
X-Received: by 2002:a9d:624f:: with SMTP id i15mr88630otk.6.1615485148024;
 Thu, 11 Mar 2021 09:52:28 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l26sm792491otd.21.2021.03.11.09.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 09:52:27 -0800 (PST)
Subject: Re: [PATCH v5 1/2] target/s390x: Implement the MVPG
 condition-code-option bit
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210311161747.129834-1-david@redhat.com>
 <20210311161747.129834-2-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39285cf8-2214-2257-679d-231e0c6a0652@linaro.org>
Date: Thu, 11 Mar 2021 11:52:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311161747.129834-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 10:17 AM, David Hildenbrand wrote:
> +#if !defined(CONFIG_USER_ONLY)
> +    /*
> +     * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
> +     * to detect if there was an exception during tlb_fill().
> +     */
> +    env->tlb_fill_exc = 0;
> +#endif
> +    flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
> +                               nofault, &haddr1, ra);
> +#if !defined(CONFIG_USER_ONLY)
> +    if (env->tlb_fill_exc) {
> +        return env->tlb_fill_exc;
> +    }
> +#else
> +    if (!haddr1) {
> +        env->__excp_addr = vaddr1;
> +        return PGM_ADDRESSING;
> +    }
> +#endif

The assumption of PGM_ADDRESSING is incorrect here -- it could still be 
PGM_PROTECTION, depending on how the page is mapped.

I guess this should be done like

#ifdef CONFIG_USER_ONLY
     flags = page_get_flags(vaddr1);
     if (!flags & (access_type == MMU_DATA_LOAD
                   ? PAGE_READ : PAGE_WRITE)) {
         env->__excp_addr = vaddr1;
         if (nofault) {
             return (flags & PAGE_VALID
                 ? PGM_PROTECTION : PGM_ADDRESSING);
         }
         raise exception.
     }
     haddr1 = g2h(vaddr1);
#else
     env->tlb_fill_exc = 0;
     flags = probe_access_flags(...);
     if (env->tlb_fill_exc) {
         return env->tlb_fill_exc;
     }
#endif

which is pretty ugly, but no worse than what you have above.


r~

