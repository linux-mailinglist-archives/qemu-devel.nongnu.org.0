Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9BB43ABF6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 08:00:59 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfFW5-0007ll-SF
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 02:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFJt-0005Vs-1g; Tue, 26 Oct 2021 01:48:21 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:44239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFJo-0002If-1N; Tue, 26 Oct 2021 01:48:20 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 0AFAF76E4A;
 Tue, 26 Oct 2021 05:48:15 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Hdgpk6MNnz3Gvs;
 Tue, 26 Oct 2021 05:48:14 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id AB923CF93;
 Tue, 26 Oct 2021 05:48:14 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f177.google.com with SMTP id t40so170101qtc.6;
 Mon, 25 Oct 2021 22:48:14 -0700 (PDT)
X-Gm-Message-State: AOAM532JkLgiiGuwWTNNZerUb6O7wCca/wQPXZuf54jKsJHp32c/iSJt
 XeU5W8/Ao5U1lE9VQLDJihXHl5pv2qCIOsaviLE=
X-Google-Smtp-Source: ABdhPJyxia7heXdle8TD6y58cCAZYjs+pv7tMWSnK8ODcbUFhIK4hCyQSnZx0E5NGUnrKT3bxyD+Eul2bBYTBVy/iLQ=
X-Received: by 2002:ac8:57c3:: with SMTP id w3mr22186908qta.132.1635227294401; 
 Mon, 25 Oct 2021 22:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-11-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-11-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 00:48:03 -0500
X-Gmail-Original-Message-ID: <CACNAnaHBpQzBpzCFnvsujkX4YKqxxBJcGNzY+Ax3agoZ1xQXdA@mail.gmail.com>
Message-ID: <CACNAnaHBpQzBpzCFnvsujkX4YKqxxBJcGNzY+Ax3agoZ1xQXdA@mail.gmail.com>
Subject: Re: [PATCH 10/24] bsd-user/arm/target_arch_reg.h: Implement core dump
 register copying
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Implement the register copying routines to extract registers from the
> cpu for core dump generation.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_reg.h | 60 ++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 bsd-user/arm/target_arch_reg.h
>
> diff --git a/bsd-user/arm/target_arch_reg.h b/bsd-user/arm/target_arch_reg.h
> new file mode 100644
> index 0000000000..ef5ed5154f
> --- /dev/null
> +++ b/bsd-user/arm/target_arch_reg.h
> @@ -0,0 +1,60 @@
> +/*
> + *  FreeBSD arm register structures
> + *
> + *  Copyright (c) 2015 Stacey Son
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _TARGET_ARCH_REG_H_
> +#define _TARGET_ARCH_REG_H_
> +
> +/* See sys/arm/include/reg.h */
> +typedef struct target_reg {
> +    uint32_t        r[13];
> +    uint32_t        r_sp;
> +    uint32_t        r_lr;
> +    uint32_t        r_pc;
> +    uint32_t        r_cpsr;
> +} target_reg_t;
> +
> +typedef struct target_fp_reg {
> +    uint32_t        fp_exponent;
> +    uint32_t        fp_mantissa_hi;
> +    u_int32_t       fp_mantissa_lo;
> +} target_fp_reg_t;
> +
> +typedef struct target_fpreg {
> +    uint32_t        fpr_fpsr;
> +    target_fp_reg_t fpr[8];
> +} target_fpreg_t;
> +
> +#define tswapreg(ptr)   tswapal(ptr)
> +
> +static inline void target_copy_regs(target_reg_t *regs, const CPUARMState *env)
> +{
> +    int i;
> +
> +    for (i = 0; i < 13; i++) {
> +        regs->r[i] = tswapreg(env->regs[i + 1]);
> +    }
> +    regs->r_sp = tswapreg(env->regs[13]);
> +    regs->r_lr = tswapreg(env->regs[14]);
> +    regs->r_pc = tswapreg(env->regs[15]);
> +    regs->r_cpsr = tswapreg(cpsr_read((CPUARMState *)env));
> +}
> +
> +#undef tswapreg
> +
> +#endif /* !_TARGET_ARCH_REG_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

