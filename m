Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683111C750A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 17:36:37 +0200 (CEST)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWM67-0005Rt-U0
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 11:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWM56-000511-RS
 for qemu-devel@nongnu.org; Wed, 06 May 2020 11:35:32 -0400
Received: from indium.canonical.com ([91.189.90.7]:44814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWM55-0001LG-R3
 for qemu-devel@nongnu.org; Wed, 06 May 2020 11:35:32 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jWM52-0005Io-Oy
 for <qemu-devel@nongnu.org>; Wed, 06 May 2020 15:35:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BA1112E8113
 for <qemu-devel@nongnu.org>; Wed,  6 May 2020 15:35:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 May 2020 15:21:42 -0000
From: Edward Vielmetti <edward.vielmetti@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: edward-vielmetti
X-Launchpad-Bug-Reporter: Edward Vielmetti (edward-vielmetti)
X-Launchpad-Bug-Modifier: Edward Vielmetti (edward-vielmetti)
Message-Id: <158877850307.3759.8884625915619239747.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1877137] [NEW] 32-bit Arm emulation spins at 100% during emacs
 build
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: add5a6ceebf72c42b35177ba6a2f30bef104dc7c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 08:46:02
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1877137 <1877137@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

This test case exposes a QEMU bug when crossbuilding to arm32. The bug is o=
nly
exposed on amd64 architecture or aarch64 hosts that can *only* execute
64 bit applications.

Usage:

./setup.sh # installs docker and tweaks sysctl
./qemu.sh # register qemu so you are able to run containers from other
architectures
./build.sh # try to build the docker image. Process should get stuck
in a 100% CPU loop after a while

Originally reported by, and test case developed by,
Philippe Vaucher.

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "scripts to reproduce bug"
   https://bugs.launchpad.net/bugs/1877137/+attachment/5367408/+files/qemu-=
bug.tar.gz

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877137

Title:
  32-bit Arm emulation spins at 100% during emacs build

Status in QEMU:
  New

Bug description:
  This test case exposes a QEMU bug when crossbuilding to arm32. The bug is=
 only
  exposed on amd64 architecture or aarch64 hosts that can *only* execute
  64 bit applications.

  Usage:

  ./setup.sh # installs docker and tweaks sysctl
  ./qemu.sh # register qemu so you are able to run containers from other
  architectures
  ./build.sh # try to build the docker image. Process should get stuck
  in a 100% CPU loop after a while

  Originally reported by, and test case developed by,
  Philippe Vaucher.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877137/+subscriptions

