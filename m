Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD2B4EACF8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:20:05 +0200 (CEST)
Received: from localhost ([::1]:34492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZApQ-00054T-K2
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:20:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZAmX-0002e6-Dp
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:17:16 -0400
Received: from [2607:f8b0:4864:20::32d] (port=44650
 helo=mail-ot1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZAmU-000110-Mp
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:17:05 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so12632240otq.11
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5y+m3TmGNG2M88dxSt7L8dA+3lq504SsB969tnSwMN8=;
 b=a9KIvvYt/qJKuweYUpEUk1RRbQ1XJF/XaKYedR0RrHwSitcV/MsiNtX+E9ZLQsqa/q
 mtmzpq9X+bZuAufVMBlrTRyePTCEMr0xqM7svPFCnq2318qpglNTlwEwI4KNV/Tn8Kwd
 p6ZeX9qLC9BW3mwiCZ4m5GDf0dth8b2dP6xHSllehdZfCL6/w5+P+O3PdR2K0GumqHMD
 7285Reka+ljLKush8eaMnUYycseWNhS894QyhT/oUrFVwFa2gEeE1ekMgyg1yFXLlJ2/
 OgQ5seB6iOEjGyy9tanOpK2uJQsZpYcyYdSEwP7/R8zVl4ahMrvkCS4SpgWfjDdPEoX0
 5zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5y+m3TmGNG2M88dxSt7L8dA+3lq504SsB969tnSwMN8=;
 b=eMPZmu1rD6kUGgVIrKjyoL8cd4mtvvBFGw3mYhba4SflvNbhJV3+z6NZi6Tny+bl//
 5UUUn7Gds4MzW7XjQuw99krQM/coeA7z0gu+pPGvMRmKI8IDYfdKJCZy6Hn9uPjGKDCI
 KNXvHOxTLEnQbdIC/alF0oVMto3zhNMai6Eoc/6eYlBDLisyPh1LrRceD2I1PKj5Uklr
 R3BBFeWfGYfjhsN9BQew2HisoZlrA1jauVzUvwVe1/FXDJtBo3NHo3L5dm+GAXgUezIO
 vZ4qWlcWPsAWIVceeOrY5ZmFKM4NzBc3ERovqVU/flJ80vpp/OAR4vg6JkS+yohMJS+Z
 efqw==
X-Gm-Message-State: AOAM530WYmFrbiQk3j34WnEBl5MQRJt1SMAWjCYW2QVAp7Utq2lkY8J3
 GUqep28LCGSJnXLgA5S+E4ro9A==
X-Google-Smtp-Source: ABdhPJwHEZFQ2Dkcio4HjOpVrkpBr5qw5zrh1XLVX9+gBNpYQKiVU3/VQdSJdd0i+nkwUileLdlSRw==
X-Received: by 2002:a9d:5614:0:b0:5b2:5fe3:8f1c with SMTP id
 e20-20020a9d5614000000b005b25fe38f1cmr955317oti.229.1648556220451; 
 Tue, 29 Mar 2022 05:17:00 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 c19-20020a9d7853000000b005cdbc0f02ccsm7239833otm.68.2022.03.29.05.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 05:16:59 -0700 (PDT)
Message-ID: <f7670dda-8cc2-b216-1714-41eaa852e189@linaro.org>
Date: Tue, 29 Mar 2022 06:16:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 5/6] target/ppc: implement xscv[su]qqp
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
 <20220328201442.175206-6-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328201442.175206-6-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 14:14, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> xscvsqqp: VSX Scalar Convert with round Signed Quadword to
>            Quad-Precision
> xscvuqqp: VSX Scalar Convert with round Unsigned Quadword to
>            Quad-Precision format
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 11 +++++++++++
>   target/ppc/helper.h                 |  2 ++
>   target/ppc/insn32.decode            |  5 +++++
>   target/ppc/translate/vsx-impl.c.inc | 20 ++++++++++++++++++++
>   4 files changed, 38 insertions(+)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 7e8be99cc0..5101ba92ae 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -3058,6 +3058,17 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
>   VSX_CVT_INT_TO_FP2(xvcvsxdsp, int64, float32)
>   VSX_CVT_INT_TO_FP2(xvcvuxdsp, uint64, float32)
>   
> +#define VSX_CVT_INT128_TO_FP(op, tp)                                        \
> +void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)            \
> +{                                                                           \
> +    xt->f128 = tp##_to_float128(xb->VsrD(0), xb->VsrD(1), &env->fp_status); \
> +    helper_compute_fprf_float128(env, xt->f128);                            \
> +    do_float_check_status(env, GETPC());                                    \
> +}

There seems to be some lack of reset_fpstatus all through the conversion routines.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

