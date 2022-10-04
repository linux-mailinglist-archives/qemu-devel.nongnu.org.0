Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8375F3EF6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 10:57:25 +0200 (CEST)
Received: from localhost ([::1]:44344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofdju-0002KG-Mm
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 04:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ofdbC-0004aF-De
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:48:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ofdb8-000250-GS
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664873297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OJm2XtAPEaSkSyu0BlGdhOIWQQS2pwaFcS0nxTGISaw=;
 b=YB14v9XICyuwjjjsu3k7UMNk5q2+TB+VDelk0talsMhuS3ET8y3wwgeiS0mHaIxkJXcMdf
 6vlpeDD5nLLz+VzwTWchFlR0HIDFXmZxSTS5jlk5MHJI1UiHQmEGxIjmgMd4aJ7Bo5FsPH
 gio3+o5Ln7bFoQAV6C10uMHtvH9zlpI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-gMVwFbF7MCeL0aBBLxD7vQ-1; Tue, 04 Oct 2022 04:48:08 -0400
X-MC-Unique: gMVwFbF7MCeL0aBBLxD7vQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D504802801;
 Tue,  4 Oct 2022 08:48:08 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECD28C15BA4;
 Tue,  4 Oct 2022 08:48:06 +0000 (UTC)
Date: Tue, 4 Oct 2022 10:48:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 2/2] block: Refactor get_tmp_filename()
Message-ID: <YzvzRVCCSrZknZF4@redhat.com>
References: <20220928144125.1997128-1-bmeng.cn@gmail.com>
 <20220928144125.1997128-2-bmeng.cn@gmail.com>
 <YzbBM7Qc3p+Hiyvo@redhat.com>
 <CAEUhbmXH_y4ZuR2Z_HU2PoKX9A_P1VWUyF0eMVGbtvmvoPO4uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmXH_y4ZuR2Z_HU2PoKX9A_P1VWUyF0eMVGbtvmvoPO4uw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.10.2022 um 11:38 hat Bin Meng geschrieben:
