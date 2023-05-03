Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742796F58E3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:20:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCNw-0005P5-Bi; Wed, 03 May 2023 09:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNh-0005No-94
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:18:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNf-0006jF-Nq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683119930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RsOC/xVjgK7eubvLfVTgzijvSRqei7nhdWg0W11o+sI=;
 b=X4Nwl7L7xmNrOtLf9rpYX6qqpZNVvs3tK8finw/cqcuCQFob+mmp/+Jm6N/ISto2BK2/qe
 fak4a/XHbMkUqT1U60lTPaelMxpYyybPQAByU/oQP1+ZpmPMtejPL2quODsnOQTtQT/b7s
 i7vlqQKudU0QBgDNROwBSFk++W4iDE4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-iftd19hJNs6T7hYOqe17NA-1; Wed, 03 May 2023 09:18:49 -0400
X-MC-Unique: iftd19hJNs6T7hYOqe17NA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 934E0185A79C
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 13:18:48 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3323C15BAD;
 Wed,  3 May 2023 13:18:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 00/16] migration: Remove QEMUFileHooks
Date: Wed,  3 May 2023 15:18:31 +0200
Message-Id: <20230503131847.11603-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Hi

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

Juan Quintela (16):
  migration: Create migrate_rdma()
  migration/rdma: Unfold ram_control_before_iterate()
  migration/rdma: Unfold ram_control_after_iterate()
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
  migration/rdma: Remove qemu_ prefix from exported functions
  migration/rdma: If we are in postcopy don't do anything

 migration/migration.h  |   3 +
 migration/options.c    |   7 ++
 migration/options.h    |   1 +
 migration/qemu-file.c  |  77 +-------------------
 migration/qemu-file.h  |  51 --------------
 migration/ram.c        |  60 +++++++++++-----
 migration/rdma.c       | 155 ++++++++++++++++++++++-------------------
 migration/rdma.h       |  36 ++++++++++
 migration/trace-events |  28 ++++----
 9 files changed, 186 insertions(+), 232 deletions(-)

-- 
2.40.0


