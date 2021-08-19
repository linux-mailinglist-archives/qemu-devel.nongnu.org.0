Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503683F20AE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:35:43 +0200 (CEST)
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGnpG-0007mk-Dg
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGno8-00078G-N3
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:34:32 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGno4-0005Xu-36
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:34:32 -0400
Received: by mail-ej1-x629.google.com with SMTP id x11so15225954ejv.0
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4g56rWJ2GugEMpAQnc6o8A1ENDUqiiVw2dNuewO1hQg=;
 b=V1h6ri4SsqghCyYsSlAYEbvjM2lqjDGOblkCKxhCcPvahDgMwzPz8gh9lchQGIj1Fa
 b1EXjG369YjC4t0IFgnl8uxQnOmwSf6ANB7wx+8DfWHynsDbs0LDkEVQDO84hRoz9ZgK
 1lGb9dynXnpHhgIwi7oMM44pzyvcOyNXSNl0PlzgbA0Vk6/9YwsGGlK435N//ylLbVTJ
 OVPgDgt0tFbIhYjrgZQMKlw6CrhrAm3u5MVs62rVgcxCPnBf/em93zDJ6ToXewDf0yMN
 RtVaEZ+xL+raRL+B1hvNeFpV7so7PJNmpNMTQC4O6gDPiw2kuZ6/kHXDDh72u9443bxh
 D3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4g56rWJ2GugEMpAQnc6o8A1ENDUqiiVw2dNuewO1hQg=;
 b=F2sLP32k6SUjKsUhdUJDqUdtLyWeSyA/cqH4sJ3SeC6C99A+p3F3l9Pq6ipeQ+RUkQ
 J/VA3beVi2SHRCWBdgNwpGHIGu9LZJjKqDMrLRiVK1FttiGBRfMhS+1XlnARNfkZiXLn
 114pcgOpApbOHOaDIwKdoROyqJ8fmjiTVwRxXu9/Dyk+Yw8U2ZPi/pvQFnnmxNw/6T+w
 9xQ0EGo50v5MMV7colH3PMNy2zOR4W9AqKz5tewE9Ug/HY2+Nrec79G0Uda39zfcTM6M
 Nfk04uBaB/juZDaYRCNQrpolzZ7TU7i18Gu2JxUFh4to92YVkJXnhNGgaxtyGMghjqVa
 98vw==
X-Gm-Message-State: AOAM532EFxGA+DsKswVLHZ0JEBsr00dG+5/XhV7JVD9ZhVE0sGSKaaLW
 pIY/c4EwDGTc+v0egcBw0F9HrASFljD/mRcvu7nDeg==
X-Google-Smtp-Source: ABdhPJxsa7SKSVirESajd84XPh+7aLXRvrqHE95LmYKtLMBoSW/+duMmMGu/r150aFHLhIhvKfqga5Rrv9b7mosddGg=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr16964204ejb.382.1629401666514; 
 Thu, 19 Aug 2021 12:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-8-richard.henderson@linaro.org>
In-Reply-To: <20210803041443.55452-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 20:33:40 +0100
Message-ID: <CAFEAcA9c5ER79Dwg7irKx5-Hss1zjn3fTTyfpmHem1vLDgK+zA@mail.gmail.com>
Subject: Re: [PATCH v2 07/55] target/mips: Implement do_unaligned_access for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 05:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mips/cpu_loop.c        | 20 ++++++++++++++++----
>  target/mips/cpu.c                 |  2 +-
>  target/mips/tcg/op_helper.c       |  3 +--
>  target/mips/tcg/user/tlb_helper.c | 23 +++++++++++------------
>  4 files changed, 29 insertions(+), 19 deletions(-)
>
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index 9d813ece4e..51f4eb65a6 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -158,12 +158,24 @@ done_syscall:
>              break;
>          case EXCP_TLBL:
>          case EXCP_TLBS:
> -        case EXCP_AdEL:
> -        case EXCP_AdES:
>              info.si_signo =3D TARGET_SIGSEGV;
>              info.si_errno =3D 0;
> -            /* XXX: check env->error_code */
> -            info.si_code =3D TARGET_SEGV_MAPERR;
> +            info.si_code =3D (env->error_code & EXCP_TLB_NOMATCH
> +                            ? TARGET_SEGV_MAPERR : TARGET_SEGV_ACCERR);
> +            info._sifields._sigfault._addr =3D env->CP0_BadVAddr;
> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +            break;
> +        case EXCP_AdEL:
> +        case EXCP_AdES:
> +            /*
> +             * Note that on real hw AdE is also raised for access to a
> +             * kernel address from user mode instead of a TLB error.
> +             * For simplicity, we do not distinguish this in the user
> +             * version of mips_cpu_tlb_fill so only unaligned comes here=
.
> +             */
> +            info.si_signo =3D TARGET_SIGBUS;
> +            info.si_errno =3D 0;
> +            info.si_code =3D TARGET_BUS_ADRALN;

The MIPS kernel code doesn't use si_code BUS_ADRALN for alignment
errors, as far as I can see -- it just calls force_sig(SIGBUS):
https://elixir.bootlin.com/linux/latest/source/arch/mips/kernel/unaligned.c=
#L557

which gets you the same thing our force_sig() does: a code
of SI_KERNEL. So I think we should be calling
   force_sig(TARGET_SIGBUS);
here rather than filling in a target_siginfo_t and calling
queue_signal().

>              info._sifields._sigfault._addr =3D env->CP0_BadVAddr;
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;

thanks
-- PMM

