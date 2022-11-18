Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B803F62F65B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 14:37:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow1XF-0005oL-Vr; Fri, 18 Nov 2022 08:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ow1XD-0005mv-Gr
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 08:35:59 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ow1XB-0002AG-SU
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 08:35:59 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso4035319wms.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 05:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfsl3Yd9BlilArSnhcbQL5hUY0D86GduvfNz5zHAm98=;
 b=zqy09A9j+OhgRUgdvJbVPS1SQ7LucpQYIZuLyk0kD7PaxiIESkJKEe1WPf+Ql5zdq2
 lGe9oBUK68EbgyGRM47p7bAYzN8Lig1m+prKkZdwV91j+bnSrIW+vzI9U2T6IkZn0UJb
 4rVw/c+435gX+Mg8iBmzTYNKylRIHIDHU+bf9s/zJhvAm/NPZ8Rq5LTKztEwzjPvHiMu
 FnxeQ1Op5gBoVgwEBZx6rlquetr1DgMkjFN3rWs7ZOpN1x2LRZDjdLJUn6cl5e8ruZnK
 V3mevSYwJeVzuBgBe9ini1/Hs7Rs3BfRjj5fBje/d2X6C2YAiUI9G9oEZUq8zLD9wDTr
 BlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gfsl3Yd9BlilArSnhcbQL5hUY0D86GduvfNz5zHAm98=;
 b=GE2vIao/5azBNcLtIsOSUvSswjGewjoanTAGsrn/jJoI10kVQlY4bUAgws/Zno5abr
 HW7RbXq2wT+jYmrT/Wd9Gb0ntPw1LurUihL9Rf/hBCBSX310mCDlAus+AhND4wbdv6NG
 wUm1vxdK58ONfiqY9WUFUJpo0dm14JjoLrX3UoxDaGi4wgDN9ckSFlOcK/Ll0QP8d4xL
 IgSk+5tHSsrCAOuI8YnuDc2HoT2i3KrM4nw0RsX25HBrdXecMWaZ9EFqISR6UZR69jYy
 hnuE4mUdvuDV4LZGzk4mQCuEJ27s6NYhWo2FZTdGT6uADJ/IiD3bAd1LqPcSpj0jrzTg
 q9DA==
X-Gm-Message-State: ANoB5pnB9isvNIly0hIUBZCPr2JE+nQDVb3i+Umxsr/JSzNi3cPkAkwF
 mBRm8WaIfQRR0ZOrDZX6Yafydw==
X-Google-Smtp-Source: AA0mqf51aDgf9MdnA+wsaNrjcQKnfBmIk9rOg3AB/3coQPB9byqc7Crpb4nOMxqS5Rf7vS4ZgYh86A==
X-Received: by 2002:a7b:c5d1:0:b0:3cf:4c20:b1e4 with SMTP id
 n17-20020a7bc5d1000000b003cf4c20b1e4mr8519803wmk.132.1668778555775; 
 Fri, 18 Nov 2022 05:35:55 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1c7c02000000b003b4935f04a4sm5364008wmc.5.2022.11.18.05.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 05:35:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 71A001FFB7;
 Fri, 18 Nov 2022 13:35:54 +0000 (GMT)
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0 1/7] qemu/main-loop: Introduce
 QEMU_IOTHREAD_LOCK_GUARD
Date: Fri, 18 Nov 2022 13:30:15 +0000
In-reply-to: <20221118091858.242569-2-richard.henderson@linaro.org>
Message-ID: <87k03s75c5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Create a wrapper for locking/unlocking the iothread lock.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com> (maintainer:Main loop)

You might want to review Paolo's comments from:

  Subject: [RFC PATCH] main-loop: introduce WITH_QEMU_IOTHREAD_LOCK
  Date: Mon, 24 Oct 2022 18:19:09 +0100
  Message-Id: <20221024171909.434818-1-alex.bennee@linaro.org>

So it would be worth having the WITH_QEMU_IOTHREAD_LOCK() and
MAYBE_WITH_QEMU_IOTHREAD_LOCK() helpers for completeness.

And of course the name cleanup.

> ---
>  include/qemu/main-loop.h | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index 3c9a9a982d..c25f390696 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -343,6 +343,35 @@ void qemu_mutex_lock_iothread_impl(const char *file,=
 int line);
>   */
>  void qemu_mutex_unlock_iothread(void);
>=20=20
> +/**
> + * QEMU_IOTHREAD_LOCK_GUARD
> + *
> + * Wrap a block of code in a conditional qemu_mutex_{lock,unlock}_iothre=
ad.
> + */
> +typedef struct IOThreadLockAuto IOThreadLockAuto;
> +
> +static inline IOThreadLockAuto *qemu_iothread_auto_lock(const char *file,
> +                                                        int line)
> +{
> +    if (qemu_mutex_iothread_locked()) {
> +        return NULL;
> +    }
> +    qemu_mutex_lock_iothread_impl(file, line);
> +    /* Anything non-NULL causes the cleanup function to be called */
> +    return (IOThreadLockAuto *)(uintptr_t)1;
> +}
> +
> +static inline void qemu_iothread_auto_unlock(IOThreadLockAuto *l)
> +{
> +    qemu_mutex_unlock_iothread();
> +}
> +
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(IOThreadLockAuto, qemu_iothread_auto_unloc=
k)
> +
> +#define QEMU_IOTHREAD_LOCK_GUARD() \
> +    g_autoptr(IOThreadLockAuto) _iothread_lock_auto __attribute__((unuse=
d)) \
> +        =3D qemu_iothread_auto_lock(__FILE__, __LINE__)
> +
>  /*
>   * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
>   *


--=20
Alex Benn=C3=A9e

