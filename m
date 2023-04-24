Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530806ECAF0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:05:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqtwz-0006Ik-NQ; Mon, 24 Apr 2023 07:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqtwt-0006Eq-Lw
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:01:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqtwr-0008M2-7r
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682334092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aCL+qh8sZeWjkJeSaV/Xl7ZRpDX7+D0MQKseI2cOKtM=;
 b=FSQdY7HptGKERGPO54o99YbscAxGVOUWUizIoA4hnI+ZqsX5wKq9TjAu7M+20qzEIu09HV
 dUaK+fIHOikYQnHETmQr26Xqo7uXGRNfiUXcGBQ/tT6CSN8vkJgP6Dl0S/sHoHH9M5+Fi0
 afJuo7Zt/fX5iZIkEYTZ2uHlYeJoMLU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-wvG_EhIRPSSVvP4yWeo_Ew-1; Mon, 24 Apr 2023 07:01:27 -0400
X-MC-Unique: wvG_EhIRPSSVvP4yWeo_Ew-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CF812999B48
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 11:01:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8BA3492C13;
 Mon, 24 Apr 2023 11:01:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 00/17] Migration 20230420 patches
Date: Mon, 24 Apr 2023 13:01:02 +0200
Message-Id: <20230424110119.68520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
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

The following changes since commit 327ec8d6c2a2223b78d311153a471036e474c5c5:

  Merge tag 'pull-tcg-20230423' of https://gitlab.com/rth7680/qemu into staging (2023-04-23 11:20:37 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230420-pull-request

for you to fetch changes up to b02c7fc9ef447787414e6fa67eff75e7b7b30180:

  migration: Pass migrate_caps_check() the old and new caps (2023-04-24 11:29:02 +0200)

----------------------------------------------------------------
Migration Pull request (take 2)

Remove the two atomic patches that broke mips32.

Please, apply.

----------------------------------------------------------------

Eric Blake (1):
  migration: Handle block device inactivation failures better

Juan Quintela (12):
  migration: Merge ram_counters and ram_atomic_counters
  migration: Update atomic stats out of the mutex
  migration: Make multifd_bytes atomic
  migration: Make dirty_sync_missed_zero_copy atomic
  migration: Make precopy_bytes atomic
  migration: Make downtime_bytes atomic
  migration: Make dirty_sync_count atomic
  migration: Make postcopy_requests atomic
  migration: Rename duplicate to zero_pages
  migration: Rename normal to normal_pages
  migration: rename enabled_capabilities to capabilities
  migration: Pass migrate_caps_check() the old and new caps

Peter Xu (3):
  util/mmap-alloc: qemu_fd_getfs()
  vl.c: Create late backends before migration object
  migration/postcopy: Detect file system on dest host

李皆俊 (1):
  migration: remove extra whitespace character for code style

 include/qemu/mmap-alloc.h |   7 ++
 migration/migration.c     | 157 +++++++++++++++++---------------------
 migration/migration.h     |   2 +-
 migration/multifd.c       |  10 +--
 migration/postcopy-ram.c  |  34 ++++++++-
 migration/ram.c           |  65 +++++++---------
 migration/ram.h           |  34 ++++-----
 migration/rdma.c          |   4 +-
 migration/savevm.c        |   6 +-
 softmmu/vl.c              |   9 ++-
 util/mmap-alloc.c         |  28 +++++++
 11 files changed, 196 insertions(+), 160 deletions(-)

-- 
2.39.2


