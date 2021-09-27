Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98F3419593
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:57:59 +0200 (CEST)
Received: from localhost ([::1]:37912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUr8o-00082n-QF
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqev-0000QS-GM
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:27:05 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqep-0008BC-05
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:27:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so567948wmc.0
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 06:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kLqmqM6sLjK84ND+uPa22MWA49EKwYsrT/lOFA7DTSw=;
 b=cN1TeeVK5ObWDgD+e2Nw2wH9QDjYSI9A+ESSnANT8pRdObASmFKUNbJsLTCfc66Y1r
 UBlhdNw1RWwtCQIn1qQxbORXokc3C1sUsuToWYajfBFCBonFVoM6UfGqItc59cMyG4Zd
 k2ii8BsgA0Gwh0KlqW7IJfw2vF+P2lSrJHzE1p/pT4zprO2451C69qNC0KA4X6+qkjbN
 OYXRS/V+x1pxkaIhrXWzR9coAN+QH0p+oE/JYTjlWpXYBepsg2JnrQ8dT4lhaGw2br+L
 W108hkQIGYR40I97/A/EH3isbE73JXb6ykJ8SgOOz/md42hW36WDPjxNCX26TzbzVvFp
 ag7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kLqmqM6sLjK84ND+uPa22MWA49EKwYsrT/lOFA7DTSw=;
 b=i5fHKc29zGKd+SffFLl01Rov5nR0WZMGJJzOpkQhkGksSsgqBZTm1kxMy4Ay7NG9QY
 L8z8EXQvaKcM+Z/Q5BwbhvXlJhtDbxDewVTUkRMJs8y8cQo8AzKCH0ioCi+10QX+8HPv
 obzCKVTOhfJA58lljTIY7f1egs6ABgZ8BDesUM8BIDZRujLe/jfk9GDu7uIq+Eu8RErp
 WFD2gHl5Oc2d7I+N1uKINQqx8Vw2l2ikzgkpYnrXyfS7AyrVgieBKBaox2v7aUCazNtF
 02Tw7lY+3InM8bb6t2iO9UVfHdSrRYMtCRNSUzZ8F1DMVf4dEs0peVfl5/3lZ0cgdy9c
 NhoQ==
X-Gm-Message-State: AOAM530TIxvy6dccQynIO2ZfxO/HHXHX9JChKEuQRTuCuc3jejuecvUy
 rJgKwHPmQ0Tzp/6xQU/7nZ57IIwi+fDGHkiM1quRwQ==
X-Google-Smtp-Source: ABdhPJwgNREDQwkGChP5Fe7qgZKfV5dxv4QpyQgi3bTZ0Y97Z2gMDui7RfwmmCY6e7nmrCHNc4JS2+O0Bh6TutwpoT8=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr15762043wmi.37.1632749217265; 
 Mon, 27 Sep 2021 06:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-18-richard.henderson@linaro.org>
In-Reply-To: <20210924165926.752809-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 14:26:04 +0100
Message-ID: <CAFEAcA9+KnOeibG+uyyZdtKaCUuE_--F23mFeFy3Jo08aT8XaA@mail.gmail.com>
Subject: Re: [PATCH v3 17/27] linux-user/nios2: Map a real kuser page
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
> The first word of page1 is data, so the whole thing
> can't be implemented with emulation of addresses.
>
> Hijack trap number 31 to implement cmpxchg.

31 is used -- it's "breakpoint". We need to pick something else...

>
> Set default_rt_sigreturn based on the kuser page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/target_signal.h |  3 ++
>  linux-user/elfload.c             | 35 ++++++++++++++++++++++
>  linux-user/nios2/cpu_loop.c      | 51 +++++++++++++++++---------------
>  linux-user/nios2/signal.c        |  2 +-
>  target/nios2/translate.c         |  9 ------
>  5 files changed, 66 insertions(+), 34 deletions(-)
>
> diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
> index aebf749f12..fe266c4c51 100644
> --- a/linux-user/nios2/target_signal.h
> +++ b/linux-user/nios2/target_signal.h
> @@ -19,4 +19,7 @@ typedef struct target_sigaltstack {
>
>  #include "../generic/signal.h"
>
> +/* Nios2 uses a fixed address on the kuser page for sigreturn. */
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
> +
>  #endif /* NIOS2_TARGET_SIGNAL_H */
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 459a26ef1d..7b3a91b3ed 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1100,6 +1100,41 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMBState *env
>
>  static void init_thread(struct target_pt_regs *regs, struct image_info *infop)
>  {
> +    static const uint8_t kuser_page[4 + 2 * 64] = {
> +        /* __kuser_helper_version */
> +        [0x00] = 0x02, 0x00, 0x00, 0x00,
> +
> +        /* __kuser_cmpxchg */
> +        [0x04] = 0xfa, 0x6f, 0x3b, 0x00,  /* trap 31 */
> +                 0x3a, 0x28, 0x00, 0xf8,  /* ret */
> +
> +        /* __kuser_sigtramp */
> +        [0x44] = 0xc4, 0x22, 0x80, 0x00,  /* movi r2, __NR_rt_sigreturn */
> +                 0x3a, 0x68, 0x3b, 0x00,  /* trap 0 */
> +    };
> +
> +    abi_ulong pg;
> +    uint8_t *ph;
> +
> +    pg = target_mmap(TARGET_PAGE_SIZE, TARGET_PAGE_SIZE,
> +                     PROT_READ | PROT_WRITE,
> +                     MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
> +
> +    /*
> +     * If the mmap doesn't give us exactly page 1, there's nothing
> +     * we can do, and it's unlikely that the program will be able
> +     * to continue.  FIXME: Error out now?
> +     */
> +    assert(pg == TARGET_PAGE_SIZE);

Shouldn't we be doing this via the probe_guest_base machinery
the way we do for the Arm commpage ?

> +
> +    ph = lock_user(VERIFY_WRITE, pg, sizeof(kuser_page), 0);
> +    memcpy(ph, kuser_page, sizeof(kuser_page));
> +    unlock_user(ph, pg, sizeof(kuser_page));
> +    target_mprotect(TARGET_PAGE_SIZE, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
> +
> +    /* Install __kuser_sigtramp */
> +    default_rt_sigreturn = TARGET_PAGE_SIZE + 0x44;
> +
>      regs->ea = infop->entry;
>      regs->sp = infop->start_stack;
>      regs->estatus = 0x3;

-- PMM

