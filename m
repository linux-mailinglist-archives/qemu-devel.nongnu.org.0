Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE96ECDF4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:28:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwEh-0006Gm-5y; Mon, 24 Apr 2023 09:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwEI-0006F2-O7
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:27:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwEH-0001EM-1u
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rv4MEflyzqm+6OD5NFnep/ipeSjP1GgYvkLBBSLBWIE=;
 b=NYRZD/G95CFpV35y9l6/pWTxaj44wwKvAy/yjcLnidEt7udQla1CsBFs1D8lHv+MexkXQc
 ZVyEf2dHlQDD+jTTiInhp4TEwmG0dzTQYzaUSIKdP268wgLroNpAu3a7wVZAOle7uvp5uN
 bMQ1oWFPJK7G7Z/ZFs8+4o0QkAqjJK4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-wPJLDJ9cP-qFVwMonMMG6Q-1; Mon, 24 Apr 2023 09:27:35 -0400
X-MC-Unique: wPJLDJ9cP-qFVwMonMMG6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6B682A5957C;
 Mon, 24 Apr 2023 13:27:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B17614171B8;
 Mon, 24 Apr 2023 13:27:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 00/30] Migration 20230424 patches
Date: Mon, 24 Apr 2023 15:27:00 +0200
Message-Id: <20230424132730.70752-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The following changes since commit 81072abf1575b11226b3779af76dc71dfa85ee5d:

  Merge tag 'migration-20230420-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-24 12:06:17 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230424-pull-request

for you to fetch changes up to 9c894df3a37d675652390f7dbbe2f65b7bad7efa:

  migration: Create migrate_max_bandwidth() function (2023-04-24 15:01:47 +0200)

----------------------------------------------------------------
Migration Pull request

Everything that was reviewed since last PULL request:
- fix to control flow (eric)
- rearrange of hmp commands (juan)
- Make capabilities more consistent and coherent (juan)
  Not all of them reviewed yet, so only the ones reviewed.

Later, Juan.

PD.  I am waiting to finish review of the compression fixes to send
them.

----------------------------------------------------------------

Eric Blake (1):
  migration: Minor control flow simplification

Juan Quintela (29):
  migration: move migration_global_dump() to migration-hmp-cmds.c
  spice: move client_migrate_info command to ui/
  migration: Create migrate_cap_set()
  migration: Create options.c
  migration: Move migrate_colo_enabled() to options.c
  migration: Move migrate_use_compression() to options.c
  migration: Move migrate_use_events() to options.c
  migration: Move migrate_use_multifd() to options.c
  migration: Move migrate_use_zero_copy_send() to options.c
  migration: Move migrate_use_xbzrle() to options.c
  migration: Move migrate_use_block() to options.c
  migration: Move migrate_use_return() to options.c
  migration: Create migrate_rdma_pin_all() function
  migration: Move migrate_caps_check() to options.c
  migration: Move qmp_query_migrate_capabilities() to options.c
  migration: Move qmp_migrate_set_capabilities() to options.c
  migration: Move migrate_cap_set() to options.c
  migration: Move parameters functions to option.c
  migration: Use migrate_max_postcopy_bandwidth()
  migration: Move migrate_use_block_incremental() to option.c
  migration: Create migrate_throttle_trigger_threshold()
  migration: Create migrate_checkpoint_delay()
  migration: Create migrate_max_cpu_throttle()
  migration: Move migrate_announce_params() to option.c
  migration: Create  migrate_cpu_throttle_initial() to option.c
  migration: Create migrate_cpu_throttle_increment() function
  migration: Create migrate_cpu_throttle_tailslow() function
  migration: Move migrate_postcopy() to options.c
  migration: Create migrate_max_bandwidth() function

 hw/virtio/virtio-balloon.c     |   1 +
 include/migration/misc.h       |   1 -
 migration/block-dirty-bitmap.c |   1 +
 migration/block.c              |   5 +-
 migration/colo.c               |   6 +-
 migration/meson.build          |   1 +
 migration/migration-hmp-cmds.c |  39 +-
 migration/migration.c          | 719 +-------------------------------
 migration/migration.h          |  40 --
 migration/multifd-zlib.c       |   1 +
 migration/multifd-zstd.c       |   1 +
 migration/multifd.c            |  24 +-
 migration/options.c            | 722 +++++++++++++++++++++++++++++++++
 migration/options.h            |  76 ++++
 migration/postcopy-ram.c       |   1 +
 migration/ram.c                |  43 +-
 migration/rdma.c               |  12 +-
 migration/savevm.c             |   3 +-
 migration/socket.c             |   5 +-
 qapi/migration.json            |  28 --
 qapi/ui.json                   |  28 ++
 ui/ui-hmp-cmds.c               |  17 +
 ui/ui-qmp-cmds.c               |  29 ++
 23 files changed, 971 insertions(+), 832 deletions(-)
 create mode 100644 migration/options.c
 create mode 100644 migration/options.h

-- 
2.39.2


