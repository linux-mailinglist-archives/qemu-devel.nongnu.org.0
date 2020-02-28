Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A75173392
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 10:16:26 +0100 (CET)
Received: from localhost ([::1]:43940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7bkv-000302-Ed
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 04:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49339)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j7bkB-0002Yd-Hm
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:15:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j7bkA-0006bV-6o
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:15:39 -0500
Received: from indium.canonical.com ([91.189.90.7]:45046)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j7bk9-0006b4-Vx
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:15:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j7bk8-0007R1-Fb
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 09:15:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6D31D2E8073
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 09:15:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Feb 2020 09:07:53 -0000
From: Olaf Seibert <1865048@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: oseibert-sys11 xanclic
X-Launchpad-Bug-Reporter: Olaf Seibert (oseibert-sys11)
X-Launchpad-Bug-Modifier: Olaf Seibert (oseibert-sys11)
References: <158281763694.13572.4793000469968260846.malonedeb@gac.canonical.com>
Message-Id: <158288087335.13901.4198281883735897716.malone@gac.canonical.com>
Subject: [Bug 1865048] Re: qemu-img --force-share does not disable file locking
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9eff1c37c1740693bdcba94d8f8c608164af5689";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: dc466c9ebb3d19774221d188632f3d89c732e6f8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1865048 <1865048@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Maz,

thanks for the information!

The situation we're in is where we are suspecting the file locking on a
shared network file system to be broken, so we were looking for ways to
avoid any locking. I had tried some variations on your image-opts style
invocation, but did not find any variant where the automatic file format
detection would be preserved. For instance, with --image-opts
driver=3Dfile,filename=3Dfoo.qcow2,locking=3Doff it would think the file is
raw. But the one you give seems to do what I want to experiment with, so
thanks again!

-Olaf.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865048

Title:
  qemu-img --force-share does not disable file locking

Status in QEMU:
  Invalid

Bug description:
  The new option "--force-share" for qemu-img does not disable file
  locking.

  I tried it with version qemu-img version 2.11.1(Debian 1:2.11+dfsg-
  1ubuntu7.21~cloud0) and I traced the source code of the current git
  trunk.

  Sample to demonstrate:

  # strace qemu-img info --force-share testfile.qcow2   2>&1 | grep F_RDLCK
  fcntl(11, F_OFD_SETLK, {l_type=3DF_RDLCK, l_whence=3DSEEK_SET, l_start=3D=
100, l_len=3D1}) =3D 0
  fcntl(11, F_OFD_SETLK, {l_type=3DF_RDLCK, l_whence=3DSEEK_SET, l_start=3D=
100, l_len=3D1}) =3D 0
  fcntl(11, F_OFD_SETLK, {l_type=3DF_RDLCK, l_whence=3DSEEK_SET, l_start=3D=
100, l_len=3D1}) =3D 0
  fcntl(11, F_OFD_SETLK, {l_type=3DF_RDLCK, l_whence=3DSEEK_SET, l_start=3D=
100, l_len=3D1}) =3D 0
  fcntl(11, F_OFD_SETLK, {l_type=3DF_RDLCK, l_whence=3DSEEK_SET, l_start=3D=
100, l_len=3D1}) =3D 0
  fcntl(11, F_OFD_SETLK, {l_type=3DF_RDLCK, l_whence=3DSEEK_SET, l_start=3D=
100, l_len=3D1}) =3D 0
  fcntl(11, F_OFD_SETLK, {l_type=3DF_RDLCK, l_whence=3DSEEK_SET, l_start=3D=
100, l_len=3D1}) =3D 0
  fcntl(11, F_OFD_SETLK, {l_type=3DF_RDLCK, l_whence=3DSEEK_SET, l_start=3D=
100, l_len=3D1}) =3D 0
  fcntl(11, F_OFD_SETLK, {l_type=3DF_RDLCK, l_whence=3DSEEK_SET, l_start=3D=
100, l_len=3D1}) =3D 0

  I traced the passing of the --force-share option through the source
  code (I used commit 6c599282f8 as of Mon Feb 17 13:32:25 2020 +0000)

  qemu-img.c:img_info()
          force_share =3D true;
  qemu-img.c:collect_image_info_list(force_share)
  qemu-img.c:img_open(force_share)
  qemu-img.c:img_open_file(force_share)
          qdict_put_bool(options, BDRV_OPT_FORCE_SHARE, true);
  block/block-backend.c:blk_new_open(options)
  block.c:bdrv_open(options)
  block.c:bdrv_open_inheritoptions()
  block.c:bdrv_open_common(options)
          bs->force_share =3D qemu_opt_get_bool(opts, BDRV_OPT_FORCE_SHARE,=
 false);
  block.c:bdrv_open_driver(bs)
  include/block/block_int.h:int (*bdrv_file_open)(BlockDriverState *bs, QDi=
ct *options, int flags,
  block/file-posix.c:.bdrv_file_open =3D raw_open,
  block/file-posix.c:raw_open_common(bs)
          locking =3D qapi_enum_parse(&OnOffAuto_lookup,
                                qemu_opt_get(opts, "locking"),
                                ON_OFF_AUTO_AUTO, &local_err);
          ignoring bs->force_share

  At the end, bs->force_share is ignored in determining the locking
  value.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865048/+subscriptions

