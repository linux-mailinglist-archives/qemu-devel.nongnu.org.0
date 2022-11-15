Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B30D62984A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:14:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouuo3-0003lc-7P; Tue, 15 Nov 2022 07:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuo1-0003kc-Ap
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:12:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuny-0004Vo-E4
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668514361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oWrJC0+VdEIgyt9X5NwWkoMHxeS9COlWnKDyxb5Erco=;
 b=QvVmbee4ZoFEoyX8yVVB4iFE3hoY74TVVqcym9Jd5HhNibURDjsvvUSm2R73EkF11r7r5h
 vDxcmKHwd4VuIUS+FXiQvbjFVpA5IpGvCy3767r/+YhWyYjepuKlxI6AnSaqGvsxKtl5ei
 SVxw3/Sm+kgikvyyvhjDh9dzw5EC44g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-nkFDvZ4zPkGgF5k6iBEd5Q-1; Tue, 15 Nov 2022 07:12:38 -0500
X-MC-Unique: nkFDvZ4zPkGgF5k6iBEd5Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 669742999B33;
 Tue, 15 Nov 2022 12:12:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CC2C492B05;
 Tue, 15 Nov 2022 12:12:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 00/30] Migration PULL request
Date: Tue, 15 Nov 2022 13:11:56 +0100
Message-Id: <20221115121226.26609-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Hi

It includes:
- Leonardo fix for zero_copy flush
- Fiona fix for return value of readv/writev
- Peter Xu cleanups
- Peter Xu preempt patches
- Patches ready from zero page (me)
- AVX2 support (ling)
- fix for slow networking and reordering of first packets (manish)

Please, apply.

Fiona Ebner (1):
  migration/channel-block: fix return value for
    qio_channel_block_{readv,writev}

Juan Quintela (5):
  multifd: Create page_size fields into both MultiFD{Recv,Send}Params
  multifd: Create page_count fields into both MultiFD{Recv,Send}Params
  migration: Export ram_transferred_ram()
  migration: Export ram_release_page()
  migration: Block migration comment or code is wrong

Leonardo Bras (1):
  migration/multifd/zero-copy: Create helper function for flushing

Peter Xu (20):
  migration: Fix possible infinite loop of ram save process
  migration: Fix race on qemu_file_shutdown()
  migration: Disallow postcopy preempt to be used with compress
  migration: Use non-atomic ops for clear log bitmap
  migration: Disable multifd explicitly with compression
  migration: Take bitmap mutex when completing ram migration
  migration: Add postcopy_preempt_active()
  migration: Cleanup xbzrle zero page cache update logic
  migration: Trivial cleanup save_page_header() on same block check
  migration: Remove RAMState.f references in compression code
  migration: Yield bitmap_mutex properly when sending/sleeping
  migration: Use atomic ops properly for page accountings
  migration: Teach PSS about host page
  migration: Introduce pss_channel
  migration: Add pss_init()
  migration: Make PageSearchStatus part of RAMState
  migration: Move last_sent_block into PageSearchStatus
  migration: Send requested page directly in rp-return thread
  migration: Remove old preempt code around state maintainance
  migration: Drop rs->f

ling xu (2):
  Update AVX512 support for xbzrle_encode_buffer
  Unit test code and benchmark code

manish.mishra (1):
  migration: check magic value for deciding the mapping of channels

 meson.build                   |  16 +
 include/exec/ram_addr.h       |  11 +-
 include/exec/ramblock.h       |   3 +
 include/io/channel.h          |  25 ++
 include/qemu/bitmap.h         |   1 +
 migration/migration.h         |   7 -
 migration/multifd.h           |  10 +-
 migration/postcopy-ram.h      |   2 +-
 migration/ram.h               |  23 +
 migration/xbzrle.h            |   4 +
 io/channel-socket.c           |  27 ++
 io/channel.c                  |  39 ++
 migration/block.c             |   4 +-
 migration/channel-block.c     |   6 +-
 migration/migration.c         | 109 +++--
 migration/multifd-zlib.c      |  14 +-
 migration/multifd-zstd.c      |  12 +-
 migration/multifd.c           |  69 +--
 migration/postcopy-ram.c      |   5 +-
 migration/qemu-file.c         |  27 +-
 migration/ram.c               | 794 +++++++++++++++++-----------------
 migration/xbzrle.c            | 124 ++++++
 tests/bench/xbzrle-bench.c    | 465 ++++++++++++++++++++
 tests/unit/test-xbzrle.c      |  39 +-
 util/bitmap.c                 |  45 ++
 meson_options.txt             |   2 +
 scripts/meson-buildoptions.sh |  14 +-
 tests/bench/meson.build       |   4 +
 28 files changed, 1379 insertions(+), 522 deletions(-)
 create mode 100644 tests/bench/xbzrle-bench.c

-- 
2.38.1


