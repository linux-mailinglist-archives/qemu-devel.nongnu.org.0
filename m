Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E665E64CF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:12:11 +0200 (CEST)
Received: from localhost ([::1]:34380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMvy-00011b-Jv
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1obMCM-0003jx-RY; Thu, 22 Sep 2022 09:25:04 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:59419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1obMCJ-0007m8-M5; Thu, 22 Sep 2022 09:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=2ydtKsUcxkENSQGvfxMm2yqaEGziF4J27TdtjBVOThs=; b=xFk6QfbN56MjdSjjuEkBri2d0w
 lT4pKTO7gaHt9Q8D3i2MmMI10r3XLgLt5vqLm3QZm++3HVerwyBmzKnIUr+yFwejXU6pS7YqbuoiW
 cE2ukQzzqzNsXaoVENffRTHOw0Q/G/OSA0FqUmAyz8irSFq/g7Bkob+LphdVzdyH1UbDglWFYMsz4
 uWcjdWnlyUVSh3FDyrjKCjp2vE7HPdAje5owSWoYIEYeIJWlWxEg6w4191w1tlfGejCwqaAq7WNDu
 cNz/Eb0j/dJho6adRwkQ5GDTAGEY/QxcqDjfasfR4ptE5YUV2kUYLZHGyLpVdZ0hC6akLAc7skqqA
 MQ+fEe44XMc3WVFdeNIGNkS2/d7ebgfZhbxrE7aei1WdcFTVGMCjju/MHZg0tm3Lbktvw4sJnsrml
 f4jSl0t0Djyw5ZxQdj7YvCLmL2in3WJajmuXRrkHP5vbWlEvZzOi2Qb+PEv9CiUWTx7UnoHK/ULVr
 gbCTerALyrleT7yqfsLXDlRhEPoprt2CMCNUhYtzb/EwVWdk9526HvCuZ8kYpupTDWGroIxJCch4+
 iwlO+w7eZouqOlZgVtc9hOc0gHdtRBGT7POAaX6GcDXuu1NGLZXEKg72gRU9I1Xfi6FXaqrL5PI5l
 7P92KELKz11PhZmb4k93xyBiparD9k1SoEFfI4aNA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Qemu-block <qemu-block@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Daniel P =?ISO-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, Linus Heckemann <git@sphalerite.org>
Subject: Re: [PATCH v3] 9pfs: use GHashTable for fid table
Date: Thu, 22 Sep 2022 15:24:53 +0200
Message-ID: <18285609.CZGQWmveTA@silver>
In-Reply-To: <yga7d1vy6pv.fsf@localhost>
References: <20220908112353.289267-1-git@sphalerite.org>
 <1754509.KvSVDBIHpc@silver> <yga7d1vy6pv.fsf@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 22. September 2022 13:43:56 CEST Linus Heckemann wrote:
> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> > On Freitag, 9. September 2022 15:10:48 CEST Christian Schoenebeck wrote:
> >> On Donnerstag, 8. September 2022 13:23:53 CEST Linus Heckemann wrote:
> >> > The previous implementation would iterate over the fid table for
> >> > lookup operations, resulting in an operation with O(n) complexity on
> >> > the number of open files and poor cache locality -- for every open,
> >> > stat, read, write, etc operation.
> >> >=20
> >> > This change uses a hashtable for this instead, significantly improvi=
ng
> >> > the performance of the 9p filesystem. The runtime of NixOS's simple
> >> > installer test, which copies ~122k files totalling ~1.8GiB from 9p,
> >> > decreased by a factor of about 10.
> >> >=20
> >> > Signed-off-by: Linus Heckemann <git@sphalerite.org>
> >> > Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> >> > Reviewed-by: Greg Kurz <groug@kaod.org>
> >> > ---
> >>=20
> >> Queued on 9p.next:
> >> https://github.com/cschoenebeck/qemu/commits/9p.next
> >>=20
> >> I retained the BUG_ON() in get_fid(), Greg had a point there that
> >> continuing to work on a clunked fid would still be a bug.
> >>=20
> >> I also added the suggested TODO comment for
> >> g_hash_table_steal_extended(),
> >> the actual change would be outside the scope of this patch.
> >>=20
> >> And finally I gave this patch a whirl, and what can I say: that's just
> >> sick! Compiling sources with 9p is boosted by around factor 6..7 here!
> >> And running 9p as root fs also no longer feels sluggish as before. I
> >> mean I knew that this fid list traversal performance issue existed and
> >> had it on my TODO list, but the actual impact exceeded my expectation =
by
> >> far.>=20
> > Linus, there is still something cheesy. After more testing, at a certain
> > point>=20
> > running the VM, the terminal is spilled with this message:
> >   GLib: g_hash_table_iter_next: assertion 'ri->version =3D=3D
> >   ri->hash_table->version' failed>=20
> > Looking at the glib sources, I think this warning means the iterator got
> > invalidated. Setting a breakpoint at glib function
> > g_return_if_fail_warning I>=20
> > got:
> >   Thread 1 "qemu-system-x86" hit Breakpoint 1, 0x00007ffff7aa9d80 in
> >   g_return_if_fail_warning () from /lib/x86_64-linux-gnu/libglib-2.0.so=
=2E0
> >   (gdb) bt
> >   #0  0x00007ffff7aa9d80 in g_return_if_fail_warning () at
> >   /lib/x86_64-linux-gnu/libglib-2.0.so.0 #1  0x00007ffff7a8ea18 in
> >   g_hash_table_iter_next () at /lib/x86_64-linux-gnu/libglib-2.0.so.0 #=
2=20
> >   0x0000555555998a7a in v9fs_mark_fids_unreclaim (pdu=3D0x555557a34c90,
> >   path=3D0x7ffba8ceff30) at ../hw/9pfs/9p.c:528 #3  0x000055555599f7a0 =
in
> >   v9fs_unlinkat (opaque=3D0x555557a34c90) at ../hw/9pfs/9p.c:3170 #4=20
> >   0x000055555606dc4b in coroutine_trampoline (i0=3D1463900480, i1=3D218=
45) at
> >   ../util/coroutine-ucontext.c:177 #5  0x00007ffff7749d40 in
> >   __start_context () at /lib/x86_64-linux-gnu/libc.so.6 #6=20
> >   0x00007fffffffd5f0 in  ()
> >   #7  0x0000000000000000 in  ()
> >   (gdb)
> >=20
> > The while loop in v9fs_mark_fids_unreclaim() holds the hash table itera=
tor
> > while the hash table is modified during the loop.
> >=20
> > Would you please fix this? If you do, please use my already queued patch
> > version as basis.
> >=20
> > Best regards,
> > Christian Schoenebeck
>=20
> Hi Christian,
>=20
> Thanks for finding this!
>=20
> I think I understand the problem, but I can't reproduce it at all (I've
> been trying by hammering the filesystem with thousands of opens/closes
> across several processes). Do you have a reliable way?

