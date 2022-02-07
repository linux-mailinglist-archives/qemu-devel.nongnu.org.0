Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B44AC2CC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:19:12 +0100 (CET)
Received: from localhost ([::1]:37404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5nJ-0000sU-Ry
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:19:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH5Cz-00076b-6L
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:41:37 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:49167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH5Cv-0000nm-9q
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=wNQbn4gWo/HPK8lrt6lk+nTUCAwoor0fdGb27CmpvEc=; b=Pxhu1yb2fRXx8TSQJn7Vh4awjw
 iVY8ucbGQ3vDucQn75PaVjqqX9u3XuslePEyTQ2s/Rhh/EBbhGJcx5MZClp7Ear8thZVzHb41IuoF
 /fhjceknSmXfk+SzNCIoHAJjYThg4MD75y747jppNA6EfeZAdVmYMcmBcDSdJjec2DSMVaZo1oG3q
 GYXyX01dFLrE3K152gLZTKRkrM6LSFSON/RGX8x8L3fFj+YoIHE6k9qqMf9rw+GgvSLE8ufipDuUM
 Dk9H9FaExuInRUZTkUHJk09RbzJWfL95nuonCTMazJQD1Kmql9YNbr9UFW3gGuug+T2RqroS49oz2
 iQIFiciUKGkri6WQY0lpVq53obrQhYGnxGBFbxcO75nUhY48zf0n8H3CtEjAaMtPOaPdHATGEduiC
 Av9aTn/SaNRjXbzHY20db09s8IIWs3HGzhGNBw9AakQJerI9U8FRp4xTpuSnVxEATOjN5DK83Tiin
 IFzjKPtLvw/x/Ei9MtD168yJN5UB0lVsTbXV6sw/8p4kKtIHqmKnTw+Cg/JU/vg14+iszq/MAZtiW
 sAx5y8em+Xamy16uvMmmThHGC2dug/Co0khKi1SJDq2VD16sRkwGfrKruNe10R9YePfL5J6+s5ctg
 W6RZDBWGwNcFl4DZgz4Rho0Ko2sfMZ68JsPzM9kjM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Will Cohen <wwcohen@gmail.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, hi@alyssa.is,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>
Subject: Re: [PATCH v4 04/11] 9p: darwin: Handle struct dirent differences
Date: Mon, 07 Feb 2022 15:41:12 +0100
Message-ID: <1773154.tHhT6ugY5c@silver>
In-Reply-To: <20220206200719.74464-5-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-5-wwcohen@gmail.com>
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

On Sonntag, 6. Februar 2022 21:07:12 CET Will Cohen wrote:
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
> [Will Cohen: - Ensure that telldir error handling uses
>                signed int]
> Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p-local.c |  9 +++++++++
>  hw/9pfs/9p-proxy.c | 16 +++++++++++++++-
>  hw/9pfs/9p-synth.c |  4 ++++
>  hw/9pfs/9p-util.h  | 17 +++++++++++++++++
>  hw/9pfs/9p.c       | 15 +++++++++++++--
>  hw/9pfs/codir.c    |  7 +++++++
>  6 files changed, 65 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index 1a5e3eed73..7137a28109 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -559,6 +559,15 @@ static struct dirent *local_readdir(FsContext *ctx,
> V9fsFidOpenState *fs)
> 
>  again:
>      entry = readdir(fs->dir.stream);
> +#ifdef CONFIG_DARWIN
> +    int td;
> +    td = telldir(fs->dir.stream);
> +    /* If telldir fails, fail the entire readdir call */
> +    if (td < 0) {
> +        return NULL;
> +    }
> +    entry->d_seekoff = td;
> +#endif
>      if (!entry) {
>          return NULL;
>      }

'entry' may be NULL, so the 'if (!entry) {' check should be before the Darwin 
specific code to avoid a crash on macOS.

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
> index 4a4a776d06..e264a03eef 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -222,7 +222,11 @@ static void synth_direntry(V9fsSynthNode *node,
>  {
>      strcpy(entry->d_name, node->name);
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
> index 546f46dc7d..accbec9987 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -79,3 +79,20 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char
> *filename, const char *name);
> 
>  #endif
> +
> +
> +/**
> + * Darwin has d_seekoff, which appears to function similarly to d_off.
> + * However, it does not appear to be supported on all file systems,
> + * so ensure it is manually injected earlier and call here when
> + * needed.
> + */
> +

Nitpicking: no blank line here please.

> +inline off_t qemu_dirent_off(struct dirent *dent)
> +{
> +#ifdef CONFIG_DARWIN
> +    return dent->d_seekoff;
> +#else
> +    return dent->d_off;
> +#endif
> +}
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 1563d7b7c6..cf694da354 100644
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
> @@ -2281,7 +2282,11 @@ static int coroutine_fn
> v9fs_do_readdir_with_stat(V9fsPDU *pdu, count += len;
>          v9fs_stat_free(&v9stat);
>          v9fs_path_free(&path);
> -        saved_dir_pos = dent->d_off;
> +        saved_dir_pos = qemu_dirent_off(dent);
> +        if (saved_dir_pos < 0) {
> +            err = saved_dir_pos;
> +            break;
> +        }
>      }

That check is no longer needed here, is it?

> 
>      v9fs_readdir_unlock(&fidp->fs.dir);
> @@ -2420,6 +2425,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu,
> V9fsFidState *fidp, V9fsString name;
>      int len, err = 0;
>      int32_t count = 0;
> +    off_t off;
>      struct dirent *dent;
>      struct stat *st;
>      struct V9fsDirEnt *entries = NULL;
> @@ -2480,12 +2486,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> *pdu, V9fsFidState *fidp, qid.version = 0;
>          }
> 
> +        off = qemu_dirent_off(dent);
> +        if (off < 0) {
> +            err = off;
> +            break;
> +        }

Likewise: is this check still needed?

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
> index 032cce04c4..fac6759a64 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -167,7 +167,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> *fidp, }
> 
>          size += len;
> +        /* This conditional statement is identical in
> +         * function to qemu_dirent_off, described in 9p-util.h,
> +         * since that header cannot be included here. */
> +#ifdef CONFIG_DARWIN
> +        saved_dir_pos = dent->d_seekoff;
> +#else
>          saved_dir_pos = dent->d_off;
> +#endif

Why can't the header not be included here? Obvious preference would be to use 
qemu_dirent_off() here as well, to have control at one central code location.

>      }
> 
>      /* restore (last) saved position */



