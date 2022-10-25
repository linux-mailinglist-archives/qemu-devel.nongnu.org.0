Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51BC60CA7E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 13:02:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onHb8-0003c8-F5; Tue, 25 Oct 2022 06:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1onHb1-0003VI-ON
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1onHay-0006Wz-Pi
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666695342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EfIbE9oy5Uirbnv8e/Y+kEUsESAdb1TymdYZ7K3dvq4=;
 b=HWYG7invjFrasLd/zrN63McMCVrdRjdsdXsSApuH3cKhTea5/iRmafh/pX92sI+rQmHFvw
 tH7AuDYLleXhVEY7Gaf9Oys2az9J0yjtl7GejVMJIYJ+/h1rQ4J0bZgt0R/mFVk9QX8exL
 2pSpLQuNwb/AWrXDuXpu5Ao+BuLSGag=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-5DdCRbM9Mbi1d7c6FPMm6Q-1; Tue, 25 Oct 2022 06:55:40 -0400
X-MC-Unique: 5DdCRbM9Mbi1d7c6FPMm6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9433B82DFDB
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 10:55:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EAD840C6EC6;
 Tue, 25 Oct 2022 10:55:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH] tests: Create fifo for test-io-channel-command
Date: Tue, 25 Oct 2022 12:55:20 +0200
Message-Id: <20221025105520.3016-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Previous commit removed the creation of the fifo.  Without it, I get
random failure during tests with high load, please consider
reintroduce it.

My guess is that there is a race between the two socats when we leave
them to create the channel, better return to the previous behavior.

I can't reproduce the problem when I run ./test-io-channel-command
test alone, I need to do the make check.  And any (unrelated) change
can make it dissapear.

commit 76f5148c21b4543e62a6ad605ac4b44133421401
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Thu Oct 6 15:36:57 2022 +0400

    tests/unit: make test-io-channel-command work on win32

    This has been tested under msys2 & windows 11. I haven't tried to make
    it work with other environments yet, but that should be enough to
    validate the channel-command implementation anyway.

    Here are the changes:
    - drop tests/ from fifo/pipe path, to avoid directory issues
    - use g_find_program() to lookup the socat executable (otherwise we
    would need to change ChanneCommand to use G_SPAWN_SEARCH_PATH, and deal
    with missing socat differently)
    - skip the "echo" test when socat is missing as well

    Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-Id: <20221006113657.2656108-7-marcandre.lureau@redhat.com>

Failure:

[178/178] 🌓 qemu:unit / test-io-channel-command
[178/178] 🌔 qemu:unit / test-io-channel-command
[178/178] 🌕 qemu:unit / test-io-channel-command
[178/178] 🌖 qemu:unit / test-io-channel-command
[178/178] 🌗 qemu:unit / test-io-channel-command
[178/178] 🌘 qemu:unit / test-io-channel-command
[178/178] 🌑 qemu:unit / test-io-channel-command
[178/178] 🌒 qemu:unit / test-io-channel-command
[178/178] 🌓 qemu:unit / test-io-channel-command
^CWARNING: Received SIGTERM, exiting
178/178 qemu:unit / test-io-channel-command                                    INTERRUPT      1127.75s   killed by signal 15 SIGTERM
>>> MALLOC_PERTURB_=149 G_TEST_BUILDDIR=/scratch/qemu/multifd/x64/tests/unit G_TEST_SRCDIR=/mnt/code/qemu/multifd/tests/unit /scratch/qemu/multifd/x64/tests/unit/test-io-channel-command --tap -k
――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
stderr:
2022/10/25 12:32:48 socat[463140] E mkfifo(test-io-channel-command.fifo, 438): File exists

TAP parsing error: Too few tests run (expected 4, got 0)
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

Summary of Failures:

178/178 qemu:unit / test-io-channel-command                           INTERRUPT      1127.75s   killed by signal 15 SIGTERM

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/unit/test-io-channel-command.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 7eee939c07..7e75f960f4 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -48,6 +48,9 @@ static void test_io_channel_command_fifo(bool async)
     }
 
     unlink(TEST_FIFO);
+    if (mkfifo(TEST_FIFO, 0600) < 0) {
+        abort();
+    }
     src = QIO_CHANNEL(qio_channel_command_new_spawn(srcargv,
                                                     O_WRONLY,
                                                     &error_abort));
-- 
2.37.3


