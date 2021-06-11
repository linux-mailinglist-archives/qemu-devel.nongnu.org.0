Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBAC3A49DB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 22:06:17 +0200 (CEST)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrnQ0-0006V2-F5
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 16:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lrnOz-0005ol-Qe
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 16:05:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lrnOt-0007jb-Rf
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 16:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623441905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WrpS/K1IxYtxmacskg2Yd/MwVi2APg/6/wBxivcDHXE=;
 b=ArbpV+FrmaVbxfU/9kzpU+lLdoYMH+6Lcm7Y/RtlE30NZ9JmetAUDlrRsdJ7bAJpkEwQ6+
 1WhB2gz6+fNDh47ns7dc29bwPgdOpoN0mgokAtATiqRgDnSunyM+GcSotHIaJl6a3pIctI
 u0dPcXloQcHuP4v0azNSZREXeHOy6FE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-vhD2LvehO0q48pJZqsCGkQ-1; Fri, 11 Jun 2021 16:05:04 -0400
X-MC-Unique: vhD2LvehO0q48pJZqsCGkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E5CF1922969
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 20:05:03 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-174.rdu2.redhat.com [10.10.116.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA79C5B4A8;
 Fri, 11 Jun 2021 20:04:59 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 41DDA22054F; Fri, 11 Jun 2021 16:04:59 -0400 (EDT)
Date: Fri, 11 Jun 2021 16:04:59 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v2 7/9] virtiofsd: Add inodes_by_handle hash
 table
Message-ID: <20210611200459.GB767764@redhat.com>
References: <20210609155551.44437-1-mreitz@redhat.com>
 <20210609155551.44437-8-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609155551.44437-8-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:55:49PM +0200, Max Reitz wrote:
> Currently, lo_inode.fhandle is always NULL and so always keep an O_PATH
> FD in lo_inode.fd.  Therefore, when the respective inode is unlinked,
> its inode ID will remain in use until we drop our lo_inode (and
> lo_inode_put() thus closes the FD).  Therefore, lo_find() can safely use
> the inode ID as an lo_inode key, because any inode with an inode ID we
> find in lo_data.inodes (on the same filesystem) must be the exact same
> file.
> 
> This will change when we start setting lo_inode.fhandle so we do not
> have to keep an O_PATH FD open.  Then, unlinking such an inode will
> immediately remove it, so its ID can then be reused by newly created
> files, even while the lo_inode object is still there[1].
> 
> So creating a new file can then reuse the old file's inode ID, and
> looking up the new file would lead to us finding the old file's
> lo_inode, which is not ideal.
> 
> Luckily, just as file handles cause this problem, they also solve it:  A
> file handle contains a generation ID, which changes when an inode ID is
> reused, so the new file can be distinguished from the old one.  So all
> we need to do is to add a second map besides lo_data.inodes that maps
> file handles to lo_inodes, namely lo_data.inodes_by_handle.  For
> clarity, lo_data.inodes is renamed to lo_data.inodes_by_ids.
> 
> Unfortunately, we cannot rely on being able to generate file handles
> every time.

Hi Max, 

What are the cases where we can not rely being able to generate file
handles?

> Therefore, we still enter every lo_inode object into
> inodes_by_ids, but having an entry in inodes_by_handle is optional.  A
> potential inodes_by_handle entry then has precedence, the inodes_by_ids
> entry is just a fallback.

If we have to keep inodes_by_ids around, then can we just add fhandle
to the lo_key. That way we can manage with single hash table and still
be able to detect if inode ID has been reused.

Thanks
Vivek

