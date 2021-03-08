Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6ED330659
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 04:27:03 +0100 (CET)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ6Xt-0000By-LP
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 22:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lJ6WY-0008Cy-QF
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:25:38 -0500
Received: from indium.canonical.com ([91.189.90.7]:39408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lJ6WX-0004zS-1a
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:25:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lJ6WU-0003nY-EF
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:25:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6ADD42E815A
 for <qemu-devel@nongnu.org>; Mon,  8 Mar 2021 03:25:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Mar 2021 03:15:57 -0000
From: Eddy Hahn <1918084@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eddyh
X-Launchpad-Bug-Reporter: Eddy Hahn (eddyh)
X-Launchpad-Bug-Modifier: Eddy Hahn (eddyh)
Message-Id: <161517335801.3660.13243926426355834161.malonedeb@soybean.canonical.com>
Subject: [Bug 1918084] [NEW] Build fails on macOS 11.2.2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fc09074b06b3b9178bd28175bdab646b3b5abfce"; Instance="production"
X-Launchpad-Hash: 26e801d7e8980f50875a9478ece0a21c313ed7ce
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1918084 <1918084@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi,

I got the latest version from git. I have pre-compiled the dependency
libraries. All good. configure creates the necessary files. When I build
I got the following error:

[1368/6454] Compiling C object libcapstone.a.p/capstone_arch_AArch64_AArch6=
4InstPrinter.c.o
ninja: build stopped: subcommand failed.
make[1]: *** [run-ninja] Error 1
make: *** [all] Error 2

I've ran make as make -j 8

original config:

PKG_CONFIG_PATH=3D"$SERVERPLUS_DIR/dependencies/glib/lib/pkgconfig:$SERVERP=
LUS_DIR/dependencies/pixman/lib/pkgconfig:$SERVERPLUS_DIR/dependencies
/cyrus-sasl/lib/pkgconfig" ./configure --prefix=3D"$SERVERPLUS_DIR"
--enable-hvf --enable-cocoa --enable-vnc-sasl --enable-auth-pam
--ninja=3D/opt/build/build/stage/tools/ninja/ninja
--python=3D"$SERVERPLUS_DIR/dependencies/python/bin/python3" --enable-bsd-
user

if I build with --target-list=3Dx86_64-softmmu then it will build but I
will get only the x86_64 QEMU built. With 5.0 I could build all
emulators.

$SERVERPLUS_DIR is my target dir.

Thanks,

Eddy

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918084

Title:
  Build fails on macOS 11.2.2

Status in QEMU:
  New

Bug description:
  Hi,

  I got the latest version from git. I have pre-compiled the dependency
  libraries. All good. configure creates the necessary files. When I
  build I got the following error:

  [1368/6454] Compiling C object libcapstone.a.p/capstone_arch_AArch64_AArc=
h64InstPrinter.c.o
  ninja: build stopped: subcommand failed.
  make[1]: *** [run-ninja] Error 1
  make: *** [all] Error 2

  I've ran make as make -j 8

  original config:

  PKG_CONFIG_PATH=3D"$SERVERPLUS_DIR/dependencies/glib/lib/pkgconfig:$SERVE=
RPLUS_DIR/dependencies/pixman/lib/pkgconfig:$SERVERPLUS_DIR/dependencies
  /cyrus-sasl/lib/pkgconfig" ./configure --prefix=3D"$SERVERPLUS_DIR"
  --enable-hvf --enable-cocoa --enable-vnc-sasl --enable-auth-pam
  --ninja=3D/opt/build/build/stage/tools/ninja/ninja
  --python=3D"$SERVERPLUS_DIR/dependencies/python/bin/python3" --enable-
  bsd-user

  if I build with --target-list=3Dx86_64-softmmu then it will build but I
  will get only the x86_64 QEMU built. With 5.0 I could build all
  emulators.

  $SERVERPLUS_DIR is my target dir.

  Thanks,

  Eddy

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918084/+subscriptions

