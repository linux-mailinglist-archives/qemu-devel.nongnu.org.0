Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A7B6F7A2C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 02:50:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujcY-0003y4-Qr; Thu, 04 May 2023 20:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcW-0003wn-JY
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcT-0000fY-Tp
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683247699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cHvyjPV1fTICsQfHOELv1x0hM+wuKjMjve/w19Xwheo=;
 b=dFu2AtDIQemrtOuir7kr1CR2dW8v2X4Y/IrXK290xcXkHBD12SSw/oi3bgr4L3QL2nCm0n
 5JFFfuEc7pjaBgtY2datE5Dp91lTUiml9Ks94xslYLS5HmWhZnlPs+2cE2JwjM+fprIZ6J
 iR7mS9QIUU4EMGjoPZUk3MMUw5mBrfo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-Fxa05wdYOBKaV5Wp7PYSJQ-1; Thu, 04 May 2023 20:48:16 -0400
X-MC-Unique: Fxa05wdYOBKaV5Wp7PYSJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5FDF811E7B;
 Fri,  5 May 2023 00:48:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FCEB404B24D;
 Fri,  5 May 2023 00:48:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 00/16] Migration 20230505 patches
Date: Fri,  5 May 2023 02:47:56 +0200
Message-Id: <20230505004812.31583-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

The following changes since commit f6b761bdbd8ba63cee7428d52fb6b46e4224ddab:

  Merge tag 'qga-pull-2023-05-04' of https://github.com/kostyanf14/qemu into staging (2023-05-04 12:08:00 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230505-pull-request

for you to fetch changes up to fae4009fb51b12927165667a9c9d6af93d31b1df:

  qemu-file: Make ram_control_save_page() use accessors for rate_limit (2023-05-05 02:01:59 +0200)

----------------------------------------------------------------
Migration Pull request (20230505 edition)

In this series:
- fix block_bitmap_mapping (juan)
- RDMA cleanup (juan)
- qemu file cleanup (juan)

Please apply.

----------------------------------------------------------------

Juan Quintela (16):
  migration: Fix block_bitmap_mapping migration
  migration/rdma: Don't pass the QIOChannelRDMA as an opaque
  migration: Document all migration_stats
  migration: Put zero_pages in alphabetical order
  migration: Rename xbzrle_enabled xbzrle_started
  migration: Make RAM_SAVE_FLAG_HOOK a normal case entry
  migration/rdma: simplify ram_control_load_hook()
  migration/rdma: We can calculate the rioc from the QEMUFile
  migration/rdma: It makes no sense to recive that flag without RDMA
  migration/rdma: Check for postcopy sooner
  migration: max_postcopy_bandwidth is a size parameter
  migration: qemu_file_total_transferred() function is monotonic
  qemu-file: No need to check for shutdown in qemu_file_rate_limit
  qemu-file: remove shutdown member
  qemu-file: Make total_transferred an uint64_t
  qemu-file: Make ram_control_save_page() use accessors for rate_limit

 migration/block-dirty-bitmap.c | 14 ++++-------
 migration/block.c              | 13 +++-------
 migration/migration-stats.h    | 45 ++++++++++++++++++++++++++++++++-
 migration/migration.c          |  4 +--
 migration/options.c            |  9 ++++++-
 migration/options.h            |  4 ++-
 migration/qemu-file.c          | 35 +++++++-------------------
 migration/qemu-file.h          |  4 +--
 migration/ram.c                | 26 +++++++++----------
 migration/rdma.c               | 46 +++++++++++++++++-----------------
 migration/savevm.c             |  6 ++---
 migration/vmstate.c            |  2 +-
 12 files changed, 114 insertions(+), 94 deletions(-)

-- 
2.40.0


