Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D6391B0F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:02:55 +0200 (CEST)
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llv3e-0005sE-9C
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llv0T-0003mT-Mb
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:59:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:49298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llv0R-0001bR-IU
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:59:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llv0P-0002n4-5j
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:59:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 210712E8186
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:59:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 14:46:57 -0000
From: Thomas Huth <721825@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Low; assignee=None;
X-Launchpad-Bug-Tags: block vdi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefanha th-huth
X-Launchpad-Bug-Reporter: Stefan Hajnoczi (stefanha)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110219161957.9055.80104.malonedeb@gandwana.canonical.com>
Message-Id: <162204041872.21753.4247976072730479104.launchpad@chaenomeles.canonical.com>
Subject: [Bug 721825] Re: VDI block driver bugs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: 857aa5bff2d42030ddb935c9c3bfcbb5061fb2bd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

** Changed in: qemu
     Assignee: Stefan Weil (ubuntu-weilnetz) =3D> (unassigned)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/721825

Title:
  VDI block driver bugs

Status in QEMU:
  Incomplete

Bug description:
  Chunqiang Tang reports the following issues with the VDI block driver,
  these are present in QEMU 0.14:

  "Bug 1. The most serious bug is caused by race condition in updating a ne=
w =

  bmap entry in memory and on disk. Considering the following operation =

  sequence. =

    O1: VM issues a write to sector X
    O2: VDI allocates a new bmap entry and updates in-memory s->bmap
    O3: VDI writes data to disk
    O4: The disk I/O for writing sector X fails
    O5: VDI reports error to VM and returns.

  Note that the bmap entry is updated in memory, but not persisted on disk. =

  Now consider another write that immediately follows:
    P1: VM issues a write to sector X+1, which locates in the same block as =

  the previously used sector X.
    P2: s->bmap already has one entry for the block, and hence VDI writes =

  data directly without persisting the new s->bmap entry on disk.
    P3: The write disk I/O succeeds
    P4: VDI report success to VM, but the bitmap entry is still not =

  persisted on disk.

  Now suppose the VM powers off gracefully (i.e., the QEMU process quits) =

  and reboots. The second write to sector X+1, which is reported as finishe=
d =

  successfully, is simply lost, because the corresponding in-memory s->bmap =

  entry is never persisted on disk. This is exactly what FVD's testing tool =

  discovers. After the block device is closed and then re-opened, disk =

  content verification fails.

  This is just one example of the problem. Race condition plus host crash =

  also causes problems. Consider another example below.
    Q1: VM issues a write to sector X
    Q2: VDI allocates a new bmap entry and updates in-memory s->bmap
    Q3: VDI writes sector X to disk and waits for the callback
    Q4: VM issues a write to another sector X+1, which is in the same block =

  as sector X.
    Q5: VDI sees the bitmap entry in s->bmap is already allocated, and =

  writes sector X+1 to disk.
    Q6: Write to sector X+1 finishes, and VDI's callback is invoked.
    Q7: VDI acknowledges to the VM the completion of writing sector X+1
    Q8: After observing the completion of writing sector X+1, VM issues a =

  flush to ensure that sector X+1 is persisted on disk.
    Q9: VDI finishes the flush and acknowledge the completion of the =

  operation.
    Q10: ... (some other arbitrary operations, but the disk I/O for writing =

  sector X is still not finished....)
    Q11: The host crashes

  Now the new bitmap entry is not persisted on disk, while both writing to =

  sector X+1 and the flush has been acknowledged as finished. Sector X+1 is =

  lost, which is a corruption. This problem exists even if it uses O_DSYNC. =

  The root cause of the problem is that, if a request updates in-memory =

  s->bmap, another request that sees this update assumes that the update is =

  already persisted on disk, which is not.

  Bug 2: Similar to the bugs the FVD testing tool found for QCOW2, there ar=
e =

  several cases of the code below on failure handling path without setting =

  error return code, which mistakenly reports failure as success. This =

  mistake is caught by FVD when doing image content validation.
         if (acb->hd_aiocb =3D=3D NULL) {
             /* missing     ret =3D -EIO; */
              goto done; =

          } =


  Bug 3: Similar to the bugs the FVD testing tool found for QCOW2, =

  vdi_aio_cancel does not perform a complete clean up and there are several =

  related bugs. First, memory buffer is not freed, acb->orig_buf and =

  acb->block_buffer. Second, acb->bh is not cancelled. Third, =

  vdi_aio_setup() does not initialize acb->bh to NULL so that when a reques=
t =

  acb is cancelled and then later reused for another request, its acb->bh !=
=3D =

  NULL and the new request fails in  vdi_schedule_bh(). This is caught by =

  FVD's testing tool, when it observes that no I/O failure is injected but =

  VDI reports a failed I/O request, which indicates a bug in the driver."

  http://permalink.gmane.org/gmane.comp.emulators.qemu/94340

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/721825/+subscriptions

