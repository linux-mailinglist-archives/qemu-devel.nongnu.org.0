Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DB72D8A9C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 00:17:19 +0100 (CET)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koE8c-0001So-68
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 18:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1koE76-0000dC-CB
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 18:15:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:52162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1koE74-0001h0-6j
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 18:15:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1koE71-00010G-I5
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 23:15:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 83BF82E8089
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 23:15:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Dec 2020 23:09:39 -0000
From: Anatol Pomozov <1907926@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anatol
X-Launchpad-Bug-Reporter: Anatol Pomozov (anatol)
X-Launchpad-Bug-Modifier: Anatol Pomozov (anatol)
Message-Id: <160781457931.10726.5957154717089218073.malonedeb@wampee.canonical.com>
Subject: [Bug 1907926] [NEW] Implement TPM2 configuration for emulators that
 provide TCP interface
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: c0d8b09cd4a04e05bed2ca30c8d6ded9a7ca536a
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
Reply-To: Bug 1907926 <1907926@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

swtpm provides several interfaces for its emulated device: unix socket
(can be used by qemu), chardev. swtpm also provides TCP interface for
the device which is very convenient for testing as it does not require
root permissions.

It would be very useful to have QEMU to work with TPM devices emulated
via TCP.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907926

Title:
  Implement TPM2 configuration for emulators that provide TCP interface

Status in QEMU:
  New

Bug description:
  swtpm provides several interfaces for its emulated device: unix socket
  (can be used by qemu), chardev. swtpm also provides TCP interface for
  the device which is very convenient for testing as it does not require
  root permissions.

  It would be very useful to have QEMU to work with TPM devices emulated
  via TCP.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907926/+subscriptions

