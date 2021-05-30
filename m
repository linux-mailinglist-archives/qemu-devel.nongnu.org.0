Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A223951BB
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 17:34:09 +0200 (CEST)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnNS4-0000oW-00
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 11:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lnNRI-000082-FV
 for qemu-devel@nongnu.org; Sun, 30 May 2021 11:33:20 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lnNRF-00059X-Ll
 for qemu-devel@nongnu.org; Sun, 30 May 2021 11:33:20 -0400
Received: by mail-pg1-x533.google.com with SMTP id q15so6444702pgg.12
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 08:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=praDpH6PYPByQYoExGi2VjznOIj4OLsxj5YGNhx0Bw4=;
 b=T/XO8JYQcr2J0wNUwfOOeaKRkubOUDK+P5akEOl+cMhdjHxjpMRSGy7pUOSTXdQ+6H
 bNQmbvV38XWNjiNGhKqFpewmM5YxTdI4ZSggnvDrsZiOl9MMAG/+ee6s2TifEAFQl8m5
 KyjGTW0ly7ZGLYQNL/ZIW3jUBs7jziap7xCAmtVF/2/8S2orEsc5+0M7xO2RInKd0qHw
 6vubfS3cbWlX7FdI3bMQaQrZRyqwVZ3bibo4kIUoEh35d+MD5VLilZZuFZcIGY2e35II
 XPMFfxQTGuusSzw53UuWR28a2m7eVIKyCJqYHLdLsofx6tofFgDEiNWO2q81BagiMmDL
 TgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=praDpH6PYPByQYoExGi2VjznOIj4OLsxj5YGNhx0Bw4=;
 b=bK/XZnIJ6IEVX4E01e//fPppRaHoOH6zMT3PEsQr+jSfvFl+88E6H83Gk8hQvcJWlT
 DVx0mAz+lqYuATMBsoFcwart6gtkxyOz/Nm2+zrAewnpJEz0YPJU2h1TBocL+VcagD8+
 jbQwcF9wLAecN9HtI19j4hyV992lLrRVjgVbfAphYBRQWRPZhlRkEsguj26aCOhBelNN
 Jcj4GxOcvH1gtVBRiz55R7koW4EmPuZtZfQ6X+Pos95Gd0ugXr0kPtFnvTej1PWz3XJ5
 pjCcLiiHIlhEBiZO96Z2ia5aAlF/89iSgxYdZy+3K7wa7LcW2rwJrUbTveIxyYOhaYTG
 mJLA==
X-Gm-Message-State: AOAM531WDrSBm0GbNnWicLQ8BVaFPjbzqzt/vR9YsJLSe4r9LA38DN1y
 PFD9QqZhdPDtzx3BB3obv+eH5w==
X-Google-Smtp-Source: ABdhPJwKe+W5APANHy7IbgbkN5xJQQiHCZJ+Y4ImcxBv+qDfObf1PvrRKsEElPpYo0sh9mi7pIALbQ==
X-Received: by 2002:a65:6243:: with SMTP id q3mr18980151pgv.297.1622388795993; 
 Sun, 30 May 2021 08:33:15 -0700 (PDT)
Received: from [192.168.172.34] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id s22sm2436816pfe.208.2021.05.30.08.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 May 2021 08:33:14 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Fix DBALIGN DSP-R2 opcode 'byte position'
 field size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210529130520.1039274-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a52d983b-ce0b-c5f3-3e1a-d175a23f1175@linaro.org>
Date: Sun, 30 May 2021 08:33:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210529130520.1039274-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.618,
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
 Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/29/21 6:05 AM, Philippe Mathieu-Daudé wrote:
> Per the "MIPS® DSP Module for MIPS64 Architecture" manual (rev 3.02),
> Figure 5.12 "SPECIAL3 Encoding of APPEND/DAPPEND Instruction Sub-class"
> the byte position field ('bp') is 2 bits, not 3.

Rev 2.34 has 3 bits, not 2.

The mips32 version of balign, that uses 2 bits...  Are you sure you looked at 
the right instruction?  Because 3 bits makes most sense for this instruction 
with a 64-bit register size.


r~

> 
> Cc: Jia Liu <proljc@gmail.com>
> Fixes: 26690560240 ("target-mips: Add ASE DSP compare-pick instructions")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index c03a8ae1fed..e68647ce14c 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -23016,8 +23016,8 @@ static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
>               }
>               break;
>           case OPC_DBALIGN:
> -            sa &= 7;
> -            if (sa != 0 && sa != 2 && sa != 4) {
> +            sa &= 3;
> +            if (sa != 0 && sa != 2) {
>                   tcg_gen_shli_tl(cpu_gpr[rt], cpu_gpr[rt], 8 * sa);
>                   tcg_gen_shri_tl(t0, t0, 8 * (8 - sa));
>                   tcg_gen_or_tl(cpu_gpr[rt], cpu_gpr[rt], t0);
> 


