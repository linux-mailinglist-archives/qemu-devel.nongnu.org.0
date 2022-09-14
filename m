Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABEB5B893A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:35:33 +0200 (CEST)
Received: from localhost ([::1]:46256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSY9-0004gi-3S
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSB6-0003IK-VZ
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:11:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSB1-00072b-FR
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:11:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t7so25593826wrm.10
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=rg93hBoskKTQAHD3JtfZ7XMCAPpp5sGQYiEt9+ZELqE=;
 b=tsWaz6BlVbW2zXAvMGqOAFV9+BsUIrpT1ipTCN5jfMSj4tnbCZnveTjjsK9UDx0/Jb
 xXqBg6hqjUap+gIzxeiKazxe0U5gBzwsWeBjVSpnHwnchmT5eBaE1d5KbRhY+Y6tDgTu
 EnjS54xWdW39HLgwAzHC1Vlk+14UybrI//ltp2fASxafbc/H0l08LyueMV/OlHEOEnwx
 SYGtAy9bgD6cGgH6issjQoL1BqcjfYRWOvJFx4fERdJdRxtF+imY6UkMW0Elf7f0Y7oK
 Gaju7Pi0WwJNl4YKy9rHOIe7vP+6SXByNtd2TjGwOcN/Dot14435rlffHrvCTNc5ttwI
 34Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rg93hBoskKTQAHD3JtfZ7XMCAPpp5sGQYiEt9+ZELqE=;
 b=n4ZZd1Sr9kCcc34pSr8BHE8nMZ2zzU7uPPGpO59oVscyUxv9P5YjQAyl5KIDwlbl6q
 4IIBztrzU8QWVObXZgb3t8NRfKl1w5rkT0rFmlqTlrFIBO4ha4BXR7yDLqp7T2TcTnNV
 r558fXcLCViXhY8JlsLVtcp9XtHX7BvRRtZs/L5+CjqL9ZXxQ7MOQt6adyTSBsfVbTSC
 kAxvFMthEeySRs45Jt1Ziu45LEsDJ43uJi9yu+/Gu9P+24BRqsDSqPhgKbq7sE5G/+1x
 fnBrQouXvq0M+SIICVjeaz+S3tiJs9OVY5M2HjS4/PYQ6f8Srtvt3GWfYE9kJfZ6kZ0g
 jxTg==
X-Gm-Message-State: ACgBeo2Xl1kyvgamOLmcL5ZVx8+5lFaB628VqAPv+6ys0DoDgHEipV9Z
 mvC18Z9A5tii5BobEp1J/+tgEA==
X-Google-Smtp-Source: AA6agR4+hj0ezyKmxAJL6W3GiQajCU7g5KJnmqUqEQY8B0sRZrT8QEnb3vNWQcMuXKEnFSCGVr0a3g==
X-Received: by 2002:a5d:45c6:0:b0:228:8bda:f345 with SMTP id
 b6-20020a5d45c6000000b002288bdaf345mr21581138wrs.584.1663161097543; 
 Wed, 14 Sep 2022 06:11:37 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 k3-20020adff5c3000000b00228cd9f6349sm13503911wrp.106.2022.09.14.06.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 06:11:36 -0700 (PDT)
Message-ID: <dbcca868-afee-2457-33ed-4d0274945c2b@linaro.org>
Date: Wed, 14 Sep 2022 14:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: Fix alignment for VLD4.32
Content-Language: en-US
To: =?UTF-8?Q?Cl=c3=a9ment_Chigot?= <chigot@adacore.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20220914105058.2787404-1-chigot@adacore.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914105058.2787404-1-chigot@adacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 9/14/22 11:50, Clément Chigot wrote:
> When requested, the alignment for VLD4.32 is 8 and not 16.
> 
> See ARM documentation about VLD4 encoding:
>      ebytes = 1 << UInt(size);
>      if size == '10' then
>          alignment = if a == '0' then 1 else 8;
>      else
>          alignment = if a == '0' then 1 else 4*ebytes;
> 
> Signed-off-by: Clément Chigot <chigot@adacore.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> ---
>   target/arm/translate-neon.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
> index 321c17e2c7..4016339d46 100644
> --- a/target/arm/translate-neon.c
> +++ b/target/arm/translate-neon.c
> @@ -584,7 +584,11 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
>           case 3:
>               return false;
>           case 4:
> -            align = pow2_align(size + 2);
> +            if (size == 2) {
> +                align = pow2_align(3);
> +            } else {
> +                align = pow2_align(size + 2);
> +            }
>               break;
>           default:
>               g_assert_not_reached();


