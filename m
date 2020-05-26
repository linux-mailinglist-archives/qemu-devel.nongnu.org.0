Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E61D4423
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 05:44:37 +0200 (CEST)
Received: from localhost ([::1]:59468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZRH1-0000GF-UW
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 23:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bo.liu@linux.alibaba.com>)
 id 1jZRG7-0008Gg-9w
 for qemu-devel@nongnu.org; Thu, 14 May 2020 23:43:39 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:27036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bo.liu@linux.alibaba.com>)
 id 1jZRG0-0007fk-WB
 for qemu-devel@nongnu.org; Thu, 14 May 2020 23:43:34 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04427; MF=bo.liu@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0TyaLKHK_1589514189; 
Received: from rsjd01523.et2sqa(mailfrom:bo.liu@linux.alibaba.com
 fp:SMTPD_---0TyaLKHK_1589514189) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 May 2020 11:43:13 +0800
Date: Fri, 15 May 2020 11:43:09 +0800
From: Liu Bo <bo.liu@linux.alibaba.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: remove symlink fallbacks
Message-ID: <20200515034309.GA49087@rsjd01523.et2sqa>
References: <20200514140736.20561-1-mszeredi@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514140736.20561-1-mszeredi@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=47.88.44.36;
 envelope-from=bo.liu@linux.alibaba.com; helo=out4436.biz.mail.alibaba.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:43:25
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
Reply-To: bo.liu@linux.alibaba.com
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 14, 2020 at 04:07:36PM +0200, Miklos Szeredi wrote:
> Path lookup in the kernel has special rules for looking up magic symlinks
> under /proc.  If a filesystem operation is instructed to follow symlinks
> (e.g. via AT_SYMLINK_FOLLOW or lack of AT_SYMLINK_NOFOLLOW), and the final
> component is such a proc symlink, then the target of the magic symlink is
> used for the operation, even if the target itself is a symlink.  I.e. path
> lookup is always terminated after following a final magic symlink.
>

Hi Miklos,

Are these mentioned special rules supported by a recent kernel version
or are they there from day one linux?

thanks,
liubo

