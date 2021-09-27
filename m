Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0FA4195D9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:03:08 +0200 (CEST)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrDn-0003vq-4Y
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqua-00077G-7n
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:43:16 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUquX-0002LL-KE
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:43:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s21so12028545wra.7
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R2zZD6H5cCueOh//uhLyeKHYl1oIpTBHM+CBLID5bDc=;
 b=vV9Gl2OuIJsIF8PHb9rdMXYaZwmG524fHWfM6FZ0g0oFrOr3W8x9hikAM+wH+FpNWu
 g2VlpkBw4yrBE08G+AdBGjdFORwhs00+bopj/U5WfwRJmzfPdmMByzmN4JcjcSF2vv2l
 OEjL+6y6/hgqh4DMAumHhTAhFu3QeR5eAt906vtLzUuV6uM8Ry9b9gISyRbjuNtQ2PWy
 35A+mcmmxGKtaBwrjq8zkwJ+jvtRlcr4+myqD+9fJeAg7cjA6NFrHJpYuiFcEja+Tjlz
 Y7Pe28YpsAoaHar7jQZ43nJuYab1wOTWtMgqBWIdUtR9SjoP+4lf4v7gRdD/8m5/YZfC
 D8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R2zZD6H5cCueOh//uhLyeKHYl1oIpTBHM+CBLID5bDc=;
 b=c1jWJ88CvWerJUsVvKJxKxsU7AT65f/9Sh++dGsuLKdcpjqIB+xu5CHHw710uIS+bs
 AJK8Q03MXOHWBlMKer804UBrrPPoy67E/b43wH3SyCRym/Txde+lH8u4UHPLCeUv1FC6
 frBlzgQzGJ2tcFMqPHdpxM6ZvBKzk2vWBC+eRR3eUEJGcPw4zUwbLzGvZByu7LVnStD6
 vzQTYak6YmdvxxE5PnwgiNjk0dLsUpjdLzm8qvvgqmAl5Em4WODmjoxSAnju++mNvBSD
 Wp+V+fxWfHBUBW+HKxLAQYQOJ1x8rNpECyCrtHrOapiunZUi/TndngbgupAjGSjvuRUe
 9Zow==
X-Gm-Message-State: AOAM532DKDWWRR/y9Yzdr3U9gPy1TrXnYfr3hVn7HHHK0q52/8yTL5r0
 SuJuhBKnWlZ+JXjBwQq0Id4KUniOrT5SpUujTikBOA==
X-Google-Smtp-Source: ABdhPJxm5gB4hb7jKOHiCRski1yK1wOXzPc0Bc6R0r8ZMZxauz2Z11xnUPUAZllvbrIPD5QjXNezUVOROgf9eNPgzmE=
X-Received: by 2002:adf:f185:: with SMTP id h5mr28760659wro.302.1632750192023; 
 Mon, 27 Sep 2021 06:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <mvm4kadwyrm.fsf@suse.de>
In-Reply-To: <mvm4kadwyrm.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 14:42:18 +0100
Message-ID: <CAFEAcA-Dj2fpB2O50ywBmsxd8Us6gi7umbDxBLmW1=3kFd50uA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/syscall: add support for CLONE_PIDFD
To: Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sept 2021 at 19:50, Andreas Schwab <schwab@suse.de> wrote:
>
> Add basic support for CLONE_PIDFD, only fork-like clone without additional
> flags.  This is enough to make Qt/forkfd working.
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  linux-user/syscall.c | 52 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 2 deletions(-)

>  /* We can't directly call the host clone syscall, because this will
>   * badly confuse libc (breaking mutexes, for example). So we must

So, this pre-existing comment says "we can't directly call the
host clone syscall"...

> +#if defined __NR_clone2
> +#define __NR_sys_clone2 __NR_clone2
> +_syscall6(int, sys_clone2, int, flags, void *, child_stack, size_t, stack_size,
> +          int *, ptid, int *, ctid, void *, newtls);
> +#else
> +#define __NR_sys_clone __NR_clone
> +#if defined __cris__ || defined __s390x__
> +_syscall5(int, sys_clone, void *, child_stack, int, flags, int *, ptid,
> +          void *, newtls, int *, ctid);
> +#elif defined __microblaze__
> +_syscall6(int, sys_clone, int, flags, void *, child_stack, size_t, stack_size,
> +          int *, ptid, void *, newtls, int *, ctid);
> +#else
> +/*
> + * Note: ctid and newtls are swapped on some architectures, but both are
> + * passed as NULL only for now.
> + */
> +_syscall5(int, sys_clone, int, flags, void *, child_stack, int *, ptid,
> +          int *, ctid, void *, newtls);
> +#endif
> +#endif
> +static int sys_clone_pidfd(int flags, int *pidfd)
> +{
> +#ifdef __NR_clone2
> +    return sys_clone2(flags, NULL, 0, pidfd, NULL, NULL);
> +#elif defined __cris__ || defined __s390x__
> +    return sys_clone(NULL, flags, pidfd, NULL, NULL);
> +#elif defined __microblaze__
> +    return sys_clone(flags, NULL, 0, pidfd, NULL, NULL);
> +#else
> +    return sys_clone(flags, NULL, pidfd, NULL, NULL);
> +#endif
> +}

...but this patch introduces code which directly calls the host
clone syscall.

I think this ought to have a bit more explanation and updating
of the existing comments to explain why this is OK.

thanks
-- PMM

