Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD341AC10
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 11:39:21 +0200 (CEST)
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV9a4-0007Je-ON
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 05:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mV9TU-0007l7-5B
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:32:32 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mV9TR-0004QC-Ad
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:32:31 -0400
Received: by mail-wr1-x433.google.com with SMTP id r23so31516102wra.6
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 02:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QnJP/GLx93QKDVH2kb3CULbCspa8a7NWkggpvvBfwuw=;
 b=gA0MrwCoDoULr7/zqzx/NXbqydTaQl4xgjBLw5cQI7jCP24HKzM0Y+o+1Tvi1ZNdpZ
 fvJRDaKQJxpNpfB9dDyuFHpEXM9mt/zvNqDJhojvye0jrcq6y9xoZUDndf6h3kwTiDMo
 C7Io16UPQ4krTlfzvs93poGK6+4yrKfOnXp69cQbXlQU9Ja9eWWvGhLT1a+P+TgRHw5S
 y+XBEWInzljnPQ9EYzsRe21Ig39awPsWTeie8ojkwbVfU8SPRgytEOfjEhxq5uXc3kQ6
 TsSHgrrK2/ufRz2nr3A/Yx7tn8c7eX1xMDSO+Vhx8nUYLbhmQSOcPLNRKfwnBoxY8/3K
 vwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QnJP/GLx93QKDVH2kb3CULbCspa8a7NWkggpvvBfwuw=;
 b=NBY6mvnpmbpQ4e3cgC0PrGE4PAb8NCqQ+7HrGEQDwHLLgs64Wr/2LxsyexM037MlYn
 NwghnSNPGaByaQkXiljWlPKaAwjfp4LQIriO9gVn3ey8UC+7VXtcGo7ypqEfKhoza8Ai
 BOGMTdNFqxcqQqH50FewWhIGHfRXTYOPCnc5gPXkinyTeDwLOo0zTng6T9Iu25z+Sw6s
 J3cX5u8ErhK5zs6WU7Zd46rneqMTeHhTVZ4DbtBtg7NwttgLN21lu4LAmuixtGX59wcB
 ZZiiM6LyY4lavzbfc/iQRi3nd9ADCcFALji94rV+7ctQISF0c+6U4wuHcCxx5yxbkAQa
 7dRg==
X-Gm-Message-State: AOAM5319DACOf8xSXWwgrDK8cNZU2OK3guQBEpDyySsDv0kqdWH3y+3P
 L31KBbyMhDCGR0f5M+BWHlq6xpiByr0KqCOXljAo5g==
X-Google-Smtp-Source: ABdhPJz86LfEoxGRpe3KOHhvYYas7UpLBuB0ADRmwTMngVe/q4giXblJxOlc0Lw6McAfLBu/lKIU5NfW0Esg7iINI90=
X-Received: by 2002:adf:ee48:: with SMTP id w8mr5272919wro.263.1632821542196; 
 Tue, 28 Sep 2021 02:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210928020039.184412-1-richard.henderson@linaro.org>
 <20210928020039.184412-6-richard.henderson@linaro.org>
In-Reply-To: <20210928020039.184412-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Sep 2021 10:31:28 +0100
Message-ID: <CAFEAcA9Neuczc-g_xbe-NELJ+rejJTPF=7TUJe7=T9q-id0=TA@mail.gmail.com>
Subject: Re: [PATCH v4 05/25] linux-user/arm: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Sept 2021 at 03:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror what the kernel does in arch/arm/kernel/signal.h,
> using the old sigframe struct in the rt sigframe struct.
>
> Update the trampoline code to match the kernel: this uses
> sp-relative accesses rather than pc-relative.
>
> Copy the code into frame->retcode from the trampoline page.
> This minimises the different cases wrt arm vs thumb vs fdpic.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -225,44 +204,34 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
>
>      if (ka->sa_flags & TARGET_SA_RESTORER) {
>          if (is_fdpic) {
> -            /* For FDPIC we ensure that the restorer is called with a
> -             * correct r9 value.  For that we need to write code on
> -             * the stack that sets r9 and jumps back to restorer
> -             * value.
> -             */
> -            if (thumb) {
> -                __put_user(sigreturn_fdpic_thumb_codes[0], rc);
> -                __put_user(sigreturn_fdpic_thumb_codes[1], rc + 1);
> -                __put_user(sigreturn_fdpic_thumb_codes[2], rc + 2);
> -                __put_user((abi_ulong)ka->sa_restorer, rc + 3);
> -            } else {
> -                __put_user(sigreturn_fdpic_codes[0], rc);
> -                __put_user(sigreturn_fdpic_codes[1], rc + 1);
> -                __put_user(sigreturn_fdpic_codes[2], rc + 2);
> -                __put_user((abi_ulong)ka->sa_restorer, rc + 3);
> -            }
> -
> -            retcode = rc_addr + thumb;
> +            __put_user((abi_ulong)ka->sa_restorer, &frame->retcode[3]);
> +            retcode = (sigreturn_fdpic_tramp +
> +                       retcode_idx * RETCODE_BYTES + thumb);

Here 'retcode' is an interworking-PC value with the LSB indicating
Thumb mode...

> +            copy_retcode = true;
>          } else {
>              retcode = ka->sa_restorer;
> +            copy_retcode = false;
>          }
>      } else {
> -        unsigned int idx = thumb;
> +        retcode = default_sigreturn + retcode_idx * RETCODE_BYTES + thumb;
> +        copy_retcode = true;
> +    }
>
> -        if (ka->sa_flags & TARGET_SA_SIGINFO) {
> -            idx += 2;
> +    /* Copy the code to the stack slot for ABI compatibility. */
> +    if (copy_retcode) {
> +        uint32_t *host_rc = g2h_untagged(retcode);

...but here we treat it as a normal guest address that we can
convert into a host address and dereference. If the signal handler
is being entered in Thumb mode this will be a misaligned pointer.

> +        int i;
> +
> +        for (i = 0; i < RETCODE_WORDS; ++i) {
> +            __put_user(host_rc[i], &frame->retcode[i]);
>          }
> -
> -        __put_user(retcodes[idx], rc);
> -
> -        retcode = rc_addr + thumb;
>      }
>
>      env->regs[0] = usig;
>      if (is_fdpic) {
>          env->regs[9] = handler_fdpic_GOT;
>      }
> -    env->regs[13] = frame_addr;
> +    env->regs[13] = sp_addr;
>      env->regs[14] = retcode;
>      env->regs[15] = handler & (thumb ? ~1 : ~3);
>      cpsr_write(env, cpsr, CPSR_IT | CPSR_T | CPSR_E, CPSRWriteByInstr);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

