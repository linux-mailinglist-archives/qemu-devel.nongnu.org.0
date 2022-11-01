Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C70615097
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:26:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprk7-0005OM-10; Tue, 01 Nov 2022 09:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oprk5-0005OB-D9
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:55:49 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oprjs-0002yL-OT
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=QzYAMmVI68T2OCclBsJrZ2GV/GgEndT4uocSiKP/iIo=; b=Z6SP/1s3sQ4+LhBjB81PFS4yC2
 uH4YYiC/weEckLHH53E3RDoiPveZrH0E/m6IW8fMmtkMwlC8i/I+ckMeoygxcE4cuqnAIRNZQvNqe
 v9QAHv7YRR46nKEUu8KTe3MT3q0IesiWThyiI2aCdglCbzQUot+dxq9niXLAJrP2mqniNtRXE9XeV
 QcTfl/bvBdzDtPSvYOYYX/WiFJd3XBQMZoa2e0G+50CC3H0VHzw9U2KdC6yRLmKlowKNQEQqGW1Sp
 sSiSv3ZG/I9T22Ld23bNy7eOrYAwh0nlhunMn/8vkKWDiXpHq4ivDUMEAavAKNPZmYuVnU558WRAo
 IwuHj1Dblc/K7Y7uwgiElm3iMHfMUXWzmQkzsMqYaxT9tu7qdTqSdn8gXRknMTFmmcQJYd3tuoApl
 PN2oVs5VMdcKOsEKa6jcXgToifqpVR+aDREo2f8pDI800gS5+AT/kog9xzGOS3BUgOt7Jv1G89Zu7
 IhXqwwulOU03NzzXBJgHMdmlH+pyE13vl8w6T8CiWjpmXjt5PRf2EXJZwLbQ1RqXhkp6E9fCSKLKB
 KlG5Rp+SWgbjMo8E6AtgGl0Ta5g4e8IAxQ3++KwGz0IlrFGlpf5Alb9FuU1OE1t0BGpS7FD2r7Wjh
 2F4eiMBuXU2PdGjGaJJO2Uq8vkvBP/kZrD/vC7GdE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH 04/16] hw/9pfs: Introduce an opaque type 9P_FILE_ID
Date: Tue, 01 Nov 2022 14:55:32 +0100
Message-ID: <4620086.XpUeK0iDWE@silver>
In-Reply-To: <20221024045759.448014-5-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <20221024045759.448014-5-bin.meng@windriver.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Monday, October 24, 2022 6:57:47 AM CET Bin Meng wrote:
> Introduce an opaque type to represent a file in the 9pfs. This is
> file descriptor on POSIX systems. In the upcoming patches, we can
> extend it to support Windows.
> 
> With this new opaque type, it significantly reduces the number of
> deviated code paths when adding Windows support.

Strictly it is not an opaque type as you still have direct access to the
original value, not that I would care about this comment here, but ...

> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/9pfs/9p-file-id.h     |  21 +++++
>  hw/9pfs/9p-local.h       |   8 +-
>  hw/9pfs/9p-util.h        |  28 ++++---
>  hw/9pfs/9p-local.c       | 166 ++++++++++++++++++++-------------------
>  hw/9pfs/9p-util-darwin.c |  14 ++--
>  hw/9pfs/9p-util-linux.c  |  14 ++--
>  hw/9pfs/9p-xattr.c       |  16 ++--
>  7 files changed, 150 insertions(+), 117 deletions(-)
>  create mode 100644 hw/9pfs/9p-file-id.h
> 
> diff --git a/hw/9pfs/9p-file-id.h b/hw/9pfs/9p-file-id.h
> new file mode 100644
> index 0000000000..60cbfbf4dd
> --- /dev/null
> +++ b/hw/9pfs/9p-file-id.h
> @@ -0,0 +1,21 @@
> +/*
> + * 9p file representation for different hosts
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef QEMU_9P_FILE_ID_H
> +#define QEMU_9P_FILE_ID_H
> +
> +/*
> + * 9pfs file id
> + *
> + * This is file descriptor on POSIX platforms
> + */
> +typedef int P9_FILE_ID;

