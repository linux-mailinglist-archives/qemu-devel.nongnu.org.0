Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB472A50
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 10:42:45 +0200 (CEST)
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqCrE-0000Ow-Oy
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 04:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1hqCr2-0008Q6-46
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 04:42:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1hqCr0-0000mt-Bf
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 04:42:32 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:3353)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1hqCqw-0000eJ-Dg; Wed, 24 Jul 2019 04:42:26 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 60D54432D1;
 Wed, 24 Jul 2019 10:42:15 +0200 (CEST)
Date: Wed, 24 Jul 2019 10:41:27 +0200
From: Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190724084127.7otnx3bwiyljk6mv@nora.maurer-it.com>
References: <20190709232550.10724-1-jsnow@redhat.com>
 <20190722121755.xpx2qni53e6pha7t@nora.maurer-it.com>
 <a88974cc-29dc-3e4d-12b4-b2ce2734612b@redhat.com>
 <20190723094702.glmdyjm6rgelcwte@nora.maurer-it.com>
 <787d6506-d4bb-0904-5e58-521d6fc8313a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <787d6506-d4bb-0904-5e58-521d6fc8313a@redhat.com>
User-Agent: NeoMutt/20180716
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.186.127.180
Subject: Re: [Qemu-devel] [PATCH v4 00/18] bitmaps: introduce 'bitmap' sync
 mode
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 23, 2019 at 12:58:10PM -0400, John Snow wrote:
>=20
>=20
> On 7/23/19 5:47 AM, Fabian Gr=FCnbichler wrote:
> > On Mon, Jul 22, 2019 at 01:21:02PM -0400, John Snow wrote:
> >>
> >>
> >> On 7/22/19 8:17 AM, Fabian Gr=FCnbichler wrote:
> >>> On Tue, Jul 09, 2019 at 07:25:32PM -0400, John Snow wrote:
> >>>> This series adds a new "BITMAP" sync mode that is meant to replace=
 the
> >>>> existing "INCREMENTAL" sync mode.
> >>>>
> >>>> This mode can have its behavior modified by issuing any of three b=
itmap sync
> >>>> modes, passed as arguments to the job.
> >>>>
> >>>> The three bitmap sync modes are:
> >>>> - ON-SUCCESS: This is an alias for the old incremental mode. The b=
itmap is
> >>>>               conditionally synchronized based on the return code =
of the job
> >>>>               upon completion.
> >>>> - NEVER: This is, effectively, the differential backup mode. It ne=
ver clears
> >>>>          the bitmap, as the name suggests.
> >>>> - ALWAYS: Here is the new, exciting thing. The bitmap is always sy=
nchronized,
> >>>>           even on failure. On success, this is identical to increm=
ental, but
> >>>>           on failure it clears only the bits that were copied succ=
essfully.
> >>>>           This can be used to "resume" incremental backups from la=
ter points
> >>>>           in times.
> >>>>
> >>>> I wrote this series by accident on my way to implement incremental=
 mode
> >>>> for mirror, but this happened first -- the problem is that Mirror =
mode
> >>>> uses its existing modes in a very particular way; and this was the=
 best
> >>>> way to add bitmap support into the mirror job properly.
> >>>>
> >>>> [...]
> >>>>
> >>>> Future work:
> >>>> [..]
> >>>>  - Add these modes to Mirror. (Done*, but needs tests.)
> >>>
> >>> are these mirror patches available somehwere for testing in combina=
tion
> >>> with this series? your bitmaps branch does not seem to contain them=
 ;)
> >>>
> >>> we've been experimenting with Ma Haocong's patch (v4 from February)=
 to add
> >>> "incremental"/differential sync to drive-mirror recently with posit=
ive
> >>> results so far, and this sounds like it is another attempt at getti=
ng
> >>> this properly integrated into Qemu.
> >>>
> >>
> >> Not available quite yet; I added it in fairly hastily but haven't do=
ne
> >> the testing I want to do yet, so I wouldn't feel comfortable sharing=
 it
> >> before I do my own due diligence on it. Give me a chance to polish i=
t so
> >> that the testing effort isn't wasted :)
> >=20
> > fair enough, and no hurries :)
> >=20
> >>
> >> Can you share some of your use-cases for how you are using the
> >> "incremental mirror" so far? It might be useful for the patch
> >> justification if I can point to production use cases. (And good for
> >> allocating time, too.)
> >=20
> > it's basically the same use case that the original "incremental mirro=
r"
> > patch (series)[1] from two years ago had (no affiliation with the aut=
hor
> > though) - we have a guest disk replication feature for ZFS/zvols in a
> > clustered hypervisor setting, and would like to re-use the already
> > replicated disk state when live-migrating a VM. Qemu does not know
> > anything about the replication, since it happens on the storage layer
> > with zfs send/zfs receive. note that for VMs, we use zvols which are
> > block devices backed by ZFS (or rather, ZFS datasets exposed as block
> > devices), minus the file system part of regular ZFS datasets. from
> > Qemu's PoV these (replicated) disks are just regular block devices (a=
nd not
> > image-backed disks on a filesystem, or accessed via some special
> > BlockDriver like Ceph's RBD images).
> >=20
> > we currently support live migration
> > 1) with disks on shared/distributed storage (easy enough)
> > 2) with regular (non-replicated, local) disks (via nbd/drive-mirror)
> > 3) with unused disks on the storage level (disks are not known to Qem=
u/the VM)
> >=20
> > 1-3 can be mixed and matched arbitrarily in one guest, e.g. with one
> > disk on a shared Ceph cluster, one disk that is not in use on an NFS
> > share, and another disk on a local LVM-thin pool. 2) and 3) also allo=
w
> > switching the underlying storage on the fly, since they transfer the
> > full disk (content) anyway.
> >=20
> > we also support offline migration with shared, local, unused and/or
> > replicated disks (all on the storage level with no involvement of Qem=
u).
> >=20
> > as you can see there is a gap in the live-migration feature matrix: w=
hen
> > replication is used, you either have to poweroff the VM to re-use the
> > replication state (storage-only migration), or drop the replication
> > state and do a full local-disk live-migration before re-creating the
> > replication state from scratch (which is bad, since replication can h=
ave
> > multiple target hosts, and re-establishing the whole disk can take a
> > while if its big).
> >=20
> > our basic approach is (currently) the following:
> >=20
> > 1) get disk info
> > 2) Qemu: add dirty bitmaps for currently used, replicated disks
> > 3) storage/ZFS: do a regular replication of all replicated disks (use=
d AND unused)
>=20
> I take it that the ZFS replication is not an ongoing process but
> something that terminates, so you need QEMU to pick up the difference
> that occurred during that time?

