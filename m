Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE775905E2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:29:44 +0200 (CEST)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMC07-0000sh-5b
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBon-0001Ur-DP
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:18:09 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBol-00018N-Ps
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:18:01 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so5739067pjl.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=CPT8nNB1gFq8jDB6I1EIlicuIm85ra5VLrcGdBRNfAo=;
 b=BZsthFELSOjvNkXu3NwiDKTIyk7ELvsk56AVOzeXv1mJR+9AoM8KeAj1uZbFlAmwus
 jR7FxCODrz4nBEkcPoQtHUXuCbC64C92hdIj+I5Vs5rlupKyCXoqnesyNgux86h6oEQ2
 qURtqIwJhZE1s56X0EYi7AFhZk+CKLaLXwHg4UNaZjt3byqyWqgTAjrBjCrPKO+Ff3xe
 mIxb2kQR7rQ5sLQCrBdKTdnAmDHIBbHD0RgKphVXy04ElC/7HR+oCC7GTBnYlz3z3Ofd
 eHPWP2yOHCREGwr0iBZ73SlJaYGemjarsy06xEI0IK1fhFMEMeMXjDTh0hcuhmusYP7h
 Bmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=CPT8nNB1gFq8jDB6I1EIlicuIm85ra5VLrcGdBRNfAo=;
 b=LhJQuAhY+KWaPscjiE4H6X1235Ljdr2FJItBEbiABsGtI+AObX5Z3QdFPTLpje1bkZ
 RAJA5/TTCcEqEUdfmOrb8v40wZumMAKXf6NhvGwdZR81m+2gms6XZazsFfX3KX/Pk4sr
 FinxCfx4kbJPjSAPmkCKNlwPScMb6QLHLaPT31zoKM8Twn3kohp5UNSCFIkH0rC1zM2U
 7SWjiikf3BLJMGHSWagLp6MeEodgpQa95HfVV5PAoFnVVY2N3LEpokRiWHwNchudJ3sX
 uqu87HVmYZOHw++jBwZ4nVDjfRvp7UMMW0OZcjmSccFVCKEmvBpv5oJu7+A3tB/4PmpE
 gUog==
X-Gm-Message-State: ACgBeo3tUelKGTZtge3yHiq3PpfrS+v4E784vCEsK7MVs13wgoapQLRD
 WKm3RHq4ZwdgYg3D/A19TS6RFDj9LuIz3Q==
X-Google-Smtp-Source: AA6agR6occtxaHg6HLzS/U3UwNHu82sbVd65j02UuRwfJz4pkrzCwHdh5+rz7C6+zxROJHk7t2aAcg==
X-Received: by 2002:a17:902:f54b:b0:16e:f07b:46d7 with SMTP id
 h11-20020a170902f54b00b0016ef07b46d7mr288414plf.18.1660238276927; 
 Thu, 11 Aug 2022 10:17:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 h192-20020a6283c9000000b0052dde3e965fsm1576030pfe.108.2022.08.11.10.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:17:56 -0700 (PDT)
Message-ID: <29386e76-c076-e9e7-9141-ec6d39c6377b@linaro.org>
Date: Thu, 11 Aug 2022 10:17:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 3/8] hw/core/cpu-sysemu: used cached class in
 cpu_asidx_from_attrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <20220811151413.3350684-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811151413.3350684-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/22 08:14, Alex Bennée wrote:
> This is a heavily used function so lets avoid the cost of
> CPU_GET_CLASS. On the romulus-bmc run it has a modest effect:
> 
>    Before: 36.812 s ±  0.506 s
>    After:  35.912 s ±  0.168 s
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/core/cpu-sysemu.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
> index 00253f8929..5eaf2e79e6 100644
> --- a/hw/core/cpu-sysemu.c
> +++ b/hw/core/cpu-sysemu.c
> @@ -69,11 +69,10 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
>   
>   int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
>   {
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
>       int ret = 0;
>   
> -    if (cc->sysemu_ops->asidx_from_attrs) {
> -        ret = cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
> +    if (cpu->cc->sysemu_ops->asidx_from_attrs) {
> +        ret = cpu->cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
>           assert(ret < cpu->num_ases && ret >= 0);
>       }
>       return ret;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

