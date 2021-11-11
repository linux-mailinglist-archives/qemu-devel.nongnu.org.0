Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF6E44D60F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:48:11 +0100 (CET)
Received: from localhost ([::1]:54798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8Ys-000408-G3
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:48:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Xl-0003EM-1w
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:47:01 -0500
Received: from [2a00:1450:4864:20::32c] (port=46024
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Xj-0008An-EC
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:47:00 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so4196060wme.4
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wuh310FhYzfbx8Y3YdttUDfQL0Gw+6CiVMqPZ7y9UjE=;
 b=jQdQtB99IhOP+BzBK9T1Q++USERMKSoY+dng0DggMc97t1Acy00WUVJ5zpBJr43/9z
 HeUGK3DF64qESLthHDysQWo/HvN4qkQ01qVigIGibzWdJ+4ZiRtXSZK3wqHvR3KBOVMO
 tY3cqjkduLpfMy4m3/O9rNonZF7X7SxLf0ji0z4sJ/Iyi67hgaIF7bt/g1uu7277hYjr
 VTDTm0fWURlB4fgKTHv3sam6jMeDnTsCn1pqrbllMLBKGaZkREOZUXKLnjvTYuTw3Kd1
 WY79AAnYE0+2QtKEa01go8bukhjv/LKVITVbjhQBRjVE5tsCcybnh9WelN1ZfCh4dN+a
 sZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wuh310FhYzfbx8Y3YdttUDfQL0Gw+6CiVMqPZ7y9UjE=;
 b=KRiRUsG5rIoi76snmVVcF1r71jFpb8Tm65WfvrOI4IJJvwCPLq9lTlaHzjHsaveal3
 y041r2QD9t+q6CxKeRQ3bgtMzsa8U4v5PKBCIKc8ohckrdEqZK/3INEVi2O9NYmY5a17
 2oAXFrjPoszyMkBJzHrzsLSs6w+eM99+L2ROH5/ezNNRnicr1xGcU8sdSCWwWbfU/Lwg
 cnAg0jk7JGXd7uNAX2Q3K9v/DhD2lkUwfbVPTx3nDbjnhJHM6s2Q4yPmS4qe02P+SvlP
 KrvgAcvMcOjZI9rzqzA9WbLEXyESZNlA91hVNSot4LsPyeEoEwwPSinryLaCJObzYXP2
 T+eQ==
X-Gm-Message-State: AOAM533EUNBrdcRr76NGj9+aXo9a3yrduZsd0cQSLicqcgwf6c33j/Pr
 ibgFs9JqaU1VuhvIgnnS9vlURg==
X-Google-Smtp-Source: ABdhPJxLDnu/ZGN/x9+7Oo/pqGYUZF7nmBdkO28Y0SO7RUrhqUT6s9PRXonIGZSy54A63Q0fTrQGSw==
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr7581555wmg.118.1636631217964; 
 Thu, 11 Nov 2021 03:46:57 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id k8sm2583590wrn.91.2021.11.11.03.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:46:57 -0800 (PST)
Subject: Re: [PATCH v3 19/20] target/riscv: Adjust scalar reg in vector with
 XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-20-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1d8f47a-a6fc-3d49-89dd-2ec0af867999@linaro.org>
Date: Thu, 11 Nov 2021 12:46:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-20-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> @@ -2670,6 +2672,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>           /* This instruction ignores LMUL and vector register groups */
>           int maxsz = s->vlen >> 3;
>           TCGv_i64 t1;
> +        TCGv src1 = get_gpr(s, a->rs1, EXT_ZERO);

A reminder that this is zero-extend for v0.7.1 and sign-extend for v1.0.0.

> @@ -2679,7 +2682,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>           }
>   
>           t1 = tcg_temp_new_i64();
> -        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
> +        tcg_gen_extu_tl_i64(t1, src1);

Likewise.

>           vec_element_storei(s, a->rd, 0, t1);
>           tcg_temp_free_i64(t1);
>       done:
> @@ -2748,12 +2751,28 @@ static bool slideup_check(DisasContext *s, arg_rmrr *a)
>               (a->rd != a->rs2));
>   }
>   
> +/* OPIVXU without GVEC IR */
> +#define GEN_OPIVXU_TRANS(NAME, CHECK)                                    \
> +static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
> +{                                                                        \
> +    if (CHECK(s, a)) {                                                   \
> +        static gen_helper_opivx * const fns[4] = {                       \
> +            gen_helper_##NAME##_b, gen_helper_##NAME##_h,                \
> +            gen_helper_##NAME##_w, gen_helper_##NAME##_d,                \
> +        };                                                               \
> +                                                                         \
> +        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
> +                           fns[s->sew], s, EXT_ZERO);                    \
> +    }                                                                    \
> +    return false;                                                        \
> +}
> +
>   GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
> -GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
> +GEN_OPIVXU_TRANS(vslide1up_vx, slideup_check)
>   GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
>   
>   GEN_OPIVX_TRANS(vslidedown_vx, opivx_check)
> -GEN_OPIVX_TRANS(vslide1down_vx, opivx_check)
> +GEN_OPIVXU_TRANS(vslide1down_vx, opivx_check)
>   GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, opivx_check)

Likewise.

So if this patch set goes in after rvv 1.0, this whole patch may be dropped.


r~

