Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E63E38928D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:27:40 +0200 (CEST)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljO6k-0001ZI-MH
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ljO4w-0000VX-Bd
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:25:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:54780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ljO4u-00052R-92
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:25:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ljO4r-0002rd-0e
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 15:25:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C3D052E8135
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 15:25:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 May 2021 15:18:46 -0000
From: ignazio <1761798@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=nova; status=Confirmed; importance=Medium;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: libvirt live-migration
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balazs-gibizer cassano dgilbert-h dsutyagin
 kashyapc melwitt mriedem sean-k-mooney th-huth
X-Launchpad-Bug-Reporter: Matt Riedemann (mriedem)
X-Launchpad-Bug-Modifier: ignazio (cassano)
References: <152303245198.3233.1033096993665779324.malonedeb@wampee.canonical.com>
Message-Id: <162143752676.6104.7589178646734846345.malone@wampee.canonical.com>
Subject: [Bug 1761798] Re: live migration intermittently fails in CI with "VQ
 0 size 0x80 Guest index 0x12c inconsistent with Host index 0x134:
 delta 0xfff8"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="716e08a550b901207b3abbeb098dd682f9ecb267"; Instance="production"
X-Launchpad-Hash: 3dee51d3b771b4cc636818aeb870fc2a1e08f16e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1761798 <1761798@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, some news ....I wonder if they can help:
I am testing with some virtual machine again.
If I follows this steps it works (but I lost network connection):

1) Detach network interface from instance
2) Attach network interface to instance
3) Migrate instance
4) Loggin into instance using console and restart networking

while if I restart networking before live migration it does not work.
So, when someone mentioned

########################
we get this "guest index inconsistent" error when the migrated RAM is incon=
sistent with the migrated 'virtio' device state. And a common case is where=
 a 'virtio' device does an operation after the vCPU is stopped and after RA=
M has been transmitted.
#############################=C3=A0
the network traffic could be the problem ?
Ignazio

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1761798

Title:
  live migration intermittently fails in CI with "VQ 0 size 0x80 Guest
  index 0x12c inconsistent with Host index 0x134: delta 0xfff8"

Status in OpenStack Compute (nova):
  Confirmed
Status in QEMU:
  Incomplete

Bug description:
  Seen here:

  http://logs.openstack.org/37/522537/20/check/legacy-tempest-dsvm-
  multinode-live-
  migration/8de6e74/logs/subnode-2/libvirt/qemu/instance-00000002.txt.gz

  2018-04-05T21:48:38.205752Z qemu-system-x86_64: -chardev pty,id=3Dcharser=
ial0,logfile=3D/dev/fdset/1,logappend=3Don: char device redirected to /dev/=
pts/0 (label charserial0)
  warning: TCG doesn't support requested feature: CPUID.01H:ECX.vmx [bit 5]
  2018-04-05T21:48:43.153268Z qemu-system-x86_64: VQ 0 size 0x80 Guest inde=
x 0x12c inconsistent with Host index 0x134: delta 0xfff8
  2018-04-05T21:48:43.153288Z qemu-system-x86_64: Failed to load virtio-blk=
:virtio
  2018-04-05T21:48:43.153292Z qemu-system-x86_64: error while loading state=
 for instance 0x0 of device '0000:00:04.0/virtio-blk'
  2018-04-05T21:48:43.153347Z qemu-system-x86_64: load of migration failed:=
 Operation not permitted
  2018-04-05 21:48:43.198+0000: shutting down, reason=3Dcrashed

  And in the n-cpu logs on the other host:

  http://logs.openstack.org/37/522537/20/check/legacy-tempest-dsvm-
  multinode-live-
  migration/8de6e74/logs/screen-n-cpu.txt.gz#_Apr_05_21_48_43_257541

  There is a related Red Hat bug:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1450524

  The CI job failures are at present using the Pike UCA:

  ii  libvirt-bin                         3.6.0-1ubuntu6.2~cloud0

  ii  qemu-system-x86                     1:2.10+dfsg-0ubuntu3.5~cloud0

To manage notifications about this bug go to:
https://bugs.launchpad.net/nova/+bug/1761798/+subscriptions

