Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54757691483
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 00:35:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQGR2-0007su-2S; Thu, 09 Feb 2023 18:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGQz-0007rz-L9
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:34:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGQx-0006ba-9r
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675985670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TYT45XB4DWXycv/oNPbZHzoL4jOw/uhzINL37WWviCI=;
 b=FicduKT4MJ+Vwfo22N37oevqYSIo+LN+iIl1JEEtldgTHxZTJBxShyrZ36FwXC1yyAiYV5
 oI3LcXPx5KghUEgqFa7dO0wnOCHMK2uhpak3tjVqLkpBGrPpyCmxd4KnxIrlRsOb1ZWBFH
 8t6Mzfm8mmpS9hgayS0SozE8EjO5jwE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-Ny2QYQhtMr--h0DAvMYLsw-1; Thu, 09 Feb 2023 18:34:29 -0500
X-MC-Unique: Ny2QYQhtMr--h0DAvMYLsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D77C1C05AB0;
 Thu,  9 Feb 2023 23:34:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11BEF440BC;
 Thu,  9 Feb 2023 23:34:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 00/17] Migration 20230209 patches
Date: Fri, 10 Feb 2023 00:34:09 +0100
Message-Id: <20230209233426.37811-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:

  tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230209-pull-request

for you to fetch changes up to 858191aebda251a4d1e3bc77b238096673241cdd:

  migration: Postpone postcopy preempt channel to be after main (2023-02-09 21:26:02 +0100)

----------------------------------------------------------------
Migration Pull request

Hi

This are all the reviewed patches for migration:
- AVX512 support for xbzrle (Ling Xu)
- /dev/userfaultd support (Peter Xu)
- Improve ordering of channels (Peter Xu)
- multifd cleanups (Li Zhang)
- Remove spurious files from last merge (me)
  Rebase makes that to you
- Fix mixup between state_pending_{exact,estimate} (me)
- Cache RAM size during migration (me)
- cleanup several functions (me)

Please apply.

----------------------------------------------------------------

Juan Quintela (7):
  migration: Remove spurious files
  migration: Simplify ram_find_and_save_block()
  migration: Make find_dirty_block() return a single parameter
  migration: Split ram_bytes_total_common() in two functions
  migration: Calculate ram size once
  migration: Make ram_save_target_page() a pointer
  migration: I messed state_pending_exact/estimate

Li Zhang (2):
  multifd: cleanup the function multifd_channel_connect
  multifd: Remove some redundant code

Peter Xu (6):
  linux-headers: Update to v6.1
  util/userfaultfd: Support /dev/userfaultfd
  migration: Rework multi-channel checks on URI
  migration: Cleanup postcopy_preempt_setup()
  migration: Add a semaphore to count PONGs
  migration: Postpone postcopy preempt channel to be after main

ling xu (2):
  AVX512 support for xbzrle_encode_buffer
  Update bench-code for addressing CI problem

 MAINTAINERS                                   |    1 +
 .../x86_64-quintela-devices.mak               |    7 -
 .../x86_64-quintela2-devices.mak              |    6 -
 meson.build                                   |   17 +
 include/standard-headers/drm/drm_fourcc.h     |   34 +-
 include/standard-headers/linux/ethtool.h      |   63 +-
 include/standard-headers/linux/fuse.h         |    6 +-
 .../linux/input-event-codes.h                 |    1 +
 include/standard-headers/linux/virtio_blk.h   |   19 +
 linux-headers/asm-generic/hugetlb_encode.h    |   26 +-
 linux-headers/asm-generic/mman-common.h       |    2 +
 linux-headers/asm-mips/mman.h                 |    2 +
 linux-headers/asm-riscv/kvm.h                 |    4 +
 linux-headers/linux/kvm.h                     |    1 +
 linux-headers/linux/psci.h                    |   14 +
 linux-headers/linux/userfaultfd.h             |    4 +
 linux-headers/linux/vfio.h                    |  142 ++
 migration/migration.h                         |   15 +-
 migration/postcopy-ram.h                      |    4 +-
 migration/xbzrle.h                            |    4 +
 migration/migration.c                         |  122 +-
 migration/multifd.c                           |   70 +-
 migration/postcopy-ram.c                      |   31 +-
 migration/ram.c                               |  136 +-
 migration/savevm.c                            |   56 +-
 migration/xbzrle.c                            |  124 ++
 tests/bench/xbzrle-bench.c                    |  473 ++++++
 tests/unit/test-xbzrle.c                      |   42 +-
 util/userfaultfd.c                            |   32 +
 meson_options.txt                             |    2 +
 migration/multifd.c.orig                      | 1274 -----------------
 scripts/meson-buildoptions.sh                 |    3 +
 tests/bench/meson.build                       |    4 +
 util/trace-events                             |    1 +
 34 files changed, 1257 insertions(+), 1485 deletions(-)
 delete mode 100644 configs/devices/x86_64-softmmu/x86_64-quintela-devices.mak
 delete mode 100644 configs/devices/x86_64-softmmu/x86_64-quintela2-devices.mak
 create mode 100644 tests/bench/xbzrle-bench.c
 delete mode 100644 migration/multifd.c.orig

-- 
2.39.1


