Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30B558131
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:58:00 +0200 (CEST)
Received: from localhost ([::1]:51470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Q9X-0001vm-Qt
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4Q5l-0005kk-1l
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4Q5i-0005vk-H4
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656003241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z/3iSpJw0PENAfWyBSBWbje40wlbdbjmpjWzBew6xsM=;
 b=L6DnX/juN3CSA19iY9tDMvJAxjH810dC5fuqgT7U53hcPljmpPgWyLvcH0LTuBIDG68M3f
 BublB+vQuweEq9aiXhBOajn+FfuDJFk5JjNco0lndp5SlC62acCczrcEHVeKquPwRe7Jon
 9hDjEBRixrUqhmh7MxkeB/Z+T/t1D50=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-mFAMWlhTPFuhW3s_nmaiPg-1; Thu, 23 Jun 2022 12:54:00 -0400
X-MC-Unique: mFAMWlhTPFuhW3s_nmaiPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7531929AA389;
 Thu, 23 Jun 2022 16:54:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DEC92026D07;
 Thu, 23 Jun 2022 16:53:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 00/25] migration queue
Date: Thu, 23 Jun 2022 17:53:29 +0100
Message-Id: <20220623165354.197792-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 2b049d2c8dc01de750410f8f1a4eac498c04c723:

  Merge tag 'pull-aspeed-20220622' of https://github.com/legoater/qemu into staging (2022-06-22 07:27:06 -0700)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220623b

for you to fetch changes up to 77ef2dc1c8c6a482fd06fdf3b59d0647f0850e3e:

  migration: remove the QEMUFileOps abstraction (2022-06-23 10:18:13 +0100)

----------------------------------------------------------------
[v3] Migration pull 2022-06-23

This replaces my and Juan's earlier pulls over the last 2 days;
4th time lucky?

Compared to my pull earlier:
  Removed Hyman's dirty ring set

In this migration PULL request:
- Dainiel Berrangé - qemufileops cleanup
- Leonardo Bras  - cleanups for zero copy
- Juan Quintela  - RDMA cleanups

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Daniel P. Berrangé (21):
      io: add a QIOChannelNull equivalent to /dev/null
      migration: switch to use QIOChannelNull for dummy channel
      migration: remove unreachble RDMA code in save_hook impl
      migration: rename rate limiting fields in QEMUFile
      migration: rename 'pos' field in QEMUFile to 'bytes_processed'
      migration: rename qemu_ftell to qemu_file_total_transferred
      migration: rename qemu_update_position to qemu_file_credit_transfer
      migration: rename qemu_file_update_transfer to qemu_file_acct_rate_limit
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
      QIOChannelSocket: Introduce assert and reduce ifdefs to improve readability
      QIOChannelSocket: Fix zero-copy send so socket flush works
      migration: Change zero_copy_send from migration parameter to migration capability

 include/io/channel-null.h         |  55 +++++++++
 io/channel-null.c                 | 237 ++++++++++++++++++++++++++++++++++++++
 io/channel-socket.c               |  19 ++-
 io/meson.build                    |   1 +
 io/trace-events                   |   3 +
 migration/block.c                 |  10 +-
 migration/channel-block.c         | 195 +++++++++++++++++++++++++++++++
 migration/channel-block.h         |  59 ++++++++++
 migration/channel.c               |   4 +-
 migration/colo.c                  |   5 +-
 migration/meson.build             |   2 +-
 migration/migration.c             |  68 +++++------
 migration/multifd.c               |   4 +-
 migration/qemu-file-channel.c     | 194 -------------------------------
 migration/qemu-file-channel.h     |  32 -----
 migration/qemu-file.c             | 193 ++++++++++++++++++-------------
 migration/qemu-file.h             | 125 +++++++++-----------
 migration/ram.c                   |   8 +-
 migration/rdma.c                  | 185 ++++++-----------------------
 migration/savevm.c                |  55 ++-------
 migration/vmstate.c               |   5 +-
 monitor/hmp-cmds.c                |   6 -
 qapi/migration.json               |  33 ++----
 tests/unit/meson.build            |   1 +
 tests/unit/test-io-channel-null.c |  95 +++++++++++++++
 tests/unit/test-vmstate.c         |   5 +-
 26 files changed, 928 insertions(+), 671 deletions(-)
 create mode 100644 include/io/channel-null.h
 create mode 100644 io/channel-null.c
 create mode 100644 migration/channel-block.c
 create mode 100644 migration/channel-block.h
 delete mode 100644 migration/qemu-file-channel.c
 delete mode 100644 migration/qemu-file-channel.h
 create mode 100644 tests/unit/test-io-channel-null.c


