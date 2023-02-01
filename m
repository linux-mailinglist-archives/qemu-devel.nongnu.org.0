Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820B68707D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:31:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNKgS-0000Jo-4e; Wed, 01 Feb 2023 16:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNKgQ-0000Jg-Cy
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:30:22 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNKgO-0006n5-L1
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:30:22 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso3623568pjj.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 13:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pJwkk9VZ+MfFRAMapqYUSj79KxBVXnbRZ/iM5RLosnU=;
 b=N5Muvoc/FUSUKOgzg2N1TNjCuagZ05AorVf+kIGjevqa4uAdjGWPD3fZpT7OqHoP1O
 QaqlNJWb1TOkRhUUJfz8wV1aJXLgBaDA5Tk4He1bJ9wXugUNg26qCot5tycZ78wzcZp8
 UGmpOtA198TrT0saQ/SoAG2ph14ZWN26h0ZHhI2egw5h/2n2eLxbje8fIPAPG+nvNfYW
 9XoTyu5qFfAASqXHNBZtjtZ2+vM9g8Z4eKrJSfo18r/AlI1FrGLabWaU7I7HHbVexYZ/
 wbl5XzcwwrS2hzCXAGn1cIEMCNsgkqeo1o47TctwJDLFXvzsg0Nl/+dooHS311+6ob0S
 ny7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pJwkk9VZ+MfFRAMapqYUSj79KxBVXnbRZ/iM5RLosnU=;
 b=gHX9pWVzx/TSpM03bBycuQ/pb46tyvKTX3ougfaM5U2Roo2ywLkrhHbNpWDscQmewo
 SgNxZYOXuhdaSLCC5ItT3DQpkN9sSetGCGDt8G0sgC+WFdIpwyyPnnqhwLTWgPYAmtAi
 pnh8/jRGg3VudImsqUnaljkCxqlwRxw6WcOEbcxK0NUv+IgD9N1nIgMXScSnlpf5cDnS
 7KloO7n3nkwg1KbiDsmOaLB8wSmL3NLEyzqd9h/x73NU4iXzUWNgPcifEfsF1W/lHsum
 f5A+VtAGMNol2sFqOAg4XyCU0HO1hbClR9Qfw21lcy7D3V4KzLE/bJbJS7KlZMtcoavG
 okpA==
X-Gm-Message-State: AO0yUKVFZ/tYLtpVXO9Y+GU6REIH++d7jqmcswR8ZCPgfZVEZRp3ZOxi
 hnucAGI6tpPp4zPUoMQZWPcCLWRW+Wc9UIgH
X-Google-Smtp-Source: AK7set+4LQTVRNxH/HJ3CqQYk4WljkLuKjcHvkFzyGjMuIztLCckO9yeVDqTjRJtwdA6aP0e8N6IYA==
X-Received: by 2002:a17:902:e54d:b0:196:8351:ce35 with SMTP id
 n13-20020a170902e54d00b001968351ce35mr5514230plf.37.1675287018836; 
 Wed, 01 Feb 2023 13:30:18 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 bg2-20020a1709028e8200b00189ac5a2340sm12137583plb.124.2023.02.01.13.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 13:30:18 -0800 (PST)
Message-ID: <53b0cacd-18b4-c524-0877-7813f916b9bb@linaro.org>
Date: Wed, 1 Feb 2023 11:30:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/riscv: Add RVV registers to log
Content-Language: en-US
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
References: <20230201142454.109260-1-ivan.klokov@syntacore.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230201142454.109260-1-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/1/23 04:24, Ivan Klokov wrote:
> + * @CPU_DUMP_RVV: dump RISC-V RVV registers
>    */
>   enum CPUDumpFlags {
>       CPU_DUMP_CODE = 0x00010000,
>       CPU_DUMP_FPU  = 0x00020000,
>       CPU_DUMP_CCOP = 0x00040000,
> +    CPU_DUMP_RVV  = 0x00080000,

We're certainly not going to call this "RVV", as that is not generic.  But we certainly 
can add something named "VPU" or "VEC" or "VECTOR".

> +++ b/accel/tcg/cpu-exec.c
> @@ -296,6 +296,11 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
>                  }
>  #if defined(TARGET_I386)
>                  flags |= CPU_DUMP_CCOP;
> +#endif
> +#if defined(TARGET_RISCV)
> +                if (qemu_loglevel_mask(CPU_LOG_RISCV_RVV)) {
> +                    flags |= CPU_DUMP_RVV;
> +                }
>  #endif

Hard no here.  Most of the time while debugging we don't care about vector state.
What you should add is a new -d vec flag to match -d fpu, so that one can select vector 
state explicitly.

> @@ -459,6 +468,44 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>               }
>           }
>       }
> +    if (riscv_has_ext(env, RVV)) {
> +        if (flags & CPU_DUMP_RVV) {
> +
> +            static const int dump_rvv_csrs[] = {
> +                        CSR_VSTART,
> +                        CSR_VXSAT,
> +                        CSR_VXRM,
> +                        CSR_VCSR,
> +                        CSR_VL,
> +                        CSR_VTYPE,
> +                        CSR_VLENB,
> +                    };
> +            for (int i = 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
> +                int csrno = dump_rvv_csrs[i];
> +                target_ulong val = 0;
> +                RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
> +
> +                /*
> +                 * Rely on the smode, hmode, etc, predicates within csr.c
> +                 * to do the filtering of the registers that are present.
> +                 */
> +                if (res == RISCV_EXCP_NONE) {
> +                    qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
> +                                 csr_ops[csrno].name, val);
> +                }
> +            }
> +            uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +
> +            for (i = 0; i < 32; i++) {
> +                qemu_fprintf(f, " %-8s ", riscv_rvv_regnames[i]);
> +                p = (uint8_t *)env->vreg;
> +                for (j = 0; j < vlenb; j++) {
> +                    qemu_fprintf(f, "%02x", *(p + i * vlenb + j));
> +                }
> +                qemu_fprintf(f, "\n");
> +            }

This doesn't take host byte ordering into account.
See HOST_BIG_ENDIAN in vector_helper.c.

If you read and print in units of uint64_t, you'll avoid this problem.


r~

