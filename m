Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7090433EDE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 20:58:52 +0200 (CEST)
Received: from localhost ([::1]:33146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcuK3-0006OU-QQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 14:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mcuIk-0004wU-Lo
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 14:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mcuIf-00052J-Qg
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 14:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634669842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=75TTKooDyRh8Isco5EG05KGVLBlllPhqIkQqBAOYZPE=;
 b=Vu9CjwjwDGgsnErt7Me36C+G8UfFv18/kxtSIxvDnvf8ivr8+UxIbpmOiZVBB+NDlJ8obZ
 BAjsQm+Fua19UfF2mIUa+N4Dg3Vnl70UZqW1c4cCO4dFTmMt6hFAxTELTA1zn6EUNFZyPv
 W5mMAS/g0dy3oartmipTHoYvrWwiLbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-wvuJ_bJANo-v-lrMMlmbQA-1; Tue, 19 Oct 2021 14:57:19 -0400
X-MC-Unique: wvuJ_bJANo-v-lrMMlmbQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62CA380669A
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 18:57:18 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.33.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51A8D5DD68;
 Tue, 19 Oct 2021 18:57:10 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id C3D392256F7; Tue, 19 Oct 2021 14:57:09 -0400 (EDT)
Date: Tue, 19 Oct 2021 14:57:09 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v4 11/12] virtiofsd: Optionally fill lo_inode.fhandle
Message-ID: <YW8VBVsCqdUrm+M7@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
 <20210916084045.31684-12-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210916084045.31684-12-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Thu, Sep 16, 2021 at 10:40:44AM +0200, Hanna Reitz wrote:
