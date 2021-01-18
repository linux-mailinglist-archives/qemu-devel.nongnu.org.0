Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E030C2FADCB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 00:35:46 +0100 (CET)
Received: from localhost ([::1]:35216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1e3l-0001Oh-8i
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 18:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maahiuzeon@gmail.com>)
 id 1l1e2P-0000xp-Fj
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 18:34:21 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:38314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maahiuzeon@gmail.com>)
 id 1l1e2N-0007dF-OJ
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 18:34:21 -0500
Received: by mail-lf1-x136.google.com with SMTP id h205so26433716lfd.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 15:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sFDNt6VvfbK1Q0ZMux9sTa935qNRD+Ov46RaGinSnY0=;
 b=iL3PUyEWCIYo9FTIa0+2pizZjBQ6HHp0qs+O8Xh9uzQAjQqWhtwAtniMeDRQe0vSKP
 pqHcIJARs6HkvoshX7Lze2vhu4ELE7aoZB1nnFgbiRAuRc3LsEOOzT1Bz6wAJQZwXDg9
 fGaUkpU009SZT4rs6rFO8qASWCZx1GGfEyMNfVErp2O/gzthd95BbE8rFZ3694NQco8g
 uwUaJov9zO4gRbiSJk/MCq0UnmKC7xw9Kla/U2b0mqADfA2NyunYS2/Tml9ycvi6DZjw
 hTKg4yXy6mP7G7Z1TgIl16sEuGraWSaXgnhDdmQPnK/YCcaOYuyMNZ0GNHLHpOtiaelA
 QJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sFDNt6VvfbK1Q0ZMux9sTa935qNRD+Ov46RaGinSnY0=;
 b=b4qj2cAZ5v3lE9lyIlq+ke8BnqN/BOklJHxj6hpz04zUHMQHRgDJyKrWjacECBa3ik
 mFFcp1onozZpzxieaJ/G4+kh5s7Sc+usZP3qtv89kagQLaipoMLBv+ii4K4710EEW/GD
 7/IZe4R14t5CFVND7fojFbm/AvcIjQpfvJpKN0vpNMFdDyIOLBFsRRT4KYe/tkGdjMSR
 8genbyS8UzG+3MR3xAC90ttr+chZhMSte+ZijDhlz+2207WsvGl2ErdkqDLM/GC0vFh5
 mfe4L/SQHoE1exUTVVgw5U+YU4vixiyLbwP1HoudireRCfzDZo2hcXaq3RtrGg9Y7f9C
 QW+A==
X-Gm-Message-State: AOAM5309jWUxpaVCuoEXd9Krx/0I4mVrBWJc8gOaXn4WIvjCW9NZSCIw
 5BIfPia/izmePgxVj+Nwp/U/yvErfpILtUTnhwE=
X-Google-Smtp-Source: ABdhPJzeKYzQi7RQs2HptCW3fBeaiuo3QocY8kp+GAXMzyfZ1/QvnrkvCaP0LjOcUpvSxGwHKaGOFjU4Youaku5k37Q=
X-Received: by 2002:a19:6459:: with SMTP id b25mr554285lfj.635.1611012857458; 
 Mon, 18 Jan 2021 15:34:17 -0800 (PST)
MIME-Version: 1.0
References: <X/6OJ7qk0W6bHkHQ@Hills-Mac-Pro.local>
In-Reply-To: <X/6OJ7qk0W6bHkHQ@Hills-Mac-Pro.local>
From: Hill Ma <maahiuzeon@gmail.com>
Date: Mon, 18 Jan 2021 15:34:06 -0800
Message-ID: <CABpQrUMKu=GQTEbQTJPmcJorcr1v92XAiG18A9YwxftngV7q=w@mail.gmail.com>
Subject: Re: [PATCH v3] hvf: guard xgetbv call.
To: Roman Bolshakov <r.bolshakov@yadro.com>, richard.henderson@linaro.org,
 dirty@apple.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=maahiuzeon@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gentle bump :)

On Tue, Jan 12, 2021 at 10:07 PM Hill Ma <maahiuzeon@gmail.com> wrote:
>
> This prevents illegal instruction on cpus do not support xgetbv.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1758819
> Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
> ---
> v3: addressed feedback.
> v2: xgetbv() modified based on feedback.
>
>  target/i386/hvf/x86_cpuid.c | 34 ++++++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
> index a6842912f5..32b0d131df 100644
> --- a/target/i386/hvf/x86_cpuid.c
> +++ b/target/i386/hvf/x86_cpuid.c
> @@ -27,15 +27,22 @@
>  #include "vmx.h"
>  #include "sysemu/hvf.h"
>
> -static uint64_t xgetbv(uint32_t xcr)
> +static bool xgetbv(uint32_t cpuid_ecx, uint32_t idx, uint64_t *xcr)
>  {
> -    uint32_t eax, edx;
> +    uint32_t xcrl, xcrh;
>
> -    __asm__ volatile ("xgetbv"
> -                      : "=a" (eax), "=d" (edx)
> -                      : "c" (xcr));
> +    if (cpuid_ecx & CPUID_EXT_OSXSAVE) {
> +        /*
> +         * The xgetbv instruction is not available to older versions of
> +         * the assembler, so we encode the instruction manually.
> +         */
> +        asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (idx));
>
> -    return (((uint64_t)edx) << 32) | eax;
> +        *xcr = (((uint64_t)xcrh) << 32) | xcrl;
> +        return true;
> +    }
> +
> +    return false;
>  }
>
>  uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
> @@ -100,12 +107,15 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
>          break;
>      case 0xD:
>          if (idx == 0) {
> -            uint64_t host_xcr0 = xgetbv(0);
> -            uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK | XSTATE_SSE_MASK |
> -                                  XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK |
> -                                  XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK |
> -                                  XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK);
> -            eax &= supp_xcr0;
> +            uint64_t host_xcr0;
> +            if (xgetbv(ecx, 0, &host_xcr0)) {
> +                uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK |
> +                                  XSTATE_SSE_MASK | XSTATE_YMM_MASK |
> +                                  XSTATE_BNDREGS_MASK | XSTATE_BNDCSR_MASK |
> +                                  XSTATE_OPMASK_MASK | XSTATE_ZMM_Hi256_MASK |
> +                                  XSTATE_Hi16_ZMM_MASK);
> +                eax &= supp_xcr0;
> +            }
>          } else if (idx == 1) {
>              hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
>              eax &= CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1;
> --
> 2.20.1 (Apple Git-117)
>

