Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4D96A8690
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:34:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlsq-0005z2-Bn; Thu, 02 Mar 2023 11:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlso-0005yJ-4U
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlsm-0007BV-3E
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Uwkd7fiE3RTdaSbvqLCiI4Q7hnaNZHilwaFPIx3hpTE=;
 b=fsTBKDfXYf6NIP094NmN89SRQMzcjxZRc531R+JDzjHjnmWqdI4eZ3G0gH5jyYsyyZbXp2
 4yfHfHFfJk8gnHiLhJVed2wTUTtpkYoqXINEZwhFv9FoiJ7AHr3nNQx8Aw/UlTsC2dGgDf
 Pjmk80KqjDldQRK8HbyMEC9lwnr3sJw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-2RprAKfWMoCuYDp0gGCdJA-1; Thu, 02 Mar 2023 11:34:14 -0500
X-MC-Unique: 2RprAKfWMoCuYDp0gGCdJA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DF08800B23;
 Thu,  2 Mar 2023 16:34:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 182CB492C3E;
 Thu,  2 Mar 2023 16:34:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 00/43] Migration: Create options.c for
 capabilities/params/properties
Date: Thu,  2 Mar 2023 17:33:27 +0100
Message-Id: <20230302163410.11399-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
  migration: rename enabled_capabilities to capabilities
  migration: Pass migrate_caps_check() the old and new caps
  migration: Create migration_cap_set()
  migration: create options.c
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

 migration/migration.h          |   44 +-
 migration/options.h            |  108 +++
 hw/virtio/virtio-balloon.c     |    1 +
 migration/block-dirty-bitmap.c |   15 +-
 migration/block.c              |    5 +-
 migration/colo.c               |    6 +-
 migration/migration.c          | 1325 +-------------------------------
 migration/multifd-zlib.c       |    1 +
 migration/multifd-zstd.c       |    1 +
 migration/multifd.c            |   24 +-
 migration/options.c            | 1318 +++++++++++++++++++++++++++++++
 migration/postcopy-ram.c       |    1 +
 migration/ram.c                |   43 +-
 migration/rdma.c               |    6 +-
 migration/savevm.c             |    9 +-
 migration/socket.c             |    5 +-
 migration/tls.c                |   23 +-
 migration/meson.build          |    1 +
 18 files changed, 1529 insertions(+), 1407 deletions(-)
 create mode 100644 migration/options.h
 create mode 100644 migration/options.c

-- 
2.39.2


