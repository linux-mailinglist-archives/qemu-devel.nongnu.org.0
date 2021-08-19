Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954E93F1E35
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:40:22 +0200 (CEST)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGl5Z-00059I-LY
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGl4B-0003TW-Kf
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGl49-0000iY-CC
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629391132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eysc01uj/mZoGNo213+MCycl5A4LsOaHAHder6Ckvm0=;
 b=QAZvt3wEsvBs7GQok4p/OVWRmy4niHKE4SxkXUQqSPKaw0HLi6kstoht807O5VlXrf7Pkm
 ScVEbbt2EJlukErSbekc1tyElPrab6rFMJ03huXfClfW4oly2nOqT2TPFfvCETkPQlMeDQ
 Si/w+/Sp+6jYdBT8O8TfMUEITXow7BQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-bS5FQT3pPduIzldg_xwh6Q-1; Thu, 19 Aug 2021 12:38:50 -0400
X-MC-Unique: bS5FQT3pPduIzldg_xwh6Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so3685577wml.5
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Eysc01uj/mZoGNo213+MCycl5A4LsOaHAHder6Ckvm0=;
 b=cK8TqlbxkEUj+Sd1pZLqBrqS2q++Ee5Y+nAeMKk32Y9r4jae/R34gFEApeNJ34JVmR
 f0Mtfte3XRXx1Eiu6wZGU8VJ/D0a8X35NVTlO++PevpAmnGcQaVRsKw26cSDVSHS6uiJ
 UXbhD4xbI/jjb4jt1EGZ9p0tdF4BPO9kL/QvboLsxW9+xlAy9uWX7dD2vErMZ6OArdST
 bryBd6KuEprnI/zdA5wg5XmdMUxg5nynHrtAGtRri6GT5OyoqCios0SECCohtcLARroa
 C95VT8+HI5glsUl5Laz0pQSvrXfGbspGherJtN7jVuCybygpyT9gyBKIql0CvOaOTyp0
 fzRA==
X-Gm-Message-State: AOAM531xmwF+wn+XmZAghW4bhQ6LJhv6KPNOajwT/AH5Zhqs2+k7AkL2
 qAgJ6HMq0MPtSKz8tMXr6gBAL7yr0QwNg5kZwS0I4agxarvT7jc2Z5c7WB443yUt1ipgaE4qx1l
 P53R5bywp/jqBxlI=
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr5382039wmq.171.1629391129269; 
 Thu, 19 Aug 2021 09:38:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymetHpPGwEUKSouuZkJYaVw1hZfKB8/PtqMznLUCM1s5irLXxRCowK3w28sd3SSREz2ZhhMQ==
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr5382013wmq.171.1629391128943; 
 Thu, 19 Aug 2021 09:38:48 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id q10sm2863156wmq.12.2021.08.19.09.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:38:47 -0700 (PDT)
Date: Thu, 19 Aug 2021 17:38:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 09/10] virtiofsd: Optionally fill lo_inode.fhandle
Message-ID: <YR6JFPJFJ7W/UTGf@work-vm>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-10-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730150134.216126-10-mreitz@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, Vivek Goyal <vgoyal@redhat.com>
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
>  tools/virtiofsd/passthrough_ll.c      | 194 ++++++++++++++++++++++++--
>  tools/virtiofsd/passthrough_seccomp.c |   1 +
>  3 files changed, 190 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index a8295d975a..aa63a21d43 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -187,6 +187,9 @@ void fuse_cmdline_help(void)
>             "                               default: no_allow_direct_io\n"
>             "    -o announce_submounts      Announce sub-mount points to the guest\n"
>             "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
> +           "    -o inode_file_handles      Use file handles to reference inodes\n"
> +           "                               instead of O_PATH file descriptors\n"
> +           "                               (requires -o modcaps=+dac_read_search)\n"

