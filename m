Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81335F1458
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:08:03 +0200 (CEST)
Received: from localhost ([::1]:44226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNEo-00032w-Po
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNCe-0000Fp-RW
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:05:48 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:34670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNCd-0002Yi-60
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:05:48 -0400
Received: by mail-qk1-x72a.google.com with SMTP id g2so3593076qkk.1
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=A/otbw6KAlpXQOy5Op0Q2AvCLsWSi1dH/8t3Ao2V1mo=;
 b=nfpoToD87Axl+lPIaJvvE5cfhVJF31JGDc9zEjP9jQKDELKDmyi+0+qFyL0PBaloTc
 c7CKaNTnocLiYTlpXjshK/PUWBfJvYLOfp0yZpYiONBHUD4UaLrUatjTTebjPi8WsjfW
 TMLYSmdi4/RytaXI+1jNi5fq4yFcYHeiEVipzGsCIsvcdt7xB0lUZY5w1OjQiqpeOHnM
 ki8+VgI+UomTbsdLoE5gaH5TcIE0wxzdEE4XM2Kyy7OGRv/pF2X1vBjUNhP9K5Y0o661
 fgs73VImu1O8OUpH1pTWUmB1FB/V+UoVmML72cLDY/Rqi+bJdrzK749Wcehlx/GUan5e
 gLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=A/otbw6KAlpXQOy5Op0Q2AvCLsWSi1dH/8t3Ao2V1mo=;
 b=qKvQuL21cThcO9th73L5pkKAvl/i4jtZpQDBSdAXmkib0Ig71XaodApPyn1M9+qjIS
 hSFGN6lST+dSsSeOgVruSRr3lTqEPIutmufZCThs7A1T/cjJ6Sl24JAKgv8QJdNNO4YZ
 RsLlnOkNZJjtxs7p0EORIiPj90psB9xm0sPhYTyYbOPwmqt7BSiGeRqhLCJtQI7HVvZy
 TDeteEzZRXoa6jjstH/K2Si/hdR2bm1F+0W0B2RubJt5kpmFZJYuqmRgw95gLsGgrG84
 8sD+yBtaId6Zu4ijMnmfUXZ3bVYBeZ0HxK7IXSXlOUM/6Q2GYXbXCkI3A9HWHG4ezQ/T
 NnlA==
X-Gm-Message-State: ACrzQf3YM8PU7HqTZ+0RCXOay6wkNU7VSCsI+ssdOEYpBt2xdpkT78c0
 bcpR9t57c4F+VTtj+u2vqfFNNAIUz+iOZg==
X-Google-Smtp-Source: AMsMyM6+goNDBRwwFsc6XTd3zIW9Ih2x2Z6im+yyt4H9uhqwpxl4gHLjoNbeMMZsGb2Zka5XDvuUxw==
X-Received: by 2002:a37:aa4d:0:b0:6cd:7fc7:7217 with SMTP id
 t74-20020a37aa4d000000b006cd7fc77217mr7430797qke.193.1664571946324; 
 Fri, 30 Sep 2022 14:05:46 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80a1:5a60:d0d7:468b:5667:114b?
 ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a05620a450200b006b61b2cb1d2sm3252106qkp.46.2022.09.30.14.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 14:05:45 -0700 (PDT)
Message-ID: <236d72a7-c7e8-cb63-339c-acd0adcaaa71@linaro.org>
Date: Fri, 30 Sep 2022 13:16:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Hexagon (gen_tcg_funcs.py): avoid duplicated tcg code on
 A_CVI_NEW
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com
References: <fa706b192b2a3a0ffbd399fa8dbf0d5b2c5b82d9.1664568492.git.quic_mathbern@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <fa706b192b2a3a0ffbd399fa8dbf0d5b2c5b82d9.1664568492.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/22 13:08, Matheus Tavares Bernardino wrote:
> Hexagon instructions with the A_CVI_NEW attribute produce a vector value
> that can be used in the same packet. The python function responsible for
> generating code for such instructions has a typo ("if" instead of
> "elif"), which makes genptr_dst_write_ext() be executed twice, thus also
> generating the same tcg code twice. Fortunately, this doesn't cause any
> problems for correctness, but it is less efficient than it could be. Fix
> it by using an "elif" and avoiding the unnecessary extra code gen.
> 
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   target/hexagon/gen_tcg_funcs.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
> index d72c689ad7..6dea02b0b9 100755
> --- a/target/hexagon/gen_tcg_funcs.py
> +++ b/target/hexagon/gen_tcg_funcs.py
> @@ -548,7 +548,7 @@ def genptr_dst_write_opn(f,regtype, regid, tag):
>           if (hex_common.is_hvx_reg(regtype)):
>               if (hex_common.is_new_result(tag)):
>                   genptr_dst_write_ext(f, tag, regtype, regid, "EXT_NEW")
> -            if (hex_common.is_tmp_result(tag)):
> +            elif (hex_common.is_tmp_result(tag)):
>                   genptr_dst_write_ext(f, tag, regtype, regid, "EXT_TMP")
>               else:
>                   genptr_dst_write_ext(f, tag, regtype, regid, "EXT_DFL")

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

