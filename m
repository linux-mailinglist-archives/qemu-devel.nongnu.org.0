Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C633F2AC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:32:32 +0100 (CET)
Received: from localhost ([::1]:51828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXDr-000860-Rt
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lMXCG-00072S-0s
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:30:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:54490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lMXCD-0003au-8V
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:30:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lMXCB-0006wS-8S
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 14:30:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3E7DB2E815B
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 14:30:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Mar 2021 14:20:06 -0000
From: Thorsten Glaser <1891748@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=charms; sourcepackage=None; component=None;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dilfridge ech1965 mdevaev mirabilos rth th-huth
 tsp84
X-Launchpad-Bug-Reporter: Ech (ech1965)
X-Launchpad-Bug-Modifier: Thorsten Glaser (mirabilos)
References: <159749143652.14755.7473614939867617680.malonedeb@gac.canonical.com>
Message-Id: <161599080693.2473.14096966291013218120.malone@chaenomeles.canonical.com>
Subject: [Bug 1891748] Re: qemu-arm-static 5.1 can't run gcc
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d4fcb062545ed29d3cd7773e52e43615e042623f"; Instance="production"
X-Launchpad-Hash: c1c77514892ec94997db92bfa6d89bf7e41cf364
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
Reply-To: Bug 1891748 <1891748@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$ qemu-arm --version
qemu-arm version 5.2.0 (Debian 1:5.2+dfsg-6)
Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

I=E2=80=99m seeing this error on a totally different file:

I=E2=80=99ve made a short test program (hello world-ish) and compiled it wi=
th
the OpenWrt toolchain but added -static so I can run it on the host
using qemu-user-arm:

$ STAGING_DIR=3D$PWD/staging_dir PATH=3Dstaging_dir/toolchain-arm_cortex-a1=
5+neon-vfpv4_gcc-7.5.0_musl_eabi/bin:$PATH arm-openwrt-linux-muslgnueabi-gc=
c -Os -pipe -g3 -fno-caller-saves -fno-plt -fhonour-copts -mfloat-abi=3Dhar=
d -fstack-protector -D_FORTIFY_SOURCE=3D1 -Wl,-z,now -Wl,-z,relro -static x=
.c
$ ./a.out =

Allocating guest commpage: Operation not permitted

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1891748

Title:
  qemu-arm-static 5.1 can't run gcc

Status in QEMU:
  Fix Released
Status in Juju Charms Collection:
  New

Bug description:
  Issue discovered while trying to build pikvm (1)

  Long story short: when using qemu-arm-static 5.1, gcc exits whith
  message:

  Allocating guest commpage: Operation not permitted

  =

  when using qemu-arm-static v5.0, gcc "works"

  Steps to reproduce will follow

  (1)  https://github.com/pikvm/pikvm/blob/master/pages/building_os.md

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1891748/+subscriptions

