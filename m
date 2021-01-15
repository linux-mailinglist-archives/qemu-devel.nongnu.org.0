Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF57D2F80E0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 17:36:11 +0100 (CET)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0S54-0001Ns-Ge
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 11:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0RvF-00016K-Pu
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:26:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:50466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l0RvE-0002Il-4K
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:26:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0RvC-0004yW-Gu
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 16:25:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5E06C2E813C
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 16:25:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 Jan 2021 16:17:07 -0000
From: Peter Maydell <1901532@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cwmyung
X-Launchpad-Bug-Reporter: Cheol-Woo,Myung (cwmyung)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160371197903.29636.2526014342409272320.malonedeb@chaenomeles.canonical.com>
Message-Id: <161072742777.23174.15501785235647531910.launchpad@soybean.canonical.com>
Subject: [Bug 1901532] Re: Assertion failure `mr != NULL' failed through
 usb-ehci
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 5a0ec2f56b572c5b8f64abe0797677e12d054b6d
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
Reply-To: Bug 1901532 <1901532@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: fuzzer

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1901532

Title:
  Assertion failure `mr !=3D NULL' failed through usb-ehci

Status in QEMU:
  Confirmed

Bug description:
  Hello,

  Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
  usb-ehci.

  This was found in version 5.0.1 (stable-5.0).

  --------

  qemu-system-i386: src/qemu-repro/exec.c:3581: address_space_unmap: Assert=
ion `mr !=3D NULL' failed.
  [1]    14721 abort      src/qemu-repro/build/i386-softmmu/qemu-system-i386

  =

  To reproduce the assertion failure, please run the QEMU with following co=
mmand line.

  ```
  $ qemu-system-i386 -drive file=3D./hyfuzz.img,index=3D0,media=3Ddisk,form=
at=3Draw -m 512 -drive if=3Dnone,id=3Dstick,file=3D./usbdisk.img -device us=
b-ehci,id=3Dehci -device usb-storage,bus=3Dehci.0,drive=3Dstick
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1901532/+subscriptions

