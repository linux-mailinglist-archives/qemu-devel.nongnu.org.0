Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6594AAEEA
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:59:17 +0100 (CET)
Received: from localhost ([::1]:43066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGfGG-0000rg-Q5
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:59:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGf48-0004BA-OC
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:46:46 -0500
Received: from [2a00:1450:4864:20::430] (port=40788
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGf45-0004Si-3w
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:46:43 -0500
Received: by mail-wr1-x430.google.com with SMTP id s18so19771643wrv.7
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5QKBfnDP8K+IkDPhfsV8KUNVpW4VNpt4IzpvvjIBiLw=;
 b=lEM0msZarZTHF6GgnELPch9qQAao86KOOwJ3QVV8i3zXb9OTlzSc7AfCwPPF9I+YUh
 r3JNuESMP/OYj8E92xPQXpROffHF//f0NV2A9EZywf628pJremWpaLRe+rvlpNKWjH3S
 iv4BrIFmy9Xm15wo52mDa6DMe/Z9RcLmAnr+Ks9g4yBigK2Pk2D96lnNo2Mht1RVLnhg
 haB3cqJYyALEX9RwwFr5XXnSqgZ+62gjOMo3QblhXUbkOBoRKgkFFQL2jjcMLEeOjy3T
 YQXH7RK0EgDIy+iIpR8ZydANrbrRgZ2nZvWZEo8cdFNkC8Y0fA62b/tms5ghPJRrnLft
 HePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5QKBfnDP8K+IkDPhfsV8KUNVpW4VNpt4IzpvvjIBiLw=;
 b=ITrh6htOtO/n1ida+4MQskg08rqJ5rpQMBkoG21hZ/sbLVvOSjqU3BrFbbHcujq8gC
 2SbP9dAy4FkWfZ0QXWdsbXDZcZiJ2YM02gaondyYrT0P3t8unalA0Azy3t7R3HPn8iMe
 ea7SQDnBvr83hVqKPZahNX9bnuX5vrlx/vfCBlA7fc5jh4oVEvCdRjePskFVAlG8h0QU
 TR1mqvRk5g6EApM6FEvkbphvWLyorpmsSWQHK0XbzCJ9gYEaYT5vAOulMssP6SmdVaWG
 Kd2mAJ8zXaiCv19FfBchUrjkEW+m4vFiSAkckIEBEJmywtRLcY1rQvo170/493ty0ILm
 +yaw==
X-Gm-Message-State: AOAM533ChIg8HcKPA35Vui921F3/PcmEsIrN9FaHTSyB6YgSCp0J8PLP
 jSDYdv4gNsm70wPAuYE46Mr7nhcsLTJB7bKLeINwvA==
X-Google-Smtp-Source: ABdhPJwKd0jF/rqu1uqWlaDwyybt9eS4WC50xCFZ+2Fm52ZQh3nYkwX90IXwR8WmcFCFZJeO3bmTzV5Q7mfV4ex1Wbs=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr6165154wrz.2.1644144365704; 
 Sun, 06 Feb 2022 02:46:05 -0800 (PST)
MIME-Version: 1.0
References: <20220206103138.36105-1-richard.henderson@linaro.org>
 <20220206103138.36105-4-richard.henderson@linaro.org>
In-Reply-To: <20220206103138.36105-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Feb 2022 10:45:54 +0000
Message-ID: <CAFEAcA-FgO6pHhwx8rzNWxZz1e=LJG9ZUSF=PDrh19P92Qt39g@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] tcg/sparc: Convert patch_reloc to return bool
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Feb 2022 at 10:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since 7ecd02a06f8, if patch_reloc fails we restart translation
> with a smaller TB.  Sparc had its function signature changed,
> but not the logic.  Replace assert with return false.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target.c.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> index f9afb1bffc..f3043e6833 100644
> --- a/tcg/sparc/tcg-target.c.inc
> +++ b/tcg/sparc/tcg-target.c.inc
> @@ -323,12 +323,16 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
>
>      switch (type) {
>      case R_SPARC_WDISP16:
> -        assert(check_fit_ptr(pcrel >> 2, 16));
> +        if (!check_fit_ptr(pcrel >> 2, 16)) {
> +            return false;
> +        }
>          insn &= ~INSN_OFF16(-1);
>          insn |= INSN_OFF16(pcrel);
>          break;
>      case R_SPARC_WDISP19:
> -        assert(check_fit_ptr(pcrel >> 2, 19));
> +        if (!check_fit_ptr(pcrel >> 2, 19)) {
> +            return false;
> +        }
>          insn &= ~INSN_OFF19(-1);
>          insn |= INSN_OFF19(pcrel);
>          break;
> --
> 2.25.1
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

