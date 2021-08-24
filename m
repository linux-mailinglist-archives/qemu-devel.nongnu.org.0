Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB373F6344
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:50:44 +0200 (CEST)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZdL-0004NE-Tt
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIZPR-0004CX-MC
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:36:21 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIZPP-0003X2-UT
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:36:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z9so32155152wrh.10
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NYERhu9j4PqPSOfKVRy7ELPhopQNdFi32Y1D65l1dQs=;
 b=n1zpjXgUmegywKYOnCTjuvGSGAGfqiuyBazOzpD2zH2DceogoDBa9IzAHuiduBBOTl
 O+BcULpO8CkboVX6SvFKG8WKCxJosnyPPIbtSrTsT0SLMHfXhPt0htltarZ5MtUoIN3E
 ZfV9UawoKoR/AA1rRxWl/V32/VirE2kN1wIuIyZfcXlg7xwfyOZeech6bomW+JpHwUpy
 8qIRg1qdFizyoLB4pNRXQ3VxGoR54wYH0BxXGMN6mHcy/gH7qCszljZv+mUJ3cxV9lG2
 J8tmbfUiFX8/ItbATyVlZbcglt3a7EMuVoeebvcJmOWIoAJlQZA/PF9OGQf7Q2CoS4oI
 nJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NYERhu9j4PqPSOfKVRy7ELPhopQNdFi32Y1D65l1dQs=;
 b=uSQKXw1ppFw3NHmZsZVP88CTDPkeRn4Whb1Z1MAJWursgW9Gzg28eFfZL14FfgE3eu
 ubUX/E1BMx9CUmGLAiV99pP+1MAJcpq03NiSuIZso7Cbb4AtUhTFoPzEic5nMgxky5GU
 /dyMR/CKgCcCMgj74g2kLP+pJNs13X0Yo2kdN/jcOHZWwmc+DYNPnXVdntBmHY9my6EP
 eMwBH/XxmZZ2EdeeUgI2ZvqohhYptg3aQjilJykxgFduQH2z5EIOX/Tml+QvnyO9WyuI
 jldXPipEhdJd0zBOsQHTuU0PqNk7duak9lpOd+mLl3Lp5wBXJTYPM42jTWqhswDRYSCM
 Foyw==
X-Gm-Message-State: AOAM531PFwvRv3XnuU/irgUnJhfkJTy/OiziM4M6CKn2LhHdXj+J2hw6
 bAjO61jP0yt+QGIv/36oz10=
X-Google-Smtp-Source: ABdhPJxR06E7N5S6KckdVeRhOv8oOapvmmIda0v3RCGEVhwl9Jsf/jUFbjALPs9zCavS0RbLukLpJQ==
X-Received: by 2002:adf:cc92:: with SMTP id p18mr13838512wrj.98.1629822978403; 
 Tue, 24 Aug 2021 09:36:18 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g12sm23333574wri.18.2021.08.24.09.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 09:36:17 -0700 (PDT)
Subject: Re: [PATCH v2 05/30] linux-user: Provide new force_sig_fault()
 function
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <51e90f11-c768-af65-877e-0c61ed298f7f@amsat.org>
Date: Tue, 24 Aug 2021 18:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822035537.283193-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.305,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/22/21 5:55 AM, Richard Henderson wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> In many places in the linux-user code we need to queue a signal for
> the guest using the QEMU_SI_FAULT si_type.  This requires that the
> caller sets up and passes us a target_siginfo, including setting the
> appropriate part of the _sifields union for the si_type. In a number
> of places the code forgets to set the _sifields union field.
> 
> Provide a new force_sig_fault() function, which does the same thing
> as the Linux kernel function of that name -- it takes the signal
> number, the si_code value and the address to use in
> _sifields._sigfault, and assembles the target_siginfo itself.  This
> makes the callsites simpler and means it's harder to forget to pass
> in an address value.
> 
> We follow force_sig() and the kernel's force_sig_fault() in not
> requiring the caller to pass in the CPU pointer but always acting
> on the CPU of the current thread.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Message-Id: <20210813131809.28655-6-peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/signal-common.h |  1 +
>  linux-user/signal.c        | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
> index ea86328b28..536c7ac2c2 100644
> --- a/linux-user/signal-common.h
> +++ b/linux-user/signal-common.h
> @@ -40,6 +40,7 @@ void tswap_siginfo(target_siginfo_t *tinfo,
>  void set_sigmask(const sigset_t *set);
>  void force_sig(int sig);
>  void force_sigsegv(int oldsig);
> +void force_sig_fault(int sig, int code, abi_ulong addr);
>  #if defined(TARGET_ARCH_HAS_SETUP_FRAME)
>  void setup_frame(int sig, struct target_sigaction *ka,
>                   target_sigset_t *set, CPUArchState *env);
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index fd3c6a3e60..5ea8e4584a 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -646,6 +646,23 @@ void force_sig(int sig)
>      queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
>  }
>  
> +/*
> + * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
> + * 'force' part is handled in process_pending_signals().
> + */
> +void force_sig_fault(int sig, int code, abi_ulong addr)
> +{
> +    CPUState *cpu = thread_cpu;
> +    CPUArchState *env = cpu->env_ptr;
> +    target_siginfo_t info = {};
> +
> +    info.si_signo = sig;
> +    info.si_errno = 0;
> +    info.si_code = code;
> +    info._sifields._sigfault._addr = addr;

Maybe assign the members directly upon declaration?
(to ease readability...)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    queue_signal(env, sig, QEMU_SI_FAULT, &info);
> +}
> +
>  /* Force a SIGSEGV if we couldn't write to memory trying to set
>   * up the signal frame. oldsig is the signal we were trying to handle
>   * at the point of failure.
> 


