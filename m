Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CE53314E9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:32:10 +0100 (CET)
Received: from localhost ([::1]:36284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJjl-0003zx-6h
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lJJKC-00058J-SK
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:05:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:60678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lJJK6-0003T8-L7
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:05:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lJJK4-0005UU-N2
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 17:05:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8B4262E8071
 for <qemu-devel@nongnu.org>; Mon,  8 Mar 2021 17:05:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Mar 2021 16:57:44 -0000
From: John Snow <1916655@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dantalion jnsnow
X-Launchpad-Bug-Reporter: Dantali0n (dantalion)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <161411327241.7209.12340035841972797663.malonedeb@gac.canonical.com>
Message-Id: <161522266439.25907.14240191478970566000.malone@wampee.canonical.com>
Subject: [Bug 1916655] Re: Compilation fails due to zstd qcow2 compression
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f41ce4c616a9df6b2066606b5a16a036a6d2f6bb"; Instance="production"
X-Launchpad-Hash: ad59f96b37fcef5c1e39eae2bf5529eae0be6e99
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
Reply-To: Bug 1916655 <1916655@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson theoretically checks for that:

meson.build:  zstd =3D dependency('libzstd', version: '>=3D1.4.0',

I suppose meson found the dependency, but the compile flags got the
wrong header. Is there something we need to fix in the build system?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916655

Title:
  Compilation fails due to zstd qcow2 compression

Status in QEMU:
  Invalid

Bug description:
  Compilation of QEMU fails when using recent versions of zstd.

  I use the following commands to compile QEMU:
  $ mkdir build
  $ cd build
  $ ../configure --enable-debug --target-list=3Dx86_64-softmmu
  $ make -j $(nproc)

  Here is a paste from the ../configure output:
  https://paste.ubuntu.com/p/dHsWzGV7TH/

  And one from the make output:
  https://paste.ubuntu.com/p/89qKk4NrFz/

  In short the error boils down to:
  ../block/qcow2-threads.c: In function =E2=80=98qcow2_zstd_compress=E2=80=
=99:
  ../block/qcow2-threads.c:225:16: error: implicit declaration of function =
=E2=80=98ZSTD_compressStream2=E2=80=99; did you mean =E2=80=98ZSTD_compress=
Stream=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    225 |     zstd_ret =3D ZSTD_compressStream2(cctx, &output, &input, ZSTD=
_e_end);
        |                ^~~~~~~~~~~~~~~~~~~~
        |                ZSTD_compressStream
  ../block/qcow2-threads.c:225:16: error: nested extern declaration of =E2=
=80=98ZSTD_compressStream2=E2=80=99 [-Werror=3Dnested-externs]
  ../block/qcow2-threads.c:225:60: error: =E2=80=98ZSTD_e_end=E2=80=99 unde=
clared (first use in this function)
    225 |     zstd_ret =3D ZSTD_compressStream2(cctx, &output, &input, ZSTD=
_e_end);
        |

  System info:
  QEMU commit: 7ef8134565dccf9186d5eabd7dbb4ecae6dead87 (from Github)
  Kernel: 5.10.15
  zstd: 1.4.8

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916655/+subscriptions

