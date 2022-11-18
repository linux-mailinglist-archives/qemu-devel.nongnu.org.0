Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138862F138
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxhn-00008Y-Vp; Fri, 18 Nov 2022 04:30:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ovxhd-0008WN-DK
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:30:31 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ovxhX-0007ki-85
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:30:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E23192A97B;
 Fri, 18 Nov 2022 09:30:11 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 10:30:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005c0566b98-07a8-4efb-82c8-9c041e7bd8f5,
 4F902188D8BE41AB548CD4542CCC6124F715487A) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 18 Nov 2022 10:29:51 +0100
From: Greg Kurz <groug@kaod.org>
To: Bin Meng <bin.meng@windriver.com>
CC: <qemu-devel@nongnu.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 05/19] hw/9pfs: Update 9pfs to use the new QemuFd_t type
Message-ID: <20221118102951.42d2ce1f@bahia>
In-Reply-To: <20221111042225.1115931-6-bin.meng@windriver.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-6-bin.meng@windriver.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: b3b8e11e-663e-4caa-bf0b-4940375f8f20
X-Ovh-Tracer-Id: 5810487945973766621
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrhedtgddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtqhertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtteevkeffheelhfdvlefhiedtleevleeuudefgedugedvheehteekfefgledtfeenucffohhmrghinhepmhhitghrohhsohhfthdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghinhdrmhgvnhhgseifihhnughrihhvvghrrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhgpohhsshestghruhguvggshihtvgdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, 11 Nov 2022 12:22:11 +0800
Bin Meng <bin.meng@windriver.com> wrote:

> With this new QemuFd_t type, it significantly reduces the number of

I cannot find the definition of this type, nor the definition of
qemu_fd_invalid(). Missing patch ?

Anyway, IIUC this type is an int for linux and a HANDLE for windows,
right ?

According to win32 documentation at [1] :

HANDLE=09
A handle to an object.

This type is declared in WinNT.h as follows:

typedef PVOID HANDLE;

and

PVOID=09
A pointer to any type.

This type is declared in WinNT.h as follows:

typedef void *PVOID;

HANDLE is void *.

=46rom docs/devel/style.rst:

Naming
=3D=3D=3D=3D=3D=3D

Variables are lower_case_with_underscores; easy to type and read.  Structur=
ed
type names are in CamelCase; harder to type but standing out.  Enum type
names and function type names should also be in CamelCase.  Scalar type
names are lower_case_with_underscores_ending_with_a_t, like the POSIX
uint64_t and family.  Note that this last convention contradicts POSIX
and is therefore likely to be changed.

Both int and void * are scalar types, so I'd rather name it qemu_fd_t,
not using CamelCase at all so that it cannot be confused with a struct.

[1] https://learn.microsoft.com/en-us/windows/win32/winprog/windows-data-ty=
pes

