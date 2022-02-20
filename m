Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4874BD205
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 22:29:44 +0100 (CET)
Received: from localhost ([::1]:59686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLtm3-00072h-Fk
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 16:29:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nLtks-0006M2-A6
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 16:28:30 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:54645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nLtkq-0008Rx-3z
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 16:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=4h9krFrmkFVibwx/Qpz5Uiufy1ASyEHy9Iy18FQ2wDg=; b=h+Lm1nS9vFiTnHCPxEwteXByll
 HtR/M0bHHZr04G5AsLbBrID6rNtfUetCO5hL8JRyAVcsQ4xT29/4dt8DSlotDrxemyqxhVe0XhbEY
 Djb9S4UUd4NDBToQj0Etg520ygecwCBcaBA64NX73nCJ0cKs+4tWE1kUYhEqVwwVcW73CpxnM1bHm
 hER08ZPOWPFg4PxdJLSR3+NelcbKH7mw7bInivGKARwR4HW8+3SnhupGciLypSKUyIU2HOgcAtran
 PUfqDHyA8hhv2app8v/hTN3G5C36PRCdFqHiPKn4re0TMIiItJ3Y+cxpzfxwkYXoM//ObwpB1tpr9
 BaPiff5EPH0tKxniXj/x3HXanQ2f9b00JqFD7yfiOH1sYOT7AK5pjgtcA2GH4xa7l8viMDmnsklAc
 P4CU9GQCNU4bQf8UnELL2Fbo+ZHv3VRGa+50fO2iPXg8R0V0XkXlLyob1ZceTFsB/uB79+QcW3wyB
 qin8JFF/Ii0PP/QOE1/dQrhMnIIgrJs2tQebAB2tHfhEFBWunmLZ/kHe7CL9R7HTrGNa9tTkYo/b2
 9ZVjvdZ/xi5HkisbeGEHLLiBOuFoY6mGtKi48veE+sx380GTFB9PBQUO5X/M19T37hZjt9ntiJ/Mx
 d4qYWVtsELNoOQt0a2tACfSkCGV2oDOOUSMZ7coDM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabian Franz <fabianfranz.oss@gmail.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v8 04/11] 9p: darwin: Handle struct dirent differences
Date: Sun, 20 Feb 2022 22:28:22 +0100
Message-ID: <2201050.uL7EZxoxRi@silver>
In-Reply-To: <20220220165056.72289-5-wwcohen@gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
 <20220220165056.72289-5-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sonntag, 20. Februar 2022 17:50:49 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> On darwin d_seekoff exists, but is optional and does not seem to
> be commonly used by file systems. Use `telldir` instead to obtain
> the seek offset and inject it into d_seekoff, and create a
> qemu_dirent_off helper to call it appropriately when appropriate.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Adjust to pass testing
>              - Ensure that d_seekoff is filled using telldir
>                on darwin, and create qemu_dirent_off helper
>                to decide which to access]
> [Fabian Franz: - Add telldir error handling for darwin]
> Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
> [Will Cohen: - Ensure that telldir error handling uses
>                signed int
>              - Cleanup of telldir error handling
>              - Remove superfluous error handling for
>                qemu_dirent_off
>              - Adjust formatting
>              - Use qemu_dirent_off in codir.c]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---

This patch does not compile on Linux ...

