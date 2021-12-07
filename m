Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FA46C48E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 21:24:22 +0100 (CET)
Received: from localhost ([::1]:35022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muh0f-0004A1-3e
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 15:24:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mugwq-0002DF-MF
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 15:20:24 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:42932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mugwc-0006JL-Tp
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 15:20:23 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A313621B3F;
 Tue,  7 Dec 2021 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638908403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9h3qWKusKD/7kFyUyw8iXJBkC/wbJ1LpA1cD9mAbUL8=;
 b=E5qlQXB8gDghOn1R8kZ3+kiRFZRj0XuJYadOJ60JVOBKtNY50g8rfzlztm1yXQ09p11gWi
 IutOG8jRk5CZBPMN4GGIocTHcB7aJHpAMHMmEOzuKi84FWF+CUZoyjmj7wTQLKPHTm5mIX
 bcAHhQCdCX0CpfYrCBMKS9gVR6Bzqt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638908403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9h3qWKusKD/7kFyUyw8iXJBkC/wbJ1LpA1cD9mAbUL8=;
 b=xGGdRcnnYCxnrc/7EZwegh9KCYkA2YhyGISYfY7CeqmT0G9zjNDEdYY+o0DBWsuRciCPYO
 t0LMmyei8rZsKjAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6999B13ABA;
 Tue,  7 Dec 2021 20:20:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZA1wGPPBr2F+BQAAMHmgww
 (envelope-from <lizhang@suse.de>); Tue, 07 Dec 2021 20:20:03 +0000
From: Li Zhang <lizhang@suse.de>
To: quintela@redhat.com, dgilbert@redhat.com, cfontana@suse.de,
 qemu-devel@nongnu.org
Subject: [PATCH v3 1/1] multifd: Shut down the QIO channels to avoid blocking
 the send threads when they are terminated
Date: Tue,  7 Dec 2021 21:06:04 +0100
Message-Id: <20211207200604.3015-1-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When doing live migration with multifd channels 8, 16 or larger number,
the guest hangs in the presence of the network errors such as missing TCP ACKs.

At sender's side:
The main thread is blocked on qemu_thread_join, migration_fd_cleanup
is called because one thread fails on qio_channel_write_all when
the network problem happens and other send threads are blocked on sendmsg.
They could not be terminated. So the main thread is blocked on qemu_thread_join
to wait for the threads terminated.

(gdb) bt
0  0x00007f30c8dcffc0 in __pthread_clockjoin_ex () at /lib64/libpthread.so.0
1  0x000055cbb716084b in qemu_thread_join (thread=0x55cbb881f418) at ../util/qemu-thread-posix.c:627
2  0x000055cbb6b54e40 in multifd_save_cleanup () at ../migration/multifd.c:542
3  0x000055cbb6b4de06 in migrate_fd_cleanup (s=0x55cbb8024000) at ../migration/migration.c:1808
4  0x000055cbb6b4dfb4 in migrate_fd_cleanup_bh (opaque=0x55cbb8024000) at ../migration/migration.c:1850
5  0x000055cbb7173ac1 in aio_bh_call (bh=0x55cbb7eb98e0) at ../util/async.c:141
6  0x000055cbb7173bcb in aio_bh_poll (ctx=0x55cbb7ebba80) at ../util/async.c:169
7  0x000055cbb715ba4b in aio_dispatch (ctx=0x55cbb7ebba80) at ../util/aio-posix.c:381
8  0x000055cbb7173ffe in aio_ctx_dispatch (source=0x55cbb7ebba80, callback=0x0, user_data=0x0) at ../util/async.c:311
9  0x00007f30c9c8cdf4 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
10 0x000055cbb71851a2 in glib_pollfds_poll () at ../util/main-loop.c:232
11 0x000055cbb718521c in os_host_main_loop_wait (timeout=42251070366) at ../util/main-loop.c:255
12 0x000055cbb7185321 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
13 0x000055cbb6e6ba27 in qemu_main_loop () at ../softmmu/runstate.c:726
14 0x000055cbb6ad6fd7 in main (argc=68, argv=0x7ffc0c578888, envp=0x7ffc0c578ab0) at ../softmmu/main.c:50

To make sure that the send threads could be terminated, IO channels should be
shut down to avoid waiting IO.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Li Zhang <lizhang@suse.de>
---
v3 - >v2: 
    Move the channel shutdown before the semaphore post.

 migration/multifd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 7c9deb1921..f9423be12d 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -522,6 +522,9 @@ static void multifd_send_terminate_threads(Error *err)
 
         qemu_mutex_lock(&p->mutex);
         p->quit = true;
+        if (p->c) {
+            qio_channel_shutdown(p->c, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        }
         qemu_sem_post(&p->sem);
         qemu_mutex_unlock(&p->mutex);
     }
-- 
2.31.1


