Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F303049E153
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:41:50 +0100 (CET)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD39x-0005DR-Qo
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:41:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nD2hJ-0008JJ-LQ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:12:13 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:57484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nD2hH-0006LZ-A4
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:12:13 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-cLfrTQVNMmKiD170iiSckg-1; Thu, 27 Jan 2022 06:11:59 -0500
X-MC-Unique: cLfrTQVNMmKiD170iiSckg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4C5F101F001;
 Thu, 27 Jan 2022 11:11:58 +0000 (UTC)
Received: from bahia (unknown [10.39.192.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94A5473173;
 Thu, 27 Jan 2022 11:11:40 +0000 (UTC)
Date: Thu, 27 Jan 2022 12:11:39 +0100
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v4 1/2] virtiofsd: Track mounts
Message-ID: <20220127121139.61ca8360@bahia>
In-Reply-To: <YfHPbWRbWpZgLXVA@redhat.com>
References: <20220125141213.361930-1-groug@kaod.org>
 <20220125141213.361930-2-groug@kaod.org>
 <YfHPbWRbWpZgLXVA@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: virtio-fs@redhat.com,
 Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Jan 2022 17:47:09 -0500
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Tue, Jan 25, 2022 at 03:12:11PM +0100, Greg Kurz wrote:
> > The upcoming implementation of ->sync_fs() needs to know about all
> > submounts in order to call syncfs() on them when virtiofsd is started
> > without '-o announce_submounts'.
> >=20
> > Track every inode that comes up with a new mount id in a GHashTable.
> > If the mount id isn't available, e.g. no statx() on the host, fallback
> > on the device id for the key. This is done during lookup because we
> > only care for the submounts that the client knows about. The inode
> > is removed from the hash table when ultimately unreferenced. This
> > can happen on a per-mount basis when the client posts a FUSE_FORGET
> > request or for all submounts at once with FUSE_DESTROY.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 43 +++++++++++++++++++++++++++++---
> >  1 file changed, 40 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthr=
ough_ll.c
> > index 64b5b4fbb186..7bf31fc129c8 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -117,6 +117,7 @@ struct lo_inode {
> >      GHashTable *posix_locks; /* protected by lo_inode->plock_mutex */
> > =20
> >      mode_t filetype;
> > +    bool is_mnt;
> >  };
> > =20
> >  struct lo_cred {
> > @@ -164,6 +165,7 @@ struct lo_data {
> >      bool use_statx;
> >      struct lo_inode root;
> >      GHashTable *inodes; /* protected by lo->mutex */
> > +    GHashTable *mnt_inodes; /* protected by lo->mutex */
> >      struct lo_map ino_map; /* protected by lo->mutex */
> >      struct lo_map dirp_map; /* protected by lo->mutex */
> >      struct lo_map fd_map; /* protected by lo->mutex */
> > @@ -1000,6 +1002,31 @@ static int do_statx(struct lo_data *lo, int dirf=
d, const char *pathname,
> >      return 0;
> >  }
> > =20
>=20
> Hi Greg,
>=20
> Thanks for the patches. Had a quick look. Overall these patches look
> pretty good to me. I will spend more time testing and having a=20
> closer look. Some quick thoughts below.
>=20
> > +static uint64_t mnt_inode_key(struct lo_inode *inode)
> > +{
> > +    /* Prefer mnt_id, fallback on dev */
> > +    return inode->key.mnt_id ? inode->key.mnt_id : inode->key.dev;
> > +}
>=20
> I am not sure if we should use inode->key.dev. This might create problem
> if same file system is bind mounted at two paths in shared dir. So
> say /dev/sdb is mounted at foo1/ and then bind mounted at foo2/ in
> shared dir. A user looks up foo1/ and does some writes. Then we
> lookup foo2/ and release that inode. Release of foo2 will let go
> inode from the hash. And that means if later another write happens
> in foo1/ followed by syncfs(), we will not issue syncfs() on filesystem
> backed by /dev/sdb.
>=20

Right, inode->key.dev isn't a safe fallback, which is the whole=20
point behind the need for mnt_id :-)

> So what are the options.
>=20
> A. Make mnt_id mandatory and do not implement it if mnt_id is not
>    available.
>=20

This is still quite recent (kernel 5.7 and glibc 2.33), it would
be unfortunate for users of older versions.

> B. Don't do anything and live with this. It is a corner case and
>    still better than not implement submount syncfs at all.
>=20

Having bind mounts isn't such a corner case, is it ? And anyway,
this would be a serious flaw in the implementation. I don't think
this is acceptable.

> C. Instead of adding lo_inode to hash, create another kind of object
>    and reference count that. It could be a mount fd which we open
>    when we add object for the first time. So when foo1/ inode is
>    instantiated, create mountfd object, add it to hash table using
>    device id as the key. When foo2 comes along, we find the object
>    in the hash and just bump up the ref. Now this mountfd object
>    will go away when both foo1 and foo2 inodes have been evicted
>    and will take care of the issue I am referring to.
>=20
> I guess B is little extra complexity but probably not too bad.

s/B/C

> WDYT. It sounds litter better than option A and B.
>=20

Definitely. I'll give a try.

>=20
> > +
> > +static void add_mnt_inode(struct lo_data *lo, struct lo_inode *inode)
> > +{
> > +    uint64_t mnt_key =3D mnt_inode_key(inode);
> > +
> > +    if (!g_hash_table_contains(lo->mnt_inodes, &mnt_key)) {
> > +        inode->is_mnt =3D true;
> > +        g_hash_table_insert(lo->mnt_inodes, &mnt_key, inode);
> > +    }
> > +}
> > +
> > +static void remove_mnt_inode(struct lo_data *lo, struct lo_inode *inod=
e)
> > +{
> > +    uint64_t mnt_key =3D mnt_inode_key(inode);
> > +
> > +    if (inode->is_mnt) {
> > +        g_hash_table_remove(lo->mnt_inodes, &mnt_key);
> > +    }
> > +}
>=20
> Should we issue syncfs() on this inode when we are removing it? It
> is possible guest did some writes, let go inode and later issued
> a syncfs(). By that time inode is gone and we will not issue any
> syncfs() on this filesystem. Hence leaving data in host page cache.
>=20

Right, I guess we can do that.


Cheers,

--
Greg

> Thanks
> Vivek
>=20
> > +
> >  /*
> >   * Increments nlookup on the inode on success. unref_inode_lolocked() =
must be
> >   * called eventually to decrement nlookup again. If inodep is non-NULL=
, the
> > @@ -1086,10 +1113,15 @@ static int lo_do_lookup(fuse_req_t req, fuse_in=
o_t parent, const char *name,
> >          pthread_mutex_lock(&lo->mutex);
> >          inode->fuse_ino =3D lo_add_inode_mapping(req, inode);
> >          g_hash_table_insert(lo->inodes, &inode->key, inode);
> > +        add_mnt_inode(lo, inode);
> >          pthread_mutex_unlock(&lo->mutex);
> >      }
> >      e->ino =3D inode->fuse_ino;
> > =20
> > +    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli%s\n",
> > +             (unsigned long long) parent, name, (unsigned long long) e=
->ino,
> > +             inode->is_mnt ? " (submount)" : "");
> > +
> >      /* Transfer ownership of inode pointer to caller or drop it */
> >      if (inodep) {
> >          *inodep =3D inode;
> > @@ -1099,9 +1131,6 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_=
t parent, const char *name,
> > =20
> >      lo_inode_put(lo, &dir);
> > =20
> > -    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long lon=
g)parent,
> > -             name, (unsigned long long)e->ino);
> > -
> >      return 0;
> > =20
> >  out_err:
> > @@ -1563,6 +1592,7 @@ static void unref_inode(struct lo_data *lo, struc=
t lo_inode *inode, uint64_t n)
> >              g_hash_table_destroy(inode->posix_locks);
> >              pthread_mutex_destroy(&inode->plock_mutex);
> >          }
> > +        remove_mnt_inode(lo, inode);
> >          /* Drop our refcount from lo_do_lookup() */
> >          lo_inode_put(lo, &inode);
> >      }
> > @@ -3337,6 +3367,7 @@ static void lo_destroy(void *userdata)
> >      struct lo_data *lo =3D (struct lo_data *)userdata;
> > =20
> >      pthread_mutex_lock(&lo->mutex);
> > +    g_hash_table_remove_all(lo->mnt_inodes);
> >      while (true) {
> >          GHashTableIter iter;
> >          gpointer key, value;
> > @@ -3850,6 +3881,7 @@ static void setup_root(struct lo_data *lo, struct=
 lo_inode *root)
> >          root->posix_locks =3D g_hash_table_new_full(
> >              g_direct_hash, g_direct_equal, NULL, posix_locks_value_des=
troy);
> >      }
> > +    add_mnt_inode(lo, root);
> >  }
> > =20
> >  static guint lo_key_hash(gconstpointer key)
> > @@ -3869,6 +3901,10 @@ static gboolean lo_key_equal(gconstpointer a, gc=
onstpointer b)
> > =20
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
> >      lo.root.fd =3D -1;
> >      lo.root.fuse_ino =3D FUSE_ROOT_ID;
> >      lo.cache =3D CACHE_AUTO;
> > +    lo.mnt_inodes =3D g_hash_table_new(g_int64_hash, g_int64_equal);
> > =20
> >      /*
> >       * Set up the ino map like this:
> > --=20
> > 2.34.1
> >=20
>=20


