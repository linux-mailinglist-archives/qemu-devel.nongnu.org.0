Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833166AFA0F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZgNj-0002jx-RV; Tue, 07 Mar 2023 18:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZgNh-0002i2-7w
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:06:05 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZgNf-0002Z1-HU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:06:04 -0500
Received: by mail-wr1-x435.google.com with SMTP id h14so13719855wru.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678230362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6PF7gtiW+nQPEEaK9tvRcxY6Cf3GrgzeBjzE37I4ToE=;
 b=pC9tDS3dUL2CYjpxEHglx3tB9EAo1buLRGp5MOd0Jdss22AsZSAh+Z/ZYQHSRsXHfb
 ic/PBRne2WO/Evda57zt0BWtxvJnObeg6m+XmOuT+6TqWnR4wxWF3ppQrDwP8xzKrSH4
 lTearuc7B5H0H3ZfjShNFhC0h+/QPzknNm1Cdsfuo4OvntFQHaJbgpYs3/A4YFy4/acT
 xX7eVtLj90oVLJ3APbCTOD8JE1O6f2ijCZvELvnMcO8XKbqWTuJzdCvXAGe+FbZA3WKK
 fereGUWe02FhZY6gHbQa11V2LiJOvudwBWaWqowIYFS3ni+GMKJ75HX5k88N1iYHoLyB
 zLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678230362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6PF7gtiW+nQPEEaK9tvRcxY6Cf3GrgzeBjzE37I4ToE=;
 b=bL+BxXNXoxi9zyPwRQ1NcNrHT1FdDhH5pwbHgH60Mi28uj+zm2CHbwpp2swxP+h2zn
 mcLdXlApQut4gpoBv2ayspHbOAzrmy7A4I8JfkCNfGr0kt9+bw8ZRpc+2umKvNBc5mWE
 ZoHICpWx4K3B1puDSlnHQI+cOsKRMSrE591CZRKYuyYzK/8+R5nOaYSUO9CQuafOAwoK
 knyrMk6/e0uKIpj7+D3ZQSyiBrdaXXRAyjWyOMp2NO4blWa3cX2BIf3Mo1AGjQZKuYK2
 z2IqR3pfaCthHW8q/NazldYRybP5boYdeSRJWzFgfV1MpP8qgHdbU8ejYT2U21PZSjJL
 Namg==
X-Gm-Message-State: AO0yUKWzA6H9IYYW/Up6qKruqVc3Y25098cu6U2UdNunnIa1i9oLFpYG
 P3+UNbFp8+J/vB4TamUGzpcqoA==
X-Google-Smtp-Source: AK7set9bgx/kJv+AIn0+KHOu3T6b2MNB5wKVVcyy+Ak1JpBw/UKxRbCXNzkOrjK9mJ4rA76X2ICQIg==
X-Received: by 2002:adf:f2ce:0:b0:2c5:5fe2:bcee with SMTP id
 d14-20020adff2ce000000b002c55fe2bceemr10303204wrp.8.1678230361934; 
 Tue, 07 Mar 2023 15:06:01 -0800 (PST)
Received: from [192.168.1.115] (52.red-88-28-28.dynamicip.rima-tde.net.
 [88.28.28.52]) by smtp.gmail.com with ESMTPSA id
 t20-20020a0560001a5400b002c54f4d0f71sm13921304wry.38.2023.03.07.15.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 15:06:01 -0800 (PST)
Message-ID: <8421bfe0-bfbb-3f8d-1a51-0d6a62091864@linaro.org>
Date: Wed, 8 Mar 2023 00:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06/25] target/arm: Improve trans_BFCI
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/3/23 19:34, Richard Henderson wrote:
> Reorg temporary usage so that we can use tcg_constant_i32.
> tcg_gen_deposit_i32 already has a width == 32 special case,
> so remove the check here.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-arm@nongnu.org
> ---
>   target/arm/tcg/translate.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


