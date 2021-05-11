Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986B437A453
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:09:40 +0200 (CEST)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPKd-0002QJ-Nt
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lgPIN-0007t6-Um
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:07:19 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:51027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lgPIM-0007RO-0h
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:07:19 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-2FsjIJRtO-mChO6UtihqnQ-1; Tue, 11 May 2021 06:07:10 -0400
X-MC-Unique: 2FsjIJRtO-mChO6UtihqnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFE80801B15;
 Tue, 11 May 2021 10:07:09 +0000 (UTC)
Received: from bahia.lan (ovpn-112-143.ams2.redhat.com [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC9BD7013B;
 Tue, 11 May 2021 10:06:56 +0000 (UTC)
Date: Tue, 11 May 2021 12:06:55 +0200
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [for-6.1 v3 2/3] virtiofsd: Track mounts
Message-ID: <20210511120655.379c99fb@bahia.lan>
In-Reply-To: <20210510191839.GB193692@horse>
References: <20210510155539.998747-1-groug@kaod.org>
 <20210510155539.998747-3-groug@kaod.org>
 <20210510191839.GB193692@horse>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Mon, 10 May 2021 15:18:39 -0400
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Mon, May 10, 2021 at 05:55:38PM +0200, Greg Kurz wrote:
> > The upcoming implementation of ->sync_fs() needs to know about all
> > submounts in order to call syncfs() on all of them.
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
> >  tools/virtiofsd/passthrough_ll.c | 42 +++++++++++++++++++++++++++++---
> >  1 file changed, 39 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthr=
ough_ll.c
> > index 1553d2ef454f..dc940a1d048b 100644
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
> > @@ -163,6 +164,7 @@ struct lo_data {
> >      bool use_statx;
> >      struct lo_inode root;
> >      GHashTable *inodes; /* protected by lo->mutex */
> > +    GHashTable *mnt_inodes; /* protected by lo->mutex */
> >      struct lo_map ino_map; /* protected by lo->mutex */
> >      struct lo_map dirp_map; /* protected by lo->mutex */
> >      struct lo_map fd_map; /* protected by lo->mutex */
> > @@ -968,6 +970,31 @@ static int do_statx(struct lo_data *lo, int dirfd,=
 const char *pathname,
> >      return 0;
> >  }
> > =20
> > +static uint64_t mnt_inode_key(struct lo_inode *inode)
> > +{
> > +    /* Prefer mnt_id, fallback on dev */
> > +    return inode->key.mnt_id ? inode->key.mnt_id : inode->key.dev;
> > +}
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
>=20
> What if same filesystem is mounted at two different mount points. Say at
> foo/ and bar/. Now when we lookup foo, we will add that inode to=20

e.g.

mount --bind /var/tmp ${virtiofs_path}/foo
mount --bind /var/tmp ${virtiofs_path}/bar

?

> hash table. But when we lookup bar, we will not add it. Now say foo
> is unmounted, and inode is going away, then we will remove super block
> of fs from hash table (while it is still mounted at bar/ ?). Do I
> understand it right?

If the host provides mount ids in statx(), each of these has a different
mnt_id and is thus considered as a distinct super block.

On a host with an older kernel, the fallback on dev_t would cause them
to be considered the same indeed. But in this case, foo and bar are
already confounded in the inode list, i.e. we can't have one removed
and the other one still around AFAICT.

If virtiofsd still has an inode for foo, it cannot be unmounted in the
host. The client needs to forget the inode first, in which case it
seems we don't care anymore for foo's super block.

>=20
> If yes, we probably will need another refcounted object to keep track
> of all the instances of the same fs?
>=20

I wanted to do that at first but it seemed unnecessary in the end,
because I couldn't come up with a scenario where we could evict
a super block while some inode under it is still referenced by the
client.

Anyway, I need to respin the patch because I misused the glib
hash table API, i.e. use g_int64_*() functions on unallocated
keys while I should use g_direct_*() to do this optimization.
This has the effect of never removing super blocks and ending
with stale inode pointers in the hash. This is what caused
the EBADF error with syncfs() you reported on irc.

> Thanks
> Vivek
>=20

Cheers,

--
Greg

>=20
> > +}
> > +
>=20
> >  /*
> >   * Increments nlookup on the inode on success. unref_inode_lolocked() =
must be
> >   * called eventually to decrement nlookup again. If inodep is non-NULL=
, the
> > @@ -1054,10 +1081,14 @@ static int lo_do_lookup(fuse_req_t req, fuse_in=
o_t parent, const char *name,
> >          pthread_mutex_lock(&lo->mutex);
> >          inode->fuse_ino =3D lo_add_inode_mapping(req, inode);
> >          g_hash_table_insert(lo->inodes, &inode->key, inode);
> > +        add_mnt_inode(lo, inode);
> >          pthread_mutex_unlock(&lo->mutex);
> >      }
> >      e->ino =3D inode->fuse_ino;
> > =20
> > +    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli%s\n", (unsigned long l=
ong)parent,
> > +             name, (unsigned long long)e->ino, inode->is_mnt ? " (moun=
t)" : "");
> > +
> >      /* Transfer ownership of inode pointer to caller or drop it */
> >      if (inodep) {
> >          *inodep =3D inode;
> > @@ -1067,9 +1098,6 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_=
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
> > @@ -1479,6 +1507,7 @@ static void unref_inode(struct lo_data *lo, struc=
t lo_inode *inode, uint64_t n)
> >              g_hash_table_destroy(inode->posix_locks);
> >              pthread_mutex_destroy(&inode->plock_mutex);
> >          }
> > +        remove_mnt_inode(lo, inode);
> >          /* Drop our refcount from lo_do_lookup() */
> >          lo_inode_put(lo, &inode);
> >      }
> > @@ -3129,6 +3158,7 @@ static void lo_destroy(void *userdata)
> >      struct lo_data *lo =3D (struct lo_data *)userdata;
> > =20
> >      pthread_mutex_lock(&lo->mutex);
> > +    g_hash_table_remove_all(lo->mnt_inodes);
> >      while (true) {
> >          GHashTableIter iter;
> >          gpointer key, value;
> > @@ -3659,6 +3689,7 @@ static void setup_root(struct lo_data *lo, struct=
 lo_inode *root)
> >          root->posix_locks =3D g_hash_table_new_full(
> >              g_direct_hash, g_direct_equal, NULL, posix_locks_value_des=
troy);
> >      }
> > +    add_mnt_inode(lo, root);
> >  }
> > =20
> >  static guint lo_key_hash(gconstpointer key)
> > @@ -3678,6 +3709,10 @@ static gboolean lo_key_equal(gconstpointer a, gc=
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
> > @@ -3739,6 +3774,7 @@ int main(int argc, char *argv[])
> >      lo.root.fd =3D -1;
> >      lo.root.fuse_ino =3D FUSE_ROOT_ID;
> >      lo.cache =3D CACHE_AUTO;
> > +    lo.mnt_inodes =3D g_hash_table_new(g_int64_hash, g_int64_equal);
> > =20
> >      /*
> >       * Set up the ino map like this:
> > --=20
> > 2.26.3
> >=20
>=20


