Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C10650EC4E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 00:56:37 +0200 (CEST)
Received: from localhost ([::1]:33622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj7dE-0005LT-45
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 18:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj7cC-0004MF-93
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:55:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj7cA-00023o-L5
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:55:31 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so642922pjn.3
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 15:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KxsJG3icAwurLci+IhOUGHqXCnueKOgNNcp9Vf1kbec=;
 b=Hb4xb0HziqlmkQtLU5Awp8ykPxSr7SeW/7YElOJIc7nbMcX/RK8JO1S6b1bEomMVlV
 1iSce2Qt4F3dSLbmvERsK9OHTNM8t4QQxEmaA1+InBmYyN/Vf/iziLflFIFmbTpCkBWP
 2GzSn0LTLzR/kWlCuw9/3nNPzJWrTCvccoy32s8cTF7fe2OWar/SgWCghlu08Xvig8rC
 j1nh8cbwbwGP+cu0fv+Uq5Ue7fXaYfHz9BJQOOk7+k8kZQbfhW3/gW1zidhe/BWuXN+p
 +l+keThGeRsrdO1iV9E1kwntK+iow1D+waPfEfI1Vzj1MM3QGg5YjJXFbx8sgRNiqntI
 eOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KxsJG3icAwurLci+IhOUGHqXCnueKOgNNcp9Vf1kbec=;
 b=WAk1lYJmV2eUgrzM3ELOu0l+hjzg1MvQLxDfzoXG9a48VRf2OeQujayEDpIVxxjLpq
 LZ/waXbqOvurZ3y+b90aZEAr5ij4z5kdetqtWLfoFbyvu70/4z4C+eYs2iKpOQU04tc7
 uiNMQpicetaHEdOAuuPQNRs/5nfd0mP1+P6GGjpcd1gJvh9jiR93SN0GZEGdkxaFne4f
 gwylv7PBYB1CRGrGQa2hWILZ6BPa61pNCe42DzxfDUY2RaSDfEn3e/B9nDZhIC3kWF36
 CSI1PaI93CbZyT6E6c4GXlpjKzK/yL/XdHkYf3gPvg5IW7v6PoEY+bGDYWDMGnMgafg6
 ePHQ==
X-Gm-Message-State: AOAM530pCBBMcma2piuSc4cK/RGT0fgCF+Icem6NVNjcCfj/VEobwKFx
 r8DcV+wMSCMdv5QFh6f7yR7gHQ==
X-Google-Smtp-Source: ABdhPJwXpTsfgGa4+bxJJTm0T3TaKBwtJaA1Xu3mpNt/eKQ20fKkH8+yAGtRTSUHJ6ZmDWYWNscZiA==
X-Received: by 2002:a17:902:9b92:b0:158:9b65:a78 with SMTP id
 y18-20020a1709029b9200b001589b650a78mr20498164plp.53.1650927329221; 
 Mon, 25 Apr 2022 15:55:29 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a637204000000b00398522203a2sm11101495pgc.80.2022.04.25.15.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 15:55:28 -0700 (PDT)
Message-ID: <cc6c67a1-d1c7-49dd-b661-23afdc5a308d@linaro.org>
Date: Mon, 25 Apr 2022 15:55:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 25/43] target/loongarch: Add LoongArch CSR instruction
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-26-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-26-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> +static void output_r_csr(DisasContext *ctx, arg_r_csr *a,
> +                         const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "r%d, %d # %s", a->rd, a->csr, csr_names[a->csr]);
> +}
> +
> +static void output_rr_csr(DisasContext *ctx, arg_rr_csr *a,
> +                          const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "r%d, r%d, %d # %s",
> +           a->rd, a->rj, a->csr, csr_names[a->csr]);

Need to check for csr not in csr_names.

> +    CSR_OFF_FLAGS(CPUID, CSRFL_READONLY),

You've dropped the special case from the previous version.  Why?


r~

