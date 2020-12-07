Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4672D17ED
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:55:26 +0100 (CET)
Received: from localhost ([::1]:55018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKjN-00083X-Ri
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kmKet-0004NC-SC
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:50:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:33456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kmKep-0002fU-Tu
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:50:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kmKem-0004dB-P4
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 17:50:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B72152E813B
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 17:50:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Dec 2020 17:41:46 -0000
From: Olaf Seibert <1905979@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: oseibert-sys11
X-Launchpad-Bug-Reporter: Olaf Seibert (oseibert-sys11)
X-Launchpad-Bug-Modifier: Olaf Seibert (oseibert-sys11)
References: <160648885405.8173.13759191424779303608.malonedeb@soybean.canonical.com>
Message-Id: <160736290639.6163.8738690280189805892.malone@gac.canonical.com>
Subject: [Bug 1905979] Re: Check if F_OFD_SETLK is supported may give wrong
 result
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: db585e16301917e2749830e3c5ab14324d776eda
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
Reply-To: Bug 1905979 <1905979@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is rather serious, since it causes VMs to crash:

Unexpected error in raw_check_lock_bytes() at /build/qemu-PKI6mj/qemu-4.2/b=
lock/file-posix.c:796:
Failed to get "write" lock
2020-11-23 11:32:27.810+0000: shutting down, reason=3Dcrashed

when openstack attempts to create a snapshot.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905979

Title:
  Check if F_OFD_SETLK is supported may give wrong result

Status in QEMU:
  New

Bug description:
  In util/osdep.c there is a function qemu_probe_lock_ops() to check if
  file locks F_OFD_SETLK and F_OFD_GETLK (of the style "Open file
  description locks (non-POSIX)") are supported.

  This test is done by trying a lock operation on the file /dev/null.

  This test can get a wrong result.

  The result is (probably) if the operating system *in general* supports
  these locks. However, it does not guarantee that the file system where
  the lock is really wanted (for instance, in caller
  raw_check_lock_bytes() in block/file-posix.c) does support these
  locks.

  (In theory it could even be that /dev/null, being a device special
  file, does not support the lock type while a plain file would.)

  This is in particular relevant for disk images which are stored on a
  shared file system (my particular use case is the Quobyte file system,
  which appears not to support these locks).

  The code as mentioned above is present in the master branch (I checked
  commit ea8208249d1082eae0444934efb3b59cd3183f05) but also for example
  on stable-2.11 commit 0982a56a551556c704dc15752dabf57b4be1c640)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905979/+subscriptions

