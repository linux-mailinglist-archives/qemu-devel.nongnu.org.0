Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071C73EFF80
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:48:34 +0200 (CEST)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHFR-0001aO-3N
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHE0-0008Uk-Eq
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:47:04 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHDv-0000UY-7C
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:47:04 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l11so2279278wrx.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z1E/+Us6OoMmzRalxrM3zvrgrtIm+LEuZm5lZ3OsFRU=;
 b=t/Us2o6OgXANXpBLTWUDbxe8OmvZA1EJO+oWFwyg6eQD+5armtj7KmwkfgJRFSSp6w
 XQRYZUapa6skjNOHxznvR6UBHx2cdDNOB/S+pmAopsLxcX1zhzye8Pwu7T29fwknaDKX
 yHarsIKBfyM8yEBWfVt6/beSM9QQ56cc4UpvwZlqmK/yn6km2LD8gkpypkTrVhcfNCjj
 rvyy+B9UtXf4UUJ/XHJRWLLElvMaqnyWZ4XKndq/O2NGwoN1L/n375uwbnJV5GpjlUXo
 LNxzCZh38pnHWkNrvmc444FdC7dCCcZ3ZhQ9Q7gLr/C1N6o64lUrP0GWN0VQqdlmnI3R
 9xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z1E/+Us6OoMmzRalxrM3zvrgrtIm+LEuZm5lZ3OsFRU=;
 b=lC2Py4BETKWfTESqvQqHkaVRwWo/WsefvVjM1YOvaZrrCIWUePhO0hSP1lbbyRvply
 4lCVvkJiqOCBwIq2wq3q6IfAxTmAq3Aw5VnFl9lK0Br6iBIpxzrKUq8v2IrAITJpuxKO
 DnoiI/b9UutS8j1GTm1J0u9IEAVz50pKuuJPBaorIxjFHGoGHqG5oqWgK5k6WL7OOyYS
 XqlX9mCvzVekp7iQwTjK6vChUKjL549j5kpRg5ibUFdHnfwq+INrNre1FZ3FPbTOURkk
 OzyFA66+snlIvD6I8Q+YdmhQadZ3K6WxSYx3uvRkcMHWyJGCGQXuH7mXdUJYj/efoYq/
 wrUQ==
X-Gm-Message-State: AOAM531U66wlsMhZF7Rc+wEBishP00PShYXqmDgxF7B3CA0APzlFH7fg
 N8Qg96Ot75eDjbG/zydWNMo=
X-Google-Smtp-Source: ABdhPJypQ1XiO2Jtj4A0n/3Z6gpS4WOPWCrNGcp50zzCiuhALC5GPTvxO8LFhxTS1OVLTLrTcJpjaw==
X-Received: by 2002:a5d:4090:: with SMTP id o16mr8871575wrp.176.1629276417502; 
 Wed, 18 Aug 2021 01:46:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k26sm5347831wrc.33.2021.08.18.01.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 01:46:56 -0700 (PDT)
Subject: Re: [PATCH v2 05/55] target/hppa: Implement do_unaligned_access for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <08b751aa-8e07-0a5f-7550-cdd30cfdafc2@amsat.org>
Date: Wed, 18 Aug 2021 10:46:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Helge

On 8/3/21 6:13 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/hppa/cpu_loop.c | 2 +-
>  target/hppa/cpu.c          | 9 ++++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index 82d8183821..5ce30fec8b 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -161,7 +161,7 @@ void cpu_loop(CPUHPPAState *env)
>          case EXCP_UNALIGN:
>              info.si_signo = TARGET_SIGBUS;
>              info.si_errno = 0;
> -            info.si_code = 0;
> +            info.si_code = TARGET_BUS_ADRALN;
>              info._sifields._sigfault._addr = env->cr[CR_IOR];
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index c2c56e7635..91f149ed77 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -71,7 +71,6 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
>      info->print_insn = print_insn_hppa;
>  }
>  
> -#ifndef CONFIG_USER_ONLY
>  static void QEMU_NORETURN
>  hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                               MMUAccessType access_type, int mmu_idx,
> @@ -81,15 +80,19 @@ hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>      CPUHPPAState *env = &cpu->env;
>  
>      cs->exception_index = EXCP_UNALIGN;
> +#ifdef CONFIG_USER_ONLY
> +    /* Recall that user-only always uses address space 0. */
> +    env->cr[CR_IOR] = addr;
> +#else
>      if (env->psw & PSW_Q) {
>          /* ??? Needs tweaking for hppa64.  */
>          env->cr[CR_IOR] = addr;
>          env->cr[CR_ISR] = addr >> 32;
>      }
> +#endif
>  
>      cpu_loop_exit_restore(cs, retaddr);
>  }
> -#endif /* CONFIG_USER_ONLY */
>  
>  static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
>  {
> @@ -147,10 +150,10 @@ static const struct TCGCPUOps hppa_tcg_ops = {
>      .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
>      .tlb_fill = hppa_cpu_tlb_fill,
> +    .do_unaligned_access = hppa_cpu_do_unaligned_access,
>  
>  #ifndef CONFIG_USER_ONLY
>      .do_interrupt = hppa_cpu_do_interrupt,
> -    .do_unaligned_access = hppa_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
>  };
>  
> 


