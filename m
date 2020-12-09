Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF92D3DF2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 09:54:35 +0100 (CET)
Received: from localhost ([::1]:50098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvF4-0001da-LY
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 03:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kmvAh-0000Ez-9A
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:50:03 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kmvAf-00043N-7k
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:50:03 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 20E3D21CD2;
 Wed,  9 Dec 2020 08:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1607503798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/kXW4iKY1DjCVcb4D95oadjUU0aU/226G5DV29B1hU=;
 b=pBFwH27FydBDSqpUW9pl07V8sWQqwzNQpNaEftwI+/qwqZfdZ7qnEQo05uduiuw+mJVhbl
 ySHkRcRMrZp9v98wWPr8Kn9/eV7bHcEZdDNSCC9vdlEqJ7sHBuw/Rm6v6EfVIQfMIORTr1
 dRcs4keMu9BMOGGiBp71RokdEiHoE40=
Subject: Re: [PATCH 2/4] target/mips: Don't use clock_get_ns() in clock period
 calculation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-3-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <d8fc3be3-8b08-3291-5f66-b493cd84428f@greensocs.com>
Date: Wed, 9 Dec 2020 09:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201208181554.435-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 7:15 PM, Peter Maydell wrote:
> Currently the MIPS code uses the old clock_get_ns() API to
> calculate a time length in nanoseconds:
>   cpu->cp0_count_rate * clock_get_ns(MIPS_CPU(cpu)->clock)
> 
> This relies on the clock having a period which is an exact number
> of nanoseconds.
> 
> Switch to the new clock_ticks_to_ns() function, which does the
> multiplication internally at a higher precision.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>   target/mips/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 76d50b00b42..de15ec6068a 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -147,8 +147,8 @@ static void mips_cp0_period_set(MIPSCPU *cpu)
>   {
>       CPUMIPSState *env = &cpu->env;
>   
> -    env->cp0_count_ns = cpu->cp0_count_rate
> -                        * clock_get_ns(MIPS_CPU(cpu)->clock);
> +    env->cp0_count_ns = clock_ticks_to_ns(MIPS_CPU(cpu)->clock,
> +                                          cpu->cp0_count_rate);
>       assert(env->cp0_count_ns);
>   }
>   
> 

