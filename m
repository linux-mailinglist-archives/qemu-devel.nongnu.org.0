Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036912B56B1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 03:22:16 +0100 (CET)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keqdK-0007o5-Io
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 21:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keqbr-0007Ld-DZ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 21:20:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:52298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1keqbp-0000BZ-1t
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 21:20:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1keqbl-0008GQ-DG
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 02:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5B1442E80EA
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 02:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2020 02:15:23 -0000
From: yuanjungong <1904486@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: yjruc
X-Launchpad-Bug-Reporter: yuanjungong (yjruc)
X-Launchpad-Bug-Modifier: yuanjungong (yjruc)
Message-Id: <160557932327.14164.11613670931205353723.malonedeb@soybean.canonical.com>
Subject: [Bug 1904486] [NEW] resource leak in /net/tap.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 896bfbcbb257041f733b756f739816967d69c0e8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 21:20:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1904486 <1904486@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi,there might be a resource leak in function net_init_tap in
/net/tap.c.

 811         fd =3D monitor_fd_param(monitor_cur(), tap->fd, errp);
 812         if (fd =3D=3D -1) {
 813             return -1;
 814         }
 815 =

 816         ret =3D qemu_try_set_nonblock(fd);
 817         if (ret < 0) {
 818             error_setg_errno(errp, -ret, "%s: Can't use file descripto=
r %d",
 819                              name, fd);
 820             return -1;
 821         }
 822 =

 823         vnet_hdr =3D tap_probe_vnet_hdr(fd, errp);
 824         if (vnet_hdr < 0) {
 825             close(fd);
 826             return -1;
 827         }
 828 =

 829         net_init_tap_one(tap, peer, "tap", name, NULL,
 830                          script, downscript,
 831                          vhostfdname, vnet_hdr, fd, &err);
 832         if (err) {
 833             error_propagate(errp, err);
 834             return -1;
 835         }

fd should be closed before return in line 820 and line 834, similar to
the implementation in line 825.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904486

Title:
  resource leak in /net/tap.c

Status in QEMU:
  New

Bug description:
  Hi,there might be a resource leak in function net_init_tap in
  /net/tap.c.

   811         fd =3D monitor_fd_param(monitor_cur(), tap->fd, errp);
   812         if (fd =3D=3D -1) {
   813             return -1;
   814         }
   815 =

   816         ret =3D qemu_try_set_nonblock(fd);
   817         if (ret < 0) {
   818             error_setg_errno(errp, -ret, "%s: Can't use file descrip=
tor %d",
   819                              name, fd);
   820             return -1;
   821         }
   822 =

   823         vnet_hdr =3D tap_probe_vnet_hdr(fd, errp);
   824         if (vnet_hdr < 0) {
   825             close(fd);
   826             return -1;
   827         }
   828 =

   829         net_init_tap_one(tap, peer, "tap", name, NULL,
   830                          script, downscript,
   831                          vhostfdname, vnet_hdr, fd, &err);
   832         if (err) {
   833             error_propagate(errp, err);
   834             return -1;
   835         }

  fd should be closed before return in line 820 and line 834, similar to
  the implementation in line 825.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904486/+subscriptions

