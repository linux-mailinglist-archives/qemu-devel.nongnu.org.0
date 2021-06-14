Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE133A5F09
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:21:09 +0200 (CEST)
Received: from localhost ([::1]:60568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsimJ-0007o9-1R
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsilF-00074Q-99
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:20:01 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsilD-00080n-8b
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:20:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so12349395wmg.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/UHv/Vam9lzrKF8uEfn91Ve2R/0iH1vJvZIBJpSqeV0=;
 b=a49wVNLks9ikC4bMGZ6+B5COQPPSVPZuE1jjRiQLdLmM+M19VuGS15wQQ4uWPebMXq
 XMK0bl94hrokVlpTKM6BtVadls3RVsKI2Ixj49EAxfXGYKJMTlfv8dflPPeKjr8HCiOs
 VxuobNTeDg829acfF1TgHiBpxauIs6PqSM8TzHU4w/7B+BpK2UVsi+MPSPN46gTBPWvU
 BE1UV2kmYCnvvk6bjQM8N16R92/CcO+PiIjDUBqWOhyrmq80klzV098NMUTlC3uGXl6w
 84EqVMfgumF1faw77Ml01rm72x8jy51E8js/nso4mlkKUrfkr4qZE/FD0Q4UcPyfOass
 VBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/UHv/Vam9lzrKF8uEfn91Ve2R/0iH1vJvZIBJpSqeV0=;
 b=mjVCGAcApI5yYfqAepqplgrDRtAWvT/pbk7i4ZUote2adxczt31NgbfI/kuCuj8E/h
 UMvOEMGfb2LBCts02JZo1M0y3FaE+lsJq/KqdKtMF6ERPvDqEUSDiwOtsDHk6IOgh2R7
 dEDy1eqZL9kXWBIJ+ABuAAL/pjqog+DqlB6O41GzSOM2R5LOpTPYVix/M1Ho4d0QWGZe
 5AV1XQ8Ns4allNXgPYM1zKJJ7IRS2zu43+AliMs6pRNvMt1oNohofqcBC3Bkeri4z/X6
 qTuuyGwcgztYM6fNkZQ+fWwYkre44m9cjy6JL2maJIj5Ye/u1zH4XFPDjJb1XmLpwfXL
 rhXg==
X-Gm-Message-State: AOAM531o/JEbYRHhj4FxF3Ty5zynxAd7OydasTcyFKvF+n8sfn0Swy6M
 5RVkudnr1BWgnFL/tkfGKAEGvJoqCsa36w==
X-Google-Smtp-Source: ABdhPJyyo1BP5Exfz3swf+E33vB2FPk9KFaRgojG3VW1GIYSGmUsk4Ya1hSxTuly2I+/lYJ+WHkEPg==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr32210873wml.7.1623662397055; 
 Mon, 14 Jun 2021 02:19:57 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s1sm19518299wmj.8.2021.06.14.02.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 02:19:56 -0700 (PDT)
Subject: Re: [PATCH 01/28] tcg: Add flags argument to bswap opcodes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <84a571f1-6890-701e-0f1f-c127e19fbfab@amsat.org>
Date: Mon, 14 Jun 2021 11:19:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 10:37 AM, Richard Henderson wrote:
> This will eventually simplify front-end usage, and will allow
> backends to unset TCG_TARGET_HAS_MEMORY_BSWAP without loss of
> optimization.
> 
> The argument is added during expansion, not currently exposed
> to the front end translators.  Non-zero values are not yet
> supported by any backends.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-opc.h | 10 +++++-----
>  include/tcg/tcg.h     | 12 ++++++++++++
>  tcg/tcg-op.c          | 13 ++++++++-----
>  tcg/README            | 18 ++++++++++--------
>  4 files changed, 35 insertions(+), 18 deletions(-)

> +/*
> + * Flags for the bswap opcodes.
> + * If IZ, the input is zero-extended, otherwise unknown.
> + * If OZ or OS, the output is zero- or sign-extended respectively,
> + * otherwise the high bits are undefined.
> + */
> +enum {
> +    TCG_BSWAP_IZ = 1,
> +    TCG_BSWAP_OZ = 2,
> +    TCG_BSWAP_OS = 4,

Matter of taste, I find "1 << x" bullet proof for flags.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

