Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40806F54AA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:27:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8kc-0004ez-RU; Wed, 03 May 2023 05:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8kW-0004eC-Kn
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8kU-0001sR-7G
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I3GYmEajnHEf5B+puGaCvTVJf4PPm9qVnFKcB69xf7w=;
 b=RTOzTyZJpU1Dy8Tw/N0qcN407oyBC8qM5e0/1lXCMJ1uWviCnkGViVtYHRcrPNB82FTkAx
 ITm09cmv1ASFVN6KNjpBebxJ3qJ2Y3eWo7aN01qwEFTYO8Z4z/p3bR35cHa9JeE06VGDEg
 24g7as/4ODbctiiZ5t7YQKS+WV2qGJM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-Qs5IqsXCNw2eiPTxtfan7g-1; Wed, 03 May 2023 05:26:08 -0400
X-MC-Unique: Qs5IqsXCNw2eiPTxtfan7g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2CAA1C0432D
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 09:26:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 216DD492B00;
 Wed,  3 May 2023 09:26:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PULL 0/8] Migration 20230428 patches
Date: Wed,  3 May 2023 11:25:58 +0200
Message-Id: <20230503092606.9415-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

The following changes since commit 4ebc33f3f3b656ebf62112daca6aa0f8019b4891:

  Merge tag 'pull-tcg-20230502-2' of https://gitlab.com/rth7680/qemu into staging (2023-05-02 21:18:45 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230428-pull-request

for you to fetch changes up to 0deb7e9b6cfdb39d89a629e705d6176c511fa83e:

  migration: Drop unused parameter for migration_tls_client_create() (2023-05-03 11:24:20 +0200)

----------------------------------------------------------------
Migraiton Pull request (20230428 take 2)

Hi

Dropped the compression cleanups to see if we find what is going on.

Please apply.

Later, Juan.

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

 migration/meson.build       |  1 +
 migration/migration-stats.c | 17 +++++++++++
 migration/migration-stats.h | 41 +++++++++++++++++++++++++
 migration/migration.c       | 33 ++++++++++----------
 migration/multifd.c         | 12 ++++----
 migration/postcopy-ram.c    |  2 +-
 migration/ram.c             | 60 ++++++++++++++-----------------------
 migration/ram.h             | 24 ---------------
 migration/rdma.c            |  9 ++++--
 migration/savevm.c          |  3 +-
 migration/tls.c             | 15 ++++------
 migration/tls.h             |  3 +-
 12 files changed, 120 insertions(+), 100 deletions(-)
 create mode 100644 migration/migration-stats.c
 create mode 100644 migration/migration-stats.h

-- 
2.40.0


