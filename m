Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD143279C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:30:02 +0200 (CEST)
Received: from localhost ([::1]:51038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcYKf-0006eX-1s
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mcYAB-00034N-DA
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mcYA6-0003gF-9F
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634584745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X1wky+sLLu5iv/q+Y4a4nO8pUUs7BQSK9SiR0iPOgmU=;
 b=CsQHwqjxh6OI8Mo+KslRujjzkg4YvoxH1gfkHBCZCd78JvaYQOUur401RZG5RHabgchLl8
 VCbZSLM98CflnK1nWk/0akVgLSBo81NocdAu4sGaUAmgW5B1c+Jlj8WtiSUbXciM+NcD0G
 6Z4+SaUT21mXcLZ6rq5P7UKthTSEpFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-DQpg23bPNnmdkK5lMIlz3A-1; Mon, 18 Oct 2021 15:19:04 -0400
X-MC-Unique: DQpg23bPNnmdkK5lMIlz3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D03A835B4A
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 19:19:03 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.33.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59E985DF21;
 Mon, 18 Oct 2021 19:18:49 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id DBF822256F7; Mon, 18 Oct 2021 15:18:48 -0400 (EDT)
Date: Mon, 18 Oct 2021 15:18:48 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v4 07/12] virtiofsd: Let lo_inode_open() return a TempFd
Message-ID: <YW3ImM9WhNrZnSxN@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
 <20210916084045.31684-8-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210916084045.31684-8-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 10:40:40AM +0200, Hanna Reitz wrote:
