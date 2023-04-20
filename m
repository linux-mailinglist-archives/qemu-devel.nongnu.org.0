Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09316E95FD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:41:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUWG-0003n6-6O; Thu, 20 Apr 2023 09:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWE-0003mU-53
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWC-0005dR-Gu
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ko27Mt5L9ElHHOIB+pX589jz/42mwI4grOQnaSkCnzs=;
 b=XgrKYOZvplT9hA6c2ol4WmhvgcZI5K3OysHJI0OvDTNTouhLEWwCzh3vRHdUxzoHaOTVAy
 F7+vRTq9L21TZ9lxNzhYD4ffD5Pv6w18SRkj1UPRIY69EhQWu7f0s2kRIh+gPR6FGCYmar
 lDlwCxR9TPNV4/kTf/1UACH9VdT2Zx0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-a2mnhE80OMqwE9vzCiaJ-g-1; Thu, 20 Apr 2023 09:40:08 -0400
X-MC-Unique: a2mnhE80OMqwE9vzCiaJ-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40BBD85A5B1;
 Thu, 20 Apr 2023 13:40:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D2794020BF1;
 Thu, 20 Apr 2023 13:40:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 00/43] Migration: Create options.c for
 capabilities/params/properties
Date: Thu, 20 Apr 2023 15:39:19 +0200
Message-Id: <20230420134002.29531-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In this v2:
- the first two patches are included on the last pull request.
- Changed copyright from Anthony to Orit (thanks David)
  Some archeology required.
- Get all the reviews by from Vladimir.
- Rebased on top of my last pull request.

The first two patches don't belong in this series, but without them I
got lots of confilcts if you try to use the series.  That two patches
are independently on the list.

Please review.

[v1]
This series move to options.c:
- all migration capabilities code
- all migration parameters code
- all properties code
- all qmp commands that only touch the previous

And once there:
- sort of functions
- make consistent and coherent all the functions naming/typing
- create accessors for the parameters/capabilties that don't exist
- more cleanups here and there.

Todo:

- There is still capabilities code on savevm.c, but I want this in
  before moving that code to options.c, but still needs more thought
  for my part. I.e. should I put vmstate sections in options.c, or
  should I create new functions to access the capabilities in savevm.c.

Please review.

Juan Quintela (43):
  migration: move migration_global_dump() to migration-hmp-cmds.c
  spice: move client_migrate_info command to ui/
  migration: Create migration_cap_set()
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
  migration: Move migrate_use_tls() to options.c
  migration: Move migrate_postcopy() to options.c
  migration: Create migrate_max_bandwidth() function
  migration: Move qmp_query_migrate_parameters() to options.c
  migration: Move qmp_migrate_set_parameters() to options.c
  migration: Create migrate_params_init() function
  migration: Make all functions check have the same format
  migration: Create migrate_downtime_limit() function
  migration: Move migrate_set_block_incremental() to options.c
  migration: Move block_cleanup_parameters() to options.c
  migration: Remove MigrationState from block_cleanup_parameters()
  migration: Create migrate_tls_creds() function
  migration: Create migrate_tls_authz() function
  migration: Create migrate_tls_hostname() function
  migration: Create migrate_block_bitmap_mapping() function
  migration: Move migration_properties to options.c

 hw/virtio/virtio-balloon.c     |    1 +
 include/migration/misc.h       |    1 -
 migration/block-dirty-bitmap.c |   15 +-
 migration/block.c              |    5 +-
 migration/colo.c               |    6 +-
 migration/meson.build          |    1 +
 migration/migration-hmp-cmds.c |   40 +-
 migration/migration.c          | 1352 +-------------------------------
 migration/migration.h          |   42 -
 migration/multifd-zlib.c       |    1 +
 migration/multifd-zstd.c       |    1 +
 migration/multifd.c            |   24 +-
 migration/options.c            | 1318 +++++++++++++++++++++++++++++++
 migration/options.h            |  106 +++
 migration/postcopy-ram.c       |    1 +
 migration/ram.c                |   43 +-
 migration/rdma.c               |   12 +-
 migration/savevm.c             |    3 +-
 migration/socket.c             |    5 +-
 migration/tls.c                |   23 +-
 qapi/migration.json            |   28 -
 qapi/ui.json                   |   28 +
 ui/ui-hmp-cmds.c               |   17 +
 ui/ui-qmp-cmds.c               |   29 +
 24 files changed, 1619 insertions(+), 1483 deletions(-)
 create mode 100644 migration/options.c
 create mode 100644 migration/options.h

-- 
2.39.2


