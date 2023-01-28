Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C8067F3D6
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 02:48:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLaJH-0002n0-41; Fri, 27 Jan 2023 20:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLaJD-0002mV-Sa
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:47:11 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLaJC-000674-4S
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:47:11 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso10358006pjj.1
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 17:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JIMnU4HZfi5aqUU026Ue3HyisdN6V43OjLbp8WZb4K0=;
 b=F4Lwljz9DkbT8A0ARFNR4a3EgcLutCYlAYeeIvdkq4o3uN/CF76H0gPxavd0NqXySB
 5kDUXEaZ1Dg7RayVshY7LOZwgw7bl6Y3QpaDAV48Froe75EmSIITA1As4ZwqFC1khfwh
 rl5iJi06bR2Ktdmj5zYQymMZ8r5e/r+L9MeQfrA4sYsEbSAvLNi5BjupKxcSFV6hYGPG
 twPYXBUs4dgV1o+wNgEBVgOM/K8gpz+/A0Ey+ZRtSLm/NDONo/crpFwRbjtrcRQD6JXL
 jG255MkBV6y/FPTjytUzF2YLZG+x49Bul41ZNjY1kwBi3ryslCnGFeHpx346/nZzmq0u
 KVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JIMnU4HZfi5aqUU026Ue3HyisdN6V43OjLbp8WZb4K0=;
 b=QUJA6SPm+2ugUZYwIhpMIxVWj2lvF1VXJs6j05EFEA4Jme3cyfgJhQYmY2opZ7eddi
 VYREdFN37OACTvM47SICAFeFNLGjAT6zi38VS1GEK2C6pp0fUGu4d7FtVyBB30AxRVuA
 F0IDtqL3ans6DVTleTCXihc9vGczUzdRwHqMiR1zp1SIq2UFUwSAFGftT+oemzaohhUd
 c8mAVcVvrmHCZYN+4fSKVQFX/PRcWggZfP9Fkigs+ylxWNfskNPHsvt0L8puOzs9OIJc
 +0RzvJlrpbP/FfeKjPZQj+jMwmMPqlfkPxwSkLIe3oQ9iGNnHeZUKq2MSFFPGwedTW4f
 pjSw==
X-Gm-Message-State: AO0yUKU6F9z70XMB/3U/N/cI6Qe624v/3yH82A2bz8SUqBUxxM+cTyrQ
 DWNyFsR9YPYrQbVN6HbZNonMag==
X-Google-Smtp-Source: AK7set+7QSvr7xQiPDtzlldqCdnf5WysTvotv338urZX2R+k0S3hX6VRlTbKWNod1s6HDSbvwjbKKg==
X-Received: by 2002:a05:6a21:6d9b:b0:bc:5d69:754f with SMTP id
 wl27-20020a056a216d9b00b000bc5d69754fmr4087555pzb.18.1674870428364; 
 Fri, 27 Jan 2023 17:47:08 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 b197-20020a6334ce000000b004da637aae96sm2928120pga.31.2023.01.27.17.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:47:07 -0800 (PST)
Message-ID: <351b2481-4e80-57db-f06c-3dbf95db06fe@linaro.org>
Date: Fri, 27 Jan 2023 15:47:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 06/23] target/arm: Make HSTR_EL2 traps take priority over
 UNDEF-at-EL1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
> +void HELPER(hstr_trap_check)(CPUARMState *env, uint32_t mask, uint32_t syndrome)
> +{
> +    if (env->cp15.hstr_el2 & mask) {
> +        raise_exception(env, EXCP_UDEF, syndrome, 2);
> +    }

This is so simple...


> @@ -4760,6 +4761,28 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
>           break;
>       }
>   
> +    if (s->hstr_active && cpnum == 15 && s->current_el == 1) {
> +        /*
> +         * At EL1, check for a HSTR_EL2 trap, which must take precedence
> +         * over the UNDEF for "no such register" or the UNDEF for "access
> +         * permissions forbid this EL1 access". HSTR_EL2 traps from EL0
> +         * only happen if the cpreg doesn't UNDEF at EL0, so we do those in
> +         * access_check_cp_reg(), after the checks for whether the access
> +         * configurably trapped to EL1.
> +         */
> +        uint32_t maskbit = is64 ? crm : crn;
> +
> +        if (maskbit != 4 && maskbit != 14) {
> +            /* T4 and T14 are RES0 so never cause traps */
> +            gen_set_condexec(s);
> +            gen_update_pc(s, 0);
> +            emitted_update_pc = true;
> +            gen_helper_hstr_trap_check(cpu_env,
> +                                       tcg_constant_i32(1 << maskbit),
> +                                       tcg_constant_i32(syndrome));
> +        }

How about

     if (maskbit...) {
         TCGv_i32 t = load_cpu_offset(offsetoflow32(CPUARMState, hstr_el2));
         DisasLabel *over = gen_disas_label(s);

         tcg_gen_andi_i32(t, t, 1u << maskbit);
         tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
         tcg_temp_free_i32(t);

         gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
         set_disas_label(s, over);
     }

which also eliminates the need for emitted_update_pc.


r~

