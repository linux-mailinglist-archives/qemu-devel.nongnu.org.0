Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A780434895
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:08:26 +0200 (CEST)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8WH-0001VS-Cq
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1md8OW-0002tN-Jw
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:00:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1md8OQ-0005IK-3x
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634724015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOFV0CSUi8Rr5/hT0IJTELPQUgL2knRbC3eARymjUtQ=;
 b=e9JCPU746YIK0o9HMhNb9ybBmcRiTcfPW2oqbbPVBx2RMwhNgo+9kKK0qvZLsHhwZ0IPvF
 N1EJzqSgKNY3FlDolzPYr53n3cNipvIAHwH0XZIMtHbrShkVjnsOpn2nGFR2CC389umg/o
 rnFRiKLAhCIf+v4E9Gw9L1X2zBd1EiM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-a284X3lpPGm7cdwDxCeVyA-1; Wed, 20 Oct 2021 06:00:10 -0400
X-MC-Unique: a284X3lpPGm7cdwDxCeVyA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so3932976wmj.8
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UOFV0CSUi8Rr5/hT0IJTELPQUgL2knRbC3eARymjUtQ=;
 b=FIhG3bx0P18u02XMmK24xjOiLwulK5Ovr+89Yg7AfSHIlJ6vbb4qocYZ5vaucdEAcH
 1KyEAkUjUjzAyZpBlq96rcc3NC9IsH3C0t8wtiGyTbDoxaTXe7/IyUg8RWcNOQ+mV8cl
 ELi7pO7yTvs3DXn4w2kaYPsIXDcnH4aUaILPJgeAeUuFk97cNbVLTfQH1DYc5zfM8YLH
 8h96z+DL/dINZlPN6g78F9h/u5rlRYyycXx2R5MBYQIhGLJY2rUMdouWyt5vguIm0JL2
 uqSgwAPBS5D0yjfihPx7paBPWb26bcc8fdEScm/OhJLXq1qqqWAGtXA2urHPwYmVW87w
 0BIA==
X-Gm-Message-State: AOAM5321/oSKRY8WcLL6foYMkXEVFAlHSgIGi7A8VM+58v6g0YAgdk/H
 n28LRvgoJqE2GDooQwdGwTYx98cQOnpqvOcBtW932bfrRkjx/Clelhtzol6YmkyEbCvlYO7a8Kz
 RJW8Pi3eBjoHYmO0=
X-Received: by 2002:a5d:42ce:: with SMTP id t14mr50710611wrr.439.1634724009197; 
 Wed, 20 Oct 2021 03:00:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEZsuyaipxa5tSdbOsOI2ER2Dsm7hNnCABA8puzVVPNOefC/yedntXO9jwlhCjt03gMVCT1w==
X-Received: by 2002:a5d:42ce:: with SMTP id t14mr50710524wrr.439.1634724008473; 
 Wed, 20 Oct 2021 03:00:08 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id p7sm1526023wrm.61.2021.10.20.03.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 03:00:08 -0700 (PDT)
Message-ID: <161f36dc-2046-9b0b-deac-3fe039849103@redhat.com>
Date: Wed, 20 Oct 2021 12:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 11/12] virtiofsd: Optionally fill lo_inode.fhandle
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
 <20210916084045.31684-12-hreitz@redhat.com> <YW8VBVsCqdUrm+M7@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YW8VBVsCqdUrm+M7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_INVALID=0.1, DKIM_SIGNED=0.1, NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 19.10.21 20:57, Vivek Goyal wrote:
