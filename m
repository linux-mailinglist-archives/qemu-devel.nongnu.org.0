Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0539F3F7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:46:54 +0200 (CEST)
Received: from localhost ([::1]:32812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZG1-0004av-CD
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqZDA-0002PC-Ll
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:43:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqZD6-0008Vb-3Z
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623149031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uMpwZ1AOYg5U3vY2qRcXkJAAbRR2cdkDJFNG8jFoywY=;
 b=Kf6lFu3JXzxRrdf3ZNcfERZ4RoXqdVeMJPbDYn6c/r5qxnxhFRt5E+0jC6IDid42D/efbo
 ATnFZLwCOXGUC1guSSe6I4uWCLNyTzZtEwlZgvhgvF8OiRBtk3RWgkmNWFQJ6f374MKHRW
 2qfcNPC6LK7mfGygk/f8CTkCIA7fwxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-hROYIyEkMB-BLdk0ucXukQ-1; Tue, 08 Jun 2021 06:43:49 -0400
X-MC-Unique: hROYIyEkMB-BLdk0ucXukQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34FDD80D683
 for <qemu-devel@nongnu.org>; Tue,  8 Jun 2021 10:43:48 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 836C119C66;
 Tue,  8 Jun 2021 10:43:39 +0000 (UTC)
Date: Tue, 8 Jun 2021 11:43:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 8/9] virtiofsd: Optionally fill lo_inode.fhandle
Message-ID: <YL9J2Oyjq2ok0/BM@work-vm>
References: <20210604161337.16048-1-mreitz@redhat.com>
 <20210604161337.16048-9-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210604161337.16048-9-mreitz@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Max Reitz (mreitz@redhat.com) wrote:
