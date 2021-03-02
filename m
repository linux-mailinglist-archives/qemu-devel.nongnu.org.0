Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38943295C0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 04:32:58 +0100 (CET)
Received: from localhost ([::1]:58916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGvmK-0008Tr-Bq
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 22:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGvkK-0007c0-GW
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 22:30:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:60282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGvkE-0001QS-2M
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 22:30:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lGvkB-0007HD-9F
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 03:30:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 431792E80FF
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 03:30:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Mar 2021 03:24:05 -0000
From: sean kuo <1917394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: seannnnk
X-Launchpad-Bug-Reporter: sean kuo (seannnnk)
X-Launchpad-Bug-Modifier: sean kuo (seannnnk)
Message-Id: <161465544550.24578.14846009621606228644.malonedeb@wampee.canonical.com>
Subject: [Bug 1917394] [NEW] command lspci does not show the IVSHMEM device
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: cbebfee579a71ef8519a516bf1298f3bfdf2ab99
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
Reply-To: Bug 1917394 <1917394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

qeum version:
QEMU emulator version 4.2.1

I met a problem when I tried to use IVSHMEM. Command lspci does not show th=
e IVSHMEM device.
Below is the configuration from my side:

1.  guest vm xml configuration.
  <shmem name=3D'ivshmem'>
      <model type=3D'ivshmem-plain'/>
      <size unit=3D'M'>2</size>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x10' fu=
nction=3D'0x0'/>
    </shmem>

2. after the booting up and I found the qemu commandline ideedly  have the =
device option:
ps aux | grep ivshmem
 /usr/bin/qemu-system-x86_64 =

      .......(ignore other options)
-object memory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/shm/hostmem,=
size=3D4194304,share=3Dyes -device ivshmem-plain,id=3Dshmem0,memdev=3Dshmme=
m-shmem0,bus=3Dpcie.0,addr=3D0x10

3. lspci command  not shown the device.

4. lshw command indeedly show the device:

*-memory UNCLAIMED
             description: RAM memory
             product: Inter-VM shared memory
             vendor: Red Hat, Inc.
             physical id: 10
             bus info: pci@0000:00:10.0
             version: 01
             width: 64 bits
             clock: 33MHz (30.3ns)
             configuration: latency=3D0
             resources: memory:fcc1c000-fcc1c0ff memory:fdc00000-fdffffff

My host and vm os is ubuntu 20.04 and version is:
#49~20.04.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64 GNU=
/Linux

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917394

Title:
  command lspci does not show the IVSHMEM device

Status in QEMU:
  New

Bug description:
  qeum version:
  QEMU emulator version 4.2.1

  I met a problem when I tried to use IVSHMEM. Command lspci does not show =
the IVSHMEM device.
  Below is the configuration from my side:

  1.  guest vm xml configuration.
    <shmem name=3D'ivshmem'>
        <model type=3D'ivshmem-plain'/>
        <size unit=3D'M'>2</size>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x10' =
function=3D'0x0'/>
      </shmem>

  2. after the booting up and I found the qemu commandline ideedly  have th=
e device option:
  ps aux | grep ivshmem
   /usr/bin/qemu-system-x86_64 =

        .......(ignore other options)
  -object memory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/shm/hostme=
m,size=3D4194304,share=3Dyes -device ivshmem-plain,id=3Dshmem0,memdev=3Dshm=
mem-shmem0,bus=3Dpcie.0,addr=3D0x10

  3. lspci command  not shown the device.

  4. lshw command indeedly show the device:

  *-memory UNCLAIMED
               description: RAM memory
               product: Inter-VM shared memory
               vendor: Red Hat, Inc.
               physical id: 10
               bus info: pci@0000:00:10.0
               version: 01
               width: 64 bits
               clock: 33MHz (30.3ns)
               configuration: latency=3D0
               resources: memory:fcc1c000-fcc1c0ff memory:fdc00000-fdffffff

  My host and vm os is ubuntu 20.04 and version is:
  #49~20.04.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64 G=
NU/Linux

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917394/+subscriptions

