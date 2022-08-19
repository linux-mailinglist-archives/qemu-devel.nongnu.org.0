Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF755994CF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 07:48:10 +0200 (CEST)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOurY-0000ka-RG
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 01:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOuhy-0003Ln-Sx
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 01:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOuhv-0002mk-KX
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 01:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660887489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zuRGcUGlCdmD5fPLrt3U9qnOGeB/39pFfxpC13Fzk08=;
 b=QZBqNwcB8kN7Ws4LYuQCjcOhHvkdb1ySwrq6wNIcLmsLvUb8UQYKSq8DaNd6pjjCxkJC6E
 jWV00V8BpcAZ+SdfjlxKG/HQU2ki9aBb1PxJ5eB1l4cSqdzC6hB5kpq+/W+dsqLVUlZ6pB
 lIjKVCfYNsC4LnOU7We+ZTOUilMtkWM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-bYuhJfJlNDiJIeJPMeLncQ-1; Fri, 19 Aug 2022 01:38:06 -0400
X-MC-Unique: bYuhJfJlNDiJIeJPMeLncQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C93111C05ECA;
 Fri, 19 Aug 2022 05:38:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89B5B4010E3C;
 Fri, 19 Aug 2022 05:38:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 0/4] Speed up migration tests
Date: Fri, 19 Aug 2022 07:37:58 +0200
Message-Id: <20220819053802.296584-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are currently facing the problem that the "gcov-gprof" CI jobs
in the gitlab-CI are running way too long - which happens since
the migration-tests have been enabled there recently.

These patches now speed up the migration tests, so that the
CI job should be fine again.

This is how it looked like before my modifications:

 https://gitlab.com/thuth/qemu/-/jobs/2888957948#L46
 ...
 5/243 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test  OK  1265.22s
 8/243 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test    OK  1138.82s

And this is how it looks like after the patches have been applied:

 https://gitlab.com/thuth/qemu/-/jobs/2905108018#L48
 ...
 5/243 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test  OK   251.14s
 8/243 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test    OK   336.94s

That means the CI job is running ca. 30 minutes faster here now!

Thomas Huth (4):
  tests/qtest/migration-test: Only wait for serial output where
    migration succeeds
  tests/migration/aarch64: Speed up the aarch64 migration test
  tests/migration/i386: Speed up the i386 migration test (when using
    TCG)
  tests/qtest/migration-test: Remove duplicated test_postcopy from the
    test plan

 tests/migration/aarch64/a-b-kernel.h | 10 +++++-----
 tests/migration/i386/a-b-bootblock.h | 12 ++++++------
 tests/qtest/migration-test.c         |  5 +++--
 tests/migration/aarch64/a-b-kernel.S |  3 +--
 tests/migration/i386/a-b-bootblock.S |  1 +
 5 files changed, 16 insertions(+), 15 deletions(-)

-- 
2.31.1


