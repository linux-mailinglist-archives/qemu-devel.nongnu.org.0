Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F4C3EAB7A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 22:07:20 +0200 (CEST)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEGz1-0006Su-Fo
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 16:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mEGxj-0005di-A7
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 16:05:59 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mEGxh-0008QN-SM
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 16:05:59 -0400
Received: by mail-pl1-x62f.google.com with SMTP id e19so8733025pla.10
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KTin34YzXBQ942TfIM2vg5A2+WbG9c4iWSBNTg/XaU0=;
 b=pi8bF6fk15jqNTACYfYNevs1W2mEmqeZvX/KT0zHjqUUP7gO0YoA7JOgzUxG7EICy0
 0nxnCwZmMnzubJLx4AluPByv2q6V2eu9cf4NJ3Nsy4ErUZ46re+YBjDgLoU6LIvT8ce6
 zfsqFYF0O9bobcEaPGR16lmeo1Mo5n5+6VeP55QxMlXM+ZLNqF8AtTtKLVlZxGfE/d1H
 Iugy5BPhJFXBbVmey5gidh/yrWrxnflR0y7PEuLzOaXRLky9nBnelkXTXVdkNzwgsuQA
 QdxE2D+olcJN0JJBVSKuenS96tuk8fQVFRNcyfs2ZpoIBEnvUzSS6emW9X2H628o21sS
 MdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KTin34YzXBQ942TfIM2vg5A2+WbG9c4iWSBNTg/XaU0=;
 b=ot1QWSVB/v0BBqF0AHS8Lc69vwjC1lyYT5885WmzKyO0s5Y9Jz9Gcgimu+fIwIDxiW
 l2xOqWdfOhMF8120uBlZNjXZQIt179gfi1wcokPzwMMfjZ27kNKDy1vnDD5Eic6n7Jst
 TIt75g6u1rr0MDTQKyxqONf0jw8zFnf9nD3b+p0CxszO5B2hv4qGQYdLg0uet830KAPq
 vAxmA5QANl0TvyLWMtgVL8VeX/vmvip+OVcfx3LuzMOKisKSLjzq7G43lSykq8BfgRRy
 Q+rsgnvGChIJhCuKr1ZtCVIU/+Rj4R1vNn85nU0EKBMdbcalYUqwqJmPZligj26ZopXL
 807Q==
X-Gm-Message-State: AOAM530Nf/vUsm8oTlAushvyVX64iQkFIeWiplxwiNoPFzSHaT5prHqR
 whwwo75Ejx3CqtSSUos3lHQw3A==
X-Google-Smtp-Source: ABdhPJwoSTg/1yKKSGF4jGFzA3TfjtpwQON2HW+ynfee4Lx96K3BYf7/VRYVJs+Y1rVyYcYvO5/w3A==
X-Received: by 2002:a05:6a00:26c3:b029:3c7:a436:2be6 with SMTP id
 p3-20020a056a0026c3b02903c7a4362be6mr5728538pfw.26.1628798755746; 
 Thu, 12 Aug 2021 13:05:55 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id j185sm4503118pfb.86.2021.08.12.13.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 13:05:55 -0700 (PDT)
Subject: Re: [RFC PATCH] target/ppc: fix vector registers access in gdbstub
 for little-endian
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210812191007.70331-1-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b8530e0-4dc8-ea7f-3cac-e6ae623e6770@linaro.org>
Date: Thu, 12 Aug 2021 10:05:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812191007.70331-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 9:10 AM, matheus.ferst@eldorado.org.br wrote:
>   static bool avr_need_swap(CPUPPCState *env)
>   {
> +    bool le;
> +#if defined(CONFIG_USER_ONLY)
> +    le = false;
> +#else
> +    le = msr_le;
> +#endif

It certainly doesn't seem like the right fix.

My first guess was that MSR_LE wasn't being properly set up at cpu_reset for user-only, 
but it's there.


r~