> On Thu, Sep 16, 2021 at 10:40:44AM +0200, Hanna Reitz wrote:
>> When the inode_file_handles option is set, try to generate a file handle
>> for new inodes instead of opening an O_PATH FD.
>>
>> Being able to open these again will require CAP_DAC_READ_SEARCH, so
>> setting this option will result in us taking that capability.
>>
>> Generating a file handle returns the mount ID it is valid for.  Opening
>> it will require an FD instead.  We have mount_fds to map an ID to an FD.
>> get_file_handle() scans /proc/self/mountinfo to map mount IDs to their
>> mount points, which we open to get the mount FD we need.  To verify that
>> the resulting FD indeed represents the handle's mount ID, we use
>> statx().  Therefore, using file handles requires statx() support.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tools/virtiofsd/helper.c              |   3 +
>>   tools/virtiofsd/passthrough_ll.c      | 297 ++++++++++++++++++++++++--
>>   tools/virtiofsd/passthrough_seccomp.c |   1 +
>>   3 files changed, 289 insertions(+), 12 deletions(-)
>>
>> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
>> index a8295d975a..311f05c7ee 100644
>> --- a/tools/virtiofsd/helper.c
>> +++ b/tools/virtiofsd/helper.c
>> @@ -187,6 +187,9 @@ void fuse_cmdline_help(void)
>>              "                               default: no_allow_direct_io\n"
>>              "    -o announce_submounts      Announce sub-mount points to the guest\n"
>>              "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
>> +           "    -o inode_file_handles      Use file handles to reference inodes\n"
>> +           "                               instead of O_PATH file descriptors\n"
>> +           "                               (adds +dac_read_search to modcaps)\n"
>>              );
>>   }
>>   
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index b7d6aa7f9d..e86fad8b2f 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -206,6 +206,8 @@ struct lo_data {
>>       /* Maps (integer) mount IDs to lo_mount_fd objects */
>>       GHashTable *mount_fds;
>>       pthread_rwlock_t mount_fds_lock;
>> +
>> +    int inode_file_handles;
>>   };
>>   
>>   /**
>> @@ -262,6 +264,10 @@ static const struct fuse_opt lo_opts[] = {
>>       { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
>>       { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
>>       { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
>> +    { "inode_file_handles", offsetof(struct lo_data, inode_file_handles), 1 },
>> +    { "no_inode_file_handles",
>> +      offsetof(struct lo_data, inode_file_handles),
>> +      0 },
>>       FUSE_OPT_END
>>   };
>>   static bool use_syslog = false;
>> @@ -359,8 +365,15 @@ static void free_lo_mount_fd(gpointer data)
>>    *
>>    * Pass @drop_mount_fd_ref == true if and only if this handle has a
>>    * strong reference to an lo_mount_fd object in the mount_fds hash
>> - * table.  That is always the case for file handles stored in lo_inode
>> - * objects.
>> + * table, i.e. if this file handle has been returned by a
>> + * get_file_handle() call where *can_open_handle was returned to be
>> + * true.  (That is always the case for file handles stored in lo_inode
>> + * objects, because those file handles must be open-able.)
>> + *
>> + * Conversely, pass @drop_mount_fd_ref == false if and only if this
>> + * file handle has been returned by a get_file_handle() call where
>> + * either NULL was passed for @can_open_handle, or where
>> + * *can_open_handle was returned to be false.
>>    */
>>   static void release_file_handle(struct lo_data *lo, struct lo_fhandle *fh,
>>                                   bool drop_mount_fd_ref)
>> @@ -399,6 +412,196 @@ static void release_file_handle(struct lo_data *lo, struct lo_fhandle *fh,
>>       g_free(fh);
>>   }
>>   
>> +/**
>> + * Generate a file handle for the given dirfd/name combination.
>> + *
>> + * If mount_fds does not yet contain an entry for the handle's mount
>> + * ID, (re)open dirfd/name in O_RDONLY mode and add it to mount_fds
>> + * as the FD for that mount ID.  (That is the file that we have
>> + * generated a handle for, so it should be representative for the
>> + * mount ID.  However, to be sure (and to rule out races), we use
>> + * statx() to verify that our assumption is correct.)
>> + *
>> + * Opening a mount FD can fail in various ways, and independently of
>> + * whether generating a file handle was possible.  Many callers only
>> + * care about getting a file handle for a lookup, though, and so do
>> + * not necessarily need it to be usable.  (You need a valid mount FD
>> + * for the handle to be usable.)
>> + * *can_open_handle will be set to true if the file handle can be
>> + * opened (i.e., we have a mount FD for it), and to false otherwise.
>> + * By passing NULL for @can_open_handle, the caller indicates that
>> + * they do not care about the handle being open-able, and so
>> + * generating a mount FD will be skipped altogether.
>> + *
>> + * File handles must be freed with release_file_handle().
>> + */
>> +static struct lo_fhandle *get_file_handle(struct lo_data *lo,
>> +                                          int dirfd, const char *name,
>> +                                          bool *can_open_handle)
>> +{
>> +    /* We need statx() to verify the mount ID */
>> +#if defined(CONFIG_STATX) && defined(STATX_MNT_ID)
>> +    int root_path_fd = -1;
>> +    int mount_fd = -1;
>> +    struct lo_fhandle *fh = NULL;
>> +    struct lo_mount_fd *mfd;
>> +    int ret;
>> +
>> +    if (!lo->use_statx || !lo->inode_file_handles || !lo->mountinfo_fp) {
>> +        goto fail_handle;
>> +    }
>> +
>> +    fh = g_new0(struct lo_fhandle, 1);
>> +
>> +    fh->handle.handle_bytes = sizeof(fh->padding) - sizeof(fh->handle);
>> +    ret = name_to_handle_at(dirfd, name, &fh->handle, &fh->mount_id,
>> +                            AT_EMPTY_PATH);
>> +    if (ret < 0) {
>> +        goto fail_handle;
>> +    }
>> +
>> +    if (!can_open_handle) {
>> +        /* No need to generate a mount FD if the caller does not care */
>> +        return fh;
>> +    }
>> +
>> +    if (pthread_rwlock_rdlock(&lo->mount_fds_lock)) {
>> +        goto fail_mount_fd;
>> +    }
>> +
>> +    mfd = g_hash_table_lookup(lo->mount_fds, GINT_TO_POINTER(fh->mount_id));
>> +    if (mfd) {
>> +        g_atomic_int_inc(&mfd->refcount);
>> +    } else {
>> +        char *mi_line = NULL;
>> +        size_t mi_line_len = 0;
>> +        char *mount_root = NULL;
>> +        struct statx stx;
>> +        char procname[64];
>> +
>> +        pthread_rwlock_unlock(&lo->mount_fds_lock);
>> +
>> +        rewind(lo->mountinfo_fp);
>> +        while (!mount_root) {
>> +            ssize_t read_count;
>> +            int scan_count;
>> +            int mount_id;
>> +
>> +            read_count = getline(&mi_line, &mi_line_len, lo->mountinfo_fp);
>> +            if (read_count < 0) {
>> +                break;
>> +            }
>> +
>> +            scan_count = sscanf(mi_line, "%d %*d %*d:%*d %*s %ms",
>> +                                &mount_id, &mount_root);
>> +            if (scan_count != 2 || mount_id != fh->mount_id) {
>> +                free(mount_root);
>> +                mount_root = NULL;
>> +            }
>> +        }
>> +        free(mi_line);
>> +
>> +        if (!mount_root) {
>> +            goto fail_mount_fd;
>> +        }
>> +
>> +        root_path_fd = open(mount_root, O_PATH);
> So root_path_fd is basically O_PATH fd for mount point. And you want to
> first open it O_PATH so that you can check that it is either regular
> file or directory before opening it  O_RDONLY. Hmm.., I guess its little
> more complicated but safe.
>
> BTW, if O_RDONLY for mount point is called mount_fd, then calling O_PATH
> fd mount_path_fd will probably be better. A minor nit. You can change it
> if you end up respinning patches.
>
>> +        free(mount_root);
>> +        if (root_path_fd < 0) {
>> +            goto fail_mount_fd;
> We seem to have initialized fh already. In case of failure, fail_mount_fd,
> should we free fh and set fh = NULL. Or is it intentional that you still
> want to return fh even if mount_fd could not be opened. What's the use
> case.

The use case is that in this version, get_file_handle() is allowed to 
return un-openable file handles.  If opening the mount FD fails, the 
file handle is still returned, but *can_open_handle is set to false.

This is useful for lookups, because this way we can always look up by 
file handle unless generating the file handle itself fails.

(In practice, this was probably never an issue, because when you do such 
a lookup and find an existing lo_inode with that file handle, there must 
be an accompanying mount FD already, so the whole mount FD generation 
code in get_file_handle() is skipped, and no errors can arise from it.  
However, this was difficult to understand, as shown by some discussions 
I believed we had.)

(By the way, in the Rust version, there’s a strict type difference 
between file handles and openable file handles.  Turning a file handle 
into an openable file handle requires an extra function call that 
contains the whole mount FD code.  I believe that might have also been a 
nicer model for C virtiofsd, but I just didn’t think of it until Rust 
forced me to...)

>> +        }
>> +
>> +        ret = statx(root_path_fd, "", AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
>> +                    STATX_TYPE | STATX_MNT_ID, &stx);
>> +        if (ret < 0) {
>> +            if (errno == ENOSYS) {
>> +                lo->use_statx = false;
>> +                fuse_log(FUSE_LOG_WARNING,
>> +                         "statx() does not work: Will not be able to use file "
>> +                         "handles for inodes\n");
>> +            }
>> +            goto fail_mount_fd;
>> +        }
>> +        if (!(stx.stx_mask & STATX_MNT_ID) || stx.stx_mnt_id != fh->mount_id) {
>> +            /*
>> +             * Perhaps a TOCTTOU problem.  Just return a non-openable file
>> +             * handle this time and retry for the next handle that we want to
>> +             * generate for this mount.
>> +             */
>> +            goto fail_mount_fd;
>> +        }
>> +        if (!(stx.stx_mask & STATX_TYPE) ||
>> +            !(S_ISREG(stx.stx_mode) || S_ISDIR(stx.stx_mode)))
>> +        {
>> +            /*
>> +             * We must not open special files with anything but O_PATH, so we
>> +             * cannot use this file for mount_fds.  (Note that filesystems can
>> +             * have special files as their root node, so this case can happen.)
>> +             * Just return a failure in such a case and let the lo_inode have
>> +             * an O_PATH fd instead of a file handle.
>> +             */
>> +            goto fail_mount_fd;
>> +        }
>> +
>> +        /* Now that we know this fd is safe to open, do it */
>> +        snprintf(procname, sizeof(procname), "%i", root_path_fd);
>> +        mount_fd = openat(lo->proc_self_fd, procname, O_RDONLY);
>> +        if (mount_fd < 0) {
>> +            goto fail_mount_fd;
>> +        }
>> +
>> +        if (pthread_rwlock_wrlock(&lo->mount_fds_lock)) {
>> +            goto fail_mount_fd;
>> +        }
>> +
>> +        /* Check again, might have changed */
>> +        if (!g_hash_table_contains(lo->mount_fds,
>> +                                   GINT_TO_POINTER(fh->mount_id))) {
>> +            mfd = g_new(struct lo_mount_fd, 1);
>> +
>> +            *mfd = (struct lo_mount_fd) {
>> +                .fd = mount_fd,
>> +                .refcount = 1,
>> +            };
>> +            mount_fd = -1; /* reference moved to *mfd */
>> +
>> +            g_hash_table_insert(lo->mount_fds,
>> +                                GINT_TO_POINTER(fh->mount_id),
>> +                                mfd);
>> +        }
>> +    }
>> +    pthread_rwlock_unlock(&lo->mount_fds_lock);
>> +
>> +    assert(can_open_handle != NULL);
>> +    *can_open_handle = true;
>> +
>> +    goto out;
>> +
>> +fail_handle:
>> +    release_file_handle(lo, fh, false);
>> +    fh = NULL;
>> +
>> +fail_mount_fd:
>> +    if (can_open_handle) {
>> +        *can_open_handle = false;
>> +    }
>> +
>> +out:
>> +    if (root_path_fd >= 0) {
>> +        close(root_path_fd);
>> +    }
>> +    if (mount_fd >= 0) {
>> +        close(mount_fd);
>> +    }
>> +    return fh;
>> +#else /* defined(CONFIG_STATX) && defined(STATX_MNT_ID) */
>> +    if (can_open_handle) {
>> +        *can_open_handle = false;
>> +    }
>> +    return NULL;
>> +#endif
>> +}
>> +
>>   /**
>>    * Open the given file handle with the given flags.
>>    *
>> @@ -1244,6 +1447,11 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
>>               return -1;
>>           }
>>           lo->use_statx = false;
>> +        if (lo->inode_file_handles) {
>> +            fuse_log(FUSE_LOG_WARNING,
>> +                     "statx() does not work: Will not be able to use file "
>> +                     "handles for inodes\n");
>> +        }
>>           /* fallback */
>>       }
>>   #endif
>> @@ -1273,6 +1481,8 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>>       struct lo_data *lo = lo_data(req);
>>       struct lo_inode *inode = NULL;
>>       struct lo_inode *dir = lo_inode(req, parent);
>> +    struct lo_fhandle *fh = NULL;
>> +    bool can_open_handle = false;
>>   
>>       if (inodep) {
>>           *inodep = NULL; /* in case there is an error */
>> @@ -1302,13 +1512,26 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>>           goto out;
>>       }
>>   
>> -    newfd = openat(dir_path_fd.fd, name, O_PATH | O_NOFOLLOW);
>> -    if (newfd == -1) {
>> -        goto out_err;
>> +    fh = get_file_handle(lo, dir_path_fd.fd, name, &can_open_handle);
>> +    if (!fh || !can_open_handle) {
>> +        /*
>> +         * If we will not be able to open the file handle again
>> +         * (can_open_handle is false), open an FD that we can put into
>> +         * lo_inode (in case we need to create a new lo_inode).
>> +         */
>> +        newfd = openat(dir_path_fd.fd, name, O_PATH | O_NOFOLLOW);
>> +        if (newfd == -1) {
>> +            goto out_err;
>> +        }
>>       }
>>   
>> -    res = do_statx(lo, newfd, "", &e->attr, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW,
>> -                   &mnt_id);
>> +    if (newfd >= 0) {
>> +        res = do_statx(lo, newfd, "", &e->attr,
>> +                       AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
>> +    } else {
>> +        res = do_statx(lo, dir_path_fd.fd, name, &e->attr,
>> +                       AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
>> +    }
>>       if (res == -1) {
>>           goto out_err;
>>       }
>> @@ -1318,9 +1541,19 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>>           e->attr_flags |= FUSE_ATTR_SUBMOUNT;
> Can this FUSE_ATTR_SUBMOUNT check be racy w.r.t file handles. I mean
> say we open the file handle, and before we call do_statx(), another
> mount shows up on the directory in queustion. So stats now belong
> to file in new mount and we will think it is a SUBMOUNT. So effectively
> now we have fh belonging to old file but stats belonging to new file
> in new mount?

Yes.  Not just the submount, but the whole stat information, so also the 
file type that goes into the lo_inode.

I thought this wasn’t too bad, though now I don’t really know why. 
Perhaps it was just how I started the implementation and I never could 
get myself to care enough (not good, I know).  Thanks for making me care! :)

We could theoretically open an O_PATH FD from the file handle to get the 
stat information from it, but that wouldn’t work for un-openable file 
handles.

So I think the best is to open an O_PATH FD unconditionally first, and 
then generate the file handle from it.  Then we can stat the FD.  I’ll 
add this to the virtiofsd-rs MR.

>>       }
>>   
>> -    inode = lo_find(lo, NULL, &e->attr, mnt_id);
>> +    /*
>> +     * Note that fh is always NULL if lo->inode_file_handles is false,
>> +     * and so we will never do a lookup by file handle here, and
>> +     * lo->inodes_by_handle will always remain empty.  We only need
>> +     * this map when we do not have an O_PATH fd open for every
>> +     * lo_inode, though, so if inode_file_handles is false, we do not
>> +     * need that map anyway.
>> +     */
>> +    inode = lo_find(lo, fh, &e->attr, mnt_id);
>>       if (inode) {
>> -        close(newfd);
>> +        if (newfd != -1) {
>> +            close(newfd);
>> +        }
>>       } else {
>>           inode = calloc(1, sizeof(struct lo_inode));
>>           if (!inode) {
>> @@ -1338,6 +1571,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>>   
>>           inode->nlookup = 1;
>>           inode->fd = newfd;
>> +        if (can_open_handle) {
>> +            inode->fhandle = fh;
>> +            fh = NULL; /* owned by the lo_inode now */
>> +        }
>>           inode->key.ino = e->attr.st_ino;
>>           inode->key.dev = e->attr.st_dev;
>>           inode->key.mnt_id = mnt_id;
>> @@ -1349,6 +1586,9 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>>           pthread_mutex_lock(&lo->mutex);
>>           inode->fuse_ino = lo_add_inode_mapping(req, inode);
>>           g_hash_table_insert(lo->inodes_by_ids, &inode->key, inode);
>> +        if (inode->fhandle) {
>> +            g_hash_table_insert(lo->inodes_by_handle, inode->fhandle, inode);
>> +        }
>>           pthread_mutex_unlock(&lo->mutex);
>>       }
>>       e->ino = inode->fuse_ino;
>> @@ -1362,6 +1602,8 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>>   
>>       lo_inode_put(lo, &dir);
>>   
>> +    release_file_handle(lo, fh, can_open_handle);
> We transferred ownership of fh to inode (inode->fhandle). Should we be
> releasing it now? What am I missing.

On transfer of ownership, `fh` is set to NULL, so this will be a no-op.  
It is not a no-op if `can_open_handle` is false or when lo_find() 
returned a result, i.e. when the ownership wasn’t transferred.

>> +
>>       fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)parent,
>>                name, (unsigned long long)e->ino);
>>   
>> @@ -1373,6 +1615,7 @@ out:
>>       if (newfd != -1) {
>>           close(newfd);
>>       }
>> +    release_file_handle(lo, fh, can_open_handle);
>>       lo_inode_put(lo, &inode);
>>       lo_inode_put(lo, &dir);
>>       return saverr;
>> @@ -1695,6 +1938,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>>       int res;
>>       uint64_t mnt_id;
>>       struct stat attr;
>> +    struct lo_fhandle *fh;
>>       struct lo_data *lo = lo_data(req);
>>       struct lo_inode *dir = lo_inode(req, parent);
>>       struct lo_inode *inode = NULL;
>> @@ -1708,13 +1952,17 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>>           goto out;
>>       }
>>   
>> +    fh = get_file_handle(lo, dir_path_fd.fd, name, NULL);
>> +    /* Ignore errors, this is just an optional key for the lookup */
>> +
>>       res = do_statx(lo, dir_path_fd.fd, name, &attr, AT_SYMLINK_NOFOLLOW,
>>                      &mnt_id);
>>       if (res == -1) {
>>           goto out;
>>       }
>>   
>> -    inode = lo_find(lo, NULL, &attr, mnt_id);
>> +    inode = lo_find(lo, fh, &attr, mnt_id);
>> +    release_file_handle(lo, fh, false);
>>   
>>   out:
>>       lo_inode_put(lo, &dir);
>> @@ -1882,6 +2130,9 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
>>       if (!inode->nlookup) {
>>           lo_map_remove(&lo->ino_map, inode->fuse_ino);
>>           g_hash_table_remove(lo->inodes_by_ids, &inode->key);
>> +        if (inode->fhandle) {
>> +            g_hash_table_remove(lo->inodes_by_handle, inode->fhandle);
>> +        }
>>           if (lo->posix_lock) {
>>               if (g_hash_table_size(inode->posix_locks)) {
>>                   fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
>> @@ -3978,8 +4229,11 @@ static void setup_mounts(const char *source)
>>   /*
>>    * Only keep capabilities in allowlist that are needed for file system operation
>>    * The (possibly NULL) modcaps_in string passed in is free'd before exit.
>> + *
>> + * Passing true for cap_dac_read_search adds CAP_DAC_READ_SEARCH to the
>> + * allowlist.
>>    */
>> -static void setup_capabilities(char *modcaps_in)
>> +static void setup_capabilities(char *modcaps_in, bool cap_dac_read_search)
>>   {
>>       char *modcaps = modcaps_in;
>>       pthread_mutex_lock(&cap.mutex);
>> @@ -4012,6 +4266,17 @@ static void setup_capabilities(char *modcaps_in)
>>           exit(1);
>>       }
>>   
>> +    /*
>> +     * If we need CAP_DAC_READ_SEARCH (for file handles), add that, too.
>> +     */
>> +    if (cap_dac_read_search &&
>> +        capng_update(CAPNG_ADD, CAPNG_PERMITTED | CAPNG_EFFECTIVE,
>> +                     CAP_DAC_READ_SEARCH)) {
>> +        fuse_log(FUSE_LOG_ERR, "%s: capng_update failed for "
>> +                 "CAP_DAC_READ_SEARCH\n", __func__);
>> +        exit(1);
>> +    }
>> +
>>       /*
>>        * The modcaps option is a colon separated list of caps,
>>        * each preceded by either + or -.
>> @@ -4158,7 +4423,7 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
>>       }
>>   
>>       setup_seccomp(enable_syslog);
>> -    setup_capabilities(g_strdup(lo->modcaps));
>> +    setup_capabilities(g_strdup(lo->modcaps), lo->inode_file_handles);
>>   }
>>   
>>   /* Set the maximum number of open file descriptors */
>> @@ -4498,6 +4763,14 @@ int main(int argc, char *argv[])
>>   
>>       lo.use_statx = true;
>>   
>> +#if !defined(CONFIG_STATX) || !defined(STATX_MNT_ID)
>> +    if (lo.inode_file_handles) {
>> +        fuse_log(FUSE_LOG_WARNING,
>> +                 "No statx() or mount ID support: Will not be able to use file "
>> +                 "handles for inodes\n");
>> +    }
> Again, I think we should error out if user asked for file handle support
> explicitly and we can't enable it. But if we end up enabling by default,
> it probably is fine to just log a message and not use it.
>
> This begs the question what happens if filesystem does not support the
> file handles. Ideally, I would think that we can error out.But for
> submounts check will happen much later. For root mount atleast we
> should be able to check at startup time and make sure file handles are
> supported by filesystem.

I disagree, because we’ve decided that enabling file handles means 
best-effort.  As for CONFIG_STATX or STATX_MNT_ID, those are things that 
will matter less over time anyway (because they will always be present).

Hanna


