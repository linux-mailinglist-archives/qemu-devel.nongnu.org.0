Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4267E45C82A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:59:53 +0100 (CET)
Received: from localhost ([::1]:40766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mptkW-00038S-4d
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:59:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mptjP-0002NJ-Uf
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:58:46 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:38357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mptjM-0005fq-Ro
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=BUYhaGkcWBUPxUQUI3EHJG0Ge4NBW83R5USiupxB324=; b=mgOPcAG1REEt8vgekQkFdzbNoH
 +J5fKUSjQzk+xOiiSRFUMmGhmNwoIIWFdURHDqxr+d3lhgxQ5RHrpl/WIbZotwlAngAhUzg8r5eEX
 Yydqriw/YDMdsI+mwMHschwaQSBhW1FDJ2Chi61UcgIQk2J9ziiZDamp93N7A5jHwOlMokurd8WMe
 4c1i4YaZSBA01cJgnVr8dm5iV8F+m7c+OUkH1eLvMGH+bnE59lEt7RhyIdY6l2+T9EC4p+jZun2yh
 K33n1AaNBOaS7CZa0jX+zF8BNFsesbW1aDWQSk1Y3HU+TI9vdMxBWMCuVWsspjXt6vZj4jGF35U0s
 Z1KBWDcUENWtPQHFcadItqAb1UCNEjmAVTQdgJ+ijI84nAjGFL9RhzYyHae6T8TZr14BXAc4lPa28
 /PRmw4YWSG1A9tOfkE4zakMLmRyJY/K8p+CUYVe5wTMXAglH6VDNMh/rvQkb8/F77kNTIbc6EOEnV
 ySJrF7b7zLktv7Z2u7upw7Xt4KwXvoDzVYeOUPGqgOMBdbXV0N3oEPUAPq2Ug6aB424PHiUSqLItW
 fe1XMzqjaU6ntmDQlNAeLxJACVdm6C+uq28qZKUkQplflRsuy6Riuq5wbrKDU7nMhZve8oOkVqBNS
 sSY2aUlJ5o+IU8zWbGtGuz5AUB9i8A/QUqlyumpLw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>
Subject: Re: [PATCH v2 04/11] 9p: darwin: Handle struct dirent differences
Date: Wed, 24 Nov 2021 15:58:38 +0100
Message-ID: <60659730.p4icJFLGV9@silver>
In-Reply-To: <20211122004913.20052-5-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-5-wwcohen@gmail.com>
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

On Montag, 22. November 2021 01:49:06 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> On darwin d_seekoff exists, but is optional and does not seem to
> be commonly used by file systems. Use `telldir` instead to obtain
> the seek offset.

Are you sure d_seekoff doesn't work on macOS? Because using telldir() instead
is not the same thing. Accessing d_*off is just POD access, whereas telldir()
is a syscall. What you are trying in this patch with telldir() easily gets
hairy.

AFAIK there was d_off in previous versions of macOS, which was then replaced
by d_seekof in macOS 11.1, no?

> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p-synth.c |  2 ++
>  hw/9pfs/9p.c       | 33 +++++++++++++++++++++++++++++++--
>  hw/9pfs/codir.c    |  4 ++++
>  3 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index 4a4a776d06..09b9c25288 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -222,7 +222,9 @@ static void synth_direntry(V9fsSynthNode *node,
>  {
>      strcpy(entry->d_name, node->name);
>      entry->d_ino = node->attr->inode;
> +#ifndef CONFIG_DARWIN
>      entry->d_off = off + 1;
> +#endif
>  }

^ That doesn't look like it would work. Compiling sure.

Have you tried running the test cases?
https://wiki.qemu.org/Documentation/9p#Test_Cases

>  static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index f4f0c200c7..c06e8a85a0 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -2218,6 +2218,25 @@ static int v9fs_xattr_read(V9fsState *s, V9fsPDU
> *pdu, V9fsFidState *fidp, return offset;
>  }
> 
> +/**
> + * Get the seek offset of a dirent. If not available from the structure
> itself, + * obtain it by calling telldir.
> + */
> +static int v9fs_dent_telldir(V9fsPDU *pdu, V9fsFidState *fidp,
> +                             struct dirent *dent)
> +{
> +#ifdef CONFIG_DARWIN
> +    /*
> +     * Darwin has d_seekoff, which appears to function similarly to d_off.
> +     * However, it does not appear to be supported on all file systems,
> +     * so use telldir for correctness.
> +     */
> +    return telldir(fidp->fs.dir.stream);
> +#else
> +    return dent->d_off;
> +#endif

The thing here is, we usually run fs syscalls as coroutines on a worker thread
as they might block for a long time, and in the meantime 9p server's main
thread could handle other tasks. Plus if a fs syscall gets stuck, we can abort
the request, which is not possible if its called directly from main thread.

https://wiki.qemu.org/Documentation/9p#Threads_and_Coroutines

dent->d_off is just POD access, so it is instantanious. But that does not mean
you should wrap that telldir() call now to be a background task, because that
will add other implications. I would rather prefer to clarify first whether
d_*off is really not working on macOS to avoid all the foreseeable trouble.

> +}
> +
>  static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
>                                                    V9fsFidState *fidp,
>                                                    uint32_t max_count)
> @@ -2281,7 +2300,11 @@ static int coroutine_fn
> v9fs_do_readdir_with_stat(V9fsPDU *pdu, count += len;
>          v9fs_stat_free(&v9stat);
>          v9fs_path_free(&path);
> -        saved_dir_pos = dent->d_off;
> +        saved_dir_pos = v9fs_dent_telldir(pdu, fidp, dent);
> +        if (saved_dir_pos < 0) {
> +            err = saved_dir_pos;
> +            break;
> +        }
>      }
> 
>      v9fs_readdir_unlock(&fidp->fs.dir);
> @@ -2420,6 +2443,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu,
> V9fsFidState *fidp, V9fsString name;
>      int len, err = 0;
>      int32_t count = 0;
> +    off_t off;
>      struct dirent *dent;
>      struct stat *st;
>      struct V9fsDirEnt *entries = NULL;
> @@ -2480,12 +2504,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> *pdu, V9fsFidState *fidp, qid.version = 0;
>          }
> 
> +        off = v9fs_dent_telldir(pdu, fidp, dent);
> +        if (off < 0) {
> +            err = off;
> +            break;
> +        }
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
> index 032cce04c4..78aca1d98b 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -167,7 +167,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> *fidp, }
> 
>          size += len;
> +#ifdef CONFIG_DARWIN
> +        saved_dir_pos = telldir(fidp->fs.dir.stream);
> +#else
>          saved_dir_pos = dent->d_off;
> +#endif
>      }
> 
>      /* restore (last) saved position */



