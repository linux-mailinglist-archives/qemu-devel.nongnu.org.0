Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C4B458DEF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:58:18 +0100 (CET)
Received: from localhost ([::1]:59914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7xh-0003fo-VL
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:58:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp7va-0000Be-RA
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:56:06 -0500
Received: from [2a00:1450:4864:20::42a] (port=37444
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp7vW-0001fP-2E
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:56:06 -0500
Received: by mail-wr1-x42a.google.com with SMTP id b12so32193383wrh.4
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 03:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/taArH+/9Zo9QN7zrirxhSKj2q/f0PUYsbN8dolYMoo=;
 b=RRZD8k+/91w2mRjQ0CYQ6feyhhfv/4Udgd+yRHE2UGVE1OYQOC8ln280UMM5UMQo0A
 IG8xkp3QkpLLEd9FeBBe9lvEL4kyFExH1rFUmVPWmTcBDTPaBSHhQI5T9a2ASiP3Az2t
 hobw7bbQMH0CBu6g8trZlpmKZDbQyFySUy5m9hbgJqXMJRrr7z836fKThJ+H1K36517L
 t0MXKOzQxjr6kBhPmF9/Utce5FEpHdJ90fqSxeEMyVDGjyoyKCY7mo1GQbKZXMLGBGrU
 0QD+G/LPQxT54TK0WgIPMtUdHXlX2r02sQhR8rTDpVhKfvHvwGXTUUdPXB6Jpj8CznlM
 q0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/taArH+/9Zo9QN7zrirxhSKj2q/f0PUYsbN8dolYMoo=;
 b=27LceMEf4ZVwORj9VRuU84fM8w/MiS2/oktxpLH5C4Cs1Eue+jTPlpatGWLfIYprQl
 NXoGYXrJnzv+AooU4F+siU8yvVF0aessJwhcq8l+vHybRtq3lX8QPIAdIa8ZZyn9lgMr
 OffLtCy1Hlx4kbGpbG615qD76c8zvhXyQVGLO7rXLJtM41CYp3Sjug31ZxffPgjgFD6E
 aadzRqoKe3fca/GnKRf2PnV59UglTEQ7P0YPp5bibXjIwuVDYCcd+HEUWp9RF4N6lLvr
 BjgUZUkBSjcAc+Hs8TdRZ6l6X9vqsMHMQuXsY38HRZOx8Q8fpWK+kIwK9bqpnmZMVYFa
 MzaA==
X-Gm-Message-State: AOAM531m4AYtdVGdx3bbEZHs5c7bMvQnnjaSCihxUnD9mVBYJ0p4vRk8
 cpPV02xRMGS9MQUsBXv/sYe4iAY8mfJ8X9czEQ6vFw==
X-Google-Smtp-Source: ABdhPJy93FTDab/EFnvw3Hwbj7E/w86kZy7uSW7Pb9K67QujkYQ3yjbtm7Ino2Nx0OLVp8kOGsIAE2wpXEnVr4erD7A=
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr37715094wrf.302.1637582159956; 
 Mon, 22 Nov 2021 03:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-5-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 11:55:48 +0000
Message-ID: <CAFEAcA-cCdFSHVg6hKARipde9yLw=owNm3EZTfwbE5Bo8M0sFA@mail.gmail.com>
Subject: Re: [PATCH v5 04/17] common-user: Move syscall error detection into
 safe_syscall_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Nov 2021 at 16:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The current api from safe_syscall_base() is to return -errno, which is
> the interface provided by *some* linux kernel abis.  The wrapper macro,
> safe_syscall(), detects error, stores into errno, and returns -1, to
> match the api of the system syscall().
>
> For those kernel abis that do not return -errno natively, this leads
> to double syscall error detection.  E.g. Linux ppc64, which sets the
> SO flag for error.
>
> Simplify the usage from C by moving the error detection into assembly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/safe-syscall.h                   | 20 +++---
>  common-user/host/aarch64/safe-syscall.inc.S | 55 +++++++++-------
>  common-user/host/arm/safe-syscall.inc.S     | 58 ++++++++++-------
>  common-user/host/i386/safe-syscall.inc.S    | 51 +++++++++------
>  common-user/host/ppc64/safe-syscall.inc.S   | 63 +++++++++++--------
>  common-user/host/riscv/safe-syscall.inc.S   | 50 +++++++++------
>  common-user/host/s390x/safe-syscall.inc.S   | 50 +++++++++------
>  common-user/host/x86_64/safe-syscall.inc.S  | 70 ++++++++++++---------
>  8 files changed, 243 insertions(+), 174 deletions(-)
>
> diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
> index aaa9ffc0e2..ea0e8a8d24 100644
> --- a/linux-user/safe-syscall.h
> +++ b/linux-user/safe-syscall.h
> @@ -125,23 +125,17 @@
>   * kinds of restartability.
>   */
>  #ifdef HAVE_SAFE_SYSCALL
> -/* The core part of this function is implemented in assembly */
> -extern long safe_syscall_base(int *pending, long number, ...);
> +
> +/* The core part of this function is implemented in assembly. */
> +extern long safe_syscall_base(int *pending, int *errnop, long number, ...);
> +
>  /* These are defined by the safe-syscall.inc.S file */
>  extern char safe_syscall_start[];
>  extern char safe_syscall_end[];
>
> -#define safe_syscall(...)                                               \
> -    ({                                                                  \
> -        long ret_;                                                      \
> -        int *psp_ = &((TaskState *)thread_cpu->opaque)->signal_pending; \
> -        ret_ = safe_syscall_base(psp_, __VA_ARGS__);                    \
> -        if (is_error(ret_)) {                                           \
> -            errno = -ret_;                                              \
> -            ret_ = -1;                                                  \
> -        }                                                               \
> -        ret_;                                                           \
> -    })
> +#define safe_syscall(...)                                                 \
> +    safe_syscall_base(&((TaskState *)thread_cpu->opaque)->signal_pending, \
> +                      &errno, __VA_ARGS__)
>
>  #else
>
> diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
> index bc1f5a9792..95c60d8609 100644
> --- a/common-user/host/aarch64/safe-syscall.inc.S
> +++ b/common-user/host/aarch64/safe-syscall.inc.S
> @@ -17,22 +17,21 @@
>         .type   safe_syscall_start, #function
>         .type   safe_syscall_end, #function
>
> -       /* This is the entry point for making a system call. The calling
> +       /*
> +        * This is the entry point for making a system call. The calling
>          * convention here is that of a C varargs function with the
>          * first argument an 'int *' to the signal_pending flag, the
>          * second one the system call number (as a 'long'), and all further
>          * arguments being syscall arguments (also 'long').

This comment text needs updating to mention the new errnop argument.
(Applies to all the similar comments in the files for the other archs.)

> -        * We return a long which is the syscall's return value, which
> -        * may be negative-errno on failure. Conversion to the
> -        * -1-and-errno-set convention is done by the calling wrapper.
>          */
>  safe_syscall_base:
>         .cfi_startproc
> -       /* The syscall calling convention isn't the same as the
> -        * C one:
> +       /*
> +         * The syscall calling convention isn't the same as the C one:

Looks like the indent here is wrong ?

>          * we enter with x0 == *signal_pending
> -        *               x1 == syscall number
> -        *               x2 ... x7, (stack) == syscall arguments
> +        *               x1 == errno

"int* address of errno"

> +        *               x2 == syscall number
> +        *               x3 ... x7, (stack) == syscall arguments
>          *               and return the result in x0
>          * and the syscall instruction needs
>          *               x8 == syscall number
> @@ -40,17 +39,18 @@ safe_syscall_base:
>          *               and returns the result in x0
>          * Shuffle everything around appropriately.
>          */
> -       mov     x9, x0          /* signal_pending pointer */
> -       mov     x8, x1          /* syscall number */
> -       mov     x0, x2          /* syscall arguments */
> -       mov     x1, x3
> -       mov     x2, x4
> -       mov     x3, x5
> -       mov     x4, x6
> -       mov     x5, x7
> -       ldr     x6, [sp]
> +       mov     x10, x0         /* signal_pending pointer */
> +       mov     x11, x1         /* errno pointer */
> +       mov     x8, x2          /* syscall number */
> +       mov     x0, x3          /* syscall arguments */
> +       mov     x1, x4
> +       mov     x2, x5
> +       mov     x3, x6
> +       mov     x4, x7
> +       ldp     x5, x6, [sp]
>
> -       /* This next sequence of code works in conjunction with the
> +       /*
> +         * This next sequence of code works in conjunction with the
>          * rewind_if_safe_syscall_function(). If a signal is taken
>          * and the interrupted PC is anywhere between 'safe_syscall_start'
>          * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
> @@ -59,17 +59,26 @@ safe_syscall_base:
>          */
>  safe_syscall_start:
>         /* if signal_pending is non-zero, don't do the call */
> -       ldr     w10, [x9]
> -       cbnz    w10, 0f
> +       ldr     w9, [x10]
> +       cbnz    w9, 2f
>         svc     0x0
>  safe_syscall_end:
> +
>         /* code path for having successfully executed the syscall */
> +       cmn     x0, #4095
> +       b.cs    1f

Shouldn't this be going to label 0f ? We need to do the 'neg',
and unless I'm misreading the diff there's currently no path
of execution that gets to that.

Alternatively, branch on the opposite-sense condition to the
'ret' after the set-errno stuff.

>         ret
>
> -0:
> -       /* code path when we didn't execute the syscall */
> -       mov     x0, #-TARGET_ERESTARTSYS
> +       /* code path setting errno */
> +0:     neg     w0, w0                  /* create positive errno */
> +1:     str     w0, [x11]               /* store errno */
> +       mov     x0, #-1
>         ret
> +
> +       /* code path when we didn't execute the syscall */
> +2:     mov     w0, #TARGET_ERESTARTSYS
> +       b       1b
> +
>         .cfi_endproc
>
>         .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
> index 88c4958504..17839c6486 100644
> --- a/common-user/host/arm/safe-syscall.inc.S
> +++ b/common-user/host/arm/safe-syscall.inc.S
> @@ -22,33 +22,35 @@
>         .arm
>         .align 2
>
> -       /* This is the entry point for making a system call. The calling
> +       /*
> +        * This is the entry point for making a system call. The calling
>          * convention here is that of a C varargs function with the
>          * first argument an 'int *' to the signal_pending flag, the
>          * second one the system call number (as a 'long'), and all further
>          * arguments being syscall arguments (also 'long').
> -        * We return a long which is the syscall's return value, which
> -        * may be negative-errno on failure. Conversion to the
> -        * -1-and-errno-set convention is done by the calling wrapper.
>          */
>  safe_syscall_base:
>         .fnstart
>         .cfi_startproc
>         mov     r12, sp                 /* save entry stack */
> -       push    { r4, r5, r6, r7, r8, lr }
> -       .save   { r4, r5, r6, r7, r8, lr }
> -       .cfi_adjust_cfa_offset 24
> +       push    { r4, r5, r6, r7, r8, r9, r10, lr }
> +       .save   { r4, r5, r6, r7, r8, r9, r10, lr }
> +       .cfi_adjust_cfa_offset 32
>         .cfi_rel_offset r4, 0
>         .cfi_rel_offset r5, 4
>         .cfi_rel_offset r6, 8
>         .cfi_rel_offset r7, 12
>         .cfi_rel_offset r8, 16
> -       .cfi_rel_offset lr, 20
> +       .cfi_rel_offset r9, 20
> +       .cfi_rel_offset r10, 24
> +       .cfi_rel_offset lr, 28
>
> -       /* The syscall calling convention isn't the same as the C one:
> -        * we enter with r0 == *signal_pending
> -        *               r1 == syscall number
> -        *               r2, r3, [sp+0] ... [sp+12] == syscall arguments
> +       /*
> +        * The syscall calling convention isn't the same as the C one:
> +        * we enter with r0 == &signal_pending
> +         *               r1 == &errno

Odd indent ?

> +        *               r2 == syscall number
> +        *               r3, [sp+0] ... [sp+16] == syscall arguments
>          *               and return the result in r0

Don't we wind up with a potential issue here with 64-bit arguments
due to the calling convention wanting to put those in aligned
memory/register locations? Previously because we had just two
extra arguments the arguments started at r2 and had the same
alignment behaviour as the syscall wants for them starting at
r0; but now we start at r3 so if for instance the first argument
is 64-bit it will be in [sp+0][sp+4] but should go in r0:r1
I think...

(Stopped reviewing here because if we need to change the
way we call these functions there's no point my reviewing
the fine detail of the asm.)

-- PMM

