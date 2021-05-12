Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5737BC0F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:51:40 +0200 (CEST)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgnOr-0002aE-U2
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnMy-000109-UB
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:49:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:40074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnMx-0005qI-59
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:49:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgnMv-00089r-6j
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:49:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 221762E8187
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:49:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 11:40:13 -0000
From: Thomas Huth <1525123@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer usb
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: a1xndr bugs-syssec janitor joveler th-huth
X-Launchpad-Bug-Reporter: Hajin Jang (joveler)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20151211084346.25665.93589.malonedeb@gac.canonical.com>
Message-Id: <162081961437.31330.15306444504272604692.launchpad@gac.canonical.com>
Subject: [Bug 1525123] Re: USB assert failure on hcd-uhci.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: 18112ba96b06ee2d7fadd9981ea54068bf180c04
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
Reply-To: Bug 1525123 <1525123@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: fuzzer usb

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1525123

Title:
  USB assert failure on hcd-uhci.c

Status in QEMU:
  Expired

Bug description:
  When inserting the attached kernel moudle in the guest OS, QEMU quits
  with therse assert failure:

  [insert kernel module in guest root shell]
  root@qemu:~# insmod mymod.ko
  root@qemu:~#
  Connection closed by foreign host.

  [host message]
  qemu-system-x86_64: hw/usb/core.c:718: usb_ep_get: Assertion `pid =3D=3D =
0x69 || pid =3D=3D 0xe1' failed.
  Aborted

  The direct cause of this bug is due to misimplementation of UHCI.
  According to Intel's UHCI design guide, packet identification in transfer=
 descriptor must be one of these three values : IN (69h), OUT (E1h), and SE=
TUP (2Dh). Any other value in this field must cause the HALT of only HOST C=
ONTROLLER.

  However, due to misimplementation in uhci_handle_td, instead of host
  controller being halted, QEMU itself dies with assertion failure. The
  assertion code is in usb_ep_get():718, which is called during
  uhci_handle_td().

  Another issue resides in uhci_handle_td(). This function must check
  that transfer descriptor's pid is one of IN, OUT, SETUP before calling
  usb_ep_get() or other functions. If it does so, usb_ep_get() only
  needs to check if pid is not SETUP.

  This kind of assert failure can be misused by malwares to avoid being
  analyzed by terminating only in the virtual environments and still
  execute the malicious code in real machines.

  =

  [How to run exploit code]
  Prepare linux kernel's source header, then type these lines in root shell.
  # make
  # insmod mymod.ko

  It needs uhci-hcd.h from linux kernel source.
  I attached linux 3.18.24's uhci-hcd.h for tempory measure; You should get=
 proper version of uhci-hcd.h.
  In the following envrionment, this exploit worked, exiting whole QEMU, no=
t only USB.

  QEMU was running on these environment :
  [CPU model] Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz
  [qemu version] QEMU 2.5.0-rc3 (compiled from source, gcc 4.8.4)
  [host info] Ubuntu 14.04.3, x86_64, 3.19.0-32-generic
  [guest info] Ubuntu 14.04.3, x86_64, 3.19.0-28-generic
  [QEMU argument]
  x86_64-softmmu/qemu-system-x86_64 -hda /media/hdd/img/ubuntu1404.qcow2 \
  =C2=A0-m 512 \
  =C2=A0--usbdevice disk:format=3Dqcow2:../usb.img \
  =C2=A0--enable-kvm

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1525123/+subscriptions

