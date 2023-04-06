Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17AA6D9481
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:56:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkNGg-000766-CX; Thu, 06 Apr 2023 06:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pkNGe-00075s-5d
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:55:00 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pkNGc-00020p-Kp
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:54:59 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r187so45657130ybr.6
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680778497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1uDJwAyfQlBgbLL3t8rdVCuhnlRQyMicheeu/ap/hNc=;
 b=Z3BCAFxj9anefNHf4Z9Nx5KSq6PYKp2KX11Wf9KPvMIe0ocdIen8idYiVRuOgXvne0
 rtzvev4Mb4+2DJF3dNf04gc0UqbPgRPf+t2A9l6YZpzc8Pd3gx/TZdwPXeH8imsJRyW0
 +HuTbJOO0cuP5VWlMwNa1w5XwQJtweMqxPF6qEUSLShCI7YQfQV7AMOwdrurP1hFHaCX
 OLqC2bhMm6BXVSQnFA0sbfoC7ZpvzkRdExBgBjBjv8+VJJ3/nhUgoqLfpB9EvedgIcfu
 coo368KUvV9J0w9nFJ9+/iHdqTuWPjvUNRsMOnkobHo/6nmo3wCEPEYq9YZ8FQvWC7mt
 x4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680778497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1uDJwAyfQlBgbLL3t8rdVCuhnlRQyMicheeu/ap/hNc=;
 b=CiTSoibtZ3Ap+oTi9mChgH7RPjal1Z3pG33XG0LdiJPodb1tjNkID6n7CR58eMXi3P
 RsBxCqmIGhKHHaJv18uWjVpwSniAqanKWmJEvyJ4ggwey+/rk/avHZY1Nl6xQjKZdAVH
 oGGFy7neCg4HZBCiMX/y5NRfosVUbewdqYZy3R4qEKIPzTuKzQTPQGMjMkewqcDpDiUS
 iniRyUmCHjQfgBJGp2wEryEej6mSNl9CWnbiapI+cr8N+ZVWI8X1nzcmowdZsw7NyGeh
 DUOC/JNvO1A7mLOxR6yvNSqHPKiH2zum65azP+fbnLLbX48UmNDLlp4gcSJlaQncr9ZX
 ucdw==
X-Gm-Message-State: AAQBX9e0Rh2VwPF9PD9AejtdRlcnC8yQSZ7K8UmNBBJ8QSAxA+Qny98/
 fZd5wdodEzQ1Z4FeOqHbRNJOpmEQUMTbPSbaixw=
X-Google-Smtp-Source: AKy350ZbO1aE+ATdYuSCRc3BHO3lvsRww9DJPdgtIuT0Zj2gNUZKOHSeyPj7psDX1Z5DldzgGbrlYWDr8tk30SswwF4=
X-Received: by 2002:a25:7685:0:b0:b77:676c:773c with SMTP id
 r127-20020a257685000000b00b77676c773cmr1840064ybc.2.1680778497356; Thu, 06
 Apr 2023 03:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230406100759.240870-1-pbonzini@redhat.com>
In-Reply-To: <20230406100759.240870-1-pbonzini@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 6 Apr 2023 06:54:45 -0400
Message-ID: <CAJSP0QVkrcU=v77jjnLZsUN3eVKF4RyJ+aLT2_EV4hX=HfL6Vg@mail.gmail.com>
Subject: Re: [PATCH for-8.1] qemu-coroutine: remove qatomic_mb_read()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, 6 Apr 2023 at 06:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Replace with an explicit barrier and a comment.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-coroutine.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
> index 849452369201..17a88f65053e 100644
> --- a/util/qemu-coroutine.c
> +++ b/util/qemu-coroutine.c
> @@ -127,9 +127,13 @@ void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co)
>          Coroutine *to = QSIMPLEQ_FIRST(&pending);
>          CoroutineAction ret;
>
> -        /* Cannot rely on the read barrier for to in aio_co_wake(), as there are
> -         * callers outside of aio_co_wake() */
> -        const char *scheduled = qatomic_mb_read(&to->scheduled);
> +        /*
> +         * Read to before to->scheduled; pairs with qatomic_cmpxchg in
> +         * qemu_co_sleep(), aio_co_schedule() etc.
> +         */
> +        smp_read_barrier_depends();

I'm not a fan of nuanced memory ordering primitives. I don't
understand or remember all the primitives available in
docs/devel/atomics.rst and especially not how they interact with each
other.

Does smp_read_barrier_depends() make sense for QEMU? Does QEMU support
Alpha host CPUs?

Stefan

