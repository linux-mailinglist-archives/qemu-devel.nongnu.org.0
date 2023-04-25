Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61456EE5CA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:32:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLa3-0005q9-Ai; Tue, 25 Apr 2023 12:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prLZe-0005b0-0v
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:31:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prLZc-0007cN-9a
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682440283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4uwDQE+0mnDkxE2lDKOYKO1WXAjrIjTCAEHij1MDAHU=;
 b=iQ0eqoqajv4oEfPd5jbhN75aFr5Rdm+YyAwWH+CfQqb1l9ccICL55vQ6AXov33EZ5NNuio
 i6rHXSinS7+s645nCviusdIxsyuB+q3UyP/ottRToWsvnHspDGdo9guUB3i/noytUo/baU
 EnYvtDaCuZF2rFF+YusykOqHgl7SLT4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-somsqjsZMYqED04GUFVihA-1; Tue, 25 Apr 2023 12:31:21 -0400
X-MC-Unique: somsqjsZMYqED04GUFVihA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E31013C10EC1;
 Tue, 25 Apr 2023 16:31:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59D3B40C2064;
 Tue, 25 Apr 2023 16:31:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v8 0/3] Eliminate multifd flush
Date: Tue, 25 Apr 2023 18:31:11 +0200
Message-Id: <20230425163114.2609-1-quintela@redhat.com>
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

In this v8:
- rebase over latests

Please review.

[v7]
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

 hw/core/machine.c     |  1 +
 migration/migration.c |  9 +++++++++
 migration/migration.h | 12 ++++++++++++
 migration/ram.c       | 44 +++++++++++++++++++++++++++++++++++++------
 4 files changed, 60 insertions(+), 6 deletions(-)

-- 
2.40.0


