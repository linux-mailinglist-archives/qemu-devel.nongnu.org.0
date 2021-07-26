Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEF83D5289
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 06:27:14 +0200 (CEST)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7sCu-0004QI-TH
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 00:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1m7sCB-0003m2-RA
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 00:26:27 -0400
Received: from indium.canonical.com ([91.189.90.7]:56766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1m7sC9-0001sG-Cr
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 00:26:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m7sC3-0000Ag-89
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 04:26:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0D2FB2E8136
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 04:26:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Jul 2021 04:17:19 -0000
From: Launchpad Bug Tracker <721825@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Low; assignee=None;
X-Launchpad-Bug-Tags: block vdi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor stefanha th-huth
X-Launchpad-Bug-Reporter: Stefan Hajnoczi (stefanha)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20110219161957.9055.80104.malonedeb@gandwana.canonical.com>
Message-Id: <162727303927.6411.18092802211446842666.malone@loganberry.canonical.com>
Subject: [Bug 721825] Re: VDI block driver bugs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="20124175fa98fcb4b43973265a1561174418f4bd"; Instance="production"
X-Launchpad-Hash: 8a6dba7fda5932bd29e7a18c885818c25a7378ea
Received-SPF: none client-ip=91.189.90.7; envelope-from=noreply@launchpad.net;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 721825 <721825@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/721825

Title:
  VDI block driver bugs

Status in QEMU:
  Expired

Bug description:
  Chunqiang Tang reports the following issues with the VDI block driver,
  these are present in QEMU 0.14:

  "Bug 1. The most serious bug is caused by race condition in updating a ne=
w=20
  bmap entry in memory and on disk. Considering the following operation=20
  sequence.=20
    O1: VM issues a write to sector X
    O2: VDI allocates a new bmap entry and updates in-memory s->bmap
    O3: VDI writes data to disk
    O4: The disk I/O for writing sector X fails
    O5: VDI reports error to VM and returns.

  Note that the bmap entry is updated in memory, but not persisted on disk.=
=20
  Now consider another write that immediately follows:
    P1: VM issues a write to sector X+1, which locates in the same block as=
=20
  the previously used sector X.
    P2: s->bmap already has one entry for the block, and hence VDI writes=20
  data directly without persisting the new s->bmap entry on disk.
    P3: The write disk I/O succeeds
    P4: VDI report success to VM, but the bitmap entry is still not=20
  persisted on disk.

  Now suppose the VM powers off gracefully (i.e., the QEMU process quits)=20
  and reboots. The second write to sector X+1, which is reported as finishe=
d=20
  successfully, is simply lost, because the corresponding in-memory s->bmap=
=20
  entry is never persisted on disk. This is exactly what FVD's testing tool=
=20
  discovers. After the block device is closed and then re-opened, disk=20
  content verification fails.

  This is just one example of the problem. Race condition plus host crash=20
  also causes problems. Consider another example below.
    Q1: VM issues a write to sector X
    Q2: VDI allocates a new bmap entry and updates in-memory s->bmap
    Q3: VDI writes sector X to disk and waits for the callback
    Q4: VM issues a write to another sector X+1, which is in the same block=
=20
  as sector X.
    Q5: VDI sees the bitmap entry in s->bmap is already allocated, and=20
  writes sector X+1 to disk.
    Q6: Write to sector X+1 finishes, and VDI's callback is invoked.
    Q7: VDI acknowledges to the VM the completion of writing sector X+1
    Q8: After observing the completion of writing sector X+1, VM issues a=20
  flush to ensure that sector X+1 is persisted on disk.
    Q9: VDI finishes the flush and acknowledge the completion of the=20
  operation.
    Q10: ... (some other arbitrary operations, but the disk I/O for writing=
=20
  sector X is still not finished....)
    Q11: The host crashes

  Now the new bitmap entry is not persisted on disk, while both writing to =

  sector X+1 and the flush has been acknowledged as finished. Sector X+1 is=
=20
  lost, which is a corruption. This problem exists even if it uses O_DSYNC.=
=20
  The root cause of the problem is that, if a request updates in-memory=20
  s->bmap, another request that sees this update assumes that the update is=
=20
  already persisted on disk, which is not.

  Bug 2: Similar to the bugs the FVD testing tool found for QCOW2, there ar=
e=20
  several cases of the code below on failure handling path without setting =

  error return code, which mistakenly reports failure as success. This=20
  mistake is caught by FVD when doing image content validation.
         if (acb->hd_aiocb =3D=3D NULL) {
             /* missing     ret =3D -EIO; */
              goto done;=20
          }=20

  Bug 3: Similar to the bugs the FVD testing tool found for QCOW2,=20
  vdi_aio_cancel does not perform a complete clean up and there are several=
=20
  related bugs. First, memory buffer is not freed, acb->orig_buf and=20
  acb->block_buffer. Second, acb->bh is not cancelled. Third,=20
  vdi_aio_setup() does not initialize acb->bh to NULL so that when a reques=
t=20
  acb is cancelled and then later reused for another request, its acb->bh !=
=3D=20
  NULL and the new request fails in  vdi_schedule_bh(). This is caught by=20
  FVD's testing tool, when it observes that no I/O failure is injected but =

  VDI reports a failed I/O request, which indicates a bug in the driver."

  http://permalink.gmane.org/gmane.comp.emulators.qemu/94340

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/721825/+subscriptions


