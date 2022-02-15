Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9DE4B6771
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:21:50 +0100 (CET)
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJu1t-0003Tc-5G
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:21:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJtye-0006B2-Fz
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:18:28 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:52152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJtyb-00061t-3v
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:18:27 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-FfpOKmIEOe6tqkdAjzgGbw-1; Tue, 15 Feb 2022 04:18:14 -0500
X-MC-Unique: FfpOKmIEOe6tqkdAjzgGbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A2C802926;
 Tue, 15 Feb 2022 09:18:14 +0000 (UTC)
Received: from bahia (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0003C5E48D;
 Tue, 15 Feb 2022 09:18:04 +0000 (UTC)
Date: Tue, 15 Feb 2022 10:18:03 +0100
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v5 3/3] virtiofsd: Add support for FUSE_SYNCFS request
 without announce_submounts
Message-ID: <20220215101803.14206a48@bahia>
In-Reply-To: <Ygqo+24vo1z7rSvk@redhat.com>
References: <20220214135820.43897-1-groug@kaod.org>
 <20220214135820.43897-4-groug@kaod.org>
 <YgqfCtcjhApw5Fyw@redhat.com> <YgqlyP5M7NF/bMoj@redhat.com>
 <Ygqo+24vo1z7rSvk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 14:09:47 -0500
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Mon, Feb 14, 2022 at 01:56:08PM -0500, Vivek Goyal wrote:
> > On Mon, Feb 14, 2022 at 01:27:22PM -0500, Vivek Goyal wrote:
> > > On Mon, Feb 14, 2022 at 02:58:20PM +0100, Greg Kurz wrote:
> > > > This adds the missing bits to support FUSE_SYNCFS in the case submo=
unts
> > > > aren't announced to the client.
> > > >=20
> > > > Iterate over all inodes and call syncfs() on the ones marked as sub=
mounts.
> > > > Since syncfs() can block for an indefinite time, we cannot call it =
with
> > > > lo->mutex held as it would prevent the server to process other requ=
ests.
> > > > This is thus broken down in two steps. First build a list of submou=
nts
> > > > with lo->mutex held, drop the mutex and finally process the list. A
> > > > reference is taken on the inodes to ensure they don't go away when
> > > > lo->mutex is dropped.
> > > >=20
> > > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > > ---
> > > >  tools/virtiofsd/passthrough_ll.c | 38 ++++++++++++++++++++++++++++=
++--
> > > >  1 file changed, 36 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/pas=
sthrough_ll.c
> > > > index e94c4e6f8635..7ce944bfe2a0 100644
> > > > --- a/tools/virtiofsd/passthrough_ll.c
> > > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > > @@ -3400,8 +3400,42 @@ static void lo_syncfs(fuse_req_t req, fuse_i=
no_t ino)
> > > >          err =3D lo_do_syncfs(lo, inode);
> > > >          lo_inode_put(lo, &inode);
> > > >      } else {
> > > > -        /* Requires the sever to track submounts. Not implemented =
yet */
> > > > -        err =3D ENOSYS;
> > > > +        g_autoptr(GSList) submount_list =3D NULL;
> > > > +        GSList *elem;
> > > > +        GHashTableIter iter;
> > > > +        gpointer key, value;
> > > > +
> > > > +        pthread_mutex_lock(&lo->mutex);
> > > > +
> > > > +        g_hash_table_iter_init(&iter, lo->inodes);
> > > > +        while (g_hash_table_iter_next(&iter, &key, &value)) {
> > >=20
> > > Going through all the inodes sounds very inefficient. If there are la=
rge
> > > number of inodes (say 1 million or more), and if frequent syncfs requ=
ests
> > > are coming this can consume lot of cpu cycles.
> > >=20
> > > Given C virtiofsd is slowly going away, so I don't want to be too
> > > particular about it. But, I would have thought to put submount
> > > inodes into another list or hash map (using mount id as key) and just
> > > traverse through that list instead. Given number of submounts should
> > > be small, it should be pretty quick to walk through that list.
> > >=20
> > > > +            struct lo_inode *inode =3D value;
> > > > +
> > > > +            if (inode->is_submount) {
> > > > +                g_atomic_int_inc(&inode->refcount);
> > > > +                submount_list =3D g_slist_prepend(submount_list, i=
node);
> > > > +            }
> > > > +        }
> > > > +
> > > > +        pthread_mutex_unlock(&lo->mutex);
> > > > +
> > > > +        /* The root inode is always present and not tracked in the=
 hash table */
> > > > +        err =3D lo_do_syncfs(lo, &lo->root);
> > > > +
> > > > +        for (elem =3D submount_list; elem; elem =3D g_slist_next(e=
lem)) {
> > > > +            struct lo_inode *inode =3D elem->data;
> > > > +            int r;
> > > > +
> > > > +            r =3D lo_do_syncfs(lo, inode);
> > > > +            if (r) {
> > > > +                /*
> > > > +                 * Try to sync as much as possible. Only one error=
 can be
> > > > +                 * reported to the client though, arbitrarily the =
last one.
> > > > +                 */
> > > > +                err =3D r;
> > > > +            }
> > > > +            lo_inode_put(lo, &inode);
> > > > +        }
> > >=20
> > > One more minor nit. What happens if virtiofsd is processing syncfs li=
st
> > > and then somebody hard reboots qemu and mounts virtiofs again. That
> > > will trigger FUSE_INIT and will call lo_destroy() first.
> > >=20
> > > fuse_lowlevel.c
> > >=20
> > > fuse_session_process_buf_int()
> > > {
> > >             fuse_log(FUSE_LOG_DEBUG, "%s: reinit\n", __func__);
> > >             se->got_destroy =3D 1;
> > >             se->got_init =3D 0;
> > >             if (se->op.destroy) {
> > >                 se->op.destroy(se->userdata);
> > >             }
> > > }
> > >=20
> > > IIUC, there is no synchronization with this path. If we are running w=
ith
> > > thread pool enabled, it could very well happen that one thread is sti=
ll
> > > doing syncfs while other thread is executing do_init(). That sounds
> > > like little bit of a problem. It will be good if there is a way
> > > to either abort syncfs() or do_destroy() waits for all the previous
> > > syncfs() to finish.
> > >=20
> > > Greg, if you like, you could break down this work in two patch series=
.
> > > First patch series just issues syncfs() on inode id sent with FUSE_SY=
NCFS.
> > > That's easy fix and can get merged now.
> >=20
> > Actually I think even single "syncfs" will have synchronization issue
> > with do_init() upon hard reboot if we drop lo->mutex during syncfs().
>=20
> Actually, we have similar issues with ->fsync(). We take lo->mutex,
> and then take a reference on inode. Call fsync() on this. Now it is
> possible that guest hard reboots, triggers, FUSE_INIT and lo_destroy()
> is called. It will take lo->mutex and drop its referene on inode.
>=20
> So it looks like in extreme case a new connection can start looking
> up inodes which we still have old inodes in hash table because
> some thread is blocked doing operation and has not dropped its
> reference.
>=20
> David, do I understand it right?
>=20
> We probably need to have a notion of keeping track of number of requests
> which are in progress. And lo_destroy() should wait till number of
> requests in progress come to zero. This will be equivalent of draining
> the queues operation in virtiofs kernel driver.
>=20
> Anyway, given we already have the issue w.r.t lo_destroy(), and C code
> is going away, I will be fine even if you don't fix races with FUSE_INIT.
>=20
> Vivek

As you pointed out, this can affect other type of requests as well, so
this would probably deserve a more generic fix than just making it
work for syncfs(). This would most likely call for cycles that I don't
have. Thanks ! ;-)

BTW, does the rust implementation have the same flaw ?

> >=20
> > Vivek
> >=20
> > >=20
> > > And second patch series take care of above issues and will be little =
bit
> > > more work.
> > >=20
> > > Thanks
> > > Vivek
>=20


