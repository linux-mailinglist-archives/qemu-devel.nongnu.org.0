Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB38242F0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 23:39:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSq0Z-0002yC-1L
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 17:39:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSpy3-0001qW-RA
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSpy2-0003iC-Qk
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:37:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34726)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hSpy2-0003he-LH
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:37:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A51FCC057F3D
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 21:37:09 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EB995D704;
	Mon, 20 May 2019 21:37:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 23:36:53 +0200
Message-Id: <20190520213700.12620-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 20 May 2019 21:37:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/7] fw_cfg_test refactor and add two test
 cases
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the work from Li Qiang, I added few changes while preparing
the pull request. If Li is OK with it, I'll send as it.

Since v2:
- split 1st patch
- clarified commit description based on review comments on list

Since v1:
- Add a patch to store the reboot_timeout as little endian

v2: https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg04064.html
v1: https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg05679.html

Li Qiang (5):
  tests: refactor fw_cfg_test
  tests: fw_cfg: add a function to get the fw_cfg file
  hw/nvram/fw_cfg: Store 'reboot-timeout' as little endian
  tests: fw_cfg: add 'reboot-timeout' test case
  tests: fw_cfg: add 'splash-time' test case

Philippe Mathieu-Daud=C3=A9 (2):
  tests/libqos: Add io_fw_cfg_uninit() and mm_fw_cfg_uninit()
  tests/libqos: Add pc_fw_cfg_uninit() and use it

 hw/nvram/fw_cfg.c        |   4 +-
 tests/fw_cfg-test.c      | 127 +++++++++++++++++++++++++++++++++++----
 tests/libqos/fw_cfg.c    |  55 +++++++++++++++++
 tests/libqos/fw_cfg.h    |   9 +++
 tests/libqos/malloc-pc.c |   2 +-
 5 files changed, 184 insertions(+), 13 deletions(-)

--=20
2.20.1


