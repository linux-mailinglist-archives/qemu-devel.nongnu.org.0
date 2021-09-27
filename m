Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D924192CE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:10:03 +0200 (CEST)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUoWI-0003vi-5f
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUoTa-00017X-Gi
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:07:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUoTY-0005Zj-JD
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:07:14 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 136-20020a1c048e000000b0030d05169e9bso158174wme.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7dlULmWTw9kE74KICurNrjDKyX3SFbIa9T/PYcyUjTk=;
 b=fllrWOESN9jKpZwK3idjGoYCPiVbjDmVh1fukX+mBmLJFIOaK20P4wJ031oKQ2g5Bk
 lzIcxnPkInAuj4DEnJBd00dp8RyE4UK60/KgAsVzjhVYbI8IhyKGqFojVnWW2lDY1evm
 t5/I/S491/5mE3COMAtu8wumwb3GWMfCn1c4gd85CyKQog0QgU73IUv+muZIZm30WEtb
 PG2FrFCxl6537VnODx9cjD6ybp2m8QDUp46bAlvXHsa9hTUDgMlkxymKORBwfbQjH9Df
 OOebCxsksVPololxI03eWhA6zd/SUtLsp2cew+4iEnJ8ZA/0NMMxo7mxL16qU+2q827j
 JrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7dlULmWTw9kE74KICurNrjDKyX3SFbIa9T/PYcyUjTk=;
 b=UkAQirrgjDz1n9ODUOZjyuPI9r+IwZ1ao7OlJlpFliVuITrObX0chP09McsDeWTSLf
 M1Yq0hqSfSW8kLsEDQ5/GG4aQ56NJigAEHsaiOMmY6vzFmG9vwl5ZHZBmOe6mnRMotPf
 Tv22QpTy/kY+BOH6ceiBJ7eO+3rWsB2AJd+zr9stbVHYY7v1PJ+hMbWmrJSGb7RKmujJ
 L7YDAQx2dzMBKevyp5IQmHA8WArKrTr636f9huVR3668/c2Bm6kedUFGkVgvElwesXfS
 AWngd3l8HGrWrD1tFN2XxAZJ8S7w5i4X05/tX3yC2JwrqifoCc/SYtRQ3VgD+V4jNuKi
 dekw==
X-Gm-Message-State: AOAM530FlijawlYlx6bLvmkVHWv6Jfc0/kgDuWyGSVUk5+vi+boM97y5
 Mwx0xyLiO+oSUhMxFerrMgMcPEXqLMe2p/nt7zdYqA==
X-Google-Smtp-Source: ABdhPJz9lWTqOOpEPMLytFcg9uC86R2fVge0LF3FchNH4FsRQ2XPTRVcFDjS2VqnqJaw9q6Ol7o4O12v4RhfGy+UohU=
X-Received: by 2002:a05:600c:1988:: with SMTP id
 t8mr8945527wmq.21.1632740830849; 
 Mon, 27 Sep 2021 04:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-6-richard.henderson@linaro.org>
In-Reply-To: <20210924165926.752809-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 12:06:17 +0100
Message-ID: <CAFEAcA85RoJO5he8pLw9bcDnav84yz2RiRcuzdu9dJF-QKZaeA@mail.gmail.com>
Subject: Re: [PATCH v3 05/27] linux-user/arm: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

On Fri, 24 Sept 2021 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Update the trampoline code to match the kernel: this uses
> sp-relative accesses rather than pc-relative.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

These functions must write at most 8 bytes:

> +static void write_arm_sigreturn(uint32_t *rc, int syscall)
> +{
> +    __put_user(ARM_MOV_R7_IMM(syscall), rc);
> +    __put_user(ARM_SWI_SYS(syscall), rc + 1);
> +}
> +
> +static void write_thumb_sigreturn(uint32_t *rc, int syscall)
> +{
> +    __put_user(THUMB_SWI_SYS << 16 | THUMB_MOVS_R7_IMM(syscall), rc);
> +}
>
>  /*
> - * Stub needed to make sure the FD register (r9) contains the right
> - * value.
> + * Stub needed to make sure the FD register (r9) contains the right value.
> + * Use the same instruction sequence as the kernel.
>   */
> -static const unsigned long sigreturn_fdpic_codes[3] = {
> -    0xe59fc004, /* ldr r12, [pc, #4] to read function descriptor */
> -    0xe59c9004, /* ldr r9, [r12, #4] to setup GOT */
> -    0xe59cf000  /* ldr pc, [r12] to jump into restorer */
> -};

...and these must write at most 12 bytes. But nothing states
or asserts that.