> 
> Note that we do not generate lo_fhandle objects yet, and so we also do
> not enter anything into the inodes_by_handle map yet.  Also, all lookups
> skip that map.  We might manually create file handles with some code
> that is immediately removed by the next patch again, but that would
> break the assumption in lo_find() that every lo_inode with a non-NULL
> .fhandle must have an entry in inodes_by_handle and vice versa.  So we
> leave actually using the inodes_by_handle map for the next patch.
> 
> [1] If some application in the guest still has the file open, there is
> going to be a corresponding FD mapping in lo_data.fd_map.  In such a
> case, the inode will only go away once every application in the guest
> has closed it.  The problem described only applies to cases where the
> guest does not have the file open, and it is just in the dentry cache,
> basically.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 80 +++++++++++++++++++++++++-------
>  1 file changed, 64 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index e665575401..793d2c333e 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -179,7 +179,8 @@ struct lo_data {
>      int announce_submounts;
>      bool use_statx;
>      struct lo_inode root;
> -    GHashTable *inodes; /* protected by lo->mutex */
> +    GHashTable *inodes_by_ids; /* protected by lo->mutex */
> +    GHashTable *inodes_by_handle; /* protected by lo->mutex */
>      struct lo_map ino_map; /* protected by lo->mutex */
>      struct lo_map dirp_map; /* protected by lo->mutex */
>      struct lo_map fd_map; /* protected by lo->mutex */
> @@ -257,8 +258,9 @@ static struct {
>  /* That we loaded cap-ng in the current thread from the saved */
>  static __thread bool cap_loaded = 0;
>  
> -static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
> -                                uint64_t mnt_id);
> +static struct lo_inode *lo_find(struct lo_data *lo,
> +                                const struct lo_fhandle *fhandle,
> +                                struct stat *st, uint64_t mnt_id);
>  static int xattr_map_client(const struct lo_data *lo, const char *client_name,
>                              char **out_name);
>  
> @@ -1032,18 +1034,39 @@ out_err:
>      fuse_reply_err(req, saverr);
>  }
>  
> -static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
> -                                uint64_t mnt_id)
> +static struct lo_inode *lo_find(struct lo_data *lo,
> +                                const struct lo_fhandle *fhandle,
> +                                struct stat *st, uint64_t mnt_id)
>  {
> -    struct lo_inode *p;
> -    struct lo_key key = {
> +    struct lo_inode *p = NULL;
> +    struct lo_key ids_key = {
>          .ino = st->st_ino,
>          .dev = st->st_dev,
>          .mnt_id = mnt_id,
>      };
>  
>      pthread_mutex_lock(&lo->mutex);
> -    p = g_hash_table_lookup(lo->inodes, &key);
> +    if (fhandle) {
> +        p = g_hash_table_lookup(lo->inodes_by_handle, fhandle);
> +    }
> +    if (!p) {
> +        p = g_hash_table_lookup(lo->inodes_by_ids, &ids_key);
> +        /*
> +         * When we had to fall back to looking up an inode by its IDs,
> +         * ensure that we hit an entry that does not have a file
> +         * handle.  Entries with file handles must also have a handle
> +         * alt key, so if we have not found it by that handle alt key,
> +         * we must have found an entry with a mismatching handle; i.e.
> +         * an entry for a different file, even though it has the same
> +         * inode ID.
> +         * (This can happen when we look up a new file that has reused
> +         * the inode ID of some previously unlinked inode for which we
> +         * still have an lo_inode object.)
> +         */
> +        if (p && fhandle != NULL && p->fhandle != NULL) {
> +            p = NULL;
> +        }
> +    }
>      if (p) {
>          assert(p->nlookup > 0);
>          p->nlookup++;
> @@ -1183,7 +1206,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          e->attr_flags |= FUSE_ATTR_SUBMOUNT;
>      }
>  
> -    inode = lo_find(lo, &e->attr, mnt_id);
> +    inode = lo_find(lo, NULL, &e->attr, mnt_id);
>      if (inode) {
>          close(newfd);
>      } else {
> @@ -1213,7 +1236,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          }
>          pthread_mutex_lock(&lo->mutex);
>          inode->fuse_ino = lo_add_inode_mapping(req, inode);
> -        g_hash_table_insert(lo->inodes, &inode->key, inode);
> +        g_hash_table_insert(lo->inodes_by_ids, &inode->key, inode);
>          pthread_mutex_unlock(&lo->mutex);
>      }
>      e->ino = inode->fuse_ino;
> @@ -1525,7 +1548,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>          return NULL;
>      }
>  
> -    return lo_find(lo, &attr, mnt_id);
> +    return lo_find(lo, NULL, &attr, mnt_id);
>  }
>  
>  static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
> @@ -1688,7 +1711,7 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
>      inode->nlookup -= n;
>      if (!inode->nlookup) {
>          lo_map_remove(&lo->ino_map, inode->fuse_ino);
> -        g_hash_table_remove(lo->inodes, &inode->key);
> +        g_hash_table_remove(lo->inodes_by_ids, &inode->key);
>          if (lo->posix_lock) {
>              if (g_hash_table_size(inode->posix_locks)) {
>                  fuse_log(FUSE_LOG_WARNING, "Hash table is not empty\n");
> @@ -3388,7 +3411,7 @@ static void lo_destroy(void *userdata)
>          GHashTableIter iter;
>          gpointer key, value;
>  
> -        g_hash_table_iter_init(&iter, lo->inodes);
> +        g_hash_table_iter_init(&iter, lo->inodes_by_ids);
>          if (!g_hash_table_iter_next(&iter, &key, &value)) {
>              break;
>          }
> @@ -3931,10 +3954,34 @@ static gboolean lo_key_equal(gconstpointer a, gconstpointer b)
>      return la->ino == lb->ino && la->dev == lb->dev && la->mnt_id == lb->mnt_id;
>  }
>  
> +static guint lo_fhandle_hash(gconstpointer key)
> +{
> +    const struct lo_fhandle *fh = key;
> +    guint hash;
> +    size_t i;
> +
> +    /* Basically g_str_hash() */
> +    hash = 5381;
> +    for (i = 0; i < sizeof(fh->padding); i++) {
> +        hash += hash * 33 + (unsigned char)fh->padding[i];
> +    }
> +    hash += hash * 33 + fh->mount_id;
> +
> +    return hash;
> +}
> +
> +static gboolean lo_fhandle_equal(gconstpointer a, gconstpointer b)
> +{
> +    return !memcmp(a, b, sizeof(struct lo_fhandle));
> +}
> +
>  static void fuse_lo_data_cleanup(struct lo_data *lo)
>  {
> -    if (lo->inodes) {
> -        g_hash_table_destroy(lo->inodes);
> +    if (lo->inodes_by_ids) {
> +        g_hash_table_destroy(lo->inodes_by_ids);
> +    }
> +    if (lo->inodes_by_ids) {
> +        g_hash_table_destroy(lo->inodes_by_handle);
>      }
>  
>      if (lo->root.posix_locks) {
> @@ -3990,7 +4037,8 @@ int main(int argc, char *argv[])
>      qemu_init_exec_dir(argv[0]);
>  
>      pthread_mutex_init(&lo.mutex, NULL);
> -    lo.inodes = g_hash_table_new(lo_key_hash, lo_key_equal);
> +    lo.inodes_by_ids = g_hash_table_new(lo_key_hash, lo_key_equal);
> +    lo.inodes_by_handle = g_hash_table_new(lo_fhandle_hash, lo_fhandle_equal);
>      lo.root.fd = -1;
>      lo.root.fuse_ino = FUSE_ROOT_ID;
>      lo.cache = CACHE_AUTO;
> -- 
> 2.31.1
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
> 


