Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFB635FDCE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 00:32:14 +0200 (CEST)
Received: from localhost ([::1]:38986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWo3Q-00040M-PI
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 18:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWo24-0002qQ-T6
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 18:30:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:53596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWo22-0000N2-NU
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 18:30:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWo20-0006Du-AK
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 22:30:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4CDF62E815F
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 22:30:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Apr 2021 22:22:42 -0000
From: Alistair Francis <1923693@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alistair2323 kallisti5
X-Launchpad-Bug-Reporter: kallisti5 (kallisti5)
X-Launchpad-Bug-Modifier: Alistair Francis (alistair2323)
References: <161836759211.17765.12297179006766447607.malonedeb@wampee.canonical.com>
Message-Id: <161843896255.29131.16312013841643505605.malone@soybean.canonical.com>
Subject: [Bug 1923693] Re: Lack of architecture in gdbstub makes debugging
 confusing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="929bdb49da44562d032228b8f93c5c598dae8678"; Instance="production"
X-Launchpad-Hash: 397fd95fd8a8182479099ca3ddefb1709dbf9a5b
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
Reply-To: Bug 1923693 <1923693@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for raising this. I have marked it as fixes as like you say it's
fixed in mainline.

** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923693

Title:
  Lack of architecture in gdbstub makes debugging confusing

Status in QEMU:
  Fix Committed

Bug description:
  I spent some quality time debugging GEF and came to a conclusion here:
  https://github.com/hugsy/gef/issues/598#issuecomment-819174169

  tldr;

  * gdb_arch_name was undefined on riscv
  * this bug was fixed recently via https://github.com/qemu/qemu/commit/edf=
647864bdab84ed4b1a4f47ea05be6bb075c69

  =

  * An undefined gdb_arch_name results in qemu's gdbstub omitting the <arch=
itecture> xml.
  * gdb translates a missing <architecture> as "auto" which breaks a lot of=
 stuff.
  * tracking down where "auto" comes from is a bit confusing and time consu=
ming.

  =

  It might be better to report a missing / blank gdb_arch_name as "<archite=
cture>unknown</architecture>" instead of omitting the block completely.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923693/+subscriptions

