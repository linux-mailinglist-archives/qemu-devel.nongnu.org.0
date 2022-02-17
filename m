Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B64BA6F7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:20:19 +0100 (CET)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkS2-0001Vk-0p
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:20:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e64e27d5cb103b7764f1a05b6eda7e7fedd517c5@lizzy.crudebyte.com>)
 id 1nKkL8-000127-NA
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:13:10 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:34411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e64e27d5cb103b7764f1a05b6eda7e7fedd517c5@lizzy.crudebyte.com>)
 id 1nKkL6-0001p0-PS
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Message-Id:References:In-Reply-To:Content-ID:
 Content-Description; bh=QrTZO70rUQEwbkVevh+3i4ZY844Fw5vqB5KDPvRrsOE=; b=VmSuR
 XMLkmTcCBL+3uOC4OdO0Bfwr0UYvXqXkzDWq2wCsNp+0f2UBfd+tHWYe8jUlr+iVK4RdOgEM70tbY
 4jep5DIstpR4tnBtv1b94vY9ss+XYyPMx4VnpXwSaKVxGgBOCIQ4IkOp7ZuA+USKFWPUMkAifiRBi
 xZCiF1wSNEOP9ONSpEWdz8vxHZ1WP3wMteSlXW40W+Xp6qButgLHz9wqx3xL+8OFNicd9UmvtmlIY
 /82tiD6pXvIT8OqqLrsIOK5vORSVexj6Tx+C2WJuZzNzalLAY3vVh23hYa8MuFI0cKOK40sph3NY3
 pALYBSx+/jQ7X2frwbKtc6dp/wJIw==;
Message-Id: <cover.1645114783.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 17 Feb 2022 17:19:44 +0100
Subject: [PULL v2 0/5] 9p queue (previous 2022-02-10)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e64e27d5cb103b7764f1a05b6eda7e7fedd517c5@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c13b8e9973635f34f3ce4356af27a311c993729c:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220216' into staging (2022-02-16 09:57:11 +0000)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220217

for you to fetch changes up to e64e27d5cb103b7764f1a05b6eda7e7fedd517c5:

  9pfs: Fix segfault in do_readdir_many caused by struct dirent overread (2022-02-17 16:57:58 +0100)

----------------------------------------------------------------
9pfs: fixes and cleanup

* Fifth patch fixes a 9pfs server crash that happened on some systems due
  to incorrect (system dependant) handling of struct dirent size.

* Tests: Second patch fixes a test error that happened on some systems due
  mkdir() being called twice for creating the test directory for the 9p
  'local' tests.

* Tests: Third patch fixes a memory leak.

* Tests: The remaining two patches are code cleanup.

----------------------------------------------------------------
Christian Schoenebeck (2):
      tests/9pfs: use g_autofree where possible
      tests/9pfs: fix mkdir() being called twice

Greg Kurz (2):
      tests/9pfs: Fix leak of local_test_path
      tests/9pfs: Use g_autofree and g_autoptr where possible

Vitaly Chikunov (1):
      9pfs: Fix segfault in do_readdir_many caused by struct dirent overread

 hw/9pfs/9p-synth.c             | 18 +++++++--
 hw/9pfs/9p-synth.h             |  5 +++
 hw/9pfs/codir.c                |  3 +-
 include/qemu/osdep.h           | 13 ++++++
 tests/qtest/libqos/virtio-9p.c | 38 +++++++-----------
 tests/qtest/virtio-9p-test.c   | 90 +++++++++++++-----------------------------
 util/osdep.c                   | 21 ++++++++++
 7 files changed, 96 insertions(+), 92 deletions(-)

