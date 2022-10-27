Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B446102A6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:24:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9Ps-0004oO-AV; Thu, 27 Oct 2022 16:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo9Pp-0004ny-Lm
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:23:49 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo9Pj-0003tJ-Cr
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:23:49 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s196so2708061pgs.3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QV9Gn+ZSEEsFZu8EbaTf3oN3ULyfPogPWjTw7H0V79U=;
 b=m2a56fvKh+6IYlJU+m26ZqvNioPuKbCLUticeEqIoHCEj4RzP13UL+eHCTMB4WZ77C
 8mm1jCOUNAebjTl/hH8qVMPWaaufnm7Wz2nU81bIC0jBGiOK2Nh0D1cm2T5gEFnnYnkQ
 aKT8Qgmi/TPeoVIV7biz/GGsE/NTV2285BoqqyxOOYcPE+JfkWFBrqZzl7oewD+Veqx7
 g5NfmdCUofNBawVtFbVFX9fg7KEjNZfeqpJi4/DERiCaeJbzTPxTuv9q25xn6Z7u37TW
 N38/1fOkhpa/yESIZdmNmUG+a+GKQqgeWyKx+96Irx824Pcj2FTb2pMung57vZfc4ddE
 Yu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QV9Gn+ZSEEsFZu8EbaTf3oN3ULyfPogPWjTw7H0V79U=;
 b=7pPWtyRtlOxnOL9wRwEGgrbdE8t7xxSiFT/XX3nKyKGoXSKuKEcFVvpwdAm/yk6aVY
 v5GboawN/khfKw9o7BXGJ97ofa+EwSa2WFBuE+Ncqd2OM/ihSG3BUUViCeRGmiTiAIg3
 sd07z91WhUaABYlL/g5GgmhuCcPW4wp4HVuWt33wyFVX5GiJNOJhr5SVv6iWUEe6I+DA
 02+tcK3AGA67Al12XMSSNYBBdrpsilhBDzp7fFj8jf4/U/4UMOBgxcVT5V4T8ZIh3Fx3
 Nz85Bwcs+RyY2xQDytYUTY01QJIsRpq7TANS5zR8y2+cBfL45LgCty5ix03zAe6gPwJA
 06HQ==
X-Gm-Message-State: ACrzQf1YkbMIa/2D/LhVSQSN3DxozuJ4VgDbLKIIhnwDLV3JxPU8Nnag
 IMiekvjaEVEOjFc841Omn1W7uq2/TTnSZced
X-Google-Smtp-Source: AMsMyM6majxgYWp6t07O/K/V1D5sYblxObOmEGRJl/6E9GQPVVTOqrT3bzLkn3qeeyXjrAMV90a1hA==
X-Received: by 2002:a17:902:6a86:b0:176:a6bc:54c0 with SMTP id
 n6-20020a1709026a8600b00176a6bc54c0mr51743159plk.87.1666902210493; 
 Thu, 27 Oct 2022 13:23:30 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:93c4:c1c9:4368:47fa?
 ([2001:8003:501a:d301:93c4:c1c9:4368:47fa])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a1709027fc800b00179eb1576bbsm1554171plb.190.2022.10.27.13.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 13:23:30 -0700 (PDT)
Message-ID: <f0536c45-d0fb-160b-e80c-41100f507cc6@linaro.org>
Date: Fri, 28 Oct 2022 06:23:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] hw/arm/boot: Set SCR_EL3.HXEn when booting kernel
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jerome Forissier <jerome.forissier@linaro.org>
References: <20221027140207.413084-1-peter.maydell@linaro.org>
 <20221027140207.413084-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221027140207.413084-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 00:02, Peter Maydell wrote:
> When we direct boot a kernel on a CPU which emulates EL3, we need to
> set up the EL3 system registers as the Linux kernel documentation
> specifies:
>       https://www.kernel.org/doc/Documentation/arm64/booting.rst
> 
> For CPUs with FEAT_HCX support this includes:
>      - SCR_EL3.HXEn (bit 38) must be initialised to 0b1.
> 
> but we forgot to do this when implementing FEAT_HCX, which would mean
> that a guest trying to access the HCRX_EL2 register would crash.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/boot.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

