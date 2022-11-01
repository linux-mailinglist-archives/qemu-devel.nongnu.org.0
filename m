Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342106143FA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 05:48:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opjAq-0003gp-Gl; Tue, 01 Nov 2022 00:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opjAo-0003gB-49
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 00:46:50 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opjAl-0005lx-9F
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 00:46:49 -0400
Received: by mail-pg1-x52f.google.com with SMTP id h193so3780731pgc.10
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 21:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+mfPV3qHYsPWbb4jil5DssIm5iiXUo3d+plbLB2MmA=;
 b=SJNfRloYlVuCQcSj5nwgzVh+27pV7aLuk5VRkVX4XJkxJpt1/U8DP6PjrkB+WgXSY5
 Wwc3H0/Q8Es/JYfgMTjrUO/0F+tkEI+0FIPHlZTD6VnmcdI9Ofrn5Cjcn9r52/zrUmcK
 gC9v8A5WaWv4R1bibxalIlCFk/M2PtrF7BMRnXufVz+2rEVVMgWPJ0winwfasmd+4izt
 DlKmklgErBdN43634/c1u5dAIHWCjzP9B7X4dfy+vMsBEUUPtklJewUbZk2kf8AvQb7M
 g6RY/gPUXu3dz2lJOjIK1LecyR5sLzQe7vuIfLkTn4L+ILNL0w45m/yblo9dJ+4JmIup
 ySWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F+mfPV3qHYsPWbb4jil5DssIm5iiXUo3d+plbLB2MmA=;
 b=ICj/HJd5FwwZexfBF1hrea8iIgav0uH8hL3/oPwwIuqhFlf1LoKkxcGF3QZrtQTqG0
 96Va3jTzuh3FYGOgWY/giLHDNBwfsUf4mYM/bw1la3b4rGGiPxI8tsmKs+NN2RLVXSNh
 hmIxsy97S2xf3H5b9qmMjsf4AvSBhVS1bck05bZHCS5qYP6kSwxY0f6nStVgTLhqjibf
 Okk0piLjyQomLTS83x03pAF1a6eKGdYu9DIXY94wfsOCHyWvge/GpYvBDcHmd2RGXaTD
 yA8hVMTKzMHHiU2UqEC3pd+ynlJM1wwDSEwsVpZauCoYou3yMfc6AExh6ohkCc9JJZtw
 l31w==
X-Gm-Message-State: ACrzQf2eKHS6RaXZlEcNvCdfwATIDy+mVH8eTaojKDmgJ5EkYQEmc90H
 X/GCgZpgUpV0S2nNlisey0hpvQ==
X-Google-Smtp-Source: AMsMyM5RGGbtgzV8YIUghqn63kNhmRq63SxoL5205C9uqGjhOaCjY8YwcSgZ9s/Sa1oYwkM9948IWg==
X-Received: by 2002:a63:d66:0:b0:46f:8979:30e2 with SMTP id
 38-20020a630d66000000b0046f897930e2mr12861450pgn.348.1667278004983; 
 Mon, 31 Oct 2022 21:46:44 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.27.227])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709026f1600b001708c4ebbaesm5178023plk.309.2022.10.31.21.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 21:46:44 -0700 (PDT)
Message-ID: <b923ecf1-0a77-d724-b962-e8d789c8158a@linaro.org>
Date: Tue, 1 Nov 2022 11:00:11 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] target/arm: honor HCR_E2H and HCR_TGE in ats_write64()
Content-Language: en-US
To: Ake Koomsin <ake@igel.co.jp>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221031084324.844220-1-ake@igel.co.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221031084324.844220-1-ake@igel.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 10/31/22 19:43, Ake Koomsin wrote:
> We need to check HCR_E2H and HCR_TGE to select the right MMU index for
> the correct translation regime.
> 
> To check for EL2&0 translation regime:
> - For S1E0*, S1E1* and S12E* ops, check both HCR_E2H and HCR_TGE
> - For S1E2* ops, check only HCR_E2H
> 
> Signed-off-by: Ake Koomsin <ake@igel.co.jp>
> ---
> 
> v2:
> - Rebase with the latest upstream
> - It turns out that we need to check both HCR_E2H and HCR_TGE for
>    S1E0*, S1E1* and S12E* address translation as well according to the
>    Architecture Manual.
> 
> v1:
> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02627.html
> 
>   target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++------
>   1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b070a20f1a..f7b988395a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3501,19 +3501,33 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
>       MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
>       ARMMMUIdx mmu_idx;
>       int secure = arm_is_secure_below_el3(env);
> +    bool regime_e20 = (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) ==
> +                      (HCR_E2H | HCR_TGE);

Record arm_hcr_el2_eff in a local here...

>           case 4: /* AT S1E2R, AT S1E2W */
> -            mmu_idx = ARMMMUIdx_E2;
> +            if ((arm_hcr_el2_eff(env) & HCR_E2H) == HCR_E2H) {

... so you don't need to recompute it here.
Also, you can drop the "==" since HCR_E2H is a single bit.

The rest could perhaps be more compact with "?:", but is ok.


r~