yes exactly. the ZFS replication creates a new snapshot, and transfers
all intermediate deltas since the last successfully replicated snapshot.

>=20
> (Which I imagine the bitmap will pick up some writes that DO get
> replicated, but copying some extra is safe.)

yep, see the note regarding this in my last mail ;)

>=20
> > 4) storage: do a regular storage migration of all regular unused loca=
l disks
> > 5a) Qemu: do a regular drive-mirror of all currently used, local disk=
s
> > 5b) Qemu: do an incremental drive-mirror for all currently used, repl=
icated disks
>=20
> To mirror anything written since the replication started, based on this
> timeline.

yes. or rather, to mirror anything written since shortly before the
replication started, which means to mirror anything written since the
(now) last replication snapshot, plus some extra writes that happened
right before and are included in that snapshot.

>=20
> > 6) Qemu: wait for convergence of drive-mirror jobs
> > 7) Qemu: do a regular live-migration of VM
> > 8) Qemu: once converged and VM is suspended, complete drive-mirror jo=
bs
> > 9) Qemu: resume now fully migrated VM on target node
> > 10) Qemu/storage: clean up on source node
> >=20
> > 5b) with bitmaps from 2) is what is currently missing on the Qemu sid=
e,
> > but seems easy enough to support (like I said, we are currently using=
 Ma
> > Haocong's patch for testing, but want to get this feature upstream on=
e
> > way or another instead of carrying our own, possibly incompatible in =
the
> > near-future version).
> >=20
>=20
> It will look VERY similar. Switching should be easy; the only differenc=
e
> will be:
>=20
> sync=3DBITMAP instead of sync=3DINCREMENTAL, and
> bitmap_mode=3DNEVER provided explicitly to match Ma Haocong's patch beh=
avior.
>=20
> You can alternatively use the other bitmap policies depending on what
> you want:
>=20
> NEVER leaves the bitmap alone entirely like Ma Haocong's patch does. It
> reflects a kind of "differential backup" intent; changes accumulate in
> the bitmap if it was enabled.
>=20
> ON-SUCCESS will reset any bits copied out if the job completes
> successfully (note that this includes mirror cancellation after sync as
> well as a COMPLETE instruction that includes the pivot.)
>=20
> ALWAYS will reset any bits successfully copied out, regardless of the
> final state of the job. You can use this one to resume the mirror on
> failures.
>=20
> You should be able to get the exact behavior you've already programmed
> for, and maybe some new toys.

that sounds promising. for this specific use case we don't care what
happens to the bitmap, since on success we switch to the migration
target VM and stop the old/source one (and thus the bitmap), and on
failure we abort the migration (and thus drop the bitmap) and a new
attempt will start with a new bitmap+replication run.

it might be interesting for other use cases though.

>=20
> > 2) and 3) are obviously not atomic, so the bitmaps will contain some
> > writes that have been replicated already on the block/storage layer
> > below the VM, and those writes will be done a second time in step 5b)=
.
> >=20
> > we can work around this by adding another short down time by
> > freezing/suspending prior to 2) until after doing the ZFS snapshots a=
t
> > the start of 3), in case these duplicate writes turn out to be
> > problematic after all. this downtime would be rather short, as the bu=
lk
> > of the replication work (actually transfering the latest delta) can
> > happen after unfreezing/resuming the VM. so far we haven't encountere=
d
> > any problems in our (albeit limited) testing though, so if possible w=
e
> > would naturally like to avoid the additional downtime altogether ;)
> >=20
> > looking forward to your patch(es) :)
> >=20
> > 1: <CAKVPjOZ8Y8U2zHgo_06aozrdd9_Cq6txWrX5F4HnFefAUjimyQ@mail.gmail.co=
m>
> > and <20170504105444.8940-1-daniel.kucera@gmail.com>
> >=20
>=20
> Thanks for the writeup! My goal is to have this in for 4.2 alongside al=
l
> of the other bitmap changes I've queued so far.

that sounds great! feel free to CC me on subsequent series if you want
early testing ;) I do try to keep up with -devel anyways, but sometimes
stuff slips through.


