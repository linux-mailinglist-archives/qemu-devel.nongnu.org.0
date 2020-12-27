Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3862E30A4
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 10:51:47 +0100 (CET)
Received: from localhost ([::1]:55894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktSiI-0000pm-0o
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 04:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ktShD-0000J3-VM
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 04:50:39 -0500
Received: from indium.canonical.com ([91.189.90.7]:42546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ktShB-0001u1-NH
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 04:50:39 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ktSh9-000863-IN
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 09:50:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 800522E8058
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 09:50:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Dec 2020 09:41:04 -0000
From: Pawel Juszczyk <1909392@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: faust1002
X-Launchpad-Bug-Reporter: Pawel Juszczyk (faust1002)
X-Launchpad-Bug-Modifier: Pawel Juszczyk (faust1002)
Message-Id: <160906206462.3532.14301931036322231609.malonedeb@wampee.canonical.com>
Subject: [Bug 1909392] [NEW] qemu-arm crashes (SIGSEGV) when executing push
 instruction
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: a8e7505d7d13fa722c030b52064517bb3b1fc48e
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
Reply-To: Bug 1909392 <1909392@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Dear all,
I am afraid I found a problem, it seems like qemu-arm crashes when executin=
g assembly push instruction.
I use qemu version 5.2.0, but it checked an older version (4.2.1) and the p=
roblem was also present. I start qemu using "qemu-arm -cpu cortex-m4 -singl=
estep -g 1234 <path to elf file>"
Callstack before crash (host)
#0  0x000055555575961f in stl_he_p (ptr=3D0x2002fffc, v=3D0) at /home/faust=
1002/Programming/qemu/qemu-5.2.0/include/qemu/bswap.h:353
#1  0x0000555555759716 in stl_le_p (ptr=3D0x2002fffc, v=3D0) at /home/faust=
1002/Programming/qemu/qemu-5.2.0/include/qemu/bswap.h:395
#2  0x000055555575d3c3 in tcg_qemu_tb_exec (env=3D0x555555d28050, tb_ptr=3D=
0x7fffe800010a "\r\b") at ../tcg/tci.c:1221
#3  0x00005555556bd982 in cpu_tb_exec (cpu=3D0x555555d1fd70, itb=3D0x7fffe8=
000000) at ../accel/tcg/cpu-exec.c:178
#4  0x00005555556be57e in cpu_loop_exec_tb (cpu=3D0x555555d1fd70, tb=3D0x7f=
ffe8000000, last_tb=3D0x7fffffffd8a8, tb_exit=3D0x7fffffffd8a0) at ../accel=
/tcg/cpu-exec.c:658
#5  0x00005555556be7ea in cpu_exec (cpu=3D0x555555d1fd70) at ../accel/tcg/c=
pu-exec.c:771
#6  0x000055555560af1d in cpu_loop (env=3D0x555555d28050) at ../linux-user/=
arm/cpu_loop.c:237
#7  0x00005555557415a7 in main (argc=3D7, argv=3D0x7fffffffe0f8, envp=3D0x7=
fffffffe138) at ../linux-user/main.c:861
Callstack before crash (target)
Program received signal SIGSEGV, Segmentation fault.
Reset_Handler () at startup.s:48
48        push {r14}
Please find the elf file I use attached.
Kind regards

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "test_binary.elf"
   https://bugs.launchpad.net/bugs/1909392/+attachment/5447174/+files/test_=
binary.elf

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909392

Title:
  qemu-arm crashes (SIGSEGV) when executing push instruction

Status in QEMU:
  New

Bug description:
  Dear all,
  I am afraid I found a problem, it seems like qemu-arm crashes when execut=
ing assembly push instruction.
  I use qemu version 5.2.0, but it checked an older version (4.2.1) and the=
 problem was also present. I start qemu using "qemu-arm -cpu cortex-m4 -sin=
glestep -g 1234 <path to elf file>"
  Callstack before crash (host)
  #0  0x000055555575961f in stl_he_p (ptr=3D0x2002fffc, v=3D0) at /home/fau=
st1002/Programming/qemu/qemu-5.2.0/include/qemu/bswap.h:353
  #1  0x0000555555759716 in stl_le_p (ptr=3D0x2002fffc, v=3D0) at /home/fau=
st1002/Programming/qemu/qemu-5.2.0/include/qemu/bswap.h:395
  #2  0x000055555575d3c3 in tcg_qemu_tb_exec (env=3D0x555555d28050, tb_ptr=
=3D0x7fffe800010a "\r\b") at ../tcg/tci.c:1221
  #3  0x00005555556bd982 in cpu_tb_exec (cpu=3D0x555555d1fd70, itb=3D0x7fff=
e8000000) at ../accel/tcg/cpu-exec.c:178
  #4  0x00005555556be57e in cpu_loop_exec_tb (cpu=3D0x555555d1fd70, tb=3D0x=
7fffe8000000, last_tb=3D0x7fffffffd8a8, tb_exit=3D0x7fffffffd8a0) at ../acc=
el/tcg/cpu-exec.c:658
  #5  0x00005555556be7ea in cpu_exec (cpu=3D0x555555d1fd70) at ../accel/tcg=
/cpu-exec.c:771
  #6  0x000055555560af1d in cpu_loop (env=3D0x555555d28050) at ../linux-use=
r/arm/cpu_loop.c:237
  #7  0x00005555557415a7 in main (argc=3D7, argv=3D0x7fffffffe0f8, envp=3D0=
x7fffffffe138) at ../linux-user/main.c:861
  Callstack before crash (target)
  Program received signal SIGSEGV, Segmentation fault.
  Reset_Handler () at startup.s:48
  48        push {r14}
  Please find the elf file I use attached.
  Kind regards

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909392/+subscriptions

