Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94925370AE4
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 11:28:00 +0200 (CEST)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld8ON-0006SO-4C
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 05:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld8M9-0005Nk-KX
 for qemu-devel@nongnu.org; Sun, 02 May 2021 05:25:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:60070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld8M7-0007n5-Hj
 for qemu-devel@nongnu.org; Sun, 02 May 2021 05:25:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ld8M4-00070A-AL
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:25:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 47E7C2E8144
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 09:25:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 09:17:41 -0000
From: Christian Schoenebeck <1785902@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: metux-its schoenebeck th-huth
X-Launchpad-Bug-Reporter: Enrico Weigelt, metux IT consult (metux-its)
X-Launchpad-Bug-Modifier: Christian Schoenebeck (schoenebeck)
References: <153367731299.17920.17499928996818370996.malonedeb@soybean.canonical.com>
Message-Id: <161994706177.10342.9346433961413968232.malone@gac.canonical.com>
Subject: [Bug 1785902] Re: local/9pfs: Too many levels of symbolic links
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: ee84d64aa601c1814ee518d6805a769d55f3a746
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
Reply-To: Bug 1785902 <1785902@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enrico, with security_model=3Dmapped (a.k.a. security_model=3Dmapped-xattr)
9p is not following symlinks on host. That's the expected behaviour.

There are 2 distinct models:

security_model=3Dpassthrough uses the ownership information, permissions
and symlink info etc. directly from the host's file system. This model
requires the qemu binary to run as high privileged user (i.e. root)
though, because it needs to be able to change file ownership,
permissions and so forth. For that reason this model is only appropriate
for use cases where there is a certain trust to what the guest system is
doing. E.g. this model is commonly used by kernel coders to build
kernel/driver code on host and then test run it as guest.

For untrusted guests (i.e. most cases) it is recommended to use
security_model=3Dmapped-xattr instead. In this mode all ownership
information, permissions, etc. are emulated (i.e. mapped) by storing
them as extended attributes on top of files on host. This way the qemu
binary can run with a regular (unprivileged) user and pretend to host it
would have all rights to change ownership and permissions.

You can read more details about this in the 9p developer description about =
the 9p 'local' driver here:
https://wiki.qemu.org/Documentation/9p#9p_Filesystem_Drivers

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1785902

Title:
  local/9pfs: Too many levels of symbolic links

Status in QEMU:
  Incomplete

Bug description:
  Version: 2.9.1

  The primary symptom is resolving symlink fails w/ error "too many
  levels of symbolic links".

  My analysis showed that local_readlink() uses local_open_nofollow() to
  open the file and then tries to read it. local_open_nofollow() then
  tries to open the file w/ O_NOFOLLOW, which obviously fails if the
  requested file is a symlink.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1785902/+subscriptions

