Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4412C2EB3AB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 20:52:14 +0100 (CET)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwsNJ-00021O-CI
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 14:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kwsMF-0001ZK-Bn
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:51:07 -0500
Received: from indium.canonical.com ([91.189.90.7]:49416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kwsM9-0000ZV-KN
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:51:07 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kwsM5-000715-9h
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 19:50:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0B5952E813B
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 19:50:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 05 Jan 2021 19:42:21 -0000
From: Matevz Langus <1779634@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: matevz-langus pmaydell yihe01
X-Launchpad-Bug-Reporter: He Yi (yihe01)
X-Launchpad-Bug-Modifier: Matevz Langus (matevz-langus)
References: <153052346519.30029.15773821079672320069.malonedeb@wampee.canonical.com>
Message-Id: <160987574123.3872.9791485793510570120.malone@wampee.canonical.com>
Subject: [Bug 1779634] Re: qemu-x86_64 on aarch64 reports "Synchronous
 External Abort"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: ffc48b50c93a7e20f2eda543b6d3d6649861fce2
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
Reply-To: Bug 1779634 <1779634@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

if of interest to anyone...
we were able to successfully upgrade firmware of Intel XL710 on aarch64 pla=
tform.

Two major items were required:
- small qemu change: https://lists.gnu.org/archive/html/qemu-devel/2021-01/=
msg00553.html
- hack in Linux kernel /dev/mem driver in mmap function to catch wrong addr=
esses nvmupdate64e asked for thru qemu. For some reason only lower 32-bit p=
ortion of actual physical address came to linux kernel. /dev/mem driver in =
kernel was changed to add missing upper 32 bits of address

best regards,
Matevz

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1779634

Title:
  qemu-x86_64 on aarch64 reports "Synchronous External Abort"

Status in QEMU:
  Invalid

Bug description:
  Purpose: to run x86_64 utilities on aarch64 platform (Intel/Dell network =
adapters' firmware upgrade tools)
  System: aarch64 server platform, with ubuntu 16.04 (xenial) Linux 4.13.0-=
45-generic #50~16.04.1-Ubuntu SMP Wed May 30 11:14:25 UTC 2018 aarch64 aarc=
h64 aarch64 GNU/Linux

  Reproduce:
  1) build linux-user qemu-x86_64 static from source (tried both version 2.=
12.0 & 2.11.2)
  =C2=A0=C2=A0=C2=A0./configure --target-list=3Dx86_64-linux-user --disable=
-system --static --enable-linux-user

  2) install the interpreter into binfmt_misc filesystem
  =C2=A0=C2=A0=C2=A0$ cat /proc/sys/fs/binfmt_misc/qemu-x86_64
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enabled
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0interpreter /usr/local/bin/qemu-x86_64
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flags:
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0offset 0
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0magic 7f454c4602010100000000000000000002003=
e00
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mask fffffffffffefefcfffffffffffffffffeffff=
ff

  3) packaging Intel/Dell upgrade utilities into docker images, I've publis=
hed two on docker hub:
  =C2=A0=C2=A0=C2=A0REPOSITORY          TAG
  =C2=A0=C2=A0=C2=A0heyi/dellupdate     latest
  =C2=A0=C2=A0=C2=A0heyi/nvmupdate64e   latest

  4) run the docker container on aarch64 server platform:
  =C2=A0=C2=A0=C2=A0docker run -it --privileged --network host --volume /us=
r/local/bin/qemu-x86_64:/usr/local/bin/qemu-x86_64 heyi/dellupdate:latest

  5) finally, within docker container run the upgrade tool:
  =C2=A0=C2=A0=C2=A0# ./Network_Firmware_T6VN9_LN_18.5.17_A00.BIN

  Errors: in dmesg it reports excessive 'Synchronous External Abort':

  kernel: [242850.159893] Synchronous External Abort: synchronous external =
abort (0x92000610) at 0x0000000000429958
  kernel: [242850.169199] Unhandled fault: synchronous external abort (0x92=
000610) at 0x0000000000429958

  thanks and best regards, Yi

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1779634/+subscriptions