> Strictly speaking, this is not necessary, because lo_inode_open() will
> always return a new FD owned by the caller, so TempFd.owned will always
> be true.
> 
> The auto-cleanup is nice, though.  Also, we get a more unified interface
> where you always get a TempFd when you need an FD for an lo_inode
> (regardless of whether it is an O_PATH FD or a non-O_PATH FD).
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 156 +++++++++++++++----------------
>  1 file changed, 75 insertions(+), 81 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 3bf20b8659..d257eda129 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -293,10 +293,8 @@ static void temp_fd_clear(TempFd *temp_fd)
>  /**
>   * Return an owned fd from *temp_fd that will not be closed when
>   * *temp_fd goes out of scope.
> - *
> - * (TODO: Remove __attribute__ once this is used.)
>   */
> -static __attribute__((unused)) int temp_fd_steal(TempFd *temp_fd)
> +static int temp_fd_steal(TempFd *temp_fd)
>  {
>      if (temp_fd->owned) {
>          temp_fd->owned = false;
> @@ -309,10 +307,8 @@ static __attribute__((unused)) int temp_fd_steal(TempFd *temp_fd)
>  /**
>   * Create a borrowing copy of an existing TempFd.  Note that *to is
>   * only valid as long as *from is valid.
> - *
> - * (TODO: Remove __attribute__ once this is used.)
>   */
> -static __attribute__((unused)) void temp_fd_copy(const TempFd *from, TempFd *to)
> +static void temp_fd_copy(const TempFd *from, TempFd *to)
>  {
>      *to = (TempFd) {
>          .fd = from->fd,
> @@ -689,9 +685,12 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino, TempFd *tfd)
>   * when a malicious client opens special files such as block device nodes.
>   * Symlink inodes are also rejected since symlinks must already have been
>   * traversed on the client side.
> + *
> + * The fd is returned in tfd->fd.  The return value is 0 on success and -errno
> + * otherwise.
>   */
>  static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
> -                         int open_flags)
> +                         int open_flags, TempFd *tfd)
>  {
>      g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
>      int fd;
> @@ -710,7 +709,13 @@ static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
>      if (fd < 0) {
>          return -errno;
>      }
> -    return fd;
> +
> +    *tfd = (TempFd) {
> +        .fd = fd,
> +        .owned = true,
> +    };
> +
> +    return 0;
>  }
>  
>  static void lo_init(void *userdata, struct fuse_conn_info *conn)
> @@ -854,7 +859,8 @@ static int lo_fi_fd(fuse_req_t req, struct fuse_file_info *fi)
>  static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>                         int valid, struct fuse_file_info *fi)
>  {
> -    g_auto(TempFd) path_fd = TEMP_FD_INIT;
> +    g_auto(TempFd) path_fd = TEMP_FD_INIT; /* at least an O_PATH fd */

What does atleast O_PATH fd mean?

> +    g_auto(TempFd) rw_fd = TEMP_FD_INIT; /* O_RDWR fd */
>      int saverr;
>      char procname[64];
>      struct lo_data *lo = lo_data(req);
> @@ -868,7 +874,15 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>          return;
>      }
>  
> -    res = lo_inode_fd(inode, &path_fd);
> +    if (!fi && (valid & FUSE_SET_ATTR_SIZE)) {
> +        /* We need an O_RDWR FD for ftruncate() */
> +        res = lo_inode_open(lo, inode, O_RDWR, &rw_fd);
> +        if (res >= 0) {
> +            temp_fd_copy(&rw_fd, &path_fd);

I am lost here. If lo_inode_open() failed, why are we calling this
temp_fd_copy()? path_fd is not even a valid fd yet.

Still beats me that why open rw_fd now instead of down in
FUSE_SET_ATTR_SIZE block. I think we had this discussion and you
had some reasons to move it up.

Vivek

> +        }
> +    } else {
> +        res = lo_inode_fd(inode, &path_fd);
> +    }
>      if (res < 0) {
>          saverr = -res;
>          goto out_err;
> @@ -916,18 +930,12 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>          if (fi) {
>              truncfd = fd;
>          } else {
> -            truncfd = lo_inode_open(lo, inode, O_RDWR);
> -            if (truncfd < 0) {
> -                saverr = -truncfd;
> -                goto out_err;
> -            }
> +            assert(rw_fd.fd >= 0);
> +            truncfd = rw_fd.fd;
>          }
>  
>          saverr = drop_security_capability(lo, truncfd);
>          if (saverr) {
> -            if (!fi) {
> -                close(truncfd);
> -            }
>              goto out_err;
>          }
>  
> @@ -935,9 +943,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>              res = drop_effective_cap("FSETID", &cap_fsetid_dropped);
>              if (res != 0) {
>                  saverr = res;
> -                if (!fi) {
> -                    close(truncfd);
> -                }
>                  goto out_err;
>              }
>          }
> @@ -950,9 +955,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>                  fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
>              }
>          }
> -        if (!fi) {
> -            close(truncfd);
> -        }
>          if (res == -1) {
>              goto out_err;
>          }
> @@ -1840,11 +1842,13 @@ static struct lo_dirp *lo_dirp(fuse_req_t req, struct fuse_file_info *fi)
>  static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
>                         struct fuse_file_info *fi)
>  {
> +    g_auto(TempFd) rd_fd = TEMP_FD_INIT;
>      int error = ENOMEM;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *inode;
>      struct lo_dirp *d = NULL;
>      int fd;
> +    int res;
>      ssize_t fh;
>  
>      inode = lo_inode(req, ino);
> @@ -1858,14 +1862,16 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
>          goto out_err;
>      }
>  
> -    fd = lo_inode_open(lo, inode, O_RDONLY);
> -    if (fd < 0) {
> -        error = -fd;
> +    res = lo_inode_open(lo, inode, O_RDONLY, &rd_fd);
> +    if (res < 0) {
> +        error = -res;
>          goto out_err;
>      }
>  
> +    fd = temp_fd_steal(&rd_fd);
>      d->dp = fdopendir(fd);
>      if (d->dp == NULL) {
> +        close(fd);
>          goto out_errno;
>      }
>  
> @@ -1895,8 +1901,6 @@ out_err:
>      if (d) {
>          if (d->dp) {
>              closedir(d->dp);
> -        } else if (fd != -1) {
> -            close(fd);
>          }
>          free(d);
>      }
> @@ -2096,6 +2100,7 @@ static void update_open_flags(int writeback, int allow_direct_io,
>  static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
>                        int existing_fd, struct fuse_file_info *fi)
>  {
> +    g_auto(TempFd) opened_fd = TEMP_FD_INIT;
>      ssize_t fh;
>      int fd = existing_fd;
>      int err;
> @@ -2112,16 +2117,18 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
>              }
>          }
>  
> -        fd = lo_inode_open(lo, inode, fi->flags);
> +        err = lo_inode_open(lo, inode, fi->flags, &opened_fd);
>  
>          if (cap_fsetid_dropped) {
>              if (gain_effective_cap("FSETID")) {
>                  fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
>              }
>          }
> -        if (fd < 0) {
> -            return -fd;
> +        if (err < 0) {
> +            return -err;
>          }
> +        fd = temp_fd_steal(&opened_fd);
> +
>          if (fi->flags & (O_TRUNC)) {
>              int err = drop_security_capability(lo, fd);
>              if (err) {
> @@ -2231,8 +2238,9 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
>                                                        uint64_t lock_owner,
>                                                        pid_t pid, int *err)
>  {
> +    g_auto(TempFd) rw_fd = TEMP_FD_INIT;
>      struct lo_inode_plock *plock;
> -    int fd;
> +    int res;
>  
>      plock =
>          g_hash_table_lookup(inode->posix_locks, GUINT_TO_POINTER(lock_owner));
> @@ -2249,15 +2257,15 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
>  
>      /* Open another instance of file which can be used for ofd locks. */
>      /* TODO: What if file is not writable? */
> -    fd = lo_inode_open(lo, inode, O_RDWR);
> -    if (fd < 0) {
> -        *err = -fd;
> +    res = lo_inode_open(lo, inode, O_RDWR, &rw_fd);
> +    if (res < 0) {
> +        *err = -res;
>          free(plock);
>          return NULL;
>      }
>  
>      plock->lock_owner = lock_owner;
> -    plock->fd = fd;
> +    plock->fd = temp_fd_steal(&rw_fd);
>      g_hash_table_insert(inode->posix_locks, GUINT_TO_POINTER(plock->lock_owner),
>                          plock);
>      return plock;
> @@ -2473,6 +2481,7 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>  static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
>                       struct fuse_file_info *fi)
>  {
> +    g_auto(TempFd) rw_fd = TEMP_FD_INIT;
>      struct lo_inode *inode = lo_inode(req, ino);
>      struct lo_data *lo = lo_data(req);
>      int res;
> @@ -2487,11 +2496,12 @@ static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
>      }
>  
>      if (!fi) {
> -        fd = lo_inode_open(lo, inode, O_RDWR);
> -        if (fd < 0) {
> -            res = -fd;
> +        res = lo_inode_open(lo, inode, O_RDWR, &rw_fd);
> +        if (res < 0) {
> +            res = -res;
>              goto out;
>          }
> +        fd = rw_fd.fd;
>      } else {
>          fd = lo_fi_fd(req, fi);
>      }
> @@ -2501,9 +2511,6 @@ static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
>      } else {
>          res = fsync(fd) == -1 ? errno : 0;
>      }
> -    if (!fi) {
> -        close(fd);
> -    }
>  out:
>      lo_inode_put(lo, &inode);
>      fuse_reply_err(req, res);
> @@ -3065,7 +3072,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>      struct lo_inode *inode;
>      ssize_t ret;
>      int saverr;
> -    int fd = -1;
>  
>      if (block_xattr(lo, in_name)) {
>          fuse_reply_err(req, EOPNOTSUPP);
> @@ -3117,12 +3123,14 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>       * Otherwise, call fchdir() to avoid open().
>       */
>      if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
> -        fd = lo_inode_open(lo, inode, O_RDONLY);
> -        if (fd < 0) {
> -            saverr = -fd;
> +        g_auto(TempFd) rd_fd = TEMP_FD_INIT;
> +
> +        ret = lo_inode_open(lo, inode, O_RDONLY, &rd_fd);
> +        if (ret < 0) {
> +            saverr = -ret;
>              goto out;
>          }
> -        ret = fgetxattr(fd, name, value, size);
> +        ret = fgetxattr(rd_fd.fd, name, value, size);
>          saverr = ret == -1 ? errno : 0;
>      } else {
>          g_auto(TempFd) path_fd = TEMP_FD_INIT;
> @@ -3153,10 +3161,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>          fuse_reply_xattr(req, ret);
>      }
>  out_free:
> -    if (fd >= 0) {
> -        close(fd);
> -    }
> -
>      lo_inode_put(lo, &inode);
>      return;
>  
> @@ -3176,7 +3180,6 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
>      struct lo_inode *inode;
>      ssize_t ret;
>      int saverr;
> -    int fd = -1;
>  
>      inode = lo_inode(req, ino);
>      if (!inode) {
> @@ -3200,12 +3203,14 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
>      }
>  
>      if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
> -        fd = lo_inode_open(lo, inode, O_RDONLY);
> -        if (fd < 0) {
> -            saverr = -fd;
> +        g_auto(TempFd) rd_fd = TEMP_FD_INIT;
> +
> +        ret = lo_inode_open(lo, inode, O_RDONLY, &rd_fd);
> +        if (ret < 0) {
> +            saverr = -ret;
>              goto out;
>          }
> -        ret = flistxattr(fd, value, size);
> +        ret = flistxattr(rd_fd.fd, value, size);
>          saverr = ret == -1 ? errno : 0;
>      } else {
>          g_auto(TempFd) path_fd = TEMP_FD_INIT;
> @@ -3294,10 +3299,6 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
>          fuse_reply_xattr(req, ret);
>      }
>  out_free:
> -    if (fd >= 0) {
> -        close(fd);
> -    }
> -
>      lo_inode_put(lo, &inode);
>      return;
>  
> @@ -3312,14 +3313,14 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>                          const char *value, size_t size, int flags,
>                          uint32_t extra_flags)
>  {
> -    g_auto(TempFd) path_fd = TEMP_FD_INIT;
> +    g_auto(TempFd) path_fd = TEMP_FD_INIT; /* O_PATH fd */
> +    g_auto(TempFd) rd_fd = TEMP_FD_INIT; /* O_RDONLY fd */
>      const char *name;
>      char *mapped_name;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *inode;
>      ssize_t ret;
>      int saverr;
> -    int fd = -1;
>      bool switched_creds = false;
>      bool cap_fsetid_dropped = false;
>      struct lo_cred old = {};
> @@ -3364,9 +3365,9 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>       * setxattr() on the link's filename there.
>       */
>      if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
> -        fd = lo_inode_open(lo, inode, O_RDONLY);
> -        if (fd < 0) {
> -            saverr = -fd;
> +        ret = lo_inode_open(lo, inode, O_RDONLY, &rd_fd);
> +        if (ret < 0) {
> +            saverr = -ret;
>              goto out;
>          }
>      } else {
> @@ -3401,8 +3402,8 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>          }
>          switched_creds = true;
>      }
> -    if (fd >= 0) {
> -        ret = fsetxattr(fd, name, value, size, flags);
> +    if (rd_fd.fd >= 0) {
> +        ret = fsetxattr(rd_fd.fd, name, value, size, flags);
>          saverr = ret == -1 ? errno : 0;
>      } else {
>          char procname[64];
> @@ -3424,10 +3425,6 @@ out:
>          FCHDIR_NOFAIL(lo->root.fd);
>      }
>  
> -    if (fd >= 0) {
> -        close(fd);
> -    }
> -
>      lo_inode_put(lo, &inode);
>      g_free(mapped_name);
>      fuse_reply_err(req, saverr);
> @@ -3442,7 +3439,6 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
>      struct lo_inode *inode;
>      ssize_t ret;
>      int saverr;
> -    int fd = -1;
>  
>      if (block_xattr(lo, in_name)) {
>          fuse_reply_err(req, EOPNOTSUPP);
> @@ -3478,12 +3474,14 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
>               name);
>  
>      if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
> -        fd = lo_inode_open(lo, inode, O_RDONLY);
> -        if (fd < 0) {
> -            saverr = -fd;
> +        g_auto(TempFd) rd_fd = TEMP_FD_INIT;
> +
> +        ret = lo_inode_open(lo, inode, O_RDONLY, &rd_fd);
> +        if (ret < 0) {
> +            saverr = -ret;
>              goto out;
>          }
> -        ret = fremovexattr(fd, name);
> +        ret = fremovexattr(rd_fd.fd, name);
>          saverr = ret == -1 ? errno : 0;
>      } else {
>          g_auto(TempFd) path_fd = TEMP_FD_INIT;
> @@ -3502,10 +3500,6 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
>      }
>  
>  out:
> -    if (fd >= 0) {
> -        close(fd);
> -    }
> -
>      lo_inode_put(lo, &inode);
>      g_free(mapped_name);
>      fuse_reply_err(req, saverr);
> -- 
> 2.31.1
> 


