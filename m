Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11EC440BB1
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 23:20:01 +0200 (CEST)
Received: from localhost ([::1]:49100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgvlh-0002y3-01
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 17:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgvjn-0001F4-UG
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 17:18:03 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgvjj-0005Y4-GN
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 17:18:03 -0400
Received: by mail-pj1-x1031.google.com with SMTP id om14so9617363pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 14:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GmlwuQGAwfhDRi2M2wGN7Pkpi1bbLs62V/cSC2FB/B8=;
 b=ZPw+I8IOreJ0wLSYnXmM6X+osgyJtMqIqipN1hXton0tiUWXvtIUotp0GEjS0Wlql4
 lupULO+Oj1dKHOQ1VBtxNZwrEELNGQ/2tkTFUTIdEzhpWddfSqvDEwE0IQAd4SQNyra3
 QqYpE84AGrmJQC8dB4n6IZ4j99J/cdYPME5LrUv2W15yjZ4TPAgUFNbQRVObj1yg1trO
 jS+uGQXKwljC4+RV283TA3fVifJ8uwsjrXFYV0wbu00Ce37fYJHbZci5z+9/v4AReNpn
 EExN6e6exhAaJOwDphnL2TMH42eEc+gQ45+9CAxpfyiVqvk/bnmZNB+zEL6eqvE368mF
 tA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GmlwuQGAwfhDRi2M2wGN7Pkpi1bbLs62V/cSC2FB/B8=;
 b=lzCDfTANwRX+CYZSj7xyiKQo09gUPNTq99AhosIKQsMWTLRkFO6FoOikiaePFjaHdS
 BPD02y0ogZlTtQvByW88VwkWmXbK7+EN+CCfRVIXHq7r7RxTf70yhDw59Tj0NAlY6RDr
 4gcmC9Gd8YaQk0KGMjU1seirg7p7otY6L9HX0yO6xuPLL5r62CyLMzAsoVuuae7Hszww
 ELWGZgshclzih+utq/SkadU7CA1t1zw89WE8vQR6Xbz74KNAnSvvtb2aWGVoJgkhJu5N
 FnScfsYPWjJGFFZ7JNEc0svR2O+tVYcMIsI/Sijnc9K81j2uRyKgsuFevSKuEOzVXDJw
 oIgw==
X-Gm-Message-State: AOAM532fWVTwmhmVfR2KxjXsb/x3bfa5niXAQnwJTOTnhj52fO/bDNhX
 YG3VJy4YOxxihsyKJiYTqZarY00/xd0dkA==
X-Google-Smtp-Source: ABdhPJxrNqVkQuBJRMYUpP21ugHl6Lpmom+TdU503FrI8Q9W4JAxEePWvR36nDma9HURm0j/giz9bQ==
X-Received: by 2002:a17:903:11cc:b0:13f:ecf7:22c7 with SMTP id
 q12-20020a17090311cc00b0013fecf722c7mr16779474plh.5.1635628678072; 
 Sat, 30 Oct 2021 14:17:58 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id v22sm10544854pff.93.2021.10.30.14.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 14:17:57 -0700 (PDT)
Subject: Re: [PATCH v2 08/34] target/ppc: Implement cnttzdm
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-9-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d0ba16d-1a6b-55d6-85a7-958e3874b2c9@linaro.org>
Date: Sat, 30 Oct 2021 14:17:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-9-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 1:23 PM, matheus.ferst@eldorado.org.br wrote:
> From: Luis Pires<luis.pires@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instruction:
> cnttzdm: Count Trailing Zeros Doubleword Under Bit Mask
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v2:
> - Inline implementation of cnttzdm
> ---
>   target/ppc/insn32.decode                   |  1 +
>   target/ppc/translate/fixedpoint-impl.c.inc | 28 ++++++++++++++++++----
>   2 files changed, 25 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

