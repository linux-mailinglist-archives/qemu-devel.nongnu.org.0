Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633333E2DDE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:43:41 +0200 (CEST)
Received: from localhost ([::1]:37936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC20a-0007cM-FP
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mC1zZ-0006uL-RD
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:42:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mC1zY-0006HS-33
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628264555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BpE3WumlsSAracw9q5FPsT/yI5sNGA+2TFxl8oeSZHA=;
 b=SSluve7usDGBImowvaafGNfgyLSMkzXiMGDPDCTvQv7WiL5U64mWED/UuAp5ieNIPb/pcH
 E2aBEQGy0wMl2ZT/MFW+4a/73N/OyJ/v4ApZRinJ+MfbaCdgmGZcmOvMn/uBMB5z4QCrbJ
 xhG4LVF10jm0u3gDHHT1R6sC67vRLw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-KM-xd4_4Mm2aXGgcdEjawQ-1; Fri, 06 Aug 2021 11:42:33 -0400
X-MC-Unique: KM-xd4_4Mm2aXGgcdEjawQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 320A387D541
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 15:42:33 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.18.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0030D6A057;
 Fri,  6 Aug 2021 15:42:32 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 9035E220261; Fri,  6 Aug 2021 11:42:32 -0400 (EDT)
Date: Fri, 6 Aug 2021 11:42:32 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 03/10] virtiofsd: Use lo_inode_open() instead of
 openat()
Message-ID: <YQ1YaG8cHxfXsw+9@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-4-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730150134.216126-4-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Fri, Jul 30, 2021 at 05:01:27PM +0200, Max Reitz wrote:
> The xattr functions want a non-O_PATH FD, so they reopen the lo_inode.fd
> with the flags they need through /proc/self/fd.
> 
> Similarly, lo_opendir() needs an O_RDONLY FD.  Instead of the
> /proc/self/fd trick, it just uses openat(fd, "."), because the FD is
> guaranteed to be a directory, so this works.

Ok, given now lo_opendir() will use lo_inode_open(), it will switch
to using proc O_PATH fd trick. I guess that should be fine.

Vivek

> 
> All cases have one problem in common, though: In the future, when we may
> have a file handle in the lo_inode instead of an FD, querying an
> lo_inode FD may incur an open_by_handle_at() call.  It does not make
> sense to then reopen that FD with custom flags, those should have been
> passed to open_by_handle_at() instead.
> 
> Use lo_inode_open() instead of openat().  As part of the file handle
> change, lo_inode_open() will be made to invoke openat() only if
> lo_inode.fd is valid.  Otherwise, it will invoke open_by_handle_at()
> with the right flags from the start.
> 
> Consequently, after this patch, lo_inode_open() is the only place to
> invoke openat() to reopen an existing FD with different flags.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 43 ++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index fb5e073e6a..a444c3a7e2 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -1729,18 +1729,26 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
>  {
>      int error = ENOMEM;
>      struct lo_data *lo = lo_data(req);
> -    struct lo_dirp *d;
> +    struct lo_inode *inode;
> +    struct lo_dirp *d = NULL;
>      int fd;
>      ssize_t fh;
>  
> +    inode = lo_inode(req, ino);
> +    if (!inode) {
> +        error = EBADF;
> +        goto out_err;
> +    }
> +
>      d = calloc(1, sizeof(struct lo_dirp));
>      if (d == NULL) {
>          goto out_err;
>      }
>  
> -    fd = openat(lo_fd(req, ino), ".", O_RDONLY);
> -    if (fd == -1) {
> -        goto out_errno;
> +    fd = lo_inode_open(lo, inode, O_RDONLY);
> +    if (fd < 0) {
> +        error = -fd;
> +        goto out_err;
>      }
>  
>      d->dp = fdopendir(fd);
> @@ -1769,6 +1777,7 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
>  out_errno:
>      error = errno;
>  out_err:
> +    lo_inode_put(lo, &inode);
>      if (d) {
>          if (d->dp) {
>              closedir(d->dp);
> @@ -2973,7 +2982,6 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>          }
>      }
>  
> -    sprintf(procname, "%i", inode->fd);
>      /*
>       * It is not safe to open() non-regular/non-dir files in file server
>       * unless O_PATH is used, so use that method for regular files/dir
> @@ -2981,13 +2989,15 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>       * Otherwise, call fchdir() to avoid open().
>       */
>      if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
> -        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
> +        fd = lo_inode_open(lo, inode, O_RDONLY);
>          if (fd < 0) {
> -            goto out_err;
> +            saverr = -fd;
> +            goto out;
>          }
>          ret = fgetxattr(fd, name, value, size);
>          saverr = ret == -1 ? errno : 0;
>      } else {
> +        sprintf(procname, "%i", inode->fd);
>          /* fchdir should not fail here */
>          FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = getxattr(procname, name, value, size);
> @@ -3054,15 +3064,16 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
>          }
>      }
>  
> -    sprintf(procname, "%i", inode->fd);
>      if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
> -        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
> +        fd = lo_inode_open(lo, inode, O_RDONLY);
>          if (fd < 0) {
> -            goto out_err;
> +            saverr = -fd;
> +            goto out;
>          }
>          ret = flistxattr(fd, value, size);
>          saverr = ret == -1 ? errno : 0;
>      } else {
> +        sprintf(procname, "%i", inode->fd);
>          /* fchdir should not fail here */
>          FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = listxattr(procname, value, size);
> @@ -3211,14 +3222,14 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>       * setxattr() on the link's filename there.
>       */
>      open_inode = S_ISREG(inode->filetype) || S_ISDIR(inode->filetype);
> -    sprintf(procname, "%i", inode->fd);
>      if (open_inode) {
> -        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
> +        fd = lo_inode_open(lo, inode, O_RDONLY);
>          if (fd < 0) {
> -            saverr = errno;
> +            saverr = -fd;
>              goto out;
>          }
>      } else {
> +        sprintf(procname, "%i", inode->fd);
>          /* fchdir should not fail here */
>          FCHDIR_NOFAIL(lo->proc_self_fd);
>      }
> @@ -3317,16 +3328,16 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
>      fuse_log(FUSE_LOG_DEBUG, "lo_removexattr(ino=%" PRIu64 ", name=%s)\n", ino,
>               name);
>  
> -    sprintf(procname, "%i", inode->fd);
>      if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
> -        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
> +        fd = lo_inode_open(lo, inode, O_RDONLY);
>          if (fd < 0) {
> -            saverr = errno;
> +            saverr = -fd;
>              goto out;
>          }
>          ret = fremovexattr(fd, name);
>          saverr = ret == -1 ? errno : 0;
>      } else {
> +        sprintf(procname, "%i", inode->fd);
>          /* fchdir should not fail here */
>          FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = removexattr(procname, name);
> -- 
> 2.31.1
> 


