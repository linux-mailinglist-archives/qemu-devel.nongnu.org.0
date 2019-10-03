Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE4CB214
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 00:59:40 +0200 (CEST)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGA4Q-0004so-Q0
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 18:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iG9zs-0003U3-NU
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 18:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iG9zq-0007Vv-73
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 18:54:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37626)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iG9zq-0007U0-1p
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 18:54:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 337E53001571;
 Thu,  3 Oct 2019 22:54:53 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95E77600C4;
 Thu,  3 Oct 2019 22:54:40 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] fw_cfg: Run tests on big-endian
Date: Fri,  4 Oct 2019 00:54:30 +0200
Message-Id: <20191003225437.16651-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 03 Oct 2019 22:54:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series allow fw_cfg tests to run on big-endian targets.

This should help us to notice regression such this one
introduced in QEMU v4.0.0:

  commit ee5d0f89de3e53cdb0dcf51acc1502b310ed3bd2
  Date:   Tue Nov 20 21:10:25 2018 -0800

    fw_cfg: Fix -boot reboot-timeout error checking

Later fixed in QEMU v4.1.0:

  commit 04da973501b591525ce68c2925c61c8886badd4d
  Date:   Wed Apr 24 07:06:41 2019 -0700

    hw/nvram/fw_cfg: Store 'reboot-timeout' as little endian

And older one that required manual testing [*], such:

  commit 36b62ae6a58f9a588fd33be9386e18a2b90103f5

    fw_cfg: fix endianness in fw_cfg_data_mem_read() / _write()

[*] https://lists.gnu.org/archive/html/qemu-devel/2014-12/msg03762.html

Philippe Mathieu-Daud=C3=A9 (7):
  tests/libqos/fw_cfg: Document io_fw_cfg_init to drop io_fw_cfg_uninit
  tests/libqos/fw_cfg: Document mm_fw_cfg_init to drop mm_fw_cfg_uninit
  tests/libqos/fw_cfg: Document pc_fw_cfg_init to drop pc_fw_cfg_uninit
  tests/fw_cfg: Let the tests use a context
  tests/libqos/fw_cfg: Pass QTestState as argument
  tests/fw_cfg: Declare one QFWCFG for all tests
  tests/fw_cfg: Run the tests on big-endian targets

 tests/Makefile.include   |   2 +
 tests/boot-order-test.c  |  12 +--
 tests/fw_cfg-test.c      | 180 +++++++++++++++++++++------------------
 tests/libqos/fw_cfg.c    |  71 +++++++--------
 tests/libqos/fw_cfg.h    |  55 +++++++-----
 tests/libqos/malloc-pc.c |   6 +-
 6 files changed, 176 insertions(+), 150 deletions(-)

--=20
2.20.1