I think you should probably add that automatically for the user; we do
similar for seccomp/syslog (see syscall_allowlist_syslog); just do it
before the while (modcaps) {   line so whatever the user specifies
sticks.

Dave

>             );
>  }
>  
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index f9d8b2f134..ac95961d12 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -194,6 +194,7 @@ struct lo_data {
>      /* If set, virtiofsd is responsible for setting umask during creation */
>      bool change_umask;
>      int user_posix_acl, posix_acl;
> +    int inode_file_handles;
>  };
>  
>  /**
> @@ -250,6 +251,10 @@ static const struct fuse_opt lo_opts[] = {
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
> @@ -321,6 +326,135 @@ static int temp_fd_steal(TempFd *temp_fd)
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
> +        g_auto(TempFd) path_fd = TEMP_FD_INIT;
> +        struct statx stx;
> +        char procname[64];
> +        int fd;
> +
> +        pthread_rwlock_unlock(&mount_fds_lock);
> +
> +        /*
> +         * Before opening an O_RDONLY fd, check whether dirfd/name is a regular
> +         * file or directory, because we must not open anything else with
> +         * anything but O_PATH.
> +         * (And we use that occasion to verify that the file has the mount ID we
> +         * need.)
> +         */
> +        if (name[0]) {
> +            path_fd.fd = openat(dirfd, name, O_PATH);
> +            if (path_fd.fd < 0) {
> +                goto fail;
> +            }
> +            path_fd.owned = true;
> +        } else {
> +            path_fd.fd = dirfd;
> +            path_fd.owned = false;
> +        }
> +
> +        ret = statx(path_fd.fd, "", AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
> +                    STATX_TYPE | STATX_MNT_ID, &stx);
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
> +        if (!(stx.stx_mask & STATX_TYPE) ||
> +            !(S_ISREG(stx.stx_mode) || S_ISDIR(stx.stx_mode)))
> +        {
> +            /*
> +             * We must not open special files with anything but O_PATH, so we
> +             * cannot use this file for mount_fds.
> +             * Just return a failure in such a case and let the lo_inode have
> +             * an O_PATH fd instead of a file handle.
> +             */
> +            goto fail;
> +        }
> +
> +        /* Now that we know this fd is safe to open, do it */
> +        snprintf(procname, sizeof(procname), "%i", path_fd.fd);
> +        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
> +        if (fd < 0) {
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
> @@ -1165,6 +1299,11 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
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
> @@ -1194,6 +1333,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *inode = NULL;
>      struct lo_inode *dir = lo_inode(req, parent);
> +    struct lo_fhandle *fh;
>  
>      if (inodep) {
>          *inodep = NULL; /* in case there is an error */
> @@ -1223,13 +1363,21 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          goto out;
>      }
>  
> -    newfd = openat(dir_fd.fd, name, O_PATH | O_NOFOLLOW);
> -    if (newfd == -1) {
> -        goto out_err;
> +    fh = get_file_handle(lo, dir_fd.fd, name);
> +    if (!fh) {
> +        newfd = openat(dir_fd.fd, name, O_PATH | O_NOFOLLOW);
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
> +        res = do_statx(lo, dir_fd.fd, name, &e->attr,
> +                       AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
> +    }
>      if (res == -1) {
>          goto out_err;
>      }
> @@ -1239,9 +1387,19 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
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
> @@ -1259,6 +1417,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>  
>          inode->nlookup = 1;
>          inode->fd = newfd;
> +        inode->fhandle = fh;
>          inode->key.ino = e->attr.st_ino;
>          inode->key.dev = e->attr.st_dev;
>          inode->key.mnt_id = mnt_id;
> @@ -1270,6 +1429,9 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          pthread_mutex_lock(&lo->mutex);
>          inode->fuse_ino = lo_add_inode_mapping(req, inode);
>          g_hash_table_insert(lo->inodes_by_ids, &inode->key, inode);
> +        if (inode->fhandle) {
> +            g_hash_table_insert(lo->inodes_by_handle, inode->fhandle, inode);
> +        }
>          pthread_mutex_unlock(&lo->mutex);
>      }
>      e->ino = inode->fuse_ino;
> @@ -1615,6 +1777,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>      int res;
>      uint64_t mnt_id;
>      struct stat attr;
> +    struct lo_fhandle *fh;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *dir = lo_inode(req, parent);
>      struct lo_inode *inode = NULL;
> @@ -1628,12 +1791,16 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>          goto out;
>      }
>  
> +    fh = get_file_handle(lo, dir_fd.fd, name);
> +    /* Ignore errors, this is just an optional key for the lookup */
> +
>      res = do_statx(lo, dir_fd.fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
>      if (res == -1) {
>          goto out;
>      }
>  
> -    inode = lo_find(lo, NULL, &attr, mnt_id);
> +    inode = lo_find(lo, fh, &attr, mnt_id);
> +    g_free(fh);
>  
>  out:
>      lo_inode_put(lo, &dir);
> @@ -1801,6 +1968,9 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
>      if (!inode->nlookup) {
>          lo_map_remove(&lo->ino_map, inode->fuse_ino);
>          g_hash_table_remove(lo->inodes_by_ids, &inode->key);
> +        if (inode->fhandle) {
> +            g_hash_table_remove(lo->inodes_by_handle, inode->fhandle);
> +        }
>          if (lo->posix_lock) {
>              if (g_hash_table_size(inode->posix_locks)) {
>                  fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
> @@ -4362,6 +4532,14 @@ int main(int argc, char *argv[])
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
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


