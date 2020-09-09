Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0F426270E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 08:11:54 +0200 (CEST)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFtKj-0005L2-SI
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 02:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kFtJl-0004tx-FD
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 02:10:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:42080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kFtJj-0005er-7E
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 02:10:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kFtJh-0005Uq-C5
 for <qemu-devel@nongnu.org>; Wed, 09 Sep 2020 06:10:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 582CB2E80DB
 for <qemu-devel@nongnu.org>; Wed,  9 Sep 2020 06:10:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2020 06:01:30 -0000
From: Nick Bauer <1894869@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: chelsio t4
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 1butteryadmin
X-Launchpad-Bug-Reporter: Nick Bauer (1butteryadmin)
X-Launchpad-Bug-Modifier: Nick Bauer (1butteryadmin)
References: <159958042175.17914.10047848067927369523.malonedeb@soybean.canonical.com>
Message-Id: <159963129056.10798.2077259865433950849.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1894869] Re: Chelsio T4 has old MSIX PBA offset bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="90a5703803d95539bdb5c0b289b1675630569e1e"; Instance="production"
X-Launchpad-Hash: f06c75f9a3f837e8bebc973950a1d09a8ce009f7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 02:10:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1894869 <1894869@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Description changed:

  There exists a bug with Chelsio NICs T4 that causes the following error:
  =

  kvm: -device vfio-
  pci,host=3D0000:83:00.7,id=3Dhostpci1.7,bus=3Dpci.0,addr=3D0x11.7: vfio
  0000:83:00.7: hardware reports invalid configuration, MSIX PBA outside
  of specified BAR
  =

- I was working with a downstream Proxmox developer to try to fix this
- issue, and they provided me with the following change to make from line
- 1484 of hw/vfio/pci.c:
+ I discovered this bug on a Proxmox system, and I was working with a
+ downstream Proxmox developer to try to fix this issue. They provided me
+ with the following change to make from line 1484 of hw/vfio/pci.c:
  =

  static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
-           * is 0x1000, so we hard code that here.
-           */
-          if (vdev->vendor_id =3D=3D PCI_VENDOR_ID_CHELSIO &&
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* is 0x1000, =
so we hard code that here.
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (vdev->vendor_id=
 =3D=3D PCI_VENDOR_ID_CHELSIO &&
  -            (vdev->device_id & 0xff00) =3D=3D 0x5800) {
  +            ((vdev->device_id & 0xff00) =3D=3D 0x5800 ||
  +             (vdev->device_id & 0xff00) =3D=3D 0x1425)) {
-              msix->pba_offset =3D 0x1000;
-          } else if (vdev->msix_relo =3D=3D OFF_AUTOPCIBAR_OFF) {
-              error_setg(errp, "hardware reports invalid configuration, "
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0msix->pba_offset =3D 0x1000;
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else if (vdev->ms=
ix_relo =3D=3D OFF_AUTOPCIBAR_OFF) {
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0error_setg(errp, "hardware reports invalid configuration, "
  =

  However, I found that this did not fix the issue, so the bug appears to
  work differently than the one that was present on the T5 NICs which has
  already been patched. I have attached the output of my lspci -nnkvv

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894869

Title:
  Chelsio T4 has old MSIX PBA offset bug

Status in QEMU:
  New

Bug description:
  There exists a bug with Chelsio NICs T4 that causes the following
  error:

  kvm: -device vfio-
  pci,host=3D0000:83:00.7,id=3Dhostpci1.7,bus=3Dpci.0,addr=3D0x11.7: vfio
  0000:83:00.7: hardware reports invalid configuration, MSIX PBA outside
  of specified BAR

  I discovered this bug on a Proxmox system, and I was working with a
  downstream Proxmox developer to try to fix this issue. They provided
  me with the following change to make from line 1484 of hw/vfio/pci.c:

  static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* is 0x1000, =
so we hard code that here.
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (vdev->vendor_id=
 =3D=3D PCI_VENDOR_ID_CHELSIO &&
  -            (vdev->device_id & 0xff00) =3D=3D 0x5800) {
  +            ((vdev->device_id & 0xff00) =3D=3D 0x5800 ||
  +             (vdev->device_id & 0xff00) =3D=3D 0x1425)) {
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0msix->pba_offset =3D 0x1000;
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else if (vdev->ms=
ix_relo =3D=3D OFF_AUTOPCIBAR_OFF) {
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0error_setg(errp, "hardware reports invalid configuration, "

  However, I found that this did not fix the issue, so the bug appears
  to work differently than the one that was present on the T5 NICs which
  has already been patched. I have attached the output of my lspci
  -nnkvv

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894869/+subscriptions

