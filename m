Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688F6203B8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:25:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osBKN-0005ij-EG; Mon, 07 Nov 2022 18:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBKK-0005e1-TD
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:14:48 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBKJ-0000g6-Ao
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:14:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id 5so7784775wmo.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VmAIZZG7Wy8fvzspuBXhWp0ntAe4BEOQBDzNTPwp6DY=;
 b=T/wFX7dMQa7hHpZWrFBMFMX5/3XmYuh8nL58dgKAUweNYsDWa/LFuNujNXEpkCKkBQ
 69hqhOlTJgU2StXm1ZHqkD37z0AimEhuWixlFdeyJ4iofEN7HtN/hetscko1tAwxJ8pA
 T2HVkhW0bIaP3FinlMT95+WDu3DTL4a5nOzfW2sdXPGkL8JX1HlVm/E+yV0RthIz73PS
 RFXPzrpKfxywzK5tjMhVK2rNgw2el0hz8+meMkHi+uyoe6ruFU6sEWRYdUISUTQqTgwb
 xpJLrJDspvK0+qQrF6hwNNYv/+0zA1JG4Fy0ff8JYBPSEggruM7OXxj0uE+duqGQosv2
 FNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VmAIZZG7Wy8fvzspuBXhWp0ntAe4BEOQBDzNTPwp6DY=;
 b=0zUUhcjnSkuSUm2bPbBTyvXJK1Ox1YKYSRVHtcwx0lYezWKftA1Vp9j2oX7YVT0dUY
 jyFK23jSSX+G9nhYxlfYM+AzIXanAN4PLSB3VzG1NeX++VQWyMAM56AYNX/DhUCEC2M0
 x4nrbxGJtL/PqXWxzrqh0uL1JDimYHctqSAlt0cQ/S/G2VVM+hAJlMaHu8clxBmSM6lR
 oU4bHbk8rZ9XH+pLNIfl7TLKqn+2/v/oIGDP1R3t9YlYOJuV/PNVrSeDDZ0v/P0ZJi2E
 uSRT4VIrxtxJwmKw+oytDR0Ba9/0z6dlGmJvSYIcw//WLoW2oNDkbA6EwFcomLuiseFR
 OBhQ==
X-Gm-Message-State: ACrzQf2CJnG/zG+LoXBkcVbtBhbZIWq25e0rjR+apz0SH3IjXwNiVa4A
 oE3dF7y+84HEE9dZvuYRQyRGwQ==
X-Google-Smtp-Source: AMsMyM7OfChRFEFeNeQw+AULDVS4RmmCPbdAJek5SYVNp8jzmXOMyFvwCQXugVHDQ6A8Rt/wqC4j8A==
X-Received: by 2002:a05:600c:2e46:b0:3cf:8a34:2e98 with SMTP id
 q6-20020a05600c2e4600b003cf8a342e98mr18265900wmf.30.1667862885374; 
 Mon, 07 Nov 2022 15:14:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a5d4888000000b0022e57e66824sm10083488wrq.99.2022.11.07.15.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 15:14:44 -0800 (PST)
Message-ID: <6c08ad4b-0fa0-e8d8-c4f1-cd362e2bd2cb@linaro.org>
Date: Tue, 8 Nov 2022 00:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/3] target/mips: Cast offset field of Octeon BBIT to
 int16_t
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, pavel.dovgalyuk@ispras.ru
References: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
 <20221031132531.18122-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221031132531.18122-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 31/10/22 14:25, Jiaxun Yang wrote:
> As per "Cavium Networks OCTEON Plus CN50XX Hardware Reference
> Manual" offset field is signed 16 bit value. However arg_BBIT.offset
> is unsigned. We need to cast it as signed to do address calculation.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2:
> Do casting in decodetree. (philmd)
> ---
>   target/mips/tcg/octeon.decode | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
> index 8929ad088e..0c787cb498 100644
> --- a/target/mips/tcg/octeon.decode
> +++ b/target/mips/tcg/octeon.decode
> @@ -12,7 +12,7 @@
>   # BBIT132    111110 ..... ..... ................
>   
>   %bbit_p      28:1 16:5
> -BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
> +BBIT         11 set:1 . 10 rs:5 ..... offset:s16 p=%bbit_p
>   
>   # Arithmetic
>   # BADDU rd, rs, rt

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


