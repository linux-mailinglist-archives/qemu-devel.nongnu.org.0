Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE66982E2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:04:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSM7Q-0000RS-9h; Wed, 15 Feb 2023 13:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSM78-0000PS-OI
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:02:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSM76-0004cZ-SX
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676484159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KHJ+t1hmHVNzh7u0BywQIgM3W+y19CbT4K/+wAnVNng=;
 b=VtG+Fc1NO/hLg2AdtICZmDdE2M28aevHB1ZYCyBE8rTvHc+dsgrVyrr1bWuoHCUgenjXS0
 lF1d4lR/Rvxc5ZYPrRVlDN9+yvrVHU5ap4WVoZvcuFyqvuBewoWSXnfaJ5PNI0foMFAdx9
 mdgXgo9ydLa+wHcguExN8tnjjrp+c3s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-S7N9b2X9NImj_wy_XaW5rw-1; Wed, 15 Feb 2023 13:02:34 -0500
X-MC-Unique: S7N9b2X9NImj_wy_XaW5rw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18D4F3C0CD46;
 Wed, 15 Feb 2023 18:02:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53C8E2026D76;
 Wed, 15 Feb 2023 18:02:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH v6 0/3] Eliminate multifd flush
Date: Wed, 15 Feb 2023 19:02:28 +0100
Message-Id: <20230215180231.7644-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

 qapi/migration.json   | 18 +++++++++++++++++-
 migration/migration.h |  1 +
 hw/core/machine.c     |  1 +
 migration/migration.c | 13 +++++++++++--
 migration/ram.c       | 44 +++++++++++++++++++++++++++++++++++++------
 5 files changed, 68 insertions(+), 9 deletions(-)

-- 
2.39.1


