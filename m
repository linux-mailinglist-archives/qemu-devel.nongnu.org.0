Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF52B630E12
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 11:21:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owKwj-0005Rz-Da; Sat, 19 Nov 2022 05:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1owKwh-0005Rm-U6
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 05:19:35 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1owKwd-0004hg-Ng
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 05:19:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.136])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 7104F2AEAD;
 Sat, 19 Nov 2022 10:19:17 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Sat, 19 Nov
 2022 11:19:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004044b76dd-85e5-498a-8fa7-6e2b32d1f2c5,
 3F8D1337C06BC7E92487BFC29CC52BE0C50D7DB5) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Sat, 19 Nov 2022 11:19:15 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
CC: Bin Meng <bin.meng@windriver.com>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 05/19] hw/9pfs: Update 9pfs to use the new QemuFd_t type
Message-ID: <20221119111915.591afa58@bahia>
In-Reply-To: <185421545.bPZoAotuqs@silver>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-6-bin.meng@windriver.com>
 <20221118102951.42d2ce1f@bahia> <185421545.bPZoAotuqs@silver>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: a732f128-0d35-42bf-bb35-396438605927
X-Ovh-Tracer-Id: 12512407140812102109
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrhedvgdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtjeetteeujeeutefgtdegteeuvdeujefhiedtvdeuveejieffjeekhfefgeduvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhmihgtrhhoshhofhhtrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhgpohhsshestghruhguvggshihtvgdrtghomhdpsghinhdrmhgvnhhgseifihhnughrihhvvghrrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.254.192; envelope-from=groug@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 18 Nov 2022 14:38:00 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Friday, November 18, 2022 10:29:51 AM CET Greg Kurz wrote:
> > On Fri, 11 Nov 2022 12:22:11 +0800
> > Bin Meng <bin.meng@windriver.com> wrote:
> > 
> > > With this new QemuFd_t type, it significantly reduces the number of
> > 
> > I cannot find the definition of this type, nor the definition of
> > qemu_fd_invalid(). Missing patch ?
> 
> It's in patch 4. Looks like we were not CCed on that patch. :(
> 

Oh I didn't check the numbering. I guess we were not CCed automatically...

> https://lore.kernel.org/qemu-devel/20221111042225.1115931-5-bin.meng@windriver.com/
> 

... because this only touches include/qemu/osdep.h .

Bin,

Please ensure that the maintainers are in the Cc list for all
patches in such a series, e.g. with explicit --cc arguments to
git-send-email.

> > Anyway, IIUC this type is an int for linux and a HANDLE for windows,
> > right ?
> > 
> > According to win32 documentation at [1] :
> > 
> > HANDLE	
> > A handle to an object.
> > 
> > This type is declared in WinNT.h as follows:
> > 
> > typedef PVOID HANDLE;
> > 
> > and
> > 
> > PVOID	
> > A pointer to any type.
> > 
> > This type is declared in WinNT.h as follows:
> > 
> > typedef void *PVOID;
> > 
> > HANDLE is void *.
> > 
> > From docs/devel/style.rst:
> > 
> > Naming
> > ======
> > 
> > Variables are lower_case_with_underscores; easy to type and read.  Structured
> > type names are in CamelCase; harder to type but standing out.  Enum type
> > names and function type names should also be in CamelCase.  Scalar type
> > names are lower_case_with_underscores_ending_with_a_t, like the POSIX
> > uint64_t and family.  Note that this last convention contradicts POSIX
> > and is therefore likely to be changed.
> > 
> > Both int and void * are scalar types, so I'd rather name it qemu_fd_t,
> > not using CamelCase at all so that it cannot be confused with a struct.
> > 
> > [1] https://learn.microsoft.com/en-us/windows/win32/winprog/windows-data-types
> 
> Not that I had a strong opinion about this issue (as in general with coding
> style topics). It was one of my suggested type names. To make this type long-
> term proof I suggested to handle it as if it was a truly opaque type in QEMU:
> 

A true opaque type in C is implemented with a structured type and pointers
to this type.

> https://lore.kernel.org/qemu-devel/4620086.XpUeK0iDWE@silver/
> 
> That is to explicitly not try to do things like:
> 
>     if (fd == -1)
> 
> at least not hard wired in user code. According to QEMU code style you should
> probably then drop the trailing "_t" though.
> 

Yes, either one is fine I guess. Most important part is to provide
a documented API to manipulate that type since, no matter the name,
it is still a scalar type that can be manipulated as such.

