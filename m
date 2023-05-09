Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CAA6FCE65
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 21:18:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSq6-0003xU-N7; Tue, 09 May 2023 15:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSq4-0003x4-RR
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSq3-0006RQ-9a
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683659850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DGvul2+81GNEgXV5Oroe8QOC0knYsKC06JCb49hduK8=;
 b=XyRRSrDBD59N62ttAzO6gBOTcTFFK9jgPpF34UfeHo3YPY7FCi0/5SBCIe7gmNvNAOnJuu
 czlaTPwAJv8yiH+PtgOT+lvSxP4wsoN7dVWtWNru5T0kfDoueHQnAI/vE/Fha0qnf9cbDX
 pt+Wk2GItHUsQuJ1NBtFV1xUZQIKrBo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-Z6hQ2fiJNcaefG4c_I0IfA-1; Tue, 09 May 2023 15:17:28 -0400
X-MC-Unique: Z6hQ2fiJNcaefG4c_I0IfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3C271C09A48;
 Tue,  9 May 2023 19:17:27 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD6C963F5B;
 Tue,  9 May 2023 19:17:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PULL 00/10] Migration 20230509 patches
Date: Tue,  9 May 2023 21:17:14 +0200
Message-Id: <20230509191724.86159-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 271477b59e723250f17a7e20f139262057921b6a:

  Merge tag 'compression-code-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-05-08 20:38:05 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230509-pull-request

for you to fetch changes up to 5f43d297bc2b9530805ad8602c6e2ea284b08628:

  migration: block incoming colo when capability is disabled (2023-05-09 20:52:21 +0200)

----------------------------------------------------------------
Migration Pull request (20230509 vintage)

Hi
In this PULL request:
- 1st part of colo support for multifd (lukas)
- 1st part of disabling colo option (vladimir)

Please, apply.

----------------------------------------------------------------

Lukas Straub (3):
  ram: Add public helper to set colo bitmap
  ram: Let colo_flush_ram_cache take the bitmap_mutex
  multifd: Add the ramblock to MultiFDRecvParams

Vladimir Sementsov-Ogievskiy (7):
  block/meson.build: prefer positive condition for replication
  colo: make colo_checkpoint_notify static and provide simpler API
  build: move COLO under CONFIG_REPLICATION
  migration: drop colo_incoming_thread from MigrationIncomingState
  migration: process_incoming_migration_co: simplify code flow around
    ret
  migration: disallow change capabilities in COLO state
  migration: block incoming colo when capability is disabled

 block/meson.build              |  2 +-
 docs/COLO-FT.txt               |  1 +
 hmp-commands.hx                |  2 ++
 include/migration/colo.h       |  9 +++++-
 migration/colo.c               | 57 +++++++++++-----------------------
 migration/meson.build          |  6 ++--
 migration/migration-hmp-cmds.c |  2 ++
 migration/migration.c          | 35 ++++++++++++++-------
 migration/migration.h          |  2 --
 migration/multifd.c            | 11 +++----
 migration/multifd.h            |  2 ++
 migration/options.c            |  6 ++--
 migration/ram.c                | 19 ++++++++++--
 migration/ram.h                |  1 +
 qapi/migration.json            |  9 ++++--
 stubs/colo.c                   | 39 +++++++++++++++++++++++
 stubs/meson.build              |  1 +
 17 files changed, 131 insertions(+), 73 deletions(-)
 create mode 100644 stubs/colo.c

-- 
2.40.0


