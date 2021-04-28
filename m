Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5461436D377
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 09:52:13 +0200 (CEST)
Received: from localhost ([::1]:49042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbezT-0006PQ-Ug
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 03:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbey9-0005yo-QI
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 03:50:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:59406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbey2-0001AF-WB
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 03:50:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lbexy-0004Je-61
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:50:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F40A42E815D
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:50:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Apr 2021 07:38:31 -0000
From: Klaus Jensen <1925496@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=its@irrelevant.dk; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: birkelund obektas
X-Launchpad-Bug-Reporter: Oguz Bektas (obektas)
X-Launchpad-Bug-Modifier: Klaus Jensen (birkelund)
References: <161909487037.10022.905940620153099238.malonedeb@wampee.canonical.com>
Message-Id: <161959551125.4593.12646811001152858380.malone@gac.canonical.com>
Subject: [Bug 1925496] Re: nvme disk cannot be hotplugged after removal
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: c8d1444ef7b2aaf603bd59101a3f8cc943fce9dd
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
Reply-To: Bug 1925496 <1925496@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So, I had to investigate this a bit, since it is a part of QEMU that I'm
not too familiar with.

My understanding is that this is the expected behavior. The reason is
that the drive cannot be deleted immediately when the device is hot-
unplugged, since it might not be safe (other parts of QEMU could be
using it, like background block jobs).

What we *can* do, is make sure we mark the drive for auto deletion when
it is safe to do so. I'll add a patch for that.

On the other hand, the fact that if the drive is removed explicitly
through QMP (or in the monitor with drive_del), the drive id is remains
"in use". This might be a completely different bug that is unrelated to
the nvme device.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925496

Title:
  nvme disk cannot be hotplugged after removal

Status in QEMU:
  Confirmed

Bug description:
  Hello,

  When I try to re-add an nvme disk shortly after removing it, I get an
  error about duplicate ID.

  See the following commands to reproduce. This happens consistently on
  all VMs that I tested:

  =

  attach
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  $VAR1 =3D {
            'arguments' =3D> {
                             'command-line' =3D> 'drive_add auto "file=3D/d=
ev/zvol/rpool/data/vm-20000-disk-1,if=3Dnone,id=3Ddrive-nvme1,format=3Draw,=
cache=3Dnone,aio=3Dnative,detect-zeroes=3Don"'
                           },
            'execute' =3D> 'human-monitor-command'
          };
  $VAR1 =3D {
            'execute' =3D> 'device_add',
            'arguments' =3D> {
                             'serial' =3D> 'nvme1',
                             'drive' =3D> 'drive-nvme1',
                             'driver' =3D> 'nvme',
                             'id' =3D> 'nvme1'
                           }
          };

  =

  detach
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  $VAR1 =3D {
            'arguments' =3D> {
                             'id' =3D> 'nvme1'
                           },
            'execute' =3D> 'device_del'
          };
  $VAR1 =3D {
            'execute' =3D> 'human-monitor-command',
            'arguments' =3D> {
                             'command-line' =3D> 'drive_del drive-nvme1'
                           }
          };

  reattach
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  $VAR1 =3D {
            'arguments' =3D> {
                             'command-line' =3D> 'drive_add auto "file=3D/d=
ev/zvol/rpool/data/vm-20000-disk-1,if=3Dnone,id=3Ddrive-nvme1,format=3Draw,=
cache=3Dnone,aio=3Dnative,detect-zeroes=3Don"'
                           },
            'execute' =3D> 'human-monitor-command'
          };

  =

  and I get:
  "Duplicate ID 'drive-nvme1' for drive"

  although it does not show up in query-block or query-pci anymore after
  the first detach.

  =

  Is this a bug or am I missing something? Please advise.

  Best regards,
  Oguz

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1925496/+subscriptions

