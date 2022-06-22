Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B69553F85
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:28:15 +0200 (CEST)
Received: from localhost ([::1]:54042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3oEA-00051M-6H
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oBy-00029y-JW
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:25:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oBu-00062R-RK
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SVv8INEUgdbY76JMIlZPQvuKIhENITu+bsOFu/FKHZU=;
 b=WmDyyZEdhYpAVNRm3lXXnu6jbMmB02e7urEmFOD7jjTy6LZQtQOp+5WqFKxoPVaS/zIEWG
 iKjSwhyVKOAZbAbgc/5cHhc3ZqZ/u4+FxpeSt8+KJXFNpMaz1DubxzFP7JLgRDsgksgSXW
 OFDhNQkkX9OUCJZGHQAKqKDSBVoXnNQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-OxFfFHsJMoSXrkQQi29lOA-1; Tue, 21 Jun 2022 20:25:50 -0400
X-MC-Unique: OxFfFHsJMoSXrkQQi29lOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 416A1185A7A4;
 Wed, 22 Jun 2022 00:25:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E5651410F3B;
 Wed, 22 Jun 2022 00:25:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 00/25] Migration 20220621 patches
Date: Wed, 22 Jun 2022 02:25:22 +0200
Message-Id: <20220622002547.64784-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c8b2d413761af732a0798d8df45ce968732083fe:

  Merge tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user into staging (2022-06-19 13:56:13 -0700)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20220621-pull-request

for you to fetch changes up to 720eceaa316f2a75a7930085bb305850831a065f:

  migration: remove the QEMUFileOps abstraction (2022-06-21 18:06:55 +0200)

----------------------------------------------------------------
Migration Pull request

Hi

In this today migration PULL request:
- dainiel Berrangé qemufileops cleanup
- Leonardo Brass cleanups for zero copy
- RDMA cleanups (me)

Please, apply.

----------------------------------------------------------------

Daniel P. Berrangé (21):
  io: add a QIOChannelNull equivalent to /dev/null
  migration: switch to use QIOChannelNull for dummy channel
  migration: remove unreachble RDMA code in save_hook impl
  migration: rename rate limiting fields in QEMUFile
  migration: rename 'pos' field in QEMUFile to 'bytes_processed'
  migration: rename qemu_ftell to qemu_file_total_transferred
  migration: rename qemu_update_position to qemu_file_credit_transfer
  migration: rename qemu_file_update_transfer to
    qemu_file_acct_rate_limit
  migration: introduce a QIOChannel impl for BlockDriverState VMState
  migration: convert savevm to use QIOChannelBlock for VMState
  migration: stop passing 'opaque' parameter to QEMUFile hooks
  migration: hardcode assumption that QEMUFile is backed with QIOChannel
  migration: introduce new constructors for QEMUFile
  migration: remove unused QEMUFileGetFD typedef / qemu_get_fd method
  migration: remove the QEMUFileOps 'shut_down' callback
  migration: remove the QEMUFileOps 'set_blocking' callback
  migration: remove the QEMUFileOps 'close' callback
  migration: remove the QEMUFileOps 'get_buffer' callback
  migration: remove the QEMUFileOps 'writev_buffer' callback
  migration: remove the QEMUFileOps 'get_return_path' callback
  migration: remove the QEMUFileOps abstraction

Juan Quintela (1):
  migration: Remove RDMA_UNREGISTRATION_EXAMPLE

Leonardo Bras (3):
  QIOChannelSocket: Introduce assert and reduce ifdefs to improve
    readability
  QIOChannelSocket: Fix zero-copy send so socket flush works
  migration: Change zero_copy_send from migration parameter to migration
    capability

 qapi/migration.json               |  33 ++---
 include/io/channel-null.h         |  55 +++++++
 migration/channel-block.h         |  59 ++++++++
 migration/qemu-file-channel.h     |  32 ----
 migration/qemu-file.h             | 125 +++++++---------
 io/channel-null.c                 | 237 ++++++++++++++++++++++++++++++
 io/channel-socket.c               |  19 ++-
 migration/block.c                 |  10 +-
 migration/channel-block.c         | 195 ++++++++++++++++++++++++
 migration/channel.c               |   4 +-
 migration/colo.c                  |   5 +-
 migration/migration.c             |  62 +++-----
 migration/multifd.c               |   4 +-
 migration/qemu-file-channel.c     | 194 ------------------------
 migration/qemu-file.c             | 193 +++++++++++++-----------
 migration/ram.c                   |   8 +-
 migration/rdma.c                  | 185 +++++------------------
 migration/savevm.c                |  55 ++-----
 migration/vmstate.c               |   4 +-
 monitor/hmp-cmds.c                |   6 -
 tests/unit/test-io-channel-null.c |  95 ++++++++++++
 tests/unit/test-vmstate.c         |   5 +-
 io/meson.build                    |   1 +
 io/trace-events                   |   3 +
 migration/meson.build             |   2 +-
 tests/unit/meson.build            |   1 +
 26 files changed, 921 insertions(+), 671 deletions(-)
 create mode 100644 include/io/channel-null.h
 create mode 100644 migration/channel-block.h
 delete mode 100644 migration/qemu-file-channel.h
 create mode 100644 io/channel-null.c
 create mode 100644 migration/channel-block.c
 delete mode 100644 migration/qemu-file-channel.c
 create mode 100644 tests/unit/test-io-channel-null.c

-- 
2.35.3


