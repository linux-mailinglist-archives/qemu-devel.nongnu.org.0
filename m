Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F269B412962
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:24:23 +0200 (CEST)
Received: from localhost ([::1]:54884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSe7-0007do-22
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSbw-00056w-KT
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:22:08 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSbu-0000j8-15
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:22:08 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w11so2568528plz.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EFWU8q5+zHesJdxCfwMInzCUHZEGzR7FrLtHpC+MS1I=;
 b=GZMLs4cmCKTZJD+TrbASRUWEQljMVDkG/3vHsUDnaadQmfQ+2o/qtLc1MGEjf4ya91
 VyYRLoE/LNP0AB9EwNWfAaT0Cmlci2o812DHPy7rMYkmlcwnHMuZ0yoM9KQ8YHl/Eb1x
 vbTfvwD7wXNF02u+a8wE1z00/lrOhUwOYctKIKoN7p/AdV1uXNuhyZ+ESdxRnk/QVNAL
 dgnH2DRnLZcGdKOJiCbXgDwsALrVv96ap9JQisqFBPNyHXxmUBfKGTAv213NWDDu2m//
 qf1MICDohZusJhIoIDNw6nBIggZk6mfjUv28gvdBcPWhxlOVRAK1YVfiZM4CzxvjNGf4
 xtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EFWU8q5+zHesJdxCfwMInzCUHZEGzR7FrLtHpC+MS1I=;
 b=ECRH9ZfBYjOd0rnXIzbm1l4O7dH88McF18FzOx2ZXi5cjso6CLKO6LGqIR/nk7AC4I
 +7Ha0LbQBqw3NO7fiU6a871Yw6Qz0mYzWOFUaEQOdNuUs5cc8JDyO8b+g5x4sdV9P886
 ScerY6rFy/p8g3UHG9E5SA8gALfh+vKPW+RTzIS00jiUBTCmw8ix6DJHf36rqpIejaAT
 +hKP8GpNDUYuAaigHW89P6Af5S9/QAReEDlTHbrNUJz2oxTWSKRZHW618Pi2h+AeVkcP
 UHPNoCJjd1Mg1BfZ8CsmQKr0Nn4RN5Y+SaqDEn45TxK/imjVnQiaf3Ay0GCeBYwO4PrL
 0bNQ==
X-Gm-Message-State: AOAM532vVDulzsDQFgwQ3Rwl7LeDRd+nnsVt+51PxTpjn7Ro3qHTHyqn
 VPo3o+Pz+eXcxu+VFg15uza2Hw==
X-Google-Smtp-Source: ABdhPJy10oTvd4hg9oE7qP8WRvHBWpbaf2R8MuJ4I7h35Oitdd06wEIWwJ1FTkGPPTxMLZ73vpJ9cQ==
X-Received: by 2002:a17:90b:17ca:: with SMTP id
 me10mr1656562pjb.171.1632180124637; 
 Mon, 20 Sep 2021 16:22:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b129sm13668884pfg.157.2021.09.20.16.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:22:04 -0700 (PDT)
Subject: Re: [PATCH v3 19/30] Hexagon HVX (target/hexagon) helper overrides -
 vector logical ops
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-20-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <284b9a5c-aa6c-01d8-e7c2-2865cbd750a5@linaro.org>
Date: Mon, 20 Sep 2021 16:22:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-20-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> +#define fGEN_TCG_V6_pred_xor(SHORTCODE) \
> +    tcg_gen_gvec_xor(MO_64, QdV_off, QsV_off, QtV_off, \
> +                     sizeof(MMQReg), sizeof(MMQReg))
> +
> +#define fGEN_TCG_V6_pred_or_n(SHORTCODE) \
> +    do { \
> +        intptr_t tmpoff = offsetof(CPUHexagonState, qtmp); \
> +        tcg_gen_gvec_not(MO_64, tmpoff, QtV_off, \
> +                         sizeof(MMQReg), sizeof(MMQReg)); \
> +        tcg_gen_gvec_or(MO_64, QdV_off, QsV_off, tmpoff, \
> +                        sizeof(MMQReg), sizeof(MMQReg)); \
> +    } while (0)

tcg_gen_gvec_orc.

> +#define fGEN_TCG_V6_pred_and_n(SHORTCODE) \
> +    do { \
> +        intptr_t tmpoff = offsetof(CPUHexagonState, qtmp); \
> +        tcg_gen_gvec_not(MO_64, tmpoff, QtV_off, \
> +                         sizeof(MMQReg), sizeof(MMQReg)); \
> +        tcg_gen_gvec_and(MO_64, QdV_off, QsV_off, tmpoff, \
> +                         sizeof(MMQReg), sizeof(MMQReg)); \
> +    } while (0)

tcg_gen_gvec_andc.


r~

