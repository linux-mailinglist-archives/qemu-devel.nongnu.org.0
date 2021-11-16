Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5599F453355
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:56:13 +0100 (CET)
Received: from localhost ([::1]:55938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmywW-0001zb-2s
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mmyvH-00016H-AG
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:54:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mmyvE-00071D-Mb
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637070891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mH02FWyjYKDrnKAeTjz5O4J9GpJqyQpQaMeQnB7IO1A=;
 b=XiqAqYWXbZv1ln8AbfNFyfJypWW0c1ytDUtuPfBlS9mR4SC+B8Xf7h6RETsLFbuI0O9f0z
 HatxZeVWiWFO4lmSndSrr6hEdliPmHdqrMd75LZEAY6FbDiD6vNB7bomIyV4u/nPRpRuCJ
 8KSopten1BqTsFt+QAj8HUIC0TeuHCU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-pHdSzHXZNCyQ1TRoy3ERzQ-1; Tue, 16 Nov 2021 08:54:50 -0500
X-MC-Unique: pHdSzHXZNCyQ1TRoy3ERzQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 r7-20020a63ce47000000b002a5cadd2f25so10672684pgi.9
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 05:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mH02FWyjYKDrnKAeTjz5O4J9GpJqyQpQaMeQnB7IO1A=;
 b=fl1u3bZkNNQN1sVjOlEuHWBn9JQXyZq7MdvQenXvWsq2GaKueBVD1b4MpSPxjkfCHn
 Dab4DbrbromSErb6RIl5COMz6YbHQstTB2cq1Y5GgcDUVu0hDRsmtRnG1hRs9KxoUDXZ
 hsPU2rncspUqufLM/wb6SKFk+9JEaRGepDHwslnl0q+5NNE26/YUh3R8Fr2IVqaKPahO
 VLqaA232eeecaLCJm5ALvupKHOp1HEtwRtDo4pdAEa0cOe1qQf2OYXw+ttyuEVonPzGT
 YhUD3+gWVu0m3Z1Dyjb566H/FIRTJDIG/8lNkVdpgov92hFCJUnFEQOBNFxGmA5N9zwV
 hiyw==
X-Gm-Message-State: AOAM531cJFermYt7jwoVZdL0zaodCcTPXm7UD6SZgGc/NXTKFbH/qFzn
 biNfoHHeH2a7DFXc/QMzUGaGH8ZwJb8EKWMRWFUnZe4UsuMX7Smhan3ESzE47Iy0YFclp93G/QG
 5GoUiwZdg/iu8fGnRx1ZzUx/Ef0dCPvaq9h8o1FIRqq+Ea6SrmE3OwqlYUTX6/04U
X-Received: by 2002:a17:902:e548:b0:141:f4ae:d2bd with SMTP id
 n8-20020a170902e54800b00141f4aed2bdmr46127496plf.41.1637070888916; 
 Tue, 16 Nov 2021 05:54:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUQ7/u/Gv/CcGWs5KCpb1XyV0cIcqXJQEWPHmqBW+x17J/kXyJ3VjpN85hdx0UHmk7Sk1DNA==
X-Received: by 2002:a17:902:e548:b0:141:f4ae:d2bd with SMTP id
 n8-20020a170902e54800b00141f4aed2bdmr46127455plf.41.1637070888489; 
 Tue, 16 Nov 2021 05:54:48 -0800 (PST)
Received: from localhost.localdomain ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id c3sm18674170pfm.177.2021.11.16.05.54.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Nov 2021 05:54:47 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] dump-guest-memory: Use BQL to protect dump finalize process
Date: Tue, 16 Nov 2021 21:54:41 +0800
Message-Id: <20211116135441.7711-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When finalizing the dump-guest-memory with detached mode, we'll first set dump
status to either FAIL or COMPLETE before doing the cleanup, however right after
the dump status change it's possible that another dump-guest-memory qmp command
is sent so both the main thread and dump thread (which is during cleanup) could
be accessing dump state in parallel.  That's racy.

Fix it by protecting the finalizing phase of dump-guest-memory using BQL as
well, as qmp_dump_guest_memory() (which is the QEMU main thread) requires BQL.
To do that, we expand the BQL from dump_cleanup() into dump_process(), so we
will take the BQL longer than before.  The critical section must cover the
status switch from ACTIVE->{FAIL|COMPLETE} so as to make sure there's no race
any more.

We can also just introduce a specific mutex to serialize the dump process, but
BQL should be enough for now so far, not to mention vm_start() in dump_cleanup
will need BQL anyway, so maybe easier to just use the same mutex.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
v2:
- Fix parallel spelling [Marc-Andre]
- Add r-b for Marc-Andre
- Mention that qmp_dump_guest_memory() is with BQL held [Laszlo]
---
 dump/dump.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 662d0a62cd..196b7b8ab9 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -96,13 +96,7 @@ static int dump_cleanup(DumpState *s)
     g_free(s->guest_note);
     s->guest_note = NULL;
     if (s->resume) {
-        if (s->detached) {
-            qemu_mutex_lock_iothread();
-        }
         vm_start();
-        if (s->detached) {
-            qemu_mutex_unlock_iothread();
-        }
     }
     migrate_del_blocker(dump_migration_blocker);
 
@@ -1873,6 +1867,11 @@ static void dump_process(DumpState *s, Error **errp)
     Error *local_err = NULL;
     DumpQueryResult *result = NULL;
 
+    /*
+     * When running with detached mode, these operations are not run with BQL.
+     * It's still safe, because it's protected by setting s->state to ACTIVE,
+     * so dump_in_progress() check will block yet another dump-guest-memory.
+     */
     if (s->has_format && s->format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
 #ifdef TARGET_X86_64
         create_win_dump(s, &local_err);
@@ -1883,6 +1882,15 @@ static void dump_process(DumpState *s, Error **errp)
         create_vmcore(s, &local_err);
     }
 
+    /*
+     * Serialize the finalizing of dump process using BQL to make sure no
+     * concurrent access to DumpState is allowed.  BQL is also required for
+     * dump_cleanup as vm_start() needs it.
+     */
+    if (s->detached) {
+        qemu_mutex_lock_iothread();
+    }
+
     /* make sure status is written after written_size updates */
     smp_wmb();
     qatomic_set(&s->status,
@@ -1898,6 +1906,10 @@ static void dump_process(DumpState *s, Error **errp)
 
     error_propagate(errp, local_err);
     dump_cleanup(s);
+
+    if (s->detached) {
+        qemu_mutex_unlock_iothread();
+    }
 }
 
 static void *dump_thread(void *data)
-- 
2.32.0


