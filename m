Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED26400720
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:53:00 +0200 (CEST)
Received: from localhost ([::1]:51526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGBH-0001Nr-Qb
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG3o-0005Xb-HJ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:45:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG3j-00044d-Mf
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:45:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v10so401283wrd.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GYPiivt1/iXOp8eeZaRgyabfa9y26i35GAKwriY/sAw=;
 b=ECufoZePiGfPsKtPhvvYAgbBKdHGT9OtyG2yApo4wyVBRqQWxfi100KAxJwfvwPVlg
 QBZ8LS9Na4YjLbCZCqxE009X0flbKiNJ5WU2nT7sQwASStz3H5ScpBgeO1qFS6xM+ZWx
 gv6+C72mCCi1WVE9huqGXtY4Gjb8k4C+EQqFRUr/rzNPlxqw/RrCvzRihvJdVlhZc8Z3
 1cIUSjf0kWbNIkFjNkX5beIBw1ixOxLIV4+Eg/B4ML62a4oI7ilWGhZSryIzIIdKaCZG
 9sRPAJTPAElZll9wdqNfDw8yH+Xpf3vNyVgSoPKmaCaBPZEEx+XYBvUEvMBphif6b3NJ
 3aRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GYPiivt1/iXOp8eeZaRgyabfa9y26i35GAKwriY/sAw=;
 b=FfYh2BZ4AZPHKisqymVHewCnxEzIWoyTB6JJTYKpTnAHvd5Z0/hmtvq10kG0GBMxi6
 rYzBzF9IkKp2fbeyZ4eLXB+mam4r8tnV0kZO0ppLfdOjPLZVgqnYut3kkMMVLqjYiM1y
 w2jd6LdDOPGbkh3MbvMfSROq9lrcKChPOfhFnERxFPP1tb6LSmUpCZT7Rhp9CrIBRJk3
 OW3BHYMioqoLaJNrM4DjoZXYUmvUo3zPJzpjVS3sVk5MImKu2kMsjGPbBwjh+x3X3doy
 TdyiUHwjYlHe4NtCJm/Lp0I6vESMvx/1kwI1GQFcfKT2VL5vzukzjFn8WEIlz3biMWwK
 7z9A==
X-Gm-Message-State: AOAM531op2FPfzfiP+95O7625ygZ2dBK0LWT5jJIZjOAYH7Ba3BeEsls
 pwUiJasHqN6fEr/RN7+JcPeHiw==
X-Google-Smtp-Source: ABdhPJwuPC0uSXShR0HGbPRrPSNvIlf22f+tBZcG+Ng6tWMl6WMQXAjcwa+qQPQBL+Nxt1Pw65nuDg==
X-Received: by 2002:a5d:5150:: with SMTP id u16mr926783wrt.156.1630701908644; 
 Fri, 03 Sep 2021 13:45:08 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id i68sm281371wri.26.2021.09.03.13.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:45:08 -0700 (PDT)
Subject: Re: [PATCH v3 26/30] target/sh4: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210903181308.761050-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37e41b1f-6ab0-5858-9a96-a55a1f301550@linaro.org>
Date: Fri, 3 Sep 2021 22:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903181308.761050-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 8:13 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/sh4/cpu.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 2047742d03c..6c47d28631c 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -58,12 +58,15 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
>       }
>       return false;
>   }
> -#endif
>   
> +#if defined(CONFIG_TCG)
>   static bool superh_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

