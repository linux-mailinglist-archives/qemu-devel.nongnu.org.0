Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F186FC5D8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:08:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwM7b-0006Gn-36; Tue, 09 May 2023 08:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwM7Y-0006GD-Jy
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwM7W-0007LD-MX
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683634026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qEFenDTZBHZmrsByWInDma/XHct/iUvjajYu2b8iTLQ=;
 b=D2nIqa2FvsIHGNqDiluN4RaQrQNa6Yw5uH1uVEKBRxr4wBseT5vCA5Vdv67ZH0a2Bonoa2
 hJimpWcpK/8H3mfsMEx4GP6UmQQwUCJJpO7H5V31WabuTiTV4I+UvnoOQYaD1WJ5wpTuab
 22eDGPG16NILDDsboyoc3Aef3lRr1Y0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-1UMgPooEPKiu33Z1Zq_ZsA-1; Tue, 09 May 2023 08:07:02 -0400
X-MC-Unique: 1UMgPooEPKiu33Z1Zq_ZsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A40A53C025AC
 for <qemu-devel@nongnu.org>; Tue,  9 May 2023 12:07:02 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6C2F63F84;
 Tue,  9 May 2023 12:07:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v3 00/10] migration: Remove QEMUFileHooks
Date: Tue,  9 May 2023 14:06:50 +0200
Message-Id: <20230509120700.78359-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
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

Changes in v3:
- fix rdma_migration to reset clearly (thanks danp)
- redo the cherks for migration/rdma
- rebased on top of the counters series:
[PATCH 00/21] Migration: More migration atomic counters
Based-on: Message-Id: <20230508130909.65420-1-quintela@redhat.com>

Please, review.

Changes in v2:
- rebased on top of migration-20230428 pull (second try)
- several of the patches on the PULL request
- make clean that we don't use rdma code when we don't use rdma
- create migrate_rdma() to check if we are in rdma migration.

There is no hope for this code. I am trying to cleanup the rest of
rdma calls, but the code is convoluted as hell.  And it lies with the
ram counters as crazy.

Please review.

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

Juan Quintela (10):
  migration: Create migrate_rdma()
  migration/rdma: Unfold ram_control_before_iterate()
  migration/rdma: Unfold ram_control_after_iterate()
  migration/rdma: Remove all uses of RAM_CONTROL_HOOK
  migration/rdma: Unfold hook_ram_load()
  migration/rdma: Create rdma_control_save_page()
  qemu-file: Remove QEMUFileHooks
  migration/rdma: Move rdma constants from qemu-file.h to rdma.h
  migration/rdma: Remove qemu_ prefix from exported functions
  migration/rdma: Check sooner if we are in postcopy for save_page()

 migration/migration.c  |   1 +
 migration/migration.h  |   3 +
 migration/options.c    |   7 +++
 migration/options.h    |   1 +
 migration/qemu-file.c  |  61 +--------------------
 migration/qemu-file.h  |  49 -----------------
 migration/ram.c        |  50 +++++++++++++----
 migration/rdma.c       | 121 +++++++++++++++++++----------------------
 migration/rdma.h       |  34 ++++++++++++
 migration/trace-events |  28 +++++-----
 10 files changed, 155 insertions(+), 200 deletions(-)

-- 
2.40.0


