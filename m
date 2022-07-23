Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C9F57F1BF
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 23:38:41 +0200 (CEST)
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFMpb-0000Ub-OG
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 17:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFMoB-0007Nl-MD
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 17:37:11 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFMo9-00075x-VG
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 17:37:11 -0400
Received: by mail-pl1-x62b.google.com with SMTP id k16so7276426pls.8
 for <qemu-devel@nongnu.org>; Sat, 23 Jul 2022 14:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ry+kZKi8O5weg7Bo4wrvKKX5jAREsFf73YZ4UJ5RhDU=;
 b=oWilv/3X1RaYJDTZXWjSjY6Pl/mfKP7KkyYmc3IyBVRtHQ8t/4uBhe43YrR435kRI6
 myVzO96DTjiGnPfD/+0LGDK4Gz10YDxxARQEQHC2qGk4us20WFE1nJWRbHCZpkZVs0sL
 auzQGJ0mVpcze50dJnhnS92n4jhMYtuWstuWSCK/1ui+ziCUzdni42l0wxoBx2060lX5
 Lw9+pVwVY0tGe3NaAUaUyQbSyVt9E+55aHSiWbfe7qa/pr3mLq1F3jcmIu0/Cci28Zmb
 6h2p1xwJ1YcMil9AtAWVfB4hYRnGEpEV/zLOIzvLNCn6cslp3p7aZGjiFZYvCOmrP6iB
 sNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ry+kZKi8O5weg7Bo4wrvKKX5jAREsFf73YZ4UJ5RhDU=;
 b=P5J3TVRH4bKyCUez4l8OW/nIOXfC0wAxizD5AwBJYwOuxEW2LcP24EahltqBRYR84D
 cQ5zLQWGo/tMYHhNpabd+1FMsy7wrLHBmzVxHpFU+j9ZwhW+7Gq2TS4WwLT1kKuU9EER
 e7vUJHPTs8f/XQZ+5rBWdczsNI3uc8b+JwE+5KceQScpmotYFhm4Yurm1ug9Psch24zW
 8+MHRBRvKi17tbLuV459h8TwJXqmCLM0CArV7Vwnkfbg4dg4jyIvK+UQBnUUwSQvUDqf
 6pslBbxzzAbsDafNhEOccTC1TY/lxbTPYntZfQusShBYgZAxHJsIwkIxcxYcIf/Ed+7v
 sCKA==
X-Gm-Message-State: AJIora99Cj9y3/Tq2O2/biqJuy4kcIBT5igu77mQ3XP3ymb1p162h9Qp
 mDtEzypvdPAHK2hOh2lDk8xqow==
X-Google-Smtp-Source: AGRyM1tWocwfzq9UHixM+I4y+jC9P/+0aw+vBGcP1XOvCwPb313MdBRpm6PuCttwVvvO49uFocD7Cg==
X-Received: by 2002:a17:90a:9a91:b0:1f2:34eb:6f8c with SMTP id
 e17-20020a17090a9a9100b001f234eb6f8cmr15555553pjp.91.1658612227598; 
 Sat, 23 Jul 2022 14:37:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:be5:d810:1e03:c4?
 ([2602:ae:1549:801:be5:d810:1e03:c4])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a17090341d100b001677d4a9654sm6161562ple.265.2022.07.23.14.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 14:37:06 -0700 (PDT)
Message-ID: <0317be87-9c91-5de5-b5f5-85b406b56a87@linaro.org>
Date: Sat, 23 Jul 2022 14:37:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/mips: Handle lock_user() failure in UHI_plog
 semihosting call
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20220719191737.384744-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220719191737.384744-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/22 00:47, Peter Maydell wrote:
> Coverity notes that we forgot to check the error return from
> lock_user() in one place in the handling of the UHI_plog semihosting
> call.  Add the missing error handling.
> 
> report_fault() is rather brutal in that it will call abort(), but
> this is the same error-handling used in the rest of this file.
> 
> Resolves: Coverity CID 1490684
> Fixes: ea4210600db3c5 ("target/mips: Avoid qemu_semihosting_log_out for UHI_plog")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: only tested with 'make check' and 'make check-tcg', which
> almost certainly don't actually exercise this codepath.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> ---
>   target/mips/tcg/sysemu/mips-semi.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
> index 5fb1ad90920..85f0567a7fa 100644
> --- a/target/mips/tcg/sysemu/mips-semi.c
> +++ b/target/mips/tcg/sysemu/mips-semi.c
> @@ -321,6 +321,9 @@ void mips_semihosting(CPUMIPSState *env)
>               if (use_gdb_syscalls()) {
>                   addr = gpr[29] - str->len;
>                   p = lock_user(VERIFY_WRITE, addr, str->len, 0);
> +                if (!p) {
> +                    report_fault(env);
> +                }
>                   memcpy(p, str->str, str->len);
>                   unlock_user(p, addr, str->len);
>                   semihost_sys_write(cs, uhi_cb, 2, addr, str->len);


