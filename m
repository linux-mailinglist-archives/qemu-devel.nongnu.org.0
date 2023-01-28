Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9543567F41E
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 03:51:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLbIw-0008Bm-4c; Fri, 27 Jan 2023 21:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLbIs-0008BS-Gg
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:50:54 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLbIr-0001N9-1Z
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:50:54 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 w6-20020a17090ac98600b0022c58cc7a18so1934288pjt.1
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 18:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qGYerxNgvB8V5Qq+bZAzG2YBBq6Itq8dw6o/nyS4fNA=;
 b=XwCCnC2DRjgM6G+9GWQlvCjHim/WyhWt3UcXslojtNe5BZW6f/JHZx/sO6osUJdspm
 W77KBejwe+hYhpjFBK7b/HXIZK1a38lYrc+aRmhQKfDOdj0J3/+pivvI+6/2MC1QfpBB
 Dh2IX8oPSRfZGrH7BCa1S8x8vgvAqy5My3M9SUYQjZSffw6E9W1WexLfzhgmUzxzhggX
 60oJbkE+dFqS7jWTornc2KNM5a/2J7TAnuEEaQ70YcdC3uIFTMtlZ1EbX1AnckIjEAKT
 XTGyfhAUbOAEl3g7iA4KryRk8WcDkqzK5OE5tdvcC/C9+zF54rsNYCUCHZXuL9BrM3yJ
 tCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qGYerxNgvB8V5Qq+bZAzG2YBBq6Itq8dw6o/nyS4fNA=;
 b=Tub3T0GtvIZ5a5Bf9LrWgRLU5I57vyMtHEXc9BM0PAea1lM5IFkwy/aVxZVpUzT576
 /tiltDDO3iTMUYDMLf/sDZeHLAVkQrcL4bXkv0HLox+WP2dtg5eN8uWCP1htTQ7udS1y
 S5PVhNapmvkWRM0AZC2+4aVCFgO6Y8tfXuVffIva/rtpcUur371EGQlK1Us306Fn/GV8
 SWOVYUG4BqH6wTMtaSEYEvwpeiDjO9kCJhCGyycWqovQV8i/2KdfCXW9Qkkz6XL4Fxo0
 WSw01D80eJ7WoGZkxyxzwqz+RY5j1VH/+fxqaUoKshtdRGUSvkoNTHOHgjxkk3s9GP+z
 KWXQ==
X-Gm-Message-State: AO0yUKUsQuASGQoqAqvSlxRYNfLdlp88HAi8Bb0l/17ODHrRJwQi/WeS
 rdaetj19KnrmCvuafsLaEjHUcA==
X-Google-Smtp-Source: AK7set+le+pFkqOZm8R7m7B3LztCbo0i/o6I5IYKrfq6HQ0cgUtdWRaTLB3T3Gv2Z4vKUOOzYH238Q==
X-Received: by 2002:a05:6a20:690e:b0:bc:7371:e3cf with SMTP id
 q14-20020a056a20690e00b000bc7371e3cfmr2158981pzj.59.1674874251474; 
 Fri, 27 Jan 2023 18:50:51 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 dw26-20020a056a00369a00b00580d25a2bb2sm3284517pfb.108.2023.01.27.18.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:50:50 -0800 (PST)
Message-ID: <ccb73551-9139-fa36-e449-4b585293b73d@linaro.org>
Date: Fri, 27 Jan 2023 16:50:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 13/23] target/arm: Mark up sysregs for HFGRTR bits 36..63
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:54, Peter Maydell wrote:
> Mark up the sysreg definitions for the registers trapped
> by HFGRTR/HFGWTR bits 36..63.
> 
> Of these, some correspond to RAS registers which we implement as
> always-UNDEF: these don't need any extra handling for FGT because the
> UNDEF-to-EL1 always takes priority over any theoretical
> FGT-trap-to-EL2.
> 
> Bit 50 (NACCDATA_EL1) is for the ACCDATA_EL1 register which is part
> of the FEAT_LS64_ACCDATA feature which we don't yet implement.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h       |  7 +++++++
>   hw/intc/arm_gicv3_cpuif.c |  2 ++
>   target/arm/helper.c       | 10 ++++++++++
>   3 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

