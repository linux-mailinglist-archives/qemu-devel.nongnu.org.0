Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6A49D5E4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 00:05:19 +0100 (CET)
Received: from localhost ([::1]:49864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCrLp-0000ha-H7
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 18:05:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nCrJd-0008Rz-O1
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 18:03:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nCrJa-0004VM-KT
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 18:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643238177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Mw8+nl1/up9McnRmRX+N5a96Nlw0roLqDvlVxkrhb8=;
 b=LqIuwbrfKrpq+0F+N3GZdfqNKzmOEUhl2iBWfLobnSTXlTPDCyYDzMVpRUJ0kR7xGM5w5h
 hMgWzTw2k1ZzwGg9mtnti9zy9nlkqeZqmuY4bUwdrz1iGh/iZVRsqv8qLTFsbR+QTlV1TC
 xyo1bw85oEMDCX0/XVLhIxo2xRaKap8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-o6kaWntyMdmVeGy6EuO2Ug-1; Wed, 26 Jan 2022 18:02:53 -0500
X-MC-Unique: o6kaWntyMdmVeGy6EuO2Ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3245181424C;
 Wed, 26 Jan 2022 23:02:52 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52F96104F6;
 Wed, 26 Jan 2022 23:02:47 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id CBC77223DA6; Wed, 26 Jan 2022 18:02:46 -0500 (EST)
Date: Wed, 26 Jan 2022 18:02:46 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH v4 1/2] virtiofsd: Track mounts
Message-ID: <YfHTFmQpM8hEU/I/@redhat.com>
References: <20220125141213.361930-1-groug@kaod.org>
 <20220125141213.361930-2-groug@kaod.org>
 <YfHPbWRbWpZgLXVA@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YfHPbWRbWpZgLXVA@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Wed, Jan 26, 2022 at 05:47:09PM -0500, Vivek Goyal wrote:
