Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB3B7794
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 12:39:44 +0200 (CEST)
Received: from localhost ([::1]:42182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAtqh-00061A-Ff
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 06:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iAtoX-0004LE-6H
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:37:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iAtoV-00074M-Ru
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:37:29 -0400
Received: from indium.canonical.com ([91.189.90.7]:41064)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iAtoV-00073l-Lt
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:37:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iAtoS-00013k-Nj
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 10:37:24 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 45C8A2E81B0
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 10:37:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Sep 2019 10:15:43 -0000
From: YanFu Cho <1782300@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: colo
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: danielafu pjtsao
X-Launchpad-Bug-Reporter: PJ Tsao (pjtsao)
X-Launchpad-Bug-Modifier: YanFu Cho (danielafu)
References: <153189901344.31406.13269648308515707918.malonedeb@chaenomeles.canonical.com>
Message-Id: <156888814339.26585.8129640344644092139.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e7c031e2392ef7ea88fe312e1c87833bd5966296
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1782300] Re: COLO unable to failover to secondary
 VM
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
Reply-To: Bug 1782300 <1782300@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I also meet the same problem.
Does anybody have solutions for this problem?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1782300

Title:
  COLO unable to failover to secondary VM

Status in QEMU:
  New

Bug description:
  I test COLO feature on my host following docs/COLO-FT.txt in qemu folder,=
 but fail to failover to secondary VM. =

  Is there any mistake in my execution steps?

  Execution environment:
  QEMU v2.12.0-rc4
  OS:     Ubuntu 16.04.3 LTS
  Kernel: Linux 4.4.35
  Secondary VM IP: noted as "a.b.c.d"

  Execution steps:
  # Primary
  ${COLO_PATH}/x86_64-softmmu/qemu-system-x86_64 \
      -enable-kvm \
      -m 512M \
      -smp 2 \
      -qmp stdio \
      -vnc :7 \
      -name primary \
      -device piix3-usb-uhci \
      -device usb-tablet \
      -netdev tap,id=3Dtap0,vhost=3Doff \
      -device virtio-net-pci,id=3Dnet-pci0,netdev=3Dtap0 \
      -drive if=3Dvirtio,id=3Dprimary-disk0,driver=3Dquorum,read-pattern=3D=
fifo,vote-threshold=3D1,\
          children.0.file.filename=3D${IMG_PATH},\
          children.0.driver=3Draw -S

  # Secondary
  ${COLO_PATH}/x86_64-softmmu/qemu-system-x86_64 \
      -enable-kvm \
      -m 512M \
      -smp 2 \
      -qmp stdio \
      -vnc :8 \
      -name secondary \
      -device piix3-usb-uhci \
      -device usb-tablet \
      -netdev tap,id=3Dtap1,vhost=3Doff \
      -device virtio-net-pci,id=3Dnet-pci0,netdev=3Dtap1 \
      -drive if=3Dnone,id=3Dsecondary-disk0,file.filename=3D${IMG_PATH},dri=
ver=3Draw,node-name=3Dnode0 \
      -drive if=3Dvirtio,id=3Dactive-disk0,driver=3Dreplication,mode=3Dseco=
ndary,\
          file.driver=3Dqcow2,top-id=3Dactive-disk0,\
          file.file.filename=3D$ACTIVE_DISK,\
          file.backing.driver=3Dqcow2,\
          file.backing.file.filename=3D$HIDDEN_DISK,\
          file.backing.backing=3Dsecondary-disk0 \
      -incoming tcp:0:8888

  # Enter into Secondary:
  {'execute':'qmp_capabilities'}
  { 'execute': 'nbd-server-start',
      'arguments': {'addr': {'type': 'inet', 'data': {'host': 'a.b.c.d', 'p=
ort': '8889'} } }
  }
  {'execute': 'nbd-server-add', 'arguments': {'device': 'secondary-disk0', =
'writable': true } }

  # Enter into Primary:
  {'execute':'qmp_capabilities'}
  {'execute': 'human-monitor-command',
      'arguments': {
          'command-line': 'drive_add -n buddy driver=3Dreplication,mode=3Dp=
rimary,file.driver=3Dnbd,file.host=3Da.b.c.d,file.port=3D8889,file.export=
=3Dsecondary-disk0,node-name=3Dnbd_client0'
      }
  }
  { 'execute':'x-blockdev-change', 'arguments':{'parent': 'primary-disk0', =
'node': 'nbd_client0' } }
  { 'execute': 'migrate-set-capabilities',
      'arguments': {'capabilities': [ {'capability': 'x-colo', 'state': tru=
e } ] } }
  { 'execute': 'migrate', 'arguments': {'uri': 'tcp:a.b.c.d:8888' } }

  # To test failover
  Primary
  { 'execute': 'x-blockdev-change', 'arguments': {'parent': 'primary-disk0'=
, 'child': 'children.1'}}
  { 'execute': 'human-monitor-command','arguments': {'command-line': 'drive=
_del nbd_client0'}}

  Secondary
  { 'execute': 'nbd-server-stop' }

  Stop Primary
  Send ^C signal to terminate PVM.

  Secondary
  { "execute": "x-colo-lost-heartbeat" }

  =

  # Result:
  Primary (Use ^C to terminate)
  qemu-system-x86_64: Can't receive COLO message: Input/output error
  qemu-system-x86_64: terminating on signal 2
  {"timestamp": {"seconds": 1531815575, "microseconds": 997696}, "event": "=
SHUTDOWN", "data": {"guest":false}}

  Secondary
  { 'execute': 'nbd-server-stop' }
  {"return": {}}
  { "execute": "x-colo-lost-heartbeat" }
  {"return": {}}
  qemu-system-x86_64: Can't receive COLO message: Input/output error
  Segmentation fault

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1782300/+subscriptions

