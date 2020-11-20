Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56602BA037
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 03:12:18 +0100 (CET)
Received: from localhost ([::1]:39440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfvuL-0006Fv-Ek
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 21:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfvsw-0005RZ-C1
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 21:10:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:55716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfvsu-00033e-5c
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 21:10:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfvss-00085N-6x
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 02:10:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 311322E804A
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 02:10:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2020 01:57:17 -0000
From: Alex Chen <1904486@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: yjruc zdchen
X-Launchpad-Bug-Reporter: yuanjungong (yjruc)
X-Launchpad-Bug-Modifier: Alex Chen (zdchen)
References: <160557932327.14164.11613670931205353723.malonedeb@soybean.canonical.com>
Message-Id: <160583743808.31631.13400202315769081725.malone@soybean.canonical.com>
Subject: [Bug 1904486] Re: resource leak in /net/tap.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: e1a5ad7f0d1e576cdf144c11c6269f2ae469786d
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
Reply-To: Bug 1904486 <1904486@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi yuanjungong,

If you don't have time to submit a patch, can I submit a patch to fix
it?

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
  /net/tap.c. The version is 5.1.91.

  =

  =C2=A0811         fd =3D monitor_fd_param(monitor_cur(), tap->fd, errp);
  =C2=A0812         if (fd =3D=3D -1) {
  =C2=A0813             return -1;
  =C2=A0814         }
  =C2=A0815
  =C2=A0816         ret =3D qemu_try_set_nonblock(fd);
  =C2=A0817         if (ret < 0) {
  =C2=A0818             error_setg_errno(errp, -ret, "%s: Can't use file de=
scriptor %d",
  =C2=A0819                              name, fd);
  =C2=A0820             return -1;
  =C2=A0821         }
  =C2=A0822
  =C2=A0823         vnet_hdr =3D tap_probe_vnet_hdr(fd, errp);
  =C2=A0824         if (vnet_hdr < 0) {
  =C2=A0825             close(fd);
  =C2=A0826             return -1;
  =C2=A0827         }
  =C2=A0828
  =C2=A0829         net_init_tap_one(tap, peer, "tap", name, NULL,
  =C2=A0830                          script, downscript,
  =C2=A0831                          vhostfdname, vnet_hdr, fd, &err);
  =C2=A0832         if (err) {
  =C2=A0833             error_propagate(errp, err);
  =C2=A0834             return -1;
  =C2=A0835         }

  fd should be closed before return in line 820 and line 834, similar to
  the implementation in line 825.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904486/+subscriptions

