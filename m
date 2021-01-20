Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1A92FCCF7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 09:52:40 +0100 (CET)
Received: from localhost ([::1]:57202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29EF-0000TC-Aw
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 03:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l29DE-0008Ud-SC
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:51:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:47672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l29DC-0000B1-PE
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:51:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l29D7-0008D1-Nd
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:51:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6B6E02E81C0
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:51:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 Jan 2021 08:39:03 -0000
From: Sitsofe Wheeler <1872644@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: hvf
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: js1943 sitsofe
X-Launchpad-Bug-Reporter: JS (js1943)
X-Launchpad-Bug-Modifier: Sitsofe Wheeler (sitsofe)
References: <158684876015.5950.10208526082243977591.malonedeb@chaenomeles.canonical.com>
Message-Id: <161113194404.29127.12498791401643694397.malone@soybean.canonical.com>
Subject: [Bug 1872644] Re: MacOS host qemu-system-x86_64 -cpu host not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 39c2243c35e674152baa61ca5145ab012736f25b
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
Reply-To: Bug 1872644 <1872644@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found that things were unstable unless the following were also added
-cpu Nehalem,-rdtscp
(the CPU can be higher than Nehalem but obviously your host CPU actually ha=
s to be equal or greater too)

-rdtscp is a known issue that has since been workedaround (see bug
#1894836 ).

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1872644

Title:
  MacOS host qemu-system-x86_64 -cpu host not working

Status in QEMU:
  New

Bug description:
  MacOS: 10.15.4
  uname -a: Linux door 4.15.0-96-generic #97-Ubuntu SMP Wed Apr 1 03:25:46 =
UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

  I am using qemu on mac host, with ubuntu client.

  I used to have "-cpu host" in my qemu command as follow:-

  qemu-system-x86_64 \
  -no-user-config \
  -nodefaults \
  -name u64d01 \
  -show-cursor \
  -M q35,accel=3Dhvf,usb=3Doff,vmport=3Doff \
  -cpu host \
  -m 8192M \
  -smp 4 \
  -rtc base=3Dutc,clock=3Dhost \
  -device virtio-blk-pci,drive=3Dssd1 \
  -drive id=3Dssd1,file=3D/Users/js/code/vm/qemu/u64d01.qcow2,if=3Dnone,for=
mat=3Dqcow2 \
  -device virtio-net-pci,netdev=3Dnic1,mac=3D52:54:98:76:54:33 \
  -netdev user,id=3Dnic1,ipv4=3Don,ipv6=3Don,hostname=3Du64d01,hostfwd=3Dtc=
p::2222-:22 \
  -device virtio-tablet-pci \
  -device virtio-vga \
  -device ich9-intel-hda,id=3Dsnd,msi=3Don \
  -device hda-output,id=3Dsnd-codec0,bus=3Dsnd.0,cad=3D0,audiodev=3Dsnd0 \
  -audiodev coreaudio,id=3Dsnd0

  Base on log of one of the vm, it was definitely working on
  2020-01-17(base on journal inside vm), with qemu 4.2.0, which I
  installed with brew.

  The only way to make it work is to remove "-cpu host".

  Already tried with 4.1.1, 4.2 and 5.0rc2. Same result.

  To reproduce, try above with a Ubuntu 18.04 installation cd. Client
  will crash during kernel loading.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1872644/+subscriptions