I would not call it a "file ID" as that's a value identical for all streams
and processes. A correct term was either file descriptor or a file handle.

And as far as I can see, common QEMU code style suggests camel-case. So
instead maybe "QemuFileDescr_t" or just "QemuFd_t" to not confuse that with
9p protocol stuff?

> +
> +/* invalid value for P9_FILE_ID */
> +#define P9_INVALID_FILE -1

... I would rather either add a function like qemu_fd_invalid() or a function-
like macro as QEMU_FD_INVALID(), because that would also work with some exotic
systems that use fully opaque file descriptors that require either a function
call or dereferencing a struct member. So that would make this code more
future proof.

> +
> +#endif
> diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
> index 32c72749d9..c8404063e5 100644
> --- a/hw/9pfs/9p-local.h
> +++ b/hw/9pfs/9p-local.h
> @@ -13,8 +13,10 @@
>  #ifndef QEMU_9P_LOCAL_H
>  #define QEMU_9P_LOCAL_H
>  
> -int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> -                        mode_t mode);
> -int local_opendir_nofollow(FsContext *fs_ctx, const char *path);
> +#include "9p-file-id.h"
> +
> +P9_FILE_ID local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> +                               mode_t mode);
> +P9_FILE_ID local_opendir_nofollow(FsContext *fs_ctx, const char *path);
>  
>  #endif
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index c314cf381d..1e7dc76345 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -13,6 +13,8 @@
>  #ifndef QEMU_9P_UTIL_H
>  #define QEMU_9P_UTIL_H
>  
> +#include "9p-file-id.h"
> +
>  #ifdef O_PATH
>  #define O_PATH_9P_UTIL O_PATH
>  #else
> @@ -101,30 +103,31 @@ static inline int errno_to_dotl(int err) {
>  #define qemu_utimensat  utimensat
>  #define qemu_unlinkat   unlinkat
>  
> -static inline void close_preserve_errno(int fd)
> +static inline void close_preserve_errno(P9_FILE_ID fd)
>  {
>      int serrno = errno;
>      close(fd);
>      errno = serrno;
>  }
>  
> -static inline int openat_dir(int dirfd, const char *name)
> +static inline P9_FILE_ID openat_dir(P9_FILE_ID dirfd, const char *name)
>  {
>      return qemu_openat(dirfd, name,
>                         O_DIRECTORY | O_RDONLY | O_NOFOLLOW | O_PATH_9P_UTIL);
>  }
>  
> -static inline int openat_file(int dirfd, const char *name, int flags,
> -                              mode_t mode)
> +static inline P9_FILE_ID openat_file(P9_FILE_ID dirfd, const char *name,
> +                                     int flags, mode_t mode)
>  {
> -    int fd, serrno, ret;
> +    int serrno, ret;
> +    P9_FILE_ID fd;
>  
>  #ifndef CONFIG_DARWIN
>  again:
>  #endif
>      fd = qemu_openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
>                       mode);
> -    if (fd == -1) {
> +    if (fd == P9_INVALID_FILE) {

So these checks would become something like:

    if (QEMU_FD_INVALID(fd)) {

>  #ifndef CONFIG_DARWIN
>          if (errno == EPERM && (flags & O_NOATIME)) {
>              /*
> @@ -155,13 +158,13 @@ again:
>      return fd;
>  }
>  
> -ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *name,
> -                             void *value, size_t size);
> -int fsetxattrat_nofollow(int dirfd, const char *path, const char *name,
> +ssize_t fgetxattrat_nofollow(P9_FILE_ID dirfd, const char *path,
> +                             const char *name, void *value, size_t size);
> +int fsetxattrat_nofollow(P9_FILE_ID dirfd, const char *path, const char *name,
>                           void *value, size_t size, int flags);
> -ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> +ssize_t flistxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
>                                char *list, size_t size);
> -ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> +ssize_t fremovexattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
>                                  const char *name);
>  
>  /*
> @@ -219,6 +222,7 @@ static inline struct dirent *qemu_dirent_dup(struct dirent *dent)
>  #if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
>  int pthread_fchdir_np(int fd) __attribute__((weak_import));
>  #endif
> -int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
> +int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_t mode,
> +                 dev_t dev);
>  
>  #endif
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index d2246a3d7e..7e8d8492ea 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -54,18 +54,18 @@
>  #endif
>  
>  typedef struct {
> -    int mountfd;
> +    P9_FILE_ID mountfd;
>  } LocalData;
>  
> -int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> -                        mode_t mode)
> +P9_FILE_ID local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> +                               mode_t mode)
>  {
>      LocalData *data = fs_ctx->private;
> -    int fd = data->mountfd;
> +    P9_FILE_ID fd = data->mountfd;
>  
> -    while (*path && fd != -1) {
> +    while (*path && fd != P9_INVALID_FILE) {
>          const char *c;
> -        int next_fd;
> +        P9_FILE_ID next_fd;
>          char *head;
>  
>          /* Only relative paths without consecutive slashes */
> @@ -94,20 +94,21 @@ int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
>      return fd;
>  }
>  
> -int local_opendir_nofollow(FsContext *fs_ctx, const char *path)
> +P9_FILE_ID local_opendir_nofollow(FsContext *fs_ctx, const char *path)
>  {
>      return local_open_nofollow(fs_ctx, path, O_DIRECTORY | O_RDONLY, 0);
>  }
>  
> -static void renameat_preserve_errno(int odirfd, const char *opath, int ndirfd,
> -                                    const char *npath)
> +static void renameat_preserve_errno(P9_FILE_ID odirfd, const char *opath,
> +                                    P9_FILE_ID ndirfd, const char *npath)
>  {
>      int serrno = errno;
>      qemu_renameat(odirfd, opath, ndirfd, npath);
>      errno = serrno;
>  }
>  
> -static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
> +static void unlinkat_preserve_errno(P9_FILE_ID dirfd, const char *path,
> +                                    int flags)
>  {
>      int serrno = errno;
>      qemu_unlinkat(dirfd, path, flags);
> @@ -117,9 +118,10 @@ static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
>  #define VIRTFS_META_DIR ".virtfs_metadata"
>  #define VIRTFS_META_ROOT_FILE VIRTFS_META_DIR "_root"
>  
> -static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
> +static FILE *local_fopenat(P9_FILE_ID dirfd, const char *name, const char *mode)
>  {
> -    int fd, o_mode = 0;
> +    P9_FILE_ID fd;
> +    int o_mode = 0;
>      FILE *fp;
>      int flags;
>      /*
> @@ -134,7 +136,7 @@ static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
>          return NULL;
>      }
>      fd = openat_file(dirfd, name, flags, o_mode);
> -    if (fd == -1) {
> +    if (fd == P9_INVALID_FILE) {
>          return NULL;
>      }
>      fp = fdopen(fd, mode);
> @@ -145,16 +147,16 @@ static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
>  }
>  
>  #define ATTR_MAX 100
> -static void local_mapped_file_attr(int dirfd, const char *name,
> +static void local_mapped_file_attr(P9_FILE_ID dirfd, const char *name,
>                                     struct stat *stbuf)
>  {
>      FILE *fp;
>      char buf[ATTR_MAX];
> -    int map_dirfd;
> +    P9_FILE_ID map_dirfd;
>  
>      if (strcmp(name, ".")) {
>          map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
> -        if (map_dirfd == -1) {
> +        if (map_dirfd == P9_INVALID_FILE) {
>              return;
>          }
>  
> @@ -187,10 +189,10 @@ static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct stat *stbuf)
>      int err = -1;
>      char *dirpath = g_path_get_dirname(fs_path->data);
>      char *name = g_path_get_basename(fs_path->data);
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>  
>      dirfd = local_opendir_nofollow(fs_ctx, dirpath);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          goto out;
>      }
>  
> @@ -233,14 +235,14 @@ out:
>      return err;
>  }
>  
> -static int local_set_mapped_file_attrat(int dirfd, const char *name,
> +static int local_set_mapped_file_attrat(P9_FILE_ID dirfd, const char *name,
>                                          FsCred *credp)
>  {
>      FILE *fp;
>      int ret;
>      char buf[ATTR_MAX];
>      int uid = -1, gid = -1, mode = -1, rdev = -1;
> -    int map_dirfd = -1, map_fd;
> +    P9_FILE_ID map_dirfd = P9_INVALID_FILE, map_fd;
>      bool is_root = !strcmp(name, ".");
>  
>      if (is_root) {
> @@ -259,7 +261,7 @@ static int local_set_mapped_file_attrat(int dirfd, const char *name,
>          }
>  
>          map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
> -        if (map_dirfd == -1) {
> +        if (map_dirfd == P9_INVALID_FILE) {
>              return -1;
>          }
>  
> @@ -296,7 +298,7 @@ update_map_file:
>          /* We can't go this far with map_dirfd not being a valid file descriptor
>           * but some versions of gcc aren't smart enough to see it.
>           */
> -        if (map_dirfd != -1) {
> +        if (map_dirfd != P9_INVALID_FILE) {
>              close_preserve_errno(map_dirfd);
>          }
>      }
> @@ -305,7 +307,7 @@ update_map_file:
>      }
>  
>      map_fd = fileno(fp);
> -    assert(map_fd != -1);
> +    assert(map_fd != P9_INVALID_FILE);
>      ret = fchmod(map_fd, 0600);
>      assert(ret == 0);
>  
> @@ -339,10 +341,11 @@ update_map_file:
>      return 0;
>  }
>  
> -static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
> +static int fchmodat_nofollow(P9_FILE_ID dirfd, const char *name, mode_t mode)
>  {
>      struct stat stbuf;
> -    int fd, ret;
> +    P9_FILE_ID fd;
> +    int ret;
>  
>      /* FIXME: this should be handled with fchmodat(AT_SYMLINK_NOFOLLOW).
>       * Unfortunately, the linux kernel doesn't implement it yet.
> @@ -362,16 +365,16 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
>      /* Fallback for systems that don't support O_PATH: we depend on the file
>       * being readable or writable.
>       */
> -    if (fd == -1) {
> +    if (fd == P9_INVALID_FILE) {
>          /* In case the file is writable-only and isn't a directory. */
>          if (errno == EACCES) {
>              fd = openat_file(dirfd, name, O_WRONLY, 0);
>          }
> -        if (fd == -1 && errno == EISDIR) {
> +        if (fd == P9_INVALID_FILE && errno == EISDIR) {
>              errno = EACCES;
>          }
>      }
> -    if (fd == -1) {
> +    if (fd == P9_INVALID_FILE) {
>          return -1;
>      }
>      ret = fchmod(fd, mode);
> @@ -380,7 +383,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
>       * link, O_PATH | O_NOFOLLOW causes openat(2) to return a file descriptor
>       * referring to the symbolic link.
>       */
> -    if (fd == -1) {
> +    if (fd == P9_INVALID_FILE) {
>          return -1;
>      }
>  
> @@ -401,7 +404,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
>      return ret;
>  }
>  
> -static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
> +static int local_set_xattrat(P9_FILE_ID dirfd, const char *path, FsCred *credp)
>  {
>      int err;
>  
> @@ -440,7 +443,7 @@ static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
>      return 0;
>  }
>  
> -static int local_set_cred_passthrough(FsContext *fs_ctx, int dirfd,
> +static int local_set_cred_passthrough(FsContext *fs_ctx, P9_FILE_ID dirfd,
>                                        const char *name, FsCred *credp)
>  {
>      if (fchownat(dirfd, name, credp->fc_uid, credp->fc_gid,
> @@ -478,10 +481,10 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
>                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
>          char *dirpath = g_path_get_dirname(fs_path->data);
>          char *name = g_path_get_basename(fs_path->data);
> -        int dirfd;
> +        P9_FILE_ID dirfd;
>  
>          dirfd = local_opendir_nofollow(fs_ctx, dirpath);
> -        if (dirfd == -1) {
> +        if (dirfd == P9_INVALID_FILE) {
>              goto out;
>          }
>  
> @@ -507,10 +510,10 @@ static int local_closedir(FsContext *ctx, V9fsFidOpenState *fs)
>  static int local_open(FsContext *ctx, V9fsPath *fs_path,
>                        int flags, V9fsFidOpenState *fs)
>  {
> -    int fd;
> +    P9_FILE_ID fd;
>  
>      fd = local_open_nofollow(ctx, fs_path->data, flags, 0);
> -    if (fd == -1) {
> +    if (fd == P9_INVALID_FILE) {
>          return -1;
>      }
>      fs->fd = fd;
> @@ -520,11 +523,11 @@ static int local_open(FsContext *ctx, V9fsPath *fs_path,
>  static int local_opendir(FsContext *ctx,
>                           V9fsPath *fs_path, V9fsFidOpenState *fs)
>  {
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>      DIR *stream;
>  
>      dirfd = local_opendir_nofollow(ctx, fs_path->data);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          return -1;
>      }
>  
> @@ -640,10 +643,10 @@ static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
>      char *dirpath = g_path_get_dirname(fs_path->data);
>      char *name = g_path_get_basename(fs_path->data);
>      int ret = -1;
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>  
>      dirfd = local_opendir_nofollow(fs_ctx, dirpath);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          goto out;
>      }
>  
> @@ -667,7 +670,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
>                         const char *name, FsCred *credp)
>  {
>      int err = -1;
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>  
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(fs_ctx, name)) {
> @@ -676,7 +679,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
>      }
>  
>      dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          return -1;
>      }
>  
> @@ -719,7 +722,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
>                         const char *name, FsCred *credp)
>  {
>      int err = -1;
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>  
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(fs_ctx, name)) {
> @@ -728,7 +731,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
>      }
>  
>      dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          return -1;
>      }
>  
> @@ -816,9 +819,9 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
>  static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
>                         int flags, FsCred *credp, V9fsFidOpenState *fs)
>  {
> -    int fd = -1;
> +    P9_FILE_ID fd = P9_INVALID_FILE;
>      int err = -1;
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>  
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(fs_ctx, name)) {
> @@ -832,7 +835,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
>      flags |= O_NOFOLLOW;
>  
>      dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          return -1;
>      }
>  
> @@ -840,7 +843,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
>          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
>          fd = openat_file(dirfd, name, flags, fs_ctx->fmode);
> -        if (fd == -1) {
> +        if (fd == P9_INVALID_FILE) {
>              goto out;
>          }
>          credp->fc_mode = credp->fc_mode | S_IFREG;
> @@ -856,7 +859,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
>      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
>                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
>          fd = openat_file(dirfd, name, flags, credp->fc_mode);
> -        if (fd == -1) {
> +        if (fd == P9_INVALID_FILE) {
>              goto out;
>          }
>          err = local_set_cred_passthrough(fs_ctx, dirfd, name, credp);
> @@ -882,7 +885,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
>                           V9fsPath *dir_path, const char *name, FsCred *credp)
>  {
>      int err = -1;
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>  
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(fs_ctx, name)) {
> @@ -891,7 +894,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
>      }
>  
>      dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          return -1;
>      }
>  
> @@ -903,7 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
>  
>          fd = openat_file(dirfd, name, O_CREAT | O_EXCL | O_RDWR,
>                           fs_ctx->fmode);
> -        if (fd == -1) {
> +        if (fd == P9_INVALID_FILE) {
>              goto out;
>          }
>          /* Write the oldpath (target) to the file. */
> @@ -962,7 +965,7 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
>      char *odirpath = g_path_get_dirname(oldpath->data);
>      char *oname = g_path_get_basename(oldpath->data);
>      int ret = -1;
> -    int odirfd, ndirfd;
> +    P9_FILE_ID odirfd, ndirfd;
>  
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(ctx, name)) {
> @@ -971,12 +974,12 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
>      }
>  
>      odirfd = local_opendir_nofollow(ctx, odirpath);
> -    if (odirfd == -1) {
> +    if (odirfd == P9_INVALID_FILE) {
>          goto out;
>      }
>  
>      ndirfd = local_opendir_nofollow(ctx, dirpath->data);
> -    if (ndirfd == -1) {
> +    if (ndirfd == P9_INVALID_FILE) {
>          close_preserve_errno(odirfd);
>          goto out;
>      }
> @@ -996,12 +999,12 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
>          }
>  
>          omap_dirfd = openat_dir(odirfd, VIRTFS_META_DIR);
> -        if (omap_dirfd == -1) {
> +        if (omap_dirfd == P9_INVALID_FILE) {
>              goto err;
>          }
>  
>          nmap_dirfd = openat_dir(ndirfd, VIRTFS_META_DIR);
> -        if (nmap_dirfd == -1) {
> +        if (nmap_dirfd == P9_INVALID_FILE) {
>              close_preserve_errno(omap_dirfd);
>              goto err;
>          }
> @@ -1032,10 +1035,11 @@ out:
>  
>  static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
>  {
> -    int fd, ret;
> +    P9_FILE_ID fd;
> +    int ret;
>  
>      fd = local_open_nofollow(ctx, fs_path->data, O_WRONLY, 0);
> -    if (fd == -1) {
> +    if (fd == P9_INVALID_FILE) {
>          return -1;
>      }
>      ret = ftruncate(fd, size);
> @@ -1048,10 +1052,10 @@ static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
>      char *dirpath = g_path_get_dirname(fs_path->data);
>      char *name = g_path_get_basename(fs_path->data);
>      int ret = -1;
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>  
>      dirfd = local_opendir_nofollow(fs_ctx, dirpath);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          goto out;
>      }
>  
> @@ -1078,10 +1082,11 @@ static int local_utimensat(FsContext *s, V9fsPath *fs_path,
>  {
>      char *dirpath = g_path_get_dirname(fs_path->data);
>      char *name = g_path_get_basename(fs_path->data);
> -    int dirfd, ret = -1;
> +    P9_FILE_ID dirfd;
> +    int ret = -1;
>  
>      dirfd = local_opendir_nofollow(s, dirpath);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          goto out;
>      }
>  
> @@ -1093,13 +1098,13 @@ out:
>      return ret;
>  }
>  
> -static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
> -                                 int flags)
> +static int local_unlinkat_common(FsContext *ctx, P9_FILE_ID dirfd,
> +                                 const char *name, int flags)
>  {
>      int ret;
>  
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> -        int map_dirfd;
> +        P9_FILE_ID map_dirfd;
>  
>          /* We need to remove the metadata as well:
>           * - the metadata directory if we're removing a directory
> @@ -1110,10 +1115,10 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
>           * mode. We just ignore the error.
>           */
>          if (flags == AT_REMOVEDIR) {
> -            int fd;
> +            P9_FILE_ID fd;
>  
>              fd = openat_dir(dirfd, name);
> -            if (fd == -1) {
> +            if (fd == P9_INVALID_FILE) {
>                  return -1;
>              }
>              ret = qemu_unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
> @@ -1123,7 +1128,7 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
>              }
>          }
>          map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
> -        if (map_dirfd != -1) {
> +        if (map_dirfd != P9_INVALID_FILE) {
>              ret = qemu_unlinkat(map_dirfd, name, 0);
>              close_preserve_errno(map_dirfd);
>              if (ret < 0 && errno != ENOENT) {
> @@ -1143,11 +1148,11 @@ static int local_remove(FsContext *ctx, const char *path)
>      char *dirpath = g_path_get_dirname(path);
>      char *name = g_path_get_basename(path);
>      int flags = 0;
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>      int err = -1;
>  
>      dirfd = local_opendir_nofollow(ctx, dirpath);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          goto out;
>      }
>  
> @@ -1188,10 +1193,11 @@ static int local_fsync(FsContext *ctx, int fid_type,
>  
>  static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
>  {
> -    int fd, ret;
> +    P9_FILE_ID fd;
> +    int ret;
>  
>      fd = local_open_nofollow(s, fs_path->data, O_RDONLY, 0);
> -    if (fd == -1) {
> +    if (fd == P9_INVALID_FILE) {
>          return -1;
>      }
>      ret = fstatfs(fd, stbuf);
> @@ -1276,7 +1282,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
>                            const char *new_name)
>  {
>      int ret;
> -    int odirfd, ndirfd;
> +    P9_FILE_ID odirfd, ndirfd;
>  
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          (local_is_mapped_file_metadata(ctx, old_name) ||
> @@ -1286,12 +1292,12 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
>      }
>  
>      odirfd = local_opendir_nofollow(ctx, olddir->data);
> -    if (odirfd == -1) {
> +    if (odirfd == P9_INVALID_FILE) {
>          return -1;
>      }
>  
>      ndirfd = local_opendir_nofollow(ctx, newdir->data);
> -    if (ndirfd == -1) {
> +    if (ndirfd == P9_INVALID_FILE) {
>          close_preserve_errno(odirfd);
>          return -1;
>      }
> @@ -1302,7 +1308,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
>      }
>  
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> -        int omap_dirfd, nmap_dirfd;
> +        P9_FILE_ID omap_dirfd, nmap_dirfd;
>  
>          ret = qemu_mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
>          if (ret < 0 && errno != EEXIST) {
> @@ -1310,12 +1316,12 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
>          }
>  
>          omap_dirfd = openat_dir(odirfd, VIRTFS_META_DIR);
> -        if (omap_dirfd == -1) {
> +        if (omap_dirfd == P9_INVALID_FILE) {
>              goto err;
>          }
>  
>          nmap_dirfd = openat_dir(ndirfd, VIRTFS_META_DIR);
> -        if (nmap_dirfd == -1) {
> +        if (nmap_dirfd == P9_INVALID_FILE) {
>              close_preserve_errno(omap_dirfd);
>              goto err;
>          }
> @@ -1373,7 +1379,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
>                            const char *name, int flags)
>  {
>      int ret;
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>  
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(ctx, name)) {
> @@ -1382,7 +1388,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
>      }
>  
>      dirfd = local_opendir_nofollow(ctx, dir->data);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          return -1;
>      }
>  
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index 95146e7354..c509034fb2 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -11,8 +11,8 @@
>  #include "qemu/error-report.h"
>  #include "9p-util.h"
>  
> -ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> -                             void *value, size_t size)
> +ssize_t fgetxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
> +                             const char *name, void *value, size_t size)
>  {
>      int ret;
>      int fd = openat_file(dirfd, filename,
> @@ -25,7 +25,7 @@ ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
>      return ret;
>  }
>  
> -ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> +ssize_t flistxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
>                                char *list, size_t size)
>  {
>      int ret;
> @@ -39,7 +39,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
>      return ret;
>  }
>  
> -ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> +ssize_t fremovexattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
>                                  const char *name)
>  {
>      int ret;
> @@ -52,8 +52,8 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
>      return ret;
>  }
>  
> -int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> -                         void *value, size_t size, int flags)
> +int fsetxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
> +                         const char *name, void *value, size_t size, int flags)
>  {
>      int ret;
>      int fd = openat_file(dirfd, filename, O_PATH_9P_UTIL | O_NOFOLLOW, 0);
> @@ -110,7 +110,7 @@ out:
>      return err;
>  }
>  
> -int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_t mode, dev_t dev)
>  {
>      int preserved_errno, err;
>  
> diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
> index db451b0784..cb5e988354 100644
> --- a/hw/9pfs/9p-util-linux.c
> +++ b/hw/9pfs/9p-util-linux.c
> @@ -19,8 +19,8 @@
>  #include "qemu/xattr.h"
>  #include "9p-util.h"
>  
> -ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> -                             void *value, size_t size)
> +ssize_t fgetxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
> +                             const char *name, void *value, size_t size)
>  {
>      char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
>      int ret;
> @@ -30,7 +30,7 @@ ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
>      return ret;
>  }
>  
> -ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> +ssize_t flistxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
>                                char *list, size_t size)
>  {
>      char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
> @@ -41,7 +41,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
>      return ret;
>  }
>  
> -ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> +ssize_t fremovexattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
>                                  const char *name)
>  {
>      char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
> @@ -52,8 +52,8 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
>      return ret;
>  }
>  
> -int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> -                         void *value, size_t size, int flags)
> +int fsetxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
> +                         const char *name, void *value, size_t size, int flags)
>  {
>      char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
>      int ret;
> @@ -64,7 +64,7 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
>  
>  }
>  
> -int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_t mode, dev_t dev)
>  {
>      return mknodat(dirfd, filename, mode, dev);
>  }
> diff --git a/hw/9pfs/9p-xattr.c b/hw/9pfs/9p-xattr.c
> index 9ae69dd8db..aaa364ea4a 100644
> --- a/hw/9pfs/9p-xattr.c
> +++ b/hw/9pfs/9p-xattr.c
> @@ -78,13 +78,13 @@ ssize_t v9fs_list_xattr(FsContext *ctx, const char *path,
>      char *orig_value, *orig_value_start;
>      ssize_t xattr_len, parsed_len = 0, attr_len;
>      char *dirpath, *name;
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>  
>      /* Get the actual len */
>      dirpath = g_path_get_dirname(path);
>      dirfd = local_opendir_nofollow(ctx, dirpath);
>      g_free(dirpath);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          return -1;
>      }
>  
> @@ -168,11 +168,11 @@ ssize_t local_getxattr_nofollow(FsContext *ctx, const char *path,
>  {
>      char *dirpath = g_path_get_dirname(path);
>      char *filename = g_path_get_basename(path);
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>      ssize_t ret = -1;
>  
>      dirfd = local_opendir_nofollow(ctx, dirpath);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          goto out;
>      }
>  
> @@ -196,11 +196,11 @@ ssize_t local_setxattr_nofollow(FsContext *ctx, const char *path,
>  {
>      char *dirpath = g_path_get_dirname(path);
>      char *filename = g_path_get_basename(path);
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>      ssize_t ret = -1;
>  
>      dirfd = local_opendir_nofollow(ctx, dirpath);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          goto out;
>      }
>  
> @@ -223,11 +223,11 @@ ssize_t local_removexattr_nofollow(FsContext *ctx, const char *path,
>  {
>      char *dirpath = g_path_get_dirname(path);
>      char *filename = g_path_get_basename(path);
> -    int dirfd;
> +    P9_FILE_ID dirfd;
>      ssize_t ret = -1;
>  
>      dirfd = local_opendir_nofollow(ctx, dirpath);
> -    if (dirfd == -1) {
> +    if (dirfd == P9_INVALID_FILE) {
>          goto out;
>      }
>  
> 




