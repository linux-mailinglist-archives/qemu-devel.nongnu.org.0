Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4DD6FE3A2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:10:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwoGA-0002QC-2P; Wed, 10 May 2023 14:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwoG7-0002P0-Td
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:09:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwoG4-0000hc-Lm
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683742187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=azUDW1d0DNbS4Tya/CJxbUtjkeEZv409ebEfkX7wV5o=;
 b=L8vZwnnfM8nhVZ5EN/PyDyphm+LlIGacnDd6puf9y7NlByGWZ6fC2f6s8XKVtBaXQD1+i9
 8MTgaar/drwRxDPlBSaaRmV1hSAj3z5otgpGbeMLQnBCbnXELeNPmXeMfiwotXx0nhioUN
 8fPXBUwqIKxLXRAipQex8Ym8PuY8VHc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-ypAKwmIqOqeet89nUgv8VA-1; Wed, 10 May 2023 14:09:44 -0400
X-MC-Unique: ypAKwmIqOqeet89nUgv8VA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2613B885626;
 Wed, 10 May 2023 18:09:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CEDD14171BC;
 Wed, 10 May 2023 18:09:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 qemu-block@nongnu.org, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PULL 00/10] Migration 20230509 patches
Date: Wed, 10 May 2023 20:09:28 +0200
Message-Id: <20230510180938.6338-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit caa9cbd566877b34e9abcc04d936116fc5e0ab28:

  Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-05-10 14:52:03 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230509-pull-request

for you to fetch changes up to 121ccedc2bf0c124e93991275336415d12d2e3df:

  migration: block incoming colo when capability is disabled (2023-05-10 18:48:12 +0200)

----------------------------------------------------------------
Migration Pull request (20230509 vintage) take 2

Hi

In this take 2:
- Change uint -> uint32_t to fix mingw32 compilation.

Please apply.
[take 1]
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

 docs/COLO-FT.txt               |  1 +
 qapi/migration.json            |  9 ++++--
 include/migration/colo.h       |  9 +++++-
 migration/migration.h          |  2 --
 migration/multifd.h            |  2 ++
 migration/ram.h                |  1 +
 migration/colo.c               | 57 +++++++++++-----------------------
 migration/migration-hmp-cmds.c |  2 ++
 migration/migration.c          | 35 ++++++++++++++-------
 migration/multifd.c            | 11 +++----
 migration/options.c            |  6 ++--
 migration/ram.c                | 19 ++++++++++--
 stubs/colo.c                   | 39 +++++++++++++++++++++++
 block/meson.build              |  2 +-
 hmp-commands.hx                |  2 ++
 migration/meson.build          |  6 ++--
 stubs/meson.build              |  1 +
 17 files changed, 131 insertions(+), 73 deletions(-)
 create mode 100644 stubs/colo.c

-- 
2.40.1


