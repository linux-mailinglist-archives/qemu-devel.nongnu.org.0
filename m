Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF9148DD08
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:41:03 +0100 (CET)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n845u-00030o-KM
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:41:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83le-0004xu-52
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:20:10 -0500
Received: from [2a00:1450:4864:20::42f] (port=38839
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83lc-0000AQ-1Q
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:20:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a5so11405737wrh.5
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4yePp2fsfuOtB4+rrzyKFtLxks/ac/g/DLKMQmCHaNI=;
 b=QyTXDMb1jg6p6F2Bme5HB7di0bkyXKVqNN3AQlXnchqhCEPKF8/D3bY6YjzVYuduQC
 Ifnpvts+XhS0UZng1/aT7r1eh1T/mKdptdlPMhkfJNevM8xq/RhZkqkAII3sYD4UK7pd
 /HYPFn2w/gnbnzIgoS3gewdybkKOmW5WMwN8QtcUHyraalSnlTPoFBeA8v2V1mSUsl2v
 ZFhbuAvsKTpnPPGK+9Eb08H90ErD8YfnBxViAUQ7Tz2b17DKF4QY3LW03gCE3uUZ3L9e
 yXudK8xKT/bYvU6AWNkSCp8TnNC405sZ1eM0kbKmRCw0wRMEqEeRmX9dmmgh+RlaxnLB
 yvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4yePp2fsfuOtB4+rrzyKFtLxks/ac/g/DLKMQmCHaNI=;
 b=1ZaG7MaT066Cs8pmzWU1huHt1uywtYKU2jj2NWE4APdcOZHNViC9rdI/5Mq/sYxgYb
 eWblDTamcHk+aS5XP3tAwKGJY4cZMB7o8ODf/FmdYD/igoMnEjA6coUjvTGXDhAbkE2v
 RMmKMEuf/513DOhWFprtytaUVjEwYZurH+O06XiUkTHgbsl6+GM3RKAG35Db+0XvXfm+
 ySYq7BHeJqAnQJ56zHMFDQCW7f8uQWJZHapLVm8HmO8HVUU3g/ZLspfrasQCtAqQxxbo
 jo/51zADkowssaJeoNqXy6dsBX/Cg7HtfD0wX5zTnPUtQyc8zVC4oxvUNbLD0BG4KHwg
 wgQQ==
X-Gm-Message-State: AOAM530E98UEICO4Bz1NSsQCiyGV+Ym+5eEHmV5VN97m6zPHH+C53tLZ
 ZotUIXdWJsWbsnhibbJz5h5ojEmDhTHaWfJBPpKbLg==
X-Google-Smtp-Source: ABdhPJwTW1KRq2YvmxsWILdUp40k1Fta9Agz5qH62Gqwdd+lG5UeqhLuiagDJXRyDhbkjcYvNDv8NsxrxInmtzpPH9w=
X-Received: by 2002:adf:e907:: with SMTP id f7mr4807961wrm.319.1642094402400; 
 Thu, 13 Jan 2022 09:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-8-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-8-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 17:19:51 +0000
Message-ID: <CAFEAcA_VD_8SJ91ri5RXdOJj0GLjKHXoEFguYaV1ohbO8TzjxA@mail.gmail.com>
Subject: Re: [PATCH 07/30] bsd-user/arm/target_arch_cpu.h: Use force_sig_fault
 for EXCP_UDEF
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:27, Warner Losh <imp@bsdimp.com> wrote:
>
> Use force_sig_fault to implement unknown opcode. This just uninlines
> that function, so simplify things by using it. Fold in EXCP_NOCP and
> EXCP_INVSTATE, as is done in linux-user.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
> index 905f13aa1b9..996a361e3fe 100644
> --- a/bsd-user/arm/target_arch_cpu.h
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -51,18 +51,12 @@ static inline void target_cpu_loop(CPUARMState *env)
>          process_queued_cpu_work(cs);
>          switch (trapnr) {
>          case EXCP_UDEF:
> -            {
> -                /* See arm/arm/undefined.c undefinedinstruction(); */
> -                info.si_addr = env->regs[15];
> -
> -                /* illegal instruction */
> -                info.si_signo = TARGET_SIGILL;
> -                info.si_errno = 0;
> -                info.si_code = TARGET_ILL_ILLOPC;
> -                queue_signal(env, info.si_signo, &info);
> -
> -                /* TODO: What about instruction emulation? */
> -            }
> +        case EXCP_NOCP:
> +        case EXCP_INVSTATE:
> +            /*
> +             * See arm/arm/undefined.c undefinedinstruction();
> +             */
> +            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->regs[15]);
>              break;

Do you want to keep the TODO comment ?

Either way,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(Looks like FreeBSD sends SIGILL/ILL_ILLADR for UNDEF where the PC
is misaligned and we're not in Thumb mode, but that's a pretty oddball
corner case so not really worth emulating.)

thanks
-- PMM

