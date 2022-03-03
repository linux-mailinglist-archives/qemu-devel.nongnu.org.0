Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4354CC2C4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:30:42 +0100 (CET)
Received: from localhost ([::1]:34944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoLh-0007lj-62
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:30:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPo2M-0001Jv-9d
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:10:42 -0500
Received: from [2607:f8b0:4864:20::1035] (port=35459
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPo2K-0000AX-Dh
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:10:41 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso4702607pjb.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 08:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=/0eQs/C9V89avD/GHi71QtNzui5pImpS/5egAbN3FxU=;
 b=yTALXuodykVMwrvHmyDR1OukkmuJCzlI5ZDAf2RtNcLEjQ1ajPgqnJiWaMgrJfulvr
 vG6euNgVzW6BGu8L7Bfu71XHNUmEwTqZj4rHUMvLJ5VuEefo0rt3b4Nj7Q0aUBmIxHLa
 KJZlG7tUXPS5DZypXQrm1ejesm7iVHAXx/q8KLXmROOn9VgkhMc2nf0Oxf+T4KrE7Xcl
 lV7zMiE60oE5bZAh73O8Cb3Ufj3VtEQNEJOqhI3qgYujssnSw4Q416YKqY3mVAQ8xzn6
 05F88pb/QH4mP7IwQSeeMbQd/TySe+Gbf6oOIZ/tkPZFV7Ibn8rnIUtyVC6+c/TEPoNJ
 CtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/0eQs/C9V89avD/GHi71QtNzui5pImpS/5egAbN3FxU=;
 b=F4gXO1iGlgmN6iVcyxziU8h7/wg/C3qTQgwKAohtkEOsxVqpIGlZrYyTPc2vL5fAb2
 fy2OR0cr+8jmWlSyvkT0cnVFSrcRtGa7fiD5lWHN1UhmjN06Jnjkfh+ve8vLoWdWiabc
 EC04BFXt42VLtzMPVIFd+hFwJ/HskczrfeNdmAzJiEI0a5SQIHQBAM4N52ne7zDRQYd0
 xPrD13a6AZV+AyWEGbTB0lRIHwAGVt12xsCSyZTz7GLOe0CHyN9NODDfnpVe8r8R/f4s
 aqjesNmBXOzPPq8fvCnVXsmwCOFfvx7q+DGrRrkLFsMlhTnRfF65Ur5tb2mU50vQmMUj
 l0XQ==
X-Gm-Message-State: AOAM533vkY7DPJKkwzzWb1XqKEsC7TdYguFZYF6WYTpVCYw+o7iJswcC
 YcAfM2KAMa6ekWOKBeaXJ06kKw==
X-Google-Smtp-Source: ABdhPJzzg/LAXFDpoxiAZZ5meePQ/7gwKsyt9vdAwPSEBuqVjNMYppZr+B2cYbL/wpgjRc5d0pmsyw==
X-Received: by 2002:a17:902:c94a:b0:151:8a66:ee8d with SMTP id
 i10-20020a170902c94a00b001518a66ee8dmr12777916pla.163.1646323838653; 
 Thu, 03 Mar 2022 08:10:38 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:e819:4400:f268:c391?
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm8659399pjp.39.2022.03.03.08.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 08:10:38 -0800 (PST)
Message-ID: <4a7c14c6-4f79-2ac8-e1fd-8168eaf09dac@linaro.org>
Date: Thu, 3 Mar 2022 06:10:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] target/arm/translate-neon: UNDEF if VLD1/VST1 stride
 bits are non-zero
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303113741.2156877-1-peter.maydell@linaro.org>
 <20220303113741.2156877-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303113741.2156877-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 01:37, Peter Maydell wrote:
> For VLD1/VST1 (single element to one lane) we are only accessing one
> register, and so the 'stride' is meaningless.  The bits that would
> specify stride (insn bit [4] for size=1, bit [6] for size=2) are
> specified to be zero in the encoding (which would correspond to a
> stride of 1 for VLD2/VLD3/VLD4 etc), and we must UNDEF if they are
> not.
> 
> We failed to make this check, which meant that we would incorrectly
> handle some instruction patterns as loads or stores instead of
> UNDEFing them. Enforce that stride == 1 for the nregs == 1 case.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/890
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/translate-neon.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
> index 3854dd35163..072fdc1e6ee 100644
> --- a/target/arm/translate-neon.c
> +++ b/target/arm/translate-neon.c
> @@ -657,6 +657,9 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
>       /* Catch the UNDEF cases. This is unavoidably a bit messy. */
>       switch (nregs) {
>       case 1:
> +        if (a->stride != 1) {
> +            return false;
> +        }
>           if (((a->align & (1 << a->size)) != 0) ||
>               (a->size == 2 && (a->align == 1 || a->align == 2))) {
>               return false;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~

