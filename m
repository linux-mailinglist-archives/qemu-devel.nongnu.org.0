Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4889658C4C3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 10:14:05 +0200 (CEST)
Received: from localhost ([::1]:47638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKxtZ-0000xy-J0
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 04:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKxm6-0004sU-Nm
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKxlz-00027G-Lc
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659945962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mDpA2vHu0nz28byx3zvoEi2wc1hgEj9pAzcFwKiYYso=;
 b=AWMQA2Lwhy2Wc2owtGj7VgvSDyKPdSCq+1DhSQTPYj+xZVR2uQccZprJWcAPAFdKbkBYD+
 Ah/Qz+RWlMvNxfVt4lu407ka88opCx0yNgC0jpmSU5MUiRFvdAIXl08YensarswLR5fvR9
 e/BSY2xZEmUUeGSJWxzx/4Q22dHQ+fg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-JKviJ68jNX-98YJVKbVyvQ-1; Mon, 08 Aug 2022 04:05:58 -0400
X-MC-Unique: JKviJ68jNX-98YJVKbVyvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FDE03804062;
 Mon,  8 Aug 2022 08:05:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EA8540CF8F2;
 Mon,  8 Aug 2022 08:05:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C1D521E6930; Mon,  8 Aug 2022 10:05:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Nikita Ivanov <nivanov@cloudlinux.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Christian Schoenebeck
 <qemu_oss@crudebyte.com>,  Greg Kurz <groug@kaod.org>,  Jason Wang
 <jasowang@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Konstantin
 Kostiuk <kkostiuk@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <4561100.0A2huPDW8y@silver>
 <CAMxuvayecf4pzKmjqB1AACD9OAc+5XY_88g=A9hm4qUq2SUm1A@mail.gmail.com>
 <CAFEAcA-ApDzJvYoWMP9un1p+bgNNe6g+J09QPfxUv4Ee=WMyeQ@mail.gmail.com>
 <CAAJ4Ao-P3ZUuvzEkqOrUuw9qUWtmf3JWmvxVqMs4+z4pdqz6qw@mail.gmail.com>
Date: Mon, 08 Aug 2022 10:05:56 +0200
In-Reply-To: <CAAJ4Ao-P3ZUuvzEkqOrUuw9qUWtmf3JWmvxVqMs4+z4pdqz6qw@mail.gmail.com>
 (Nikita Ivanov's message of "Mon, 8 Aug 2022 10:19:22 +0300")
Message-ID: <877d3jupln.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Nikita Ivanov <nivanov@cloudlinux.com> writes:

> Summing up the discussion above, I suggest the following patch for TFR()
> macro refactoring. (The patch is sequential to the first one I introduced
> in the start of the discussion).
>
>>From 6318bee052900aa93bba6620b53c7cb2290e5001 Mon Sep 17 00:00:00 2001
> From: Nikita Ivanov <nivanov@cloudlinux.com>
> Date: Mon, 8 Aug 2022 09:30:34 +0300
> Subject: [PATCH] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()
>
> glibc's unistd.h header provides the same macro with the
> subtle difference in type casting. Adjust macro name to the
> common standard and define conditionally.
>
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> ---
>  chardev/char-fd.c      |  2 +-
>  chardev/char-pipe.c    | 12 +++++++++---
>  hw/9pfs/9p-local.c     |  6 ++++--
>  include/qemu/osdep.h   |  6 ++++--
>  net/l2tpv3.c           |  8 +++++---
>  net/tap-linux.c        |  2 +-
>  net/tap.c              | 10 ++++++----
>  os-posix.c             |  2 +-
>  qga/commands-posix.c   |  2 +-
>  tests/qtest/libqtest.c |  2 +-
>  util/main-loop.c       |  2 +-
>  util/osdep.c           |  2 +-
>  12 files changed, 35 insertions(+), 21 deletions(-)
>
> diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> index cf78454841..7f5ed9aba3 100644
> --- a/chardev/char-fd.c
> +++ b/chardev/char-fd.c
> @@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags,
> Error **errp)
>  {
>      int fd = -1;
>
> -    TFR(fd = qemu_open_old(src, flags, 0666));
> +    TEMP_FAILURE_RETRY(fd = qemu_open_old(src, flags, 0666));
>      if (fd == -1) {
>          error_setg_file_open(errp, errno, src);
>      }
> diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> index 66d3b85091..aed97e306b 100644
> --- a/chardev/char-pipe.c
> +++ b/chardev/char-pipe.c
> @@ -131,8 +131,12 @@ static void qemu_chr_open_pipe(Chardev *chr,
>
>      filename_in = g_strdup_printf("%s.in", filename);
>      filename_out = g_strdup_printf("%s.out", filename);
> -    TFR(fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY));
> -    TFR(fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY));
> +    TEMP_FAILURE_RETRY(
> +        fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY)
> +    );
> +    TEMP_FAILURE_RETRY(
> +        fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY)
> +    );

Style question: do we want the ");" on its own line?  I think we
generally don't do that for function and function-like macro calls.

>      g_free(filename_in);
>      g_free(filename_out);
>      if (fd_in < 0 || fd_out < 0) {
> @@ -142,7 +146,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
>          if (fd_out >= 0) {
>              close(fd_out);
>          }
> -        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
> +        TEMP_FAILURE_RETRY(
> +            fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY)
> +        );
>          if (fd_in < 0) {
>              error_setg_file_open(errp, errno, filename);
>              return;
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index c90ab947ba..e803c05d0c 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -470,7 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
> V9fsPath *fs_path,
>          if (fd == -1) {
>              return -1;
>          }
> -        TFR(tsize = read(fd, (void *)buf, bufsz));
> +        TEMP_FAILURE_RETRY(tsize = read(fd, (void *)buf, bufsz));
>          close_preserve_errno(fd);
>      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
>                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> @@ -906,7 +906,9 @@ static int local_symlink(FsContext *fs_ctx, const char
> *oldpath,
>          }
>          /* Write the oldpath (target) to the file. */
>          oldpath_size = strlen(oldpath);
> -        TFR(write_size = write(fd, (void *)oldpath, oldpath_size));
> +        TEMP_FAILURE_RETRY(
> +            write_size = write(fd, (void *)oldpath, oldpath_size)
> +        );
>          close_preserve_errno(fd);
>
>          if (write_size != oldpath_size) {
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b1c161c035..55f2927d8b 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -242,8 +242,10 @@ void QEMU_ERROR("code path is reachable")
>  #if !defined(ESHUTDOWN)
>  #define ESHUTDOWN 4099
>  #endif
> -
> -#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
> +#if !defined(TEMP_FAILURE_RETRY)
> +#define TEMP_FAILURE_RETRY(expr) \
> +    do { if ((expr) != -1) break; } while (errno == EINTR)
> +#endif

GLibc's version is

   # define TEMP_FAILURE_RETRY(expression) \
     (__extension__							      \
       ({ long int __result;						      \
          do __result = (long int) (expression);				      \
          while (__result == -1L && errno == EINTR);			      \
          __result; }))

The difference isn't just "type casting", it's also statement
vs. expression.

Is it a good idea to have the macro expand into a statement on some
hosts, and into an expression on others?  Sure, CI should catch any uses
as expression, but delaying compile errors to CI wastes developer time.

>
>  /* time_t may be either 32 or 64 bits depending on the host OS, and
>   * can be either signed or unsigned, so we can't just hardcode a

[...]


