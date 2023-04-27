Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08206F09F3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 18:36:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4aC-00059a-2b; Thu, 27 Apr 2023 12:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4a9-000590-Rh
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4a7-0006Uy-NO
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682613294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GXjvvPivsgEM7NDzrzcom8jqQC99rib5BkLoYqHtZa0=;
 b=OUmx17+VEPLEMXFJYYGJfcAC64XhIOE8rDsGjsq+JBs2UxVFV1bVoiVwoPCJaxEkiFMvhl
 mssmhQJvbEkkXPwJB7GumsZmD6l3UslidckmV7BRxOMxoubLqqZtpis7PsUQ4UknTB0eja
 /FMHyMwE6ABcS9DwUpqBBXeXU/czeFY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-jwaYDXoKNOGYkrdAjlO4Tw-1; Thu, 27 Apr 2023 12:34:52 -0400
X-MC-Unique: jwaYDXoKNOGYkrdAjlO4Tw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24F063C10238
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 16:34:51 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4661210DF8;
 Thu, 27 Apr 2023 16:34:50 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 00/19] migration: Remove QEMUFileHooks
Date: Thu, 27 Apr 2023 18:34:30 +0200
Message-Id: <20230427163449.27473-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Hi

In this series (v1):
- QEMUFileHooks only had a single user, RDMA migration.  Just remove the
  hooks and create stubs for when RDMA is not compiled in.

- This implies that we have to move all the operations from
  migration/qemu-file.c to migration/rdma.c.

- I now we can still simplify rdma_control_save_page(), but I don't
  have an easy setup for testing.

- Yes, the goal of the whole operations is to be able to move
  ram_file_limit from qemu-file to migration.c.

Please review.

Thanks, Juan.

Juan Quintela (19):
  multifd: We already account for this packet on the multifd thread
  migration: Move ram_stats to its own file migration-stats.[ch]
  migration: Rename ram_counters to mig_stats
  migration: Rename RAMStats to MigrationAtomicStats
  migration/rdma: Split the zero page case from acct_update_position
  migration/rdma: Unfold last user of acct_update_position()
  migration/rdma: Unflod ram_control_before_iterate()
  migration/rdma: Unflod ram_control_after_iterate()
  migration/rdma: simplify ram_control_load_hook()
  migration/rdma: Don't pass the QIOChannelRDMA as an opaque
  migration/rdma: We can calculate the rioc from the QEMUFile
  migration/rdma: It makes no sense to recive that flag without RDMA
  migration: Make RAM_SAVE_FLAG_HOOK a normal case entry
  migration/rdma: Remove all uses of RAM_CONTROL_HOOK
  migration/rdma: Unfold hook_ram_load()
  migration/rdma: Make ram_control_save_page() use exported interfaces
  migration/rdma: Create rdma_control_save_page()
  qemu-file: Remove QEMUFileHooks
  migration/rdma: Move rdma constants from qemu-file.h to rdma.h

 migration/meson.build       |   1 +
 migration/migration-stats.c |  17 +++++
 migration/migration-stats.h |  41 ++++++++++++
 migration/migration.c       |  33 +++++-----
 migration/multifd.c         |  10 ++-
 migration/qemu-file.c       |  77 +----------------------
 migration/qemu-file.h       |  51 ---------------
 migration/ram.c             | 120 +++++++++++++++++++-----------------
 migration/ram.h             |  24 --------
 migration/rdma.c            |  82 ++++++++++++------------
 migration/rdma.h            |  36 +++++++++++
 migration/savevm.c          |   3 +-
 12 files changed, 222 insertions(+), 273 deletions(-)
 create mode 100644 migration/migration-stats.c
 create mode 100644 migration/migration-stats.h

-- 
2.40.0


