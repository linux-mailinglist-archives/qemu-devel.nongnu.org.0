Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754EC4C3A02
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 00:57:56 +0100 (CET)
Received: from localhost ([::1]:45258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNNzf-0002Sk-21
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 18:57:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNNyO-0001lp-R9
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 18:56:36 -0500
Received: from [2607:f8b0:4864:20::1035] (port=36421
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNNyK-0007CX-1h
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 18:56:34 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso7025242pjk.1
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 15:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=g9nRoZjIUu8SfWbwQVYepMFbNFe8F3fJd478UpCi+C8=;
 b=oPLhGVZGzczjPRCh7KWXD4Q7L1FqvzonIqmlF4EhuLXKuMmyQqvvAh6y9Lep+WXaRq
 xT3v6P8WbKixpZ0VzTTcGZs5AH5ZtNZHWkW78OyYTGQJSKR/M+QPoIyLEwlDKqmHiGDG
 e4V8qKPkW8niFI+Nv/tP+QFy/iE3XgiApUqydZEcPPpDrTi6G8snOUzmdYE0oWqehPi4
 FjFuUuOCl3MuY2vWY42VzPc2Ow8Op9zerbuvXEE408wt9uaoDnBK+/sDjNKbAs/6Kbbq
 d5qj+yGx2CMscgm9Jp1mmsMGWysbsMa0gQJ8vRWtmdFiC+iHZ5dMYPeCzrDXabvsjyor
 oPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g9nRoZjIUu8SfWbwQVYepMFbNFe8F3fJd478UpCi+C8=;
 b=svfFS1O/WNZPMk50XSPhZr6y7sMPLk+bt6SPTPf5RySxEXXxzMD4ai2ZETxCk6g9g8
 ASDNLEi1Kkj77IkPySmJzGlLLloCo2iAXwCKIlaIeHgHea52gzFLqV/uhgQC6ipDxUey
 CIHceVDW/vKKhsLJ8P5s5NWbUZA+h8tCPfcSRFEYSapU54SufVw1Mooau1OUsZCaEjKw
 dzStMYUubQGUKybRTh+I7sEg6WIXSeRJoXUMRLGh12GBrfeNwugfqDmpKIfo4RK7/e/m
 lEvSei9yyr8YJEwGhWK6QCRhVOnnAYUs2wl1Rl3hyGo9iLm5vD5R5BmtvvEZSGN/4zgh
 Anqw==
X-Gm-Message-State: AOAM5327AHYA9r2gOGhwAAMbIxQimqPXc1QinOlTXqQWp0rucrXOsVsG
 TcRQdjvVrFroDTtzIIuF75ahqw==
X-Google-Smtp-Source: ABdhPJxL6QS5GPBmazjALHYnM4xdvNh0o02VaeZGOu7HVmLd/hIzI6I35CQFOKltbdj+f3Qj+ash5A==
X-Received: by 2002:a17:902:f78d:b0:14f:ce61:eaf2 with SMTP id
 q13-20020a170902f78d00b0014fce61eaf2mr5079811pln.124.1645746989138; 
 Thu, 24 Feb 2022 15:56:29 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 u6-20020a056a00098600b004e1ca129e1csm590755pfg.196.2022.02.24.15.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 15:56:28 -0800 (PST)
Message-ID: <bc2f558f-ae52-34ef-6901-3192f1d2fc45@linaro.org>
Date: Thu, 24 Feb 2022 13:56:25 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/4] target/nios2: Exteral Interrupt Controller (EIC)
Content-Language: en-US
To: Amir Gonnen <amir.gonnen@neuroblade.ai>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-3-amir.gonnen@neuroblade.ai>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224134901.500007-3-amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 2/24/22 03:48, Amir Gonnen wrote:
> +static void nios2_cpu_set_eic_irq(Nios2CPU *cpu, int level)
> +{
> +    CPUNios2State *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +
> +    env->irq_pending = level;
> +
> +    if (env->irq_pending && nios2_take_eic_irq(cpu)) {
> +        env->irq_pending = 0;
> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +    } else if (!env->irq_pending) {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +    }
> +}

This looks wrong.  Of course, so does nios2_cpu_set_irq, from which you've cribbed this.

(1) The unset of irq_pending looks wrong, though come to think of it, it's existence also 
looks wrong.  I think that it's completely redundant with cpu->interrupt_request, and that 
you should only use cpu_interrupt/cpu_reset_interrupt from this level.

Which also means that nios2_check_interrupts and callers all the way back up are also 
incorrect.  All that should be required from wrctl status is the return to the main loop 
that you get from DISAS_UPDATE and tcg_gen_exit_tb.

Which also means that ipending is implemented incorrectly.  The current manipulation of 
CR_IPENDING in nios2_cpu_set_irc should instead be manipulating an internal "external hw 
request", per Figure 3-2 in NII51003.

For our purposes, I think simply re-using env->regs[CR_IPENDING] as the external hw 
request word is the right thing to do.   But we need to update RDCTL to compute the 
correct value from CR_IPENDING & CR_IENABLE, and update WRCTL to ignore writes.


(2) Checking nios2_take_eic_irq here, or CR_STATUS_PIE in nios2_cpu_set_irq is incorrect. 
  If you check this here, then you'll miss the interrupt when the interrupt enable bit is 
reset.  These checks belong in nios2_cpu_exec_interrupt.

> +    if (cpu->rnmi) {
> +        return !(env->regs[CR_STATUS] & CR_STATUS_NMI);
> +    }

I think this should be a separate

     #define CPU_INTERRUPT_NMI  CPU_INTERRUPT_TGT_EXT_0


r~

