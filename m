Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0971454B06
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:32:27 +0100 (CET)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNrG-0005qh-Sb
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:32:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNo1-0003As-6t
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:29:05 -0500
Received: from [2607:f8b0:4864:20::a2a] (port=44721
 helo=mail-vk1-xa2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNnv-0007JJ-GR
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:29:04 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id u68so1970511vke.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ktPg29IlqmTVrDic5hH4fhAehJsP0I7N7/E1GvRpBRM=;
 b=yJATFH4Fqcu7Q6QGB4Ah9Kvjw3djUzLbDdlOe+JHrUMnSZ06FCdooBR33ESUpt8ske
 OmDGA3wSPwe4tWt1UxCLRaDCfF9Ii93x/thqv6jP8hsYqwnkDr5AwnzyNfUs9G0o2yPC
 zDMCb6S5wW4uiRSZIp/SgLh18nvTsj8bOS5rbX06Euiu4ZqKXh4LEP+cawe45mRCiYWL
 EvlQav7VE9Y8fqMVlE4CkV1OR1YIE39eIT1jxwaFCGScVSU8G4iArp4WV6NQSFrj3obz
 xRstFzg1n86Ws785WtLtGZDjXSzKXPPsOm6SwJBV9OPXG2JY/b9M0AnaYx3tvs4gRPnr
 V4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ktPg29IlqmTVrDic5hH4fhAehJsP0I7N7/E1GvRpBRM=;
 b=GTCFwBB6LIHJ2HZ7h9kpqb+EdkoLcae5/k7Agz5vr2HffsdgGi4SQ+7PVSrNuYntSi
 H8zyI6OPuFnd7qnm+koQOl3rQFC8/dcYOcATEG+SzXfKeZyrO69YHt7tCh2vGRAVmJ+A
 8qqCIM+w7dpJ3WSfFmJTd6bqBieJBFLamAHEWK+Ps1y5ULQE6eJjym1zHn/jlEk51/+q
 LCNLzAxDj7OeFtEsNiJez4eok/hq17mRCqxnszfuFQussc7N/eZi3kxkiWRrH/iDULm1
 Tc+uCu9C42WtiWQVBsVEBh1xLrKHBojZ6znhUIYJCvB2LfoEJjkr9xGUGZ7sa8/QuOPw
 mSPg==
X-Gm-Message-State: AOAM5309x/qPnJBeypq32O8aBrm5GFg3Gennfeua7/FeQKwkLvrD714y
 oDNtuYqFBoJzDsK520L0eoJKt7u7+vpODnqESbfcmA==
X-Google-Smtp-Source: ABdhPJxhe27gKnc7L1cQx3iYY1f9SbfZBy4DuENS1gr+a/txN9eMqo6l2QV6HN3oAu/Z03yU6kLxcixAu/vn096T5eY=
X-Received: by 2002:a05:6122:2090:: with SMTP id
 i16mr91509290vkd.18.1637166537945; 
 Wed, 17 Nov 2021 08:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-5-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-5-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 09:28:47 -0700
Message-ID: <CANCZdfqQnXu-fY46Ycq50CsV9vEMRSTgforvOWoZ3HTqMGAfkQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/17] common-user: Move syscall error detection into
 safe_syscall_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000eec2cb05d0fe89d4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eec2cb05d0fe89d4
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

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

Reviewed by: Warner Losh <imp@bsdimp.com>

