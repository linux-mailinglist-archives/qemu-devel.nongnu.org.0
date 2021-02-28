Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7022F327223
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 12:56:38 +0100 (CET)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGKge-0007j0-TA
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 06:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGKfG-0007CZ-6a
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 06:55:10 -0500
Received: from indium.canonical.com ([91.189.90.7]:48668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lGKfD-0008OF-Sh
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 06:55:09 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lGKfB-0000FF-6k
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 11:55:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B02EB2E8143
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 11:55:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Feb 2021 11:38:50 -0000
From: Peter Maydell <1523811@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: assert fuzzer usb
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: cwmyung janitor joveler th-huth
X-Launchpad-Bug-Reporter: Hajin Jang (joveler)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20151208084519.14688.79647.malonedeb@wampee.canonical.com>
Message-Id: <161451233076.13768.4509628983859178165.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1523811] Re: USB assert failure on dev-storage.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cd61f0bfc5208dd4b58a15e953892eaabba1e0b8"; Instance="production"
X-Launchpad-Hash: 6d49103581e7b57287b04cfb8379f446cc304b48
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1523811 <1523811@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: fuzzer

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1523811

Title:
  USB assert failure on dev-storage.c

Status in QEMU:
  Expired

Bug description:
  On executing the attached python script in the guest OS, QEMU dies
  with assert failure:

  [run python script in guest root shell]
  # python a.py

  [host message]
  qemu-system-x86_64: hw/usb/dev-storage.c:445: usb_msd_handle_data: Assert=
ion `le32_to_cpu(s->csw.residue) =3D=3D 0' failed.
  Aborted (core dumped)

  =

  When I detach the kernel driver and send CBW and reattach it again, witho=
ut conforming to the command/data/status protocol, QEMU dies.
  I think this is due to misimplementation of Command/Data/Status protocol =
in Bulk-only transfer.
  This kind of assert failure can be misused by malwares to avoid being ana=
lyzed by terminating only in the virtual environments and still execute the=
 malicious code in real machines.
  Before running python script, make sure to change a.py that it should poi=
nts to usb mass storage's vid and pid.

  QEMU was running on these environment : =

  [CPU model]    Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz
  [qemu version] QEMU 2.5.0-rc2 (compiled from source, gcc 4.8.4)
  [host info]    Ubuntu 14.04.3, x86_64, 3.19.0-32-generic
  [guest info]   Ubuntu 14.04.3, x86_64, 3.19.0-28-generic
  [QEMU argument]
  x86_64-softmmu/qemu-system-x86_64 -hda /media/hdd/img/ubuntu1404.qcow2.5 \
  	-m 512 \
  	--usbdevice disk:format=3Dqcow2:../usb.img.5 \
  	--enable-kvm

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1523811/+subscriptions

