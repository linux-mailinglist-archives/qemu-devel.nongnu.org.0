Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302876F088B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:43:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3kw-0000Si-Ft; Thu, 27 Apr 2023 11:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3km-0000Qs-Vf
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:41:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3ke-0003xw-Iv
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682610103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XRIOraYZIZaJXHpEA4rlo5WtJ1/I+OHJgS6ZKk+60Mc=;
 b=SNE2ZBbWNVCV99lUhg8GqjwqLTpKIZtWnDkUg9lDdp4H48OduFtYzTjk2EpFRrnmuyeFjI
 0kf++sghCrhrijnA/g3KsDBArdu+IPc2es7oCB2Vwp7cAyThJ+rkrbVfYeaub/g4qRVyjM
 mDR/hLPo+cq37jXktPVVFy+D9ObubkM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-5clIHL9NOBWfYe-DQNp-OQ-1; Thu, 27 Apr 2023 11:25:21 -0400
X-MC-Unique: 5clIHL9NOBWfYe-DQNp-OQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF81818A6464;
 Thu, 27 Apr 2023 15:22:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09A1640C2064;
 Thu, 27 Apr 2023 15:22:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, John Snow <jsnow@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 00/18] Migration 20230427 patches
Date: Thu, 27 Apr 2023 17:22:16 +0200
Message-Id: <20230427152234.25400-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The following changes since commit 1eb95e1baef852d0971a1dd62a3293cd68f1ec35:

  Merge tag 'migration-20230426-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-27 10:47:14 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230427-pull-request

for you to fetch changes up to 73208a336e249bc8e3bdd76a78d0af7ecaee9178:

  migration: Make dirty_bytes_last_sync atomic (2023-04-27 16:39:54 +0200)

----------------------------------------------------------------
Migration Pull request (20230427 edition)

Hi

Everything that has been reviewed:
- stat64_set() by paolo
- atomic_counters series fully reviewed (juan)
- move capabilities to options.c fully reviewed (juan)
- fix the channels_ready semaphore (juan)
- multifd flush optimization reviewed (juan)

Please, apply.

----------------------------------------------------------------

Juan Quintela (17):
  multifd: Fix the number of channels ready
  migration: Create migrate_params_init() function
  migration: Make all functions check have the same format
  migration: Create migrate_downtime_limit() function
  migration: Move migrate_set_block_incremental() to options.c
  migration: Move block_cleanup_parameters() to options.c
  migration: Remove MigrationState from block_cleanup_parameters()
  migration: Create migrate_tls_creds() function
  migration: Create migrate_tls_authz() function
  migration: Create migrate_tls_hostname() function
  migration: Create migrate_block_bitmap_mapping() function
  migration: Move migration_properties to options.c
  multifd: Create property multifd-flush-after-each-section
  multifd: Protect multifd_send_sync_main() calls
  multifd: Only flush once each full round of memory
  migration: Make dirty_pages_rate atomic
  migration: Make dirty_bytes_last_sync atomic

Paolo Bonzini (1):
  stat64: Add stat64_set() operation

 hw/core/machine.c              |   4 +-
 include/qemu/stats64.h         |   6 +
 migration/block-dirty-bitmap.c |  14 +-
 migration/migration.c          | 220 +-----------------
 migration/migration.h          |  11 +
 migration/multifd.c            |   3 +-
 migration/options.c            | 404 +++++++++++++++++++++++----------
 migration/options.h            |  19 ++
 migration/ram.c                |  51 ++++-
 migration/ram.h                |   4 +-
 migration/tls.c                |  19 +-
 util/stats64.c                 |  11 +
 12 files changed, 414 insertions(+), 352 deletions(-)

-- 
2.40.0


