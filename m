Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E076DD7E5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:27:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBD0-0001nH-Db; Tue, 11 Apr 2023 06:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmBCt-0001mC-Af
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmBCo-00076G-2Q
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681208789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uhAmsQDQ+/NIbi6U84NOsa/UMj7AnvGILgTH9+xymeY=;
 b=bvJgHVVaaKk20556EHGOVLEvEqBxoR+OX/2ydUsud2HMBrocBe1SLBJ3RVYz+rhV6sQ5h7
 lh4vVDPeHKdZCJcEw7hCtncLcB1oYvu087X/NPokbNtVb86XzdAQKIvIruvEP+D10P3hax
 xwIFii6pWiBZwih9sYsg+/MaSqZL27A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-lmiCnakAMRGw2G7oZNskLA-1; Tue, 11 Apr 2023 06:26:23 -0400
X-MC-Unique: lmiCnakAMRGw2G7oZNskLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96C6285A588;
 Tue, 11 Apr 2023 10:26:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBD402027040;
 Tue, 11 Apr 2023 10:26:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v7 0/3] Eliminate multifd flush
Date: Tue, 11 Apr 2023 12:26:16 +0200
Message-Id: <20230411102619.8291-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

In this v7:
- Rebased to last upstream
- Rename the capability to a property.  So we move all the problems
  that we have on last review dissaper because it is not a capability.

So now, it is works as expected.  Enabled for old machine types,
disabled for new machine types.  Users will only found it if they go through the migration properties.

Please review.

In this v6:
- Rename multifd-sync-after-each-section to
         multifd-flush-after-each-section
- Redo comments (thanks Markus)
- Redo how to comment capabilities that are enabled/disabled during
  development. (thanks Markus)

Please, review.

In this v5:
- Remove RAM Flags documentation (already on PULL request)
- rebase on top of PULL request.

Please review.

Based-on: <20230213025150.71537-1-quintela@redhat.com>
          Migration 20230213 patches

In this v4:
- Rebased on top of migration-20230209 PULL request
- Integrate two patches in that pull request
- Rebase
- Address Eric reviews.

Please review.

In this v3:
- update to latest upstream.
- fix checkpatch errors.

Please, review.

In this v2:
- update to latest upstream
- change 0, 1, 2 values to defines
- Add documentation for SAVE_VM_FLAGS
- Add missing qemu_fflush(), it made random hangs for migration test
  (only for tls, no clue why).

Please, review.

[v1]
Upstream multifd code synchronize all threads after each RAM section.  This is suboptimal.
Change it to only flush after we go trough all ram.

Preserve all semantics for old machine types.

Juan Quintela (3):
  multifd: Create property multifd-flush-after-each-section
  multifd: Protect multifd_send_sync_main() calls
  multifd: Only flush once each full round of memory

 migration/migration.h | 12 ++++++++++++
 hw/core/machine.c     |  1 +
 migration/migration.c |  9 +++++++++
 migration/ram.c       | 44 +++++++++++++++++++++++++++++++++++++------
 4 files changed, 60 insertions(+), 6 deletions(-)

-- 
2.39.2


