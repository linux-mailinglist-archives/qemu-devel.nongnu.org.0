Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFD2C25AD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:28:06 +0100 (CET)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXQT-0003Gb-3R
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khXOH-0002NE-Ec
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:25:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:33496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khXOE-0003yA-CI
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:25:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khXOB-0002h5-Q6
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 12:25:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B001C2E813A
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 12:25:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 12:17:25 -0000
From: "Dr. David Alan Gilbert" <1761798@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=nova; status=Confirmed; importance=Medium;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: libvirt live-migration
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balazs-gibizer dgilbert-h dsutyagin kashyapc
 melwitt mriedem sean-k-mooney
X-Launchpad-Bug-Reporter: Matt Riedemann (mriedem)
X-Launchpad-Bug-Modifier: Dr. David Alan Gilbert (dgilbert-h)
References: <152303245198.3233.1033096993665779324.malonedeb@wampee.canonical.com>
Message-Id: <160622024533.8423.227006330294262384.malone@gac.canonical.com>
Subject: [Bug 1761798] Re: live migration intermittently fails in CI with "VQ
 0 size 0x80 Guest index 0x12c inconsistent with Host index 0x134:
 delta 0xfff8"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: ba7de482a65ed54c3af7e1628bd8fe3733d2d1cc
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1761798 <1761798@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hang on, I've just noticed the :

 char device redirected to /dev/pts/2 (label charserial0)
virtio: bogus descriptor or out of resources
2020-11-20 14:25:39.911+0000: initiating migration

I've never seen that 'bogus descriptor or out of resources' one before; the=
 fact that's happening before the migration starts is suspicious that somet=
hing has already gone wrong before migration started.
Is that warning present in all these failures?

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
  New

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

