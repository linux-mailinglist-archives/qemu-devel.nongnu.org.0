Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270E4438242
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 09:43:02 +0200 (CEST)
Received: from localhost ([::1]:42886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meBgC-0002H2-Sx
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 03:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBVh-0006VK-3L; Sat, 23 Oct 2021 03:32:09 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:49488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBVZ-0004JD-4V; Sat, 23 Oct 2021 03:32:06 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id CD5AD99630;
 Sat, 23 Oct 2021 07:31:59 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HbtFq56G1z3Dy5;
 Sat, 23 Oct 2021 07:31:59 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 8F613A269;
 Sat, 23 Oct 2021 07:31:59 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f169.google.com with SMTP id b12so5615141qtq.3;
 Sat, 23 Oct 2021 00:31:59 -0700 (PDT)
X-Gm-Message-State: AOAM530JTjd5bU4iQk5LPVwVSUI0PfNeFJIFRNkrX60YxcEEhMDGEfss
 xLGl+MhzAY4fscELx68Ncgs7giATc7IN0Ev303k=
X-Google-Smtp-Source: ABdhPJy8UNk9th8KZK/l8DTEgmDJlQCqR9ePNqU+j3JxFqzBiqCcsbGn2saG+mgs6SyADJamMLlntAcIgjLi8OyvXJA=
X-Received: by 2002:ac8:5846:: with SMTP id h6mr4733071qth.340.1634974319339; 
 Sat, 23 Oct 2021 00:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-6-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-6-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 23 Oct 2021 02:31:48 -0500
X-Gmail-Original-Message-ID: <CACNAnaH=pJy2aTK1hwKSZPwrmqeE5nUYC7B1zB7hY0anT7dfSA@mail.gmail.com>
Message-ID: <CACNAnaH=pJy2aTK1hwKSZPwrmqeE5nUYC7B1zB7hY0anT7dfSA@mail.gmail.com>
Subject: Re: [PATCH 05/24] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@freebsd.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Implement target_cpu_clone_regs to clone the resister state on a fork.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
> index 0f3538196d..c71ec000b3 100644
> --- a/bsd-user/arm/target_arch_cpu.h
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -35,6 +35,14 @@ static inline void target_cpu_init(CPUARMState *env,
>      }
>  }
>
> +static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
> +{
> +    if (newsp) {
> +        env->regs[13] = newsp;
> +    }
> +    env->regs[0] = 0;
> +}
> +
>  static inline void target_cpu_reset(CPUArchState *cpu)
>  {
>  }
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

