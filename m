Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF164C73A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Oi7-0007hc-3I; Wed, 14 Dec 2022 05:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohv-0007dk-U8
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-00014x-3c
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p2LrK4ulbbFhcxftmC4tokaqqbkiMyD3d2pK5+a890Y=;
 b=TOe+XA9bQEG+OBn3WoVBt7glKrdHN+zvRLTjQ0kx3Iezbe/fe2+PYvx2yPezgIUF0495hF
 zHO5MvMl/Hon2Y4XZ6kup8MunczQjyzayBE2tpI+KTz9PucgR9RiBLONRUhX1BVCZ74HVn
 Kpy1dUaFlnMSJDnelaZ2Yl/Bhy4IP2A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-VX53xbvgNcCsO5Gky-zIuw-1; Wed, 14 Dec 2022 05:09:17 -0500
X-MC-Unique: VX53xbvgNcCsO5Gky-zIuw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A067101A55E
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 10:09:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FF4E492C14;
 Wed, 14 Dec 2022 10:09:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 00/23] First batch of s390x, qtest, CI and misc patches for 8.0
Date: Wed, 14 Dec 2022 11:08:48 +0100
Message-Id: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 Hi!

The following changes since commit 5204b499a6cae4dfd9fe762d5e6e82224892383b:

  mailmap: Fix Stefan Weil author email (2022-12-13 15:56:57 -0500)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-12-14

for you to fetch changes up to 8eeb98e2ea03639e743fdae82ae69d571d8ef0a3:

  tests/qtest/vhost-user-blk-test: don't abort all qtests on missing envar (2022-12-14 08:55:37 +0100)

----------------------------------------------------------------
* s390x PCI fixes and improvements (for the ISM device)
* Fix emulated MVCP and MVCS s390x instructions
* Clean-ups for the e1000e qtest
* Enable qtests on Windows
* Update FreeBSD CI to version 12.4
* Check --disable-tcg for ppc64 in the CI
* Improve scripts/make-releases a little bit
* Many other misc small clean-ups and fixes here and there

----------------------------------------------------------------
Akihiko Odaki (3):
      tests/qtest/libqos/e1000e: Remove "other" interrupts
      tests/qtest/e1000e-test: De-duplicate constants
      tests/qtest/libqos/e1000e: Correctly group register accesses

Bin Meng (4):
      .gitlab-ci.d/windows.yml: Unify the prerequisite packages
      .gitlab-ci.d/windows.yml: Keep 64-bit and 32-bit build scripts consistent
      .gitlab-ci.d/windows.yml: Exclude qTests from 64-bit CI job for now
      tests/qtest: Enable qtest build on Windows

Brad Smith (1):
      FreeBSD: Upgrade to 12.4 release

Christian Schoenebeck (1):
      tests/qtest/vhost-user-blk-test: don't abort all qtests on missing envar

Matthew Rosato (3):
      s390x/pci: coalesce unmap operations
      s390x/pci: shrink DMA aperture to be bound by vfio DMA limit
      s390x/pci: reset ISM passthrough devices on shutdown and system reset

Thomas Huth (11):
      target/s390x/tcg/mem_helper: Test the right bits in psw_key_valid()
      target/s390x: The MVCP and MVCS instructions are not privileged
      monitor/misc: Remove superfluous include statements
      scripts/make-release: Add a simple help text for the script
      scripts/make-release: Only clone single branches to speed up the script
      util/qemu-config: Fix "query-command-line-options" to provide the right values
      util/oslib-win32: Remove obsolete reference to g_poll code
      MAINTAINERS: Add documentation files to the corresponding sections
      hw: Include the VMWare devices only in the x86 targets
      gitlab-ci: Check building ppc64 without TCG
      .gitlab/issue_templates: Move suggestions into comments

 include/hw/s390x/s390-pci-bus.h   |   6 ++
 target/s390x/helper.h             |   4 +-
 tests/qtest/libqos/e1000e.h       |   1 -
 target/s390x/tcg/insn-data.h.inc  |   4 +-
 hw/s390x/s390-pci-bus.c           |  28 +++++++
 hw/s390x/s390-pci-inst.c          |  51 ++++++++++++
 hw/s390x/s390-pci-vfio.c          |  13 +++
 monitor/misc.c                    |   6 --
 target/s390x/tcg/mem_helper.c     |  18 ++--
 target/s390x/tcg/translate.c      |   6 +-
 tests/qtest/e1000e-test.c         |  19 ++---
 tests/qtest/libqos/e1000e.c       |   2 +-
 tests/qtest/vhost-user-blk-test.c |   6 ++
 util/oslib-win32.c                |   4 -
 util/qemu-config.c                | 168 +++++++++++++++++---------------------
 .gitlab-ci.d/cirrus.yml           |   2 +-
 .gitlab-ci.d/crossbuilds.yml      |   8 ++
 .gitlab-ci.d/windows.yml          |  35 ++++++--
 .gitlab/issue_templates/bug.md    |  16 ++--
 MAINTAINERS                       |  20 ++++-
 hw/display/Kconfig                |   2 +-
 hw/net/Kconfig                    |   2 +-
 scripts/make-release              |  16 +++-
 tests/qtest/meson.build           |   6 --
 tests/vm/freebsd                  |   4 +-
 25 files changed, 289 insertions(+), 158 deletions(-)


