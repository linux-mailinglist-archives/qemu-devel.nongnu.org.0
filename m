Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC844D868
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:36:03 +0100 (CET)
Received: from localhost ([::1]:40406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBBK-0004Q8-LD
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:36:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlB9U-00011I-QM
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:34:09 -0500
Received: from [2a00:1450:4864:20::329] (port=54045
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlB9T-00013K-A5
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:34:08 -0500
Received: by mail-wm1-x329.google.com with SMTP id y196so5244703wmc.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+laR7UFLnvrwSyKfOlnazY+wrn5sHwQYWr/T9nmvrkc=;
 b=Y3H24ku71QexeGe0/xs6vaWcM+UZTS2ddYxCKtUdzslC9bsDLDzLGGi+1274PoMehN
 PFCzoV1NeJ1GpVXgYbmgd+TmBc/9bb+NgsjXHhFz/m88/Q0hIPrDuEGyETseoGutxksY
 O3SQd4mAbGvAEAtB4CvRqmYrdcZm08EW5T5dafL3hopoOk94N+21m3Z9r3M1MJGOPnbw
 qte5vOXjfs1qMS7yU+oPZxl588kzZenxqgikGm2zjai8fGHEMuPxSNaLKGXM8k0rCe7H
 fncPJ1oANr4vrXrB9IUoTPHQcfzRyYyuQYmsyxoL34uNOirUvEkdfZNSpdKCxzNbuiSB
 T2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+laR7UFLnvrwSyKfOlnazY+wrn5sHwQYWr/T9nmvrkc=;
 b=bAPgAblYis1WfhDifyNkjQAOljEW407P8Pd6gqUPRNtfH9TI+EYXP1xOrYXHdLmQqx
 m6nitk0ypjov/L6lm8G06Au0NMJqmmtmuRR+vIHQgIE4ctqkjIblYF9sBPxaJV4D8EHo
 l6Tj+dwbuP/f0xVNrme6E/wsHaIo+UyQ5a0SnTbBLQXtjVhrx8RE2lu4QWqLbs4HH/JD
 lSe7TWpOHHxx9MR/Y/0ztt8Ef8YeLGDLzvgKpnUi7kDWMIv3CslM7IoOMSxPSqysC0Td
 sOLm8Yogiy+SSnAjMezh9DBveeUE1SVpBjCfHpDIefqc+KYUoMXTGLzKi42LfyARmQCr
 /ExQ==
X-Gm-Message-State: AOAM531NbbwZ5D8SLSScpyCm7B6FdjknfO0QJoSoyzAZPS/QOp5T5L1s
 2f+KllqlNzEj8S5INh4n7sXe2g==
X-Google-Smtp-Source: ABdhPJz55P1PJQ67SoLH3ghsqJwDc1x7GIoVkmC5ug7GcRk+SsYBCt9Kj+J+7mBk8TU3cxHPBmYsEw==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr8996916wmj.12.1636641245652; 
 Thu, 11 Nov 2021 06:34:05 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id o5sm2976996wrx.83.2021.11.11.06.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 06:34:04 -0800 (PST)
Subject: Re: [RFC PATCH v2 06/30] target/loongarch: Add stabletimer support
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-7-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c317b5b-c396-8efd-4418-5c121ca05d03@linaro.org>
Date: Thu, 11 Nov 2021 15:34:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-7-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
> +    void *irq[N_IRQS];

qemu_irq, not void*.

> +    QEMUTimer *timer; /* Internal timer */

You can add this into the CPUArchState structure, rather than reference via pointer.  It 
is always present with the cpu.

Neither of these are needed for CONFIG_USER_ONLY.

> +void cpu_loongarch_store_stable_timer_config(CPULoongArchState *env,
> +                                             uint64_t value)
> +{
> +    uint64_t now, next;
> +
> +    env->CSR_TCFG = value;
> +    if (value & STABLETIMER_ENABLE) {
> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next = now + (value & STABLETIMER_TICK_MASK) * TIMER_PERIOD;
> +        timer_mod(env->timer, next);
> +    }

timer_mod_ns, when you use timer_new_ns.
timer_del when not enabled.

> +    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                              &loongarch_stable_timer_cb, env);

This would become

     timer_init_ns(&env->timer, ...)


r~

