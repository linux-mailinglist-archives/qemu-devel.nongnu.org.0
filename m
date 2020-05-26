Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05C1C3B78
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 15:42:35 +0200 (CEST)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVbMg-0007LU-E8
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 09:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jVbL4-0006Hq-Rv
 for qemu-devel@nongnu.org; Mon, 04 May 2020 09:40:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:39566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jVbL3-0006Le-ID
 for qemu-devel@nongnu.org; Mon, 04 May 2020 09:40:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jVbL0-00043r-2O
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 13:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 002FD2E8109
 for <qemu-devel@nongnu.org>; Mon,  4 May 2020 13:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 04 May 2020 13:35:02 -0000
From: Stefan Hajnoczi <1875762@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefanha vorteil-alan
X-Launchpad-Bug-Reporter: Alan Murtagh (vorteil-alan)
X-Launchpad-Bug-Modifier: Stefan Hajnoczi (stefanha)
References: <158811390770.10067.14727390581808721252.malonedeb@soybean.canonical.com>
Message-Id: <20200504133502.GG354891@stefanha-x1.localdomain>
Subject: Re: [Bug 1875762] [NEW] Poor disk performance on sparse VMDKs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 3d03e4de513b8c3eb7e8b43a57f1c5be66d6015f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 09:40:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1875762 <1875762@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 28, 2020 at 10:45:07PM -0000, Alan Murtagh wrote:
> QEMU appears to suffer from remarkably poor disk performance when
> writing to sparse-extent VMDKs. Of course it's to be expected that
> allocation takes time and sparse VMDKs peform worse than allocated
> VMDKs, but surely not on the orders of magnitude I'm observing.

Hi Alan,
This is expected behavior. The VMDK block driver is not intended for
running VMs. It is primarily there for qemu-img convert support.

You can get good performance by converting the image file to qcow2 or
raw instead.

The effort required to develop a high-performance image format driver
for non-trivial file formats like VMDK is quite high. Therefore only
qcow2 goes through the lengths required to deliver good performance
(request parallelism, metadata caching, optimizing metadata update
dependencies, etc).

The non-native image format drivers are simple and basically only work
well for sequential I/O with no parallel requests. That's all qemu-img
convert needs!

If someone volunteers to optimize VMDK then I'm sure the patches could
be merged. In the meantime I suggest using QEMU's native image formats:
qcow2 or raw.

Stefan

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1875762

Title:
  Poor disk performance on sparse VMDKs

Status in QEMU:
  New

Bug description:
  Found in QEMU 4.1, and reproduced on master.

  QEMU appears to suffer from remarkably poor disk performance when
  writing to sparse-extent VMDKs. Of course it's to be expected that
  allocation takes time and sparse VMDKs peform worse than allocated
  VMDKs, but surely not on the orders of magnitude I'm observing. On my
  system, the fully allocated write speeds are approximately 1.5GB/s,
  while the fully sparse write speeds can be as low as 10MB/s. I've
  noticed that adding "cache unsafe" reduces the issue dramatically,
  bringing speeds up to around 750MB/s. I don't know if this is still
  slow or if this perhaps reveals a problem with the default caching
  method.

  To reproduce the issue I've attached two 4GiB VMDKs. Both are
  completely empty and both are technically sparse-extent VMDKs, but one
  is 100% pre-allocated and the other is 100% unallocated. If you attach
  these VMDKs as second and third disks to an Ubuntu VM running on QEMU
  (with KVM) and measure their write performance (using dd to write to
  /dev/sdb and /dev/sdc for example) the difference in write speeds is
  clear.

  For what it's worth, the flags I'm using that relate to the VMDK are
  as follows:

  `-drive if=3Dnone,file=3Dsparse.vmdk,id=3Dhd0,format=3Dvmdk -device virti=
o-
  scsi-pci,id=3Dscsi -device scsi-hd,drive=3Dhd0`

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1875762/+subscriptions

