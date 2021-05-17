Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30152383B4D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:30:53 +0200 (CEST)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lih4u-00035J-44
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lih1A-0001Zl-9e
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lih17-0002zr-JE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621272416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=po8n2trLdN1niCg1EdgfOWWTeBmMt5rR3G9Snj/oSzw=;
 b=Fb+anZwVsmqhM4QIYfK8RdxQWpV2Tn3zSbfQbIY9gxw1ME2k1ew/SmzU0vGrKSS+QMXXkH
 Aykatcf1mkhfS//Rk9UcvwORD0Q14z8c/XHdFU6fXO+MxfODV+UoIjbxeShHc9+SpfLGbv
 DLpK6KKEQzZCSxARAu89/xCc/nazmfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-UvVjjZGSPaWZXrvpvcX9Ow-1; Mon, 17 May 2021 13:26:41 -0400
X-MC-Unique: UvVjjZGSPaWZXrvpvcX9Ow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 927C31854E21
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 17:26:40 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-29.ams2.redhat.com
 [10.36.113.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AECB2B3BB;
 Mon, 17 May 2021 17:26:30 +0000 (UTC)
Subject: Re: [PATCH 1/3] virtiofsd: Find original inode ID of mount points
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210512125544.9536-1-mreitz@redhat.com>
 <20210512125544.9536-2-mreitz@redhat.com> <20210517145739.GE546943@horse.lan>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <13641be2-e875-ca43-1cc4-8d06a4e6f81c@redhat.com>
Date: Mon, 17 May 2021 19:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517145739.GE546943@horse.lan>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 16:57, Vivek Goyal wrote:
> On Wed, May 12, 2021 at 02:55:42PM +0200, Max Reitz wrote:
>> Mount point directories represent two inodes: On one hand, they are a
>> normal directory on their parent filesystem.  On the other, they are the
>> root node of the filesystem mounted there.  Thus, they have two inode
>> IDs.
>>
>> Right now, we only report the latter inode ID (i.e. the inode ID of the
>> mounted filesystem's root node).  This is fine once the guest has
>> auto-mounted a submount there (so this inode ID goes with a device ID
>> that is distinct from the parent filesystem), but before the auto-mount,
>> they have the device ID of the parent and the inode ID for the submount.
>> This is problematic because this is likely exactly the same
>> st_dev/st_ino combination as the parent filesystem's root node.  This
>> leads to problems for example with `find`, which will thus complain
>> about a filesystem loop if it has visited the parent filesystem's root
>> node before, and then refuse to descend into the submount.
>>
>> There is a way to find the mount directory's original inode ID, and that
>> is to readdir(3) the parent directory, look for the mount directory, and
>> read the dirent.d_ino field.  Using this, we can let lookup and
>> readdirplus return that original inode ID, which the guest will thus
>> show until the submount is auto-mounted.  (Then, it will invoke getattr
>> and that stat(2) call will return the inode ID for the submount.)
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tools/virtiofsd/passthrough_ll.c | 104 +++++++++++++++++++++++++++++--
>>   1 file changed, 99 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
>> index 1553d2ef45..110b6e7e5b 100644
>> --- a/tools/virtiofsd/passthrough_ll.c
>> +++ b/tools/virtiofsd/passthrough_ll.c
>> @@ -968,14 +968,87 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
>>       return 0;
>>   }
>>   
>> +/*
>> + * Use readdir() to find mp_name's inode ID on the parent's filesystem.
>> + * (For mount points, stat() will only return the inode ID on the
>> + * filesystem mounted there, i.e. the root directory's inode ID.  The
>> + * mount point originally was a directory on the parent filesystem,
>> + * though, and so has a different inode ID there.  When passing
>> + * submount information to the guest, we need to pass this other ID,
>> + * so the guest can use it as the inode ID until the submount is
>> + * auto-mounted.  (At which point the guest will invoke getattr and
>> + * find the inode ID on the submount.))
>> + *
>> + * Return 0 on success, and -errno otherwise.  *pino is set only in
>> + * case of success.
>> + */
>> +static int get_mp_ino_on_parent(const struct lo_inode *dir, const char *mp_name,
>> +                                ino_t *pino)
>> +{
>> +    int dirfd = -1;
>> +    int ret;
>> +    DIR *dp = NULL;
>> +
>> +    dirfd = openat(dir->fd, ".", O_RDONLY);
>> +    if (dirfd < 0) {
>> +        ret = -errno;
>> +        goto out;
>> +    }
>> +
>> +    dp = fdopendir(dirfd);
>> +    if (!dp) {
>> +        ret = -errno;
>> +        goto out;
>> +    }
>> +    /* Owned by dp now */
>> +    dirfd = -1;
>> +
>> +    while (true) {
>> +        struct dirent *de;
>> +
>> +        errno = 0;
>> +        de = readdir(dp);
>> +        if (!de) {
>> +            ret = errno ? -errno : -ENOENT;
>> +            goto out;
>> +        }
>> +
>> +        if (!strcmp(de->d_name, mp_name)) {
>> +            *pino = de->d_ino;
>> +            ret = 0;
>> +            goto out;
>> +        }
>> +    }
>> +
>> +out:
>> +    if (dp) {
>> +        closedir(dp);
>> +    }
>> +    if (dirfd >= 0) {
>> +        close(dirfd);
>> +    }
>> +    return ret;
>> +}
>> +
>>   /*
>>    * Increments nlookup on the inode on success. unref_inode_lolocked() must be
>>    * called eventually to decrement nlookup again. If inodep is non-NULL, the
>>    * inode pointer is stored and the caller must call lo_inode_put().
>> + *
>> + * If parent_fs_st_ino is true, the entry is a mount point, and submounts are
>> + * announced to the guest, set e->attr.st_ino to the entry's inode ID on its
>> + * parent filesystem instead of its inode ID on the filesystem mounted on it.
>> + * (For mount points, the entry encompasses two inodes: One on the parent FS,
>> + * and one on the mounted FS (where it is the root node), so it has two inode
>> + * IDs.  When looking up entries, we should show the guest the parent FS's inode
>> + * ID, because as long as the guest has not auto-mounted the submount, it should
>> + * see that original ID.  Once it does perform the auto-mount, it will invoke
>> + * getattr and see the root node's inode ID.)
>>    */
>>   static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>>                           struct fuse_entry_param *e,
>> -                        struct lo_inode **inodep)
>> +                        struct lo_inode **inodep,
>> +                        bool parent_fs_st_ino)
>>   {
>>       int newfd;
>>       int res;
>> @@ -984,6 +1057,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>>       struct lo_data *lo = lo_data(req);
>>       struct lo_inode *inode = NULL;
>>       struct lo_inode *dir = lo_inode(req, parent);
>> +    ino_t ino_id_for_guest;
>>   
>>       if (inodep) {
>>           *inodep = NULL; /* in case there is an error */
>> @@ -1018,9 +1092,22 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>>           goto out_err;
>>       }
>>   
>> +    ino_id_for_guest = e->attr.st_ino;
>> +
>>       if (S_ISDIR(e->attr.st_mode) && lo->announce_submounts &&
>>           (e->attr.st_dev != dir->key.dev || mnt_id != dir->key.mnt_id)) {
>>           e->attr_flags |= FUSE_ATTR_SUBMOUNT;
>> +
>> +        if (parent_fs_st_ino) {
>> +            /*
>> +             * Best effort, so ignore errors.
>> +             * Also note that using readdir() means there may be races:
>> +             * The directory entry we find (if any) may be different
>> +             * from newfd.  Again, this is a best effort.  Reporting
>> +             * the wrong inode ID to the guest is not catastrophic.
>> +             */
>> +            get_mp_ino_on_parent(dir, name, &ino_id_for_guest);
> 
> Hi Max,
> 
> [CC virtio-fs list ]
> 
> In general patch looks good to me. A minor nit. get_mp_ino_on_parent()
> is retruning error. It might be better to capture error and print a
> message and continue.

Sure, why not.

> I have couple of general questions about submounts.
> 
> - What happens in case of single file mounted on top of another file.
> 
>    mount --bind foo.txt bar.txt
> 
> Do submounts work when mount point is not a directory.

No, as you can see in the condition quoted above, we only set the 
FUSE_ATTR_SUBMOUNT flag for directories.  That seemed the most common 
case for me, and I didn’t want to have to worry about weirdness that 
might ensue for file mounts.

> - Say a directory is not a mount point yet and lookup instantiates an
>    inode. Later user mounts something on that directory. When does
>    client/server notice this change. I am assuming this is probably
>    part of revalidation path.

I guess at least before this patch this is no different from any other 
filesystem change.  Because st_dev+st_ino changed, it should basically 
look like the old directory was removed and a different one was put in 
its place.

Now, with this patch, we will return the old st_ino to the guest, but 
internally virtiofsd will still use the submount’s st_dev/st_ino, so a 
new lo_inode should be created, and so fuse_dentry_revalidate()’s lookup 
should return a different node ID, resulting it to consider the entry 
expired.

Besides, fuse_dentry_revalidate() has a condition on IS_AUTOMOUNT(inode) 
!= flags & FUSE_ATTR_SUBMOUNT.  Considering the previous paragraph, this 
doesn’t seem necessary to me, but it can’t hurt.

Max


