Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2EF47E932
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:51:25 +0100 (CET)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vzg-0002mu-JC
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:51:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VxK-00010t-K5
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:48:58 -0500
Received: from [2607:f8b0:4864:20::1033] (port=35648
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VxJ-0006QU-1r
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:48:58 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso9879610pji.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 13:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JmFpxNkXwTRNQucRbXn231T+T9C3WQlxHwHG9k9GZX8=;
 b=ZQDB1KLi6tIMPE8ytZl+1mQ6JRuP3JtROn4j/B5RpdkucCPkG3eVea+fBmUWG4hzwN
 K6s05l313gm29tFzKzkwbfykbN6GUaYa3Y/JnvLha0oS01F6nLvZ9WTy4izQAicvsabu
 G4nq+UO9D1AqUgJZyipxHdUwtSbT4dRdMSvouGo8XVdHQgtPLIsEs5XJOpQS9dkdrTfF
 uofHXCDj3tIfci/fQBFWAh/R/r76vxgfvl89wheOXTr/jcu4HzA4bCoy7xBvOToakx1u
 qWVcbotjPi1GyEuybfEG/cxdi/5Ll3ZqrDHZVc1nHDgQ06G+zscaOvd7kl9PmaOAKMcu
 1c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JmFpxNkXwTRNQucRbXn231T+T9C3WQlxHwHG9k9GZX8=;
 b=COKS4nFwGE3kXxY4jEhK+rWJd9eEOIhBBtdZtOoN8FchvVAb8yQ1Mh/O5QLDI0LozR
 nQtb0A9u0R6HG1rWA95y1L3kB7QGb3SmmyzbVQpgxkrLSHYgIKxdvOQPyNIyDph5+QDa
 8yOK8NRWoYLpK0Aoh4d0Xq2W7l0+wnLgvaS/UTQqfPauTE5PN8Q+at7N/CX9/GjxzZJc
 fr828TysKrFHh9W4HpF04LGSQ0MVc7MaTy/IEXDyVRWPtkhtx/Fe3cYu7nWDGyImXH3a
 IGqNamFOodxVrraadBxw/HKYFd89bMqR1Z+PR+bQqc8y2ROWsdtJxFpEKP2HFc2J+WQ/
 X68Q==
X-Gm-Message-State: AOAM530zPCuGCTlb4b/lCgnMKFqtvioFEJ5ZJyHsVSrDsBYHDte+m71K
 FilzEVBC0llesiBa+jbzMlp4fQ==
X-Google-Smtp-Source: ABdhPJznnI42lxaC4BtnW7y4mWizn1cuGQIH3plIMzmupzZV85SHk2v6yUuToh6PoDF88ifwFeAmYA==
X-Received: by 2002:a17:902:8502:b0:149:3049:88e2 with SMTP id
 bj2-20020a170902850200b00149304988e2mr4092820plb.120.1640296135600; 
 Thu, 23 Dec 2021 13:48:55 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id hk8sm7217346pjb.52.2021.12.23.13.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 13:48:55 -0800 (PST)
Subject: Re: [PATCH 8/8] ppc/ppc405: Dump specific registers
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-9-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <336a26a3-5b52-352d-ecce-784d69486910@linaro.org>
Date: Thu, 23 Dec 2021 13:47:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222064025.1541490-9-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 10:40 PM, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   target/ppc/cpu_init.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 9ef9a1a5ddd5..8f6a58e82483 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -8689,6 +8689,17 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>            * they can be read with "p $ivor0", "p $ivor1", etc.
>            */
>       }
> +    if (env->excp_model == POWERPC_EXCP_40x) {

Perhaps turn this and the previous booke test into a switch.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> +        qemu_fprintf(f, "  TCR " TARGET_FMT_lx "   TSR " TARGET_FMT_lx
> +                     "    ESR " TARGET_FMT_lx "   DEAR " TARGET_FMT_lx "\n",
> +                     env->spr[SPR_40x_TCR], env->spr[SPR_40x_TSR],
> +                     env->spr[SPR_40x_ESR], env->spr[SPR_40x_DEAR]);
> +
> +        qemu_fprintf(f, " EVPR " TARGET_FMT_lx "  SRR2 " TARGET_FMT_lx
> +                     "   SRR3 " TARGET_FMT_lx  "   PID " TARGET_FMT_lx "\n",
> +                     env->spr[SPR_40x_EVPR], env->spr[SPR_40x_SRR2],
> +                     env->spr[SPR_40x_SRR3], env->spr[SPR_40x_PID]);
> +    }
>   
>   #if defined(TARGET_PPC64)
>       if (env->flags & POWERPC_FLAG_CFAR) {
> 


