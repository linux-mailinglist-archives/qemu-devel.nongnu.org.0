Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0710C2D55AA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 09:52:41 +0100 (CET)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHgm-0004Pq-0r
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 03:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHfY-0003Oa-06
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:51:24 -0500
Received: from indium.canonical.com ([91.189.90.7]:58638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHfV-0005nR-VX
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:51:23 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knHfT-0003kD-B0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:51:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 12FA02E8147
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:51:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 08:40:24 -0000
From: Thomas Huth <1881231@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alanjager2321 dgilbert-h th-huth zhangckid
X-Launchpad-Bug-Reporter: ye.zou (alanjager2321)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159072520391.13844.465385675639953986.malonedeb@soybean.canonical.com>
Message-Id: <160758962501.16321.10388694695693484272.malone@chaenomeles.canonical.com>
Subject: [Bug 1881231] Re: colo: Can not recover colo after svm failover twice
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 9d70717a88654c5f49445d78f38114d80738eb47
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
Reply-To: Bug 1881231 <1881231@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU v5.2 has been released now and should contain the fix

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1881231

Title:
  colo: Can not  recover colo after svm failover twice

Status in QEMU:
  Fix Released

Bug description:
  Hi Expert,
  x-blockdev-change met some error, during testing colo

  Host os:
  CentOS Linux release 7.6.1810 (Core)

  Reproduce steps:
  1. create colo vm following https://github.com/qemu/qemu/blob/master/docs=
/COLO-FT.txt
  2. kill secondary vm and remove the nbd child from the quorum to wait for=
 recover
    type those commands on primary vm console:
    { 'execute': 'x-blockdev-change', 'arguments': {'parent': 'colo-disk0',=
 'child': 'children.1'}}
    { 'execute': 'human-monitor-command','arguments': {'command-line': 'dri=
ve_del replication0'}}
    { 'execute': 'x-colo-lost-heartbeat'}
  3. recover colo
  4. kill secondary vm again after recover colo and type same commands as s=
tep 2:
    { 'execute': 'x-blockdev-change', 'arguments': {'parent': 'colo-disk0',=
 'child': 'children.1'}}
    { 'execute': 'human-monitor-command','arguments': {'command-line': 'dri=
ve_del replication0'}}
    { 'execute': 'x-colo-lost-heartbeat'}
    but the first command got error
    { 'execute': 'x-blockdev-change', 'arguments': {'parent': 'colo-disk0',=
 'child': 'children.1'}}
  {"error": {"class": "GenericError", "desc": "Node 'colo-disk0' does not h=
ave child 'children.1'"}}

  according to https://www.qemu.org/docs/master/qemu-qmp-ref.html
  Command: x-blockdev-change
  Dynamically reconfigure the block driver state graph. It can be used to a=
dd, remove, insert or replace a graph node. Currently only the Quorum drive=
r implements this feature to add or remove its child. This is useful to fix=
 a broken quorum child.

  It seems x-blockdev-change not worked as expected.

  Thanks.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1881231/+subscriptions