> On Tue, Jan 25, 2022 at 03:12:11PM +0100, Greg Kurz wrote:
> > The upcoming implementation of ->sync_fs() needs to know about all
> > submounts in order to call syncfs() on them when virtiofsd is started
> > without '-o announce_submounts'.
> > 
> > Track every inode that comes up with a new mount id in a GHashTable.
> > If the mount id isn't available, e.g. no statx() on the host, fallback
> > on the device id for the key. This is done during lookup because we
> > only care for the submounts that the client knows about. The inode
> > is removed from the hash table when ultimately unreferenced. This
> > can happen on a per-mount basis when the client posts a FUSE_FORGET
> > request or for all submounts at once with FUSE_DESTROY.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 43 +++++++++++++++++++++++++++++---
> >  1 file changed, 40 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index 64b5b4fbb186..7bf31fc129c8 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -117,6 +117,7 @@ struct lo_inode {
> >      GHashTable *posix_locks; /* protected by lo_inode->plock_mutex */
> >  
> >      mode_t filetype;
> > +    bool is_mnt;
> >  };
> >  
> >  struct lo_cred {
> > @@ -164,6 +165,7 @@ struct lo_data {
> >      bool use_statx;
> >      struct lo_inode root;
> >      GHashTable *inodes; /* protected by lo->mutex */
> > +    GHashTable *mnt_inodes; /* protected by lo->mutex */
> >      struct lo_map ino_map; /* protected by lo->mutex */
> >      struct lo_map dirp_map; /* protected by lo->mutex */
> >      struct lo_map fd_map; /* protected by lo->mutex */
> > @@ -1000,6 +1002,31 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
> >      return 0;
> >  }
> >  
> 
> Hi Greg,
> 
> Thanks for the patches. Had a quick look. Overall these patches look
> pretty good to me. I will spend more time testing and having a 
> closer look. Some quick thoughts below.
> 
> > +static uint64_t mnt_inode_key(struct lo_inode *inode)
> > +{
> > +    /* Prefer mnt_id, fallback on dev */
> > +    return inode->key.mnt_id ? inode->key.mnt_id : inode->key.dev;
> > +}
> 
> I am not sure if we should use inode->key.dev. This might create problem
> if same file system is bind mounted at two paths in shared dir. So
> say /dev/sdb is mounted at foo1/ and then bind mounted at foo2/ in
> shared dir. A user looks up foo1/ and does some writes. Then we
> lookup foo2/ and release that inode. Release of foo2 will let go
> inode from the hash. And that means if later another write happens
> in foo1/ followed by syncfs(), we will not issue syncfs() on filesystem
> backed by /dev/sdb.
> 
> So what are the options.
> 
> A. Make mnt_id mandatory and do not implement it if mnt_id is not
>    available.
> 
> B. Don't do anything and live with this. It is a corner case and
>    still better than not implement submount syncfs at all.
> 
> C. Instead of adding lo_inode to hash, create another kind of object
>    and reference count that. It could be a mount fd which we open
>    when we add object for the first time. So when foo1/ inode is
>    instantiated, create mountfd object, add it to hash table using
>    device id as the key. When foo2 comes along, we find the object
>    in the hash and just bump up the ref. Now this mountfd object
>    will go away when both foo1 and foo2 inodes have been evicted
>    and will take care of the issue I am referring to.

And we could take a ref on mountfd object only when we find an
inode whose parent's device id/mnt_id is different from us. That
way for every inode in the system we don't go through this exercise.
Just only those dir inodes which are a mount point.

Vivek

> 
> I guess B is little extra complexity but probably not too bad.
> WDYT. It sounds litter better than option A and B.
> 
> 
> > +
> > +static void add_mnt_inode(struct lo_data *lo, struct lo_inode *inode)
> > +{
> > +    uint64_t mnt_key = mnt_inode_key(inode);
> > +
> > +    if (!g_hash_table_contains(lo->mnt_inodes, &mnt_key)) {
> > +        inode->is_mnt = true;
> > +        g_hash_table_insert(lo->mnt_inodes, &mnt_key, inode);
> > +    }
> > +}
> > +
> > +static void remove_mnt_inode(struct lo_data *lo, struct lo_inode *inode)
> > +{
> > +    uint64_t mnt_key = mnt_inode_key(inode);
> > +
> > +    if (inode->is_mnt) {
> > +        g_hash_table_remove(lo->mnt_inodes, &mnt_key);
> > +    }
> > +}
> 
> Should we issue syncfs() on this inode when we are removing it? It
> is possible guest did some writes, let go inode and later issued
> a syncfs(). By that time inode is gone and we will not issue any
> syncfs() on this filesystem. Hence leaving data in host page cache.
> 
> Thanks
> Vivek
> 
> > +
> >  /*
> >   * Increments nlookup on the inode on success. unref_inode_lolocked() must be
> >   * called eventually to decrement nlookup again. If inodep is non-NULL, the
> > @@ -1086,10 +1113,15 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
> >          pthread_mutex_lock(&lo->mutex);
> >          inode->fuse_ino = lo_add_inode_mapping(req, inode);
> >          g_hash_table_insert(lo->inodes, &inode->key, inode);
> > +        add_mnt_inode(lo, inode);
> >          pthread_mutex_unlock(&lo->mutex);
> >      }
> >      e->ino = inode->fuse_ino;
> >  
> > +    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli%s\n",
> > +             (unsigned long long) parent, name, (unsigned long long) e->ino,
> > +             inode->is_mnt ? " (submount)" : "");
> > +
> >      /* Transfer ownership of inode pointer to caller or drop it */
> >      if (inodep) {
> >          *inodep = inode;
> > @@ -1099,9 +1131,6 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
> >  
> >      lo_inode_put(lo, &dir);
> >  
> > -    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)parent,
> > -             name, (unsigned long long)e->ino);
> > -
> >      return 0;
> >  
> >  out_err:
> > @@ -1563,6 +1592,7 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
> >              g_hash_table_destroy(inode->posix_locks);
> >              pthread_mutex_destroy(&inode->plock_mutex);
> >          }
> > +        remove_mnt_inode(lo, inode);
> >          /* Drop our refcount from lo_do_lookup() */
> >          lo_inode_put(lo, &inode);
> >      }
> > @@ -3337,6 +3367,7 @@ static void lo_destroy(void *userdata)
> >      struct lo_data *lo = (struct lo_data *)userdata;
> >  
> >      pthread_mutex_lock(&lo->mutex);
> > +    g_hash_table_remove_all(lo->mnt_inodes);
> >      while (true) {
> >          GHashTableIter iter;
> >          gpointer key, value;
> > @@ -3850,6 +3881,7 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
> >          root->posix_locks = g_hash_table_new_full(
> >              g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
> >      }
> > +    add_mnt_inode(lo, root);
> >  }
> >  
> >  static guint lo_key_hash(gconstpointer key)
> > @@ -3869,6 +3901,10 @@ static gboolean lo_key_equal(gconstpointer a, gconstpointer b)
> >  
> >  static void fuse_lo_data_cleanup(struct lo_data *lo)
> >  {
> > +    if (lo->mnt_inodes) {
> > +        g_hash_table_destroy(lo->mnt_inodes);
> > +    }
> > +
> >      if (lo->inodes) {
> >          g_hash_table_destroy(lo->inodes);
> >      }
> > @@ -3931,6 +3967,7 @@ int main(int argc, char *argv[])
> >      lo.root.fd = -1;
> >      lo.root.fuse_ino = FUSE_ROOT_ID;
> >      lo.cache = CACHE_AUTO;
> > +    lo.mnt_inodes = g_hash_table_new(g_int64_hash, g_int64_equal);
> >  
> >      /*
> >       * Set up the ino map like this:
> > -- 
> > 2.34.1
> > 
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
> 


