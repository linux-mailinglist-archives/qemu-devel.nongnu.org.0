Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768AD4419F3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:32:47 +0100 (CET)
Received: from localhost ([::1]:43204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUcQ-0004vS-Ku
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUZm-0001cM-Gi
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:30:02 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:36668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUZk-0002n1-MV
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:30:01 -0400
Received: by mail-qt1-x834.google.com with SMTP id h14so14544974qtb.3
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VQopp7ZnprTdgenLJnbXh5i1g85SoAND0AEDo9Wz+70=;
 b=Q+G9tp7807hYKQtXVrTQUHLSLy/0K9/h2oyCM+ahzSzJZhl2GW8Bs1MBRvOKER/G5j
 4EGDVjG94vdMmpN7ilnTpVcJmz3flxFxOD//pzDOO1/4M43tuqz3dQy9lVmIegFMMABS
 dFxVaHMW8WI2YuR5brrVfQvbS1BHQcz2HVwKiPDyxWTPfoiDzp+CKUz+jev+glRnE9Ne
 goWkSnTIt8gkaCn/P/+Kq8qiYTKih0hoHM0q9gHjRPAgAiANDjMj0ggesd5NWem9ycwW
 m62AlQ+jL6jCK/Xw4UMn8fx8JthtDcw9wMdbBI3vwWIL68TCZG2jDdkL3h7THqkcJSIs
 0jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VQopp7ZnprTdgenLJnbXh5i1g85SoAND0AEDo9Wz+70=;
 b=2kUXjgucWOKvHBEVD697LfAZPbCfPUaknwEQt9hgSIGF9zEAfW1mQfoLvCkIU4d11/
 3tz7YY5b6I/788V8vT5FgV8SsXpBKUav2YmAydb9I0iaOiThTm9rQoZ7OjtSfG+Pv/yb
 Oi+dWfwWYvHHhA5ly5EA+0SRop1mOw+cGJdF7ZYqRPR9GdJyflUzxqy4bAOaaqm/LlXG
 qVMiQTkyjspxGJVRYn3WZz5U3tTeCDRIlZy9fR8pdNeuf5XEEicDUx1U8Y5rKaakTVK6
 mMclTDqcqLO1t3Uiv5G6S54plHEhxP2T5Sn8KS+LL/Fk8e4Nd4RQCcLzqD8lQPHnKhHm
 /0EQ==
X-Gm-Message-State: AOAM532NV1zL2dHyeFIVOxabOMlSs5ZyxHcfW/xmw6mI3pzFCqCXI0Ta
 Uxpwpv4QwHot1PLKM3YPUZk1HXsRU7kXxA==
X-Google-Smtp-Source: ABdhPJxozbheaTIzXP3dt1tTHIdufVH6E/TpoqJKZvgN9dl4FsxTW1jGyufGzitnEQW98/Wyp4UqHg==
X-Received: by 2002:a05:622a:83:: with SMTP id
 o3mr26948617qtw.377.1635762599318; 
 Mon, 01 Nov 2021 03:29:59 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id a124sm4368676qkc.64.2021.11.01.03.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:29:59 -0700 (PDT)
Subject: Re: [PATCH 01/13] target/riscv: Sign extend pc for different ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a827e6f4-0973-fa28-e331-45d5f3ee95ff@linaro.org>
Date: Mon, 1 Nov 2021 06:29:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> +static void gen_set_pc(DisasContext *ctx, target_ulong dest)
> +{
> +    TCGv t = tcg_constant_tl(dest);
> +    switch (get_ol(ctx)) {
> +    case MXL_RV32:
> +        tcg_gen_ext32s_tl(cpu_pc, t);

Don't compute with tcg to do what you can in C.  Dest is constant.
And I think that XL is more appropriate than OL (which *should* be the same, but still 
looks weird).

     if (get_xl(ctx) == MXL_RV32) {
         dest = (int32_t)dest;
     }
     tcg_gen_movi_tl(cpu_pc, dest);


r~

