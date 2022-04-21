Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F20050A698
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:09:07 +0200 (CEST)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaIg-0008Gj-QZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrU-0007bF-Il
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrR-00031l-JX
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650559252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y0lkjnstftHvEWcnPknjyLC6Gou0cieqZxc6j5TCNv0=;
 b=i3c28+lOoND6Ys8PwpQUxBBaIrHo2UblB35E/EWWZYK3Ktwf2JxPtFC8fbuOCJ84EZ4NnF
 XAQMPoKQDdtvHM3vNW8QvUnvvnFnbPyssQ8lsu/ajgvgXrhHRmD1ZXazKvGujPrby6GL3S
 UMoRwaZyh7Z4jpa5b3TIet5gTfJRZlw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-Ow8sdvqAOQq_aOxLZNdQ4w-1; Thu, 21 Apr 2022 12:40:50 -0400
X-MC-Unique: Ow8sdvqAOQq_aOxLZNdQ4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6996B85A5BC
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 16:40:50 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A02E740D016E;
 Thu, 21 Apr 2022 16:40:49 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 00/18] migration queue
Date: Thu, 21 Apr 2022 17:40:25 +0100
Message-Id: <20220421164043.209703-1-dgilbert@redhat.com>
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 401d46789410e88e9e90d76a11f46e8e9f358d55:

  Merge tag 'pull-target-arm-20220421' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-04-21 08:04:43 -0700)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220421b

for you to fetch changes up to 25e7d2fd25d133a9f714443974b51e50416546a5:

  migration: Read state once (2022-04-21 17:33:50 +0100)

----------------------------------------------------------------
Migration pull 2022-04-21

  Dan: Test fixes and improvements (TLS mostly)
  Peter: Postcopy improvements
  Me: Race fix for info migrate, and compilation fix

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
 migration/migration.c               |  68 ++++---
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
 12 files changed, 269 insertions(+), 238 deletions(-)