> > > deviated code paths when adding Windows support.
> > > 
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > 
> > > ---
> > > 
> > > Changes in v2:
> > > - Use the new QemuFd_t type
> > > 
> > >  hw/9pfs/9p-local.h       |   6 +-
> > >  hw/9pfs/9p-util.h        |  26 +++---
> > >  hw/9pfs/9p-local.c       | 174 ++++++++++++++++++++-------------------
> > >  hw/9pfs/9p-util-darwin.c |  14 ++--
> > >  hw/9pfs/9p-util-linux.c  |  14 ++--
> > >  hw/9pfs/9p-xattr.c       |  16 ++--
> > >  6 files changed, 129 insertions(+), 121 deletions(-)
> > > 
> > > diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
> > > index 32c72749d9..66a21316a0 100644
> > > --- a/hw/9pfs/9p-local.h
> > > +++ b/hw/9pfs/9p-local.h
> > > @@ -13,8 +13,8 @@
> > >  #ifndef QEMU_9P_LOCAL_H
> > >  #define QEMU_9P_LOCAL_H
> > >  
> > > -int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> > > -                        mode_t mode);
> > > -int local_opendir_nofollow(FsContext *fs_ctx, const char *path);
> > > +QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> > > +                             mode_t mode);
> > > +QemuFd_t local_opendir_nofollow(FsContext *fs_ctx, const char *path);
> > >  
> > >  #endif
> > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > > index c314cf381d..3d6bd1a51e 100644
> > > --- a/hw/9pfs/9p-util.h
> > > +++ b/hw/9pfs/9p-util.h
> > > @@ -101,30 +101,31 @@ static inline int errno_to_dotl(int err) {
> > >  #define qemu_utimensat  utimensat
> > >  #define qemu_unlinkat   unlinkat
> > >  
> > > -static inline void close_preserve_errno(int fd)
> > > +static inline void close_preserve_errno(QemuFd_t fd)
> > >  {
> > >      int serrno = errno;
> > >      close(fd);
> > >      errno = serrno;
> > >  }
> > >  
> > > -static inline int openat_dir(int dirfd, const char *name)
> > > +static inline QemuFd_t openat_dir(QemuFd_t dirfd, const char *name)
> > >  {
> > >      return qemu_openat(dirfd, name,
> > >                         O_DIRECTORY | O_RDONLY | O_NOFOLLOW | O_PATH_9P_UTIL);
> > >  }
> > >  
> > > -static inline int openat_file(int dirfd, const char *name, int flags,
> > > -                              mode_t mode)
> > > +static inline QemuFd_t openat_file(QemuFd_t dirfd, const char *name,
> > > +                                   int flags, mode_t mode)
> > >  {
> > > -    int fd, serrno, ret;
> > > +    int serrno, ret;
> > > +    QemuFd_t fd;
> > >  
> > >  #ifndef CONFIG_DARWIN
> > >  again:
> > >  #endif
> > >      fd = qemu_openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
> > >                       mode);
> > > -    if (fd == -1) {
> > > +    if (qemu_fd_invalid(fd)) {
> > >  #ifndef CONFIG_DARWIN
> > >          if (errno == EPERM && (flags & O_NOATIME)) {
> > >              /*
> > > @@ -155,13 +156,13 @@ again:
> > >      return fd;
> > >  }
> > >  
> > > -ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *name,
> > > -                             void *value, size_t size);
> > > -int fsetxattrat_nofollow(int dirfd, const char *path, const char *name,
> > > +ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *path,
> > > +                             const char *name, void *value, size_t size);
> > > +int fsetxattrat_nofollow(QemuFd_t dirfd, const char *path, const char *name,
> > >                           void *value, size_t size, int flags);
> > > -ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> > > +ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > >                                char *list, size_t size);
> > > -ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> > > +ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > >                                  const char *name);
> > >  
> > >  /*
> > > @@ -219,6 +220,7 @@ static inline struct dirent *qemu_dirent_dup(struct dirent *dent)
> > >  #if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
> > >  int pthread_fchdir_np(int fd) __attribute__((weak_import));
> > >  #endif
> > > -int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
> > > +int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode,
> > > +                 dev_t dev);
> > >  
> > >  #endif
> > > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > > index d2246a3d7e..22377a3105 100644
> > > --- a/hw/9pfs/9p-local.c
> > > +++ b/hw/9pfs/9p-local.c
> > > @@ -54,18 +54,18 @@
> > >  #endif
> > >  
> > >  typedef struct {
> > > -    int mountfd;
> > > +    QemuFd_t mountfd;
> > >  } LocalData;
> > >  
> > > -int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> > > -                        mode_t mode)
> > > +QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> > > +                             mode_t mode)
> > >  {
> > >      LocalData *data = fs_ctx->private;
> > > -    int fd = data->mountfd;
> > > +    QemuFd_t fd = data->mountfd;
> > >  
> > > -    while (*path && fd != -1) {
> > > +    while (*path && !qemu_fd_invalid(fd)) {
> > >          const char *c;
> > > -        int next_fd;
> > > +        QemuFd_t next_fd;
> > >          char *head;
> > >  
> > >          /* Only relative paths without consecutive slashes */
> > > @@ -94,20 +94,21 @@ int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
> > >      return fd;
> > >  }
> > >  
> > > -int local_opendir_nofollow(FsContext *fs_ctx, const char *path)
> > > +QemuFd_t local_opendir_nofollow(FsContext *fs_ctx, const char *path)
> > >  {
> > >      return local_open_nofollow(fs_ctx, path, O_DIRECTORY | O_RDONLY, 0);
> > >  }
> > >  
> > > -static void renameat_preserve_errno(int odirfd, const char *opath, int ndirfd,
> > > -                                    const char *npath)
> > > +static void renameat_preserve_errno(QemuFd_t odirfd, const char *opath,
> > > +                                    QemuFd_t ndirfd, const char *npath)
> > >  {
> > >      int serrno = errno;
> > >      qemu_renameat(odirfd, opath, ndirfd, npath);
> > >      errno = serrno;
> > >  }
> > >  
> > > -static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
> > > +static void unlinkat_preserve_errno(QemuFd_t dirfd, const char *path,
> > > +                                    int flags)
> > >  {
> > >      int serrno = errno;
> > >      qemu_unlinkat(dirfd, path, flags);
> > > @@ -117,9 +118,10 @@ static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
> > >  #define VIRTFS_META_DIR ".virtfs_metadata"
> > >  #define VIRTFS_META_ROOT_FILE VIRTFS_META_DIR "_root"
> > >  
> > > -static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
> > > +static FILE *local_fopenat(QemuFd_t dirfd, const char *name, const char *mode)
> > >  {
> > > -    int fd, o_mode = 0;
> > > +    QemuFd_t fd;
> > > +    int o_mode = 0;
> > >      FILE *fp;
> > >      int flags;
> > >      /*
> > > @@ -134,7 +136,7 @@ static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
> > >          return NULL;
> > >      }
> > >      fd = openat_file(dirfd, name, flags, o_mode);
> > > -    if (fd == -1) {
> > > +    if (qemu_fd_invalid(fd)) {
> > >          return NULL;
> > >      }
> > >      fp = fdopen(fd, mode);
> > > @@ -145,16 +147,16 @@ static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
> > >  }
> > >  
> > >  #define ATTR_MAX 100
> > > -static void local_mapped_file_attr(int dirfd, const char *name,
> > > +static void local_mapped_file_attr(QemuFd_t dirfd, const char *name,
> > >                                     struct stat *stbuf)
> > >  {
> > >      FILE *fp;
> > >      char buf[ATTR_MAX];
> > > -    int map_dirfd;
> > > +    QemuFd_t map_dirfd;
> > >  
> > >      if (strcmp(name, ".")) {
> > >          map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
> > > -        if (map_dirfd == -1) {
> > > +        if (qemu_fd_invalid(map_dirfd)) {
> > >              return;
> > >          }
> > >  
> > > @@ -187,10 +189,10 @@ static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct stat *stbuf)
> > >      int err = -1;
> > >      char *dirpath = g_path_get_dirname(fs_path->data);
> > >      char *name = g_path_get_basename(fs_path->data);
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >  
> > >      dirfd = local_opendir_nofollow(fs_ctx, dirpath);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          goto out;
> > >      }
> > >  
> > > @@ -233,14 +235,14 @@ out:
> > >      return err;
> > >  }
> > >  
> > > -static int local_set_mapped_file_attrat(int dirfd, const char *name,
> > > +static int local_set_mapped_file_attrat(QemuFd_t dirfd, const char *name,
> > >                                          FsCred *credp)
> > >  {
> > >      FILE *fp;
> > >      int ret;
> > >      char buf[ATTR_MAX];
> > >      int uid = -1, gid = -1, mode = -1, rdev = -1;
> > > -    int map_dirfd = -1, map_fd;
> > > +    QemuFd_t map_dirfd = QEMU_FD_INVALID, map_fd;
> > >      bool is_root = !strcmp(name, ".");
> > >  
> > >      if (is_root) {
> > > @@ -259,7 +261,7 @@ static int local_set_mapped_file_attrat(int dirfd, const char *name,
> > >          }
> > >  
> > >          map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
> > > -        if (map_dirfd == -1) {
> > > +        if (qemu_fd_invalid(map_dirfd)) {
> > >              return -1;
> > >          }
> > >  
> > > @@ -296,7 +298,7 @@ update_map_file:
> > >          /* We can't go this far with map_dirfd not being a valid file descriptor
> > >           * but some versions of gcc aren't smart enough to see it.
> > >           */
> > > -        if (map_dirfd != -1) {
> > > +        if (!qemu_fd_invalid(map_dirfd)) {
> > >              close_preserve_errno(map_dirfd);
> > >          }
> > >      }
> > > @@ -305,7 +307,7 @@ update_map_file:
> > >      }
> > >  
> > >      map_fd = fileno(fp);
> > > -    assert(map_fd != -1);
> > > +    assert(!qemu_fd_invalid(map_fd));
> > >      ret = fchmod(map_fd, 0600);
> > >      assert(ret == 0);
> > >  
> > > @@ -339,10 +341,11 @@ update_map_file:
> > >      return 0;
> > >  }
> > >  
> > > -static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
> > > +static int fchmodat_nofollow(QemuFd_t dirfd, const char *name, mode_t mode)
> > >  {
> > >      struct stat stbuf;
> > > -    int fd, ret;
> > > +    QemuFd_t fd;
> > > +    int ret;
> > >  
> > >      /* FIXME: this should be handled with fchmodat(AT_SYMLINK_NOFOLLOW).
> > >       * Unfortunately, the linux kernel doesn't implement it yet.
> > > @@ -362,16 +365,16 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
> > >      /* Fallback for systems that don't support O_PATH: we depend on the file
> > >       * being readable or writable.
> > >       */
> > > -    if (fd == -1) {
> > > +    if (qemu_fd_invalid(fd)) {
> > >          /* In case the file is writable-only and isn't a directory. */
> > >          if (errno == EACCES) {
> > >              fd = openat_file(dirfd, name, O_WRONLY, 0);
> > >          }
> > > -        if (fd == -1 && errno == EISDIR) {
> > > +        if (qemu_fd_invalid(fd) && errno == EISDIR) {
> > >              errno = EACCES;
> > >          }
> > >      }
> > > -    if (fd == -1) {
> > > +    if (qemu_fd_invalid(fd)) {
> > >          return -1;
> > >      }
> > >      ret = fchmod(fd, mode);
> > > @@ -380,7 +383,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
> > >       * link, O_PATH | O_NOFOLLOW causes openat(2) to return a file descriptor
> > >       * referring to the symbolic link.
> > >       */
> > > -    if (fd == -1) {
> > > +    if (qemu_fd_invalid(fd)) {
> > >          return -1;
> > >      }
> > >  
> > > @@ -401,7 +404,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
> > >      return ret;
> > >  }
> > >  
> > > -static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
> > > +static int local_set_xattrat(QemuFd_t dirfd, const char *path, FsCred *credp)
> > >  {
> > >      int err;
> > >  
> > > @@ -440,7 +443,7 @@ static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
> > >      return 0;
> > >  }
> > >  
> > > -static int local_set_cred_passthrough(FsContext *fs_ctx, int dirfd,
> > > +static int local_set_cred_passthrough(FsContext *fs_ctx, QemuFd_t dirfd,
> > >                                        const char *name, FsCred *credp)
> > >  {
> > >      if (fchownat(dirfd, name, credp->fc_uid, credp->fc_gid,
> > > @@ -464,10 +467,10 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
> > >  
> > >      if ((fs_ctx->export_flags & V9FS_SM_MAPPED) ||
> > >          (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE)) {
> > > -        int fd;
> > > +        QemuFd_t fd;
> > >  
> > >          fd = local_open_nofollow(fs_ctx, fs_path->data, O_RDONLY, 0);
> > > -        if (fd == -1) {
> > > +        if (qemu_fd_invalid(fd)) {
> > >              return -1;
> > >          }
> > >          do {
> > > @@ -478,10 +481,10 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
> > >                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> > >          char *dirpath = g_path_get_dirname(fs_path->data);
> > >          char *name = g_path_get_basename(fs_path->data);
> > > -        int dirfd;
> > > +        QemuFd_t dirfd;
> > >  
> > >          dirfd = local_opendir_nofollow(fs_ctx, dirpath);
> > > -        if (dirfd == -1) {
> > > +        if (qemu_fd_invalid(dirfd)) {
> > >              goto out;
> > >          }
> > >  
> > > @@ -507,10 +510,10 @@ static int local_closedir(FsContext *ctx, V9fsFidOpenState *fs)
> > >  static int local_open(FsContext *ctx, V9fsPath *fs_path,
> > >                        int flags, V9fsFidOpenState *fs)
> > >  {
> > > -    int fd;
> > > +    QemuFd_t fd;
> > >  
> > >      fd = local_open_nofollow(ctx, fs_path->data, flags, 0);
> > > -    if (fd == -1) {
> > > +    if (qemu_fd_invalid(fd)) {
> > >          return -1;
> > >      }
> > >      fs->fd = fd;
> > > @@ -520,11 +523,11 @@ static int local_open(FsContext *ctx, V9fsPath *fs_path,
> > >  static int local_opendir(FsContext *ctx,
> > >                           V9fsPath *fs_path, V9fsFidOpenState *fs)
> > >  {
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >      DIR *stream;
> > >  
> > >      dirfd = local_opendir_nofollow(ctx, fs_path->data);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          return -1;
> > >      }
> > >  
> > > @@ -640,10 +643,10 @@ static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
> > >      char *dirpath = g_path_get_dirname(fs_path->data);
> > >      char *name = g_path_get_basename(fs_path->data);
> > >      int ret = -1;
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >  
> > >      dirfd = local_opendir_nofollow(fs_ctx, dirpath);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          goto out;
> > >      }
> > >  
> > > @@ -667,7 +670,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
> > >                         const char *name, FsCred *credp)
> > >  {
> > >      int err = -1;
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >  
> > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > >          local_is_mapped_file_metadata(fs_ctx, name)) {
> > > @@ -676,7 +679,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
> > >      }
> > >  
> > >      dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          return -1;
> > >      }
> > >  
> > > @@ -719,7 +722,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
> > >                         const char *name, FsCred *credp)
> > >  {
> > >      int err = -1;
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >  
> > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > >          local_is_mapped_file_metadata(fs_ctx, name)) {
> > > @@ -728,7 +731,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
> > >      }
> > >  
> > >      dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          return -1;
> > >      }
> > >  
> > > @@ -816,9 +819,9 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
> > >  static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
> > >                         int flags, FsCred *credp, V9fsFidOpenState *fs)
> > >  {
> > > -    int fd = -1;
> > > +    QemuFd_t fd = QEMU_FD_INVALID;
> > >      int err = -1;
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >  
> > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > >          local_is_mapped_file_metadata(fs_ctx, name)) {
> > > @@ -832,7 +835,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
> > >      flags |= O_NOFOLLOW;
> > >  
> > >      dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          return -1;
> > >      }
> > >  
> > > @@ -840,7 +843,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
> > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > >          fd = openat_file(dirfd, name, flags, fs_ctx->fmode);
> > > -        if (fd == -1) {
> > > +        if (qemu_fd_invalid(fd)) {
> > >              goto out;
> > >          }
> > >          credp->fc_mode = credp->fc_mode | S_IFREG;
> > > @@ -856,7 +859,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
> > >      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
> > >                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> > >          fd = openat_file(dirfd, name, flags, credp->fc_mode);
> > > -        if (fd == -1) {
> > > +        if (qemu_fd_invalid(fd)) {
> > >              goto out;
> > >          }
> > >          err = local_set_cred_passthrough(fs_ctx, dirfd, name, credp);
> > > @@ -882,7 +885,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
> > >                           V9fsPath *dir_path, const char *name, FsCred *credp)
> > >  {
> > >      int err = -1;
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >  
> > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > >          local_is_mapped_file_metadata(fs_ctx, name)) {
> > > @@ -891,19 +894,19 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
> > >      }
> > >  
> > >      dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          return -1;
> > >      }
> > >  
> > >      /* Determine the security model */
> > >      if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > >          fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > -        int fd;
> > > +        QemuFd_t fd;
> > >          ssize_t oldpath_size, write_size;
> > >  
> > >          fd = openat_file(dirfd, name, O_CREAT | O_EXCL | O_RDWR,
> > >                           fs_ctx->fmode);
> > > -        if (fd == -1) {
> > > +        if (qemu_fd_invalid(fd)) {
> > >              goto out;
> > >          }
> > >          /* Write the oldpath (target) to the file. */
> > > @@ -962,7 +965,7 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
> > >      char *odirpath = g_path_get_dirname(oldpath->data);
> > >      char *oname = g_path_get_basename(oldpath->data);
> > >      int ret = -1;
> > > -    int odirfd, ndirfd;
> > > +    QemuFd_t odirfd, ndirfd;
> > >  
> > >      if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > >          local_is_mapped_file_metadata(ctx, name)) {
> > > @@ -971,12 +974,12 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
> > >      }
> > >  
> > >      odirfd = local_opendir_nofollow(ctx, odirpath);
> > > -    if (odirfd == -1) {
> > > +    if (qemu_fd_invalid(odirfd)) {
> > >          goto out;
> > >      }
> > >  
> > >      ndirfd = local_opendir_nofollow(ctx, dirpath->data);
> > > -    if (ndirfd == -1) {
> > > +    if (qemu_fd_invalid(ndirfd)) {
> > >          close_preserve_errno(odirfd);
> > >          goto out;
> > >      }
> > > @@ -996,12 +999,12 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
> > >          }
> > >  
> > >          omap_dirfd = openat_dir(odirfd, VIRTFS_META_DIR);
> > > -        if (omap_dirfd == -1) {
> > > +        if (qemu_fd_invalid(omap_dirfd)) {
> > >              goto err;
> > >          }
> > >  
> > >          nmap_dirfd = openat_dir(ndirfd, VIRTFS_META_DIR);
> > > -        if (nmap_dirfd == -1) {
> > > +        if (qemu_fd_invalid(nmap_dirfd)) {
> > >              close_preserve_errno(omap_dirfd);
> > >              goto err;
> > >          }
> > > @@ -1032,10 +1035,11 @@ out:
> > >  
> > >  static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
> > >  {
> > > -    int fd, ret;
> > > +    QemuFd_t fd;
> > > +    int ret;
> > >  
> > >      fd = local_open_nofollow(ctx, fs_path->data, O_WRONLY, 0);
> > > -    if (fd == -1) {
> > > +    if (qemu_fd_invalid(fd)) {
> > >          return -1;
> > >      }
> > >      ret = ftruncate(fd, size);
> > > @@ -1048,10 +1052,10 @@ static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
> > >      char *dirpath = g_path_get_dirname(fs_path->data);
> > >      char *name = g_path_get_basename(fs_path->data);
> > >      int ret = -1;
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >  
> > >      dirfd = local_opendir_nofollow(fs_ctx, dirpath);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          goto out;
> > >      }
> > >  
> > > @@ -1078,10 +1082,11 @@ static int local_utimensat(FsContext *s, V9fsPath *fs_path,
> > >  {
> > >      char *dirpath = g_path_get_dirname(fs_path->data);
> > >      char *name = g_path_get_basename(fs_path->data);
> > > -    int dirfd, ret = -1;
> > > +    QemuFd_t dirfd;
> > > +    int ret = -1;
> > >  
> > >      dirfd = local_opendir_nofollow(s, dirpath);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          goto out;
> > >      }
> > >  
> > > @@ -1093,13 +1098,13 @@ out:
> > >      return ret;
> > >  }
> > >  
> > > -static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
> > > -                                 int flags)
> > > +static int local_unlinkat_common(FsContext *ctx, QemuFd_t dirfd,
> > > +                                 const char *name, int flags)
> > >  {
> > >      int ret;
> > >  
> > >      if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > -        int map_dirfd;
> > > +        QemuFd_t map_dirfd;
> > >  
> > >          /* We need to remove the metadata as well:
> > >           * - the metadata directory if we're removing a directory
> > > @@ -1110,10 +1115,10 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
> > >           * mode. We just ignore the error.
> > >           */
> > >          if (flags == AT_REMOVEDIR) {
> > > -            int fd;
> > > +            QemuFd_t fd;
> > >  
> > >              fd = openat_dir(dirfd, name);
> > > -            if (fd == -1) {
> > > +            if (qemu_fd_invalid(fd)) {
> > >                  return -1;
> > >              }
> > >              ret = qemu_unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
> > > @@ -1123,7 +1128,7 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
> > >              }
> > >          }
> > >          map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
> > > -        if (map_dirfd != -1) {
> > > +        if (!qemu_fd_invalid(map_dirfd)) {
> > >              ret = qemu_unlinkat(map_dirfd, name, 0);
> > >              close_preserve_errno(map_dirfd);
> > >              if (ret < 0 && errno != ENOENT) {
> > > @@ -1143,11 +1148,11 @@ static int local_remove(FsContext *ctx, const char *path)
> > >      char *dirpath = g_path_get_dirname(path);
> > >      char *name = g_path_get_basename(path);
> > >      int flags = 0;
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >      int err = -1;
> > >  
> > >      dirfd = local_opendir_nofollow(ctx, dirpath);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          goto out;
> > >      }
> > >  
> > > @@ -1188,10 +1193,11 @@ static int local_fsync(FsContext *ctx, int fid_type,
> > >  
> > >  static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
> > >  {
> > > -    int fd, ret;
> > > +    QemuFd_t fd;
> > > +    int ret;
> > >  
> > >      fd = local_open_nofollow(s, fs_path->data, O_RDONLY, 0);
> > > -    if (fd == -1) {
> > > +    if (qemu_fd_invalid(fd)) {
> > >          return -1;
> > >      }
> > >      ret = fstatfs(fd, stbuf);
> > > @@ -1276,7 +1282,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
> > >                            const char *new_name)
> > >  {
> > >      int ret;
> > > -    int odirfd, ndirfd;
> > > +    QemuFd_t odirfd, ndirfd;
> > >  
> > >      if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > >          (local_is_mapped_file_metadata(ctx, old_name) ||
> > > @@ -1286,12 +1292,12 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
> > >      }
> > >  
> > >      odirfd = local_opendir_nofollow(ctx, olddir->data);
> > > -    if (odirfd == -1) {
> > > +    if (qemu_fd_invalid(odirfd)) {
> > >          return -1;
> > >      }
> > >  
> > >      ndirfd = local_opendir_nofollow(ctx, newdir->data);
> > > -    if (ndirfd == -1) {
> > > +    if (qemu_fd_invalid(ndirfd)) {
> > >          close_preserve_errno(odirfd);
> > >          return -1;
> > >      }
> > > @@ -1302,7 +1308,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
> > >      }
> > >  
> > >      if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > > -        int omap_dirfd, nmap_dirfd;
> > > +        QemuFd_t omap_dirfd, nmap_dirfd;
> > >  
> > >          ret = qemu_mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
> > >          if (ret < 0 && errno != EEXIST) {
> > > @@ -1310,12 +1316,12 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
> > >          }
> > >  
> > >          omap_dirfd = openat_dir(odirfd, VIRTFS_META_DIR);
> > > -        if (omap_dirfd == -1) {
> > > +        if (qemu_fd_invalid(omap_dirfd)) {
> > >              goto err;
> > >          }
> > >  
> > >          nmap_dirfd = openat_dir(ndirfd, VIRTFS_META_DIR);
> > > -        if (nmap_dirfd == -1) {
> > > +        if (qemu_fd_invalid(nmap_dirfd)) {
> > >              close_preserve_errno(omap_dirfd);
> > >              goto err;
> > >          }
> > > @@ -1373,7 +1379,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
> > >                            const char *name, int flags)
> > >  {
> > >      int ret;
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >  
> > >      if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > >          local_is_mapped_file_metadata(ctx, name)) {
> > > @@ -1382,7 +1388,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
> > >      }
> > >  
> > >      dirfd = local_opendir_nofollow(ctx, dir->data);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          return -1;
> > >      }
> > >  
> > > @@ -1446,7 +1452,7 @@ static int local_init(FsContext *ctx, Error **errp)
> > >      LocalData *data = g_malloc(sizeof(*data));
> > >  
> > >      data->mountfd = open(ctx->fs_root, O_DIRECTORY | O_RDONLY);
> > > -    if (data->mountfd == -1) {
> > > +    if (qemu_fd_invalid(data->mountfd)) {
> > >          error_setg_errno(errp, errno, "failed to open '%s'", ctx->fs_root);
> > >          goto err;
> > >      }
> > > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > > index 95146e7354..f85cfd26bb 100644
> > > --- a/hw/9pfs/9p-util-darwin.c
> > > +++ b/hw/9pfs/9p-util-darwin.c
> > > @@ -11,8 +11,8 @@
> > >  #include "qemu/error-report.h"
> > >  #include "9p-util.h"
> > >  
> > > -ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> > > -                             void *value, size_t size)
> > > +ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > > +                             const char *name, void *value, size_t size)
> > >  {
> > >      int ret;
> > >      int fd = openat_file(dirfd, filename,
> > > @@ -25,7 +25,7 @@ ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> > >      return ret;
> > >  }
> > >  
> > > -ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> > > +ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > >                                char *list, size_t size)
> > >  {
> > >      int ret;
> > > @@ -39,7 +39,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> > >      return ret;
> > >  }
> > >  
> > > -ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> > > +ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > >                                  const char *name)
> > >  {
> > >      int ret;
> > > @@ -52,8 +52,8 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> > >      return ret;
> > >  }
> > >  
> > > -int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> > > -                         void *value, size_t size, int flags)
> > > +int fsetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > > +                         const char *name, void *value, size_t size, int flags)
> > >  {
> > >      int ret;
> > >      int fd = openat_file(dirfd, filename, O_PATH_9P_UTIL | O_NOFOLLOW, 0);
> > > @@ -110,7 +110,7 @@ out:
> > >      return err;
> > >  }
> > >  
> > > -int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> > > +int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode, dev_t dev)
> > >  {
> > >      int preserved_errno, err;
> > >  
> > > diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
> > > index db451b0784..8dd9da10b6 100644
> > > --- a/hw/9pfs/9p-util-linux.c
> > > +++ b/hw/9pfs/9p-util-linux.c
> > > @@ -19,8 +19,8 @@
> > >  #include "qemu/xattr.h"
> > >  #include "9p-util.h"
> > >  
> > > -ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> > > -                             void *value, size_t size)
> > > +ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > > +                             const char *name, void *value, size_t size)
> > >  {
> > >      char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
> > >      int ret;
> > > @@ -30,7 +30,7 @@ ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> > >      return ret;
> > >  }
> > >  
> > > -ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> > > +ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > >                                char *list, size_t size)
> > >  {
> > >      char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
> > > @@ -41,7 +41,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
> > >      return ret;
> > >  }
> > >  
> > > -ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> > > +ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > >                                  const char *name)
> > >  {
> > >      char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
> > > @@ -52,8 +52,8 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> > >      return ret;
> > >  }
> > >  
> > > -int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> > > -                         void *value, size_t size, int flags)
> > > +int fsetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > > +                         const char *name, void *value, size_t size, int flags)
> > >  {
> > >      char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
> > >      int ret;
> > > @@ -64,7 +64,7 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
> > >  
> > >  }
> > >  
> > > -int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> > > +int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode, dev_t dev)
> > >  {
> > >      return mknodat(dirfd, filename, mode, dev);
> > >  }
> > > diff --git a/hw/9pfs/9p-xattr.c b/hw/9pfs/9p-xattr.c
> > > index 9ae69dd8db..062bf2d1f0 100644
> > > --- a/hw/9pfs/9p-xattr.c
> > > +++ b/hw/9pfs/9p-xattr.c
> > > @@ -78,13 +78,13 @@ ssize_t v9fs_list_xattr(FsContext *ctx, const char *path,
> > >      char *orig_value, *orig_value_start;
> > >      ssize_t xattr_len, parsed_len = 0, attr_len;
> > >      char *dirpath, *name;
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >  
> > >      /* Get the actual len */
> > >      dirpath = g_path_get_dirname(path);
> > >      dirfd = local_opendir_nofollow(ctx, dirpath);
> > >      g_free(dirpath);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          return -1;
> > >      }
> > >  
> > > @@ -168,11 +168,11 @@ ssize_t local_getxattr_nofollow(FsContext *ctx, const char *path,
> > >  {
> > >      char *dirpath = g_path_get_dirname(path);
> > >      char *filename = g_path_get_basename(path);
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >      ssize_t ret = -1;
> > >  
> > >      dirfd = local_opendir_nofollow(ctx, dirpath);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          goto out;
> > >      }
> > >  
> > > @@ -196,11 +196,11 @@ ssize_t local_setxattr_nofollow(FsContext *ctx, const char *path,
> > >  {
> > >      char *dirpath = g_path_get_dirname(path);
> > >      char *filename = g_path_get_basename(path);
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >      ssize_t ret = -1;
> > >  
> > >      dirfd = local_opendir_nofollow(ctx, dirpath);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          goto out;
> > >      }
> > >  
> > > @@ -223,11 +223,11 @@ ssize_t local_removexattr_nofollow(FsContext *ctx, const char *path,
> > >  {
> > >      char *dirpath = g_path_get_dirname(path);
> > >      char *filename = g_path_get_basename(path);
> > > -    int dirfd;
> > > +    QemuFd_t dirfd;
> > >      ssize_t ret = -1;
> > >  
> > >      dirfd = local_opendir_nofollow(ctx, dirpath);
> > > -    if (dirfd == -1) {
> > > +    if (qemu_fd_invalid(dirfd)) {
> > >          goto out;
> > >      }
> > >  
> > 
> > 
> > 
> 
> 


