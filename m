Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCD85EA19C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:53:20 +0200 (CEST)
Received: from localhost ([::1]:52908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocljj-0006gz-7U
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ocl7Z-0005Tf-7Y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 06:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ocl7U-0006Vs-6w
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 06:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664187227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tYkvxMTtcIzb5d6CT7Ny5z9gSHHyGZ8TM+z4tOYsNic=;
 b=P8SJ23FmyHhJGpLyJh/BGMmeauFSDpJOynNOfdL8dP7h502D3vH8624ySut57JlT2gLnuP
 IBK0dyD+tLzb5DH75JXPYmeSLUH2GnGlPDA7KxXRrLi4nlq95MjDnvoyj4Xmr5CzPUqgGC
 LaP7ecE032oyKjIeMbDUtHLJd3dw/3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-rBjCbXMvPBuhtzYdAQBmlQ-1; Mon, 26 Sep 2022 06:13:44 -0400
X-MC-Unique: rBjCbXMvPBuhtzYdAQBmlQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EA83185A7A8;
 Mon, 26 Sep 2022 10:13:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E92C492B04;
 Mon, 26 Sep 2022 10:13:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3DCF421E691D; Mon, 26 Sep 2022 12:13:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Bin Meng <bin.meng@windriver.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2] block: Refactor get_tmp_filename()
References: <20220924114544.1906498-1-bmeng.cn@gmail.com>
Date: Mon, 26 Sep 2022 12:13:40 +0200
In-Reply-To: <20220924114544.1906498-1-bmeng.cn@gmail.com> (Bin Meng's message
 of "Sat, 24 Sep 2022 19:45:44 +0800")
Message-ID: <87edvya1ez.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present there are two callers of get_tmp_filename() and they are
> inconsistent.
>
> One does:
>
>     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
>     char *tmp_filename = g_malloc0(PATH_MAX + 1);
>     ...
>     ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
>
> while the other does:
>
>     s->qcow_filename = g_malloc(PATH_MAX);
>     ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
>
> As we can see different 'size' arguments are passed. There are also
> platform specific implementations inside the function, and this use
> of snprintf is really undesirable.
>
> Refactor this routine by changing its signature to:
>
>     char *get_tmp_filename(void)
>
> and use g_file_open_tmp() for a consistent implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v2:
> - Use g_autofree and g_steal_pointer
>
>  include/block/block_int-common.h |  2 +-
>  block.c                          | 42 ++++++++++----------------------
>  block/vvfat.c                    |  8 +++---
>  3 files changed, 18 insertions(+), 34 deletions(-)
>
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 8947abab76..ea69a9349c 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
>  }
>  
>  int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
> -int get_tmp_filename(char *filename, int size);
> +char *get_tmp_filename(void);
>  void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
>                                        QDict *options);
>  
> diff --git a/block.c b/block.c
> index bc85f46eed..4e7a795566 100644
> --- a/block.c
> +++ b/block.c
> @@ -860,38 +860,23 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
>  
>  /*
>   * Create a uniquely-named empty temporary file.
> - * Return 0 upon success, otherwise a negative errno value.
> + * Return the actual name used upon success, otherwise NULL.
> + * The called function is responsible for freeing it.
>   */
> -int get_tmp_filename(char *filename, int size)
> +char *get_tmp_filename(void)
>  {
> -#ifdef _WIN32
> -    char temp_dir[MAX_PATH];
> -    /* GetTempFileName requires that its output buffer (4th param)
> -       have length MAX_PATH or greater.  */
> -    assert(size >= MAX_PATH);
> -    return (GetTempPath(MAX_PATH, temp_dir)
> -            && GetTempFileName(temp_dir, "qem", 0, filename)
> -            ? 0 : -GetLastError());
> -#else
> +    g_autofree char *filename = NULL;
>      int fd;
> -    const char *tmpdir;
> -    tmpdir = getenv("TMPDIR");
> -    if (!tmpdir) {
> -        tmpdir = "/var/tmp";
> -    }
> -    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
> -        return -EOVERFLOW;
> -    }
> -    fd = mkstemp(filename);
> +
> +    fd = g_file_open_tmp("vl.XXXXXX", &filename, NULL);
>      if (fd < 0) {
> -        return -errno;
> +        return NULL;
>      }
>      if (close(fd) != 0) {
>          unlink(filename);
> -        return -errno;
> +        return NULL;
>      }
> -    return 0;
> -#endif
> +    return g_steal_pointer(&filename);
>  }

Oh my, what a lovely mess you're messing with!

The function creates a temporary *file*, not just a filename.  Makes
sense, as creating a unique filename is inherently racy.  The contract
is clear enough ("Create a uniquely-named empty temporary file"), but
the function name is actively misleading.

Of course, creating a temporary file for the caller to (re)open is also
racy.  By the time the caller gets around to it, the filename could name
anything.  Return an open file file descriptor is a better idea.  It's
basically g_file_open_tmp().  Could we rework the two users of
get_tmp_filename() accept a file descriptor?

Anyway, code after the patch:

   /*
    * Create a uniquely-named empty temporary file.
    * Return the actual name used upon success, otherwise NULL.
    * The called function is responsible for freeing it.
    */
   char *get_tmp_filename(void)
   {
       g_autofree char *filename = NULL;
       int fd;

       fd = g_file_open_tmp("vl.XXXXXX", &filename, NULL);
       if (fd < 0) {

As Philippe wrote, this throws away possibly useful error information.

           return NULL;
       }
       if (close(fd) != 0) {
           unlink(filename);
           return NULL;
       }
       return g_steal_pointer(&filename);
   }

Other than that, it's an improvement within the limits of a flawed
interface.

[...]


