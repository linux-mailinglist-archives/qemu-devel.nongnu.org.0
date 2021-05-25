Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7121A38F801
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:18:03 +0200 (CEST)
Received: from localhost ([::1]:36152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMdu-0002H0-F0
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llMXG-0005Cp-4f
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:11:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:44737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llMXC-00063I-1q
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:11:09 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso11640718pjq.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 19:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iot9hY5C7DUFVXOXcExDnWCAyv/TsT+JX31GhN8qb8k=;
 b=oSb7/sJaCgGe16G/OY+ov8C6EJrgrhBi/jswKdn/08IPQXu4Xk5URl/RZXOHNC9flV
 3WgXfoBILCgVorDaI3bfrva1g9DZahoXRca1GqE+C7SvPr6MuK1kGL530/LmGXPxpjhm
 jd2CMoR5UrHn8syGHrddR9qKkcCRgue/NsYRw61642CkHZDG8PMb1LXzqcwnj1T9i+va
 x+I8unepTraBtoAEqngl86SYsUI0CnXQ0LJW1OiLtXjSozz0FQgLht+vpJVD3sWJWEol
 mWf5tojpNDFvkDJKdEoS1Uy65PuCFofYZayqZf61RaHejSonm7m7I/UrLlOXZpgYT9lQ
 j78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iot9hY5C7DUFVXOXcExDnWCAyv/TsT+JX31GhN8qb8k=;
 b=sy2kxop4BuFMoyj/z6YfLHVRYRD7vxemM4o/4OtnnttzokVeP7jiW4YNYcee8jnBeV
 7rKwmyHWij1LNhjQaZSeqRuRhGWGhgKlLE/IR2cfdLCOZpC0R01hNh2otMQr4iv2cz3F
 UdaVSRU+JUSr3KS9iy/XZef/hMxrvR4m9qkEG3f1DjiuKq/ko/5cKp3h47qAnfP8cVr7
 lwbCzRtqF0rMGs1CFP0W8OMuzbw7JjoV32a6eQJNuaY78KCY7Wt11jnx2jNdv7Tx7Xz3
 K7Sc2kYo/SiSb/NI43lHS8lXDGtugzYKrO9kVJxL3cf9NIb7TWXbV1tclHHyfFKDIt9V
 WphA==
X-Gm-Message-State: AOAM531WXkb1o4eQTAAaQ8ejvYOBcWnuCZwM0tpwznQIN4EdsFS9hwP+
 XMOD2lOt9qGe/1QGAJuJC8Y5xQ==
X-Google-Smtp-Source: ABdhPJwh9HWrzvkgVk+mIaOHq2oujvmwGKoSOWc5Tfs0XINktlfDewCPU904W6A1GE/jnQKAxyjyYQ==
X-Received: by 2002:a17:902:bc81:b029:ef:3f99:9f76 with SMTP id
 bb1-20020a170902bc81b02900ef3f999f76mr28541010plb.33.1621908664204; 
 Mon, 24 May 2021 19:11:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y190sm12820440pgd.24.2021.05.24.19.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 19:11:03 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] target/ppc: moved ppc_cpu_do_interrupt to cpu.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-7-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dfaa602a-cd6e-21cf-0e7c-35b8cf8f1cd3@linaro.org>
Date: Mon, 24 May 2021 19:11:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521201759.85475-7-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 1:17 PM, Bruno Larsen (billionai) wrote:
> Moved the ppc_cpu_do_interrupt function to cpu.c file, where it makes
> more sense, and turned powerpc_excp not static, as it now needs to be
> accessed from outside of excp_helper.c
> 
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/cpu.c         | 20 ++++++++++++++++++++
>   target/ppc/cpu.h         |  1 +
>   target/ppc/excp_helper.c | 19 +------------------
>   3 files changed, 22 insertions(+), 18 deletions(-)

I don't see what this buys you really.

It's not special-register access, like the rest of cpu.c so far.

> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index f4f15279eb..80bb6e70e9 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -38,15 +38,6 @@
>   /*****************************************************************************/
>   /* Exception processing */
>   #if defined(CONFIG_USER_ONLY)
> -void ppc_cpu_do_interrupt(CPUState *cs)
> -{
> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
> -
> -    cs->exception_index = POWERPC_EXCP_NONE;
> -    env->error_code = 0;
> -}
> -

This part could move to user_only_helper.c easily.

> @@ -324,7 +315,7 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
>    * Note that this function should be greatly optimized when called
>    * with a constant excp, from ppc_hw_interrupt
>    */
> -static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
> +inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)

Exporting powerpc_excp from this file is not an improvement, as far as I can see.


r~

