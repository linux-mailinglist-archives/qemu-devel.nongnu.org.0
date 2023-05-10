Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8E56FE142
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:11:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlRo-0004m7-8n; Wed, 10 May 2023 11:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwlRm-0004lZ-0i
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:09:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwlRk-0001wu-Bi
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:09:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3078d1c8828so4423332f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731379; x=1686323379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IxMGZPmtXZmBdhN71zvuNl3CrpqfFxzDKId2rWD+vdM=;
 b=geiZ10DzHCOtVSz6nfU0UrhnLv6VDfGc1EUmL00bbuNpdP6j63f9FasL8vG0rOarQK
 6S4GA8g/0Q95+QGS/ILRyfodYXEYdPLkxZoXofzz3vUIvlVWKlpjlWxbFitZrXi5GzGo
 70QYrJk6+/YMSuNERRgytwsYuTY/GGDll/bsC6JLtYi3oCZtrPGPk1VM3BqIDIMcZmeG
 guAelhKiZVkLEVPxR2QgBFa99D9k99U+SXRGhGRBTq3+1fv8XO1re7x/Fc5d8lKU1+Fm
 PF4HvMx6ZZ0ykH5chyJ37V4d1TUzDFTH73CA+YSxycJfMXjcOEmJa9fhuNVbD39Keekb
 0Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731379; x=1686323379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IxMGZPmtXZmBdhN71zvuNl3CrpqfFxzDKId2rWD+vdM=;
 b=cQE8Yd/87zM/mECJ7+mzw70JFus4FRTfxfoHbeYA8iVvwOj6k3/pzGsSLvccowQa0d
 ibGxvSPmwSS8arPkAhvZgIlwmxxaHH0Vq5wFoDLdJG4gZzErSioI6DQabbezgdbcrkaZ
 ssQFWK+IuONSJ2Tl6kVO9mGDx75baIOS6bPR4Yw0VbAgPIsk7IEvoPrL+uZI+Ayp/O5n
 5zs0dMI+T9E7pFcGSpR5yamKDekoSj/5Hi+LpN/rzUEaYYoc0YTTBsJDKCUIXnlsBwvT
 BSemJOhufwkgGVwukl34ySx6O2EXgb64R7au+Z1JVK2KIjIErzlpGvJspoClaUG/ENto
 rKOg==
X-Gm-Message-State: AC+VfDzkFgdso2w5ij0SPWllKTBFVSWcWGpetCJQ6hACgdFePzwM2gWP
 /UdAt3rQtJMzh30vqKM+VpH4xQ==
X-Google-Smtp-Source: ACHHUZ5xreiAPumT0jKLhdONiKTszxSIKiYM/TiJLYB9k8W91TCyH1r/wXNZr7vZJbSl0quBntRhIg==
X-Received: by 2002:a5d:42cb:0:b0:307:4836:64e4 with SMTP id
 t11-20020a5d42cb000000b00307483664e4mr13699869wrr.52.1683731378728; 
 Wed, 10 May 2023 08:09:38 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l18-20020a5d4bd2000000b003078bb639bdsm13337216wrt.68.2023.05.10.08.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 08:09:38 -0700 (PDT)
Message-ID: <a52bf910-1784-dde8-102d-55a545b331e1@linaro.org>
Date: Wed, 10 May 2023 17:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH HOTFIX] target/loongarch: Terminate vmstate subsections
 list
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, yangxiaojuan@loongson.cn
References: <20230510062405.127260-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230510062405.127260-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/5/23 08:24, Richard Henderson wrote:
> This list requires a NULL terminator.
> 
> Fixes: 16f5396cec23 ("target/loongarch: Add LSX data type VReg")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> This failure can be seen
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/4253259728#L5579
> 
>    5/789 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/qom-test                 ERROR           1.38s   killed by signal 6 SIGABRT
>   44/789 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/test-hmp                 ERROR           0.95s   killed by signal 6 SIGABRT
> 356/789 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/machine-none-test        ERROR           0.51s   killed by signal 6 SIGABRT
> 
> It does not always fail, depending on the layout of the executable,
> which is why it was not caught right away.  I plan on applying this
> directly to master before processing more pull requests.
> 
> 
> r~
> 
> ---
>   target/loongarch/machine.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


