Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E8139047A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:02:40 +0200 (CEST)
Received: from localhost ([::1]:49426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYZq-0000Sz-9N
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llYYB-00088L-KK
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:00:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:49462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1llYY8-0002Zt-VA
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:00:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llYY6-0005Np-97
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:00:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 437AB2E8186
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:00:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 May 2021 14:51:07 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <1896298@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee mslade th-huth
X-Launchpad-Bug-Reporter: Michael Slade (mslade)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <160046874518.13612.4861858859499751315.malonedeb@gac.canonical.com>
Message-Id: <162195426790.4432.9270067480094392796.malone@soybean.canonical.com>
Subject: [Bug 1896298] Re: TCG memory leak with FreeDOS 'edit'
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="30919b71da718d7d3f6b69e715e9fe95f7c3c5de"; Instance="production"
X-Launchpad-Hash: 3fa464ce238068b0ce0475729a39dc3bfe915703
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
Reply-To: Bug 1896298 <1896298@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just to repeat the work around discussed on the GitLab page: -accel tcg
,tb-size=3D32 will prevent the rapid increase of memory due to self
modifying code.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1896298

Title:
  TCG memory leak with FreeDOS 'edit'

Status in QEMU:
  Expired

Bug description:
  qemu trunk as of today leaks memory FAST when freedos' edit is
  running.

  To reproduce, download:

  https://www.ibiblio.org/pub/micro/pc-
  stuff/freedos/files/repositories/1.3/cdrom.iso

  Then run:

  $ qemu-system-i386 -cdrom cdrom.iso

  select your language then select "return to DOS", then type

  > edit

  it will consume memory at ~10MB/s

  This does NOT happen when adding -enable-kvm

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1896298/+subscriptions

