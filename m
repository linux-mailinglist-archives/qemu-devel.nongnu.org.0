Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB8C6EF9F7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:20:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prjjT-0000PC-Oa; Wed, 26 Apr 2023 14:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prjjQ-0000P2-S0
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prjjP-0001wn-13
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682533146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fGkVsxiVhyNjK+KqbXTaXshJ0ptYBX9XC29QLB8F6fg=;
 b=Ce23rY8mzGqKdeQ8/tUAdCuTODu10tLaCNmpc1Y3zWepNSOa67XdJr396/VEbLMP+jLaeo
 Y1ThKM2JV0tiVdUJHJOvbDxIgtl1PFD715uXz7CREMoZvatzBhVdNHnXP8uCFseE6SLlK4
 GGlioARgB2vMw6oNNOXLjvjo2uNrx1I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-kO38epx1MgGuCmHbm6uUXw-1; Wed, 26 Apr 2023 14:19:04 -0400
X-MC-Unique: kO38epx1MgGuCmHbm6uUXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E596A10504A8;
 Wed, 26 Apr 2023 18:19:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2569914171B6;
 Wed, 26 Apr 2023 18:19:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v9 0/3] Eliminate multifd flush
Date: Wed, 26 Apr 2023 20:18:58 +0200
Message-Id: <20230426181901.13574-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Changes in v9:
- rebase over migration-pull-20230424
  this means that we need to change things for options.c creation.
- make the property be set for 8.0 not 7.0 (thanks peter)
- the check that disabled the property was lost on some rebase, put it back.

Please, review.

[v8]
- rebase over latests

[v7]
- Rebased to last upstream
- Rename the capability to a property.  So we move all the problems
  that we have on last review dissaper because it is not a capability.

So now, it is works as expected.  Enabled for old machine types,
disabled for new machine types.  Users will only found it if they go through the migration properties.

[v6]
- Rename multifd-sync-after-each-section to
         multifd-flush-after-each-section
- Redo comments (thanks Markus)
- Redo how to comment capabilities that are enabled/disabled during
  development. (thanks Markus)

[v5]
- Remove RAM Flags documentation (already on PULL request)
- rebase on top of PULL request.

[v4]
- Rebased on top of migration-20230209 PULL request
- Integrate two patches in that pull request
- Rebase
- Address Eric reviews.

[v3]
- update to latest upstream.
- fix checkpatch errors.

[v2]
- update to latest upstream
- change 0, 1, 2 values to defines
- Add documentation for SAVE_VM_FLAGS
- Add missing qemu_fflush(), it made random hangs for migration test
  (only for tls, no clue why).

[v1]
Upstream multifd code synchronize all threads after each RAM section.  This is suboptimal.
Change it to only flush after we go trough all ram.

Preserve all semantics for old machine types.

Juan Quintela (3):
  multifd: Create property multifd-flush-after-each-section
  multifd: Protect multifd_send_sync_main() calls
  multifd: Only flush once each full round of memory

 hw/core/machine.c     |  4 +++-
 migration/migration.c |  2 ++
 migration/migration.h | 11 +++++++++++
 migration/options.c   |  7 +++++++
 migration/options.h   |  1 +
 migration/ram.c       | 44 +++++++++++++++++++++++++++++++++++++------
 6 files changed, 62 insertions(+), 7 deletions(-)

-- 
2.40.0


