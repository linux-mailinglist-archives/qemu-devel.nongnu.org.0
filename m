Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5EF3E5C8B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:08:59 +0200 (CEST)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSR8-0005gk-5u
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mDSPy-0003Yz-BK
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mDSPv-0001vX-NA
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628604463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bJFXDuacFbN5RaAH3SHLwgxm2hZgjYIwPPzSKr9CN4=;
 b=NBjPyBdR4R8uyGzL3Lq3D0fvZf9Ih6ArSGIKoZiUfswJDaeoHdYj54B8v1X6iQjMrUIpZr
 J+QbUQdk12nTy6dSY3dwkKamKF/HI4xyDRRlkbDrzPDf9pLgv/IAyu8JZ192EiD7snHaBQ
 GA+jO885Vy+4EgtAIRguVG8ZWjvg9A8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-6Edez0hEOs2J_qh6_nnqIw-1; Tue, 10 Aug 2021 10:07:42 -0400
X-MC-Unique: 6Edez0hEOs2J_qh6_nnqIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 171B7185302D
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 14:07:41 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8845726DD8;
 Tue, 10 Aug 2021 14:07:30 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 229002237F5; Tue, 10 Aug 2021 10:07:30 -0400 (EDT)
Date: Tue, 10 Aug 2021 10:07:30 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 08/10] virtiofsd: Add inodes_by_handle hash table
Message-ID: <YRKIIpOQzXgl4Jax@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-9-mreitz@redhat.com>
 <YRFTWVC1vXwjky5v@redhat.com>
 <467c019d-42b9-1290-72f3-bd96bf44ddcf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <467c019d-42b9-1290-72f3-bd96bf44ddcf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 09, 2021 at 06:47:18PM +0200, Hanna Reitz wrote:
