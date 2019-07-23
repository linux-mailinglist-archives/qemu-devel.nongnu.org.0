Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9E57168D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 12:50:22 +0200 (CEST)
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpsNA-0006cT-Vr
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 06:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hpsMs-00063V-MA
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:50:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hpsMr-0002qM-Lo
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:50:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49014)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1hpsMr-0002nY-FZ
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:50:01 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0A8B23083362;
 Tue, 23 Jul 2019 10:50:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.205.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 927CE19C58;
 Tue, 23 Jul 2019 10:49:57 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Tue, 23 Jul 2019 16:17:51 +0530
Message-Id: <20190723104754.29324-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 23 Jul 2019 10:50:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 0/3] restrict bridge interface name to
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
Cc: Li Qiang <liq3ea@gmail.com>, Jason Wang <jasowang@redhat.com>,
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

This patch series attempts to fix it. It also updates bridge helper
invocation routine 'net_bridge_run_helper' to avoid snprintf() calls.

Thank you.
--
Prasad J Pandit (3):
  qemu-bridge-helper: restrict interface name to IFNAMSIZ
  qemu-bridge-helper: move repeating code in parse_acl_file
  net: tap: replace snprintf with g_strdup_printf calls

 net/tap.c            | 19 +++++++++++--------
 qemu-bridge-helper.c | 24 +++++++++++++++++-------
 2 files changed, 28 insertions(+), 15 deletions(-)

--=20
2.21.0

