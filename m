Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13A262F669
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 14:39:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow1a9-00070A-CY; Fri, 18 Nov 2022 08:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ow1a2-0006zm-3W
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 08:38:54 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ow1a0-0002Pm-Bc
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 08:38:53 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a14so9323708wru.5
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 05:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oY7crN5UWIbMPhyxLx4QCCwWRB8ADkTQ9q4lHBWz+5U=;
 b=kkYSMkpNVErwv32IPSHgEbxaPmyGKWxDr0gGRW5HdvhwfhxjYjnyM7RSuvgPrWaNwr
 BAkLnetPQN+45StwZ096+XyyeylaOZ+QA+s8yV6qTK3ySjs9qP4LQ+YZZBqNrnXF5dSY
 fPG1pQa3oZmVQBgS4TXIhK5hvX2qYPvxvXzLTgJC2hfihp50TMQGzKJJfn6CDE7nU9P/
 Ts2+KEpwMamgXTV+IdzvtTnLhj2CZquZRhfvnqOnHauJtoYcopAuXA0G15WzArgAp24P
 jkZv6zZ25knKyFuwOvFjxiv6gjg8AU78GXqTpx7+CevlSwjiFU20dHZX2OVgsg4JzH7W
 U7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oY7crN5UWIbMPhyxLx4QCCwWRB8ADkTQ9q4lHBWz+5U=;
 b=0ErKhrTlkAFDlADxR4E6h9RzVI8krQwGgj5VvRlMxaFOjsxKJfuu00uEd1txRYI7SY
 zSzzP+BumEtKN2uHZoXY/zBuP6eqL8xi4qMxKxrRT1CvRtRtOghK1Iglk6OElo6zhpXv
 zmJJKRGjhbLhO3cyYHr5gUDxcB5vFeMMrmInwCPxwIJG/isjU7JJYKUhvY5sL46O4917
 /beaeaeFglcLoGeoB4OsVhsGWoj27XIecgJVfYC9XYDYyAmclJuplhuxUyh8Dbw1hGWk
 5zI22vXGO57L6PQ78lUOLQCk8wdgM8CDQfqllDWU1sOj89/QDo1n93UzPR5cjcw9vZVw
 YLsA==
X-Gm-Message-State: ANoB5pl0LeO7duz0aA2p41NKwnFpDX9y1UNg2HWmFfXexgw3uaKFU3vl
 qddpZKMk13jAfKJPWIxdPPgriA==
X-Google-Smtp-Source: AA0mqf6Ow0cMtNPCHVNseLUNkAmFZpN7mczjgKIV+bOsTbsidQI6QraVDLr+DFETAJ6SzjkzyzKn6w==
X-Received: by 2002:a5d:4a06:0:b0:22e:398:d533 with SMTP id
 m6-20020a5d4a06000000b0022e0398d533mr4415246wrq.410.1668778730681; 
 Fri, 18 Nov 2022 05:38:50 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003c6bbe910fdsm12438605wms.9.2022.11.18.05.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 05:38:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66A551FFB7;
 Fri, 18 Nov 2022 13:38:49 +0000 (GMT)
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0 1/7] qemu/main-loop: Introduce
 QEMU_IOTHREAD_LOCK_GUARD
Date: Fri, 18 Nov 2022 13:38:04 +0000
In-reply-to: <20221118091858.242569-2-richard.henderson@linaro.org>
Message-ID: <87fseg757a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Oh hang on, what black magic is this. Does the compiler do a NULL check
before calling the cleanup?

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

