Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1BA538F13
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 12:31:49 +0200 (CEST)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvzAC-0004rM-4C
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 06:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nvz4p-0001II-Od
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:26:19 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:41976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nvz4l-0001fG-EI
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:26:15 -0400
Received: by mail-oi1-x234.google.com with SMTP id r206so9678082oib.8
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 03:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/EMzDV3P6GE2SwqZy1YojjtDw3/yVZK5pI6LTr0pcIg=;
 b=l0phhsw8kIylYbvDBP3SvLRsYiYMdUp4iMr5zgFCxSWyhBaiJCqd4/4yX5s1E46qaw
 Rys5fc3QGCgJWCZq0JraTGrkwMpB/4XIYnzIqgnyAKSn4N0I5qvGPDn4WiBKVcozy7tC
 PrbMc1jH5/AhgXv9ZoW3MXJVcc7tCeLbZRBA+cS1qp9HUwtMci/bo30l6xvumaJb+gv9
 OfpbEuWifIfCTbrEsLA7x4LgYA1FwWHc2PyhYclga83q7seJUvoDlqSQ88V1sG4TUH9o
 bkf462zmP4T60Q6u25uwPJZsuvOXQVwpZf2BTFZtpzNzKwbcVbT5AzZtD86f5Z34Z7bP
 6Z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/EMzDV3P6GE2SwqZy1YojjtDw3/yVZK5pI6LTr0pcIg=;
 b=avhITNs17iSIVVah4Hr1dZVaA+OjtJo3cCEiC/fcA1q1MJoebdjcOOamotrAMWMoBd
 JqIUjRGSaKGn6XZYma1DMVC2ZES8AQ888ntihAaosI55uJt405gJhiqxgf+7tD5fl/D3
 Q8wVZzfqmEtI2chBVe+hztTTFfU+/AcFFkYnX5LLDitjFCLEEgd91L8fLiOtIJDkwj+l
 0LfzeOzIJ3Lm7m2dw/G10N/aRFpo/XJNcd6WIgsYvnIEI4M98vrL5jSarnz8q6sSHuOv
 js6FjGNrBm6qrB1VLg3X4xyUveFGIddZnyjZYiX8PPQ8ZZRHEbYFFqRe1DWd1U9p7rjM
 K0gw==
X-Gm-Message-State: AOAM530BoD/BmyxAKCqhSGvx98umlo/JNMdlSkDPhZcPTAMZ0i3IDaOn
 ui3Ntfw8MMZQ33SHUdReqTX3sw8PjlxZ0ol+Dzw=
X-Google-Smtp-Source: ABdhPJxKvMHYNZku3Nn2EKQLC9Y0UbZJu9TcUQkuz+WRhiWYRALwmk3vbyhvahYkl2fTrX/5xjbxCR4zKc+vT+DeXq4=
X-Received: by 2002:a05:6808:3099:b0:32b:30de:d14e with SMTP id
 bl25-20020a056808309900b0032b30ded14emr10973774oib.212.1653992767730; Tue, 31
 May 2022 03:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220531084847.85889-1-faithilikerun@gmail.com>
In-Reply-To: <20220531084847.85889-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 31 May 2022 11:25:55 +0100
Message-ID: <CAJSP0QXEmN-SWkVjjA0hgBziMQHtVgs2KtKpJ_fq29KXLGM5OA@mail.gmail.com>
Subject: Re: [PATCH v5] Use io_uring_register_ring_fd() to skip fd operations
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=stefanha@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 May 2022 at 09:49, Sam Li <faithilikerun@gmail.com> wrote:
>
> Linux recently added a new io_uring(7) optimization API that QEMU
> doesn't take advantage of yet. The liburing library that QEMU uses
> has added a corresponding new API calling io_uring_register_ring_fd().
> When this API is called after creating the ring, the io_uring_submit()
> library function passes a flag to the io_uring_enter(2) syscall
> allowing it to skip the ring file descriptor fdget()/fdput()
> operations. This saves some CPU cycles.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/io_uring.c | 13 ++++++++++++-
>  meson.build      |  1 +
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/block/io_uring.c b/block/io_uring.c
> index 0b401512b9..4d691d8373 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -17,6 +17,9 @@
>  #include "qemu/coroutine.h"
>  #include "qapi/error.h"
>  #include "trace.h"
> +#ifdef CONFIG_LIBURING_REGISTER_RING_FD
> +    io_uring_register_ring_fd(&s->ring);
> +#endif

When CONFIG_LIBURING_REGISTER_RING_FD is defined the compiler will
report an error here since it is not possible to call a function at
the top level of a C source file.

There is already a io_uring_register_ring_fd() call inside
luring_init(), so this one can be removed from the patch. Please move
the #ifdef into luring_init() so io_uring_register_ring_fd() is only
called when the API is available.

>
>  /* io_uring ring size */
>  #define MAX_ENTRIES 128
> @@ -434,8 +437,16 @@ LuringState *luring_init(Error **errp)
>      }
>
>      ioq_init(&s->io_q);
> -    return s;
> +    if (io_uring_register_ring_fd(&s->ring) < 0) {
> +        /*
> +         * Only warn about this error: we will fallback to the non-optimized
> +         * io_uring operations.
> +         */
> +        error_reportf_err(*errp,
> +                          "failed to register linux io_uring ring file descriptor");

Returning a non-NULL LuringState while also setting errp is likely to
cause problems. QEMU's error_set() functions have assert(*errp ==
NULL) so the caller will abort later on if another error occurs after
luring_init() set errp. The Error API expects errp to be set zero or
one times, not more. Please use warn_report() instead, then errp won't
be involved.

> +    }
>
> +    return s;
>  }
>
>  void luring_cleanup(LuringState *s)
> diff --git a/meson.build b/meson.build
> index 9ebc00f032..927e6ec1a4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1733,6 +1733,7 @@ config_host_data.set('CONFIG_LIBNFS', libnfs.found())
>  config_host_data.set('CONFIG_LIBSSH', libssh.found())
>  config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
>  config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
> +config_host_data.set('CONFIG_LIBURING_REGISTER_RING_FD', cc.has_function('io_uring_register_ring_fd', prefix: '#include <liburing.h>'))

I checked build/meson-logs/meson-log.txt after compiling to see if
io_uring_register_ring_fd() was detected correctly. Detection always
fails because meson is compiling the test program without liburing
(there is a linker error because the io_uring_register_ring_fd symbol
cannot be found). This can be solved by adding a dependency on
linux_io_uring:

  config_host_data.set('CONFIG_LIBURING_REGISTER_RING_FD',
cc.has_function('io_uring_register_ring_fd', prefix: '#include
<liburing.h>', dependencies: linux_io_uring))

Stefan