> I was erronously assuming that in the above case the target symlink would
> also be followed, and so workarounds were added for a couple of operations
> to handle the symlink case.  Since the symlink can be handled simply by
> following the proc symlink, these workardouds are not needed.
> 
> Also remove the "norace" option, which disabled the workarounds.
> 
> Commit bdfd66788349 ("virtiofsd: Fix xattr operations") already dealt with
> the same issue for xattr operations.
> 
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 175 ++-----------------------------
>  1 file changed, 6 insertions(+), 169 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 3ba1d9098460..2ce7c96085bf 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -140,7 +140,6 @@ enum {
>  struct lo_data {
>      pthread_mutex_t mutex;
>      int debug;
> -    int norace;
>      int writeback;
>      int flock;
>      int posix_lock;
> @@ -176,7 +175,6 @@ static const struct fuse_opt lo_opts[] = {
>      { "cache=none", offsetof(struct lo_data, cache), CACHE_NONE },
>      { "cache=auto", offsetof(struct lo_data, cache), CACHE_AUTO },
>      { "cache=always", offsetof(struct lo_data, cache), CACHE_ALWAYS },
> -    { "norace", offsetof(struct lo_data, norace), 1 },
>      { "readdirplus", offsetof(struct lo_data, readdirplus_set), 1 },
>      { "no_readdirplus", offsetof(struct lo_data, readdirplus_clear), 1 },
>      FUSE_OPT_END
> @@ -592,136 +590,6 @@ static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
>      fuse_reply_attr(req, &buf, lo->timeout);
>  }
>  
> -/*
> - * Increments parent->nlookup and caller must release refcount using
> - * lo_inode_put(&parent).
> - */
> -static int lo_parent_and_name(struct lo_data *lo, struct lo_inode *inode,
> -                              char path[PATH_MAX], struct lo_inode **parent)
> -{
> -    char procname[64];
> -    char *last;
> -    struct stat stat;
> -    struct lo_inode *p;
> -    int retries = 2;
> -    int res;
> -
> -retry:
> -    sprintf(procname, "%i", inode->fd);
> -
> -    res = readlinkat(lo->proc_self_fd, procname, path, PATH_MAX);
> -    if (res < 0) {
> -        fuse_log(FUSE_LOG_WARNING, "%s: readlink failed: %m\n", __func__);
> -        goto fail_noretry;
> -    }
> -
> -    if (res >= PATH_MAX) {
> -        fuse_log(FUSE_LOG_WARNING, "%s: readlink overflowed\n", __func__);
> -        goto fail_noretry;
> -    }
> -    path[res] = '\0';
> -
> -    last = strrchr(path, '/');
> -    if (last == NULL) {
> -        /* Shouldn't happen */
> -        fuse_log(
> -            FUSE_LOG_WARNING,
> -            "%s: INTERNAL ERROR: bad path read from proc\n", __func__);
> -        goto fail_noretry;
> -    }
> -    if (last == path) {
> -        p = &lo->root;
> -        pthread_mutex_lock(&lo->mutex);
> -        p->nlookup++;
> -        g_atomic_int_inc(&p->refcount);
> -        pthread_mutex_unlock(&lo->mutex);
> -    } else {
> -        *last = '\0';
> -        res = fstatat(AT_FDCWD, last == path ? "/" : path, &stat, 0);
> -        if (res == -1) {
> -            if (!retries) {
> -                fuse_log(FUSE_LOG_WARNING,
> -                         "%s: failed to stat parent: %m\n", __func__);
> -            }
> -            goto fail;
> -        }
> -        p = lo_find(lo, &stat);
> -        if (p == NULL) {
> -            if (!retries) {
> -                fuse_log(FUSE_LOG_WARNING,
> -                         "%s: failed to find parent\n", __func__);
> -            }
> -            goto fail;
> -        }
> -    }
> -    last++;
> -    res = fstatat(p->fd, last, &stat, AT_SYMLINK_NOFOLLOW);
> -    if (res == -1) {
> -        if (!retries) {
> -            fuse_log(FUSE_LOG_WARNING,
> -                     "%s: failed to stat last\n", __func__);
> -        }
> -        goto fail_unref;
> -    }
> -    if (stat.st_dev != inode->key.dev || stat.st_ino != inode->key.ino) {
> -        if (!retries) {
> -            fuse_log(FUSE_LOG_WARNING,
> -                     "%s: failed to match last\n", __func__);
> -        }
> -        goto fail_unref;
> -    }
> -    *parent = p;
> -    memmove(path, last, strlen(last) + 1);
> -
> -    return 0;
> -
> -fail_unref:
> -    unref_inode_lolocked(lo, p, 1);
> -    lo_inode_put(lo, &p);
> -fail:
> -    if (retries) {
> -        retries--;
> -        goto retry;
> -    }
> -fail_noretry:
> -    errno = EIO;
> -    return -1;
> -}
> -
> -static int utimensat_empty(struct lo_data *lo, struct lo_inode *inode,
> -                           const struct timespec *tv)
> -{
> -    int res;
> -    struct lo_inode *parent;
> -    char path[PATH_MAX];
> -
> -    if (S_ISLNK(inode->filetype)) {
> -        res = utimensat(inode->fd, "", tv, AT_EMPTY_PATH);
> -        if (res == -1 && errno == EINVAL) {
> -            /* Sorry, no race free way to set times on symlink. */
> -            if (lo->norace) {
> -                errno = EPERM;
> -            } else {
> -                goto fallback;
> -            }
> -        }
> -        return res;
> -    }
> -    sprintf(path, "%i", inode->fd);
> -
> -    return utimensat(lo->proc_self_fd, path, tv, 0);
> -
> -fallback:
> -    res = lo_parent_and_name(lo, inode, path, &parent);
> -    if (res != -1) {
> -        res = utimensat(parent->fd, path, tv, AT_SYMLINK_NOFOLLOW);
> -        unref_inode_lolocked(lo, parent, 1);
> -        lo_inode_put(lo, &parent);
> -    }
> -
> -    return res;
> -}
> -
>  static int lo_fi_fd(fuse_req_t req, struct fuse_file_info *fi)
>  {
>      struct lo_data *lo = lo_data(req);
> @@ -828,7 +696,8 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>          if (fi) {
>              res = futimens(fd, tv);
>          } else {
> -            res = utimensat_empty(lo, inode, tv);
> +            sprintf(procname, "%i", inode->fd);
> +            res = utimensat(lo->proc_self_fd, procname, tv, 0);
>          }
>          if (res == -1) {
>              goto out_err;
> @@ -1129,41 +998,6 @@ static void lo_symlink(fuse_req_t req, const char *link, fuse_ino_t parent,
>      lo_mknod_symlink(req, parent, name, S_IFLNK, 0, link);
>  }
>  
> -static int linkat_empty_nofollow(struct lo_data *lo, struct lo_inode *inode,
> -                                 int dfd, const char *name)
> -{
> -    int res;
> -    struct lo_inode *parent;
> -    char path[PATH_MAX];
> -
> -    if (S_ISLNK(inode->filetype)) {
> -        res = linkat(inode->fd, "", dfd, name, AT_EMPTY_PATH);
> -        if (res == -1 && (errno == ENOENT || errno == EINVAL)) {
> -            /* Sorry, no race free way to hard-link a symlink. */
> -            if (lo->norace) {
> -                errno = EPERM;
> -            } else {
> -                goto fallback;
> -            }
> -        }
> -        return res;
> -    }
> -
> -    sprintf(path, "%i", inode->fd);
> -
> -    return linkat(lo->proc_self_fd, path, dfd, name, AT_SYMLINK_FOLLOW);
> -
> -fallback:
> -    res = lo_parent_and_name(lo, inode, path, &parent);
> -    if (res != -1) {
> -        res = linkat(parent->fd, path, dfd, name, 0);
> -        unref_inode_lolocked(lo, parent, 1);
> -        lo_inode_put(lo, &parent);
> -    }
> -
> -    return res;
> -}
> -
>  static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
>                      const char *name)
>  {
> @@ -1172,6 +1006,7 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
>      struct lo_inode *parent_inode;
>      struct lo_inode *inode;
>      struct fuse_entry_param e;
> +    char procname[64];
>      int saverr;
>  
>      if (!is_safe_path_component(name)) {
> @@ -1190,7 +1025,9 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
>      e.attr_timeout = lo->timeout;
>      e.entry_timeout = lo->timeout;
>  
> -    res = linkat_empty_nofollow(lo, inode, parent_inode->fd, name);
> +    sprintf(procname, "%i", inode->fd);
> +    res = linkat(lo->proc_self_fd, procname, parent_inode->fd, name,
> +                 AT_SYMLINK_FOLLOW);
>      if (res == -1) {
>          goto out_err;
>      }
> -- 
> 2.21.1
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs

