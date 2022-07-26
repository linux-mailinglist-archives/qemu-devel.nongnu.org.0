Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB17581C1D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 00:33:13 +0200 (CEST)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGT72-0002AN-RO
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 18:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGT4W-0000AJ-6S
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 18:30:36 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGT4U-00081X-Hn
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 18:30:35 -0400
Received: by mail-pl1-x633.google.com with SMTP id y15so14571270plp.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 15:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EAOh7ody7FjcYbY421CRDtj6XGuAd4ZPAqoBV1psZH4=;
 b=ZW+fQzUbD3eFmyGwPgfRPCxf1/q49AU+Cvm0f9Z4i2bZU8/ExAKzmhFPt/RC0ut+or
 rwDz3iXTw6OyNVeKsc1YWqsPkNuL5jvGSAhC7T2hMdhqwIWt1QCzLinHJAcy5fFpJuCp
 dRZvW5qCBICyJKTSrcKCBzZ+LNU+qua0jY9I/y92JD0zyLbs+gj93xdQ+z7mGkH5hFhR
 U7Nsyq5LLUthjEyXsjD9ZweS/tPZp6ly/5ltxb2iBGFyNkvbw6Skk0RU1wg4sb9lN5Ak
 jpCYeZ+C2VIZoQhoLsp4WUgn/NHQ5jRdq4QL/Xenalcez5qctUPvJo3ddfDBBPCyaIgD
 13dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EAOh7ody7FjcYbY421CRDtj6XGuAd4ZPAqoBV1psZH4=;
 b=IR5SrVOQrzy4Q2szMpP6YycK5vW/iCFIgEXCdMH7m4SFMv3OYnqH7Ggg6HKXET7get
 Gw2cGQvnda0qpejBduVwX30kiVkOO7GnU5k07ubE6HD+DeoJnuSdrseFiXuii8X5CNLW
 TuM1wur+9vW+YKnoVd3K41UNxu64STkIjkLmSCZ/qfgy+ccUHr4t3FGnJETXE8N2eBOo
 Ofe/Peyn9vDeXSdYWUNhjN143zjXdbEYxkYfOh4rg7kNDsHlT+8TyoMYbNZZu9ZYcyBo
 Nte7B59ShGv2LgKSRhuk2FVQSOWPWVrs2efW7NMN5zy3HfV0azaHnjbL79OD+x9g09Pk
 eHKA==
X-Gm-Message-State: AJIora9ni3OsuzadoohS6i+YEZcA0kzxSc0h/vsnqiJR1W53k+0UInAv
 l376UMepo2Kc533zEGkSEFHm7g==
X-Google-Smtp-Source: AGRyM1v4aL0neq+yfn3Fk/moDVdAG9RkKCstEyNnTwVr4bCC2jdbNZ/qkt5se6+YRY3ODjLJj61wlw==
X-Received: by 2002:a17:902:a604:b0:16d:9bde:8657 with SMTP id
 u4-20020a170902a60400b0016d9bde8657mr5197045plq.17.1658874632013; 
 Tue, 26 Jul 2022 15:30:32 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:33b:7a10:8a4c:53bc?
 ([2602:ae:1549:801:33b:7a10:8a4c:53bc])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016a3248376esm12003010plk.181.2022.07.26.15.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 15:30:31 -0700 (PDT)
Message-ID: <219fb09f-c46a-4dda-9ab7-ebb0772c17f5@linaro.org>
Date: Tue, 26 Jul 2022 15:30:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] pci: Sanity check mask argument to pci_set_*_by_mask()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220726163206.1780707-1-peter.maydell@linaro.org>
 <20220726163206.1780707-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220726163206.1780707-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/22 09:32, Peter Maydell wrote:
> Coverity complains that in functions like pci_set_word_by_mask()
> we might end up shifting by more than 31 bits. This is true,
> but only if the caller passes in a zero mask. Help Coverity out
> by asserting that the mask argument is valid.
> 
> Fixes: CID 1487168
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Note that only 1 of these 4 functions is used, and that only
> in 2 places in the codebase. In both cases the mask argument
> is a compile-time constant.
> ---
>   include/hw/pci/pci.h | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index c79144bc5ef..0392b947b8b 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -688,7 +688,10 @@ static inline void
>   pci_set_byte_by_mask(uint8_t *config, uint8_t mask, uint8_t reg)
>   {
>       uint8_t val = pci_get_byte(config);
> -    uint8_t rval = reg << ctz32(mask);
> +    uint8_t rval;
> +
> +    assert(mask & 0xff);

Why the and, especially considering the uint8_t type?

> @@ -696,7 +699,10 @@ static inline void
>   pci_set_word_by_mask(uint8_t *config, uint16_t mask, uint16_t reg)
>   {
>       uint16_t val = pci_get_word(config);
> -    uint16_t rval = reg << ctz32(mask);
> +    uint16_t rval;
> +
> +    assert(mask & 0xffff);

Similarly.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