> deviated code paths when adding Windows support.
>=20
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>=20
> ---
>=20
> Changes in v2:
> - Use the new QemuFd_t type
>=20
>  hw/9pfs/9p-local.h       |   6 +-
>  hw/9pfs/9p-util.h        |  26 +++---
>  hw/9pfs/9p-local.c       | 174 ++++++++++++++++++++-------------------
>  hw/9pfs/9p-util-darwin.c |  14 ++--
>  hw/9pfs/9p-util-linux.c  |  14 ++--
>  hw/9pfs/9p-xattr.c       |  16 ++--
>  6 files changed, 129 insertions(+), 121 deletions(-)
>=20
> diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
> index 32c72749d9..66a21316a0 100644
> --- a/hw/9pfs/9p-local.h
> +++ b/hw/9pfs/9p-local.h
> @@ -13,8 +13,8 @@
>  #ifndef QEMU_9P_LOCAL_H
>  #define QEMU_9P_LOCAL_H
> =20
> -int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> -                        mode_t mode);
> -int local_opendir_nofollow(FsContext *fs_ctx, const char *path);
> +QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int fl=
ags,
> +                             mode_t mode);
> +QemuFd_t local_opendir_nofollow(FsContext *fs_ctx, const char *path);
> =20
>  #endif
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index c314cf381d..3d6bd1a51e 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -101,30 +101,31 @@ static inline int errno_to_dotl(int err) {
>  #define qemu_utimensat  utimensat
>  #define qemu_unlinkat   unlinkat
> =20
> -static inline void close_preserve_errno(int fd)
> +static inline void close_preserve_errno(QemuFd_t fd)
>  {
>      int serrno =3D errno;
>      close(fd);
>      errno =3D serrno;
>  }
> =20
> -static inline int openat_dir(int dirfd, const char *name)
> +static inline QemuFd_t openat_dir(QemuFd_t dirfd, const char *name)
>  {
>      return qemu_openat(dirfd, name,
>                         O_DIRECTORY | O_RDONLY | O_NOFOLLOW | O_PATH_9P_U=
TIL);
>  }
> =20
> -static inline int openat_file(int dirfd, const char *name, int flags,
> -                              mode_t mode)
> +static inline QemuFd_t openat_file(QemuFd_t dirfd, const char *name,
> +                                   int flags, mode_t mode)
>  {
> -    int fd, serrno, ret;
> +    int serrno, ret;
> +    QemuFd_t fd;
> =20
>  #ifndef CONFIG_DARWIN
>  again:
>  #endif
>      fd =3D qemu_openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NO=
NBLOCK,
>                       mode);
> -    if (fd =3D=3D -1) {
> +    if (qemu_fd_invalid(fd)) {
>  #ifndef CONFIG_DARWIN
>          if (errno =3D=3D EPERM && (flags & O_NOATIME)) {
>              /*
> @@ -155,13 +156,13 @@ again:
>      return fd;
>  }
> =20
> -ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *na=
me,
> -                             void *value, size_t size);
> -int fsetxattrat_nofollow(int dirfd, const char *path, const char *name,
> +ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *path,
> +                             const char *name, void *value, size_t size);
> +int fsetxattrat_nofollow(QemuFd_t dirfd, const char *path, const char *n=
ame,
>                           void *value, size_t size, int flags);
> -ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> +ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
>                                char *list, size_t size);
> -ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> +ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
>                                  const char *name);
> =20
>  /*
> @@ -219,6 +220,7 @@ static inline struct dirent *qemu_dirent_dup(struct d=
irent *dent)
>  #if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
>  int pthread_fchdir_np(int fd) __attribute__((weak_import));
>  #endif
> -int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev=
);
> +int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode,
> +                 dev_t dev);
> =20
>  #endif
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index d2246a3d7e..22377a3105 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -54,18 +54,18 @@
>  #endif
> =20
>  typedef struct {
> -    int mountfd;
> +    QemuFd_t mountfd;
>  } LocalData;
> =20
> -int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> -                        mode_t mode)
> +QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int fl=
ags,
> +                             mode_t mode)
>  {
>      LocalData *data =3D fs_ctx->private;
> -    int fd =3D data->mountfd;
> +    QemuFd_t fd =3D data->mountfd;
> =20
> -    while (*path && fd !=3D -1) {
> +    while (*path && !qemu_fd_invalid(fd)) {
>          const char *c;
> -        int next_fd;
> +        QemuFd_t next_fd;
>          char *head;
> =20
>          /* Only relative paths without consecutive slashes */
> @@ -94,20 +94,21 @@ int local_open_nofollow(FsContext *fs_ctx, const char=
 *path, int flags,
>      return fd;
>  }
> =20
> -int local_opendir_nofollow(FsContext *fs_ctx, const char *path)
> +QemuFd_t local_opendir_nofollow(FsContext *fs_ctx, const char *path)
>  {
>      return local_open_nofollow(fs_ctx, path, O_DIRECTORY | O_RDONLY, 0);
>  }
> =20
> -static void renameat_preserve_errno(int odirfd, const char *opath, int n=
dirfd,
> -                                    const char *npath)
> +static void renameat_preserve_errno(QemuFd_t odirfd, const char *opath,
> +                                    QemuFd_t ndirfd, const char *npath)
>  {
>      int serrno =3D errno;
>      qemu_renameat(odirfd, opath, ndirfd, npath);
>      errno =3D serrno;
>  }
> =20
> -static void unlinkat_preserve_errno(int dirfd, const char *path, int fla=
gs)
> +static void unlinkat_preserve_errno(QemuFd_t dirfd, const char *path,
> +                                    int flags)
>  {
>      int serrno =3D errno;
>      qemu_unlinkat(dirfd, path, flags);
> @@ -117,9 +118,10 @@ static void unlinkat_preserve_errno(int dirfd, const=
 char *path, int flags)
>  #define VIRTFS_META_DIR ".virtfs_metadata"
>  #define VIRTFS_META_ROOT_FILE VIRTFS_META_DIR "_root"
> =20
> -static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
> +static FILE *local_fopenat(QemuFd_t dirfd, const char *name, const char =
*mode)
>  {
> -    int fd, o_mode =3D 0;
> +    QemuFd_t fd;
> +    int o_mode =3D 0;
>      FILE *fp;
>      int flags;
>      /*
> @@ -134,7 +136,7 @@ static FILE *local_fopenat(int dirfd, const char *nam=
e, const char *mode)
>          return NULL;
>      }
>      fd =3D openat_file(dirfd, name, flags, o_mode);
> -    if (fd =3D=3D -1) {
> +    if (qemu_fd_invalid(fd)) {
>          return NULL;
>      }
>      fp =3D fdopen(fd, mode);
> @@ -145,16 +147,16 @@ static FILE *local_fopenat(int dirfd, const char *n=
ame, const char *mode)
>  }
> =20
>  #define ATTR_MAX 100
> -static void local_mapped_file_attr(int dirfd, const char *name,
> +static void local_mapped_file_attr(QemuFd_t dirfd, const char *name,
>                                     struct stat *stbuf)
>  {
>      FILE *fp;
>      char buf[ATTR_MAX];
> -    int map_dirfd;
> +    QemuFd_t map_dirfd;
> =20
>      if (strcmp(name, ".")) {
>          map_dirfd =3D openat_dir(dirfd, VIRTFS_META_DIR);
> -        if (map_dirfd =3D=3D -1) {
> +        if (qemu_fd_invalid(map_dirfd)) {
>              return;
>          }
> =20
> @@ -187,10 +189,10 @@ static int local_lstat(FsContext *fs_ctx, V9fsPath =
*fs_path, struct stat *stbuf)
>      int err =3D -1;
>      char *dirpath =3D g_path_get_dirname(fs_path->data);
>      char *name =3D g_path_get_basename(fs_path->data);
> -    int dirfd;
> +    QemuFd_t dirfd;
> =20
>      dirfd =3D local_opendir_nofollow(fs_ctx, dirpath);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          goto out;
>      }
> =20
> @@ -233,14 +235,14 @@ out:
>      return err;
>  }
> =20
> -static int local_set_mapped_file_attrat(int dirfd, const char *name,
> +static int local_set_mapped_file_attrat(QemuFd_t dirfd, const char *name,
>                                          FsCred *credp)
>  {
>      FILE *fp;
>      int ret;
>      char buf[ATTR_MAX];
>      int uid =3D -1, gid =3D -1, mode =3D -1, rdev =3D -1;
> -    int map_dirfd =3D -1, map_fd;
> +    QemuFd_t map_dirfd =3D QEMU_FD_INVALID, map_fd;
>      bool is_root =3D !strcmp(name, ".");
> =20
>      if (is_root) {
> @@ -259,7 +261,7 @@ static int local_set_mapped_file_attrat(int dirfd, co=
nst char *name,
>          }
> =20
>          map_dirfd =3D openat_dir(dirfd, VIRTFS_META_DIR);
> -        if (map_dirfd =3D=3D -1) {
> +        if (qemu_fd_invalid(map_dirfd)) {
>              return -1;
>          }
> =20
> @@ -296,7 +298,7 @@ update_map_file:
>          /* We can't go this far with map_dirfd not being a valid file de=
scriptor
>           * but some versions of gcc aren't smart enough to see it.
>           */
> -        if (map_dirfd !=3D -1) {
> +        if (!qemu_fd_invalid(map_dirfd)) {
>              close_preserve_errno(map_dirfd);
>          }
>      }
> @@ -305,7 +307,7 @@ update_map_file:
>      }
> =20
>      map_fd =3D fileno(fp);
> -    assert(map_fd !=3D -1);
> +    assert(!qemu_fd_invalid(map_fd));
>      ret =3D fchmod(map_fd, 0600);
>      assert(ret =3D=3D 0);
> =20
> @@ -339,10 +341,11 @@ update_map_file:
>      return 0;
>  }
> =20
> -static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
> +static int fchmodat_nofollow(QemuFd_t dirfd, const char *name, mode_t mo=
de)
>  {
>      struct stat stbuf;
> -    int fd, ret;
> +    QemuFd_t fd;
> +    int ret;
> =20
>      /* FIXME: this should be handled with fchmodat(AT_SYMLINK_NOFOLLOW).
>       * Unfortunately, the linux kernel doesn't implement it yet.
> @@ -362,16 +365,16 @@ static int fchmodat_nofollow(int dirfd, const char =
*name, mode_t mode)
>      /* Fallback for systems that don't support O_PATH: we depend on the =
file
>       * being readable or writable.
>       */
> -    if (fd =3D=3D -1) {
> +    if (qemu_fd_invalid(fd)) {
>          /* In case the file is writable-only and isn't a directory. */
>          if (errno =3D=3D EACCES) {
>              fd =3D openat_file(dirfd, name, O_WRONLY, 0);
>          }
> -        if (fd =3D=3D -1 && errno =3D=3D EISDIR) {
> +        if (qemu_fd_invalid(fd) && errno =3D=3D EISDIR) {
>              errno =3D EACCES;
>          }
>      }
> -    if (fd =3D=3D -1) {
> +    if (qemu_fd_invalid(fd)) {
>          return -1;
>      }
>      ret =3D fchmod(fd, mode);
> @@ -380,7 +383,7 @@ static int fchmodat_nofollow(int dirfd, const char *n=
ame, mode_t mode)
>       * link, O_PATH | O_NOFOLLOW causes openat(2) to return a file descr=
iptor
>       * referring to the symbolic link.
>       */
> -    if (fd =3D=3D -1) {
> +    if (qemu_fd_invalid(fd)) {
>          return -1;
>      }
> =20
> @@ -401,7 +404,7 @@ static int fchmodat_nofollow(int dirfd, const char *n=
ame, mode_t mode)
>      return ret;
>  }
> =20
> -static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
> +static int local_set_xattrat(QemuFd_t dirfd, const char *path, FsCred *c=
redp)
>  {
>      int err;
> =20
> @@ -440,7 +443,7 @@ static int local_set_xattrat(int dirfd, const char *p=
ath, FsCred *credp)
>      return 0;
>  }
> =20
> -static int local_set_cred_passthrough(FsContext *fs_ctx, int dirfd,
> +static int local_set_cred_passthrough(FsContext *fs_ctx, QemuFd_t dirfd,
>                                        const char *name, FsCred *credp)
>  {
>      if (fchownat(dirfd, name, credp->fc_uid, credp->fc_gid,
> @@ -464,10 +467,10 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9=
fsPath *fs_path,
> =20
>      if ((fs_ctx->export_flags & V9FS_SM_MAPPED) ||
>          (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE)) {
> -        int fd;
> +        QemuFd_t fd;
> =20
>          fd =3D local_open_nofollow(fs_ctx, fs_path->data, O_RDONLY, 0);
> -        if (fd =3D=3D -1) {
> +        if (qemu_fd_invalid(fd)) {
>              return -1;
>          }
>          do {
> @@ -478,10 +481,10 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9=
fsPath *fs_path,
>                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
>          char *dirpath =3D g_path_get_dirname(fs_path->data);
>          char *name =3D g_path_get_basename(fs_path->data);
> -        int dirfd;
> +        QemuFd_t dirfd;
> =20
>          dirfd =3D local_opendir_nofollow(fs_ctx, dirpath);
> -        if (dirfd =3D=3D -1) {
> +        if (qemu_fd_invalid(dirfd)) {
>              goto out;
>          }
> =20
> @@ -507,10 +510,10 @@ static int local_closedir(FsContext *ctx, V9fsFidOp=
enState *fs)
>  static int local_open(FsContext *ctx, V9fsPath *fs_path,
>                        int flags, V9fsFidOpenState *fs)
>  {
> -    int fd;
> +    QemuFd_t fd;
> =20
>      fd =3D local_open_nofollow(ctx, fs_path->data, flags, 0);
> -    if (fd =3D=3D -1) {
> +    if (qemu_fd_invalid(fd)) {
>          return -1;
>      }
>      fs->fd =3D fd;
> @@ -520,11 +523,11 @@ static int local_open(FsContext *ctx, V9fsPath *fs_=
path,
>  static int local_opendir(FsContext *ctx,
>                           V9fsPath *fs_path, V9fsFidOpenState *fs)
>  {
> -    int dirfd;
> +    QemuFd_t dirfd;
>      DIR *stream;
> =20
>      dirfd =3D local_opendir_nofollow(ctx, fs_path->data);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          return -1;
>      }
> =20
> @@ -640,10 +643,10 @@ static int local_chmod(FsContext *fs_ctx, V9fsPath =
*fs_path, FsCred *credp)
>      char *dirpath =3D g_path_get_dirname(fs_path->data);
>      char *name =3D g_path_get_basename(fs_path->data);
>      int ret =3D -1;
> -    int dirfd;
> +    QemuFd_t dirfd;
> =20
>      dirfd =3D local_opendir_nofollow(fs_ctx, dirpath);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          goto out;
>      }
> =20
> @@ -667,7 +670,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *d=
ir_path,
>                         const char *name, FsCred *credp)
>  {
>      int err =3D -1;
> -    int dirfd;
> +    QemuFd_t dirfd;
> =20
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(fs_ctx, name)) {
> @@ -676,7 +679,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *d=
ir_path,
>      }
> =20
>      dirfd =3D local_opendir_nofollow(fs_ctx, dir_path->data);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          return -1;
>      }
> =20
> @@ -719,7 +722,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *d=
ir_path,
>                         const char *name, FsCred *credp)
>  {
>      int err =3D -1;
> -    int dirfd;
> +    QemuFd_t dirfd;
> =20
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(fs_ctx, name)) {
> @@ -728,7 +731,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *d=
ir_path,
>      }
> =20
>      dirfd =3D local_opendir_nofollow(fs_ctx, dir_path->data);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          return -1;
>      }
> =20
> @@ -816,9 +819,9 @@ static int local_fstat(FsContext *fs_ctx, int fid_typ=
e,
>  static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char=
 *name,
>                         int flags, FsCred *credp, V9fsFidOpenState *fs)
>  {
> -    int fd =3D -1;
> +    QemuFd_t fd =3D QEMU_FD_INVALID;
>      int err =3D -1;
> -    int dirfd;
> +    QemuFd_t dirfd;
> =20
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(fs_ctx, name)) {
> @@ -832,7 +835,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *d=
ir_path, const char *name,
>      flags |=3D O_NOFOLLOW;
> =20
>      dirfd =3D local_opendir_nofollow(fs_ctx, dir_path->data);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          return -1;
>      }
> =20
> @@ -840,7 +843,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *d=
ir_path, const char *name,
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
>          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
>          fd =3D openat_file(dirfd, name, flags, fs_ctx->fmode);
> -        if (fd =3D=3D -1) {
> +        if (qemu_fd_invalid(fd)) {
>              goto out;
>          }
>          credp->fc_mode =3D credp->fc_mode | S_IFREG;
> @@ -856,7 +859,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *d=
ir_path, const char *name,
>      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
>                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
>          fd =3D openat_file(dirfd, name, flags, credp->fc_mode);
> -        if (fd =3D=3D -1) {
> +        if (qemu_fd_invalid(fd)) {
>              goto out;
>          }
>          err =3D local_set_cred_passthrough(fs_ctx, dirfd, name, credp);
> @@ -882,7 +885,7 @@ static int local_symlink(FsContext *fs_ctx, const cha=
r *oldpath,
>                           V9fsPath *dir_path, const char *name, FsCred *c=
redp)
>  {
>      int err =3D -1;
> -    int dirfd;
> +    QemuFd_t dirfd;
> =20
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(fs_ctx, name)) {
> @@ -891,19 +894,19 @@ static int local_symlink(FsContext *fs_ctx, const c=
har *oldpath,
>      }
> =20
>      dirfd =3D local_opendir_nofollow(fs_ctx, dir_path->data);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          return -1;
>      }
> =20
>      /* Determine the security model */
>      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
>          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> -        int fd;
> +        QemuFd_t fd;
>          ssize_t oldpath_size, write_size;
> =20
>          fd =3D openat_file(dirfd, name, O_CREAT | O_EXCL | O_RDWR,
>                           fs_ctx->fmode);
> -        if (fd =3D=3D -1) {
> +        if (qemu_fd_invalid(fd)) {
>              goto out;
>          }
>          /* Write the oldpath (target) to the file. */
> @@ -962,7 +965,7 @@ static int local_link(FsContext *ctx, V9fsPath *oldpa=
th,
>      char *odirpath =3D g_path_get_dirname(oldpath->data);
>      char *oname =3D g_path_get_basename(oldpath->data);
>      int ret =3D -1;
> -    int odirfd, ndirfd;
> +    QemuFd_t odirfd, ndirfd;
> =20
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(ctx, name)) {
> @@ -971,12 +974,12 @@ static int local_link(FsContext *ctx, V9fsPath *old=
path,
>      }
> =20
>      odirfd =3D local_opendir_nofollow(ctx, odirpath);
> -    if (odirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(odirfd)) {
>          goto out;
>      }
> =20
>      ndirfd =3D local_opendir_nofollow(ctx, dirpath->data);
> -    if (ndirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(ndirfd)) {
>          close_preserve_errno(odirfd);
>          goto out;
>      }
> @@ -996,12 +999,12 @@ static int local_link(FsContext *ctx, V9fsPath *old=
path,
>          }
> =20
>          omap_dirfd =3D openat_dir(odirfd, VIRTFS_META_DIR);
> -        if (omap_dirfd =3D=3D -1) {
> +        if (qemu_fd_invalid(omap_dirfd)) {
>              goto err;
>          }
> =20
>          nmap_dirfd =3D openat_dir(ndirfd, VIRTFS_META_DIR);
> -        if (nmap_dirfd =3D=3D -1) {
> +        if (qemu_fd_invalid(nmap_dirfd)) {
>              close_preserve_errno(omap_dirfd);
>              goto err;
>          }
> @@ -1032,10 +1035,11 @@ out:
> =20
>  static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
>  {
> -    int fd, ret;
> +    QemuFd_t fd;
> +    int ret;
> =20
>      fd =3D local_open_nofollow(ctx, fs_path->data, O_WRONLY, 0);
> -    if (fd =3D=3D -1) {
> +    if (qemu_fd_invalid(fd)) {
>          return -1;
>      }
>      ret =3D ftruncate(fd, size);
> @@ -1048,10 +1052,10 @@ static int local_chown(FsContext *fs_ctx, V9fsPat=
h *fs_path, FsCred *credp)
>      char *dirpath =3D g_path_get_dirname(fs_path->data);
>      char *name =3D g_path_get_basename(fs_path->data);
>      int ret =3D -1;
> -    int dirfd;
> +    QemuFd_t dirfd;
> =20
>      dirfd =3D local_opendir_nofollow(fs_ctx, dirpath);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          goto out;
>      }
> =20
> @@ -1078,10 +1082,11 @@ static int local_utimensat(FsContext *s, V9fsPath=
 *fs_path,
>  {
>      char *dirpath =3D g_path_get_dirname(fs_path->data);
>      char *name =3D g_path_get_basename(fs_path->data);
> -    int dirfd, ret =3D -1;
> +    QemuFd_t dirfd;
> +    int ret =3D -1;
> =20
>      dirfd =3D local_opendir_nofollow(s, dirpath);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          goto out;
>      }
> =20
> @@ -1093,13 +1098,13 @@ out:
>      return ret;
>  }
> =20
> -static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *=
name,
> -                                 int flags)
> +static int local_unlinkat_common(FsContext *ctx, QemuFd_t dirfd,
> +                                 const char *name, int flags)
>  {
>      int ret;
> =20
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> -        int map_dirfd;
> +        QemuFd_t map_dirfd;
> =20
>          /* We need to remove the metadata as well:
>           * - the metadata directory if we're removing a directory
> @@ -1110,10 +1115,10 @@ static int local_unlinkat_common(FsContext *ctx, =
int dirfd, const char *name,
>           * mode. We just ignore the error.
>           */
>          if (flags =3D=3D AT_REMOVEDIR) {
> -            int fd;
> +            QemuFd_t fd;
> =20
>              fd =3D openat_dir(dirfd, name);
> -            if (fd =3D=3D -1) {
> +            if (qemu_fd_invalid(fd)) {
>                  return -1;
>              }
>              ret =3D qemu_unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
> @@ -1123,7 +1128,7 @@ static int local_unlinkat_common(FsContext *ctx, in=
t dirfd, const char *name,
>              }
>          }
>          map_dirfd =3D openat_dir(dirfd, VIRTFS_META_DIR);
> -        if (map_dirfd !=3D -1) {
> +        if (!qemu_fd_invalid(map_dirfd)) {
>              ret =3D qemu_unlinkat(map_dirfd, name, 0);
>              close_preserve_errno(map_dirfd);
>              if (ret < 0 && errno !=3D ENOENT) {
> @@ -1143,11 +1148,11 @@ static int local_remove(FsContext *ctx, const cha=
r *path)
>      char *dirpath =3D g_path_get_dirname(path);
>      char *name =3D g_path_get_basename(path);
>      int flags =3D 0;
> -    int dirfd;
> +    QemuFd_t dirfd;
>      int err =3D -1;
> =20
>      dirfd =3D local_opendir_nofollow(ctx, dirpath);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          goto out;
>      }
> =20
> @@ -1188,10 +1193,11 @@ static int local_fsync(FsContext *ctx, int fid_ty=
pe,
> =20
>  static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *=
stbuf)
>  {
> -    int fd, ret;
> +    QemuFd_t fd;
> +    int ret;
> =20
>      fd =3D local_open_nofollow(s, fs_path->data, O_RDONLY, 0);
> -    if (fd =3D=3D -1) {
> +    if (qemu_fd_invalid(fd)) {
>          return -1;
>      }
>      ret =3D fstatfs(fd, stbuf);
> @@ -1276,7 +1282,7 @@ static int local_renameat(FsContext *ctx, V9fsPath =
*olddir,
>                            const char *new_name)
>  {
>      int ret;
> -    int odirfd, ndirfd;
> +    QemuFd_t odirfd, ndirfd;
> =20
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          (local_is_mapped_file_metadata(ctx, old_name) ||
> @@ -1286,12 +1292,12 @@ static int local_renameat(FsContext *ctx, V9fsPat=
h *olddir,
>      }
> =20
>      odirfd =3D local_opendir_nofollow(ctx, olddir->data);
> -    if (odirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(odirfd)) {
>          return -1;
>      }
> =20
>      ndirfd =3D local_opendir_nofollow(ctx, newdir->data);
> -    if (ndirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(ndirfd)) {
>          close_preserve_errno(odirfd);
>          return -1;
>      }
> @@ -1302,7 +1308,7 @@ static int local_renameat(FsContext *ctx, V9fsPath =
*olddir,
>      }
> =20
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> -        int omap_dirfd, nmap_dirfd;
> +        QemuFd_t omap_dirfd, nmap_dirfd;
> =20
>          ret =3D qemu_mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
>          if (ret < 0 && errno !=3D EEXIST) {
> @@ -1310,12 +1316,12 @@ static int local_renameat(FsContext *ctx, V9fsPat=
h *olddir,
>          }
> =20
>          omap_dirfd =3D openat_dir(odirfd, VIRTFS_META_DIR);
> -        if (omap_dirfd =3D=3D -1) {
> +        if (qemu_fd_invalid(omap_dirfd)) {
>              goto err;
>          }
> =20
>          nmap_dirfd =3D openat_dir(ndirfd, VIRTFS_META_DIR);
> -        if (nmap_dirfd =3D=3D -1) {
> +        if (qemu_fd_invalid(nmap_dirfd)) {
>              close_preserve_errno(omap_dirfd);
>              goto err;
>          }
> @@ -1373,7 +1379,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath =
*dir,
>                            const char *name, int flags)
>  {
>      int ret;
> -    int dirfd;
> +    QemuFd_t dirfd;
> =20
>      if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
>          local_is_mapped_file_metadata(ctx, name)) {
> @@ -1382,7 +1388,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath =
*dir,
>      }
> =20
>      dirfd =3D local_opendir_nofollow(ctx, dir->data);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          return -1;
>      }
> =20
> @@ -1446,7 +1452,7 @@ static int local_init(FsContext *ctx, Error **errp)
>      LocalData *data =3D g_malloc(sizeof(*data));
> =20
>      data->mountfd =3D open(ctx->fs_root, O_DIRECTORY | O_RDONLY);
> -    if (data->mountfd =3D=3D -1) {
> +    if (qemu_fd_invalid(data->mountfd)) {
>          error_setg_errno(errp, errno, "failed to open '%s'", ctx->fs_roo=
t);
>          goto err;
>      }
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index 95146e7354..f85cfd26bb 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -11,8 +11,8 @@
>  #include "qemu/error-report.h"
>  #include "9p-util.h"
> =20
> -ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char=
 *name,
> -                             void *value, size_t size)
> +ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> +                             const char *name, void *value, size_t size)
>  {
>      int ret;
>      int fd =3D openat_file(dirfd, filename,
> @@ -25,7 +25,7 @@ ssize_t fgetxattrat_nofollow(int dirfd, const char *fil=
ename, const char *name,
>      return ret;
>  }
> =20
> -ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> +ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
>                                char *list, size_t size)
>  {
>      int ret;
> @@ -39,7 +39,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *fi=
lename,
>      return ret;
>  }
> =20
> -ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> +ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
>                                  const char *name)
>  {
>      int ret;
> @@ -52,8 +52,8 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *=
filename,
>      return ret;
>  }
> =20
> -int fsetxattrat_nofollow(int dirfd, const char *filename, const char *na=
me,
> -                         void *value, size_t size, int flags)
> +int fsetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> +                         const char *name, void *value, size_t size, int=
 flags)
>  {
>      int ret;
>      int fd =3D openat_file(dirfd, filename, O_PATH_9P_UTIL | O_NOFOLLOW,=
 0);
> @@ -110,7 +110,7 @@ out:
>      return err;
>  }
> =20
> -int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode, dev_=
t dev)
>  {
>      int preserved_errno, err;
> =20
> diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
> index db451b0784..8dd9da10b6 100644
> --- a/hw/9pfs/9p-util-linux.c
> +++ b/hw/9pfs/9p-util-linux.c
> @@ -19,8 +19,8 @@
>  #include "qemu/xattr.h"
>  #include "9p-util.h"
> =20
> -ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char=
 *name,
> -                             void *value, size_t size)
> +ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> +                             const char *name, void *value, size_t size)
>  {
>      char *proc_path =3D g_strdup_printf("/proc/self/fd/%d/%s", dirfd, fi=
lename);
>      int ret;
> @@ -30,7 +30,7 @@ ssize_t fgetxattrat_nofollow(int dirfd, const char *fil=
ename, const char *name,
>      return ret;
>  }
> =20
> -ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> +ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
>                                char *list, size_t size)
>  {
>      char *proc_path =3D g_strdup_printf("/proc/self/fd/%d/%s", dirfd, fi=
lename);
> @@ -41,7 +41,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *fi=
lename,
>      return ret;
>  }
> =20
> -ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> +ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
>                                  const char *name)
>  {
>      char *proc_path =3D g_strdup_printf("/proc/self/fd/%d/%s", dirfd, fi=
lename);
> @@ -52,8 +52,8 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *=
filename,
>      return ret;
>  }
> =20
> -int fsetxattrat_nofollow(int dirfd, const char *filename, const char *na=
me,
> -                         void *value, size_t size, int flags)
> +int fsetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> +                         const char *name, void *value, size_t size, int=
 flags)
>  {
>      char *proc_path =3D g_strdup_printf("/proc/self/fd/%d/%s", dirfd, fi=
lename);
>      int ret;
> @@ -64,7 +64,7 @@ int fsetxattrat_nofollow(int dirfd, const char *filenam=
e, const char *name,
> =20
>  }
> =20
> -int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode, dev_=
t dev)
>  {
>      return mknodat(dirfd, filename, mode, dev);
>  }
> diff --git a/hw/9pfs/9p-xattr.c b/hw/9pfs/9p-xattr.c
> index 9ae69dd8db..062bf2d1f0 100644
> --- a/hw/9pfs/9p-xattr.c
> +++ b/hw/9pfs/9p-xattr.c
> @@ -78,13 +78,13 @@ ssize_t v9fs_list_xattr(FsContext *ctx, const char *p=
ath,
>      char *orig_value, *orig_value_start;
>      ssize_t xattr_len, parsed_len =3D 0, attr_len;
>      char *dirpath, *name;
> -    int dirfd;
> +    QemuFd_t dirfd;
> =20
>      /* Get the actual len */
>      dirpath =3D g_path_get_dirname(path);
>      dirfd =3D local_opendir_nofollow(ctx, dirpath);
>      g_free(dirpath);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          return -1;
>      }
> =20
> @@ -168,11 +168,11 @@ ssize_t local_getxattr_nofollow(FsContext *ctx, con=
st char *path,
>  {
>      char *dirpath =3D g_path_get_dirname(path);
>      char *filename =3D g_path_get_basename(path);
> -    int dirfd;
> +    QemuFd_t dirfd;
>      ssize_t ret =3D -1;
> =20
>      dirfd =3D local_opendir_nofollow(ctx, dirpath);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          goto out;
>      }
> =20
> @@ -196,11 +196,11 @@ ssize_t local_setxattr_nofollow(FsContext *ctx, con=
st char *path,
>  {
>      char *dirpath =3D g_path_get_dirname(path);
>      char *filename =3D g_path_get_basename(path);
> -    int dirfd;
> +    QemuFd_t dirfd;
>      ssize_t ret =3D -1;
> =20
>      dirfd =3D local_opendir_nofollow(ctx, dirpath);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          goto out;
>      }
> =20
> @@ -223,11 +223,11 @@ ssize_t local_removexattr_nofollow(FsContext *ctx, =
const char *path,
>  {
>      char *dirpath =3D g_path_get_dirname(path);
>      char *filename =3D g_path_get_basename(path);
> -    int dirfd;
> +    QemuFd_t dirfd;
>      ssize_t ret =3D -1;
> =20
>      dirfd =3D local_opendir_nofollow(ctx, dirpath);
> -    if (dirfd =3D=3D -1) {
> +    if (qemu_fd_invalid(dirfd)) {
>          goto out;
>      }
> =20


