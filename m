Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E951390D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:53:15 +0200 (CEST)
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6SA-0007MN-A5
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk5KR-0005qT-Sb
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk5KN-0006YK-Mf
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651156864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vxG17w8oJ/uN0jtO64SafgdAwyHxukIztjcpyskm2HI=;
 b=EUbS86pXLmUMJzJr6zcHST04rlLZ/6ipnw8OAV1ioN6PzZqnz/94ksKx7d5kfunm/OcLry
 JnV2r6FqVmYMTuWASQPm0JTVJaKzG0uwsro4s2wMERC/vaAcF4HLKKffhBQwsYRjtF28b+
 pYl9+cNNVIGn++Tnis02GoqfAApssFM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-RfHqfF2yM9qQijmfVO-ULg-1; Thu, 28 Apr 2022 10:41:02 -0400
X-MC-Unique: RfHqfF2yM9qQijmfVO-ULg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A02963C1EA4A
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 14:41:02 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4899407DEC3;
 Thu, 28 Apr 2022 14:41:01 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 00/11] migration queue
Date: Thu, 28 Apr 2022 15:40:41 +0100
Message-Id: <20220428144052.263382-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

The following changes since commit cf6f26d6f9b2015ee12b4604b79359e76784163a:

  Merge tag 'kraxel-20220427-pull-request' of git://git.kraxel.org/qemu into staging (2022-04-27 10:49:28 -0700)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220428a

for you to fetch changes up to 62c49432662815dc520a41cd9f2adbd7ec1e22f4:

  multifd: Implement zero copy write in multifd migration (multifd-zero-copy) (2022-04-28 14:55:24 +0100)

----------------------------------------------------------------
Migration pull 2022-04-28

Zero copy send features from Leo
Test fixes from Dan

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Daniel P. Berrangé (4):
      tests: fix encoding of IP addresses in x509 certs
      tests: convert XBZRLE migration test to use common helper
      tests: convert multifd migration tests to use common helper
      tests: ensure migration status isn't reported as failed

Leonardo Bras (7):
      QIOChannel: Add flags on io_writev and introduce io_flush callback
      QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX
      migration: Add zero-copy-send parameter for QMP/HMP for Linux
      migration: Add migrate_use_tls() helper
      multifd: multifd_send_sync_main now returns negative on error
      multifd: Send header packet without flags if zero-copy-send is enabled
      multifd: Implement zero copy write in multifd migration (multifd-zero-copy)

 chardev/char-io.c                    |   2 +-
 hw/remote/mpqemu-link.c              |   2 +-
 include/io/channel-socket.h          |   2 +
 include/io/channel.h                 |  38 ++++++++-
 io/channel-buffer.c                  |   1 +
 io/channel-command.c                 |   1 +
 io/channel-file.c                    |   1 +
 io/channel-socket.c                  | 110 ++++++++++++++++++++++++-
 io/channel-tls.c                     |   1 +
 io/channel-websock.c                 |   1 +
 io/channel.c                         |  49 +++++++++---
 migration/channel.c                  |   3 +-
 migration/migration.c                |  52 +++++++++++-
 migration/migration.h                |   6 ++
 migration/multifd.c                  |  74 ++++++++++++++---
 migration/multifd.h                  |   4 +-
 migration/ram.c                      |  29 +++++--
 migration/rdma.c                     |   1 +
 migration/socket.c                   |  12 ++-
 monitor/hmp-cmds.c                   |   6 ++
 qapi/migration.json                  |  24 ++++++
 scsi/pr-manager-helper.c             |   2 +-
 tests/qtest/migration-helpers.c      |  13 +++
 tests/qtest/migration-helpers.h      |   1 +
 tests/qtest/migration-test.c         | 150 ++++++++++++++++-------------------
 tests/unit/crypto-tls-x509-helpers.c |  16 +++-
 tests/unit/test-crypto-tlssession.c  |  11 ++-
 tests/unit/test-io-channel-socket.c  |   1 +
 28 files changed, 482 insertions(+), 131 deletions(-)