> When the inode_file_handles option is set, try to generate a file handle
> for new inodes instead of opening an O_PATH FD.
> 
> Being able to open these again will require CAP_DAC_READ_SEARCH, so the
> description text tells the user they will also need to specify
> -o modcaps=+dac_read_search.
> 
> Generating a file handle returns the mount ID it is valid for.  Opening
> it will require an FD instead.  We have mount_fds to map an ID to an FD.
> get_file_handle() fills the hash map by opening the file we have
> generated a handle for.  To verify that the resulting FD indeed
> represents the handle's mount ID, we use statx().  Therefore, using file
> handles requires statx() support.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tools/virtiofsd/helper.c              |   3 +
>  tools/virtiofsd/passthrough_ll.c      | 170 ++++++++++++++++++++++++--
>  tools/virtiofsd/passthrough_seccomp.c |   1 +
>  3 files changed, 165 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 5e98ed702b..954f8639e6 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -186,6 +186,9 @@ void fuse_cmdline_help(void)
>             "                               to virtiofsd from guest applications.\n"
>             "                               default: no_allow_direct_io\n"
>             "    -o announce_submounts      Announce sub-mount points to the guest\n"
> +           "    -o inode_file_handles      Use file handles to reference inodes\n"
> +           "                               instead of O_PATH file descriptors\n"
> +           "                               (requires -o modcaps=+dac_read_search)\n"
>             );
>  }
>  
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 793d2c333e..d01f9d3a59 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -190,6 +190,7 @@ struct lo_data {
>      /* An O_PATH file descriptor to /proc/self/fd/ */
>      int proc_self_fd;
>      int user_killpriv_v2, killpriv_v2;
> +    int inode_file_handles;
>  };
>  
>  /**
> @@ -244,6 +245,10 @@ static const struct fuse_opt lo_opts[] = {
>      { "announce_submounts", offsetof(struct lo_data, announce_submounts), 1 },
>      { "killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 1 },
>      { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
> +    { "inode_file_handles", offsetof(struct lo_data, inode_file_handles), 1 },
> +    { "no_inode_file_handles",
> +      offsetof(struct lo_data, inode_file_handles),
> +      0 },
>      FUSE_OPT_END
>  };
>  static bool use_syslog = false;
> @@ -315,6 +320,108 @@ static int temp_fd_steal(TempFd *temp_fd)
>      }
>  }
>  
> +/**
> + * Generate a file handle for the given dirfd/name combination.
> + *
> + * If mount_fds does not yet contain an entry for the handle's mount
> + * ID, (re)open dirfd/name in O_RDONLY mode and add it to mount_fds
> + * as the FD for that mount ID.  (That is the file that we have
> + * generated a handle for, so it should be representative for the
> + * mount ID.  However, to be sure (and to rule out races), we use
> + * statx() to verify that our assumption is correct.)
> + */
> +static struct lo_fhandle *get_file_handle(struct lo_data *lo,
> +                                          int dirfd, const char *name)
> +{
> +    /* We need statx() to verify the mount ID */
> +#if defined(CONFIG_STATX) && defined(STATX_MNT_ID)
> +    struct lo_fhandle *fh;
> +    int ret;
> +
> +    if (!lo->use_statx || !lo->inode_file_handles) {
> +        return NULL;
> +    }
> +
> +    fh = g_new0(struct lo_fhandle, 1);
> +
> +    fh->handle.handle_bytes = sizeof(fh->padding) - sizeof(fh->handle);
> +    ret = name_to_handle_at(dirfd, name, &fh->handle, &fh->mount_id,
> +                            AT_EMPTY_PATH);
> +    if (ret < 0) {
> +        goto fail;
> +    }
> +
> +    if (pthread_rwlock_rdlock(&mount_fds_lock)) {
> +        goto fail;
> +    }
> +    if (!g_hash_table_contains(mount_fds, GINT_TO_POINTER(fh->mount_id))) {
> +        struct statx stx;
> +        int fd;
> +
> +        pthread_rwlock_unlock(&mount_fds_lock);
> +
> +        if (name[0]) {
> +            fd = openat(dirfd, name, O_RDONLY);

But can't that be a device file or other special file that you must not
open?

Dave

> +        } else {
> +            char procname[64];
> +            snprintf(procname, sizeof(procname), "%i", dirfd);
> +            fd = openat(lo->proc_self_fd, procname, O_RDONLY);
> +        }
> +        if (fd < 0) {
> +            goto fail;
> +        }
> +
> +        ret = statx(fd, "", AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
> +                    STATX_MNT_ID, &stx);
> +        if (ret < 0) {
> +            if (errno == ENOSYS) {
> +                lo->use_statx = false;
> +                fuse_log(FUSE_LOG_WARNING,
> +                         "statx() does not work: Will not be able to use file "
> +                         "handles for inodes\n");
> +            }
> +            goto fail;
> +        }
> +        if (!(stx.stx_mask & STATX_MNT_ID) || stx.stx_mnt_id != fh->mount_id) {
> +            /*
> +             * One reason for stx_mnt_id != mount_id could be that dirfd/name
> +             * is a directory, and some other filesystem was mounted there
> +             * between us generating the file handle and then opening the FD.
> +             * (Other kinds of races might be possible, too.)
> +             * Failing this function is not fatal, though, because our caller
> +             * (lo_do_lookup()) will just fall back to opening an O_PATH FD to
> +             * store in lo_inode.fd instead of storing a file handle in
> +             * lo_inode.fhandle.  So we do not need to try too hard to get an
> +             * FD for fh->mount_id so this function could succeed.
> +             */
> +            goto fail;
> +        }
> +
> +        if (pthread_rwlock_wrlock(&mount_fds_lock)) {
> +            goto fail;
> +        }
> +
> +        /* Check again, might have changed */
> +        if (g_hash_table_contains(mount_fds, GINT_TO_POINTER(fh->mount_id))) {
> +            close(fd);
> +        } else {
> +            g_hash_table_insert(mount_fds,
> +                                GINT_TO_POINTER(fh->mount_id),
> +                                GINT_TO_POINTER(fd));
> +        }
> +    }
> +    pthread_rwlock_unlock(&mount_fds_lock);
> +
> +    return fh;
> +
> +fail:
> +    free(fh);
> +    return NULL;
> +#else /* defined(CONFIG_STATX) && defined(STATX_MNT_ID) */
> +    return NULL;
> +#endif
> +}
> +
>  /**
>   * Open the given file handle with the given flags.
>   *
> @@ -1132,6 +1239,11 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
>              return -1;
>          }
>          lo->use_statx = false;
> +        if (lo->inode_file_handles) {
> +            fuse_log(FUSE_LOG_WARNING,
> +                     "statx() does not work: Will not be able to use file "
> +                     "handles for inodes\n");
> +        }
>          /* fallback */
>      }
>  #endif
> @@ -1161,6 +1273,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *inode = NULL;
>      struct lo_inode *dir = lo_inode(req, parent);
> +    struct lo_fhandle *fh;
>  
>      if (inodep) {
>          *inodep = NULL; /* in case there is an error */
> @@ -1190,13 +1303,19 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          goto out;
>      }
>  
> -    newfd = openat(dir_fd.fd, name, O_PATH | O_NOFOLLOW);
> -    if (newfd == -1) {
> -        goto out_err;
> -    }
> +    fh = get_file_handle(lo, dir_fd.fd, name);
> +    if (fh) {
> +        res = do_statx(lo, dir_fd.fd, name, &e->attr,
> +                       AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
> +    } else {
> +        newfd = openat(dir_fd.fd, name, O_PATH | O_NOFOLLOW);
> +        if (newfd == -1) {
> +            goto out_err;
> +        }
>  
> -    res = do_statx(lo, newfd, "", &e->attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
> -                   &mnt_id);
> +        res = do_statx(lo, newfd, "", &e->attr,
> +                       AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
> +    }
>      if (res == -1) {
>          goto out_err;
>      }
> @@ -1206,9 +1325,19 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          e->attr_flags |= FUSE_ATTR_SUBMOUNT;
>      }
>  
> -    inode = lo_find(lo, NULL, &e->attr, mnt_id);
> +    /*
> +     * Note that fh is always NULL if lo->inode_file_handles is false,
> +     * and so we will never do a lookup by file handle here, and
> +     * lo->inodes_by_handle will always remain empty.  We only need
> +     * this map when we do not have an O_PATH fd open for every
> +     * lo_inode, though, so if inode_file_handles is false, we do not
> +     * need that map anyway.
> +     */
> +    inode = lo_find(lo, fh, &e->attr, mnt_id);
>      if (inode) {
> -        close(newfd);
> +        if (newfd != -1) {
> +            close(newfd);
> +        }
>      } else {
>          inode = calloc(1, sizeof(struct lo_inode));
>          if (!inode) {
> @@ -1226,6 +1355,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>  
>          inode->nlookup = 1;
>          inode->fd = newfd;
> +        inode->fhandle = fh;
>          inode->key.ino = e->attr.st_ino;
>          inode->key.dev = e->attr.st_dev;
>          inode->key.mnt_id = mnt_id;
> @@ -1237,6 +1367,9 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          pthread_mutex_lock(&lo->mutex);
>          inode->fuse_ino = lo_add_inode_mapping(req, inode);
>          g_hash_table_insert(lo->inodes_by_ids, &inode->key, inode);
> +        if (inode->fhandle) {
> +            g_hash_table_insert(lo->inodes_by_handle, inode->fhandle, inode);
> +        }
>          pthread_mutex_unlock(&lo->mutex);
>      }
>      e->ino = inode->fuse_ino;
> @@ -1530,8 +1663,10 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>      int res;
>      uint64_t mnt_id;
>      struct stat attr;
> +    struct lo_fhandle *fh;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *dir = lo_inode(req, parent);
> +    struct lo_inode *inode;
>  
>      if (!dir) {
>          return NULL;
> @@ -1542,13 +1677,19 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>          return NULL;
>      }
>  
> +    fh = get_file_handle(lo, dir_fd.fd, name);
> +    /* Ignore errors, this is just an optional key for the lookup */
> +
>      res = do_statx(lo, dir_fd.fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
>      lo_inode_put(lo, &dir);
>      if (res == -1) {
>          return NULL;
>      }
>  
> -    return lo_find(lo, NULL, &attr, mnt_id);
> +    inode = lo_find(lo, fh, &attr, mnt_id);
> +    g_free(fh);
> +
> +    return inode;
>  }
>  
>  static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
> @@ -1712,6 +1853,9 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
>      if (!inode->nlookup) {
>          lo_map_remove(&lo->ino_map, inode->fuse_ino);
>          g_hash_table_remove(lo->inodes_by_ids, &inode->key);
> +        if (inode->fhandle) {
> +            g_hash_table_remove(lo->inodes_by_handle, inode->fhandle);
> +        }
>          if (lo->posix_lock) {
>              if (g_hash_table_size(inode->posix_locks)) {
>                  fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
> @@ -4156,6 +4300,14 @@ int main(int argc, char *argv[])
>  
>      lo.use_statx = true;
>  
> +#if !defined(CONFIG_STATX) || !defined(STATX_MNT_ID)
> +    if (lo.inode_file_handles) {
> +        fuse_log(FUSE_LOG_WARNING,
> +                 "No statx() or mount ID support: Will not be able to use file "
> +                 "handles for inodes\n");
> +    }
> +#endif
> +
>      se = fuse_session_new(&args, &lo_oper, sizeof(lo_oper), &lo);
>      if (se == NULL) {
>          goto err_out1;
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index e948f25ac1..ed23e67ba8 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -73,6 +73,7 @@ static const int syscall_allowlist[] = {
>      SCMP_SYS(mprotect),
>      SCMP_SYS(mremap),
>      SCMP_SYS(munmap),
> +    SCMP_SYS(name_to_handle_at),
>      SCMP_SYS(newfstatat),
>      SCMP_SYS(statx),
>      SCMP_SYS(open),
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


