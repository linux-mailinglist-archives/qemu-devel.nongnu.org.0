Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53550A84F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:43:49 +0200 (CEST)
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbmO-0004WX-LV
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjn-0001aW-QF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbji-0005y6-Eq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650566460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E8W16U00oTH5pu5L79TWdVGIT2OQxHm6dPel0yLMghM=;
 b=QDPLvU5MugSa27x814dnTpDVDHqHL6xo5SeRGYalIX2LTViY55wFsZR7zL99KR7pAabrhn
 Tnk1/OLmuE9CouIlNS1F7hi1Se8vSINq4/2E8vdKFsgHSV5jFRd9A/GKBksIYDNcTkewIF
 a3Prtr1iQgWjzKRUEDEik/JHXMvXNMM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-7wUuJGglNBKHWW24JQizYg-1; Thu, 21 Apr 2022 14:40:59 -0400
X-MC-Unique: 7wUuJGglNBKHWW24JQizYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 637AB833967
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 18:40:59 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CFC540C1438;
 Thu, 21 Apr 2022 18:40:58 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 00/18] migration queue
Date: Thu, 21 Apr 2022 19:40:34 +0100
Message-Id: <20220421184052.306581-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 28298069afff3eb696e4995e63b2579b27adf378:

  Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-04-21 09:27:54 -0700)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220421a

for you to fetch changes up to 552de79bfdd5e9e53847eb3c6d6e4cd898a4370e:

  migration: Read state once (2022-04-21 19:36:46 +0100)

----------------------------------------------------------------
V2: Migration pull 2022-04-21

  Dan: Test fixes and improvements (TLS mostly)
  Peter: Postcopy improvements
  Me: Race fix for info migrate, and compilation fix

V2:
  Fixed checkpatch nit of unneeded NULL check

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Daniel P. Berrangé (9):
      tests: improve error message when saving TLS PSK file fails
      tests: support QTEST_TRACE env variable
      tests: print newline after QMP response in qtest logs
      migration: fix use of TLS PSK credentials with a UNIX socket
      tests: switch MigrateStart struct to be stack allocated
      tests: merge code for UNIX and TCP migration pre-copy tests
      tests: introduce ability to provide hooks for migration precopy test
      tests: switch migration FD passing test to use common precopy helper
      tests: expand the migration precopy helper to support failures

Dr. David Alan Gilbert (2):
      migration: Fix operator type
      migration: Read state once

Peter Xu (7):
      migration: Postpone releasing MigrationState.hostname
      migration: Drop multifd tls_hostname cache
      migration: Add pss.postcopy_requested status
      migration: Move migrate_allow_multifd and helpers into migration.c
      migration: Export ram_load_postcopy()
      migration: Move channel setup out of postcopy_try_recover()
      migration: Allow migrate-recover to run multiple times

 migration/channel.c                 |   1 -
 migration/migration.c               |  66 ++++---
 migration/migration.h               |   4 +-
 migration/multifd.c                 |  29 +--
 migration/multifd.h                 |   4 -
 migration/ram.c                     |  10 +-
 migration/ram.h                     |   1 +
 migration/savevm.c                  |   3 -
 migration/tls.c                     |   4 -
 tests/qtest/libqtest.c              |  13 +-
 tests/qtest/migration-test.c        | 368 ++++++++++++++++++++----------------
 tests/unit/crypto-tls-psk-helpers.c |   2 +-
 12 files changed, 267 insertions(+), 238 deletions(-)