And I think it may fix a bug, when integrated with bsd-user fork,
in PowerPC hosts (though there's other bugs lingering there).


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
> +extern long safe_syscall_base(int *pending, int *errnop, long number,
> ...);
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
> +#define safe_syscall(...)
>  \
> +    safe_syscall_base(&((TaskState *)thread_cpu->opaque)->signal_pending,
> \
> +                      &errno, __VA_ARGS__)
>
>  #else
>
> diff --git a/common-user/host/aarch64/safe-syscall.inc.S
> b/common-user/host/aarch64/safe-syscall.inc.S
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
>          * we enter with x0 == *signal_pending
> -        *               x1 == syscall number
> -        *               x2 ... x7, (stack) == syscall arguments
> +        *               x1 == errno
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
>          * and 'safe_syscall_end' then we rewind it to
> 'safe_syscall_start'.
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
> diff --git a/common-user/host/arm/safe-syscall.inc.S
> b/common-user/host/arm/safe-syscall.inc.S
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
> +        *               r2 == syscall number
> +        *               r3, [sp+0] ... [sp+16] == syscall arguments
>          *               and return the result in r0
>          * and the syscall instruction needs
>          *               r7 == syscall number
> @@ -58,12 +60,13 @@ safe_syscall_base:
>          * Note the 16 bytes that we pushed to save registers.
>          */
>         mov     r8, r0                  /* copy signal_pending */
> -       mov     r7, r1                  /* syscall number */
> -       mov     r0, r2                  /* syscall args */
> -       mov     r1, r3
> -       ldm     r12, { r2, r3, r4, r5, r6 }
> +       mov     r9, r1                  /* copy errnop */
> +       mov     r7, r2                  /* syscall number */
> +       mov     r0, r3                  /* syscall args */
> +       ldm     r12, { r1, r2, r3, r4, r5, r6 }
>
> -       /* This next sequence of code works in conjunction with the
> +       /*
> +        * This next sequence of code works in conjunction with the
>          * rewind_if_safe_syscall_function(). If a signal is taken
>          * and the interrupted PC is anywhere between 'safe_syscall_start'
>          * and 'safe_syscall_end' then we rewind it to
> 'safe_syscall_start'.
> @@ -74,16 +77,25 @@ safe_syscall_start:
>         /* if signal_pending is non-zero, don't do the call */
>         ldr     r12, [r8]               /* signal_pending */
>         tst     r12, r12
> -       bne     1f
> +       bne     2f
>         swi     0
>  safe_syscall_end:
> -       /* code path for having successfully executed the syscall */
> -       pop     { r4, r5, r6, r7, r8, pc }
>
> -1:
> +       /* code path for having successfully executed the syscall */
> +       cmp     r0, #-4096
> +       bhi     0f
> +9:     pop     { r4, r5, r6, r7, r8, r9, r10, pc }
> +
> +       /* code path setting errno */
> +0:     neg     r0, r0          /* create positive errno */
> +1:     str     r0, [r9]        /* store errno */
> +       mov     r0, #-1
> +       b       9b
> +
>         /* code path when we didn't execute the syscall */
> -       ldr     r0, =-TARGET_ERESTARTSYS
> -       pop     { r4, r5, r6, r7, r8, pc }
> +2:     ldr     r0, =TARGET_ERESTARTSYS
> +       b       1b
> +
>         .fnend
>         .cfi_endproc
>
> diff --git a/common-user/host/i386/safe-syscall.inc.S
> b/common-user/host/i386/safe-syscall.inc.S
> index 9e58fc6504..ad89521783 100644
> --- a/common-user/host/i386/safe-syscall.inc.S
> +++ b/common-user/host/i386/safe-syscall.inc.S
> @@ -15,14 +15,12 @@
>         .global safe_syscall_end
>         .type   safe_syscall_base, @function
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
>         .cfi_startproc
> @@ -41,9 +39,10 @@ safe_syscall_base:
>
>         /* The syscall calling convention isn't the same as the C one:
>          * we enter with 0(%esp) == return address
> -        *               4(%esp) == *signal_pending
> -        *               8(%esp) == syscall number
> -        *               12(%esp) ... 32(%esp) == syscall arguments
> +        *               4(%esp) == &signal_pending
> +        *               8(%esp) == &errno
> +        *               12(%esp) == syscall number
> +        *               16(%esp) ... 36(%esp) == syscall arguments
>          *               and return the result in eax
>          * and the syscall instruction needs
>          *               eax == syscall number
> @@ -52,14 +51,15 @@ safe_syscall_base:
>          * Shuffle everything around appropriately.
>          * Note the 16 bytes that we pushed to save registers.
>          */
> -       mov     12+16(%esp), %ebx       /* the syscall arguments */
> -       mov     16+16(%esp), %ecx
> -       mov     20+16(%esp), %edx
> -       mov     24+16(%esp), %esi
> -       mov     28+16(%esp), %edi
> -       mov     32+16(%esp), %ebp
> +       mov     16+16(%esp), %ebx       /* the syscall arguments */
> +       mov     20+16(%esp), %ecx
> +       mov     24+16(%esp), %edx
> +       mov     28+16(%esp), %esi
> +       mov     32+16(%esp), %edi
> +       mov     36+16(%esp), %ebp
>
> -       /* This next sequence of code works in conjunction with the
> +       /*
> +        * This next sequence of code works in conjunction with the
>          * rewind_if_safe_syscall_function(). If a signal is taken
>          * and the interrupted PC is anywhere between 'safe_syscall_start'
>          * and 'safe_syscall_end' then we rewind it to
> 'safe_syscall_start'.
> @@ -70,12 +70,16 @@ safe_syscall_start:
>         /* if signal_pending is non-zero, don't do the call */
>         mov     4+16(%esp), %eax        /* signal_pending */
>         cmpl    $0, (%eax)
> -       jnz     1f
> +       jnz     2f
>         mov     8+16(%esp), %eax        /* syscall number */
>         int     $0x80
>  safe_syscall_end:
> +
>         /* code path for having successfully executed the syscall */
> -       pop     %ebx
> +       cmp     $-4095, %eax
> +       jae     0f
> +
> +9:     pop     %ebx
>         .cfi_remember_state
>         .cfi_adjust_cfa_offset -4
>         .cfi_restore ebx
> @@ -90,11 +94,18 @@ safe_syscall_end:
>         .cfi_restore ebp
>         ret
>
> -1:
> -       /* code path when we didn't execute the syscall */
>         .cfi_restore_state
> -       mov     $-TARGET_ERESTARTSYS, %eax
> -       jmp     safe_syscall_end
> +
> +       /* code path setting errno */
> +0:     neg     %eax                    /* create positive errno */
> +1:     mov     8+16(%esp), %ebx        /* load errno pointer */
> +       mov     %eax, (%ebx)            /* store errno */
> +       mov     $-1, %eax
> +       jmp     9b
> +
> +       /* code path when we didn't execute the syscall */
> +2:     mov     $TARGET_ERESTARTSYS, %eax
> +       jmp     1b
>         .cfi_endproc
>
>         .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/common-user/host/ppc64/safe-syscall.inc.S
> b/common-user/host/ppc64/safe-syscall.inc.S
> index 875133173b..e35408c5fb 100644
> --- a/common-user/host/ppc64/safe-syscall.inc.S
> +++ b/common-user/host/ppc64/safe-syscall.inc.S
> @@ -17,14 +17,19 @@
>
>         .text
>
> -       /* This is the entry point for making a system call. The calling
> +#if _CALL_ELF == 2
> +#define PARAM_OFS   32
> +#else
> +#define PARAM_OFS   48
> +#endif
> +#define PARAM(X)    PARAM_OFS + X*8
> +
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
>  #if _CALL_ELF == 2
>  safe_syscall_base:
> @@ -39,9 +44,11 @@ safe_syscall_base:
>  .L.safe_syscall_base:
>         .cfi_startproc
>  #endif
> -       /* We enter with r3 == *signal_pending
> -        *               r4 == syscall number
> -        *               r5 ... r10 == syscall arguments
> +       /*
> +        * We enter with r3 == &signal_pending
> +        *               r4 == &errno
> +        *               r5 == syscall number
> +        *               r6 ... r10, (stack) == syscall arguments
>          *               and return the result in r3
>          * and the syscall instruction needs
>          *               r0 == syscall number
> @@ -49,18 +56,18 @@ safe_syscall_base:
>          *               and returns the result in r3
>          * Shuffle everything around appropriately.
>          */
> -       std     14, 16(1) /* Preserve r14 in SP+16 */
> -       .cfi_offset 14, 16
> -       mr      14, 3   /* signal_pending */
> -       mr      0, 4    /* syscall number */
> -       mr      3, 5    /* syscall arguments */
> -       mr      4, 6
> -       mr      5, 7
> -       mr      6, 8
> -       mr      7, 9
> -       mr      8, 10
> +       mr      11, 3           /* signal_pending pointer */
> +       std     4, PARAM(1)(1)  /* save errno pointer in param slot */
> +       mr      0, 5            /* syscall number */
> +       mr      3, 6            /* syscall arguments */
> +       mr      4, 7
> +       mr      5, 8
> +       mr      6, 9
> +       mr      7, 10
> +       ld      8, PARAM(8)(1)
>
> -       /* This next sequence of code works in conjunction with the
> +       /*
> +        * This next sequence of code works in conjunction with the
>          * rewind_if_safe_syscall_function(). If a signal is taken
>          * and the interrupted PC is anywhere between 'safe_syscall_start'
>          * and 'safe_syscall_end' then we rewind it to
> 'safe_syscall_start'.
> @@ -69,23 +76,25 @@ safe_syscall_base:
>          */
>  safe_syscall_start:
>         /* if signal_pending is non-zero, don't do the call */
> -       lwz     12, 0(14)
> +       lwz     12, 0(11)
>         cmpwi   0, 12, 0
>         bne-    0f
>         sc
>  safe_syscall_end:
> -       /* code path when we did execute the syscall */
> -       ld 14, 16(1) /* restore r14 to its original value */
> -       bnslr+
>
> -       /* syscall failed; return negative errno */
> -       neg     3, 3
> +       /* code path for having successfully executed the syscall */
> +       bnslr+                  /* SO set for syscall error */
> +
> +       /* code path setting errno */
> +1:     ld      11, PARAM(1)(1) /* restore errno pointer */
> +       stw     3, 0(11)        /* store errno */
> +       li      3, -1
>         blr
>
>         /* code path when we didn't execute the syscall */
> -0:     addi    3, 0, -TARGET_ERESTARTSYS
> -       ld 14, 16(1) /* restore r14 to its original value */
> -       blr
> +0:     li      3, TARGET_ERESTARTSYS
> +       b       1b
> +
>         .cfi_endproc
>
>  #if _CALL_ELF == 2
> diff --git a/common-user/host/riscv/safe-syscall.inc.S
> b/common-user/host/riscv/safe-syscall.inc.S
> index 9ca3fbfd1e..eddede702b 100644
> --- a/common-user/host/riscv/safe-syscall.inc.S
> +++ b/common-user/host/riscv/safe-syscall.inc.S
> @@ -23,17 +23,15 @@
>          * first argument an 'int *' to the signal_pending flag, the
>          * second one the system call number (as a 'long'), and all further
>          * arguments being syscall arguments (also 'long').
> -        * We return a long which is the syscall's return value, which
> -        * may be negative-errno on failure. Conversion to the
> -        * -1-and-errno-set convention is done by the calling wrapper.
>          */
>  safe_syscall_base:
>         .cfi_startproc
>         /*
>          * The syscall calling convention is nearly the same as C:
> -        * we enter with a0 == *signal_pending
> -        *               a1 == syscall number
> -        *               a2 ... a7 == syscall arguments
> +        * we enter with a0 == &signal_pending
> +        *               a1 == &errno
> +        *               a2 == syscall number
> +        *               a3 ... a7, [sp] == syscall arguments
>          *               and return the result in a0
>          * and the syscall instruction needs
>          *               a7 == syscall number
> @@ -42,14 +40,19 @@ safe_syscall_base:
>          * Shuffle everything around appropriately.
>          */
>         mv      t0, a0          /* signal_pending pointer */
> -       mv      t1, a1          /* syscall number */
> -       mv      a0, a2          /* syscall arguments */
> -       mv      a1, a3
> -       mv      a2, a4
> -       mv      a3, a5
> -       mv      a4, a6
> -       mv      a5, a7
> -       mv      a7, t1
> +       mv      t1, a1          /* errno pointer */
> +       mv      t2, a2          /* syscall number */
> +       mv      a0, a3          /* syscall arguments */
> +       mv      a1, a4
> +       mv      a2, a5
> +       mv      a3, a6
> +       mv      a4, a7
> +#if __riscv_xlen == 32
> +       lw      a5, 0(sp)
> +#else
> +       ld      a5, 0(sp)
> +#endif
> +       mv      a7, t2
>
>         /*
>          * This next sequence of code works in conjunction with the
> @@ -61,17 +64,26 @@ safe_syscall_base:
>          */
>  safe_syscall_start:
>         /* If signal_pending is non-zero, don't do the call */
> -       lw      t1, 0(t0)
> -       bnez    t1, 0f
> +       lw      t2, 0(t0)
> +       bnez    t2, 2f
>         scall
>  safe_syscall_end:
> +
>         /* code path for having successfully executed the syscall */
> +       li      t2, -4096
> +       bgtu    a0, t2, 0f
>         ret
>
> -0:
> -       /* code path when we didn't execute the syscall */
> -       li      a0, -TARGET_ERESTARTSYS
> +       /* code path setting errno */
> +0:     neg     a0, a0                  /* create positive errno */
> +1:     sw      a0, 0(t1)               /* store errno */
> +       li      a0, -1
>         ret
> +
> +       /* code path when we didn't execute the syscall */
> +2:     li      a0, TARGET_ERESTARTSYS
> +       j       1b
> +
>         .cfi_endproc
>
>         .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/common-user/host/s390x/safe-syscall.inc.S
> b/common-user/host/s390x/safe-syscall.inc.S
> index 414b44ad38..f2a3bccc13 100644
> --- a/common-user/host/s390x/safe-syscall.inc.S
> +++ b/common-user/host/s390x/safe-syscall.inc.S
> @@ -15,14 +15,12 @@
>         .global safe_syscall_end
>         .type   safe_syscall_base, @function
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
>         .cfi_startproc
> @@ -44,11 +42,13 @@ safe_syscall_base:
>         stg     %r1,0(%r15)             /* store back chain */
>         stg     %r0,8(%r15)             /* store eos */
>
> -       /* The syscall calling convention isn't the same as the
> +       /*
> +        * The syscall calling convention isn't the same as the
>          * C one:
> -        * we enter with r2 == *signal_pending
> -        *               r3 == syscall number
> -        *               r4, r5, r6, (stack) == syscall arguments
> +        * we enter with r2 == &signal_pending
> +        *               r3 == &errno
> +        *               r4 == syscall number
> +        *               r5, r6, (stack) == syscall arguments
>          *               and return the result in r2
>          * and the syscall instruction needs
>          *               r1 == syscall number
> @@ -57,13 +57,14 @@ safe_syscall_base:
>          * Shuffle everything around appropriately.
>          */
>         lgr     %r8,%r2                 /* signal_pending pointer */
> -       lgr     %r1,%r3                 /* syscall number */
> -       lgr     %r2,%r4                 /* syscall args */
> -       lgr     %r3,%r5
> -       lgr     %r4,%r6
> -       lmg     %r5,%r7,320(%r15)
> +       lgr     %r9,%r3                 /* errno pointer */
> +       lgr     %r1,%r4                 /* syscall number */
> +       lgr     %r2,%r5                 /* syscall args */
> +       lgr     %r3,%r6
> +       lmg     %r4,%r7,320(%r15)
>
> -       /* This next sequence of code works in conjunction with the
> +       /*
> +        * This next sequence of code works in conjunction with the
>          * rewind_if_safe_syscall_function(). If a signal is taken
>          * and the interrupted PC is anywhere between 'safe_syscall_start'
>          * and 'safe_syscall_end' then we rewind it to
> 'safe_syscall_start'.
> @@ -73,18 +74,31 @@ safe_syscall_base:
>  safe_syscall_start:
>         /* if signal_pending is non-zero, don't do the call */
>         icm     %r0,15,0(%r8)
> -       jne     2f
> +       jne     1f
>         svc     0
>  safe_syscall_end:
>
> -1:     lg      %r15,0(%r15)            /* load back chain */
> +       /* code path for having successfully executed the syscall */
> +       lghi    %r0, -4095              /* check for syscall error */
> +       clgr    %r2, %r0
> +       jgnl    0f
> +
> +9:     lg      %r15,0(%r15)            /* load back chain */
>         .cfi_remember_state
>         .cfi_adjust_cfa_offset -160
>         lmg     %r6,%r15,48(%r15)       /* load saved registers */
>         br      %r14
>         .cfi_restore_state
> -2:     lghi    %r2, -TARGET_ERESTARTSYS
> -       j       1b
> +
> +       /* code path when we didn't execute the syscall */
> +1:     lghi    %r2, -TARGET_ERESTARTSYS
> +
> +       /* code path setting errno */
> +0:     lcr     %r2, %r2                /* create positive errno */
> +       st      %r2, 0(%r9)             /* store errno */
> +       lghi    %r2, -1
> +       j       9b
> +
>         .cfi_endproc
>
>         .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/common-user/host/x86_64/safe-syscall.inc.S
> b/common-user/host/x86_64/safe-syscall.inc.S
> index f36992daa3..9a0c4c93b4 100644
> --- a/common-user/host/x86_64/safe-syscall.inc.S
> +++ b/common-user/host/x86_64/safe-syscall.inc.S
> @@ -14,18 +14,17 @@
>          .global safe_syscall_end
>          .type   safe_syscall_base, @function
>
> -        /* This is the entry point for making a system call. The calling
> +        /*
> +         * This is the entry point for making a system call. The calling
>           * convention here is that of a C varargs function with the
>           * first argument an 'int *' to the signal_pending flag, the
>           * second one the system call number (as a 'long'), and all
> further
>           * arguments being syscall arguments (also 'long').
> -         * We return a long which is the syscall's return value, which
> -         * may be negative-errno on failure. Conversion to the
> -         * -1-and-errno-set convention is done by the calling wrapper.
>           */
>  safe_syscall_base:
>          .cfi_startproc
> -        /* This saves a frame pointer and aligns the stack for the
> syscall.
> +        /*
> +         * This saves a frame pointer and aligns the stack for the
> syscall.
>           * (It's unclear if the syscall ABI has the same stack alignment
>           * requirements as the userspace function call ABI, but better
> safe than
>           * sorry. Appendix A2 of
> http://www.x86-64.org/documentation/abi.pdf
> @@ -35,11 +34,12 @@ safe_syscall_base:
>          .cfi_adjust_cfa_offset 8
>          .cfi_rel_offset rbp, 0
>
> -        /* The syscall calling convention isn't the same as the
> -         * C one:
> -         * we enter with rdi == *signal_pending
> -         *               rsi == syscall number
> -         *               rdx, rcx, r8, r9, (stack), (stack) == syscall
> arguments
> +        /*
> +         * The syscall calling convention isn't the same as the C one:
> +         * we enter with rdi == &signal_pending
> +         *               rsi == &errno
> +         *               rdx == syscall number
> +         *               rcx, r8, r9, (stack...) == syscall arguments
>           *               and return the result in rax
>           * and the syscall instruction needs
>           *               rax == syscall number
> @@ -48,17 +48,19 @@ safe_syscall_base:
>           * Shuffle everything around appropriately.
>           * Note that syscall will trash rcx and r11.
>           */
> -        mov     %rsi, %rax /* syscall number */
> -        mov     %rdi, %rbp /* signal_pending pointer */
> +        mov     %rdi, %r11 /* signal_pending pointer */
> +        mov     %rsi, %rbp /* errno pointer */
> +        mov     %rdx, %rax /* syscall number */
>          /* and the syscall arguments */
> -        mov     %rdx, %rdi
> -        mov     %rcx, %rsi
> -        mov     %r8,  %rdx
> -        mov     %r9,  %r10
> -        mov     16(%rsp), %r8
> -        mov     24(%rsp), %r9
> +        mov     %rcx, %rdi
> +        mov     %r8, %rsi
> +        mov     %r9,  %rdx
> +        mov     16(%rsp), %r10
> +        mov     24(%rsp), %r8
> +        mov     32(%rsp), %r9
>
> -        /* This next sequence of code works in conjunction with the
> +        /*
> +         * This next sequence of code works in conjunction with the
>           * rewind_if_safe_syscall_function(). If a signal is taken
>           * and the interrupted PC is anywhere between 'safe_syscall_start'
>           * and 'safe_syscall_end' then we rewind it to
> 'safe_syscall_start'.
> @@ -67,25 +69,31 @@ safe_syscall_base:
>           */
>  safe_syscall_start:
>          /* if signal_pending is non-zero, don't do the call */
> -        cmpl   $0, (%rbp)
> -        jnz     1f
> +        cmpl    $0, (%r11)
> +        jnz     2f
>          syscall
>  safe_syscall_end:
> +
>          /* code path for having successfully executed the syscall */
> -        pop     %rbp
> +        cmp    $-4095, %rax
> +        jae    0f
> +
> +9:      pop     %rbp
>          .cfi_remember_state
>          .cfi_def_cfa_offset 8
>          .cfi_restore rbp
>          ret
> -
> -1:
> -        /* code path when we didn't execute the syscall */
>          .cfi_restore_state
> -        mov     $-TARGET_ERESTARTSYS, %rax
> -        pop     %rbp
> -        .cfi_def_cfa_offset 8
> -        .cfi_restore rbp
> -        ret
> -        .cfi_endproc
>
> +        /* code path setting errno */
> +0:      neg    %eax                    /* create positive errno */
> +1:      mov    %eax, (%rbp)            /* store errno */
> +        mov    $-1, %rax
> +        jmp    9b
> +
> +        /* code path when we didn't execute the syscall */
> +2:      mov     $TARGET_ERESTARTSYS, %eax
> +        jmp    1b
> +
> +        .cfi_endproc
>          .size   safe_syscall_base, .-safe_syscall_base
> --
> 2.25.1
>
>

--000000000000eec2cb05d0fe89d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgTm92
IDE3LCAyMDIxIGF0IDk6MDQgQU0gUmljaGFyZCBIZW5kZXJzb24gJmx0OzxhIGhyZWY9Im1haWx0
bzpyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIj5yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQg
cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5UaGUgY3VycmVudCBhcGkgZnJvbSBz
YWZlX3N5c2NhbGxfYmFzZSgpIGlzIHRvIHJldHVybiAtZXJybm8sIHdoaWNoIGlzPGJyPg0KdGhl
IGludGVyZmFjZSBwcm92aWRlZCBieSAqc29tZSogbGludXgga2VybmVsIGFiaXMuwqAgVGhlIHdy
YXBwZXIgbWFjcm8sPGJyPg0Kc2FmZV9zeXNjYWxsKCksIGRldGVjdHMgZXJyb3IsIHN0b3JlcyBp
bnRvIGVycm5vLCBhbmQgcmV0dXJucyAtMSwgdG88YnI+DQptYXRjaCB0aGUgYXBpIG9mIHRoZSBz
eXN0ZW0gc3lzY2FsbCgpLjxicj4NCjxicj4NCkZvciB0aG9zZSBrZXJuZWwgYWJpcyB0aGF0IGRv
IG5vdCByZXR1cm4gLWVycm5vIG5hdGl2ZWx5LCB0aGlzIGxlYWRzPGJyPg0KdG8gZG91YmxlIHN5
c2NhbGwgZXJyb3IgZGV0ZWN0aW9uLsKgIEUuZy4gTGludXggcHBjNjQsIHdoaWNoIHNldHMgdGhl
PGJyPg0KU08gZmxhZyBmb3IgZXJyb3IuPGJyPg0KPGJyPg0KU2ltcGxpZnkgdGhlIHVzYWdlIGZy
b20gQyBieSBtb3ZpbmcgdGhlIGVycm9yIGRldGVjdGlvbiBpbnRvIGFzc2VtYmx5Ljxicj4NCjxi
cj4NClNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uICZsdDs8YSBocmVmPSJtYWlsdG86
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmc8L2E+Jmd0Ozxicj4NCi0tLTxicj4NCsKgbGludXgtdXNlci9zYWZl
LXN5c2NhbGwuaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAyMCArKystLS08YnI+DQrC
oGNvbW1vbi11c2VyL2hvc3QvYWFyY2g2NC9zYWZlLXN5c2NhbGwuaW5jLlMgfCA1NSArKysrKysr
KystLS0tLS0tPGJyPg0KwqBjb21tb24tdXNlci9ob3N0L2FybS9zYWZlLXN5c2NhbGwuaW5jLlPC
oCDCoCDCoHwgNTggKysrKysrKysrKy0tLS0tLS08YnI+DQrCoGNvbW1vbi11c2VyL2hvc3QvaTM4
Ni9zYWZlLXN5c2NhbGwuaW5jLlPCoCDCoCB8IDUxICsrKysrKysrKy0tLS0tLTxicj4NCsKgY29t
bW9uLXVzZXIvaG9zdC9wcGM2NC9zYWZlLXN5c2NhbGwuaW5jLlPCoCDCoHwgNjMgKysrKysrKysr
KystLS0tLS0tLTxicj4NCsKgY29tbW9uLXVzZXIvaG9zdC9yaXNjdi9zYWZlLXN5c2NhbGwuaW5j
LlPCoCDCoHwgNTAgKysrKysrKysrLS0tLS0tPGJyPg0KwqBjb21tb24tdXNlci9ob3N0L3MzOTB4
L3NhZmUtc3lzY2FsbC5pbmMuU8KgIMKgfCA1MCArKysrKysrKystLS0tLS08YnI+DQrCoGNvbW1v
bi11c2VyL2hvc3QveDg2XzY0L3NhZmUtc3lzY2FsbC5pbmMuU8KgIHwgNzAgKysrKysrKysrKysr
LS0tLS0tLS0tPGJyPg0KwqA4IGZpbGVzIGNoYW5nZWQsIDI0MyBpbnNlcnRpb25zKCspLCAxNzQg
ZGVsZXRpb25zKC0pPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PlJldmlld2Vk
IGJ5OiBXYXJuZXIgTG9zaCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmltcEBic2RpbXAuY29tIj5pbXBA
YnNkaW1wLmNvbTwvYT4mZ3Q7PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BbmQgSSB0aGluayBp
dCBtYXkgZml4IGEgYnVnLCB3aGVuIGludGVncmF0ZWQgd2l0aCBic2QtdXNlciBmb3JrLDwvZGl2
PjxkaXY+aW4gUG93ZXJQQyBob3N0cyAodGhvdWdoIHRoZXJlJiMzOTtzIG90aGVyIGJ1Z3MgbGlu
Z2VyaW5nIHRoZXJlKS48L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBz
b2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KZGlmZiAtLWdpdCBhL2xp
bnV4LXVzZXIvc2FmZS1zeXNjYWxsLmggYi9saW51eC11c2VyL3NhZmUtc3lzY2FsbC5oPGJyPg0K
aW5kZXggYWFhOWZmYzBlMi4uZWEwZThhOGQyNCAxMDA2NDQ8YnI+DQotLS0gYS9saW51eC11c2Vy
L3NhZmUtc3lzY2FsbC5oPGJyPg0KKysrIGIvbGludXgtdXNlci9zYWZlLXN5c2NhbGwuaDxicj4N
CkBAIC0xMjUsMjMgKzEyNSwxNyBAQDxicj4NCsKgICoga2luZHMgb2YgcmVzdGFydGFiaWxpdHku
PGJyPg0KwqAgKi88YnI+DQrCoCNpZmRlZiBIQVZFX1NBRkVfU1lTQ0FMTDxicj4NCi0vKiBUaGUg
Y29yZSBwYXJ0IG9mIHRoaXMgZnVuY3Rpb24gaXMgaW1wbGVtZW50ZWQgaW4gYXNzZW1ibHkgKi88
YnI+DQotZXh0ZXJuIGxvbmcgc2FmZV9zeXNjYWxsX2Jhc2UoaW50ICpwZW5kaW5nLCBsb25nIG51
bWJlciwgLi4uKTs8YnI+DQorPGJyPg0KKy8qIFRoZSBjb3JlIHBhcnQgb2YgdGhpcyBmdW5jdGlv
biBpcyBpbXBsZW1lbnRlZCBpbiBhc3NlbWJseS4gKi88YnI+DQorZXh0ZXJuIGxvbmcgc2FmZV9z
eXNjYWxsX2Jhc2UoaW50ICpwZW5kaW5nLCBpbnQgKmVycm5vcCwgbG9uZyBudW1iZXIsIC4uLik7
PGJyPg0KKzxicj4NCsKgLyogVGhlc2UgYXJlIGRlZmluZWQgYnkgdGhlIHNhZmUtc3lzY2FsbC5p
bmMuUyBmaWxlICovPGJyPg0KwqBleHRlcm4gY2hhciBzYWZlX3N5c2NhbGxfc3RhcnRbXTs8YnI+
DQrCoGV4dGVybiBjaGFyIHNhZmVfc3lzY2FsbF9lbmRbXTs8YnI+DQo8YnI+DQotI2RlZmluZSBz
YWZlX3N5c2NhbGwoLi4uKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCi3CoCDCoCAoe8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQotwqAgwqAgwqAgwqAgbG9uZyBy
ZXRfO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQotwqAgwqAgwqAgwqAgaW50ICpwc3Bf
ID0gJmFtcDsoKFRhc2tTdGF0ZSAqKXRocmVhZF9jcHUtJmd0O29wYXF1ZSktJmd0O3NpZ25hbF9w
ZW5kaW5nOyBcPGJyPg0KLcKgIMKgIMKgIMKgIHJldF8gPSBzYWZlX3N5c2NhbGxfYmFzZShwc3Bf
LCBfX1ZBX0FSR1NfXyk7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCi3CoCDC
oCDCoCDCoCBpZiAoaXNfZXJyb3IocmV0XykpIHvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgZXJybm8gPSAtcmV0XzvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IHJldF8gPSAtMTvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KLcKgIMKgIMKgIMKgIH3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQotwqAgwqAgwqAgwqAgcmV0XzvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQotwqAgwqAgfSk8YnI+DQorI2Rl
ZmluZSBzYWZlX3N5c2NhbGwoLi4uKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDCoCBzYWZl
X3N5c2NhbGxfYmFzZSgmYW1wOygoVGFza1N0YXRlICopdGhyZWFkX2NwdS0mZ3Q7b3BhcXVlKS0m
Z3Q7c2lnbmFsX3BlbmRpbmcsIFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmFtcDtlcnJubywgX19WQV9BUkdTX18pPGJyPg0KPGJyPg0KwqAjZWxzZTxicj4NCjxicj4N
CmRpZmYgLS1naXQgYS9jb21tb24tdXNlci9ob3N0L2FhcmNoNjQvc2FmZS1zeXNjYWxsLmluYy5T
IGIvY29tbW9uLXVzZXIvaG9zdC9hYXJjaDY0L3NhZmUtc3lzY2FsbC5pbmMuUzxicj4NCmluZGV4
IGJjMWY1YTk3OTIuLjk1YzYwZDg2MDkgMTAwNjQ0PGJyPg0KLS0tIGEvY29tbW9uLXVzZXIvaG9z
dC9hYXJjaDY0L3NhZmUtc3lzY2FsbC5pbmMuUzxicj4NCisrKyBiL2NvbW1vbi11c2VyL2hvc3Qv
YWFyY2g2NC9zYWZlLXN5c2NhbGwuaW5jLlM8YnI+DQpAQCAtMTcsMjIgKzE3LDIxIEBAPGJyPg0K
wqAgwqAgwqAgwqAgLnR5cGXCoCDCoHNhZmVfc3lzY2FsbF9zdGFydCwgI2Z1bmN0aW9uPGJyPg0K
wqAgwqAgwqAgwqAgLnR5cGXCoCDCoHNhZmVfc3lzY2FsbF9lbmQsICNmdW5jdGlvbjxicj4NCjxi
cj4NCi3CoCDCoCDCoCDCoC8qIFRoaXMgaXMgdGhlIGVudHJ5IHBvaW50IGZvciBtYWtpbmcgYSBz
eXN0ZW0gY2FsbC4gVGhlIGNhbGxpbmc8YnI+DQorwqAgwqAgwqAgwqAvKjxicj4NCivCoCDCoCDC
oCDCoCAqIFRoaXMgaXMgdGhlIGVudHJ5IHBvaW50IGZvciBtYWtpbmcgYSBzeXN0ZW0gY2FsbC4g
VGhlIGNhbGxpbmc8YnI+DQrCoCDCoCDCoCDCoCDCoCogY29udmVudGlvbiBoZXJlIGlzIHRoYXQg
b2YgYSBDIHZhcmFyZ3MgZnVuY3Rpb24gd2l0aCB0aGU8YnI+DQrCoCDCoCDCoCDCoCDCoCogZmly
c3QgYXJndW1lbnQgYW4gJiMzOTtpbnQgKiYjMzk7IHRvIHRoZSBzaWduYWxfcGVuZGluZyBmbGFn
LCB0aGU8YnI+DQrCoCDCoCDCoCDCoCDCoCogc2Vjb25kIG9uZSB0aGUgc3lzdGVtIGNhbGwgbnVt
YmVyIChhcyBhICYjMzk7bG9uZyYjMzk7KSwgYW5kIGFsbCBmdXJ0aGVyPGJyPg0KwqAgwqAgwqAg
wqAgwqAqIGFyZ3VtZW50cyBiZWluZyBzeXNjYWxsIGFyZ3VtZW50cyAoYWxzbyAmIzM5O2xvbmcm
IzM5OykuPGJyPg0KLcKgIMKgIMKgIMKgICogV2UgcmV0dXJuIGEgbG9uZyB3aGljaCBpcyB0aGUg
c3lzY2FsbCYjMzk7cyByZXR1cm4gdmFsdWUsIHdoaWNoPGJyPg0KLcKgIMKgIMKgIMKgICogbWF5
IGJlIG5lZ2F0aXZlLWVycm5vIG9uIGZhaWx1cmUuIENvbnZlcnNpb24gdG8gdGhlPGJyPg0KLcKg
IMKgIMKgIMKgICogLTEtYW5kLWVycm5vLXNldCBjb252ZW50aW9uIGlzIGRvbmUgYnkgdGhlIGNh
bGxpbmcgd3JhcHBlci48YnI+DQrCoCDCoCDCoCDCoCDCoCovPGJyPg0KwqBzYWZlX3N5c2NhbGxf
YmFzZTo8YnI+DQrCoCDCoCDCoCDCoCAuY2ZpX3N0YXJ0cHJvYzxicj4NCi3CoCDCoCDCoCDCoC8q
IFRoZSBzeXNjYWxsIGNhbGxpbmcgY29udmVudGlvbiBpc24mIzM5O3QgdGhlIHNhbWUgYXMgdGhl
PGJyPg0KLcKgIMKgIMKgIMKgICogQyBvbmU6PGJyPg0KK8KgIMKgIMKgIMKgLyo8YnI+DQorwqAg
wqAgwqAgwqAgwqAqIFRoZSBzeXNjYWxsIGNhbGxpbmcgY29udmVudGlvbiBpc24mIzM5O3QgdGhl
IHNhbWUgYXMgdGhlIEMgb25lOjxicj4NCsKgIMKgIMKgIMKgIMKgKiB3ZSBlbnRlciB3aXRoIHgw
ID09ICpzaWduYWxfcGVuZGluZzxicj4NCi3CoCDCoCDCoCDCoCAqwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB4MSA9PSBzeXNjYWxsIG51bWJlcjxicj4NCi3CoCDCoCDCoCDCoCAqwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB4MiAuLi4geDcsIChzdGFjaykgPT0gc3lzY2FsbCBhcmd1bWVudHM8YnI+DQor
wqAgwqAgwqAgwqAgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgeDEgPT0gZXJybm88YnI+DQorwqAg
wqAgwqAgwqAgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgeDIgPT0gc3lzY2FsbCBudW1iZXI8YnI+
DQorwqAgwqAgwqAgwqAgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgeDMgLi4uIHg3LCAoc3RhY2sp
ID09IHN5c2NhbGwgYXJndW1lbnRzPGJyPg0KwqAgwqAgwqAgwqAgwqAqwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBhbmQgcmV0dXJuIHRoZSByZXN1bHQgaW4geDA8YnI+DQrCoCDCoCDCoCDCoCDCoCog
YW5kIHRoZSBzeXNjYWxsIGluc3RydWN0aW9uIG5lZWRzPGJyPg0KwqAgwqAgwqAgwqAgwqAqwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB4OCA9PSBzeXNjYWxsIG51bWJlcjxicj4NCkBAIC00MCwxNyAr
MzksMTggQEAgc2FmZV9zeXNjYWxsX2Jhc2U6PGJyPg0KwqAgwqAgwqAgwqAgwqAqwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBhbmQgcmV0dXJucyB0aGUgcmVzdWx0IGluIHgwPGJyPg0KwqAgwqAgwqAg
wqAgwqAqIFNodWZmbGUgZXZlcnl0aGluZyBhcm91bmQgYXBwcm9wcmlhdGVseS48YnI+DQrCoCDC
oCDCoCDCoCDCoCovPGJyPg0KLcKgIMKgIMKgIMKgbW92wqAgwqAgwqB4OSwgeDDCoCDCoCDCoCDC
oCDCoCAvKiBzaWduYWxfcGVuZGluZyBwb2ludGVyICovPGJyPg0KLcKgIMKgIMKgIMKgbW92wqAg
wqAgwqB4OCwgeDHCoCDCoCDCoCDCoCDCoCAvKiBzeXNjYWxsIG51bWJlciAqLzxicj4NCi3CoCDC
oCDCoCDCoG1vdsKgIMKgIMKgeDAsIHgywqAgwqAgwqAgwqAgwqAgLyogc3lzY2FsbCBhcmd1bWVu
dHMgKi88YnI+DQotwqAgwqAgwqAgwqBtb3bCoCDCoCDCoHgxLCB4Mzxicj4NCi3CoCDCoCDCoCDC
oG1vdsKgIMKgIMKgeDIsIHg0PGJyPg0KLcKgIMKgIMKgIMKgbW92wqAgwqAgwqB4MywgeDU8YnI+
DQotwqAgwqAgwqAgwqBtb3bCoCDCoCDCoHg0LCB4Njxicj4NCi3CoCDCoCDCoCDCoG1vdsKgIMKg
IMKgeDUsIHg3PGJyPg0KLcKgIMKgIMKgIMKgbGRywqAgwqAgwqB4NiwgW3NwXTxicj4NCivCoCDC
oCDCoCDCoG1vdsKgIMKgIMKgeDEwLCB4MMKgIMKgIMKgIMKgIMKgLyogc2lnbmFsX3BlbmRpbmcg
cG9pbnRlciAqLzxicj4NCivCoCDCoCDCoCDCoG1vdsKgIMKgIMKgeDExLCB4McKgIMKgIMKgIMKg
IMKgLyogZXJybm8gcG9pbnRlciAqLzxicj4NCivCoCDCoCDCoCDCoG1vdsKgIMKgIMKgeDgsIHgy
wqAgwqAgwqAgwqAgwqAgLyogc3lzY2FsbCBudW1iZXIgKi88YnI+DQorwqAgwqAgwqAgwqBtb3bC
oCDCoCDCoHgwLCB4M8KgIMKgIMKgIMKgIMKgIC8qIHN5c2NhbGwgYXJndW1lbnRzICovPGJyPg0K
K8KgIMKgIMKgIMKgbW92wqAgwqAgwqB4MSwgeDQ8YnI+DQorwqAgwqAgwqAgwqBtb3bCoCDCoCDC
oHgyLCB4NTxicj4NCivCoCDCoCDCoCDCoG1vdsKgIMKgIMKgeDMsIHg2PGJyPg0KK8KgIMKgIMKg
IMKgbW92wqAgwqAgwqB4NCwgeDc8YnI+DQorwqAgwqAgwqAgwqBsZHDCoCDCoCDCoHg1LCB4Niwg
W3NwXTxicj4NCjxicj4NCi3CoCDCoCDCoCDCoC8qIFRoaXMgbmV4dCBzZXF1ZW5jZSBvZiBjb2Rl
IHdvcmtzIGluIGNvbmp1bmN0aW9uIHdpdGggdGhlPGJyPg0KK8KgIMKgIMKgIMKgLyo8YnI+DQor
wqAgwqAgwqAgwqAgwqAqIFRoaXMgbmV4dCBzZXF1ZW5jZSBvZiBjb2RlIHdvcmtzIGluIGNvbmp1
bmN0aW9uIHdpdGggdGhlPGJyPg0KwqAgwqAgwqAgwqAgwqAqIHJld2luZF9pZl9zYWZlX3N5c2Nh
bGxfZnVuY3Rpb24oKS4gSWYgYSBzaWduYWwgaXMgdGFrZW48YnI+DQrCoCDCoCDCoCDCoCDCoCog
YW5kIHRoZSBpbnRlcnJ1cHRlZCBQQyBpcyBhbnl3aGVyZSBiZXR3ZWVuICYjMzk7c2FmZV9zeXNj
YWxsX3N0YXJ0JiMzOTs8YnI+DQrCoCDCoCDCoCDCoCDCoCogYW5kICYjMzk7c2FmZV9zeXNjYWxs
X2VuZCYjMzk7IHRoZW4gd2UgcmV3aW5kIGl0IHRvICYjMzk7c2FmZV9zeXNjYWxsX3N0YXJ0JiMz
OTsuPGJyPg0KQEAgLTU5LDE3ICs1OSwyNiBAQCBzYWZlX3N5c2NhbGxfYmFzZTo8YnI+DQrCoCDC
oCDCoCDCoCDCoCovPGJyPg0KwqBzYWZlX3N5c2NhbGxfc3RhcnQ6PGJyPg0KwqAgwqAgwqAgwqAg
LyogaWYgc2lnbmFsX3BlbmRpbmcgaXMgbm9uLXplcm8sIGRvbiYjMzk7dCBkbyB0aGUgY2FsbCAq
Lzxicj4NCi3CoCDCoCDCoCDCoGxkcsKgIMKgIMKgdzEwLCBbeDldPGJyPg0KLcKgIMKgIMKgIMKg
Y2JuesKgIMKgIHcxMCwgMGYgPGJyPg0KK8KgIMKgIMKgIMKgbGRywqAgwqAgwqB3OSwgW3gxMF08
YnI+DQorwqAgwqAgwqAgwqBjYm56wqAgwqAgdzksIDJmPGJyPg0KwqAgwqAgwqAgwqAgc3ZjwqAg
wqAgwqAweDA8YnI+DQrCoHNhZmVfc3lzY2FsbF9lbmQ6PGJyPg0KKzxicj4NCsKgIMKgIMKgIMKg
IC8qIGNvZGUgcGF0aCBmb3IgaGF2aW5nIHN1Y2Nlc3NmdWxseSBleGVjdXRlZCB0aGUgc3lzY2Fs
bCAqLzxicj4NCivCoCDCoCDCoCDCoGNtbsKgIMKgIMKgeDAsICM0MDk1PGJyPg0KK8KgIMKgIMKg
IMKgYi5jc8KgIMKgIDFmPGJyPg0KwqAgwqAgwqAgwqAgcmV0PGJyPg0KPGJyPg0KLTA6PGJyPg0K
LcKgIMKgIMKgIMKgLyogY29kZSBwYXRoIHdoZW4gd2UgZGlkbiYjMzk7dCBleGVjdXRlIHRoZSBz
eXNjYWxsICovPGJyPg0KLcKgIMKgIMKgIMKgbW92wqAgwqAgwqB4MCwgIy1UQVJHRVRfRVJFU1RB
UlRTWVM8YnI+DQorwqAgwqAgwqAgwqAvKiBjb2RlIHBhdGggc2V0dGluZyBlcnJubyAqLzxicj4N
CiswOsKgIMKgIMKgbmVnwqAgwqAgwqB3MCwgdzDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAv
KiBjcmVhdGUgcG9zaXRpdmUgZXJybm8gKi88YnI+DQorMTrCoCDCoCDCoHN0csKgIMKgIMKgdzAs
IFt4MTFdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBzdG9yZSBlcnJubyAqLzxicj4NCivCoCDC
oCDCoCDCoG1vdsKgIMKgIMKgeDAsICMtMTxicj4NCsKgIMKgIMKgIMKgIHJldDxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqAvKiBjb2RlIHBhdGggd2hlbiB3ZSBkaWRuJiMzOTt0IGV4ZWN1dGUgdGhl
IHN5c2NhbGwgKi88YnI+DQorMjrCoCDCoCDCoG1vdsKgIMKgIMKgdzAsICNUQVJHRVRfRVJFU1RB
UlRTWVM8YnI+DQorwqAgwqAgwqAgwqBiwqAgwqAgwqAgwqAxYjxicj4NCis8YnI+DQrCoCDCoCDC
oCDCoCAuY2ZpX2VuZHByb2M8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCAuc2l6ZcKgIMKgc2FmZV9z
eXNjYWxsX2Jhc2UsIC4tc2FmZV9zeXNjYWxsX2Jhc2U8YnI+DQpkaWZmIC0tZ2l0IGEvY29tbW9u
LXVzZXIvaG9zdC9hcm0vc2FmZS1zeXNjYWxsLmluYy5TIGIvY29tbW9uLXVzZXIvaG9zdC9hcm0v
c2FmZS1zeXNjYWxsLmluYy5TPGJyPg0KaW5kZXggODhjNDk1ODUwNC4uMTc4MzljNjQ4NiAxMDA2
NDQ8YnI+DQotLS0gYS9jb21tb24tdXNlci9ob3N0L2FybS9zYWZlLXN5c2NhbGwuaW5jLlM8YnI+
DQorKysgYi9jb21tb24tdXNlci9ob3N0L2FybS9zYWZlLXN5c2NhbGwuaW5jLlM8YnI+DQpAQCAt
MjIsMzMgKzIyLDM1IEBAPGJyPg0KwqAgwqAgwqAgwqAgLmFybTxicj4NCsKgIMKgIMKgIMKgIC5h
bGlnbiAyPGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgLyogVGhpcyBpcyB0aGUgZW50cnkgcG9pbnQg
Zm9yIG1ha2luZyBhIHN5c3RlbSBjYWxsLiBUaGUgY2FsbGluZzxicj4NCivCoCDCoCDCoCDCoC8q
PGJyPg0KK8KgIMKgIMKgIMKgICogVGhpcyBpcyB0aGUgZW50cnkgcG9pbnQgZm9yIG1ha2luZyBh
IHN5c3RlbSBjYWxsLiBUaGUgY2FsbGluZzxicj4NCsKgIMKgIMKgIMKgIMKgKiBjb252ZW50aW9u
IGhlcmUgaXMgdGhhdCBvZiBhIEMgdmFyYXJncyBmdW5jdGlvbiB3aXRoIHRoZTxicj4NCsKgIMKg
IMKgIMKgIMKgKiBmaXJzdCBhcmd1bWVudCBhbiAmIzM5O2ludCAqJiMzOTsgdG8gdGhlIHNpZ25h
bF9wZW5kaW5nIGZsYWcsIHRoZTxicj4NCsKgIMKgIMKgIMKgIMKgKiBzZWNvbmQgb25lIHRoZSBz
eXN0ZW0gY2FsbCBudW1iZXIgKGFzIGEgJiMzOTtsb25nJiMzOTspLCBhbmQgYWxsIGZ1cnRoZXI8
YnI+DQrCoCDCoCDCoCDCoCDCoCogYXJndW1lbnRzIGJlaW5nIHN5c2NhbGwgYXJndW1lbnRzIChh
bHNvICYjMzk7bG9uZyYjMzk7KS48YnI+DQotwqAgwqAgwqAgwqAgKiBXZSByZXR1cm4gYSBsb25n
IHdoaWNoIGlzIHRoZSBzeXNjYWxsJiMzOTtzIHJldHVybiB2YWx1ZSwgd2hpY2g8YnI+DQotwqAg
wqAgwqAgwqAgKiBtYXkgYmUgbmVnYXRpdmUtZXJybm8gb24gZmFpbHVyZS4gQ29udmVyc2lvbiB0
byB0aGU8YnI+DQotwqAgwqAgwqAgwqAgKiAtMS1hbmQtZXJybm8tc2V0IGNvbnZlbnRpb24gaXMg
ZG9uZSBieSB0aGUgY2FsbGluZyB3cmFwcGVyLjxicj4NCsKgIMKgIMKgIMKgIMKgKi88YnI+DQrC
oHNhZmVfc3lzY2FsbF9iYXNlOjxicj4NCsKgIMKgIMKgIMKgIC5mbnN0YXJ0PGJyPg0KwqAgwqAg
wqAgwqAgLmNmaV9zdGFydHByb2M8YnI+DQrCoCDCoCDCoCDCoCBtb3bCoCDCoCDCoHIxMiwgc3DC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIHNhdmUgZW50cnkgc3RhY2sgKi88YnI+DQotwqAg
wqAgwqAgwqBwdXNowqAgwqAgeyByNCwgcjUsIHI2LCByNywgcjgsIGxyIH08YnI+DQotwqAgwqAg
wqAgwqAuc2F2ZcKgIMKgeyByNCwgcjUsIHI2LCByNywgcjgsIGxyIH08YnI+DQotwqAgwqAgwqAg
wqAuY2ZpX2FkanVzdF9jZmFfb2Zmc2V0IDI0PGJyPg0KK8KgIMKgIMKgIMKgcHVzaMKgIMKgIHsg
cjQsIHI1LCByNiwgcjcsIHI4LCByOSwgcjEwLCBsciB9PGJyPg0KK8KgIMKgIMKgIMKgLnNhdmXC
oCDCoHsgcjQsIHI1LCByNiwgcjcsIHI4LCByOSwgcjEwLCBsciB9PGJyPg0KK8KgIMKgIMKgIMKg
LmNmaV9hZGp1c3RfY2ZhX29mZnNldCAzMjxicj4NCsKgIMKgIMKgIMKgIC5jZmlfcmVsX29mZnNl
dCByNCwgMDxicj4NCsKgIMKgIMKgIMKgIC5jZmlfcmVsX29mZnNldCByNSwgNDxicj4NCsKgIMKg
IMKgIMKgIC5jZmlfcmVsX29mZnNldCByNiwgODxicj4NCsKgIMKgIMKgIMKgIC5jZmlfcmVsX29m
ZnNldCByNywgMTI8YnI+DQrCoCDCoCDCoCDCoCAuY2ZpX3JlbF9vZmZzZXQgcjgsIDE2PGJyPg0K
LcKgIMKgIMKgIMKgLmNmaV9yZWxfb2Zmc2V0IGxyLCAyMDxicj4NCivCoCDCoCDCoCDCoC5jZmlf
cmVsX29mZnNldCByOSwgMjA8YnI+DQorwqAgwqAgwqAgwqAuY2ZpX3JlbF9vZmZzZXQgcjEwLCAy
NDxicj4NCivCoCDCoCDCoCDCoC5jZmlfcmVsX29mZnNldCBsciwgMjg8YnI+DQo8YnI+DQotwqAg
wqAgwqAgwqAvKiBUaGUgc3lzY2FsbCBjYWxsaW5nIGNvbnZlbnRpb24gaXNuJiMzOTt0IHRoZSBz
YW1lIGFzIHRoZSBDIG9uZTo8YnI+DQotwqAgwqAgwqAgwqAgKiB3ZSBlbnRlciB3aXRoIHIwID09
ICpzaWduYWxfcGVuZGluZzxicj4NCi3CoCDCoCDCoCDCoCAqwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByMSA9PSBzeXNjYWxsIG51bWJlcjxicj4NCi3CoCDCoCDCoCDCoCAqwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByMiwgcjMsIFtzcCswXSAuLi4gW3NwKzEyXSA9PSBzeXNjYWxsIGFyZ3VtZW50czxi
cj4NCivCoCDCoCDCoCDCoC8qPGJyPg0KK8KgIMKgIMKgIMKgICogVGhlIHN5c2NhbGwgY2FsbGlu
ZyBjb252ZW50aW9uIGlzbiYjMzk7dCB0aGUgc2FtZSBhcyB0aGUgQyBvbmU6PGJyPg0KK8KgIMKg
IMKgIMKgICogd2UgZW50ZXIgd2l0aCByMCA9PSAmYW1wO3NpZ25hbF9wZW5kaW5nPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcjEgPT0gJmFtcDtlcnJubzxicj4N
CivCoCDCoCDCoCDCoCAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByMiA9PSBzeXNjYWxsIG51bWJl
cjxicj4NCivCoCDCoCDCoCDCoCAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByMywgW3NwKzBdIC4u
LiBbc3ArMTZdID09IHN5c2NhbGwgYXJndW1lbnRzPGJyPg0KwqAgwqAgwqAgwqAgwqAqwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBhbmQgcmV0dXJuIHRoZSByZXN1bHQgaW4gcjA8YnI+DQrCoCDCoCDC
oCDCoCDCoCogYW5kIHRoZSBzeXNjYWxsIGluc3RydWN0aW9uIG5lZWRzPGJyPg0KwqAgwqAgwqAg
wqAgwqAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByNyA9PSBzeXNjYWxsIG51bWJlcjxicj4NCkBA
IC01OCwxMiArNjAsMTMgQEAgc2FmZV9zeXNjYWxsX2Jhc2U6PGJyPg0KwqAgwqAgwqAgwqAgwqAq
IE5vdGUgdGhlIDE2IGJ5dGVzIHRoYXQgd2UgcHVzaGVkIHRvIHNhdmUgcmVnaXN0ZXJzLjxicj4N
CsKgIMKgIMKgIMKgIMKgKi88YnI+DQrCoCDCoCDCoCDCoCBtb3bCoCDCoCDCoHI4LCByMMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIGNvcHkgc2lnbmFsX3BlbmRpbmcgKi88YnI+DQotwqAg
wqAgwqAgwqBtb3bCoCDCoCDCoHI3LCByMcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIHN5
c2NhbGwgbnVtYmVyICovPGJyPg0KLcKgIMKgIMKgIMKgbW92wqAgwqAgwqByMCwgcjLCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBzeXNjYWxsIGFyZ3MgKi88YnI+DQotwqAgwqAgwqAgwqBt
b3bCoCDCoCDCoHIxLCByMzxicj4NCi3CoCDCoCDCoCDCoGxkbcKgIMKgIMKgcjEyLCB7IHIyLCBy
MywgcjQsIHI1LCByNiB9PGJyPg0KK8KgIMKgIMKgIMKgbW92wqAgwqAgwqByOSwgcjHCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBjb3B5IGVycm5vcCAqLzxicj4NCivCoCDCoCDCoCDCoG1v
dsKgIMKgIMKgcjcsIHIywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogc3lzY2FsbCBudW1i
ZXIgKi88YnI+DQorwqAgwqAgwqAgwqBtb3bCoCDCoCDCoHIwLCByM8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIC8qIHN5c2NhbGwgYXJncyAqLzxicj4NCivCoCDCoCDCoCDCoGxkbcKgIMKgIMKg
cjEyLCB7IHIxLCByMiwgcjMsIHI0LCByNSwgcjYgfTxicj4NCjxicj4NCi3CoCDCoCDCoCDCoC8q
IFRoaXMgbmV4dCBzZXF1ZW5jZSBvZiBjb2RlIHdvcmtzIGluIGNvbmp1bmN0aW9uIHdpdGggdGhl
PGJyPg0KK8KgIMKgIMKgIMKgLyo8YnI+DQorwqAgwqAgwqAgwqAgKiBUaGlzIG5leHQgc2VxdWVu
Y2Ugb2YgY29kZSB3b3JrcyBpbiBjb25qdW5jdGlvbiB3aXRoIHRoZTxicj4NCsKgIMKgIMKgIMKg
IMKgKiByZXdpbmRfaWZfc2FmZV9zeXNjYWxsX2Z1bmN0aW9uKCkuIElmIGEgc2lnbmFsIGlzIHRh
a2VuPGJyPg0KwqAgwqAgwqAgwqAgwqAqIGFuZCB0aGUgaW50ZXJydXB0ZWQgUEMgaXMgYW55d2hl
cmUgYmV0d2VlbiAmIzM5O3NhZmVfc3lzY2FsbF9zdGFydCYjMzk7PGJyPg0KwqAgwqAgwqAgwqAg
wqAqIGFuZCAmIzM5O3NhZmVfc3lzY2FsbF9lbmQmIzM5OyB0aGVuIHdlIHJld2luZCBpdCB0byAm
IzM5O3NhZmVfc3lzY2FsbF9zdGFydCYjMzk7Ljxicj4NCkBAIC03NCwxNiArNzcsMjUgQEAgc2Fm
ZV9zeXNjYWxsX3N0YXJ0Ojxicj4NCsKgIMKgIMKgIMKgIC8qIGlmIHNpZ25hbF9wZW5kaW5nIGlz
IG5vbi16ZXJvLCBkb24mIzM5O3QgZG8gdGhlIGNhbGwgKi88YnI+DQrCoCDCoCDCoCDCoCBsZHLC
oCDCoCDCoHIxMiwgW3I4XcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogc2lnbmFsX3BlbmRpbmcg
Ki88YnI+DQrCoCDCoCDCoCDCoCB0c3TCoCDCoCDCoHIxMiwgcjEyPGJyPg0KLcKgIMKgIMKgIMKg
Ym5lwqAgwqAgwqAxZjxicj4NCivCoCDCoCDCoCDCoGJuZcKgIMKgIMKgMmY8YnI+DQrCoCDCoCDC
oCDCoCBzd2nCoCDCoCDCoDA8YnI+DQrCoHNhZmVfc3lzY2FsbF9lbmQ6PGJyPg0KLcKgIMKgIMKg
IMKgLyogY29kZSBwYXRoIGZvciBoYXZpbmcgc3VjY2Vzc2Z1bGx5IGV4ZWN1dGVkIHRoZSBzeXNj
YWxsICovPGJyPg0KLcKgIMKgIMKgIMKgcG9wwqAgwqAgwqB7IHI0LCByNSwgcjYsIHI3LCByOCwg
cGMgfTxicj4NCjxicj4NCi0xOjxicj4NCivCoCDCoCDCoCDCoC8qIGNvZGUgcGF0aCBmb3IgaGF2
aW5nIHN1Y2Nlc3NmdWxseSBleGVjdXRlZCB0aGUgc3lzY2FsbCAqLzxicj4NCivCoCDCoCDCoCDC
oGNtcMKgIMKgIMKgcjAsICMtNDA5Njxicj4NCivCoCDCoCDCoCDCoGJoacKgIMKgIMKgMGY8YnI+
DQorOTrCoCDCoCDCoHBvcMKgIMKgIMKgeyByNCwgcjUsIHI2LCByNywgcjgsIHI5LCByMTAsIHBj
IH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgLyogY29kZSBwYXRoIHNldHRpbmcgZXJybm8gKi88
YnI+DQorMDrCoCDCoCDCoG5lZ8KgIMKgIMKgcjAsIHIwwqAgwqAgwqAgwqAgwqAgLyogY3JlYXRl
IHBvc2l0aXZlIGVycm5vICovPGJyPg0KKzE6wqAgwqAgwqBzdHLCoCDCoCDCoHIwLCBbcjldwqAg
wqAgwqAgwqAgLyogc3RvcmUgZXJybm8gKi88YnI+DQorwqAgwqAgwqAgwqBtb3bCoCDCoCDCoHIw
LCAjLTE8YnI+DQorwqAgwqAgwqAgwqBiwqAgwqAgwqAgwqA5Yjxicj4NCis8YnI+DQrCoCDCoCDC
oCDCoCAvKiBjb2RlIHBhdGggd2hlbiB3ZSBkaWRuJiMzOTt0IGV4ZWN1dGUgdGhlIHN5c2NhbGwg
Ki88YnI+DQotwqAgwqAgwqAgwqBsZHLCoCDCoCDCoHIwLCA9LVRBUkdFVF9FUkVTVEFSVFNZUzxi
cj4NCi3CoCDCoCDCoCDCoHBvcMKgIMKgIMKgeyByNCwgcjUsIHI2LCByNywgcjgsIHBjIH08YnI+
DQorMjrCoCDCoCDCoGxkcsKgIMKgIMKgcjAsID1UQVJHRVRfRVJFU1RBUlRTWVM8YnI+DQorwqAg
wqAgwqAgwqBiwqAgwqAgwqAgwqAxYjxicj4NCis8YnI+DQrCoCDCoCDCoCDCoCAuZm5lbmQ8YnI+
DQrCoCDCoCDCoCDCoCAuY2ZpX2VuZHByb2M8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvY29tbW9u
LXVzZXIvaG9zdC9pMzg2L3NhZmUtc3lzY2FsbC5pbmMuUyBiL2NvbW1vbi11c2VyL2hvc3QvaTM4
Ni9zYWZlLXN5c2NhbGwuaW5jLlM8YnI+DQppbmRleCA5ZTU4ZmM2NTA0Li5hZDg5NTIxNzgzIDEw
MDY0NDxicj4NCi0tLSBhL2NvbW1vbi11c2VyL2hvc3QvaTM4Ni9zYWZlLXN5c2NhbGwuaW5jLlM8
YnI+DQorKysgYi9jb21tb24tdXNlci9ob3N0L2kzODYvc2FmZS1zeXNjYWxsLmluYy5TPGJyPg0K
QEAgLTE1LDE0ICsxNSwxMiBAQDxicj4NCsKgIMKgIMKgIMKgIC5nbG9iYWwgc2FmZV9zeXNjYWxs
X2VuZDxicj4NCsKgIMKgIMKgIMKgIC50eXBlwqAgwqBzYWZlX3N5c2NhbGxfYmFzZSwgQGZ1bmN0
aW9uPGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgLyogVGhpcyBpcyB0aGUgZW50cnkgcG9pbnQgZm9y
IG1ha2luZyBhIHN5c3RlbSBjYWxsLiBUaGUgY2FsbGluZzxicj4NCivCoCDCoCDCoCDCoC8qPGJy
Pg0KK8KgIMKgIMKgIMKgICogVGhpcyBpcyB0aGUgZW50cnkgcG9pbnQgZm9yIG1ha2luZyBhIHN5
c3RlbSBjYWxsLiBUaGUgY2FsbGluZzxicj4NCsKgIMKgIMKgIMKgIMKgKiBjb252ZW50aW9uIGhl
cmUgaXMgdGhhdCBvZiBhIEMgdmFyYXJncyBmdW5jdGlvbiB3aXRoIHRoZTxicj4NCsKgIMKgIMKg
IMKgIMKgKiBmaXJzdCBhcmd1bWVudCBhbiAmIzM5O2ludCAqJiMzOTsgdG8gdGhlIHNpZ25hbF9w
ZW5kaW5nIGZsYWcsIHRoZTxicj4NCsKgIMKgIMKgIMKgIMKgKiBzZWNvbmQgb25lIHRoZSBzeXN0
ZW0gY2FsbCBudW1iZXIgKGFzIGEgJiMzOTtsb25nJiMzOTspLCBhbmQgYWxsIGZ1cnRoZXI8YnI+
DQrCoCDCoCDCoCDCoCDCoCogYXJndW1lbnRzIGJlaW5nIHN5c2NhbGwgYXJndW1lbnRzIChhbHNv
ICYjMzk7bG9uZyYjMzk7KS48YnI+DQotwqAgwqAgwqAgwqAgKiBXZSByZXR1cm4gYSBsb25nIHdo
aWNoIGlzIHRoZSBzeXNjYWxsJiMzOTtzIHJldHVybiB2YWx1ZSwgd2hpY2g8YnI+DQotwqAgwqAg
wqAgwqAgKiBtYXkgYmUgbmVnYXRpdmUtZXJybm8gb24gZmFpbHVyZS4gQ29udmVyc2lvbiB0byB0
aGU8YnI+DQotwqAgwqAgwqAgwqAgKiAtMS1hbmQtZXJybm8tc2V0IGNvbnZlbnRpb24gaXMgZG9u
ZSBieSB0aGUgY2FsbGluZyB3cmFwcGVyLjxicj4NCsKgIMKgIMKgIMKgIMKgKi88YnI+DQrCoHNh
ZmVfc3lzY2FsbF9iYXNlOjxicj4NCsKgIMKgIMKgIMKgIC5jZmlfc3RhcnRwcm9jPGJyPg0KQEAg
LTQxLDkgKzM5LDEwIEBAIHNhZmVfc3lzY2FsbF9iYXNlOjxicj4NCjxicj4NCsKgIMKgIMKgIMKg
IC8qIFRoZSBzeXNjYWxsIGNhbGxpbmcgY29udmVudGlvbiBpc24mIzM5O3QgdGhlIHNhbWUgYXMg
dGhlIEMgb25lOjxicj4NCsKgIMKgIMKgIMKgIMKgKiB3ZSBlbnRlciB3aXRoIDAoJWVzcCkgPT0g
cmV0dXJuIGFkZHJlc3M8YnI+DQotwqAgwqAgwqAgwqAgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
NCglZXNwKSA9PSAqc2lnbmFsX3BlbmRpbmc8YnI+DQotwqAgwqAgwqAgwqAgKsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgOCglZXNwKSA9PSBzeXNjYWxsIG51bWJlcjxicj4NCi3CoCDCoCDCoCDCoCAq
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAxMiglZXNwKSAuLi4gMzIoJWVzcCkgPT0gc3lzY2FsbCBh
cmd1bWVudHM8YnI+DQorwqAgwqAgwqAgwqAgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgNCglZXNw
KSA9PSAmYW1wO3NpZ25hbF9wZW5kaW5nPGJyPg0KK8KgIMKgIMKgIMKgICrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDgoJWVzcCkgPT0gJmFtcDtlcnJubzxicj4NCivCoCDCoCDCoCDCoCAqwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAxMiglZXNwKSA9PSBzeXNjYWxsIG51bWJlcjxicj4NCivCoCDCoCDC
oCDCoCAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAxNiglZXNwKSAuLi4gMzYoJWVzcCkgPT0gc3lz
Y2FsbCBhcmd1bWVudHM8YnI+DQrCoCDCoCDCoCDCoCDCoCrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGFuZCByZXR1cm4gdGhlIHJlc3VsdCBpbiBlYXg8YnI+DQrCoCDCoCDCoCDCoCDCoCogYW5kIHRo
ZSBzeXNjYWxsIGluc3RydWN0aW9uIG5lZWRzPGJyPg0KwqAgwqAgwqAgwqAgwqAqwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBlYXggPT0gc3lzY2FsbCBudW1iZXI8YnI+DQpAQCAtNTIsMTQgKzUxLDE1
IEBAIHNhZmVfc3lzY2FsbF9iYXNlOjxicj4NCsKgIMKgIMKgIMKgIMKgKiBTaHVmZmxlIGV2ZXJ5
dGhpbmcgYXJvdW5kIGFwcHJvcHJpYXRlbHkuPGJyPg0KwqAgwqAgwqAgwqAgwqAqIE5vdGUgdGhl
IDE2IGJ5dGVzIHRoYXQgd2UgcHVzaGVkIHRvIHNhdmUgcmVnaXN0ZXJzLjxicj4NCsKgIMKgIMKg
IMKgIMKgKi88YnI+DQotwqAgwqAgwqAgwqBtb3bCoCDCoCDCoDEyKzE2KCVlc3ApLCAlZWJ4wqAg
wqAgwqAgwqAvKiB0aGUgc3lzY2FsbCBhcmd1bWVudHMgKi88YnI+DQotwqAgwqAgwqAgwqBtb3bC
oCDCoCDCoDE2KzE2KCVlc3ApLCAlZWN4PGJyPg0KLcKgIMKgIMKgIMKgbW92wqAgwqAgwqAyMCsx
NiglZXNwKSwgJWVkeDxicj4NCi3CoCDCoCDCoCDCoG1vdsKgIMKgIMKgMjQrMTYoJWVzcCksICVl
c2k8YnI+DQotwqAgwqAgwqAgwqBtb3bCoCDCoCDCoDI4KzE2KCVlc3ApLCAlZWRpPGJyPg0KLcKg
IMKgIMKgIMKgbW92wqAgwqAgwqAzMisxNiglZXNwKSwgJWVicDxicj4NCivCoCDCoCDCoCDCoG1v
dsKgIMKgIMKgMTYrMTYoJWVzcCksICVlYnjCoCDCoCDCoCDCoC8qIHRoZSBzeXNjYWxsIGFyZ3Vt
ZW50cyAqLzxicj4NCivCoCDCoCDCoCDCoG1vdsKgIMKgIMKgMjArMTYoJWVzcCksICVlY3g8YnI+
DQorwqAgwqAgwqAgwqBtb3bCoCDCoCDCoDI0KzE2KCVlc3ApLCAlZWR4PGJyPg0KK8KgIMKgIMKg
IMKgbW92wqAgwqAgwqAyOCsxNiglZXNwKSwgJWVzaTxicj4NCivCoCDCoCDCoCDCoG1vdsKgIMKg
IMKgMzIrMTYoJWVzcCksICVlZGk8YnI+DQorwqAgwqAgwqAgwqBtb3bCoCDCoCDCoDM2KzE2KCVl
c3ApLCAlZWJwPGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgLyogVGhpcyBuZXh0IHNlcXVlbmNlIG9m
IGNvZGUgd29ya3MgaW4gY29uanVuY3Rpb24gd2l0aCB0aGU8YnI+DQorwqAgwqAgwqAgwqAvKjxi
cj4NCivCoCDCoCDCoCDCoCAqIFRoaXMgbmV4dCBzZXF1ZW5jZSBvZiBjb2RlIHdvcmtzIGluIGNv
bmp1bmN0aW9uIHdpdGggdGhlPGJyPg0KwqAgwqAgwqAgwqAgwqAqIHJld2luZF9pZl9zYWZlX3N5
c2NhbGxfZnVuY3Rpb24oKS4gSWYgYSBzaWduYWwgaXMgdGFrZW48YnI+DQrCoCDCoCDCoCDCoCDC
oCogYW5kIHRoZSBpbnRlcnJ1cHRlZCBQQyBpcyBhbnl3aGVyZSBiZXR3ZWVuICYjMzk7c2FmZV9z
eXNjYWxsX3N0YXJ0JiMzOTs8YnI+DQrCoCDCoCDCoCDCoCDCoCogYW5kICYjMzk7c2FmZV9zeXNj
YWxsX2VuZCYjMzk7IHRoZW4gd2UgcmV3aW5kIGl0IHRvICYjMzk7c2FmZV9zeXNjYWxsX3N0YXJ0
JiMzOTsuPGJyPg0KQEAgLTcwLDEyICs3MCwxNiBAQCBzYWZlX3N5c2NhbGxfc3RhcnQ6PGJyPg0K
wqAgwqAgwqAgwqAgLyogaWYgc2lnbmFsX3BlbmRpbmcgaXMgbm9uLXplcm8sIGRvbiYjMzk7dCBk
byB0aGUgY2FsbCAqLzxicj4NCsKgIMKgIMKgIMKgIG1vdsKgIMKgIMKgNCsxNiglZXNwKSwgJWVh
eMKgIMKgIMKgIMKgIC8qIHNpZ25hbF9wZW5kaW5nICovPGJyPg0KwqAgwqAgwqAgwqAgY21wbMKg
IMKgICQwLCAoJWVheCk8YnI+DQotwqAgwqAgwqAgwqBqbnrCoCDCoCDCoDFmPGJyPg0KK8KgIMKg
IMKgIMKgam56wqAgwqAgwqAyZjxicj4NCsKgIMKgIMKgIMKgIG1vdsKgIMKgIMKgOCsxNiglZXNw
KSwgJWVheMKgIMKgIMKgIMKgIC8qIHN5c2NhbGwgbnVtYmVyICovPGJyPg0KwqAgwqAgwqAgwqAg
aW50wqAgwqAgwqAkMHg4MDxicj4NCsKgc2FmZV9zeXNjYWxsX2VuZDo8YnI+DQorPGJyPg0KwqAg
wqAgwqAgwqAgLyogY29kZSBwYXRoIGZvciBoYXZpbmcgc3VjY2Vzc2Z1bGx5IGV4ZWN1dGVkIHRo
ZSBzeXNjYWxsICovPGJyPg0KLcKgIMKgIMKgIMKgcG9wwqAgwqAgwqAlZWJ4PGJyPg0KK8KgIMKg
IMKgIMKgY21wwqAgwqAgwqAkLTQwOTUsICVlYXg8YnI+DQorwqAgwqAgwqAgwqBqYWXCoCDCoCDC
oDBmPGJyPg0KKzxicj4NCis5OsKgIMKgIMKgcG9wwqAgwqAgwqAlZWJ4PGJyPg0KwqAgwqAgwqAg
wqAgLmNmaV9yZW1lbWJlcl9zdGF0ZTxicj4NCsKgIMKgIMKgIMKgIC5jZmlfYWRqdXN0X2NmYV9v
ZmZzZXQgLTQ8YnI+DQrCoCDCoCDCoCDCoCAuY2ZpX3Jlc3RvcmUgZWJ4PGJyPg0KQEAgLTkwLDEx
ICs5NCwxOCBAQCBzYWZlX3N5c2NhbGxfZW5kOjxicj4NCsKgIMKgIMKgIMKgIC5jZmlfcmVzdG9y
ZSBlYnA8YnI+DQrCoCDCoCDCoCDCoCByZXQ8YnI+DQo8YnI+DQotMTo8YnI+DQotwqAgwqAgwqAg
wqAvKiBjb2RlIHBhdGggd2hlbiB3ZSBkaWRuJiMzOTt0IGV4ZWN1dGUgdGhlIHN5c2NhbGwgKi88
YnI+DQrCoCDCoCDCoCDCoCAuY2ZpX3Jlc3RvcmVfc3RhdGU8YnI+DQotwqAgwqAgwqAgwqBtb3bC
oCDCoCDCoCQtVEFSR0VUX0VSRVNUQVJUU1lTLCAlZWF4PGJyPg0KLcKgIMKgIMKgIMKgam1wwqAg
wqAgwqBzYWZlX3N5c2NhbGxfZW5kPGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC8qIGNvZGUgcGF0
aCBzZXR0aW5nIGVycm5vICovPGJyPg0KKzA6wqAgwqAgwqBuZWfCoCDCoCDCoCVlYXjCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBjcmVhdGUgcG9zaXRpdmUgZXJybm8gKi88YnI+DQor
MTrCoCDCoCDCoG1vdsKgIMKgIMKgOCsxNiglZXNwKSwgJWVieMKgIMKgIMKgIMKgIC8qIGxvYWQg
ZXJybm8gcG9pbnRlciAqLzxicj4NCivCoCDCoCDCoCDCoG1vdsKgIMKgIMKgJWVheCwgKCVlYngp
wqAgwqAgwqAgwqAgwqAgwqAgLyogc3RvcmUgZXJybm8gKi88YnI+DQorwqAgwqAgwqAgwqBtb3bC
oCDCoCDCoCQtMSwgJWVheDxicj4NCivCoCDCoCDCoCDCoGptcMKgIMKgIMKgOWI8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgLyogY29kZSBwYXRoIHdoZW4gd2UgZGlkbiYjMzk7dCBleGVjdXRlIHRo
ZSBzeXNjYWxsICovPGJyPg0KKzI6wqAgwqAgwqBtb3bCoCDCoCDCoCRUQVJHRVRfRVJFU1RBUlRT
WVMsICVlYXg8YnI+DQorwqAgwqAgwqAgwqBqbXDCoCDCoCDCoDFiPGJyPg0KwqAgwqAgwqAgwqAg
LmNmaV9lbmRwcm9jPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLnNpemXCoCDCoHNhZmVfc3lzY2Fs
bF9iYXNlLCAuLXNhZmVfc3lzY2FsbF9iYXNlPGJyPg0KZGlmZiAtLWdpdCBhL2NvbW1vbi11c2Vy
L2hvc3QvcHBjNjQvc2FmZS1zeXNjYWxsLmluYy5TIGIvY29tbW9uLXVzZXIvaG9zdC9wcGM2NC9z
YWZlLXN5c2NhbGwuaW5jLlM8YnI+DQppbmRleCA4NzUxMzMxNzNiLi5lMzU0MDhjNWZiIDEwMDY0
NDxicj4NCi0tLSBhL2NvbW1vbi11c2VyL2hvc3QvcHBjNjQvc2FmZS1zeXNjYWxsLmluYy5TPGJy
Pg0KKysrIGIvY29tbW9uLXVzZXIvaG9zdC9wcGM2NC9zYWZlLXN5c2NhbGwuaW5jLlM8YnI+DQpA
QCAtMTcsMTQgKzE3LDE5IEBAPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLnRleHQ8YnI+DQo8YnI+
DQotwqAgwqAgwqAgwqAvKiBUaGlzIGlzIHRoZSBlbnRyeSBwb2ludCBmb3IgbWFraW5nIGEgc3lz
dGVtIGNhbGwuIFRoZSBjYWxsaW5nPGJyPg0KKyNpZiBfQ0FMTF9FTEYgPT0gMjxicj4NCisjZGVm
aW5lIFBBUkFNX09GU8KgIMKgMzI8YnI+DQorI2Vsc2U8YnI+DQorI2RlZmluZSBQQVJBTV9PRlPC
oCDCoDQ4PGJyPg0KKyNlbmRpZjxicj4NCisjZGVmaW5lIFBBUkFNKFgpwqAgwqAgUEFSQU1fT0ZT
ICsgWCo4PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC8qPGJyPg0KK8KgIMKgIMKgIMKgICogVGhp
cyBpcyB0aGUgZW50cnkgcG9pbnQgZm9yIG1ha2luZyBhIHN5c3RlbSBjYWxsLiBUaGUgY2FsbGlu
Zzxicj4NCsKgIMKgIMKgIMKgIMKgKiBjb252ZW50aW9uIGhlcmUgaXMgdGhhdCBvZiBhIEMgdmFy
YXJncyBmdW5jdGlvbiB3aXRoIHRoZTxicj4NCsKgIMKgIMKgIMKgIMKgKiBmaXJzdCBhcmd1bWVu
dCBhbiAmIzM5O2ludCAqJiMzOTsgdG8gdGhlIHNpZ25hbF9wZW5kaW5nIGZsYWcsIHRoZTxicj4N
CsKgIMKgIMKgIMKgIMKgKiBzZWNvbmQgb25lIHRoZSBzeXN0ZW0gY2FsbCBudW1iZXIgKGFzIGEg
JiMzOTtsb25nJiMzOTspLCBhbmQgYWxsIGZ1cnRoZXI8YnI+DQrCoCDCoCDCoCDCoCDCoCogYXJn
dW1lbnRzIGJlaW5nIHN5c2NhbGwgYXJndW1lbnRzIChhbHNvICYjMzk7bG9uZyYjMzk7KS48YnI+
DQotwqAgwqAgwqAgwqAgKiBXZSByZXR1cm4gYSBsb25nIHdoaWNoIGlzIHRoZSBzeXNjYWxsJiMz
OTtzIHJldHVybiB2YWx1ZSwgd2hpY2g8YnI+DQotwqAgwqAgwqAgwqAgKiBtYXkgYmUgbmVnYXRp
dmUtZXJybm8gb24gZmFpbHVyZS4gQ29udmVyc2lvbiB0byB0aGU8YnI+DQotwqAgwqAgwqAgwqAg
KiAtMS1hbmQtZXJybm8tc2V0IGNvbnZlbnRpb24gaXMgZG9uZSBieSB0aGUgY2FsbGluZyB3cmFw
cGVyLjxicj4NCsKgIMKgIMKgIMKgIMKgKi88YnI+DQrCoCNpZiBfQ0FMTF9FTEYgPT0gMjxicj4N
CsKgc2FmZV9zeXNjYWxsX2Jhc2U6PGJyPg0KQEAgLTM5LDkgKzQ0LDExIEBAIHNhZmVfc3lzY2Fs
bF9iYXNlOjxicj4NCsKgLkwuc2FmZV9zeXNjYWxsX2Jhc2U6PGJyPg0KwqAgwqAgwqAgwqAgLmNm
aV9zdGFydHByb2M8YnI+DQrCoCNlbmRpZjxicj4NCi3CoCDCoCDCoCDCoC8qIFdlIGVudGVyIHdp
dGggcjMgPT0gKnNpZ25hbF9wZW5kaW5nPGJyPg0KLcKgIMKgIMKgIMKgICrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHI0ID09IHN5c2NhbGwgbnVtYmVyPGJyPg0KLcKgIMKgIMKgIMKgICrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHI1IC4uLiByMTAgPT0gc3lzY2FsbCBhcmd1bWVudHM8YnI+DQorwqAg
wqAgwqAgwqAvKjxicj4NCivCoCDCoCDCoCDCoCAqIFdlIGVudGVyIHdpdGggcjMgPT0gJmFtcDtz
aWduYWxfcGVuZGluZzxicj4NCivCoCDCoCDCoCDCoCAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
NCA9PSAmYW1wO2Vycm5vPGJyPg0KK8KgIMKgIMKgIMKgICrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHI1ID09IHN5c2NhbGwgbnVtYmVyPGJyPg0KK8KgIMKgIMKgIMKgICrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHI2IC4uLiByMTAsIChzdGFjaykgPT0gc3lzY2FsbCBhcmd1bWVudHM8YnI+DQrCoCDC
oCDCoCDCoCDCoCrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFuZCByZXR1cm4gdGhlIHJlc3VsdCBp
biByMzxicj4NCsKgIMKgIMKgIMKgIMKgKiBhbmQgdGhlIHN5c2NhbGwgaW5zdHJ1Y3Rpb24gbmVl
ZHM8YnI+DQrCoCDCoCDCoCDCoCDCoCrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHIwID09IHN5c2Nh
bGwgbnVtYmVyPGJyPg0KQEAgLTQ5LDE4ICs1NiwxOCBAQCBzYWZlX3N5c2NhbGxfYmFzZTo8YnI+
DQrCoCDCoCDCoCDCoCDCoCrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFuZCByZXR1cm5zIHRoZSBy
ZXN1bHQgaW4gcjM8YnI+DQrCoCDCoCDCoCDCoCDCoCogU2h1ZmZsZSBldmVyeXRoaW5nIGFyb3Vu
ZCBhcHByb3ByaWF0ZWx5Ljxicj4NCsKgIMKgIMKgIMKgIMKgKi88YnI+DQotwqAgwqAgwqAgwqBz
dGTCoCDCoCDCoDE0LCAxNigxKSAvKiBQcmVzZXJ2ZSByMTQgaW4gU1ArMTYgKi88YnI+DQotwqAg
wqAgwqAgwqAuY2ZpX29mZnNldCAxNCwgMTY8YnI+DQotwqAgwqAgwqAgwqBtcsKgIMKgIMKgIDE0
LCAzwqAgwqAvKiBzaWduYWxfcGVuZGluZyAqLzxicj4NCi3CoCDCoCDCoCDCoG1ywqAgwqAgwqAg
MCwgNMKgIMKgIC8qIHN5c2NhbGwgbnVtYmVyICovPGJyPg0KLcKgIMKgIMKgIMKgbXLCoCDCoCDC
oCAzLCA1wqAgwqAgLyogc3lzY2FsbCBhcmd1bWVudHMgKi88YnI+DQotwqAgwqAgwqAgwqBtcsKg
IMKgIMKgIDQsIDY8YnI+DQotwqAgwqAgwqAgwqBtcsKgIMKgIMKgIDUsIDc8YnI+DQotwqAgwqAg
wqAgwqBtcsKgIMKgIMKgIDYsIDg8YnI+DQotwqAgwqAgwqAgwqBtcsKgIMKgIMKgIDcsIDk8YnI+
DQotwqAgwqAgwqAgwqBtcsKgIMKgIMKgIDgsIDEwPGJyPg0KK8KgIMKgIMKgIMKgbXLCoCDCoCDC
oCAxMSwgM8KgIMKgIMKgIMKgIMKgIMKgLyogc2lnbmFsX3BlbmRpbmcgcG9pbnRlciAqLzxicj4N
CivCoCDCoCDCoCDCoHN0ZMKgIMKgIMKgNCwgUEFSQU0oMSkoMSnCoCAvKiBzYXZlIGVycm5vIHBv
aW50ZXIgaW4gcGFyYW0gc2xvdCAqLzxicj4NCivCoCDCoCDCoCDCoG1ywqAgwqAgwqAgMCwgNcKg
IMKgIMKgIMKgIMKgIMKgIC8qIHN5c2NhbGwgbnVtYmVyICovPGJyPg0KK8KgIMKgIMKgIMKgbXLC
oCDCoCDCoCAzLCA2wqAgwqAgwqAgwqAgwqAgwqAgLyogc3lzY2FsbCBhcmd1bWVudHMgKi88YnI+
DQorwqAgwqAgwqAgwqBtcsKgIMKgIMKgIDQsIDc8YnI+DQorwqAgwqAgwqAgwqBtcsKgIMKgIMKg
IDUsIDg8YnI+DQorwqAgwqAgwqAgwqBtcsKgIMKgIMKgIDYsIDk8YnI+DQorwqAgwqAgwqAgwqBt
csKgIMKgIMKgIDcsIDEwPGJyPg0KK8KgIMKgIMKgIMKgbGTCoCDCoCDCoCA4LCBQQVJBTSg4KSgx
KTxicj4NCjxicj4NCi3CoCDCoCDCoCDCoC8qIFRoaXMgbmV4dCBzZXF1ZW5jZSBvZiBjb2RlIHdv
cmtzIGluIGNvbmp1bmN0aW9uIHdpdGggdGhlPGJyPg0KK8KgIMKgIMKgIMKgLyo8YnI+DQorwqAg
wqAgwqAgwqAgKiBUaGlzIG5leHQgc2VxdWVuY2Ugb2YgY29kZSB3b3JrcyBpbiBjb25qdW5jdGlv
biB3aXRoIHRoZTxicj4NCsKgIMKgIMKgIMKgIMKgKiByZXdpbmRfaWZfc2FmZV9zeXNjYWxsX2Z1
bmN0aW9uKCkuIElmIGEgc2lnbmFsIGlzIHRha2VuPGJyPg0KwqAgwqAgwqAgwqAgwqAqIGFuZCB0
aGUgaW50ZXJydXB0ZWQgUEMgaXMgYW55d2hlcmUgYmV0d2VlbiAmIzM5O3NhZmVfc3lzY2FsbF9z
dGFydCYjMzk7PGJyPg0KwqAgwqAgwqAgwqAgwqAqIGFuZCAmIzM5O3NhZmVfc3lzY2FsbF9lbmQm
IzM5OyB0aGVuIHdlIHJld2luZCBpdCB0byAmIzM5O3NhZmVfc3lzY2FsbF9zdGFydCYjMzk7Ljxi
cj4NCkBAIC02OSwyMyArNzYsMjUgQEAgc2FmZV9zeXNjYWxsX2Jhc2U6PGJyPg0KwqAgwqAgwqAg
wqAgwqAqLzxicj4NCsKgc2FmZV9zeXNjYWxsX3N0YXJ0Ojxicj4NCsKgIMKgIMKgIMKgIC8qIGlm
IHNpZ25hbF9wZW5kaW5nIGlzIG5vbi16ZXJvLCBkb24mIzM5O3QgZG8gdGhlIGNhbGwgKi88YnI+
DQotwqAgwqAgwqAgwqBsd3rCoCDCoCDCoDEyLCAwKDE0KTxicj4NCivCoCDCoCDCoCDCoGx3esKg
IMKgIMKgMTIsIDAoMTEpPGJyPg0KwqAgwqAgwqAgwqAgY21wd2nCoCDCoDAsIDEyLCAwPGJyPg0K
wqAgwqAgwqAgwqAgYm5lLcKgIMKgIDBmPGJyPg0KwqAgwqAgwqAgwqAgc2M8YnI+DQrCoHNhZmVf
c3lzY2FsbF9lbmQ6PGJyPg0KLcKgIMKgIMKgIMKgLyogY29kZSBwYXRoIHdoZW4gd2UgZGlkIGV4
ZWN1dGUgdGhlIHN5c2NhbGwgKi88YnI+DQotwqAgwqAgwqAgwqBsZCAxNCwgMTYoMSkgLyogcmVz
dG9yZSByMTQgdG8gaXRzIG9yaWdpbmFsIHZhbHVlICovPGJyPg0KLcKgIMKgIMKgIMKgYm5zbHIr
PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgLyogc3lzY2FsbCBmYWlsZWQ7IHJldHVybiBuZWdhdGl2
ZSBlcnJubyAqLzxicj4NCi3CoCDCoCDCoCDCoG5lZ8KgIMKgIMKgMywgMzxicj4NCivCoCDCoCDC
oCDCoC8qIGNvZGUgcGF0aCBmb3IgaGF2aW5nIHN1Y2Nlc3NmdWxseSBleGVjdXRlZCB0aGUgc3lz
Y2FsbCAqLzxicj4NCivCoCDCoCDCoCDCoGJuc2xyK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC8qIFNPIHNldCBmb3Igc3lzY2FsbCBlcnJvciAqLzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAv
KiBjb2RlIHBhdGggc2V0dGluZyBlcnJubyAqLzxicj4NCisxOsKgIMKgIMKgbGTCoCDCoCDCoCAx
MSwgUEFSQU0oMSkoMSkgLyogcmVzdG9yZSBlcnJubyBwb2ludGVyICovPGJyPg0KK8KgIMKgIMKg
IMKgc3R3wqAgwqAgwqAzLCAwKDExKcKgIMKgIMKgIMKgIC8qIHN0b3JlIGVycm5vICovPGJyPg0K
K8KgIMKgIMKgIMKgbGnCoCDCoCDCoCAzLCAtMTxicj4NCsKgIMKgIMKgIMKgIGJscjxicj4NCjxi
cj4NCsKgIMKgIMKgIMKgIC8qIGNvZGUgcGF0aCB3aGVuIHdlIGRpZG4mIzM5O3QgZXhlY3V0ZSB0
aGUgc3lzY2FsbCAqLzxicj4NCi0wOsKgIMKgIMKgYWRkacKgIMKgIDMsIDAsIC1UQVJHRVRfRVJF
U1RBUlRTWVM8YnI+DQotwqAgwqAgwqAgwqBsZCAxNCwgMTYoMSkgLyogcmVzdG9yZSByMTQgdG8g
aXRzIG9yaWdpbmFsIHZhbHVlICovPGJyPg0KLcKgIMKgIMKgIMKgYmxyPGJyPg0KKzA6wqAgwqAg
wqBsacKgIMKgIMKgIDMsIFRBUkdFVF9FUkVTVEFSVFNZUzxicj4NCivCoCDCoCDCoCDCoGLCoCDC
oCDCoCDCoDFiPGJyPg0KKzxicj4NCsKgIMKgIMKgIMKgIC5jZmlfZW5kcHJvYzxicj4NCjxicj4N
CsKgI2lmIF9DQUxMX0VMRiA9PSAyPGJyPg0KZGlmZiAtLWdpdCBhL2NvbW1vbi11c2VyL2hvc3Qv
cmlzY3Yvc2FmZS1zeXNjYWxsLmluYy5TIGIvY29tbW9uLXVzZXIvaG9zdC9yaXNjdi9zYWZlLXN5
c2NhbGwuaW5jLlM8YnI+DQppbmRleCA5Y2EzZmJmZDFlLi5lZGRlZGU3MDJiIDEwMDY0NDxicj4N
Ci0tLSBhL2NvbW1vbi11c2VyL2hvc3QvcmlzY3Yvc2FmZS1zeXNjYWxsLmluYy5TPGJyPg0KKysr
IGIvY29tbW9uLXVzZXIvaG9zdC9yaXNjdi9zYWZlLXN5c2NhbGwuaW5jLlM8YnI+DQpAQCAtMjMs
MTcgKzIzLDE1IEBAPGJyPg0KwqAgwqAgwqAgwqAgwqAqIGZpcnN0IGFyZ3VtZW50IGFuICYjMzk7
aW50IComIzM5OyB0byB0aGUgc2lnbmFsX3BlbmRpbmcgZmxhZywgdGhlPGJyPg0KwqAgwqAgwqAg
wqAgwqAqIHNlY29uZCBvbmUgdGhlIHN5c3RlbSBjYWxsIG51bWJlciAoYXMgYSAmIzM5O2xvbmcm
IzM5OyksIGFuZCBhbGwgZnVydGhlcjxicj4NCsKgIMKgIMKgIMKgIMKgKiBhcmd1bWVudHMgYmVp
bmcgc3lzY2FsbCBhcmd1bWVudHMgKGFsc28gJiMzOTtsb25nJiMzOTspLjxicj4NCi3CoCDCoCDC
oCDCoCAqIFdlIHJldHVybiBhIGxvbmcgd2hpY2ggaXMgdGhlIHN5c2NhbGwmIzM5O3MgcmV0dXJu
IHZhbHVlLCB3aGljaDxicj4NCi3CoCDCoCDCoCDCoCAqIG1heSBiZSBuZWdhdGl2ZS1lcnJubyBv
biBmYWlsdXJlLiBDb252ZXJzaW9uIHRvIHRoZTxicj4NCi3CoCDCoCDCoCDCoCAqIC0xLWFuZC1l
cnJuby1zZXQgY29udmVudGlvbiBpcyBkb25lIGJ5IHRoZSBjYWxsaW5nIHdyYXBwZXIuPGJyPg0K
wqAgwqAgwqAgwqAgwqAqLzxicj4NCsKgc2FmZV9zeXNjYWxsX2Jhc2U6PGJyPg0KwqAgwqAgwqAg
wqAgLmNmaV9zdGFydHByb2M8YnI+DQrCoCDCoCDCoCDCoCAvKjxicj4NCsKgIMKgIMKgIMKgIMKg
KiBUaGUgc3lzY2FsbCBjYWxsaW5nIGNvbnZlbnRpb24gaXMgbmVhcmx5IHRoZSBzYW1lIGFzIEM6
PGJyPg0KLcKgIMKgIMKgIMKgICogd2UgZW50ZXIgd2l0aCBhMCA9PSAqc2lnbmFsX3BlbmRpbmc8
YnI+DQotwqAgwqAgwqAgwqAgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYTEgPT0gc3lzY2FsbCBu
dW1iZXI8YnI+DQotwqAgwqAgwqAgwqAgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYTIgLi4uIGE3
ID09IHN5c2NhbGwgYXJndW1lbnRzPGJyPg0KK8KgIMKgIMKgIMKgICogd2UgZW50ZXIgd2l0aCBh
MCA9PSAmYW1wO3NpZ25hbF9wZW5kaW5nPGJyPg0KK8KgIMKgIMKgIMKgICrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGExID09ICZhbXA7ZXJybm88YnI+DQorwqAgwqAgwqAgwqAgKsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgYTIgPT0gc3lzY2FsbCBudW1iZXI8YnI+DQorwqAgwqAgwqAgwqAgKsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgYTMgLi4uIGE3LCBbc3BdID09IHN5c2NhbGwgYXJndW1lbnRzPGJy
Pg0KwqAgwqAgwqAgwqAgwqAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhbmQgcmV0dXJuIHRoZSBy
ZXN1bHQgaW4gYTA8YnI+DQrCoCDCoCDCoCDCoCDCoCogYW5kIHRoZSBzeXNjYWxsIGluc3RydWN0
aW9uIG5lZWRzPGJyPg0KwqAgwqAgwqAgwqAgwqAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhNyA9
PSBzeXNjYWxsIG51bWJlcjxicj4NCkBAIC00MiwxNCArNDAsMTkgQEAgc2FmZV9zeXNjYWxsX2Jh
c2U6PGJyPg0KwqAgwqAgwqAgwqAgwqAqIFNodWZmbGUgZXZlcnl0aGluZyBhcm91bmQgYXBwcm9w
cmlhdGVseS48YnI+DQrCoCDCoCDCoCDCoCDCoCovPGJyPg0KwqAgwqAgwqAgwqAgbXbCoCDCoCDC
oCB0MCwgYTDCoCDCoCDCoCDCoCDCoCAvKiBzaWduYWxfcGVuZGluZyBwb2ludGVyICovPGJyPg0K
LcKgIMKgIMKgIMKgbXbCoCDCoCDCoCB0MSwgYTHCoCDCoCDCoCDCoCDCoCAvKiBzeXNjYWxsIG51
bWJlciAqLzxicj4NCi3CoCDCoCDCoCDCoG12wqAgwqAgwqAgYTAsIGEywqAgwqAgwqAgwqAgwqAg
Lyogc3lzY2FsbCBhcmd1bWVudHMgKi88YnI+DQotwqAgwqAgwqAgwqBtdsKgIMKgIMKgIGExLCBh
Mzxicj4NCi3CoCDCoCDCoCDCoG12wqAgwqAgwqAgYTIsIGE0PGJyPg0KLcKgIMKgIMKgIMKgbXbC
oCDCoCDCoCBhMywgYTU8YnI+DQotwqAgwqAgwqAgwqBtdsKgIMKgIMKgIGE0LCBhNjxicj4NCi3C
oCDCoCDCoCDCoG12wqAgwqAgwqAgYTUsIGE3PGJyPg0KLcKgIMKgIMKgIMKgbXbCoCDCoCDCoCBh
NywgdDE8YnI+DQorwqAgwqAgwqAgwqBtdsKgIMKgIMKgIHQxLCBhMcKgIMKgIMKgIMKgIMKgIC8q
IGVycm5vIHBvaW50ZXIgKi88YnI+DQorwqAgwqAgwqAgwqBtdsKgIMKgIMKgIHQyLCBhMsKgIMKg
IMKgIMKgIMKgIC8qIHN5c2NhbGwgbnVtYmVyICovPGJyPg0KK8KgIMKgIMKgIMKgbXbCoCDCoCDC
oCBhMCwgYTPCoCDCoCDCoCDCoCDCoCAvKiBzeXNjYWxsIGFyZ3VtZW50cyAqLzxicj4NCivCoCDC
oCDCoCDCoG12wqAgwqAgwqAgYTEsIGE0PGJyPg0KK8KgIMKgIMKgIMKgbXbCoCDCoCDCoCBhMiwg
YTU8YnI+DQorwqAgwqAgwqAgwqBtdsKgIMKgIMKgIGEzLCBhNjxicj4NCivCoCDCoCDCoCDCoG12
wqAgwqAgwqAgYTQsIGE3PGJyPg0KKyNpZiBfX3Jpc2N2X3hsZW4gPT0gMzI8YnI+DQorwqAgwqAg
wqAgwqBsd8KgIMKgIMKgIGE1LCAwKHNwKTxicj4NCisjZWxzZTxicj4NCivCoCDCoCDCoCDCoGxk
wqAgwqAgwqAgYTUsIDAoc3ApPGJyPg0KKyNlbmRpZjxicj4NCivCoCDCoCDCoCDCoG12wqAgwqAg
wqAgYTcsIHQyPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgLyo8YnI+DQrCoCDCoCDCoCDCoCDCoCog
VGhpcyBuZXh0IHNlcXVlbmNlIG9mIGNvZGUgd29ya3MgaW4gY29uanVuY3Rpb24gd2l0aCB0aGU8
YnI+DQpAQCAtNjEsMTcgKzY0LDI2IEBAIHNhZmVfc3lzY2FsbF9iYXNlOjxicj4NCsKgIMKgIMKg
IMKgIMKgKi88YnI+DQrCoHNhZmVfc3lzY2FsbF9zdGFydDo8YnI+DQrCoCDCoCDCoCDCoCAvKiBJ
ZiBzaWduYWxfcGVuZGluZyBpcyBub24temVybywgZG9uJiMzOTt0IGRvIHRoZSBjYWxsICovPGJy
Pg0KLcKgIMKgIMKgIMKgbHfCoCDCoCDCoCB0MSwgMCh0MCk8YnI+DQotwqAgwqAgwqAgwqBibmV6
wqAgwqAgdDEsIDBmPGJyPg0KK8KgIMKgIMKgIMKgbHfCoCDCoCDCoCB0MiwgMCh0MCk8YnI+DQor
wqAgwqAgwqAgwqBibmV6wqAgwqAgdDIsIDJmPGJyPg0KwqAgwqAgwqAgwqAgc2NhbGw8YnI+DQrC
oHNhZmVfc3lzY2FsbF9lbmQ6PGJyPg0KKzxicj4NCsKgIMKgIMKgIMKgIC8qIGNvZGUgcGF0aCBm
b3IgaGF2aW5nIHN1Y2Nlc3NmdWxseSBleGVjdXRlZCB0aGUgc3lzY2FsbCAqLzxicj4NCivCoCDC
oCDCoCDCoGxpwqAgwqAgwqAgdDIsIC00MDk2PGJyPg0KK8KgIMKgIMKgIMKgYmd0dcKgIMKgIGEw
LCB0MiwgMGY8YnI+DQrCoCDCoCDCoCDCoCByZXQ8YnI+DQo8YnI+DQotMDo8YnI+DQotwqAgwqAg
wqAgwqAvKiBjb2RlIHBhdGggd2hlbiB3ZSBkaWRuJiMzOTt0IGV4ZWN1dGUgdGhlIHN5c2NhbGwg
Ki88YnI+DQotwqAgwqAgwqAgwqBsacKgIMKgIMKgIGEwLCAtVEFSR0VUX0VSRVNUQVJUU1lTPGJy
Pg0KK8KgIMKgIMKgIMKgLyogY29kZSBwYXRoIHNldHRpbmcgZXJybm8gKi88YnI+DQorMDrCoCDC
oCDCoG5lZ8KgIMKgIMKgYTAsIGEwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogY3JlYXRl
IHBvc2l0aXZlIGVycm5vICovPGJyPg0KKzE6wqAgwqAgwqBzd8KgIMKgIMKgIGEwLCAwKHQxKcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogc3RvcmUgZXJybm8gKi88YnI+DQorwqAgwqAgwqAgwqBs
acKgIMKgIMKgIGEwLCAtMTxicj4NCsKgIMKgIMKgIMKgIHJldDxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAvKiBjb2RlIHBhdGggd2hlbiB3ZSBkaWRuJiMzOTt0IGV4ZWN1dGUgdGhlIHN5c2NhbGwg
Ki88YnI+DQorMjrCoCDCoCDCoGxpwqAgwqAgwqAgYTAsIFRBUkdFVF9FUkVTVEFSVFNZUzxicj4N
CivCoCDCoCDCoCDCoGrCoCDCoCDCoCDCoDFiPGJyPg0KKzxicj4NCsKgIMKgIMKgIMKgIC5jZmlf
ZW5kcHJvYzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIC5zaXplwqAgwqBzYWZlX3N5c2NhbGxfYmFz
ZSwgLi1zYWZlX3N5c2NhbGxfYmFzZTxicj4NCmRpZmYgLS1naXQgYS9jb21tb24tdXNlci9ob3N0
L3MzOTB4L3NhZmUtc3lzY2FsbC5pbmMuUyBiL2NvbW1vbi11c2VyL2hvc3QvczM5MHgvc2FmZS1z
eXNjYWxsLmluYy5TPGJyPg0KaW5kZXggNDE0YjQ0YWQzOC4uZjJhM2JjY2MxMyAxMDA2NDQ8YnI+
DQotLS0gYS9jb21tb24tdXNlci9ob3N0L3MzOTB4L3NhZmUtc3lzY2FsbC5pbmMuUzxicj4NCisr
KyBiL2NvbW1vbi11c2VyL2hvc3QvczM5MHgvc2FmZS1zeXNjYWxsLmluYy5TPGJyPg0KQEAgLTE1
LDE0ICsxNSwxMiBAQDxicj4NCsKgIMKgIMKgIMKgIC5nbG9iYWwgc2FmZV9zeXNjYWxsX2VuZDxi
cj4NCsKgIMKgIMKgIMKgIC50eXBlwqAgwqBzYWZlX3N5c2NhbGxfYmFzZSwgQGZ1bmN0aW9uPGJy
Pg0KPGJyPg0KLcKgIMKgIMKgIMKgLyogVGhpcyBpcyB0aGUgZW50cnkgcG9pbnQgZm9yIG1ha2lu
ZyBhIHN5c3RlbSBjYWxsLiBUaGUgY2FsbGluZzxicj4NCivCoCDCoCDCoCDCoC8qPGJyPg0KK8Kg
IMKgIMKgIMKgICogVGhpcyBpcyB0aGUgZW50cnkgcG9pbnQgZm9yIG1ha2luZyBhIHN5c3RlbSBj
YWxsLiBUaGUgY2FsbGluZzxicj4NCsKgIMKgIMKgIMKgIMKgKiBjb252ZW50aW9uIGhlcmUgaXMg
dGhhdCBvZiBhIEMgdmFyYXJncyBmdW5jdGlvbiB3aXRoIHRoZTxicj4NCsKgIMKgIMKgIMKgIMKg
KiBmaXJzdCBhcmd1bWVudCBhbiAmIzM5O2ludCAqJiMzOTsgdG8gdGhlIHNpZ25hbF9wZW5kaW5n
IGZsYWcsIHRoZTxicj4NCsKgIMKgIMKgIMKgIMKgKiBzZWNvbmQgb25lIHRoZSBzeXN0ZW0gY2Fs
bCBudW1iZXIgKGFzIGEgJiMzOTtsb25nJiMzOTspLCBhbmQgYWxsIGZ1cnRoZXI8YnI+DQrCoCDC
oCDCoCDCoCDCoCogYXJndW1lbnRzIGJlaW5nIHN5c2NhbGwgYXJndW1lbnRzIChhbHNvICYjMzk7
bG9uZyYjMzk7KS48YnI+DQotwqAgwqAgwqAgwqAgKiBXZSByZXR1cm4gYSBsb25nIHdoaWNoIGlz
IHRoZSBzeXNjYWxsJiMzOTtzIHJldHVybiB2YWx1ZSwgd2hpY2g8YnI+DQotwqAgwqAgwqAgwqAg
KiBtYXkgYmUgbmVnYXRpdmUtZXJybm8gb24gZmFpbHVyZS4gQ29udmVyc2lvbiB0byB0aGU8YnI+
DQotwqAgwqAgwqAgwqAgKiAtMS1hbmQtZXJybm8tc2V0IGNvbnZlbnRpb24gaXMgZG9uZSBieSB0
aGUgY2FsbGluZyB3cmFwcGVyLjxicj4NCsKgIMKgIMKgIMKgIMKgKi88YnI+DQrCoHNhZmVfc3lz
Y2FsbF9iYXNlOjxicj4NCsKgIMKgIMKgIMKgIC5jZmlfc3RhcnRwcm9jPGJyPg0KQEAgLTQ0LDEx
ICs0MiwxMyBAQCBzYWZlX3N5c2NhbGxfYmFzZTo8YnI+DQrCoCDCoCDCoCDCoCBzdGfCoCDCoCDC
oCVyMSwwKCVyMTUpwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBzdG9yZSBiYWNrIGNoYWluICovPGJy
Pg0KwqAgwqAgwqAgwqAgc3RnwqAgwqAgwqAlcjAsOCglcjE1KcKgIMKgIMKgIMKgIMKgIMKgIMKg
Lyogc3RvcmUgZW9zICovPGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgLyogVGhlIHN5c2NhbGwgY2Fs
bGluZyBjb252ZW50aW9uIGlzbiYjMzk7dCB0aGUgc2FtZSBhcyB0aGU8YnI+DQorwqAgwqAgwqAg
wqAvKjxicj4NCivCoCDCoCDCoCDCoCAqIFRoZSBzeXNjYWxsIGNhbGxpbmcgY29udmVudGlvbiBp
c24mIzM5O3QgdGhlIHNhbWUgYXMgdGhlPGJyPg0KwqAgwqAgwqAgwqAgwqAqIEMgb25lOjxicj4N
Ci3CoCDCoCDCoCDCoCAqIHdlIGVudGVyIHdpdGggcjIgPT0gKnNpZ25hbF9wZW5kaW5nPGJyPg0K
LcKgIMKgIMKgIMKgICrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHIzID09IHN5c2NhbGwgbnVtYmVy
PGJyPg0KLcKgIMKgIMKgIMKgICrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHI0LCByNSwgcjYsIChz
dGFjaykgPT0gc3lzY2FsbCBhcmd1bWVudHM8YnI+DQorwqAgwqAgwqAgwqAgKiB3ZSBlbnRlciB3
aXRoIHIyID09ICZhbXA7c2lnbmFsX3BlbmRpbmc8YnI+DQorwqAgwqAgwqAgwqAgKsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcjMgPT0gJmFtcDtlcnJubzxicj4NCivCoCDCoCDCoCDCoCAqwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByNCA9PSBzeXNjYWxsIG51bWJlcjxicj4NCivCoCDCoCDCoCDCoCAq
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByNSwgcjYsIChzdGFjaykgPT0gc3lzY2FsbCBhcmd1bWVu
dHM8YnI+DQrCoCDCoCDCoCDCoCDCoCrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFuZCByZXR1cm4g
dGhlIHJlc3VsdCBpbiByMjxicj4NCsKgIMKgIMKgIMKgIMKgKiBhbmQgdGhlIHN5c2NhbGwgaW5z
dHJ1Y3Rpb24gbmVlZHM8YnI+DQrCoCDCoCDCoCDCoCDCoCrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHIxID09IHN5c2NhbGwgbnVtYmVyPGJyPg0KQEAgLTU3LDEzICs1NywxNCBAQCBzYWZlX3N5c2Nh
bGxfYmFzZTo8YnI+DQrCoCDCoCDCoCDCoCDCoCogU2h1ZmZsZSBldmVyeXRoaW5nIGFyb3VuZCBh
cHByb3ByaWF0ZWx5Ljxicj4NCsKgIMKgIMKgIMKgIMKgKi88YnI+DQrCoCDCoCDCoCDCoCBsZ3LC
oCDCoCDCoCVyOCwlcjLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIHNpZ25hbF9wZW5kaW5n
IHBvaW50ZXIgKi88YnI+DQotwqAgwqAgwqAgwqBsZ3LCoCDCoCDCoCVyMSwlcjPCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoC8qIHN5c2NhbGwgbnVtYmVyICovPGJyPg0KLcKgIMKgIMKgIMKgbGdy
wqAgwqAgwqAlcjIsJXI0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBzeXNjYWxsIGFyZ3Mg
Ki88YnI+DQotwqAgwqAgwqAgwqBsZ3LCoCDCoCDCoCVyMywlcjU8YnI+DQotwqAgwqAgwqAgwqBs
Z3LCoCDCoCDCoCVyNCwlcjY8YnI+DQotwqAgwqAgwqAgwqBsbWfCoCDCoCDCoCVyNSwlcjcsMzIw
KCVyMTUpPGJyPg0KK8KgIMKgIMKgIMKgbGdywqAgwqAgwqAlcjksJXIzwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAvKiBlcnJubyBwb2ludGVyICovPGJyPg0KK8KgIMKgIMKgIMKgbGdywqAgwqAg
wqAlcjEsJXI0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBzeXNjYWxsIG51bWJlciAqLzxi
cj4NCivCoCDCoCDCoCDCoGxncsKgIMKgIMKgJXIyLCVyNcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgLyogc3lzY2FsbCBhcmdzICovPGJyPg0KK8KgIMKgIMKgIMKgbGdywqAgwqAgwqAlcjMsJXI2
PGJyPg0KK8KgIMKgIMKgIMKgbG1nwqAgwqAgwqAlcjQsJXI3LDMyMCglcjE1KTxicj4NCjxicj4N
Ci3CoCDCoCDCoCDCoC8qIFRoaXMgbmV4dCBzZXF1ZW5jZSBvZiBjb2RlIHdvcmtzIGluIGNvbmp1
bmN0aW9uIHdpdGggdGhlPGJyPg0KK8KgIMKgIMKgIMKgLyo8YnI+DQorwqAgwqAgwqAgwqAgKiBU
aGlzIG5leHQgc2VxdWVuY2Ugb2YgY29kZSB3b3JrcyBpbiBjb25qdW5jdGlvbiB3aXRoIHRoZTxi
cj4NCsKgIMKgIMKgIMKgIMKgKiByZXdpbmRfaWZfc2FmZV9zeXNjYWxsX2Z1bmN0aW9uKCkuIElm
IGEgc2lnbmFsIGlzIHRha2VuPGJyPg0KwqAgwqAgwqAgwqAgwqAqIGFuZCB0aGUgaW50ZXJydXB0
ZWQgUEMgaXMgYW55d2hlcmUgYmV0d2VlbiAmIzM5O3NhZmVfc3lzY2FsbF9zdGFydCYjMzk7PGJy
Pg0KwqAgwqAgwqAgwqAgwqAqIGFuZCAmIzM5O3NhZmVfc3lzY2FsbF9lbmQmIzM5OyB0aGVuIHdl
IHJld2luZCBpdCB0byAmIzM5O3NhZmVfc3lzY2FsbF9zdGFydCYjMzk7Ljxicj4NCkBAIC03Mywx
OCArNzQsMzEgQEAgc2FmZV9zeXNjYWxsX2Jhc2U6PGJyPg0KwqBzYWZlX3N5c2NhbGxfc3RhcnQ6
PGJyPg0KwqAgwqAgwqAgwqAgLyogaWYgc2lnbmFsX3BlbmRpbmcgaXMgbm9uLXplcm8sIGRvbiYj
Mzk7dCBkbyB0aGUgY2FsbCAqLzxicj4NCsKgIMKgIMKgIMKgIGljbcKgIMKgIMKgJXIwLDE1LDAo
JXI4KTxicj4NCi3CoCDCoCDCoCDCoGpuZcKgIMKgIMKgMmY8YnI+DQorwqAgwqAgwqAgwqBqbmXC
oCDCoCDCoDFmPGJyPg0KwqAgwqAgwqAgwqAgc3ZjwqAgwqAgwqAwPGJyPg0KwqBzYWZlX3N5c2Nh
bGxfZW5kOjxicj4NCjxicj4NCi0xOsKgIMKgIMKgbGfCoCDCoCDCoCAlcjE1LDAoJXIxNSnCoCDC
oCDCoCDCoCDCoCDCoCAvKiBsb2FkIGJhY2sgY2hhaW4gKi88YnI+DQorwqAgwqAgwqAgwqAvKiBj
b2RlIHBhdGggZm9yIGhhdmluZyBzdWNjZXNzZnVsbHkgZXhlY3V0ZWQgdGhlIHN5c2NhbGwgKi88
YnI+DQorwqAgwqAgwqAgwqBsZ2hpwqAgwqAgJXIwLCAtNDA5NcKgIMKgIMKgIMKgIMKgIMKgIMKg
IC8qIGNoZWNrIGZvciBzeXNjYWxsIGVycm9yICovPGJyPg0KK8KgIMKgIMKgIMKgY2xncsKgIMKg
ICVyMiwgJXIwPGJyPg0KK8KgIMKgIMKgIMKgamdubMKgIMKgIDBmPGJyPg0KKzxicj4NCis5OsKg
IMKgIMKgbGfCoCDCoCDCoCAlcjE1LDAoJXIxNSnCoCDCoCDCoCDCoCDCoCDCoCAvKiBsb2FkIGJh
Y2sgY2hhaW4gKi88YnI+DQrCoCDCoCDCoCDCoCAuY2ZpX3JlbWVtYmVyX3N0YXRlPGJyPg0KwqAg
wqAgwqAgwqAgLmNmaV9hZGp1c3RfY2ZhX29mZnNldCAtMTYwPGJyPg0KwqAgwqAgwqAgwqAgbG1n
wqAgwqAgwqAlcjYsJXIxNSw0OCglcjE1KcKgIMKgIMKgIMKgLyogbG9hZCBzYXZlZCByZWdpc3Rl
cnMgKi88YnI+DQrCoCDCoCDCoCDCoCBicsKgIMKgIMKgICVyMTQ8YnI+DQrCoCDCoCDCoCDCoCAu
Y2ZpX3Jlc3RvcmVfc3RhdGU8YnI+DQotMjrCoCDCoCDCoGxnaGnCoCDCoCAlcjIsIC1UQVJHRVRf
RVJFU1RBUlRTWVM8YnI+DQotwqAgwqAgwqAgwqBqwqAgwqAgwqAgwqAxYjxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAvKiBjb2RlIHBhdGggd2hlbiB3ZSBkaWRuJiMzOTt0IGV4ZWN1dGUgdGhlIHN5
c2NhbGwgKi88YnI+DQorMTrCoCDCoCDCoGxnaGnCoCDCoCAlcjIsIC1UQVJHRVRfRVJFU1RBUlRT
WVM8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgLyogY29kZSBwYXRoIHNldHRpbmcgZXJybm8gKi88
YnI+DQorMDrCoCDCoCDCoGxjcsKgIMKgIMKgJXIyLCAlcjLCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAvKiBjcmVhdGUgcG9zaXRpdmUgZXJybm8gKi88YnI+DQorwqAgwqAgwqAgwqBzdMKgIMKgIMKg
ICVyMiwgMCglcjkpwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBzdG9yZSBlcnJubyAqLzxicj4NCivC
oCDCoCDCoCDCoGxnaGnCoCDCoCAlcjIsIC0xPGJyPg0KK8KgIMKgIMKgIMKgasKgIMKgIMKgIMKg
OWI8YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAgLmNmaV9lbmRwcm9jPGJyPg0KPGJyPg0KwqAgwqAg
wqAgwqAgLnNpemXCoCDCoHNhZmVfc3lzY2FsbF9iYXNlLCAuLXNhZmVfc3lzY2FsbF9iYXNlPGJy
Pg0KZGlmZiAtLWdpdCBhL2NvbW1vbi11c2VyL2hvc3QveDg2XzY0L3NhZmUtc3lzY2FsbC5pbmMu
UyBiL2NvbW1vbi11c2VyL2hvc3QveDg2XzY0L3NhZmUtc3lzY2FsbC5pbmMuUzxicj4NCmluZGV4
IGYzNjk5MmRhYTMuLjlhMGM0YzkzYjQgMTAwNjQ0PGJyPg0KLS0tIGEvY29tbW9uLXVzZXIvaG9z
dC94ODZfNjQvc2FmZS1zeXNjYWxsLmluYy5TPGJyPg0KKysrIGIvY29tbW9uLXVzZXIvaG9zdC94
ODZfNjQvc2FmZS1zeXNjYWxsLmluYy5TPGJyPg0KQEAgLTE0LDE4ICsxNCwxNyBAQDxicj4NCsKg
IMKgIMKgIMKgIMKgLmdsb2JhbCBzYWZlX3N5c2NhbGxfZW5kPGJyPg0KwqAgwqAgwqAgwqAgwqAu
dHlwZcKgIMKgc2FmZV9zeXNjYWxsX2Jhc2UsIEBmdW5jdGlvbjxicj4NCjxicj4NCi3CoCDCoCDC
oCDCoCAvKiBUaGlzIGlzIHRoZSBlbnRyeSBwb2ludCBmb3IgbWFraW5nIGEgc3lzdGVtIGNhbGwu
IFRoZSBjYWxsaW5nPGJyPg0KK8KgIMKgIMKgIMKgIC8qPGJyPg0KK8KgIMKgIMKgIMKgIMKgKiBU
aGlzIGlzIHRoZSBlbnRyeSBwb2ludCBmb3IgbWFraW5nIGEgc3lzdGVtIGNhbGwuIFRoZSBjYWxs
aW5nPGJyPg0KwqAgwqAgwqAgwqAgwqAgKiBjb252ZW50aW9uIGhlcmUgaXMgdGhhdCBvZiBhIEMg
dmFyYXJncyBmdW5jdGlvbiB3aXRoIHRoZTxicj4NCsKgIMKgIMKgIMKgIMKgICogZmlyc3QgYXJn
dW1lbnQgYW4gJiMzOTtpbnQgKiYjMzk7IHRvIHRoZSBzaWduYWxfcGVuZGluZyBmbGFnLCB0aGU8
YnI+DQrCoCDCoCDCoCDCoCDCoCAqIHNlY29uZCBvbmUgdGhlIHN5c3RlbSBjYWxsIG51bWJlciAo
YXMgYSAmIzM5O2xvbmcmIzM5OyksIGFuZCBhbGwgZnVydGhlcjxicj4NCsKgIMKgIMKgIMKgIMKg
ICogYXJndW1lbnRzIGJlaW5nIHN5c2NhbGwgYXJndW1lbnRzIChhbHNvICYjMzk7bG9uZyYjMzk7
KS48YnI+DQotwqAgwqAgwqAgwqAgwqAqIFdlIHJldHVybiBhIGxvbmcgd2hpY2ggaXMgdGhlIHN5
c2NhbGwmIzM5O3MgcmV0dXJuIHZhbHVlLCB3aGljaDxicj4NCi3CoCDCoCDCoCDCoCDCoCogbWF5
IGJlIG5lZ2F0aXZlLWVycm5vIG9uIGZhaWx1cmUuIENvbnZlcnNpb24gdG8gdGhlPGJyPg0KLcKg
IMKgIMKgIMKgIMKgKiAtMS1hbmQtZXJybm8tc2V0IGNvbnZlbnRpb24gaXMgZG9uZSBieSB0aGUg
Y2FsbGluZyB3cmFwcGVyLjxicj4NCsKgIMKgIMKgIMKgIMKgICovPGJyPg0KwqBzYWZlX3N5c2Nh
bGxfYmFzZTo8YnI+DQrCoCDCoCDCoCDCoCDCoC5jZmlfc3RhcnRwcm9jPGJyPg0KLcKgIMKgIMKg
IMKgIC8qIFRoaXMgc2F2ZXMgYSBmcmFtZSBwb2ludGVyIGFuZCBhbGlnbnMgdGhlIHN0YWNrIGZv
ciB0aGUgc3lzY2FsbC48YnI+DQorwqAgwqAgwqAgwqAgLyo8YnI+DQorwqAgwqAgwqAgwqAgwqAq
IFRoaXMgc2F2ZXMgYSBmcmFtZSBwb2ludGVyIGFuZCBhbGlnbnMgdGhlIHN0YWNrIGZvciB0aGUg
c3lzY2FsbC48YnI+DQrCoCDCoCDCoCDCoCDCoCAqIChJdCYjMzk7cyB1bmNsZWFyIGlmIHRoZSBz
eXNjYWxsIEFCSSBoYXMgdGhlIHNhbWUgc3RhY2sgYWxpZ25tZW50PGJyPg0KwqAgwqAgwqAgwqAg
wqAgKiByZXF1aXJlbWVudHMgYXMgdGhlIHVzZXJzcGFjZSBmdW5jdGlvbiBjYWxsIEFCSSwgYnV0
IGJldHRlciBzYWZlIHRoYW48YnI+DQrCoCDCoCDCoCDCoCDCoCAqIHNvcnJ5LiBBcHBlbmRpeCBB
MiBvZiA8YSBocmVmPSJodHRwOi8vd3d3Lng4Ni02NC5vcmcvZG9jdW1lbnRhdGlvbi9hYmkucGRm
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vd3d3Lng4Ni02NC5vcmcv
ZG9jdW1lbnRhdGlvbi9hYmkucGRmPC9hPjxicj4NCkBAIC0zNSwxMSArMzQsMTIgQEAgc2FmZV9z
eXNjYWxsX2Jhc2U6PGJyPg0KwqAgwqAgwqAgwqAgwqAuY2ZpX2FkanVzdF9jZmFfb2Zmc2V0IDg8
YnI+DQrCoCDCoCDCoCDCoCDCoC5jZmlfcmVsX29mZnNldCByYnAsIDA8YnI+DQo8YnI+DQotwqAg
wqAgwqAgwqAgLyogVGhlIHN5c2NhbGwgY2FsbGluZyBjb252ZW50aW9uIGlzbiYjMzk7dCB0aGUg
c2FtZSBhcyB0aGU8YnI+DQotwqAgwqAgwqAgwqAgwqAqIEMgb25lOjxicj4NCi3CoCDCoCDCoCDC
oCDCoCogd2UgZW50ZXIgd2l0aCByZGkgPT0gKnNpZ25hbF9wZW5kaW5nPGJyPg0KLcKgIMKgIMKg
IMKgIMKgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcnNpID09IHN5c2NhbGwgbnVtYmVyPGJyPg0K
LcKgIMKgIMKgIMKgIMKgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmR4LCByY3gsIHI4LCByOSwg
KHN0YWNrKSwgKHN0YWNrKSA9PSBzeXNjYWxsIGFyZ3VtZW50czxicj4NCivCoCDCoCDCoCDCoCAv
Kjxicj4NCivCoCDCoCDCoCDCoCDCoCogVGhlIHN5c2NhbGwgY2FsbGluZyBjb252ZW50aW9uIGlz
biYjMzk7dCB0aGUgc2FtZSBhcyB0aGUgQyBvbmU6PGJyPg0KK8KgIMKgIMKgIMKgIMKgKiB3ZSBl
bnRlciB3aXRoIHJkaSA9PSAmYW1wO3NpZ25hbF9wZW5kaW5nPGJyPg0KK8KgIMKgIMKgIMKgIMKg
KsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcnNpID09ICZhbXA7ZXJybm88YnI+DQorwqAgwqAgwqAg
wqAgwqAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZHggPT0gc3lzY2FsbCBudW1iZXI8YnI+DQor
wqAgwqAgwqAgwqAgwqAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByY3gsIHI4LCByOSwgKHN0YWNr
Li4uKSA9PSBzeXNjYWxsIGFyZ3VtZW50czxicj4NCsKgIMKgIMKgIMKgIMKgICrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGFuZCByZXR1cm4gdGhlIHJlc3VsdCBpbiByYXg8YnI+DQrCoCDCoCDCoCDC
oCDCoCAqIGFuZCB0aGUgc3lzY2FsbCBpbnN0cnVjdGlvbiBuZWVkczxicj4NCsKgIMKgIMKgIMKg
IMKgICrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJheCA9PSBzeXNjYWxsIG51bWJlcjxicj4NCkBA
IC00OCwxNyArNDgsMTkgQEAgc2FmZV9zeXNjYWxsX2Jhc2U6PGJyPg0KwqAgwqAgwqAgwqAgwqAg
KiBTaHVmZmxlIGV2ZXJ5dGhpbmcgYXJvdW5kIGFwcHJvcHJpYXRlbHkuPGJyPg0KwqAgwqAgwqAg
wqAgwqAgKiBOb3RlIHRoYXQgc3lzY2FsbCB3aWxsIHRyYXNoIHJjeCBhbmQgcjExLjxicj4NCsKg
IMKgIMKgIMKgIMKgICovPGJyPg0KLcKgIMKgIMKgIMKgIG1vdsKgIMKgIMKgJXJzaSwgJXJheCAv
KiBzeXNjYWxsIG51bWJlciAqLzxicj4NCi3CoCDCoCDCoCDCoCBtb3bCoCDCoCDCoCVyZGksICVy
YnAgLyogc2lnbmFsX3BlbmRpbmcgcG9pbnRlciAqLzxicj4NCivCoCDCoCDCoCDCoCBtb3bCoCDC
oCDCoCVyZGksICVyMTEgLyogc2lnbmFsX3BlbmRpbmcgcG9pbnRlciAqLzxicj4NCivCoCDCoCDC
oCDCoCBtb3bCoCDCoCDCoCVyc2ksICVyYnAgLyogZXJybm8gcG9pbnRlciAqLzxicj4NCivCoCDC
oCDCoCDCoCBtb3bCoCDCoCDCoCVyZHgsICVyYXggLyogc3lzY2FsbCBudW1iZXIgKi88YnI+DQrC
oCDCoCDCoCDCoCDCoC8qIGFuZCB0aGUgc3lzY2FsbCBhcmd1bWVudHMgKi88YnI+DQotwqAgwqAg
wqAgwqAgbW92wqAgwqAgwqAlcmR4LCAlcmRpPGJyPg0KLcKgIMKgIMKgIMKgIG1vdsKgIMKgIMKg
JXJjeCwgJXJzaTxicj4NCi3CoCDCoCDCoCDCoCBtb3bCoCDCoCDCoCVyOCzCoCAlcmR4PGJyPg0K
LcKgIMKgIMKgIMKgIG1vdsKgIMKgIMKgJXI5LMKgICVyMTA8YnI+DQotwqAgwqAgwqAgwqAgbW92
wqAgwqAgwqAxNiglcnNwKSwgJXI4PGJyPg0KLcKgIMKgIMKgIMKgIG1vdsKgIMKgIMKgMjQoJXJz
cCksICVyOTxicj4NCivCoCDCoCDCoCDCoCBtb3bCoCDCoCDCoCVyY3gsICVyZGk8YnI+DQorwqAg
wqAgwqAgwqAgbW92wqAgwqAgwqAlcjgsICVyc2k8YnI+DQorwqAgwqAgwqAgwqAgbW92wqAgwqAg
wqAlcjkswqAgJXJkeDxicj4NCivCoCDCoCDCoCDCoCBtb3bCoCDCoCDCoDE2KCVyc3ApLCAlcjEw
PGJyPg0KK8KgIMKgIMKgIMKgIG1vdsKgIMKgIMKgMjQoJXJzcCksICVyODxicj4NCivCoCDCoCDC
oCDCoCBtb3bCoCDCoCDCoDMyKCVyc3ApLCAlcjk8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqAgLyog
VGhpcyBuZXh0IHNlcXVlbmNlIG9mIGNvZGUgd29ya3MgaW4gY29uanVuY3Rpb24gd2l0aCB0aGU8
YnI+DQorwqAgwqAgwqAgwqAgLyo8YnI+DQorwqAgwqAgwqAgwqAgwqAqIFRoaXMgbmV4dCBzZXF1
ZW5jZSBvZiBjb2RlIHdvcmtzIGluIGNvbmp1bmN0aW9uIHdpdGggdGhlPGJyPg0KwqAgwqAgwqAg
wqAgwqAgKiByZXdpbmRfaWZfc2FmZV9zeXNjYWxsX2Z1bmN0aW9uKCkuIElmIGEgc2lnbmFsIGlz
IHRha2VuPGJyPg0KwqAgwqAgwqAgwqAgwqAgKiBhbmQgdGhlIGludGVycnVwdGVkIFBDIGlzIGFu
eXdoZXJlIGJldHdlZW4gJiMzOTtzYWZlX3N5c2NhbGxfc3RhcnQmIzM5Ozxicj4NCsKgIMKgIMKg
IMKgIMKgICogYW5kICYjMzk7c2FmZV9zeXNjYWxsX2VuZCYjMzk7IHRoZW4gd2UgcmV3aW5kIGl0
IHRvICYjMzk7c2FmZV9zeXNjYWxsX3N0YXJ0JiMzOTsuPGJyPg0KQEAgLTY3LDI1ICs2OSwzMSBA
QCBzYWZlX3N5c2NhbGxfYmFzZTo8YnI+DQrCoCDCoCDCoCDCoCDCoCAqLzxicj4NCsKgc2FmZV9z
eXNjYWxsX3N0YXJ0Ojxicj4NCsKgIMKgIMKgIMKgIMKgLyogaWYgc2lnbmFsX3BlbmRpbmcgaXMg
bm9uLXplcm8sIGRvbiYjMzk7dCBkbyB0aGUgY2FsbCAqLzxicj4NCi3CoCDCoCDCoCDCoCBjbXBs
wqAgwqAkMCwgKCVyYnApPGJyPg0KLcKgIMKgIMKgIMKgIGpuesKgIMKgIMKgMWY8YnI+DQorwqAg
wqAgwqAgwqAgY21wbMKgIMKgICQwLCAoJXIxMSk8YnI+DQorwqAgwqAgwqAgwqAgam56wqAgwqAg
wqAyZjxicj4NCsKgIMKgIMKgIMKgIMKgc3lzY2FsbDxicj4NCsKgc2FmZV9zeXNjYWxsX2VuZDo8
YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAgwqAvKiBjb2RlIHBhdGggZm9yIGhhdmluZyBzdWNjZXNz
ZnVsbHkgZXhlY3V0ZWQgdGhlIHN5c2NhbGwgKi88YnI+DQotwqAgwqAgwqAgwqAgcG9wwqAgwqAg
wqAlcmJwPGJyPg0KK8KgIMKgIMKgIMKgIGNtcMKgIMKgICQtNDA5NSwgJXJheDxicj4NCivCoCDC
oCDCoCDCoCBqYWXCoCDCoCAwZjxicj4NCis8YnI+DQorOTrCoCDCoCDCoCBwb3DCoCDCoCDCoCVy
YnA8YnI+DQrCoCDCoCDCoCDCoCDCoC5jZmlfcmVtZW1iZXJfc3RhdGU8YnI+DQrCoCDCoCDCoCDC
oCDCoC5jZmlfZGVmX2NmYV9vZmZzZXQgODxicj4NCsKgIMKgIMKgIMKgIMKgLmNmaV9yZXN0b3Jl
IHJicDxicj4NCsKgIMKgIMKgIMKgIMKgcmV0PGJyPg0KLTxicj4NCi0xOjxicj4NCi3CoCDCoCDC
oCDCoCAvKiBjb2RlIHBhdGggd2hlbiB3ZSBkaWRuJiMzOTt0IGV4ZWN1dGUgdGhlIHN5c2NhbGwg
Ki88YnI+DQrCoCDCoCDCoCDCoCDCoC5jZmlfcmVzdG9yZV9zdGF0ZTxicj4NCi3CoCDCoCDCoCDC
oCBtb3bCoCDCoCDCoCQtVEFSR0VUX0VSRVNUQVJUU1lTLCAlcmF4PGJyPg0KLcKgIMKgIMKgIMKg
IHBvcMKgIMKgIMKgJXJicDxicj4NCi3CoCDCoCDCoCDCoCAuY2ZpX2RlZl9jZmFfb2Zmc2V0IDg8
YnI+DQotwqAgwqAgwqAgwqAgLmNmaV9yZXN0b3JlIHJicDxicj4NCi3CoCDCoCDCoCDCoCByZXQ8
YnI+DQotwqAgwqAgwqAgwqAgLmNmaV9lbmRwcm9jPGJyPg0KPGJyPg0KK8KgIMKgIMKgIMKgIC8q
IGNvZGUgcGF0aCBzZXR0aW5nIGVycm5vICovPGJyPg0KKzA6wqAgwqAgwqAgbmVnwqAgwqAgJWVh
eMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIGNyZWF0ZSBwb3NpdGl2ZSBlcnJubyAq
Lzxicj4NCisxOsKgIMKgIMKgIG1vdsKgIMKgICVlYXgsICglcmJwKcKgIMKgIMKgIMKgIMKgIMKg
IC8qIHN0b3JlIGVycm5vICovPGJyPg0KK8KgIMKgIMKgIMKgIG1vdsKgIMKgICQtMSwgJXJheDxi
cj4NCivCoCDCoCDCoCDCoCBqbXDCoCDCoCA5Yjxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgLyog
Y29kZSBwYXRoIHdoZW4gd2UgZGlkbiYjMzk7dCBleGVjdXRlIHRoZSBzeXNjYWxsICovPGJyPg0K
KzI6wqAgwqAgwqAgbW92wqAgwqAgwqAkVEFSR0VUX0VSRVNUQVJUU1lTLCAlZWF4PGJyPg0KK8Kg
IMKgIMKgIMKgIGptcMKgIMKgIDFiPGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCAuY2ZpX2VuZHBy
b2M8YnI+DQrCoCDCoCDCoCDCoCDCoC5zaXplwqAgwqBzYWZlX3N5c2NhbGxfYmFzZSwgLi1zYWZl
X3N5c2NhbGxfYmFzZTxicj4NCi0tIDxicj4NCjIuMjUuMTxicj4NCjxicj4NCjwvYmxvY2txdW90
ZT48L2Rpdj48L2Rpdj4NCg==
--000000000000eec2cb05d0fe89d4--

