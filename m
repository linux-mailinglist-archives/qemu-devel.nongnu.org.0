Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D192FF3B9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:02:35 +0100 (CET)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fE2-00012R-Fc
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2fBz-0008UU-Gt
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:00:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2fBw-0002xk-FQ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611255622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ou0pasN+ychtiP7qFvffInaS4FAM63oA8ARjviLuD9g=;
 b=QIt741wO+BkL47D54WM2wt54cG3UQUVGdKEwqF+3S6gZ3C15F7R7nsHtVjZSHvZALSstXH
 rxaBmMiohUkhS8ZgPuA6lU5i0ayPMZ3TchiZLMCrZ9Pbp/m1iA5sYn2nrqjMPW8r5ugQXz
 Zg5q7+U3Tfzx/gj2c8GtssgkW6rfM4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-7mbMdokCMJGd7ZCAmT4cQQ-1; Thu, 21 Jan 2021 14:00:20 -0500
X-MC-Unique: 7mbMdokCMJGd7ZCAmT4cQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAE5A106F6EB;
 Thu, 21 Jan 2021 19:00:18 +0000 (UTC)
Received: from work-vm (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2D9360C61;
 Thu, 21 Jan 2021 19:00:06 +0000 (UTC)
Date: Thu, 21 Jan 2021 19:00:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210121190003.GP3072@work-vm>
References: <20210121144429.58885-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121144429.58885-1-stefanha@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mszeredi@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 P J P <ppandit@redhat.com>, virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> A well-behaved FUSE client does not attempt to open special files with
> FUSE_OPEN because they are handled on the client side (e.g. device nodes
> are handled by client-side device drivers).
> 
> The check to prevent virtiofsd from opening special files is missing in
> a few cases, most notably FUSE_OPEN. A malicious client can cause
> virtiofsd to open a device node, potentially allowing the guest to
> escape. This can be exploited by a modified guest device driver. It is
> not exploitable from guest userspace since the guest kernel will handle
> special files inside the guest instead of sending FUSE requests.
> 
> This patch adds the missing checks to virtiofsd. This is a short-term
> solution because it does not prevent a compromised virtiofsd process
> from opening device nodes on the host.
> 
> Reported-by: Alex Xu <alex@alxu.ca>
> Fixes: CVE-2020-35517
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

(With a response to Dan's question about Symlinks)


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> This issue was diagnosed on public IRC and is therefore already known
> and not embargoed.
> 
> A stronger fix, and the long-term solution, is for users to mount the
> shared directory and any sub-mounts with nodev, as well as nosuid and
> noexec. Unfortunately virtiofsd cannot do this automatically because
> bind mounts added by the user after virtiofsd has launched would not be
> detected. I suggest the following:
> 
> 1. Modify libvirt and Kata Containers to explicitly set these mount
>    options.
> 2. Then modify virtiofsd to check that the shared directory has the
>    necessary options at startup. Refuse to start if the options are
>    missing so that the user is aware of the security requirements.
> 
> As a bonus this also increases the likelihood that other host processes
> besides virtiofsd will be protected by nosuid/noexec/nodev so that a
> malicious guest cannot drop these files in place and then arrange for a
> host process to come across them.
> 
> Additionally, user namespaces have been discussed. They seem like a
> worthwhile addition as an unprivileged or privilege-separated mode
> although there are limitations with respect to security xattrs and the
> actual uid/gid stored on the host file system not corresponding to the
> guest uid/gid.
> ---
>  tools/virtiofsd/passthrough_ll.c | 84 +++++++++++++++++++++-----------
>  1 file changed, 56 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 5fb36d9407..e08352d649 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -555,6 +555,29 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino)
>      return fd;
>  }
>  
> +/*
> + * Open a file descriptor for an inode. Returns -EBADF if the inode is not a
> + * regular file or a directory. Use this helper function instead of raw
> + * openat(2) to prevent security issues when a malicious client opens special
> + * files such as block device nodes.
> + */
> +static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
> +                         int open_flags)
> +{
> +    g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
> +    int fd;
> +
> +    if (!S_ISREG(inode->filetype) && !S_ISDIR(inode->filetype)) {
> +        return -EBADF;
> +    }
> +
> +    fd = openat(lo->proc_self_fd, fd_str, open_flags);
> +    if (fd < 0) {
> +        return -errno;
> +    }
> +    return fd;
> +}
> +
>  static void lo_init(void *userdata, struct fuse_conn_info *conn)
>  {
>      struct lo_data *lo = (struct lo_data *)userdata;
> @@ -684,8 +707,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>          if (fi) {
>              truncfd = fd;
>          } else {
> -            sprintf(procname, "%i", ifd);
> -            truncfd = openat(lo->proc_self_fd, procname, O_RDWR);
> +            truncfd = lo_inode_open(lo, inode, O_RDWR);
>              if (truncfd < 0) {
>                  goto out_err;
>              }
> @@ -1725,7 +1747,6 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
>                                                        pid_t pid, int *err)
>  {
>      struct lo_inode_plock *plock;
> -    char procname[64];
>      int fd;
>  
>      plock =
> @@ -1742,12 +1763,10 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
>      }
>  
>      /* Open another instance of file which can be used for ofd locks. */
> -    sprintf(procname, "%i", inode->fd);
> -
>      /* TODO: What if file is not writable? */
> -    fd = openat(lo->proc_self_fd, procname, O_RDWR);
> -    if (fd == -1) {
> -        *err = errno;
> +    fd = lo_inode_open(lo, inode, O_RDWR);
> +    if (fd < 0) {
> +        *err = -fd;
>          free(plock);
>          return NULL;
>      }
> @@ -1894,18 +1913,24 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>  {
>      int fd;
>      ssize_t fh;
> -    char buf[64];
>      struct lo_data *lo = lo_data(req);
> +    struct lo_inode *inode = lo_inode(req, ino);
>  
>      fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
>               fi->flags);
>  
> +    if (!inode) {
> +        fuse_reply_err(req, EBADF);
> +        return;
> +    }
> +
>      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
>  
> -    sprintf(buf, "%i", lo_fd(req, ino));
> -    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
> -    if (fd == -1) {
> -        return (void)fuse_reply_err(req, errno);
> +    fd = lo_inode_open(lo, inode, fi->flags & ~O_NOFOLLOW);
> +    if (fd < 0) {
> +        lo_inode_put(lo, &inode);
> +        fuse_reply_err(req, -fd);
> +        return;
>      }
>  
>      pthread_mutex_lock(&lo->mutex);
> @@ -1913,6 +1938,7 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>      pthread_mutex_unlock(&lo->mutex);
>      if (fh == -1) {
>          close(fd);
> +        lo_inode_put(lo, &inode);
>          fuse_reply_err(req, ENOMEM);
>          return;
>      }
> @@ -1923,6 +1949,7 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>      } else if (lo->cache == CACHE_ALWAYS) {
>          fi->keep_cache = 1;
>      }
> +    lo_inode_put(lo, &inode);
>      fuse_reply_open(req, fi);
>  }
>  
> @@ -1982,39 +2009,40 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>  static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
>                       struct fuse_file_info *fi)
>  {
> +    struct lo_inode *inode = lo_inode(req, ino);
> +    struct lo_data *lo = lo_data(req);
>      int res;
>      int fd;
> -    char *buf;
>  
>      fuse_log(FUSE_LOG_DEBUG, "lo_fsync(ino=%" PRIu64 ", fi=0x%p)\n", ino,
>               (void *)fi);
>  
> +    if (!inode) {
> +        fuse_reply_err(req, EBADF);
> +        return;
> +    }
> +
>      if (!fi) {
> -        struct lo_data *lo = lo_data(req);
> -
> -        res = asprintf(&buf, "%i", lo_fd(req, ino));
> -        if (res == -1) {
> -            return (void)fuse_reply_err(req, errno);
> -        }
> -
> -        fd = openat(lo->proc_self_fd, buf, O_RDWR);
> -        free(buf);
> -        if (fd == -1) {
> -            return (void)fuse_reply_err(req, errno);
> +        fd = lo_inode_open(lo, inode, O_RDWR);
> +        if (fd < 0) {
> +            res = -fd;
> +            goto out;
>          }
>      } else {
>          fd = lo_fi_fd(req, fi);
>      }
>  
>      if (datasync) {
> -        res = fdatasync(fd);
> +        res = fdatasync(fd) == -1 ? errno : 0;
>      } else {
> -        res = fsync(fd);
> +        res = fsync(fd) == -1 ? errno : 0;
>      }
>      if (!fi) {
>          close(fd);
>      }
> -    fuse_reply_err(req, res == -1 ? errno : 0);
> +out:
> +    lo_inode_put(lo, &inode);
> +    fuse_reply_err(req, res);
>  }
>  
>  static void lo_read(fuse_req_t req, fuse_ino_t ino, size_t size, off_t offset,
> -- 
> 2.29.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


