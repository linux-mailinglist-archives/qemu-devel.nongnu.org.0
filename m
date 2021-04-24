Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC6536A24E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:09:37 +0200 (CEST)
Received: from localhost ([::1]:50388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLmi-0004b8-32
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laLlS-00046o-6J
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:08:18 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laLlP-0003SM-NR
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:08:17 -0400
Received: by mail-pg1-x52d.google.com with SMTP id w10so908326pgh.5
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hNF5OxEPE4tuzlqPGkY4f3+ZzRjAxr7dpZTNhwje4Ms=;
 b=J8ELAfL9sJxR4vI7GVy3A9QG7vj98iTWzuk0/XztvGjdvmdGH2/BHg1qxtUZgJrw+z
 FqKq38Us/LG1EUo7NT/m1Quyb4w0Ra6RpD6AhDciJLMhuh+xLTgJT+SJpAYYKtggehCx
 mLCqisFKPgPxABsavgS0MFSAaA8OMrtJcqTXvh9CPJEuGipacZaqcoW1upSCanokGHqm
 RLrYHTc0v7ripkyDbt+hZHWUYLCcCtNwaiaC5vbAVEWlaQ4ah+8fpXXE2V5n2lC4xp/F
 QBg9jzwzSRDtI/3Hzmy0gu/8S61Xv74S5Er8J7ZTxIVOJfY+dIp0k9Axvw0Ooza53UIE
 29nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hNF5OxEPE4tuzlqPGkY4f3+ZzRjAxr7dpZTNhwje4Ms=;
 b=LIbsaJr0v/5Qep8DZkbA6gC16Gl1L6T0jbtfGFsbC18hBGkCZMCosQ/hXYp3oCTx9k
 HSpuSVu5GFL5TidkQWcf0dUtzMJzkz/J6604UyoUIUW4SaBFRVV0MufOmy13dtr7mYBA
 Z12/3ToIs+BECXydtdjQKcYbUUwW3RyyCEoritb7/gCrVEfHI87gwF8bLTUdTqJXFHwC
 3FDwg+4fpjvlSFpuPP++0V4IWzU4ncNwvgEqam+t6YPMZDjL85qVKI9R/Y/8+6trGz9k
 FTpaMgKJxmEiumjBx679aE2+XCnbmQgq3bR36BKmtmXgZTr+hO1kMiP/iOX1m5LLGVkn
 Ajcg==
X-Gm-Message-State: AOAM532QHosTza1MNk8u5H3/0ddjwfgCrocnqPUmEwSMD2Hf9/K1CUbg
 6fXvekV+yfBVVAyCGaxGKomCZA==
X-Google-Smtp-Source: ABdhPJxnfS6buSTwWG0dm+nKNgMCL2AbZsqS153Ltk7S8bM60ooiVym8Nm5yzFJY0wBy6dmnWJPJ9w==
X-Received: by 2002:a63:d04b:: with SMTP id s11mr9584293pgi.92.1619284093608; 
 Sat, 24 Apr 2021 10:08:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u7sm7631985pjx.8.2021.04.24.10.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:08:13 -0700 (PDT)
Subject: Re: [PATCH v3 08/10] target/riscv: Consolidate RV32/64 32-bit
 instructions
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1619234854.git.alistair.francis@wdc.com>
 <db709360e2be47d2f9c6483ab973fe4791aefa77.1619234854.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ea910ea-690a-bdac-bcdf-436bbe28964e@linaro.org>
Date: Sat, 24 Apr 2021 10:08:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <db709360e2be47d2f9c6483ab973fe4791aefa77.1619234854.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 8:34 PM, Alistair Francis wrote:
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -74,8 +74,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>   
>   #ifdef TARGET_RISCV32
>   # define is_32bit(ctx)  true
> -#elif defined(CONFIG_USER_ONLY)
> -# define is_32bit(ctx)  false
>   #else
>   static inline bool is_32bit(DisasContext *ctx)
>   {

Rebase error?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