I also didn't hit this issue in my initial tests. I do hit this after about=
=20
just a minute though when running 9p as root fs [1] and then starting to=20
compile KDE [2] inside the VM.

[1] https://wiki.qemu.org/Documentation/9p_root_fs
[2] https://community.kde.org/Get_Involved/development

Independent of reproduction, let me elaborate what's going on, as this issu=
e=20
is probably not that obvious:

1.) Like with any ordered container, the glib hash iterator becomes invalid=
 as=20
soon as the hash table got modified.

=46ortunately glib detects this case by maintaining a "version" field on th=
e=20
hash table which is bumped whenever the hash table was modified, and likewi=
se=20
a "version" field on the iterator structure and detecting an invalid iterat=
or=20
by comparing [3] the two "version" fields when calling=20
g_hash_table_iter_next() for instance:

  g_return_val_if_fail (ri->version =3D=3D ri->hash_table->version, FALSE);

and the g_return_val_if_fail() macro calls g_return_if_fail_warning() to pr=
int=20
the warning message in this case and then just immediately returns from=20
g_hash_table_iter_next().

So this is not nitpicking, it will actually start severe 9p server=20
misbehaviour at this point.

[3] https://github.com/GNOME/glib/blob/main/glib/ghash.c#L1182

2.) The hash table loop inside v9fs_mark_fids_unreclaim() does not directly=
=20
modify the "fids" hash table. But inside that loop we get contention, becau=
se=20
even though basically everything inside 9p.c is executed on QEMU main threa=
d=20
only, all the 9p filesystem driver calls are dispatched [4] to a worker thr=
ead=20
and then after fs driver task completion, dispatched back to main thread. A=
nd=20
specifically in v9fs_mark_fids_unreclaim() these are the two functions=20
put_fid() and v9fs_reopen_fid() that are endangered to this possibility (i.=
e.=20
those two may "yield" [4] the coroutine).

So what happens is, the coroutine is dispatched to the fs worker thread=20
(inside those two functions), in the meantime main thread picks & continues=
 to=20
run another coroutine (i.e. processes another active 9p request), and that =
in=20
turn might of course modify the 'fids' hash table, depending on what kind o=
f=20
9p request that is. Then main thread gets back to the original couroutine=20
inside 9fs_mark_fids_unreclaim(), and eventually continues the hash table l=
oop=20
there, and bam.

[4] https://wiki.qemu.org/Documentation/9p#Coroutines

=2D--

As for a solution: in contrast to the previous list based implementation, I=
=20
think we can't (or shouldn't) recover from an invalidated hash table iterat=
or,=20
even though we could detect this case by checking the return value of=20
g_hash_table_iter_next().

I think it would make sense instead to first collect the respective fids=20
inside that loop with a local container (e.g. a local list on the stack), a=
nd=20
then putting the fids subsequently in a separate loop below.

Does this make sense?

Best regards,
Christian Schoenebeck



