Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C08367E4F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 12:04:44 +0200 (CEST)
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZWCR-0004SR-IX
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 06:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZW9R-0002zD-Kr
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 06:01:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:53552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZW9N-00038E-44
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 06:01:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZW9K-000858-Gn
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 10:01:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6B59A2E815D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 10:01:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 09:50:24 -0000
From: Peter Maydell <1847467@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: amd64
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell th-huth ylhuillier
X-Launchpad-Bug-Reporter: Yves Lhuillier (ylhuillier)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <157061690442.756.9495451631448947331.malonedeb@chaenomeles.canonical.com>
Message-Id: <161908502501.32263.7727727441577588264.malone@soybean.canonical.com>
Subject: [Bug 1847467] Re: qemu-x86_64 segment prefixes error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 762d705908a7e15db13961bac0c7ed9a64a7a9e6
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
Reply-To: Bug 1847467 <1847467@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Repro case in comment #1 still demonstrates bug.


** Changed in: qemu
       Status: Incomplete =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1847467

Title:
  qemu-x86_64 segment prefixes error

Status in QEMU:
  Confirmed

Bug description:
  qemu-x86_64 version 4.1.0 (qemu-x86_64 version 4.0.0 also have the
  issue)

  In 64-bit mode (x86_64) the DS, ES, SS or CS segment prefixes should
  be ignored; qemu-x86_64 does not ignore them.

  example: an x86_64 instructions preceded by FS DS (0x64 0x26) segment
  prefixes have the linear address of its memory reference flat-mapped
  (as if DS was in action) whereas it should be FS-mapped (offset by
  FS_base, because the DS, ES, SS or CS are just ignored).

  =

  I attach a small C++ program that shows this discrepancy.

  $ ./sample
  I'm not in QEMU

  $ qemu-x86_64 ./sample
  I'm in QEMU

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1847467/+subscriptions

