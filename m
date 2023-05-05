Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F796F8898
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 20:29:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv09l-0004N4-Rd; Fri, 05 May 2023 14:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv09k-0004Mg-3t
 for qemu-devel@nongnu.org; Fri, 05 May 2023 14:27:48 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv09i-0005XS-Jl
 for qemu-devel@nongnu.org; Fri, 05 May 2023 14:27:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1950f569eso14959095e9.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 11:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683311265; x=1685903265;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K6KXIBQSFONQIb6blFGXHYhpx8tddcY+TgFLKZYs+3c=;
 b=bE0hnei7h5z8dtoAgwneDIm4FszTTmuRMrO4JREMw5881ZnTda5+is6JMw9NUhwD/8
 kcCfsevecWVXtlMLPFWPmI+/RC9pkPSWfTQPyPJRh0QU3Egr8U5exySaXIuwK091pbTj
 bmLVZb3Qv9vbBaYI7aLkNq/bw63ruX6HSRDS+jklVIR2nngQG3yLgCxxBUEWKoynTg0O
 2AhTgWJ01AS7OXKDLWigOwBQwJuKPyHU68+RgZ2flBiKyxVCoLtXsx9D9hKzXR+Tj8sD
 Fho8ALYnoHgrxfjYg2BojHtDbOC9mH6YivmiuoMb+Obh5Zq2/EqdSduu7SsteMTrrjjf
 3YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683311265; x=1685903265;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K6KXIBQSFONQIb6blFGXHYhpx8tddcY+TgFLKZYs+3c=;
 b=FWXRSeb1FlvwYGXAz5k6aLe5nMOpFZgU1q7VdvDKrMZWvjgQSjpPN8Qnbgu27hlsF7
 v/oTkEms/XHuULc5iPj0JxCmxC2lXPb4GylgsJHktd+9PxnCqWs1Z3dMEFIvX7gyqzOh
 FT3G6VW2FoGWo8noc24nT43Y8ZRyWQUyY3rlGyzaMoWhIu16hqSX6VC5hmm8NtoaIU/U
 AuHl+DrUAKrjXc9HNsTj9KH8wuADFHwR76qDvVk0yPynMn+S90FtyxRh7Tjc3AxqVMas
 EKxNojW+ymkSZMeiFRselCj49BrR8gLDYEACkni7M1f1Ks6ypdLnMp8m7+STp7Q2QrcK
 ANWw==
X-Gm-Message-State: AC+VfDzX/8k/uNc1sFIVk9tgiqNTxu/4z+sFkcdVofqVlvfmfB/AIi8K
 +3aezM1zYWsdW6WjXR7Q3u8aDA==
X-Google-Smtp-Source: ACHHUZ4tRuYRxZ2z4MYYYy5LhGDRh+no6theui/uqi9PAiZdhLK9kiqmxzi11EakNgXYj82Fxv03yw==
X-Received: by 2002:a1c:c908:0:b0:3f1:662a:93d0 with SMTP id
 f8-20020a1cc908000000b003f1662a93d0mr1993451wmb.15.1683311264992; 
 Fri, 05 May 2023 11:27:44 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc014000000b003ef64affec7sm8669833wmb.22.2023.05.05.11.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 11:27:44 -0700 (PDT)
Message-ID: <d77d29d9-c31b-7eb1-087e-d229c9e24ce0@linaro.org>
Date: Fri, 5 May 2023 19:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 10/10] accel/tcg: include cs_base in our hash
 calculations
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20230505155336.137393-1-alex.bennee@linaro.org>
 <20230505155336.137393-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505155336.137393-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 16:53, Alex Bennée wrote:
> +                      uint32_t flags, uint64_t flags2, uint32_t cf_mask)
>   {
> -    return qemu_xxhash6(phys_pc, pc, flags, cf_mask);
> +    return qemu_xxhash8(phys_pc, pc, flags,
> +                        flags2 & 0xffff, flags2 >> 32, cf_mask);

Well not that mask, obviously.  Either pass it whole, like pc, or just let the compiler 
truncate for you without the mask.


r~

