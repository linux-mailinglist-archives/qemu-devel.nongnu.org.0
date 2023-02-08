Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213E168EFC1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:31:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkWx-0000UR-Rk; Wed, 08 Feb 2023 08:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkWl-0000SI-2d
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:30:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkWj-00073m-Ds
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675863020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j49yhPhgnQC7pz4tYEl7KoQJCWLxxOsUT+fOzf4jZ7w=;
 b=VZivAh2TaygGcPSLsGWvouVVyutHob/H1GghbYBXbOVn3FOksoGV/rgKZzgUjPkhiMXyU9
 IYWtGWxGtmIVeAa4WrTlERtWLXtmxxympeq63vzkE/MFkeaSD9xrVWAQhHHZph4Dd2eYe7
 A74p+4FExZWnhcoRFN7MR6bHeG+8/uQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-wr6dwlysM3qVvsMUw_J7fg-1; Wed, 08 Feb 2023 08:30:14 -0500
X-MC-Unique: wr6dwlysM3qVvsMUw_J7fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AD8638173C9;
 Wed,  8 Feb 2023 13:30:14 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E68E7C15BA0;
 Wed,  8 Feb 2023 13:30:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 0/6] Eliminate multifd flush
Date: Wed,  8 Feb 2023 14:30:04 +0100
Message-Id: <20230208133010.17323-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Juan Quintela (6):
  multifd: Create property multifd-sync-after-each-section
  multifd: Protect multifd_send_sync_main() calls
  migration: Simplify ram_find_and_save_block()
  migration: Make find_dirty_block() return a single parameter
  multifd: Only sync once each full round of memory
  ram: Document migration ram flags

 qapi/migration.json   |   9 +++-
 migration/migration.h |   1 +
 hw/core/machine.c     |   1 +
 migration/migration.c |  13 +++++-
 migration/ram.c       | 100 +++++++++++++++++++++++++++++-------------
 5 files changed, 91 insertions(+), 33 deletions(-)

-- 
2.39.1


