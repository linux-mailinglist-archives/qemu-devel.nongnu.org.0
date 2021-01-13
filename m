Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0274E2F533A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 20:22:57 +0100 (CET)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzljM-0007p0-Kx
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 14:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzlhQ-00074f-4X
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:20:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:42226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzlhO-0003Ml-4d
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:20:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzlhL-000443-E2
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 19:20:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 65FE02E8089
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 19:20:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Jan 2021 19:15:34 -0000
From: Peter Maydell <1862619@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: imapotato2 laurent-vivier pmaydell tebounet
X-Launchpad-Bug-Reporter: Thierry Briot (tebounet)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <158133547000.19789.14380673630783179726.malonedeb@wampee.canonical.com>
Message-Id: <161056533491.6753.4906335665463158393.malone@wampee.canonical.com>
Subject: [Bug 1862619] Re: "-serial telnet::xxxx,
 server" causes "Device 'serial0' is in use"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 2c8b10c13187b019b35ab1291e998219c1dc5772
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
Reply-To: Bug 1862619 <1862619@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes, a segfault is definitely a bug. Can you give instructions to
reproduce that (full command line, any necessary images) ? The example
originally reported in this bug doesn't seem to be a segfault.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862619

Title:
  "-serial telnet::xxxx,server" causes "Device 'serial0' is in use"

Status in QEMU:
  New

Bug description:
  I start qemu version 4.2.50 in a first terminal :

  $ sudo ./qemu-system-hppa -boot d -serial telnet::4441,server -drive
  if=3Dscsi,bus=3D0,index=3D6,file=3D./hpux.img,format=3Draw -serial mon:st=
dio -D
  /tmp/foo -nographic -m 512 -d nochain -cdrom
  ./HPUX_9.05_Installation_Disc_S700.iso -D /tmp/foo -net
  nic,model=3Dtulip  -net tap

  qemu-system-hppa: -serial telnet::4441,server: info: QEMU waiting for
  connection on: disconnected:telnet:0.0.0.0:4441,server

  In another terminal, I launch "telnet localhost 4441"

  And in the qemu window I have the following error:

  Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:220:
  qemu-system-hppa: Device 'serial0' is in use

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1862619/+subscriptions

