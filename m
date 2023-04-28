Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8E76F1EA0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:14:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTW1-0004VR-Lq; Fri, 28 Apr 2023 15:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTVq-0004UF-Au
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTVn-0002tD-UM
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BoLSiwUNMv0ea47px6OaCQbkkZ9haBIlYvBXOXg6r6I=;
 b=UEGhx7xowg7v1AbLysGBIxHGv4Iq+r419atihHda/hEJzEehEUNdhjiVqX3vXOQQ4sev9c
 FC0JCt+HI0FN3H251Ey4SWeatffOsQK9VjygMIwxxGF/+vsfFEm0OIGK3VP/JNetmNkyqn
 rQ1GJbs+Cb3Wmm+eI+j6njmlGsLTahg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-7Gh8XX4eNJifxKXSdV3lsQ-1; Fri, 28 Apr 2023 15:12:05 -0400
X-MC-Unique: 7Gh8XX4eNJifxKXSdV3lsQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 777363806628
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 19:12:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 113192166B4F;
 Fri, 28 Apr 2023 19:12:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 00/21] Migration 20230428 patches
Date: Fri, 28 Apr 2023 21:11:42 +0200
Message-Id: <20230428191203.39520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 05d50ba2d4668d43a835c5a502efdec9b92646e6:

  Merge tag 'migration-20230427-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-28 08:35:06 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230428-pull-request

for you to fetch changes up to 05ecac612ec6a4bdb358e68554b4406ac2c8e25a:

  migration: Initialize and cleanup decompression in migration.c (2023-04-28 20:54:53 +0200)

----------------------------------------------------------------
Migration Pull request (20230429 vintage)

Hi

In this series:
- compression code cleanup (lukas)
  nice, nice, nice.
- drop useless parameters from migration_tls* (juan)
- first part of remove QEMUFileHooks series (juan)

Please apply.

----------------------------------------------------------------

Juan Quintela (8):
  multifd: We already account for this packet on the multifd thread
  migration: Move ram_stats to its own file migration-stats.[ch]
  migration: Rename ram_counters to mig_stats
  migration: Rename RAMStats to MigrationAtomicStats
  migration/rdma: Split the zero page case from acct_update_position
  migration/rdma: Unfold last user of acct_update_position()
  migration: Drop unused parameter for migration_tls_get_creds()
  migration: Drop unused parameter for migration_tls_client_create()

Lukas Straub (13):
  qtest/migration-test.c: Add tests with compress enabled
  qtest/migration-test.c: Add postcopy tests with compress enabled
  ram.c: Let the compress threads return a CompressResult enum
  ram.c: Dont change param->block in the compress thread
  ram.c: Reset result after sending queued data
  ram.c: Do not call save_page_header() from compress threads
  ram.c: Call update_compress_thread_counts from
    compress_send_queued_data
  ram.c: Remove last ram.c dependency from the core compress code
  ram.c: Move core compression code into its own file
  ram.c: Move core decompression code into its own file
  ram compress: Assert that the file buffer matches the result
  ram-compress.c: Make target independent
  migration: Initialize and cleanup decompression in migration.c

 migration/meson.build        |   7 +-
 migration/migration-stats.c  |  17 ++
 migration/migration-stats.h  |  41 +++
 migration/migration.c        |  42 ++-
 migration/multifd.c          |  12 +-
 migration/postcopy-ram.c     |   2 +-
 migration/qemu-file.c        |  11 +
 migration/qemu-file.h        |   1 +
 migration/ram-compress.c     | 485 ++++++++++++++++++++++++++++++
 migration/ram-compress.h     |  70 +++++
 migration/ram.c              | 562 ++++-------------------------------
 migration/ram.h              |  24 --
 migration/rdma.c             |   9 +-
 migration/savevm.c           |   3 +-
 migration/tls.c              |  15 +-
 migration/tls.h              |   3 +-
 tests/qtest/migration-test.c | 126 ++++++++
 17 files changed, 870 insertions(+), 560 deletions(-)
 create mode 100644 migration/migration-stats.c
 create mode 100644 migration/migration-stats.h
 create mode 100644 migration/ram-compress.c
 create mode 100644 migration/ram-compress.h

-- 
2.40.0


