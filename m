Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4A3680BB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:42:41 +0200 (CEST)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYfI-0008LN-6k
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZYdY-0007Gx-0M
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:40:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:33622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZYdV-0002Kw-OX
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 08:40:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZYdU-0005Qw-4C
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 12:40:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1C5382E8157
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 12:40:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 12:34:30 -0000
From: Oguz Bektas <1925496@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: obektas
X-Launchpad-Bug-Reporter: Oguz Bektas (obektas)
X-Launchpad-Bug-Modifier: Oguz Bektas (obektas)
Message-Id: <161909487037.10022.905940620153099238.malonedeb@wampee.canonical.com>
Subject: [Bug 1925496] [NEW] nvme disk cannot be hotplugged after removal
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 9adf94f7fb513bc943f705e374ec96acdc6fd3da
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

Public bug reported:

Hello,

When I try to re-add an nvme disk shortly after removing it, I get an
error about duplicate ID.

See the following commands to reproduce. This happens consistently on
all VMs that I tested:


attach
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

$VAR1 =3D {
          'arguments' =3D> {
                           'command-line' =3D> 'drive_add auto "file=3D/dev=
/zvol/rpool/data/vm-20000-disk-1,if=3Dnone,id=3Ddrive-nvme1,format=3Draw,ca=
che=3Dnone,aio=3Dnative,detect-zeroes=3Don"'
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
                           'command-line' =3D> 'drive_add auto "file=3D/dev=
/zvol/rpool/data/vm-20000-disk-1,if=3Dnone,id=3Ddrive-nvme1,format=3Draw,ca=
che=3Dnone,aio=3Dnative,detect-zeroes=3Don"'
                         },
          'execute' =3D> 'human-monitor-command'
        };


and I get:
"Duplicate ID 'drive-nvme1' for drive"

although it does not show up in query-block or query-pci anymore after
the first detach.


Is this a bug or am I missing something? Please advise.

Best regards,
Oguz

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925496

Title:
  nvme disk cannot be hotplugged after removal

Status in QEMU:
  New

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

