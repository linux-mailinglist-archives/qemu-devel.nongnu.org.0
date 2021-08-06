Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC33E2FF3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 21:56:17 +0200 (CEST)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC5x2-0001k0-6H
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 15:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mC5w6-0000MG-H1
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 15:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mC5w3-0001LT-PF
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 15:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628279714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WkBp5BAFAsnxNakLfxVAyNf/ebJ4YRKbH4XUAC4vE+4=;
 b=Ad7VaGxJ8fV8Rx/VijdIufCVez8gROn3IeF7DDWjh1C+mHzOcCXH3oBN2qdGfytbhddQR9
 EJ9L7DWSsTOzZwgj6zml6mYaHq5B2ctwCkklDrV8WhZt2eM+XjQTUkpery4lvCb/2EWCGv
 wAb6YOd+fcOZllXy8UicFSSU+77bHbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506--8Z2oWzAPZq8Gf0EKYeFcA-1; Fri, 06 Aug 2021 15:55:13 -0400
X-MC-Unique: -8Z2oWzAPZq8Gf0EKYeFcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A7A4871805
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 19:55:12 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.18.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 460E619D9D;
 Fri,  6 Aug 2021 19:55:02 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id ACAB4220261; Fri,  6 Aug 2021 15:55:01 -0400 (EDT)
Date: Fri, 6 Aug 2021 15:55:01 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 06/10] virtiofsd: Let lo_inode_open() return a TempFd
Message-ID: <YQ2TleuDejJY4O4V@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-7-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730150134.216126-7-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Fri, Jul 30, 2021 at 05:01:30PM +0200, Max Reitz wrote:
> Strictly speaking, this is not necessary, because lo_inode_open() will
> always return a new FD owned by the caller, so TempFd.owned will always
> be true.
> 
> However, auto-cleanup is nice, and in some cases this plays nicely with
> an lo_inode_fd() call in another conditional branch (see lo_setattr()).
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 138 +++++++++++++------------------
>  1 file changed, 59 insertions(+), 79 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 9e1bc37af8..292b7f7e27 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -291,10 +291,8 @@ static void temp_fd_clear(TempFd *temp_fd)
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
> @@ -673,9 +671,12 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino, TempFd *tfd)
>   * when a malicious client opens special files such as block device nodes.
>   * Symlink inodes are also rejected since symlinks must already have been
>   * traversed on the client side.
> + *
> + * The fd is returned in tfd->fd.  The return value is 0 on success and -errno
> + * otherwise.
>   */
> -static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
> -                         int open_flags)
> +static int lo_inode_open(const struct lo_data *lo, const struct lo_inode *inode,
> +                         int open_flags, TempFd *tfd)
>  {
>      g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
>      int fd;
> @@ -694,7 +695,13 @@ static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
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
> @@ -852,7 +859,12 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>          return;
>      }
>  
> -    res = lo_inode_fd(inode, &inode_fd);
> +    if (!fi && (valid & FUSE_SET_ATTR_SIZE)) {
> +        /* We need an O_RDWR FD for ftruncate() */
> +        res = lo_inode_open(lo, inode, O_RDWR, &inode_fd);
> +    } else {
> +        res = lo_inode_fd(inode, &inode_fd);
> +    }

A minor nit.

So inode_fd could hold either an O_PATH fd returned by lo_inode_fd()
or a O_RDWR fd returned by lo_inode_open().

Previous code held these fds in two different variables, inode_fd and
truncfd respectively. I kind of found that easier to read because looking
at variable name, I knew whether I am dealing with O_PATH fd or an
O_RDWR fd I just opened. 

So a minor nit. We could continue to have two variables, say
inode_fd and trunc_fd. Just that type of trunc_fd will now be TempFd.

Also I liked previous style easier to read where I always got hold
of O_PATH fd first. And later opened a O_RDWR fd if operation
is FUSE_ATTR_SIZE. So "valid & FUSE_SET_ATTR_SIZE" check was not
at two places.

Anyway, this is a minor nit. If you don't like the idea of using
two separate variables to hold O_PATH fd and O_RDWR fd, that's ok.


>      if (res < 0) {
>          saverr = -res;
>          goto out_err;
> @@ -900,18 +912,11 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>          if (fi) {
>              truncfd = fd;
>          } else {
> -            truncfd = lo_inode_open(lo, inode, O_RDWR);
> -            if (truncfd < 0) {
> -                saverr = -truncfd;
> -                goto out_err;
> -            }
> +            truncfd = inode_fd.fd;
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
> @@ -919,9 +924,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>              res = drop_effective_cap("FSETID", &cap_fsetid_dropped);
>              if (res != 0) {
>                  saverr = res;
> -                if (!fi) {
> -                    close(truncfd);
> -                }
>                  goto out_err;
>              }
>          }
> @@ -934,9 +936,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>                  fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
>              }
>          }
> -        if (!fi) {
> -            close(truncfd);
> -        }
>          if (res == -1) {
>              goto out_err;
>          }
> @@ -1822,11 +1821,12 @@ static struct lo_dirp *lo_dirp(fuse_req_t req, struct fuse_file_info *fi)
>  static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
>                         struct fuse_file_info *fi)
>  {
> +    g_auto(TempFd) inode_fd = TEMP_FD_INIT;
>      int error = ENOMEM;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *inode;
>      struct lo_dirp *d = NULL;
> -    int fd;
> +    int res;
>      ssize_t fh;
>  
>      inode = lo_inode(req, ino);
> @@ -1840,13 +1840,13 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
>          goto out_err;
>      }
>  
> -    fd = lo_inode_open(lo, inode, O_RDONLY);
> -    if (fd < 0) {
> -        error = -fd;
> +    res = lo_inode_open(lo, inode, O_RDONLY, &inode_fd);
> +    if (res < 0) {
> +        error = -res;
>          goto out_err;
>      }
>  
> -    d->dp = fdopendir(fd);
> +    d->dp = fdopendir(temp_fd_steal(&inode_fd));

So we are using temp_fd_steal(), because if fdopendir() is succesful,
we don't want to close fd instead it will be closed during closedir()
call. inode_fd will be closed once lo_opendir(), so we get fd ownership
which will need to close explicitly, when appropriate.

Who closes the stolen fd returned by temp_fd_steal() if fdopendir() fails?

>      if (d->dp == NULL) {
>          goto out_errno;
>      }
> @@ -1876,8 +1876,6 @@ out_err:
>      if (d) {
>          if (d->dp) {
>              closedir(d->dp);
> -        } else if (fd != -1) {
> -            close(fd);
>          }
>          free(d);
>      }
> @@ -2077,6 +2075,7 @@ static void update_open_flags(int writeback, int allow_direct_io,
>  static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
>                        int existing_fd, struct fuse_file_info *fi)
>  {
> +    g_auto(TempFd) inode_fd = TEMP_FD_INIT;

It bothers me that we are using variable inode_fd both to hold O_PATH
fd as well as regular fd. Will be nice if just by looking at variable
name I could figure out which type of fd it is.

Will it make sense to use path_fd, or ipath_fd, or inode_path_fd to
represent where we are using O_PATH fd.


Thanks
Vivek


