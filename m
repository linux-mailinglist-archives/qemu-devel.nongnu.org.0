Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBE76FB683
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 20:54:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw5yA-00049u-Kc; Mon, 08 May 2023 14:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw5y7-00049i-Ik
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw5y2-0005wq-DM
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683571933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6nenET4tqJzvKQlJXNYy3s+bBLXFoa/xJb20pnjYQws=;
 b=e7BRyHs3BwU6ZATx6wbX6uoi4zf/tFpRG12Pw6ydjVNKi4wM1TfS/d0VhKvi5FY9VGZiF5
 OcGito9k2LEixzilPqdW0GYTxyIb0xflwq7mMWXarznrCJa+lz7TgSDNMNoCdPEC1aorll
 6YJW2cQUFEaCiMv+X0ul3RFzeLU34r4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-3kBkIBINNiWMXcNiiQRyjw-1; Mon, 08 May 2023 14:52:11 -0400
X-MC-Unique: 3kBkIBINNiWMXcNiiQRyjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B35D185A79C
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 18:52:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57D611410F23;
 Mon,  8 May 2023 18:52:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 00/13] Compression code patches
Date: Mon,  8 May 2023 20:51:56 +0200
Message-Id: <20230508185209.68604-1-quintela@redhat.com>
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

The following changes since commit 792f77f376adef944f9a03e601f6ad90c2f891b2:

  Merge tag 'pull-loongarch-20230506' of https://gitlab.com/gaosong/qemu into staging (2023-05-06 08:11:52 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/compression-code-pull-request

for you to fetch changes up to c323518a7aab1c01740a468671b7f2b517d3bca6:

  migration: Initialize and cleanup decompression in migration.c (2023-05-08 15:25:27 +0200)

----------------------------------------------------------------
Migration PULL request (20230508 edition, take 2)

Hi

This is just the compression bits of the Migration PULL request for
20230428.  Only change is that we don't run the compression tests by
default.

The problem already exist with compression code.  The test just show
that it don't work.

- Add migration tests for (old) compress migration code (lukas)
- Make compression code independent of ram.c (lukas)
- Move compression code into ram-compress.c (lukas)

Please apply, Juan.

----------------------------------------------------------------

Lukas Straub (13):
  qtest/migration-test.c: Add tests with compress enabled
  qtest/migration-test.c: Add postcopy tests with compress enabled
  ram.c: Let the compress threads return a CompressResult enum
  ram.c: Dont change param->block in the compress thread
  ram.c: Reset result after sending queued data
  ram.c: Do not call save_page_header() from compress threads
  ram.c: Call update_compress_thread_counts from
    compress_send_queued_data
  ram.c: Remove last ram.c dependency from the core compress code
  ram.c: Move core compression code into its own file
  ram.c: Move core decompression code into its own file
  ram compress: Assert that the file buffer matches the result
  ram-compress.c: Make target independent
  migration: Initialize and cleanup decompression in migration.c

 migration/meson.build        |   6 +-
 migration/migration.c        |   9 +
 migration/qemu-file.c        |  11 +
 migration/qemu-file.h        |   1 +
 migration/ram-compress.c     | 485 +++++++++++++++++++++++++++++++++
 migration/ram-compress.h     |  70 +++++
 migration/ram.c              | 502 +++--------------------------------
 tests/qtest/migration-test.c | 134 ++++++++++
 8 files changed, 758 insertions(+), 460 deletions(-)
 create mode 100644 migration/ram-compress.c
 create mode 100644 migration/ram-compress.h

-- 
2.40.0


