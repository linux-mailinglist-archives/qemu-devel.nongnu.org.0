Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B498A5AEE3D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:56:54 +0200 (CEST)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVa0T-0002XX-SA
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVYee-00072G-IJ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:30:16 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:40525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVYec-0000G0-Rw
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:30:16 -0400
Received: by mail-pl1-x62b.google.com with SMTP id x23so11304870pll.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=mZyDvTfLxBb57aoZvW8GqFU+okuvtdsaYmOHH3vMDBk=;
 b=PD5vueIqqlYz68nleQIDD9xdiBIYLUWsFffEC4y38J6EatoJFjE/4cfyZd59pmROzd
 YE+at35fyUflCI+3kHopsXtXJib1Dhe/WyCdqjULhI8QFcqwUWwuZD+XXBThN4GFpfgD
 B61VMqLdT6MeRcIEDjAPMpZS71T865TlBZGrYmJDYba03v/sn/rYepxa+uCGoK8aiHN6
 EKwXrWDIl/Np9+vcU6rExdu+EbQI4cuGsEgjmh3bC55hBfoX/uXdGM7KwOX70vOGq1P8
 ZHXW0v378QztIRBM8u0YMXpIgeVgnwJDx/BqSro1R0I994DXqniUbvCXI3SXzjiNHMYY
 Vejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=mZyDvTfLxBb57aoZvW8GqFU+okuvtdsaYmOHH3vMDBk=;
 b=t45D3Jmm4CVW23xlXWMk7Nv6Nl8B7eTIkvBxeJ4c3MAn9M3BlmhA8TaQf/0yu/IeCz
 slxHz/UnbLCkuYR+F0ZaNIF9kx74Cyy+8zFS6v84i/ayVU+eei1gLoYCRdsdcDdckkKI
 XHmau9xj8y2cxxAS0UToriQ3Ei09McTB1nqnFCET9KF3IAz28/um9wO6MON3r6f90d+R
 cCC2yp5mAZBnTMTWq7F0URiskHUNhVx/a5YhuRITty2Qkn4ekFzsmns+lHultAgkeBMp
 5S60suyaJ+9xiJaNu5nUDNzoOPIWfTAJW3zDVkqMTtqhupBxi8Cvi+a7FILJ6Op97kXu
 FJEQ==
X-Gm-Message-State: ACgBeo3hJc2/Wt7RmZhuXpJcJ4i0C2hN4EBfmP3zw339FIsYwcPTEV8f
 7+sw3hrYfa6xmqoy6pd1McM=
X-Google-Smtp-Source: AA6agR7b0Rk2aBPFxvo+XFkL3QeiKo/X4MsmOAgLSZ95GBc/ooXfWn2LcRGWGbj39VAgFzRpVtLh4A==
X-Received: by 2002:a17:90b:1c01:b0:1f3:2f26:e7b2 with SMTP id
 oc1-20020a17090b1c0100b001f32f26e7b2mr25397390pjb.111.1662471013530; 
 Tue, 06 Sep 2022 06:30:13 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c201-20020a624ed2000000b00535bf24008asm10071797pfb.207.2022.09.06.06.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 06:30:13 -0700 (PDT)
Message-ID: <c20b7b9f-63f0-df3e-ce9f-eca511a40926@amsat.org>
Date: Tue, 6 Sep 2022 15:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 7/7] accel/tcg: Split log_cpu_exec into inline and slow
 path
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220906091126.298041-1-richard.henderson@linaro.org>
 <20220906091126.298041-8-richard.henderson@linaro.org>
In-Reply-To: <20220906091126.298041-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 11:11, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cpu-exec.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 7fe42269ea..ac8eec7f54 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -292,12 +292,11 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
>       return tb;
>   }
>   
> -static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
> -                                const TranslationBlock *tb)
> +static void log_cpu_exec1(CPUState *cpu, const TranslationBlock *tb)

Eventually rename as log_cpu_exec_slow[_path]().

>   {
> -    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))
> -        && qemu_log_in_addr_range(pc)) {
> +    target_ulong pc = tb_pc_log(tb);
>   
> +    if (qemu_log_in_addr_range(pc)) {
>           qemu_log_mask(CPU_LOG_EXEC,
>                         "Trace %d: %p [" TARGET_FMT_lx
>                         "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
> @@ -324,6 +323,13 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
>       }
>   }
>   
> +static inline void log_cpu_exec(CPUState *cpu, const TranslationBlock *tb)
> +{
> +    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))) {
> +        log_cpu_exec1(cpu, tb);
> +    }
> +}

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