>  hw/9pfs/9p-local.c |  9 +++++++++
>  hw/9pfs/9p-proxy.c | 16 +++++++++++++++-
>  hw/9pfs/9p-synth.c |  4 ++++
>  hw/9pfs/9p-util.h  | 16 ++++++++++++++++
>  hw/9pfs/9p.c       |  7 +++++--
>  hw/9pfs/codir.c    |  4 +++-
>  6 files changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index 1a5e3eed73..f3272f0b43 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -562,6 +562,15 @@ again:
>      if (!entry) {
>          return NULL;
>      }
> +#ifdef CONFIG_DARWIN
> +    int off;
> +    off = telldir(fs->dir.stream);
> +    /* If telldir fails, fail the entire readdir call */
> +    if (off < 0) {
> +        return NULL;
> +    }
> +    entry->d_seekoff = off;
> +#endif
> 
>      if (ctx->export_flags & V9FS_SM_MAPPED) {
>          entry->d_type = DT_UNKNOWN;
> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> index b1664080d8..8b4b5cf7dc 100644
> --- a/hw/9pfs/9p-proxy.c
> +++ b/hw/9pfs/9p-proxy.c
> @@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx,
> V9fsFidOpenState *fs)
> 
>  static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenState *fs)
>  {
> -    return readdir(fs->dir.stream);
> +    struct dirent *entry;
> +    entry = readdir(fs->dir.stream);
> +#ifdef CONFIG_DARWIN
> +    if (!entry) {
> +        return NULL;
> +    }
> +    int td;
> +    td = telldir(fs->dir.stream);
> +    /* If telldir fails, fail the entire readdir call */
> +    if (td < 0) {
> +        return NULL;
> +    }
> +    entry->d_seekoff = td;
> +#endif
> +    return entry;
>  }
> 
>  static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index bf9b0c5ddd..b3080e415b 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -234,7 +234,11 @@ static void synth_direntry(V9fsSynthNode *node,
>               offsetof(struct dirent, d_name) + sz);
>      memcpy(entry->d_name, node->name, sz);
>      entry->d_ino = node->attr->inode;
> +#ifdef CONFIG_DARWIN
> +    entry->d_seekoff = off + 1;
> +#else
>      entry->d_off = off + 1;
> +#endif
>  }
> 
>  static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 546f46dc7d..d41f37f085 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -79,3 +79,19 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char
> *filename, const char *name);
> 
>  #endif

... ^- this is the end of file #endif, so qemu_dirent_off() should be above 
that #endif, and ...

> +
> +
> +/**
> + * Darwin has d_seekoff, which appears to function similarly to d_off.
> + * However, it does not appear to be supported on all file systems,
> + * so ensure it is manually injected earlier and call here when
> + * needed.
> + */
> +inline off_t qemu_dirent_off(struct dirent *dent)

... this function declaration misses the 'static' keyword, which is mandatory 
to prevent a linker error.

Best regards,
Christian Schoenebeck

> +{
> +#ifdef CONFIG_DARWIN
> +    return dent->d_seekoff;
> +#else
> +    return dent->d_off;
> +#endif
> +}
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 1563d7b7c6..caf3b240fe 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -27,6 +27,7 @@
>  #include "virtio-9p.h"
>  #include "fsdev/qemu-fsdev.h"
>  #include "9p-xattr.h"
> +#include "9p-util.h"
>  #include "coth.h"
>  #include "trace.h"
>  #include "migration/blocker.h"
> @@ -2281,7 +2282,7 @@ static int coroutine_fn
> v9fs_do_readdir_with_stat(V9fsPDU *pdu, count += len;
>          v9fs_stat_free(&v9stat);
>          v9fs_path_free(&path);
> -        saved_dir_pos = dent->d_off;
> +        saved_dir_pos = qemu_dirent_off(dent);
>      }
> 
>      v9fs_readdir_unlock(&fidp->fs.dir);
> @@ -2420,6 +2421,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu,
> V9fsFidState *fidp, V9fsString name;
>      int len, err = 0;
>      int32_t count = 0;
> +    off_t off;
>      struct dirent *dent;
>      struct stat *st;
>      struct V9fsDirEnt *entries = NULL;
> @@ -2480,12 +2482,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> *pdu, V9fsFidState *fidp, qid.version = 0;
>          }
> 
> +        off = qemu_dirent_off(dent);
>          v9fs_string_init(&name);
>          v9fs_string_sprintf(&name, "%s", dent->d_name);
> 
>          /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count) */
>          len = pdu_marshal(pdu, 11 + count, "Qqbs",
> -                          &qid, dent->d_off,
> +                          &qid, off,
>                            dent->d_type, &name);
> 
>          v9fs_string_free(&name);
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index c0873bde16..f96d8ac4e6 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -22,6 +22,8 @@
>  #include "qemu/coroutine.h"
>  #include "qemu/main-loop.h"
>  #include "coth.h"
> +#include "9p-xattr.h"
> +#include "9p-util.h"
> 
>  /*
>   * Intended to be called from bottom-half (e.g. background I/O thread)
> @@ -166,7 +168,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> *fidp, }
> 
>          size += len;
> -        saved_dir_pos = dent->d_off;
> +        saved_dir_pos = qemu_dirent_off(dent);
>      }
> 
>      /* restore (last) saved position */



