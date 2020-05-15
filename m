Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BB81D5B70
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 23:29:19 +0200 (CEST)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZhtO-0002nJ-2q
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 17:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZhr0-0008Ja-2k
 for qemu-devel@nongnu.org; Fri, 15 May 2020 17:26:50 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZhqz-0008AW-BA
 for qemu-devel@nongnu.org; Fri, 15 May 2020 17:26:49 -0400
Received: by mail-pj1-x1041.google.com with SMTP id l73so4404185pjb.1
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 14:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=doBDCdXTOPTW9EhBLw1oNuUemWsv3RZ2j8ZS9h9ROBQ=;
 b=vBKrSKGWY2NG5K7wr5CXRYf0r4Eh+i1BZSEgDlD9UjRuwL7U4jimXGIfztBmWlUwld
 WsnMprYdNzPxKeeAqjf73WNLae5/G3yLUOF9U9mdk5l+hoblPsO7vrvvuG5lnhQwBeaQ
 2v/q19RgbrBpQHDywQo73IkZ7/w1W9pc/7h9KB4Elc4Ewkj6QVUVZ13YZDhW8WadqE6g
 0MfpOwHm3m2K+o86uALWKO6kaPLWVenG1lgSaQVGB9MIpLcLPVrkvznXhjjNTlW0mMTP
 h3kWeysh3Qc4H4V8SfW/P5aC+u4Eldi/rLssQGBAj88j6NPP48OKtTuHR2PH83l9ZxY9
 ZafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=doBDCdXTOPTW9EhBLw1oNuUemWsv3RZ2j8ZS9h9ROBQ=;
 b=oEYreurooGFVhdAOm5FI8kQTTTLPFG3zBOovFU+EJ+2un3EjG8w0xGYOTg9fAyuHFk
 fLvl6vQYpBqM+S3ebnG+k718DdQnQM/UhaLuhcQgzzSDhxPR34XdelwwMyIum48OfFr1
 5iZ0Y+322oF+jXf+XkEPiFVau5DlKvu8T2/im1CEr4Bc7kewQ+7ta7zzS9o8fxxsaPrQ
 L8BvTNWNPtnH9k4139Hyq46oQc0PuL1r0qriiayTTgmK8ob3D1KL2TLbqlVz5G26FVFH
 NcDwyiuO3oAfhz3VjfDYOP6+wEuMkhpwlPVVWN1aLVy1eR0SJ9ulISeQAWkX53CT+1pf
 CzVA==
X-Gm-Message-State: AOAM533Q6ucbsGaZPToFB10svx8AJizvlcVdj+rXJ2FHlrVXJFhgF9p8
 SYQY44Eh3UpyhXY7SkAkWMgIwf2nvQo=
X-Google-Smtp-Source: ABdhPJyW3Vil5o8KUkYTSSmChUO5mV3Hzvd6B3XQjPvSpXN7BQqowr1XieAQr5N5uh5MUcWtszE4Aw==
X-Received: by 2002:a17:90a:fd16:: with SMTP id
 cv22mr5166468pjb.169.1589578007277; 
 Fri, 15 May 2020 14:26:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u5sm2746985pfu.198.2020.05.15.14.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 14:26:46 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Allow user-mode code to write CPSR.E via MSR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515185026.30080-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <327074ea-2c2f-ad45-b53f-1c4dcb69f9bf@linaro.org>
Date: Fri, 15 May 2020 14:26:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515185026.30080-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/20 11:50 AM, Peter Maydell wrote:
> Using the MSR instruction to write to CPSR.E is deprecated, but it is
> required to work from any mode including unprivileged code.  We were
> incorrectly forbidding usermode code from writing it because
> CPSR_USER did not include the CPSR_E bit.
> 
> We use CPSR_USER in only three places:
>  * as the mask of what to allow userspace MSR to write to CPSR
>  * when deciding what bits a linux-user signal-return should be
>    able to write from the sigcontext structure
>  * in target_user_copy_regs() when we set up the initial
>    registers for the linux-user process
> 
> In the first two cases not being able to update CPSR.E is a
> bug, and in the third case it doesn't matter because CPSR.E
> is always 0 there. So we can fix both bugs by adding CPSR_E
> to CPSR_EXEC.

Wrong variable in description here.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> (The recommended way to change CPSR.E is to use the 'SETEND'
> instruction, which we do correctly allow from usermode code.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Bug reported on IRC. Quick-and-dirty test case at:
>  https://people.linaro.org/~peter.maydell/msr-setend.c
> 
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5d995368d4f..677584e5da0 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1230,7 +1230,7 @@ void pmu_init(ARMCPU *cpu);
>  #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
>      | CPSR_NZCV)
>  /* Bits writable in user mode.  */
> -#define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE)
> +#define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE | CPSR_E)
>  /* Execution state bits.  MRS read as zero, MSR writes ignored.  */
>  #define CPSR_EXEC (CPSR_T | CPSR_IT | CPSR_J | CPSR_IL)
>  
> 


