Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B626BA103
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 21:55:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcBfM-0007Fr-28; Tue, 14 Mar 2023 16:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pcBfJ-0007Fc-Sr
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 16:54:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pcBfI-00028E-6X
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 16:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678827273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VhP4ZNz9whs3NwMqXuCEW9ta23i2aNl0v4hsLzYwG8k=;
 b=Po6uxA5f72DTyjNy09T6fOfZo6QFtPeV6nqi8Wr0sCBIMUSTYqhFnenJPHL1bCQObSgHtG
 TY1vzF6V7WBPVcKkiVmwMu+udqKzkYKZn+H7RpWOPSg3+MO07NRzhJPlmUidPDPtOTxNje
 lagmPaD/PCS5Jn95aYlcJIzy/7Mmijk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-ENuge0dZOX6Tcv2j0bxnQw-1; Tue, 14 Mar 2023 16:54:32 -0400
X-MC-Unique: ENuge0dZOX6Tcv2j0bxnQw-1
Received: by mail-qk1-f197.google.com with SMTP id
 az31-20020a05620a171f00b00745746178e2so4474521qkb.6
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 13:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678827271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VhP4ZNz9whs3NwMqXuCEW9ta23i2aNl0v4hsLzYwG8k=;
 b=H6DqZkM4aAQoul4q/o/qQJoCxBMqNEN2aDn6ZONX7CqkBAoEQOVi080WSslx8lXeFZ
 YP5pL74W5rRME0Rv8fBU2i5OQ70cUZox28DBV+6Mt0ZS4dwfQBve5HfRhj2vwPnn0zLY
 j6mSjZZkNH1n6Y1xqFpMJWWiX5soNlxo9XQyAESAK4rnFAMU3iwHtH+AqSJBFkp7otZj
 X7ZKYwcGnj1PyOmz1XmW913N0fyLkR5ufdCMPlwoR3Qu03OAOVOTR2ySntdP1ROAYVBS
 x8bbZYOL/SuZTFFfoDbYNWrjoMPLHhlvi9PkGOX5jwIYXlnQ3M5kLXPiQAIsfOxtE5h0
 BHCw==
X-Gm-Message-State: AO0yUKUWmh7DTXiZex8LhB8Nmb+NcVWPOi5oxhptOgJYYAKwV6cYNwk5
 XIe0z1Nm6zm2YIPkJCP16aoKobjhD4u/hxniM+TsYSitqHtv9TQQbxHpeqmiTfWdNOFY1RdQVUl
 Gi4dHTIDCKjIboJM8r+Y/8yWldsMeebyu+FInQCOOMJGgDDjrG46vCc8roIhnraDIzz6BbsRX
X-Received: by 2002:a05:622a:1821:b0:3bf:c38c:1d7a with SMTP id
 t33-20020a05622a182100b003bfc38c1d7amr29767868qtc.1.1678827271463; 
 Tue, 14 Mar 2023 13:54:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set/PkixpkFRxErYY4cSiQnhdRiJpOctN4SnuS1+vKwNJOnCZzAZ8PFI4OVR0T5lejEGOtttkYg==
X-Received: by 2002:a05:622a:1821:b0:3bf:c38c:1d7a with SMTP id
 t33-20020a05622a182100b003bfc38c1d7amr29767826qtc.1.1678827271056; 
 Tue, 14 Mar 2023 13:54:31 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 b10-20020ac8678a000000b003b9b48cdbe8sm2443674qtp.58.2023.03.14.13.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 13:54:30 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] migration: Wait on preempt channel in preempt thread
Date: Tue, 14 Mar 2023 16:54:29 -0400
Message-Id: <20230314205429.1174295-1-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

QEMU main thread will wait until dest preempt channel established during
processing the LISTEN command (within the whole postcopy PACKAGED data), by
waiting on the semaphore postcopy_qemufile_dst_done.

That's racy, because it's possible that the dest QEMU main thread hasn't
yet accept()ed the new connection when processing the LISTEN event.  The
sem_wait() will yield the main thread without being able to run anything
else including the accept() of the new socket, which can cause deadlock
within the main thread.

To avoid the race, move the "wait channel" from main thread to the preempt
thread right at the start.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 5655aab079 ("migration: Postpone postcopy preempt channel to be after main")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---

PS: This patch is supposed to fix the test breakage reported here:

https://lore.kernel.org/r/ZBBIaX+cZD5Ud2wQ@work-vm
---
 migration/postcopy-ram.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index f54f44d899..41c0713650 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1197,11 +1197,6 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
     }
 
     if (migrate_postcopy_preempt()) {
-        /*
-         * The preempt channel is established in asynchronous way.  Wait
-         * for its completion.
-         */
-        qemu_sem_wait(&mis->postcopy_qemufile_dst_done);
         /*
          * This thread needs to be created after the temp pages because
          * it'll fetch RAM_CHANNEL_POSTCOPY PostcopyTmpPage immediately.
@@ -1668,6 +1663,12 @@ void *postcopy_preempt_thread(void *opaque)
 
     qemu_sem_post(&mis->thread_sync_sem);
 
+    /*
+     * The preempt channel is established in asynchronous way.  Wait
+     * for its completion.
+     */
+    qemu_sem_wait(&mis->postcopy_qemufile_dst_done);
+
     /* Sending RAM_SAVE_FLAG_EOS to terminate this thread */
     qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
     while (1) {
-- 
2.39.1


