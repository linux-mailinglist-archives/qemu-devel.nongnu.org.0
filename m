Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D8E438677
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 05:47:11 +0200 (CEST)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meUTX-0004L4-1L
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 23:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meURp-00033j-IM
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 23:45:25 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meURn-0007fT-BH
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 23:45:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id i5so5545255pla.5
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 20:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BoH4sg8RXjc6tovIgJsLpkgY/yHsebicvbr47aAGjJA=;
 b=fRl9XQ9EaWkSthUdGkt7xC64sLRV5L5LCvOuJn/APOZyf5jQgm17BR3QgDKceNWtXW
 4zd8984An5uXodv7htyZSusaH47YaQTBY4Zlkz4ZYmazO8mac8Ls/HS4DrwbhMLdJwlx
 d05C2xLLgffxjAJoz7BHwhOdLIZrAKMnUIIc6BJa1r0XsXJknis5azDO4mDVra8lUCX+
 2IawQkORSZGP1JIeMoU1z5UKKzRuMMpDmRH8sCB1vBjPUrD/fvkwDFT27mgHcdQzEf7/
 6+4zLZO7vzRktVRk8LPhHm4Rpp7BdKBhGrvPzdUzil0LOt0iK4GXKROOJPsP3+1TBgCj
 IKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BoH4sg8RXjc6tovIgJsLpkgY/yHsebicvbr47aAGjJA=;
 b=nIsXPzmfMBb86/Ln1NIuuZL0QEMCN/+4NprvE/9Vl+wLTgfXTtZ1U7ldTKQz0wPgDb
 pN7GuFueNLsDPESXx3Ky+m1DFYQ4lzIskANUEYeK6bsR486sm63WMYB11W6zuyECm1s5
 1c8oN1fYVscBI0CQXq88sUEhVcD4uMUoJt1wH3ivyWk+LY4i0/qtzBMEGs0eaIlyP28v
 3dtOZ3iM7urPT3UnXHJSH/pafj96ns89yVYiXjRg2CVByVAmpoCUNTvW5+AjrGQH/tra
 72VvU+WGnswgi1/v52gqgMNXfQ/1zp8vokXi0ZgwEsijika0u/1cQ28AFEB2CVwQjM0V
 n65A==
X-Gm-Message-State: AOAM533PaoTrXBZ5p0ffP4spinPJemxY7tpvjBmwDhSmzoMhl3h1Gd9R
 TKVZfSnNh5xLTGbwMuyZi34S9n8jcis7CQ==
X-Google-Smtp-Source: ABdhPJyILR58kdYTgB1Uf+M+JIEznxnmwrTkJSiLoonqe9QE0+rQwFT+ktkDZtbe3sm8vbi862x6dQ==
X-Received: by 2002:a17:90b:1004:: with SMTP id gm4mr94181pjb.32.1635047121711; 
 Sat, 23 Oct 2021 20:45:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k19sm3433567pff.195.2021.10.23.20.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 20:45:21 -0700 (PDT)
Subject: Re: [PATCH 14/33] target/mips: Convert MSA I8 instruction format to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <abaf80b0-fff7-a04d-b10b-f6894169b8f2@linaro.org>
Date: Sat, 23 Oct 2021 20:45:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +    TCGv_i32 twd = tcg_const_i32(a->wd);
> +    TCGv_i32 tws = tcg_const_i32(a->ws);
> +    TCGv_i32 timm = tcg_const_i32(a->sa);

tcg_constant_i32.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

