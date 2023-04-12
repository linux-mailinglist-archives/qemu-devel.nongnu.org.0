Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BB06E0121
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:46:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmiHJ-0008Lu-2J; Wed, 12 Apr 2023 17:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHF-0008LP-4L
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHD-0006Zk-AD
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681335914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y2g8pT/42tOgsKZz0QoJJ4BBgH1Ac8jfDYquFwTNtD4=;
 b=i/LIRQ/8YyQndNN7lHekbVsLd6PV/ln2ua69fyOZFYinkyFpNFBOpnS1e4LdxgFJ74YzWf
 5lZdiy2VFSpsJ9l/IOPNatnHe/3cb7kOrKG+yZCXEioF61wdGgxKSmyhmkaQiBBlOuWMrx
 pXezyrNctk1cC+11cl/8hpGvWfZCfig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-IqHbMk2EMSaAl6cHzLvQ8g-1; Wed, 12 Apr 2023 17:45:10 -0400
X-MC-Unique: IqHbMk2EMSaAl6cHzLvQ8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5993F101A552;
 Wed, 12 Apr 2023 21:45:10 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0BA41121320;
 Wed, 12 Apr 2023 21:45:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 0/5] Migration 20230412 patches
Date: Wed, 12 Apr 2023 23:45:02 +0200
Message-Id: <20230412214507.19816-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

The following changes since commit abb02ce0e76a8e00026699a863ab2d11d88f56d4:

  Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-04-11 16:19:06 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230412-pull-request

for you to fetch changes up to 28ef5339c37f1f78c2fa4df2295bc0cd73a0abfd:

  migration: fix ram_state_pending_exact() (2023-04-12 22:47:50 +0200)

----------------------------------------------------------------
Migration Pull request for 8.0

Last patches found:
- peter xu preempt channel fixes.
  needed for backward compatibility with old machine types.
- lukas fix to get compress working again.

- fix ram on s390x.  Get back to the old code, even when it shouldn't
  be needed, but as it fails on s390x, just revert.

Later, Juan.

----------------------------------------------------------------

Juan Quintela (1):
  migration: fix ram_state_pending_exact()

Lukas Straub (1):
  migration/ram.c: Fix migration with compress enabled

Peter Xu (3):
  io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on server side
  migration: Fix potential race on postcopy_qemufile_src
  migration: Recover behavior of preempt channel creation for pre-7.2

 migration/migration.h    | 41 +++++++++++++++++++++++++++++++++++++++-
 hw/core/machine.c        |  1 +
 io/channel-tls.c         |  3 +++
 migration/migration.c    | 19 +++++++++++++++++--
 migration/postcopy-ram.c | 30 ++++++++++++++++++++++-------
 migration/ram.c          | 27 +++++++++++++-------------
 6 files changed, 97 insertions(+), 24 deletions(-)

-- 
2.39.2


