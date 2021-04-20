Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38319365579
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 11:34:18 +0200 (CEST)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYmlt-0000oJ-Ba
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 05:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYmip-0007bc-P6
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:31:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:48974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYmil-00069S-Bx
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:31:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYmii-0004oM-C1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 09:31:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 59D7F2E8165
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 09:31:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 09:22:57 -0000
From: Peter Maydell <1808565@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alan.jones pmaydell th-huth
X-Launchpad-Bug-Reporter: Alan Jones (alan.jones)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <154480990326.22999.12064081216456974155.malonedeb@soybean.canonical.com>
Message-Id: <161891057765.5292.242097580400785304.malone@soybean.canonical.com>
Subject: [Bug 1808565] Re: Reading /proc/self/task/<pid>/maps is not remapped
 to the target
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 78035da1cefc16c595cd3017e524e24265d371d6
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
Reply-To: Bug 1808565 <1808565@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code inspection shows we still don't handle /proc/self/task.


** Changed in: qemu
       Status: Incomplete =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1808565

Title:
  Reading /proc/self/task/<pid>/maps is not remapped to the target

Status in QEMU:
  Confirmed

Bug description:
  Seeing this in qemu-user 3.1.0

  The code in is_proc_myself which supports remapping of /proc/self/maps
  and /proc/<pid>/maps does not support remapping of
  /proc/self/task/<pid>/maps or /proc/<pid>/task/<pid>/maps. Extending
  is_proc_myself to cover these cases causes the maps to be rewritten
  correctly.

  These are useful in multithreaded programs to avoid freezing the
  entire program to capture the maps for a single tid.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1808565/+subscriptions

