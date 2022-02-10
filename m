Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDA14B0DC4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 13:48:23 +0100 (CET)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI8s2-0002Ft-HY
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 07:48:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <de19c79dad6a2cad54ae04ce754d47c07bf9bc93@lizzy.crudebyte.com>)
 id 1nI8Hs-0008Q5-4I
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:11:01 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:34131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <de19c79dad6a2cad54ae04ce754d47c07bf9bc93@lizzy.crudebyte.com>)
 id 1nI8Hj-0005I4-Jc
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Message-Id:References:In-Reply-To:Content-ID:
 Content-Description; bh=gpaSezmxpa5ZhMUvS0Nn2iXjefzgPIxQ6JGRwH2IEiE=; b=JPKXW
 vp0W/ZnGUq23Gz/O0dxvTlfuVbvt+857Xy9swi8lNtrW61w5RcKIJis6B8GF9ZIll4KWnvtOinCcp
 yql70jcyILch+FXn9gol+ILkic68f/VYUqtHzTu0jHu62PaO/iAeyE36IEGxcbxcjqmVL62ApfsOd
 x9ijf8K++jKxyDRuB8OI3pjTljI3QFri6Q5+ZwfoGiRMdK0/mdD3bkpC234j1MjoP//m33Mb4dzRH
 do12xZRBbRUbysN7TT61cQQqaL/pV9ORTL8mEFzjlQ99+GdjKOppJZG+LGQTpG51PoNBi2M/VIxkX
 zmQQD+ItbGuHZdZFFCgOPOUSAvNig==;
Message-Id: <cover.1644492115.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 10 Feb 2022 12:21:55 +0100
Subject: [PULL 0/5] 9p queue 2022-02-10
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=de19c79dad6a2cad54ae04ce754d47c07bf9bc93@lizzy.crudebyte.com;
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

The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220210

for you to fetch changes up to de19c79dad6a2cad54ae04ce754d47c07bf9bc93:

  9pfs: Fix segfault in do_readdir_many caused by struct dirent overread (2022-02-10 11:56:01 +0100)

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

 hw/9pfs/codir.c                |  3 +-
 include/qemu/osdep.h           | 13 ++++++
 tests/qtest/libqos/virtio-9p.c | 38 +++++++-----------
 tests/qtest/virtio-9p-test.c   | 90 +++++++++++++-----------------------------
 util/osdep.c                   | 21 ++++++++++
 5 files changed, 76 insertions(+), 89 deletions(-)

