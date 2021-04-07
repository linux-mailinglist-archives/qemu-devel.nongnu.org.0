Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28200356964
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:22:40 +0200 (CEST)
Received: from localhost ([::1]:49312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5KZ-0001WH-7E
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lU5Ib-0000Cv-UQ
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lU5IX-0002bL-5a
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617790831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bfNLJRA8WpCR0mKP2sZGSQuEPC1/pfU4WDgWXCjsGBk=;
 b=PFeWkbRTbVTjRzWR6EJkCcZrRKqTWdRYJjHeW43RPQfwe15fEh51HoChLMZFLcxEAZGtf0
 G/A3BkYN6iI+Bh3oW404fnpvdy6tbEoGPY442YwABJT7hoqEIYJZNxX/eRUMebQ4J9arNV
 EX3LdYYM8vaMKHacHNXcn6WjawmonLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-pK8ZMH3_P9amO2ogUm9TBw-1; Wed, 07 Apr 2021 06:20:28 -0400
X-MC-Unique: pK8ZMH3_P9amO2ogUm9TBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9A9B83DEB8;
 Wed,  7 Apr 2021 10:20:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-14.ams2.redhat.com
 [10.36.115.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35519100239A;
 Wed,  7 Apr 2021 10:20:23 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com,
 huangy81@chinatelecom.cn
Subject: [PULL 0/6] migration + virtiofsd queue
Date: Wed,  7 Apr 2021 11:20:15 +0100
Message-Id: <20210407102021.95225-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The following changes since commit d0d3dd401b70168a353450e031727affee828527:

  Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-migration-20210407a

for you to fetch changes up to c4e232bb57aca19ca60f692ee830023a76eca78e:

  tests/migration: fix parameter of auto-converge migration (2021-04-06 18:56:02 +0100)

----------------------------------------------------------------
migration+virtiofs fixes pull 2021-04-07

A seg fix in virtiofsd, a bunch of fixes for background snapshots, and
a migration test fix.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Andrey Gruzdev (4):
      migration: Fix missing qemu_fflush() on buffer file in bg_migration_thread
      migration: Inhibit virtio-balloon for the duration of background snapshot
      migration: Pre-fault memory before starting background snasphot
      migration: Rename 'bs' to 'block' in background snapshot code

Dr. David Alan Gilbert (1):
      virtiofsd: Fix security.capability comparison

Hyman Huang(黄勇) (1):
      tests/migration: fix parameter of auto-converge migration

 hw/virtio/virtio-balloon.c          |   8 ++-
 include/migration/misc.h            |   2 +
 migration/migration.c               |  22 ++++++-
 migration/ram.c                     | 119 +++++++++++++++++++++++++-----------
 migration/ram.h                     |   1 +
 tests/migration/guestperf/engine.py |   4 +-
 tools/virtiofsd/passthrough_ll.c    |   3 +-
 7 files changed, 119 insertions(+), 40 deletions(-)


