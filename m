Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686CE2D67E8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 21:02:30 +0100 (CET)
Received: from localhost ([::1]:44812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knS8y-0003HL-TY
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 15:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knS5k-00025c-AI
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:59:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knS5i-0004UZ-1D
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:59:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607630345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZQaxlj+pvZEtTgksdXFFrWVr4izwRVTrmc3PQqbQNiE=;
 b=DNMyxweNqf5BnPSMHrdrbjFQhZG8QrFR+cpfNP8JBoANjSJxVoJiBoLpGT/SN3nRbkspdn
 kbKaTSqq8mLVyWi9W5ixYzhZBjn3wJ1MMPVbsaJq0L8B0+jbsmRRhXT0Kbpo6FquxqdZpk
 4JJHtA25vDqz+euHflb4cxIfF/49mvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-Ttpgij_JNQmygCQ70xxbiA-1; Thu, 10 Dec 2020 14:59:03 -0500
X-MC-Unique: Ttpgij_JNQmygCQ70xxbiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2467019611A0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 19:59:02 +0000 (UTC)
Received: from work-vm (ovpn-113-66.ams2.redhat.com [10.36.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BF285D6D3;
 Thu, 10 Dec 2020 19:58:54 +0000 (UTC)
Date: Thu, 10 Dec 2020 19:58:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 2/3] virtiofsd: Disable posix_lock hash table if remote
 locks are not enabled
Message-ID: <20201210195851.GM3629@work-vm>
References: <20201207183021.22752-1-vgoyal@redhat.com>
 <20201207183021.22752-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201207183021.22752-3-vgoyal@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, lersek@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> If remote posix locks are not enabled (lo->posix_lock == false), then disable
> code paths taken to initialize inode->posix_lock hash table and corresponding
> destruction and search etc.
> 
> lo_getlk() and lo_setlk() have been modified to return ENOSYS if daemon
> does not support posix lock but client still sends a lock/unlock request.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/passthrough_ll.c | 51 +++++++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 59202a843b..8ba79f503a 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -914,10 +914,11 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          inode->key.ino = e->attr.st_ino;
>          inode->key.dev = e->attr.st_dev;
>          inode->key.mnt_id = mnt_id;
> -        pthread_mutex_init(&inode->plock_mutex, NULL);
> -        inode->posix_locks = g_hash_table_new_full(
> -            g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
> -
> +        if (lo->posix_lock) {
> +            pthread_mutex_init(&inode->plock_mutex, NULL);
> +            inode->posix_locks = g_hash_table_new_full(
> +                g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
> +        }
>          pthread_mutex_lock(&lo->mutex);
>          inode->fuse_ino = lo_add_inode_mapping(req, inode);
>          g_hash_table_insert(lo->inodes, &inode->key, inode);
> @@ -1303,12 +1304,13 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
>      if (!inode->nlookup) {
>          lo_map_remove(&lo->ino_map, inode->fuse_ino);
>          g_hash_table_remove(lo->inodes, &inode->key);
> -        if (g_hash_table_size(inode->posix_locks)) {
> -            fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
> +        if (lo->posix_lock) {
> +            if (g_hash_table_size(inode->posix_locks)) {
> +                fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
> +            }
> +            g_hash_table_destroy(inode->posix_locks);
> +            pthread_mutex_destroy(&inode->plock_mutex);
>          }
> -        g_hash_table_destroy(inode->posix_locks);
> -        pthread_mutex_destroy(&inode->plock_mutex);
> -
>          /* Drop our refcount from lo_do_lookup() */
>          lo_inode_put(lo, &inode);
>      }
> @@ -1784,6 +1786,11 @@ static void lo_getlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
>               ino, fi->flags, fi->lock_owner, lock->l_type, lock->l_start,
>               lock->l_len);
>  
> +    if (!lo->posix_lock) {
> +        fuse_reply_err(req, ENOSYS);
> +        return;
> +    }
> +
>      inode = lo_inode(req, ino);
>      if (!inode) {
>          fuse_reply_err(req, EBADF);
> @@ -1829,6 +1836,11 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
>               ino, fi->flags, lock->l_type, lock->l_pid, fi->lock_owner, sleep,
>               lock->l_whence, lock->l_start, lock->l_len);
>  
> +    if (!lo->posix_lock) {
> +        fuse_reply_err(req, ENOSYS);
> +        return;
> +    }
> +
>      if (sleep) {
>          fuse_reply_err(req, EOPNOTSUPP);
>          return;
> @@ -1953,6 +1965,7 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>      int res;
>      (void)ino;
>      struct lo_inode *inode;
> +    struct lo_data *lo = lo_data(req);
>  
>      inode = lo_inode(req, ino);
>      if (!inode) {
> @@ -1961,12 +1974,14 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>      }
>  
>      /* An fd is going away. Cleanup associated posix locks */
> -    pthread_mutex_lock(&inode->plock_mutex);
> -    g_hash_table_remove(inode->posix_locks, GUINT_TO_POINTER(fi->lock_owner));
> -    pthread_mutex_unlock(&inode->plock_mutex);
> -
> +    if (lo->posix_lock) {
> +        pthread_mutex_lock(&inode->plock_mutex);
> +        g_hash_table_remove(inode->posix_locks,
> +            GUINT_TO_POINTER(fi->lock_owner));
> +        pthread_mutex_unlock(&inode->plock_mutex);
> +    }
>      res = close(dup(lo_fi_fd(req, fi)));
> -    lo_inode_put(lo_data(req), &inode);
> +    lo_inode_put(lo, &inode);
>      fuse_reply_err(req, res == -1 ? errno : 0);
>  }
>  
> @@ -3372,9 +3387,11 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
>      root->key.mnt_id = mnt_id;
>      root->nlookup = 2;
>      g_atomic_int_set(&root->refcount, 2);
> -    pthread_mutex_init(&root->plock_mutex, NULL);
> -    root->posix_locks = g_hash_table_new_full(
> -        g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
> +    if (lo->posix_lock) {
> +        pthread_mutex_init(&root->plock_mutex, NULL);
> +        root->posix_locks = g_hash_table_new_full(
> +            g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
> +    }
>  }
>  
>  static guint lo_key_hash(gconstpointer key)
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


