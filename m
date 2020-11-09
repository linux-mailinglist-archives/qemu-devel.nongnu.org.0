Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE632AC0A7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 17:19:12 +0100 (CET)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc9st-0007Ii-FY
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 11:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kc9pw-0006Xt-VQ
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 11:16:08 -0500
Received: from indium.canonical.com ([91.189.90.7]:60758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kc9pt-0005y6-6L
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 11:16:08 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kc9pp-0007v4-K6
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 16:16:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A838A2E813A
 for <qemu-devel@nongnu.org>; Mon,  9 Nov 2020 16:16:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2020 16:07:26 -0000
From: John Snow <1681439@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr bugs-syssec janitor jnsnow kempniu stefanha
 th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?TWljaGHFgiBLxJlwaWXFhCAoa2VtcG5pdSk=?=
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <20170410132346.31250.84835.malonedeb@wampee.canonical.com>
Message-Id: <160493804659.13670.1472345129996642897.malone@gac.canonical.com>
Subject: [Bug 1681439] Re: dma_blk_cb leaks memory map handles on misaligned IO
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 1a7582bee34b12119c84965504b4d8db193ee1f6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 11:16:03
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
Reply-To: Bug 1681439 <1681439@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OK, I can probably fix the alignment and use the new undo function to at
least improve the characteristics of this failure considerably. Thanks
for the pointer on the new iov function.

I see two potential problems still:

(1) The IDE device will allow partial transfers to succeed, by doing
partial sector writes. AFAIUI the IDE state machine is supposed to do
full sector or nothing at all, but maybe I am wrong about that being a
requirement. It is at least not a regression, exactly. I can file a
separate bug for this.

(2) The invalid device inputs are just completely unknown to me right
now, and I don't have any hardware in my own house to test this, so I
have to deprioritize that until I can get back into the office and
regain access to more testing equipment. HELP WANTED, if anyone has a
PCI BMDMA that they can orchestrate in a virtual environment to prod it
for how it handles certain errant inputs.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1681439

Title:
  dma_blk_cb leaks memory map handles on misaligned IO

Status in QEMU:
  Confirmed

Bug description:
  Maintainer Edit:

  The functions in dma-helpers mismanage misaligned IO, badly enough to
  cause an infinite loop where no progress can be made. This allows the
  IDE state machine to get wedged such that cancelling DMA can fail;
  because the DMA helpers have bodged the state of the DMA transfer. See
  Comment #15 for the in-depth analysis.

  I've updated the name of this bug to reflect the current status as I
  understand it.

  --js

  =

  Original report:

  Since upgrading to QEMU 2.8.0, my Windows 7 64-bit virtual machines
  started crashing due to the assertion quoted in the summary failing.
  The assertion in question was added by commit 9972354856 ("block: add
  BDS field to count in-flight requests").  My tests show that setting
  discard=3Dunmap is needed to reproduce the issue.  Speaking of
  reproduction, it is a bit flaky, because I have been unable to come up
  with specific instructions that would allow the issue to be triggered
  outside of my environment, but I do have a semi-sane way of testing that
  appears to depend on a specific initial state of data on the underlying
  storage volume, actions taken within the VM and waiting for about 20
  minutes.

  Here is the shortest QEMU command line that I managed to reproduce the
  bug with:

  =C2=A0=C2=A0=C2=A0=C2=A0qemu-system-x86_64 \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-machine pc-i440fx-2.7,ac=
cel=3Dkvm \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-m 3072 \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-drive file=3D/dev/lvm/qe=
mu,format=3Draw,if=3Dide,discard=3Dunmap \
  =C2=A0-netdev tap,id=3Dhostnet0,ifname=3Dtap0,script=3Dno,downscript=3Dno=
,vhost=3Don \
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-pci,ne=
tdev=3Dhostnet0 \
  =C2=A0-vnc :0

  The underlying storage (/dev/lvm/qemu) is a thin LVM snapshot.

  QEMU was compiled using:

  =C2=A0=C2=A0=C2=A0=C2=A0./configure --python=3D/usr/bin/python2.7 --targe=
t-list=3Dx86_64-softmmu
  =C2=A0=C2=A0=C2=A0=C2=A0make -j3

  My virtualization environment is not really a critical one and
  reproduction is not that much of a hassle, so if you need me to gather
  further diagnostic information or test patches, I will be happy to help.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1681439/+subscriptions

