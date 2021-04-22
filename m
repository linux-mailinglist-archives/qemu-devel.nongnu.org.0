Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C295E367958
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:36:51 +0200 (CEST)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZS1C-0007an-Ox
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRzD-0006aK-NG
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:34:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:51118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRzC-0004l5-4V
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:34:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZRzA-0003KS-Pv
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:34:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B3A562E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:34:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:22:17 -0000
From: Thomas Huth <1624896@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cdcs th-huth
X-Launchpad-Bug-Reporter: =?utf-8?b?Q2zDoXVkaW8gU2lsdmEgKGNkY3Mp?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160918160752.2242.30024.malonedeb@soybean.canonical.com>
Message-Id: <161906893852.6464.10448933671247035784.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1624896] Re: [PPC] SegFault due to Stack Overflow in E500
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 9232fd4b98a77f43a79e7b685ef58f9ca5a9b90f
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
Reply-To: Bug 1624896 <1624896@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1624896

Title:
  [PPC] SegFault due to Stack Overflow in E500

Status in QEMU:
  Incomplete

Bug description:
  =

  I am getting a Segmentation Fault while simulating a PowerPC e500. I've t=
ried to debug the problem and I've found that it occurs when you have a 0 v=
alue decrementer. The function trace is the following:

  1) __cpu_ppc_store_decr (ppc.c) is called with value =3D 0 and raise_excp=
=3Dbooke_decr_cb;
  2) Since value < 3, booke_decr_cb is called;
  3) booke_decr_cb then calls booke_update_irq() and cpu_ppc_store_decr();
  4) cpu_ppc_store_decr calls __cpu_ppc_store_decr

  You're stuck on this infinite cycle until your stack overflows
  eventually.

  Command Line:
  qemu-system-ppc -cpu e500v2 -d guest_errors,unimp -m 2048 -M ppce500 -nog=
raphic -bios ../cc/share/qem
  u/u-boot.e500 -kernel XKYAPP.exe

  Platform where the bug occured: Bash ubuntu on Windows;

  Revision where the bug was found:
  e3571ae30cd26d19efd4554c25e32ef64d6a36b3 (16 Set 2016)


  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1624896/+subscriptions

