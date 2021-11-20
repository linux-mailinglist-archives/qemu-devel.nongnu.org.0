Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF48457CA7
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 10:03:45 +0100 (CET)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moMHg-0001iV-1z
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 04:03:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moMGk-0000NN-WF
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:02:47 -0500
Received: from [2a00:1450:4864:20::331] (port=35376
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moMGi-0000eK-UK
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:02:46 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so12354613wme.0
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 01:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WB6RJU9fYJfRtCIeD/v2MtbxrrZdLyEk00iuJKTtkVA=;
 b=E2WxUh22x2djW4fpUn+QXfWWqaOEV2Rx+PhodU4WFeJE4zrnHXA2NWhMzypWcwABf8
 sihnjZIVf11DhysAi2SOyJogAIDaEZaDZAMyL51P8+mMDNP8bHbQnVi8oOvSPULqUYlE
 BEqhdR4J4sQE0kYqzIhdZCvV0JNinQsMPSiKeane3ykvNm2AoEvcbu3T6+CFqGSNkOGs
 /B43yddrtNEvF3hbhwE3+x9/g+WF1Wl8F7F73E0TGINUPokvpqYjP/77ejStmK1u7sli
 /O6MF5uwWdVLwPOjQ2CU226GSjQJnuu1IYzKAQ54Nj5SKIr8k6tuE5Q+lDwuqtScttCj
 yWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WB6RJU9fYJfRtCIeD/v2MtbxrrZdLyEk00iuJKTtkVA=;
 b=KoblZAdDHOxm8AtK1ga0HGephyX4dCwJF8YDuBpp8NT53x9Ood54qDJVQcrg+hhmjX
 M/auS9ugCFZmox06s4fC7uaXF9/I04upxqEPFXI/Sx280T/e77tgEdqDoYpFt9Hbr3HU
 4AjX5Kdsz7n9DSal5SlHKvtjwVuDTtw/J0qLiEGODaia7YF46tNdoscrKrEaQF9dLoMc
 vEJAN3TxroLF13ZFET+xxd8+uXyea5ONn9WGly2c0wP1FwvtzZVLwiuPhbewvHpFS5As
 XgFiLipQVzvis1i5zGh6dNlsfgLCEzOX5NabsRXIi8apwu+nRleYvyGP6UIJZMpfM0Dd
 IbrA==
X-Gm-Message-State: AOAM530+Bx7QUDsS76OHs6zHpb/420ezTgsVVx8AKuflXhAjNAaUMBwD
 wVFB3LesZK1OejekZSAzWONY9w==
X-Google-Smtp-Source: ABdhPJwBZ7/fNsu6NrL2adLRTrrJCNA+SqoCJLvX+4eCJkZSHQ+MxQ2hhisFPpbJlsOv8aOeaRhxKQ==
X-Received: by 2002:a1c:a592:: with SMTP id o140mr8378089wme.10.1637398960445; 
 Sat, 20 Nov 2021 01:02:40 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id h15sm17752754wmq.32.2021.11.20.01.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 01:02:40 -0800 (PST)
Subject: Re: [PATCH v11 11/26] target/loongarch: Add floating point comparison
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-12-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9c08d6d-e193-969c-f82a-fc36ecff196a@linaro.org>
Date: Sat, 20 Nov 2021 10:02:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-12-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
> +{
> +    TCGv var = tcg_temp_new();
> +    uint32_t flags;
> +    void (*fn)(TCGv, TCGv_env, TCGv, TCGv, TCGv_i32);
> +
> +    fn = (a->fcond & 1 ? gen_helper_fcmp_s_s : gen_helper_fcmp_c_s);
> +    flags = get_fcmp_flags(a->fcond >> 1);
> +
> +    fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
> +
> +    tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));

No need to mask cd; the decode took care of that.

> +#define FCMP_LT   0x0001  /* fp0 < fp1 */
> +#define FCMP_EQ   0x0010  /* fp0 = fp1 */
> +#define FCMP_UN   0x0100  /* unordered */
> +#define FCMP_GT   0x1000  /* fp0 > fp1 */

Any reason why these bits are not sequential?


r~

