Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B566050FD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 22:06:41 +0200 (CEST)
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olFKq-0007d8-3F
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 16:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olFHS-00062R-2U
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 16:03:10 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olFHQ-0007iT-7P
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 16:03:09 -0400
Received: by mail-wr1-x433.google.com with SMTP id n12so30712721wrp.10
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 13:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V5oPI5RL36DvE2OhBgy2XDPuuayy8zp1Y6yU6zoVOXA=;
 b=RuotgBvTOM8DtGQ2KNmA0t/Af6PbH1tvpYj4VioWp37zqUxTNwH18IJ2tIBdOTcWzU
 Sn7QQ8h88pcM5poszMXttRSKayHTIlvnXDTONsEgdAOGE3jlL9xfuy7oeFcss83Ve3FX
 mYBnwbr5GhH0K3XW2cuIes+ALTPbQyuc+645IatooQwWu0wt3n9AhyCXQ0Llg15jy4ja
 LQM3TDix1IrOjgK9ToNAbWT7vw8LDBgnOUUMVvFNYx61eAO5bhd2Qc7E54O1BB9GGUcV
 nuBhuYebKjBkLLjCCHDqKcEvCs5ZA20foTYQ5TspmPR/wD53OrYQ4hmeUI+d+hXwDU/i
 El9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V5oPI5RL36DvE2OhBgy2XDPuuayy8zp1Y6yU6zoVOXA=;
 b=Ace12MGyg5FbcmwY9ctRS/k44PjvsnQDAfoDRQw7I6ZneYG/PbPXjJheXp+/HpJ4Q+
 u3pByLpqyEerjTrRNJm9uNvtVmMftyXkOBdC3MZgz2jc4NaZV4i0QUebpOK9mzwj2JX+
 Q5z4eIItSm/rcoF761Jyj4AM60wntHNQKlaJxj1F0Qd0QoNKtAsRlWK9RvntFeeRjxRH
 ssbIRJZQRIYvHmbyQio0Y7OrTq27moDwLaszgBOa9cT44unFRRqxiPVbmCbom/l7iV25
 tdb5s8VraP6GUeRQ7LsfU07suO7dwPzg2UBHJgoa/EoBCFKzVnQBv6K7nx+JMq/Mh4aY
 WUqg==
X-Gm-Message-State: ACrzQf1LuW+T+rKa6rfgeQOjo/HESOKCP60kBOhbEZp3Tr/BBb8tOWKM
 /KnyUgEdoWcAqsfrACCcQKQN/g==
X-Google-Smtp-Source: AMsMyM79sZ0X2OFZogr3xr2HCZlGx6PQtB0kV4nVrYVwIgG8an4EtHDeHAAAvP3FvHcrcvvvCchY1g==
X-Received: by 2002:a5d:490c:0:b0:22e:6545:996e with SMTP id
 x12-20020a5d490c000000b0022e6545996emr5957669wrq.523.1666209786290; 
 Wed, 19 Oct 2022 13:03:06 -0700 (PDT)
Received: from [192.168.7.115] (m194-158-70-1.andorpac.ad. [194.158.70.1])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b003c706e177c1sm964730wmq.14.2022.10.19.13.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 13:03:05 -0700 (PDT)
Message-ID: <6b62a753-974d-968e-9e8f-a79e23a29719@linaro.org>
Date: Wed, 19 Oct 2022 22:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [RFC PATCH] target/s390x: fake instruction loading when handling
 'ex'
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20221019113552.1051940-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221019113552.1051940-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 19/10/22 13:35, Alex Bennée wrote:
> The s390x EXecute instruction is a bit weird as we synthesis the
> executed instruction from what we have stored in memory. When plugins
> are enabled this breaks because we detect the ld_code2() loading from
> a non zero offset without the rest of the instruction being there.
> 
> Work around this with a special helper to inform the rest of the
> translator about the instruction so things stay consistent.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/translator.h    | 17 +++++++++++++++++
>   target/s390x/tcg/translate.c |  4 ++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index 3b77f5f4aa..156f568701 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -211,6 +211,23 @@ translator_ldq_swap(CPUArchState *env, DisasContextBase *db,
>       return ret;
>   }
>   
> +/**
> + * translator_fake_ldw - fake instruction load
> + * @insn16: 2 byte instruction
> + * @pc: program counter of instruction
> + *
> + * This is a special case helper used where the instruction we are
> + * about to translate comes from somewhere else (e.g. being
> + * re-synthesised for s390x "ex"). It ensures we update other areas of
> + * the translator with details of the executed instruction.
> + */
> +
> +static inline void translator_fake_ldw(uint16_t insn16, abi_ptr pc)
> +{
> +    plugin_insn_append(pc, &insn16, sizeof(insn16));
> +}
> +
> +
>   /*
>    * Return whether addr is on the same page as where disassembly started.
>    * Translators can use this to enforce the rule that only single-insn
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 1d2dddab1c..a07b8b2d23 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6317,12 +6317,16 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
>       if (unlikely(s->ex_value)) {
>           /* Drop the EX data now, so that it's clear on exception paths.  */
>           TCGv_i64 zero = tcg_const_i64(0);
> +        int i;
>           tcg_gen_st_i64(zero, cpu_env, offsetof(CPUS390XState, ex_value));
>           tcg_temp_free_i64(zero);
>   
>           /* Extract the values saved by EXECUTE.  */
>           insn = s->ex_value & 0xffffffffffff0000ull;
>           ilen = s->ex_value & 0xf;
> +        for (i = 0; i < ilen; i += 2) {

Is it worth guarding with #ifdef CONFIG_PLUGIN?

> +            translator_fake_ldw(extract64(insn, 48 - (i * 8), 16), pc + i);
> +        }
>           op = insn >> 56;
>       } else {
>           insn = ld_code2(env, s, pc);


