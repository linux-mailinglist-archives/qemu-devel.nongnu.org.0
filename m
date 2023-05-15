Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1F6702CD0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:36:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXPO-0006c5-2s; Mon, 15 May 2023 08:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOZ-0006P2-1x
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOV-0003Gm-Ir
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6gsqTsbKbxKDFXnmVO8mOZGv52QiQvw3LgpQKPKzmeg=;
 b=fu7TDx3gRCTWJCB4mB8KDcWuk7D3E6BSIN2k6FwOSRpbyUMzPsETOvVM8NuCIoUp/vwfgY
 tPmGr/qeP+KbkZDPK+sNKRri8USUXqi1G4Ebc6MHEmW/IQGAPCWE0iTeMeEQXZTgCBiylu
 0UftB0Q2V21EEiBemiQJWNacpyu4Zvc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-rwJ3DmQyOQm_Df-u0ikKkQ-1; Mon, 15 May 2023 08:33:37 -0400
X-MC-Unique: rwJ3DmQyOQm_Df-u0ikKkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0506A86C60F;
 Mon, 15 May 2023 12:33:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EADB763F5F;
 Mon, 15 May 2023 12:33:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PULL 00/11] Migration 20230515 patches
Date: Mon, 15 May 2023 14:33:23 +0200
Message-Id: <20230515123334.58995-1-quintela@redhat.com>
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

The following changes since commit 8844bb8d896595ee1d25d21c770e6e6f29803097:

  Merge tag 'or1k-pull-request-20230513' of https://github.com/stffrdhrn/qemu into staging (2023-05-13 11:23:14 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230515-pull-request

for you to fetch changes up to 6da835d42a2163b43578ae745bc613b06dd5d23c:

  qemu-file: Remove total from qemu_file_total_transferred_*() (2023-05-15 13:46:14 +0200)

----------------------------------------------------------------
Migration Pull request 20230515

Hi

On this PULL:
- use xxHash for calculate dirty_rate (andrei)
- Create qemu_target_pages_to_MiB() and use them (quintela)
- make dirtyrate target independent (quintela)
- Merge 5 patches from atomic counters series (quintela)

Please apply.

----------------------------------------------------------------

Andrei Gudkov (1):
  migration/calc-dirty-rate: replaced CRC32 with xxHash

Juan Quintela (10):
  softmmu: Create qemu_target_pages_to_MiB()
  Use new created qemu_target_pages_to_MiB()
  migration: Teach dirtyrate about qemu_target_page_size()
  migration: Teach dirtyrate about qemu_target_page_bits()
  migration: Make dirtyrate.c target independent
  migration: A rate limit value of 0 is valid
  migration: We set the rate_limit by a second
  qemu-file: make qemu_file_[sg]et_rate_limit() use an uint64_t
  qemu-file: Make rate_limit_used an uint64_t
  qemu-file: Remove total from qemu_file_total_transferred_*()

 include/exec/target_page.h |  1 +
 migration/qemu-file.h      | 16 +++++-----
 migration/block.c          |  4 +--
 migration/dirtyrate.c      | 64 +++++++++++++++++++++++++++-----------
 migration/migration.c      | 14 +++------
 migration/options.c        |  4 +--
 migration/qemu-file.c      | 20 +++++++-----
 migration/savevm.c         |  6 ++--
 migration/vmstate.c        |  5 ++-
 softmmu/dirtylimit.c       | 11 ++-----
 softmmu/physmem.c          | 11 +++++++
 migration/meson.build      |  4 +--
 migration/trace-events     |  4 +--
 13 files changed, 97 insertions(+), 67 deletions(-)

-- 
2.40.1


