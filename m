Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30663E29B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 22:21:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0UV3-0007ZS-Bh; Wed, 30 Nov 2022 16:20:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0UV1-0007Z5-Lg
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 16:20:11 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0UUz-0001FE-2g
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 16:20:11 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 x13-20020a17090a46cd00b00218f611b6e9so504pjg.1
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 13:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oROFOd0C1I/gGn6CqSwXJIFEIDDXfeRvIkSSeRy5HH4=;
 b=Hn1/aZnqFgeKCuViAb9+Ed/RV73T4VknFYBXJajffaerDv4FswTXWsO+MWQTaVlnX8
 A6furmh10IbMNxx1nBg3t5XFgxO38rrzCYiPtwDaKmut8EtfMCxn06dhUjsgIQQ1evcd
 ETIH1SqlU4+4iegdpiFs8g7EBDtW/zS/SCKEr3bGxLpS2x6VAoRySrDQodyjkL1Tc6Tm
 q/rtW6lhk/BjJ2y0SOFTpFhYCQHbmMpzlznx3vzMdrdxpnBpPb1lNWWW2/yLWjTzCzt8
 /kHAVFS/d6xOZb75cW5eGodHhPZRvOTfgAvHg2qS3F2L4ma4wSy+hwqABLA4Lc1QM3un
 cQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oROFOd0C1I/gGn6CqSwXJIFEIDDXfeRvIkSSeRy5HH4=;
 b=TReKcc5MN/H65H01r0GYsFpW0UQCjWviAEb7u2MymFaJCaApERsDX9+tj34e3nY6GC
 lTK9fTJHOG8cVHBbvL6ShpXnOuEfNDgiK5UZYtymSOCvSzOf0Wgv5MbUCd9OtgzSd8Bv
 N668G974Z4AoJjX1NUqAeII2b33mLCWaDrkJa0yDtI62IwCcV+LPtnMXpBcwVLig9vKU
 /wmzEV9eOmgXQ/CMNwG/dJuQDvIl+93eb9V3LYebC5Q451RDsR/yahu+jY8s+m2XKwv2
 BeVcRO+E8g9zBdAWdg5FxfzMAOWHF6fSjIDF3xfNPPHsvYSVU99f41i3EU1q3tG00zQM
 z3dQ==
X-Gm-Message-State: ANoB5pmpUMaLXwq5FhMlxVJwzkIk3J1c1IPjaIKpc+yC0kwVP32+Dlwu
 swIhwo0mX0KhwI5Z6ZevKOAHMA==
X-Google-Smtp-Source: AA0mqf568igdI7WkQkNpN+0GjeLfTUrZ4WB7hQ8UlkDIukpvyPrJl6U1Utv33hgf+l6lPW/ZC0YTiQ==
X-Received: by 2002:a17:90a:9488:b0:218:bfa3:3dd3 with SMTP id
 s8-20020a17090a948800b00218bfa33dd3mr47504659pjo.135.1669843207336; 
 Wed, 30 Nov 2022 13:20:07 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170902ce8f00b00189947bd9f7sm1977009plg.50.2022.11.30.13.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 13:20:06 -0800 (PST)
Message-ID: <dc0e19f9-e654-da34-2506-b7abc9326d56@linaro.org>
Date: Wed, 30 Nov 2022 13:20:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/i386: allow MMX instructions with CR4.OSFXSR=0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
References: <20221130141917.29667-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130141917.29667-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/30/22 06:19, Paolo Bonzini wrote:
> MMX state is saved/restored by FSAVE/FRSTOR so the instructions are
> not illegal opcodes even if CR4.OSFXSR=0.  Make sure that validate_vex
> takes into account the prefix and only checks HF_OSFXSR_MASK in the
> presence of an SSE instruction.
> 
> Fixes: 20581aadec5e ("target/i386: validate VEX prefixes via the instructions' exception classes", 2022-10-18)
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1350
> Reported-by: Helge Konetzka (@hejko on gitlab.com)
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