> On 09.08.21 18:10, Vivek Goyal wrote:
> > On Fri, Jul 30, 2021 at 05:01:32PM +0200, Max Reitz wrote:
> > > Currently, lo_inode.fhandle is always NULL and so always keep an O_PATH
> > > FD in lo_inode.fd.  Therefore, when the respective inode is unlinked,
> > > its inode ID will remain in use until we drop our lo_inode (and
> > > lo_inode_put() thus closes the FD).  Therefore, lo_find() can safely use
> > > the inode ID as an lo_inode key, because any inode with an inode ID we
> > > find in lo_data.inodes (on the same filesystem) must be the exact same
> > > file.
> > > 
> > > This will change when we start setting lo_inode.fhandle so we do not
> > > have to keep an O_PATH FD open.  Then, unlinking such an inode will
> > > immediately remove it, so its ID can then be reused by newly created
> > > files, even while the lo_inode object is still there[1].
> > > 
> > > So creating a new file can then reuse the old file's inode ID, and
> > > looking up the new file would lead to us finding the old file's
> > > lo_inode, which is not ideal.
> > > 
> > > Luckily, just as file handles cause this problem, they also solve it:  A
> > > file handle contains a generation ID, which changes when an inode ID is
> > > reused, so the new file can be distinguished from the old one.  So all
> > > we need to do is to add a second map besides lo_data.inodes that maps
> > > file handles to lo_inodes, namely lo_data.inodes_by_handle.  For
> > > clarity, lo_data.inodes is renamed to lo_data.inodes_by_ids.
> > > 
> > > Unfortunately, we cannot rely on being able to generate file handles
> > > every time.  Therefore, we still enter every lo_inode object into
> > > inodes_by_ids, but having an entry in inodes_by_handle is optional.  A
> > > potential inodes_by_handle entry then has precedence, the inodes_by_ids
> > > entry is just a fallback.
> > > 
> > > Note that we do not generate lo_fhandle objects yet, and so we also do
> > > not enter anything into the inodes_by_handle map yet.  Also, all lookups
> > > skip that map.  We might manually create file handles with some code
> > > that is immediately removed by the next patch again, but that would
> > > break the assumption in lo_find() that every lo_inode with a non-NULL
> > > .fhandle must have an entry in inodes_by_handle and vice versa.  So we
> > > leave actually using the inodes_by_handle map for the next patch.
> > > 
> > > [1] If some application in the guest still has the file open, there is
> > > going to be a corresponding FD mapping in lo_data.fd_map.  In such a
> > > case, the inode will only go away once every application in the guest
> > > has closed it.  The problem described only applies to cases where the
> > > guest does not have the file open, and it is just in the dentry cache,
> > > basically.
> > > 
> > > Signed-off-by: Max Reitz <mreitz@redhat.com>
> > > ---
> > >   tools/virtiofsd/passthrough_ll.c | 81 +++++++++++++++++++++++++-------
> > >   1 file changed, 65 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > index 487448d666..f9d8b2f134 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -180,7 +180,8 @@ struct lo_data {
> > >       int announce_submounts;
> > >       bool use_statx;
> > >       struct lo_inode root;
> > > -    GHashTable *inodes; /* protected by lo->mutex */
> > > +    GHashTable *inodes_by_ids; /* protected by lo->mutex */
> > > +    GHashTable *inodes_by_handle; /* protected by lo->mutex */
> > >       struct lo_map ino_map; /* protected by lo->mutex */
> > >       struct lo_map dirp_map; /* protected by lo->mutex */
> > >       struct lo_map fd_map; /* protected by lo->mutex */
> > > @@ -263,8 +264,9 @@ static struct {
> > >   /* That we loaded cap-ng in the current thread from the saved */
> > >   static __thread bool cap_loaded = 0;
> > > -static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
> > > -                                uint64_t mnt_id);
> > > +static struct lo_inode *lo_find(struct lo_data *lo,
> > > +                                const struct lo_fhandle *fhandle,
> > > +                                struct stat *st, uint64_t mnt_id);
> > >   static int xattr_map_client(const struct lo_data *lo, const char *client_name,
> > >                               char **out_name);
> > > @@ -1064,18 +1066,40 @@ out_err:
> > >       fuse_reply_err(req, saverr);
> > >   }
> > > -static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
> > > -                                uint64_t mnt_id)
> > > +static struct lo_inode *lo_find(struct lo_data *lo,
> > > +                                const struct lo_fhandle *fhandle,
> > > +                                struct stat *st, uint64_t mnt_id)
> > >   {
> > > -    struct lo_inode *p;
> > > -    struct lo_key key = {
> > > +    struct lo_inode *p = NULL;
> > > +    struct lo_key ids_key = {
> > >           .ino = st->st_ino,
> > >           .dev = st->st_dev,
> > >           .mnt_id = mnt_id,
> > >       };
> > >       pthread_mutex_lock(&lo->mutex);
> > > -    p = g_hash_table_lookup(lo->inodes, &key);
> > > +    if (fhandle) {
> > > +        p = g_hash_table_lookup(lo->inodes_by_handle, fhandle);
> > > +    }
> > > +    if (!p) {
> > > +        p = g_hash_table_lookup(lo->inodes_by_ids, &ids_key);
> > So even if fhandle is not NULL, we will still lookup the inode
> > object in lo->inodes_by_ids? I thought fallback was only required
> > if we could not generate file handle to begin with and in that case
> > fhandle will be NULL?
> 
> Well.  I think it depends again on when file handle generation can fail and
> when it cannot.  If we assume it can randomly fail at any time, then it’s
> possible we create an lo_inode with an O_PATH fd, but later we are able to
> generate a file handle for it.  So we first try a lookup by file handle
> here, which would fail, but we’d still have to try a lookup by IDs, so we
> can find the O_PATH lo_inode.
> 
> An example case would be if at first we weren’t able to open a mount fd
> (because this file is a device node and the first lo_inode looked up on its
> filesystem), and so we couldn’t generate a file handle that we would be sure
> would work; but later for the lookup we can generate a file handle (because
> some other node on that filesystem has been opened by then, so we have a
> mount fd).

Ok, got it. If we are assuming that file handle generation can fail
randomly, then what will happen in following scenario.

- lookup, file handle generated, inode added to both hash tables.

- another lookup, handle generation failed. We call lo_find(), it
  finds inode in lo->inodes_by_ids but rejects it because p->fd == -1.

- Now lo_find() will return NULL and caller will assume inode could
  not be found (despite the fact it is in there) and caller lo_do_lookup()
  will try to add new inode to hash tables. So we will have two inode
  instances in hash table with same st_dev, st_ino, mnt_id. One will
  have file handle while other will have O_PATH fd.

So we have two inodes in cache representing same file. One using file
handle while other using O_PATH fd. 

One side affect of this is says guest has looked up a file (and got
node id 1, fhandle based inode). And later guest is revalidating
that inode, this time it could get inode 2 (O_PATH fd). Guest will
think inode has changed and discard previous inode and trigger
another lookup. This typically happens only if file has gone away.
But now it will happen because we have two inodes in cache representing
same file.

There might be other cases where this is bad. I can't think of any
at this point of time.

If could solve the issue of mount_fd, then we have to use fallback
path probably only for EOPNOTSUPP case. And then we can be sure
that cache will always have one inode either fhandle based or
O_PATH based (and not both).

Vivek


