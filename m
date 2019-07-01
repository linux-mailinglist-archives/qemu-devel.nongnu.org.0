Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C15BBFD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 14:44:10 +0200 (CEST)
Received: from localhost ([::1]:58324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhvfF-0007dF-Cq
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 08:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59118)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hhvZe-00037q-Sm
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:38:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hhvZd-0008Sj-MT
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:38:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1hhvZc-0008Rj-Rd
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:38:21 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 190233084042;
 Mon,  1 Jul 2019 12:38:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD38218376;
 Mon,  1 Jul 2019 12:38:04 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Mon,  1 Jul 2019 18:05:55 +0530
Message-Id: <20190701123558.30512-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 01 Jul 2019 12:38:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/3] restrict bridge interface name to
 IFNAMSIZ
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riccardo Schirone <rschiron@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Hello,

Linux net_deivce defines network interface name to be of IFNAMSIZE(=3D16)
bytes, including the terminating null('\0') byte.

Qemu tap deivce, while invoking 'qemu-bridge-helper' tool to set up the
network bridge interface, supplies bridge name of 16 characters, thus
allowing to create an ACL bypass scenario.

This patch series attempts to fix it. It also refactors bridge helper
invocation routine 'net_bridge_run_helper' to directly invoke the helper
command.

Thank you.
---
Prasad J Pandit (3):
  qemu-bridge-helper: restrict interface name to IFNAMSIZ
  qemu-bridge-helper: move repeating code in parse_acl_file
  net: tap: refactor net_bridge_run_helper routine

 net/tap.c            | 43 +++++++++----------------------------------
 qemu-bridge-helper.c | 24 +++++++++++++++++-------
 2 files changed, 26 insertions(+), 41 deletions(-)

--=20
2.21.0