> +static void write_arm_fdpic_sigreturn(uint32_t *rc, int ofs)
> +{
> +    assert(ofs <= 0xfff);
> +    __put_user(0xe59d3000 | ofs, rc + 0);   /* ldr r3, [sp, #ofs] */
> +    __put_user(0xe8930908, rc + 1);         /* ldm r3, { r3, r9 } */
> +    __put_user(0xe12fff13, rc + 2);         /* bx  r3 */
> +}
>
> -static const unsigned long sigreturn_fdpic_thumb_codes[3] = {
> -    0xc008f8df, /* ldr r12, [pc, #8] to read function descriptor */
> -    0x9004f8dc, /* ldr r9, [r12, #4] to setup GOT */
> -    0xf000f8dc  /* ldr pc, [r12] to jump into restorer */
> -};
> +static void write_thumb_fdpic_sigreturn(void *vrc, int ofs)
> +{
> +    uint16_t *rc = vrc;
> +
> +    assert((ofs & ~0x3fc) == 0);
> +    __put_user(0x9b00 | (ofs >> 2), rc + 0);      /* ldr r3, [sp, #ofs] */
> +    __put_user(0xcb0c, rc + 1);                   /* ldm r3, { r2, r3 } */
> +    __put_user(0x4699, rc + 2);                   /* mov r9, r3 */
> +    __put_user(0x4710, rc + 3);                   /* bx  r2 */
> +}
>

> -            retcode = rc_addr + thumb;
> +            /* Each trampoline variant consumes a 12-byte slot. */
> +            retcode = sigreturn_fdpic_tramp + retcode_idx * 12 + thumb;
>          } else {
>              retcode = ka->sa_restorer;
>          }
>      } else {

> -
> -        retcode = rc_addr + thumb;
> +        /* Each trampoline variant consumes 8-byte slot. */
> +        retcode = default_sigreturn + retcode_idx * 8 + thumb;

These 12 and 8 magic numbers correspond to the maximum sequence sizes
above...

> +void setup_sigtramp(abi_ulong sigtramp_page)
> +{
> +    enum {
> +        SIGFRAME_FDPIC_OFS = offsetof(struct sigframe, retcode[3]),
> +        RT_SIGFRAME_FDPIC_OFS = offsetof(struct rt_sigframe, retcode[3]),
> +    };
> +
> +    uint32_t total_size = 4 * 8 + 4 * 12;
> +    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, total_size, 0);
> +    uint32_t i = 0;
> +
> +    assert(tramp != NULL);
> +
> +    default_sigreturn = sigtramp_page;
> +    write_arm_sigreturn(&tramp[i], TARGET_NR_sigreturn);
> +    i += 2;
> +    write_thumb_sigreturn(&tramp[i], TARGET_NR_sigreturn);
> +    i += 2;
> +    write_arm_sigreturn(&tramp[i], TARGET_NR_rt_sigreturn);
> +    i += 2;
> +    write_thumb_sigreturn(&tramp[i], TARGET_NR_rt_sigreturn);
> +    i += 2;

...and these "+=2" and the "+=3" later do as well, but with
a count of 32-bit words rather than bytes. I think it would be
useful to at least have some defined constants for the lengths
rather than hard-coded 8,12,2,3, and comments that the write_
functions must not write more than however-many bytes.

> +
> +    /*
> +     * FDPIC require trampolines to call sa_restorer, and different
> +     * from the pc-relative versions we write to the stack.
> +     *
> +     * ARM versions use:
> +     *    ldr   r3, [sp, #ofs]
> +     *    ldr   r9, [r3, #4]
> +     *    ldr   pc, [r3, #0]

This comment doesn't match the code that write_arm_fdpic_sigreturn()
now generates. The "different from the pc-relative versions we
write from the stack" bit doesn't seem to be right either, given
we call the same functions in both places to write the code.

> +     *
> +     * Thumb versions use:
> +     *    ldr   r3, [sp, #ofs]
> +     *    ldmia r3, {r2, r3}
> +     *    mov   r9, r3
> +     *    bx    r2
> +     */
> +    sigreturn_fdpic_tramp = sigtramp_page + i * 4;
> +
> +    /* ARM sigframe */
> +    write_arm_fdpic_sigreturn(tramp + i,
> +                              offsetof(struct sigframe, retcode[3]));
> +    i += 3;
> +
> +    /* Thumb sigframe */
> +    write_thumb_fdpic_sigreturn(tramp + i,
> +                                offsetof(struct sigframe, retcode[3]));
> +    i += 3;
> +
> +    /* ARM rt_sigframe */
> +    write_arm_fdpic_sigreturn(tramp + i,
> +                              offsetof(struct rt_sigframe, retcode[3]));
> +    i += 3;
> +
> +    /* Thumb rt_sigframe */
> +    write_thumb_fdpic_sigreturn(tramp + i,
> +                                offsetof(struct rt_sigframe, retcode[3]));
> +    i += 3;
> +
> +    assert(i * 4 == total_size);
> +    unlock_user(tramp, sigtramp_page, total_size);
> +}
> --
> 2.25.1

thanks
-- PMM

