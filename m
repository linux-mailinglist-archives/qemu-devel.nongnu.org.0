Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DFB437FFF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 23:43:53 +0200 (CEST)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me2KO-0007gV-4n
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 17:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2It-0006Hq-UT
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:42:22 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me2Is-0003sn-2y
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 17:42:19 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso6700418pjm.4
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tKrVaH7rFW/fyeh3nfWfjxWMEzGE1VHhFEnqWEB4bAg=;
 b=gi1nAMmsQtve1LE3eYBeOn3aGEb+/VIjUjtmcUxT6+pjxw9V9ynGHjCog9oXz1g+4I
 nxRISKnDS+9ykhoDayd5ZuEF4J8dD8xIpUxDsq/7nok1rCzRF32QiLXSr5O9g6zo4m1a
 QPc637ximUE6ewkqbf5XWBizfvYiV3ejNOJbDOZBP1sig7ErXrIBnbTx7AM2zac1Hj7w
 XHUGvcLbNW2vyKKxn/qn3bPj5geiKUVkLRZy5iKhsSaGOzUyvCT4JLn/l41eY3pTJAGY
 dyca+joB7L9/jSjrx7W9IqdPdOczD7LVCInvLYiu5EO+IoF8/cI+rLHb7oS9wva4458j
 iZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tKrVaH7rFW/fyeh3nfWfjxWMEzGE1VHhFEnqWEB4bAg=;
 b=bh61D6fj4EKDALYOuowAMwFtDVn9aZlXrVcpb0BKswfJsSVCorYRbAmu0gEN7YorWa
 RxEXAf0FJnvwDZ5TykpqI8GHMSb+6JP6/QbBpGMbk+WedClwGUWC6+jDOTYOp0HccZdI
 0inW3Vup8wHWYrCAiGwBlE+4Eh91OPsDwAd5PFYn/6M3aKCkzU/VZJ4lcKiFzye3W936
 vfyVuummMDo3jLhTzLqGYT59De+YfKc+YxcznLw3mXQvIJgcRMMi2b1thqsldbVVW81Z
 0xL0XQ1rZS6UOLbWd+W4xUSEsJWhUxk4lvkd7ag1RUSTB3JP7KjkSx6fq7bm12kMXsgy
 /R8w==
X-Gm-Message-State: AOAM532gbPJ5A34vOEG5z1oAvY0mVZ2JG0Om4xZ1GICE4oFwEYXWZNrN
 u6/JKLMHfIa76mPyQnL7O1Ch1g==
X-Google-Smtp-Source: ABdhPJyBO8R3qOD/iK4eJIEpaFTxRHZG1WjuorsZyRERXGdEimGYfFl4XX5BvGiwE4q0H3Yh0h5H9Q==
X-Received: by 2002:a17:90b:2514:: with SMTP id
 ns20mr10778591pjb.210.1634938936498; 
 Fri, 22 Oct 2021 14:42:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id kb15sm11360423pjb.43.2021.10.22.14.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 14:42:16 -0700 (PDT)
Subject: Re: [PATCH 2/3] target/mips: Fix MSA MSUBV.B opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211022174550.36937-1-f4bug@amsat.org>
 <20211022174550.36937-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44b45aca-2f3b-3c1d-8a2c-15db49a8abb0@linaro.org>
Date: Fri, 22 Oct 2021 14:42:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022174550.36937-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 10:45 AM, Philippe Mathieu-Daudé wrote:
> The result of the 'Vector Multiply and Subtract' opcode is
> incorrect with Byte vectors. Probably due to a copy/paste error,
> commit 5f148a02327 mistakenly used the $wt (target register)
> instead  of $wd (destination register) as first operand. Fix that.
> 
> Cc: Aleksandar Rikalo<aleksandar.rikalo@syrmia.com>
> Fixes: 5f148a02327 ("target/mips: msa: Split helpers for MSUBV.<B|H|W|D>")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_helper.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

