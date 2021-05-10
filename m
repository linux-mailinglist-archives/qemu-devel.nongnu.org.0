Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D33797AD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:25:11 +0200 (CEST)
Received: from localhost ([::1]:35576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBWg-00059G-ST
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lgBQb-0005mC-3v
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lgBQY-0001hH-FK
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620674324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OqHx7QNfZgQq+glDZloCB/6LoS6ZDMpVlsbqx7XT9A8=;
 b=ZoWhl5IhgCseb+Xxoi+kMN20oChr4aylZPyrl8BLRWxK5fC3w6axMid7NurndVOHtLG4tK
 Qw8rf19J+oSjkOFchDKm9WB/I3GhlWEiEN7+cxkGCzQo6pEIFJ/BycOvvrDrJ/IrcVXMZr
 ia+yRa6iFNoitFI8dJ+xdbvQiD11yx8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-QvpTLWbPPbWMmuCC-j6lUg-1; Mon, 10 May 2021 15:18:42 -0400
X-MC-Unique: QvpTLWbPPbWMmuCC-j6lUg-1
Received: by mail-qk1-f199.google.com with SMTP id
 g2-20020a37b6020000b02902ea40e87ecbso12421068qkf.14
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OqHx7QNfZgQq+glDZloCB/6LoS6ZDMpVlsbqx7XT9A8=;
 b=aXUWY5YXnIdDrv5fwsgd5vfUOkyi5p6Z88R3/6jxSow+YTl+/LNZ/aE35exMV8SE+I
 klkVMdEce9N50J3KM87QBMp+wB6Fwxq2VMw0oJQTj99qQEDRxGw1ggmrQfteX06WbEW0
 OBTQP+gD2UfN+XPHRlCI7+SsvFCXPu3l2B/OgKiiWa6tFLFDLs1DfET1xUxbutTmi4/P
 vsCZMs2208mpSL6xfSHU1egoQQnJDQmxquQrvgOMsE2KKHpSgW+4Scz2I9HhhUlPQk89
 KsWGT/OUM11VwUhlT8EiteCkDNkOS3YB2LMj40n2cL4KZkLwC4jRTlEEi8taVrvJhE13
 Cslg==
X-Gm-Message-State: AOAM531hj2cO5xzqiZD5kXROyTgJH2fpb52JeMaz8Sk/0GgUBWrpjMXo
 4fvKTgRJ2aH+VEiOHZqVJCxGJpzEA5wzRe+tkSytgeLIOJQ0uB2Suj0HY5xuR4i1Zdf8wZp7XUH
 4uaCLP/6vcbqA8+o=
X-Received: by 2002:ad4:4f82:: with SMTP id em2mr25335542qvb.55.1620674322287; 
 Mon, 10 May 2021 12:18:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVz1bqoOWu86zxvzJeSlZBmsEnC8/uv7KpmOFauaisWiEyNKeov7fVUZw2U8Gf6xpQWGa3HA==
X-Received: by 2002:ad4:4f82:: with SMTP id em2mr25335519qvb.55.1620674322025; 
 Mon, 10 May 2021 12:18:42 -0700 (PDT)
Received: from horse (pool-173-76-174-238.bstnma.fios.verizon.net.
 [173.76.174.238])
 by smtp.gmail.com with ESMTPSA id z4sm12146288qtv.7.2021.05.10.12.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:18:41 -0700 (PDT)
Date: Mon, 10 May 2021 15:18:39 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [for-6.1 v3 2/3] virtiofsd: Track mounts
Message-ID: <20210510191839.GB193692@horse>
References: <20210510155539.998747-1-groug@kaod.org>
 <20210510155539.998747-3-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210510155539.998747-3-groug@kaod.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 05:55:38PM +0200, Greg Kurz wrote:
> The upcoming implementation of ->sync_fs() needs to know about all
> submounts in order to call syncfs() on all of them.
> 
> Track every inode that comes up with a new mount id in a GHashTable.
> If the mount id isn't available, e.g. no statx() on the host, fallback
> on the device id for the key. This is done during lookup because we
> only care for the submounts that the client knows about. The inode
> is removed from the hash table when ultimately unreferenced. This
> can happen on a per-mount basis when the client posts a FUSE_FORGET
> request or for all submounts at once with FUSE_DESTROY.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  tools/virtiofsd/passthrough_ll.c | 42 +++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 1553d2ef454f..dc940a1d048b 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -117,6 +117,7 @@ struct lo_inode {
>      GHashTable *posix_locks; /* protected by lo_inode->plock_mutex */
>  
>      mode_t filetype;
> +    bool is_mnt;
>  };
>  
>  struct lo_cred {
> @@ -163,6 +164,7 @@ struct lo_data {
>      bool use_statx;
>      struct lo_inode root;
>      GHashTable *inodes; /* protected by lo->mutex */
> +    GHashTable *mnt_inodes; /* protected by lo->mutex */
>      struct lo_map ino_map; /* protected by lo->mutex */
>      struct lo_map dirp_map; /* protected by lo->mutex */
>      struct lo_map fd_map; /* protected by lo->mutex */
> @@ -968,6 +970,31 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
>      return 0;
>  }
>  
> +static uint64_t mnt_inode_key(struct lo_inode *inode)
> +{
> +    /* Prefer mnt_id, fallback on dev */
> +    return inode->key.mnt_id ? inode->key.mnt_id : inode->key.dev;
> +}
> +
> +static void add_mnt_inode(struct lo_data *lo, struct lo_inode *inode)
> +{
> +    uint64_t mnt_key = mnt_inode_key(inode);
> +
> +    if (!g_hash_table_contains(lo->mnt_inodes, &mnt_key)) {
> +        inode->is_mnt = true;
> +        g_hash_table_insert(lo->mnt_inodes, &mnt_key, inode);
> +    }
> +}
> +
> +static void remove_mnt_inode(struct lo_data *lo, struct lo_inode *inode)
> +{
> +    uint64_t mnt_key = mnt_inode_key(inode);
> +
> +    if (inode->is_mnt) {
> +        g_hash_table_remove(lo->mnt_inodes, &mnt_key);
> +    }

What if same filesystem is mounted at two different mount points. Say at
foo/ and bar/. Now when we lookup foo, we will add that inode to 
hash table. But when we lookup bar, we will not add it. Now say foo
is unmounted, and inode is going away, then we will remove super block
of fs from hash table (while it is still mounted at bar/ ?). Do I
understand it right?

If yes, we probably will need another refcounted object to keep track
of all the instances of the same fs?

Thanks
Vivek


> +}
> +

>  /*
>   * Increments nlookup on the inode on success. unref_inode_lolocked() must be
>   * called eventually to decrement nlookup again. If inodep is non-NULL, the
> @@ -1054,10 +1081,14 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>          pthread_mutex_lock(&lo->mutex);
>          inode->fuse_ino = lo_add_inode_mapping(req, inode);
>          g_hash_table_insert(lo->inodes, &inode->key, inode);
> +        add_mnt_inode(lo, inode);
>          pthread_mutex_unlock(&lo->mutex);
>      }
>      e->ino = inode->fuse_ino;
>  
> +    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli%s\n", (unsigned long long)parent,
> +             name, (unsigned long long)e->ino, inode->is_mnt ? " (mount)" : "");
> +
>      /* Transfer ownership of inode pointer to caller or drop it */
>      if (inodep) {
>          *inodep = inode;
> @@ -1067,9 +1098,6 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>  
>      lo_inode_put(lo, &dir);
>  
> -    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)parent,
> -             name, (unsigned long long)e->ino);
> -
>      return 0;
>  
>  out_err:
> @@ -1479,6 +1507,7 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
>              g_hash_table_destroy(inode->posix_locks);
>              pthread_mutex_destroy(&inode->plock_mutex);
>          }
> +        remove_mnt_inode(lo, inode);
>          /* Drop our refcount from lo_do_lookup() */
>          lo_inode_put(lo, &inode);
>      }
> @@ -3129,6 +3158,7 @@ static void lo_destroy(void *userdata)
>      struct lo_data *lo = (struct lo_data *)userdata;
>  
>      pthread_mutex_lock(&lo->mutex);
> +    g_hash_table_remove_all(lo->mnt_inodes);
>      while (true) {
>          GHashTableIter iter;
>          gpointer key, value;
> @@ -3659,6 +3689,7 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
>          root->posix_locks = g_hash_table_new_full(
>              g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
>      }
> +    add_mnt_inode(lo, root);
>  }
>  
>  static guint lo_key_hash(gconstpointer key)
> @@ -3678,6 +3709,10 @@ static gboolean lo_key_equal(gconstpointer a, gconstpointer b)
>  
>  static void fuse_lo_data_cleanup(struct lo_data *lo)
>  {
> +    if (lo->mnt_inodes) {
> +        g_hash_table_destroy(lo->mnt_inodes);
> +    }
> +
>      if (lo->inodes) {
>          g_hash_table_destroy(lo->inodes);
>      }
> @@ -3739,6 +3774,7 @@ int main(int argc, char *argv[])
>      lo.root.fd = -1;
>      lo.root.fuse_ino = FUSE_ROOT_ID;
>      lo.cache = CACHE_AUTO;
> +    lo.mnt_inodes = g_hash_table_new(g_int64_hash, g_int64_equal);
>  
>      /*
>       * Set up the ino map like this:
> -- 
> 2.26.3
> 