> When the inode_file_handles option is set, try to generate a file handle
> for new inodes instead of opening an O_PATH FD.
> 
> Being able to open these again will require CAP_DAC_READ_SEARCH, so
> setting this option will result in us taking that capability.
> 
> Generating a file handle returns the mount ID it is valid for.  Opening
> it will require an FD instead.  We have mount_fds to map an ID to an FD.
> get_file_handle() scans /proc/self/mountinfo to map mount IDs to their
> mount points, which we open to get the mount FD we need.  To verify that
> the resulting FD indeed represents the handle's mount ID, we use
> statx().  Therefore, using file handles requires statx() support.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tools/virtiofsd/helper.c              |   3 +
>  tools/virtiofsd/passthrough_ll.c      | 297 ++++++++++++++++++++++++--
>  tools/virtiofsd/passthrough_seccomp.c |   1 +
>  3 files changed, 289 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index a8295d975a..311f05c7ee 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -187,6 +187,9 @@ void fuse_cmdline_help(void)
>             "                               default: no_allow_direct_io\n"
>             "    -o announce_submounts      Announce sub-mount points to the guest\n"
>             "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
> +           "    -o inode_file_handles      Use file handles to reference inodes\n"
> +           "                               instead of O_PATH file descriptors\n"
> +           "                               (adds +dac_read_search to modcaps)\n"
>             );
>  }
>  
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index b7d6aa7f9d..e86fad8b2f 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -206,6 +206,8 @@ struct lo_data {
>      /* Maps (integer) mount IDs to lo_mount_fd objects */
>      GHashTable *mount_fds;
>      pthread_rwlock_t mount_fds_lock;
> +
> +    int inode_file_handles;
>  };
>  
>  /**
> @@ -262,6 +264,10 @@ static const struct fuse_opt lo_opts[] = {
>      { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
>      { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
>      { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
> +    { "inode_file_handles", offsetof(struct lo_data, inode_file_handles), 1 },
> +    { "no_inode_file_handles",
> +      offsetof(struct lo_data, inode_file_handles),
> +      0 },
>      FUSE_OPT_END
>  };
>  static bool use_syslog = false;
> @@ -359,8 +365,15 @@ static void free_lo_mount_fd(gpointer data)
>   *
>   * Pass @drop_mount_fd_ref == true if and only if this handle has a
>   * strong reference to an lo_mount_fd object in the mount_fds hash
> - * table.  That is always the case for file handles stored in lo_inode
> - * objects.
> + * table, i.e. if this file handle has been returned by a
> + * get_file_handle() call where *can_open_handle was returned to be
> + * true.  (That is always the case for file handles stored in lo_inode
> + * objects, because those file handles must be open-able.)
> + *
> + * Conversely, pass @drop_mount_fd_ref == false if and only if this
> + * file handle has been returned by a get_file_handle() call where
> + * either NULL was passed for @can_open_handle, or where
> + * *can_open_handle was returned to be false.
>   */
>  static void release_file_handle(struct lo_data *lo, struct lo_fhandle *fh,
>                                  bool drop_mount_fd_ref)
> @@ -399,6 +412,196 @@ static void release_file_handle(struct lo_data *lo, struct lo_fhandle *fh,
>      g_free(fh);
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
> + *
> + * Opening a mount FD can fail in various ways, and independently of
> + * whether generating a file handle was possible.  Many callers only
> + * care about getting a file handle for a lookup, though, and so do
> + * not necessarily need it to be usable.  (You need a valid mount FD
> + * for the handle to be usable.)
> + * *can_open_handle will be set to true if the file handle can be
> + * opened (i.e., we have a mount FD for it), and to false otherwise.
> + * By passing NULL for @can_open_handle, the caller indicates that
> + * they do not care about the handle being open-able, and so
> + * generating a mount FD will be skipped altogether.
> + *
> + * File handles must be freed with release_file_handle().
> + */
> +static struct lo_fhandle *get_file_handle(struct lo_data *lo,
> +                                          int dirfd, const char *name,
> +                                          bool *can_open_handle)
> +{
> +    /* We need statx() to verify the mount ID */
> +#if defined(CONFIG_STATX) && defined(STATX_MNT_ID)
> +    int root_path_fd = -1;
> +    int mount_fd = -1;
> +    struct lo_fhandle *fh = NULL;
> +    struct lo_mount_fd *mfd;
> +    int ret;
> +
> +    if (!lo->use_statx || !lo->inode_file_handles || !lo->mountinfo_fp) {
> +        goto fail_handle;
> +    }
> +
> +    fh = g_new0(struct lo_fhandle, 1);
> +
> +    fh->handle.handle_bytes = sizeof(fh->padding) - sizeof(fh->handle);
> +    ret = name_to_handle_at(dirfd, name, &fh->handle, &fh->mount_id,
> +                            AT_EMPTY_PATH);
> +    if (ret < 0) {
> +        goto fail_handle;
> +    }
> +
> +    if (!can_open_handle) {
> +        /* No need to generate a mount FD if the caller does not care */
> +        return fh;
> +    }
> +
> +    if (pthread_rwlock_rdlock(&lo->mount_fds_lock)) {
> +        goto fail_mount_fd;
> +    }
> +
> +    mfd = g_hash_table_lookup(lo->mount_fds, GINT_TO_POINTER(fh->mount_id));
> +    if (mfd) {
> +        g_atomic_int_inc(&mfd->refcount);
> +    } else {
> +        char *mi_line = NULL;
> +        size_t mi_line_len = 0;
> +        char *mount_root = NULL;
> +        struct statx stx;
> +        char procname[64];
> +
> +        pthread_rwlock_unlock(&lo->mount_fds_lock);
> +
> +        rewind(lo->mountinfo_fp);
> +        while (!mount_root) {
> +            ssize_t read_count;
> +            int scan_count;
> +            int mount_id;
> +
> +            read_count = getline(&mi_line, &mi_line_len, lo->mountinfo_fp);
> +            if (read_count < 0) {
> +                break;
> +            }
> +
> +            scan_count = sscanf(mi_line, "%d %*d %*d:%*d %*s %ms",
> +                                &mount_id, &mount_root);
> +            if (scan_count != 2 || mount_id != fh->mount_id) {
> +                free(mount_root);
> +                mount_root = NULL;
> +            }
> +        }
> +        free(mi_line);
> +
> +        if (!mount_root) {
> +            goto fail_mount_fd;
> +        }
> +
> +        root_path_fd = open(mount_root, O_PATH);

So root_path_fd is basically O_PATH fd for mount point. And you want to
first open it O_PATH so that you can check that it is either regular
file or directory before opening it  O_RDONLY. Hmm.., I guess its little
more complicated but safe.

BTW, if O_RDONLY for mount point is called mount_fd, then calling O_PATH
fd mount_path_fd will probably be better. A minor nit. You can change it
if you end up respinning patches.

> +        free(mount_root);
> +        if (root_path_fd < 0) {
> +            goto fail_mount_fd;

We seem to have initialized fh already. In case of failure, fail_mount_fd,
should we free fh and set fh = NULL. Or is it intentional that you still
want to return fh even if mount_fd could not be opened. What's the use
case.

> +        }
> +
> +        ret = statx(root_path_fd, "", AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
> +                    STATX_TYPE | STATX_MNT_ID, &stx);
> +        if (ret < 0) {
> +            if (errno == ENOSYS) {
> +                lo->use_statx = false;
> +                fuse_log(FUSE_LOG_WARNING,
> +                         "statx() does not work: Will not be able to use file "
> +                         "handles for inodes\n");
> +            }
> +            goto fail_mount_fd;
> +        }
> +        if (!(stx.stx_mask & STATX_MNT_ID) || stx.stx_mnt_id != fh->mount_id) {
> +            /*
> +             * Perhaps a TOCTTOU problem.  Just return a non-openable file
> +             * handle this time and retry for the next handle that we want to
> +             * generate for this mount.
> +             */
> +            goto fail_mount_fd;
> +        }
> +        if (!(stx.stx_mask & STATX_TYPE) ||
> +            !(S_ISREG(stx.stx_mode) || S_ISDIR(stx.stx_mode)))
> +        {
> +            /*
> +             * We must not open special files with anything but O_PATH, so we
> +             * cannot use this file for mount_fds.  (Note that filesystems can
> +             * have special files as their root node, so this case can happen.)
> +             * Just return a failure in such a case and let the lo_inode have
> +             * an O_PATH fd instead of a file handle.
> +             */
> +            goto fail_mount_fd;
> +        }
> +
> +        /* Now that we know this fd is safe to open, do it */
> +        snprintf(procname, sizeof(procname), "%i", root_path_fd);
> +        mount_fd = openat(lo->proc_self_fd, procname, O_RDONLY);
> +        if (mount_fd < 0) {
> +            goto fail_mount_fd;
> +        }
> +
> +        if (pthread_rwlock_wrlock(&lo->mount_fds_lock)) {
> +            goto fail_mount_fd;
> +        }
> +
> +        /* Check again, might have changed */
> +        if (!g_hash_table_contains(lo->mount_fds,
> +                                   GINT_TO_POINTER(fh->mount_id))) {
> +            mfd = g_new(struct lo_mount_fd, 1);
> +
> +            *mfd = (struct lo_mount_fd) {
> +                .fd = mount_fd,
> +                .refcount = 1,
> +            };
> +            mount_fd = -1; /* reference moved to *mfd */
> +
> +            g_hash_table_insert(lo->mount_fds,
> +                                GINT_TO_POINTER(fh->mount_id),
> +                                mfd);
> +        }
> +    }
> +    pthread_rwlock_unlock(&lo->mount_fds_lock);
> +
> +    assert(can_open_handle != NULL);
> +    *can_open_handle = true;
> +
> +    goto out;
> +
> +fail_handle:
> +    release_file_handle(lo, fh, false);
> +    fh = NULL;
> +
> +fail_mount_fd:
> +    if (can_open_handle) {
> +        *can_open_handle = false;
> +    }
> +
> +out:
> +    if (root_path_fd >= 0) {
> +        close(root_path_fd);
> +    }
> +    if (mount_fd >= 0) {
> +        close(mount_fd);
> +    }
> +    return fh;
> +#else /* defined(CONFIG_STATX) && defined(STATX_MNT_ID) */
> +    if (can_open_handle) {
> +        *can_open_handle = false;
> +    }
> +    return NULL;
> +#endif
> +}
> +
>  /**
>   * Open the given file handle with the given flags.
>   *
> @@ -1244,6 +1447,11 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
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
> @@ -1273,6 +1481,8 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *inode = NULL;
>      struct lo_inode *dir = lo_inode(req, parent);
> +    struct lo_fhandle *fh = NULL;
> +    bool can_open_handle = false;
>  
>      if (inodep) {
>          *inodep = NULL; /* in case there is an error */
> @@ -1302,13 +1512,26 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          goto out;
>      }
>  
> -    newfd = openat(dir_path_fd.fd, name, O_PATH | O_NOFOLLOW);
> -    if (newfd == -1) {
> -        goto out_err;
> +    fh = get_file_handle(lo, dir_path_fd.fd, name, &can_open_handle);
> +    if (!fh || !can_open_handle) {
> +        /*
> +         * If we will not be able to open the file handle again
> +         * (can_open_handle is false), open an FD that we can put into
> +         * lo_inode (in case we need to create a new lo_inode).
> +         */
> +        newfd = openat(dir_path_fd.fd, name, O_PATH | O_NOFOLLOW);
> +        if (newfd == -1) {
> +            goto out_err;
> +        }
>      }
>  
> -    res = do_statx(lo, newfd, "", &e->attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
> -                   &mnt_id);
> +    if (newfd >= 0) {
> +        res = do_statx(lo, newfd, "", &e->attr,
> +                       AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
> +    } else {
> +        res = do_statx(lo, dir_path_fd.fd, name, &e->attr,
> +                       AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
> +    }
>      if (res == -1) {
>          goto out_err;
>      }
> @@ -1318,9 +1541,19 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          e->attr_flags |= FUSE_ATTR_SUBMOUNT;

Can this FUSE_ATTR_SUBMOUNT check be racy w.r.t file handles. I mean
say we open the file handle, and before we call do_statx(), another
mount shows up on the directory in queustion. So stats now belong
to file in new mount and we will think it is a SUBMOUNT. So effectively
now we have fh belonging to old file but stats belonging to new file
in new mount?

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
> @@ -1338,6 +1571,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>  
>          inode->nlookup = 1;
>          inode->fd = newfd;
> +        if (can_open_handle) {
> +            inode->fhandle = fh;
> +            fh = NULL; /* owned by the lo_inode now */
> +        }
>          inode->key.ino = e->attr.st_ino;
>          inode->key.dev = e->attr.st_dev;
>          inode->key.mnt_id = mnt_id;
> @@ -1349,6 +1586,9 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          pthread_mutex_lock(&lo->mutex);
>          inode->fuse_ino = lo_add_inode_mapping(req, inode);
>          g_hash_table_insert(lo->inodes_by_ids, &inode->key, inode);
> +        if (inode->fhandle) {
> +            g_hash_table_insert(lo->inodes_by_handle, inode->fhandle, inode);
> +        }
>          pthread_mutex_unlock(&lo->mutex);
>      }
>      e->ino = inode->fuse_ino;
> @@ -1362,6 +1602,8 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>  
>      lo_inode_put(lo, &dir);
>  
> +    release_file_handle(lo, fh, can_open_handle);

We transferred ownership of fh to inode (inode->fhandle). Should we be
releasing it now? What am I missing.

> +
>      fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)parent,
>               name, (unsigned long long)e->ino);
>  
> @@ -1373,6 +1615,7 @@ out:
>      if (newfd != -1) {
>          close(newfd);
>      }
> +    release_file_handle(lo, fh, can_open_handle);
>      lo_inode_put(lo, &inode);
>      lo_inode_put(lo, &dir);
>      return saverr;
> @@ -1695,6 +1938,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>      int res;
>      uint64_t mnt_id;
>      struct stat attr;
> +    struct lo_fhandle *fh;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *dir = lo_inode(req, parent);
>      struct lo_inode *inode = NULL;
> @@ -1708,13 +1952,17 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>          goto out;
>      }
>  
> +    fh = get_file_handle(lo, dir_path_fd.fd, name, NULL);
> +    /* Ignore errors, this is just an optional key for the lookup */
> +
>      res = do_statx(lo, dir_path_fd.fd, name, &attr, AT_SYMLINK_NOFOLLOW,
>                     &mnt_id);
>      if (res == -1) {
>          goto out;
>      }
>  
> -    inode = lo_find(lo, NULL, &attr, mnt_id);
> +    inode = lo_find(lo, fh, &attr, mnt_id);
> +    release_file_handle(lo, fh, false);
>  
>  out:
>      lo_inode_put(lo, &dir);
> @@ -1882,6 +2130,9 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
>      if (!inode->nlookup) {
>          lo_map_remove(&lo->ino_map, inode->fuse_ino);
>          g_hash_table_remove(lo->inodes_by_ids, &inode->key);
> +        if (inode->fhandle) {
> +            g_hash_table_remove(lo->inodes_by_handle, inode->fhandle);
> +        }
>          if (lo->posix_lock) {
>              if (g_hash_table_size(inode->posix_locks)) {
>                  fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
> @@ -3978,8 +4229,11 @@ static void setup_mounts(const char *source)
>  /*
>   * Only keep capabilities in allowlist that are needed for file system operation
>   * The (possibly NULL) modcaps_in string passed in is free'd before exit.
> + *
> + * Passing true for cap_dac_read_search adds CAP_DAC_READ_SEARCH to the
> + * allowlist.
>   */
> -static void setup_capabilities(char *modcaps_in)
> +static void setup_capabilities(char *modcaps_in, bool cap_dac_read_search)
>  {
>      char *modcaps = modcaps_in;
>      pthread_mutex_lock(&cap.mutex);
> @@ -4012,6 +4266,17 @@ static void setup_capabilities(char *modcaps_in)
>          exit(1);
>      }
>  
> +    /*
> +     * If we need CAP_DAC_READ_SEARCH (for file handles), add that, too.
> +     */
> +    if (cap_dac_read_search &&
> +        capng_update(CAPNG_ADD, CAPNG_PERMITTED | CAPNG_EFFECTIVE,
> +                     CAP_DAC_READ_SEARCH)) {
> +        fuse_log(FUSE_LOG_ERR, "%s: capng_update failed for "
> +                 "CAP_DAC_READ_SEARCH\n", __func__);
> +        exit(1);
> +    }
> +
>      /*
>       * The modcaps option is a colon separated list of caps,
>       * each preceded by either + or -.
> @@ -4158,7 +4423,7 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
>      }
>  
>      setup_seccomp(enable_syslog);
> -    setup_capabilities(g_strdup(lo->modcaps));
> +    setup_capabilities(g_strdup(lo->modcaps), lo->inode_file_handles);
>  }
>  
>  /* Set the maximum number of open file descriptors */
> @@ -4498,6 +4763,14 @@ int main(int argc, char *argv[])
>  
>      lo.use_statx = true;
>  
> +#if !defined(CONFIG_STATX) || !defined(STATX_MNT_ID)
> +    if (lo.inode_file_handles) {
> +        fuse_log(FUSE_LOG_WARNING,
> +                 "No statx() or mount ID support: Will not be able to use file "
> +                 "handles for inodes\n");
> +    }

Again, I think we should error out if user asked for file handle support
explicitly and we can't enable it. But if we end up enabling by default,
it probably is fine to just log a message and not use it.

This begs the question what happens if filesystem does not support the
file handles. Ideally, I would think that we can error out. But for
submounts check will happen much later. For root mount atleast we
should be able to check at startup time and make sure file handles are
supported by filesystem.

Thanks
Vivek

> +#endif
> +
>      se = fuse_session_new(&args, &lo_oper, sizeof(lo_oper), &lo);
>      if (se == NULL) {
>          goto err_out1;
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index af04c638cb..ab4dc07e3f 100644
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


