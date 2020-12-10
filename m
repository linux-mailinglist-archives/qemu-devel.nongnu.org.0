Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ABB2D5607
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:04:21 +0100 (CET)
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHs4-0003n4-15
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHpE-0001zI-Jf
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:01:24 -0500
Received: from indium.canonical.com ([91.189.90.7]:59876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHp4-0000fl-Az
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:01:24 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knHp3-0004kV-38
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:01:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 14F6A2E8047
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:01:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 08:49:20 -0000
From: Thomas Huth <1893691@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange dgilbert-h piotrjurkiewicz th-huth
X-Launchpad-Bug-Reporter: Piotr Jurkiewicz (piotrjurkiewicz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159890390988.14589.1084059668441088626.malonedeb@gac.canonical.com>
Message-Id: <160759016065.5497.15474636067609107314.malone@gac.canonical.com>
Subject: [Bug 1893691] Re: Chardev logfile is not written (regression between
 5.0 and 5.1)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: aacbbb44961f25e0af5fa54767e1061d2cffbe9f
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
Reply-To: Bug 1893691 <1893691@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1893691

Title:
  Chardev logfile is not written (regression between 5.0 and 5.1)

Status in QEMU:
  Fix Released

Bug description:
  After update from version 5.0 to 5.1, logfile stopped being populated
  with console output. The file is being created, but remains empty.

  Relevant command line options:

  -mon chardev=3Dchar0
  -serial chardev:char0
  -chardev socket,host=3D127.0.0.10,port=3D2323,server,nowait,telnet,mux=3D=
on,id=3Dchar0,logfile=3D/home/jurkiew/.machiner/runs/2020-08-31T21:46:55-0/=
internal/log

  =

  Full command line:

  qemu-system-x86_64
  -nodefaults
  -no-user-config
  -snapshot
  -enable-kvm
  -cpu
  host
  -nographic
  -echr
  17
  -mon
  chardev=3Dchar0
  -serial
  chardev:char0
  -rtc
  clock=3Dvm
  -object
  rng-random,filename=3D/dev/urandom,id=3Drng0
  -device
  virtio-rng-pci,rng=3Drng0,max-bytes=3D512,period=3D1000
  -name
  2020-08-31T21:46:55-0,debug-threads=3Don
  -smp
  sockets=3D1,cores=3D9,threads=3D2
  -m
  251G
  -overcommit
  cpu-pm=3Don
  -pidfile
  /home/jurkiew/.machiner/runs/2020-08-31T21:46:55-0/internal/pid
  -net
  nic,model=3Dvirtio
  -net
  user,hostfwd=3Dtcp:127.0.0.10:2222-:22,hostfwd=3Dtcp:127.0.0.10:8000-:800=
0,hostfwd=3Dtcp:127.0.0.10:9000-:9000
  -fsdev
  local,id=3Dmachiner_internal_dir,security_model=3Dnone,path=3D/home/jurki=
ew/.machiner/runs/2020-08-31T21:46:55-0/internal
  -device
  virtio-9p-pci,fsdev=3Dmachiner_internal_dir,mount_tag=3Dmachiner_internal=
_dir
  -fsdev
  local,id=3Dmachiner_lower_dir,security_model=3Dnone,readonly,path=3D.
  -device
  virtio-9p-pci,fsdev=3Dmachiner_lower_dir,mount_tag=3Dmachiner_lower_dir
  -fsdev
  local,id=3Dmachiner_upper_dir,security_model=3Dmapped-xattr,fmode=3D0777,=
dmode=3D0777,path=3D/home/jurkiew/.machiner/runs/2020-08-31T21:46:55-0
  -device
  virtio-9p-pci,fsdev=3Dmachiner_upper_dir,mount_tag=3Dmachiner_upper_dir
  -device
  virtio-scsi
  -drive
  if=3Dnone,file=3D/home/jurkiew/.machiner/images/famtar/image.qcow2,discar=
d=3Don,id=3Dfamtar
  -device
  scsi-hd,drive=3Dfamtar
  -chardev
  socket,host=3D127.0.0.10,port=3D2323,server,nowait,telnet,mux=3Don,id=3Dc=
har0,logfile=3D/home/jurkiew/.machiner/runs/2020-08-31T21:46:55-0/internal/=
log

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1893691/+subscriptions

