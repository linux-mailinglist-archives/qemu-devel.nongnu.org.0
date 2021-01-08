Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F42EFBF2
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 01:02:33 +0100 (CET)
Received: from localhost ([::1]:44866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky1iC-0001sU-Gt
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 19:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky1h4-0001QS-GK
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 19:01:22 -0500
Received: from indium.canonical.com ([91.189.90.7]:52216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky1h2-0001CM-II
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 19:01:22 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky1h0-00056q-8w
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 00:01:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 130A62E813B
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 00:01:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 23:54:42 -0000
From: alfred gedeon <1904954@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ethernet lan lan9118 netwroking
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alfred2g pmaydell
X-Launchpad-Bug-Reporter: alfred gedeon (alfred2g)
X-Launchpad-Bug-Modifier: alfred gedeon (alfred2g)
References: <160584191813.16356.9445911921619079194.malonedeb@chaenomeles.canonical.com>
Message-Id: <161015008237.895.16187789251903294608.malone@gac.canonical.com>
Subject: [Bug 1904954] Re: lan9118 bug peeked received message size not equal
 to actual received message size
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 53fcc05d4b624dbef138291acb96f17d92607f03
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1904954 <1904954@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do have some code, that is giving different results, between the
peeked and the actual:

https://github.com/FreeRTOS/FreeRTOS-Plus-
TCP/blob/9a25860e761036a9eb780799c9db632e3eff60c9/portable/NetworkInterface=
/MPS2_AN385/NetworkInterface.c#L237

We also have a fix to circumvent the problem by just reading the actual
size and omit the peeked bytes.

https://github.com/FreeRTOS/FreeRTOS-Plus-TCP/pull/142

changing the code i pointed locally worked fine, but we can't expect all
our users to compile qemu from scratch and apply a patch

Alfred

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904954

Title:
  lan9118 bug peeked received message size not equal to actual received
  message size

Status in QEMU:
  In Progress

Bug description:
  peeked message size is not equal to read message size

  Bug in the code at line:
  https://github.com/qemu/qemu/blob/master/hw/net/lan9118.c#L1209

  s->tx_status_fifo_head should be s->rx_status_fifo_head

  Could also be a security bug, as the user could allocate a buffer of
  size peeked data smaller than the actual packet received, which could
  cause a buffer overflow.

  Thanks,

  Alfred

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904954/+subscriptions

