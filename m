Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B09365913
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:40:09 +0200 (CEST)
Received: from localhost ([::1]:54494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpfk-0007bz-8C
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYpeQ-0006KD-BQ; Tue, 20 Apr 2021 08:38:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYpeO-0007bx-1D; Tue, 20 Apr 2021 08:38:46 -0400
Received: by mail-wr1-x432.google.com with SMTP id c15so28506371wro.13;
 Tue, 20 Apr 2021 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QDfUWm6ArMkkLd9FeexkNhzK7FO1CREc449yv08LUmE=;
 b=Vg/qkQ8SfdaPbyRTl43RKYhsjRFSIsyuK+AcEg11UputRHCAJqfV3CX6kDRh0MFmqQ
 LtTtKyUYWm8bimnF15BwX2KJkZRxpUe+olQou6I7fYy1vvyInhOVafpcQ72tPXPedCtq
 +jTqO+EguotZSnALku0bzVXlqYoQroSKyaXGrEOrCF27sY6g+wUE6RJar+bsut4Lp1d8
 fNTiewgCLSjtH8luggOgzHqIGTOxh/hjFtQOX1aQww7286Z4DjirWE9Yo0VuPdR+QIjX
 murMFPCUoUlnchoRfndH7uVufNhUuDKLdBiVRzwSqt2FPBWgPOzPOmp0NZDWtx1uaxRM
 eP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QDfUWm6ArMkkLd9FeexkNhzK7FO1CREc449yv08LUmE=;
 b=KZSThd/UZ5ji7G1yZ6MVRtWGIY0m1b7FRXhneaGhU/I89jMWJwWjwiShgWMvkYJTEI
 0Wab++yzTxXTqBUj+ZNwpPnlRo5vW3ydIANOuvbTMRaRls27qEjfwKZGVFf66kHe3NER
 /YrnoviHM3HMB5JZMdiwHwXO/fbXK0tbQ8kz57lfABV06gKNINY0mQa8TWq9ZeGe004P
 E9A9gOinQAVcBo1cbAUymqU2ebqOx0QHepLRs/fn4Gp8YTgT4cm5IwYHdzNZHyuS8I7W
 QoicGCrK3lJzYclklxfzp0vr226oAPZ2LC02Eroy3eiri42o/gMtGhtYr4K6CxfRjrXA
 7TNg==
X-Gm-Message-State: AOAM533SrAfxpTn8dcxuReJw75pnR4Dc2FNdoSf3bcOh9QLckLOo25n7
 4+37T+segIPOpp86W0UMqSPf6xOweRxLEA==
X-Google-Smtp-Source: ABdhPJy893wqEa3RxUUffEzuRBioosci3Tk1vo2QGINb8XQFmsUG+BfgLdtBRHN9O7rsxJ1xZEzdLA==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr19744938wrr.319.1618922321925; 
 Tue, 20 Apr 2021 05:38:41 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b15sm16847104wrt.57.2021.04.20.05.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 05:38:41 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Flush correct TLBs in tlbi_aa64_vae2is_write()
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi.denis.courmont@huawei.com>
References: <20210420123106.10861-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <04691b00-6d28-d9f6-e98b-b8ca3f963030@amsat.org>
Date: Tue, 20 Apr 2021 14:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420123106.10861-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Rémi

On 4/20/21 2:31 PM, Peter Maydell wrote:
> In tlbi_aa64_vae2is_write() the calculation
>   bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
>                             pageaddr)
> 
> has the two arms of the ?: expression reversed. Fix the bug.
> 
> Fixes: b6ad6062f1e5
> Reported-by: Rebecca Cran <rebecca@nuviainc.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d9220be7c5a..957f4247010 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4742,7 +4742,7 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      uint64_t pageaddr = sextract64(value << 12, 0, 56);
>      bool secure = arm_is_secure_below_el3(env);
>      int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
> -    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
> +    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
>                                    pageaddr);
>  
>      tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

