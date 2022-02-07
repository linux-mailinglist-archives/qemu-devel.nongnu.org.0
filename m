Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27D24AC10B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:21:45 +0100 (CET)
Received: from localhost ([::1]:37364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH4tk-0007dY-Tz
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:21:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH4Nl-0003rM-Aw
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:48:41 -0500
Received: from [2a00:1450:4864:20::329] (port=40950
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH4Ni-0006uC-Ol
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:48:40 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso3265189wme.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 05:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RGQqA8HusNDPBdZ+kQifL0FXjlwB7pHxBcYD6i+XE3A=;
 b=URwjsVkDUbzxnkHIe04NbD8Sv1P/dbF8V/Bg6i0HMeOo4G4kt3L651KjHQAjRc1dvY
 gY2wnQrSMRj4Io6JEirA+lHvQjjiN/Dt1Lyxvu2zfcJIU9eHq+XO6AbGbLqbf+lJLZbY
 Ld5w9cdvMenEBwmuJMILXS49rZQkpYXAJduYE5WETRaVJIElzYz7eJmRVEAa8ur4QP5w
 r2AxJkciAikvzzT+RNdZTBB+27V8anZD25l1nwXOPxW2J/V6mbqUGcoMBo8ac5UqT9bb
 6l4dpXpjl9jsKpvrZ6V4I/Y47GrsRPOgYD1b/2q9zJ1bJ3RJeKC7R6eBrwacfK/qRs+k
 2BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RGQqA8HusNDPBdZ+kQifL0FXjlwB7pHxBcYD6i+XE3A=;
 b=aGV+G1am4GCAmQLC8PKotC2gax92d5KDWIppMX9ak3H5FTYwHPDm6C77WEEuwwIP9n
 P4+fuzUqxoEE1c0GplyCxZgu7RLTYg3rW7OgNqvE2jhzU5isH3wP95Q2ccCQy0YFe/IC
 rInIlnqydvmCZEeRCcUCGM3KcJCL3tXzh0tjwA2uZxcd3oiEtl42LhbhvuHQjNSvv1UQ
 e6bkBM+hd2xx1fvoVlClAbSgUXonyARXuIW0J1Lni97bvoYd2V3/yEEPfm/GRLy/YTL1
 H4Pk4sjovFo2bdycSw2EqzXgxoZR3oJ1R6A/UP9IZudTqPnpPlci8/dettdRz1mBGVQE
 I6tg==
X-Gm-Message-State: AOAM5330RpTXq/nQe9QdbqJcEOhi07q/IRwaDiuFNVTD3a2dQ25hfh0N
 F53AseR3rjW69EUJLp28fzRo3Q1gfPTgPpsnDpBc0A==
X-Google-Smtp-Source: ABdhPJzp+ltjXoIDEBPd5GCe9X+PT8ykk3gf+IR204tjA4UU9HiAAzY8MEmuQFHqq/+a8hvi0gPn+R7zSDXIsEEYoDk=
X-Received: by 2002:a05:600c:2d05:: with SMTP id
 x5mr9386685wmf.133.1644241716387; 
 Mon, 07 Feb 2022 05:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20220207122814.4044094-1-wangnan.light@bytedance.com>
In-Reply-To: <20220207122814.4044094-1-wangnan.light@bytedance.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 13:48:25 +0000
Message-ID: <CAFEAcA_TeCN=PSoaBy+aVnZoK9mBON6=1OAg0-yF-jzXhpbXpg@mail.gmail.com>
Subject: Re: [PATCH] kvm: drop work around for kernel header typo.
To: Nan Wang <wangnan.light@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: pbonzini@redhat.com, mtosatti@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 at 12:35, Nan Wang <wangnan.light@bytedance.com> wrote:
>
> From: "wangnan.light" <wangnan.light@bytedance.com>
>
> Kernel header once had a typo(linux commit caa057a2cad6), qemu have to work around it with
> hardcode macro(qemu commit 6f131f13e68d). Now kernel fix it(linux commit 766d3571d8e5),
> so we can remove redundant code.

The other relevant git commit hash worth mentioning here is
QEMU commit 77d361b13c19f, which is where we updated our copy of
the kernel headers to a version that included that fix. You
might also mention when these fixes happened, which was back in 2018.

> Signed-off-by: wangnan.light <wangnan.light@bytedance.com>
> ---
>  target/i386/kvm/kvm.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 2c8feb4a6f..f65ed37591 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -2403,10 +2403,6 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>          int disable_exits = kvm_check_extension(s, KVM_CAP_X86_DISABLE_EXITS);
>          int ret;
>
> -/* Work around for kernel header with a typo. TODO: fix header and drop. */
> -#if defined(KVM_X86_DISABLE_EXITS_HTL) && !defined(KVM_X86_DISABLE_EXITS_HLT)
> -#define KVM_X86_DISABLE_EXITS_HLT KVM_X86_DISABLE_EXITS_HTL
> -#endif
>          if (disable_exits) {
>              disable_exits &= (KVM_X86_DISABLE_EXITS_MWAIT |
>                                KVM_X86_DISABLE_EXITS_HLT |

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(Side note, I'm surprised that kernel fix was allowed in -- it breaks any
userspace code that was relying on the typo'd #define name, which
would have been easily avoidable by just defining both names. But that
was years ago now, so it's done...)

thanks
-- PMM