> Hi Kevin,
> 
> On Fri, Sep 30, 2022 at 6:13 PM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 28.09.2022 um 16:41 hat Bin Meng geschrieben:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > At present there are two callers of get_tmp_filename() and they are
> > > inconsistent.
> > >
> > > One does:
> > >
> > >     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
> > >     char *tmp_filename = g_malloc0(PATH_MAX + 1);
> > >     ...
> > >     ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
> > >
> > > while the other does:
> > >
> > >     s->qcow_filename = g_malloc(PATH_MAX);
> > >     ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
> > >
> > > As we can see different 'size' arguments are passed. There are also
> > > platform specific implementations inside the function, and the use
> > > of snprintf is really undesirable.
> > >
> > > The function name is also misleading. It creates a temporary file,
> > > not just a filename.
> > >
> > > Refactor this routine by changing its name and signature to:
> > >
> > >     char *create_tmp_file(Error **errp)
> > >
> > > and use g_file_open_tmp() for a consistent implementation.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > > Changes in v5:
> > > - minor change in the commit message
> > > - add some notes in the function comment block
> > > - add g_autofree for tmp_filename
> > >
> > > Changes in v4:
> > > - Rename the function to create_tmp_file() and take "Error **errp" as
> > >   a parameter, so that callers can pass errp all the way down to this
> > >   routine.
> > > - Commit message updated to reflect the latest change
> > >
> > > Changes in v3:
> > > - Do not use errno directly, instead still let get_tmp_filename() return
> > >   a negative number to indicate error
> > >
> > > Changes in v2:
> > > - Use g_autofree and g_steal_pointer
> > >
> > >  include/block/block_int-common.h |  2 +-
> > >  block.c                          | 45 ++++++++++++--------------------
> > >  block/vvfat.c                    |  7 +++--
> > >  3 files changed, 20 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> > > index 8947abab76..d7c0a7e96f 100644
> > > --- a/include/block/block_int-common.h
> > > +++ b/include/block/block_int-common.h
> > > @@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
> > >  }
> > >
> > >  int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
> > > -int get_tmp_filename(char *filename, int size);
> > > +char *create_tmp_file(Error **errp);
> > >  void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
> > >                                        QDict *options);
> > >
> > > diff --git a/block.c b/block.c
> > > index 582c205307..bd3006d85d 100644
> > > --- a/block.c
> > > +++ b/block.c
> > > @@ -860,35 +860,25 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
> > >
> > >  /*
> > >   * Create a uniquely-named empty temporary file.
> > > - * Return 0 upon success, otherwise a negative errno value.
> > > + * Return the actual file name used upon success, otherwise NULL.
> > > + * This string should be freed with g_free() when not needed any longer.
> > > + *
> > > + * Note: creating a temporary file for the caller to (re)open is
> > > + * inherently racy. Use g_file_open_tmp() instead whenever practical.
> > >   */
> > > -int get_tmp_filename(char *filename, int size)
> > > +char *create_tmp_file(Error **errp)
> > >  {
> > > -#ifdef _WIN32
> > > -    char temp_dir[MAX_PATH];
> > > -    /* GetTempFileName requires that its output buffer (4th param)
> > > -       have length MAX_PATH or greater.  */
> > > -    assert(size >= MAX_PATH);
> > > -    return (GetTempPath(MAX_PATH, temp_dir)
> > > -            && GetTempFileName(temp_dir, "qem", 0, filename)
> >
> > We're using different prefixes on Windows and on Linux. This patch
> > unifies both paths to use the Linux name. Nobody should rely on the name
> > of temporary files, so there is hope it won't break anything.
> >
> > > -            ? 0 : -GetLastError());
> > > -#else
> > > +    g_autofree char *name = NULL;
> > > +    g_autoptr(GError) err = NULL;
> > >      int fd;
> > > -    const char *tmpdir;
> > > -    tmpdir = getenv("TMPDIR");
> > > -    if (!tmpdir) {
> > > -        tmpdir = "/var/tmp";
> > > -    }
> > > -    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
> > > -        return -EOVERFLOW;
> > > -    }
> > > -    fd = mkstemp(filename);
> > > +
> > > +    fd = g_file_open_tmp("vl.XXXXXX", &name, &err);
> >
> > This implicitly reverts commit 69bef7931e8, g_file_open_tmp() uses /tmp
> > as the default instead of /var/tmp as this function does before the
> > patch.
> 
> Oops, thanks for the pointer. Commit message of 69bef7931e8 does not
> explicitely explain why to change from /tmp to /var/tmp. Is that
> because QEMU block codes write a huge size of data to this file in
> /tmp?

Yes, this function is used to create temporary disk images (like for
-snapshot), so the files can become very large. /tmp is often a tmpfs
where as /var/tmp is usually on a disk, so more appropriate for disk
images.

> > This is probably not a good idea, we should keep the /var/tmp default.
> >
> > But if we did want to do this, it's definitely a change in behaviour
> > that should be mentioned in the commit message at least.
> >
> 
> If we have to keep /var/tmp, how about this?
> 
> diff --git a/block.c b/block.c
> index bd3006d85d..d964ceaeac 100644
> --- a/block.c
> +++ b/block.c
> @@ -24,6 +24,7 @@
>   */
> 
>  #include "qemu/osdep.h"
> +#include <glib/gstdio.h>
>  #include "block/trace.h"
>  #include "block/block_int.h"
>  #include "block/blockjob.h"
> @@ -878,7 +879,20 @@ char *create_tmp_file(Error **errp)
>          return NULL;
>      }
>      close(fd);
> +#ifdef _WIN32
>      return g_steal_pointer(&name);
> +#else
> +    g_autofree char *base = NULL;
> +    char *newname;
> +
> +    base = g_path_get_basename(name);
> +    newname = g_strdup_printf("/var/tmp/%s", base);
> +    if (g_rename(name, newname) < 0) {
> +        error_setg_errno(errp, -errno, "Could not create file");
> +        return NULL;
> +    }
> +    return newname;
> +#endif
>  }

I don't think this works correctly. It first finds an unused filename in
/tmp, and then uses that filename in /var/tmp without checking if it's
already in use there. It's also not simpler than the original code.

We should probably stick with g_mkstemp(), which however can be shared
between Windows and Linux. Just finding the directory is still going to
use an #ifdef.

But the more important point of your patch was the external interface of
the function anyway, and you can keep that as it is.

Kevin


