Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E032E452883
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 04:24:21 +0100 (CET)
Received: from localhost ([::1]:40624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmp52-0002sH-Pb
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 22:24:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mmp3a-0002Bx-J9
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 22:22:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mmp3X-0002z7-3K
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 22:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637032965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=giOEaXwe1lZOzIA8dqAnnSeaKLmIIk+jcOcD2sf8AwI=;
 b=DA9QYlESgxE9Pb9AD0uZN3NxAWr4noZMVVQHMKt8ubn0jLRL83vAP719ZpO9hJV4/o3KTf
 Pgysq3sL/c/HQT/AUsYx7BgaRWosvmzq8RD+6CD5OwrQcxCxXvYOjrm/8zdIiNSaS160ei
 yJpHlJOYaIVOveOZDw0dvf+5vS/qxVo=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390--Z2uvUtwO3KFSNGQviiKMg-1; Mon, 15 Nov 2021 22:22:44 -0500
X-MC-Unique: -Z2uvUtwO3KFSNGQviiKMg-1
Received: by mail-pj1-f70.google.com with SMTP id
 lt10-20020a17090b354a00b001a649326aedso606649pjb.5
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 19:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=giOEaXwe1lZOzIA8dqAnnSeaKLmIIk+jcOcD2sf8AwI=;
 b=QXiZtnNB38xE/5Jw04Dm2/eMDyEg1u3lvNN9bFPAyBq0QaCRdZ11xz2AJsP5MVoRg9
 kPsQJMuFhHH+BvJ+g/AmrsowA4hyYnoFk42k+Memm4KeFzrCkdh0bHbLvh3m50QxImLX
 pcky6NFJR+qBlJvJVjOsvP62XIZFzjvGpbm9eTvtr2v+ah2QcnXRRMaQddzPoTjtbyX8
 LBCpzHfvR9LJe+qcma1jwxYjJY+8ZDW+v9RzH9DDYquVpx2dSu1W/t1ZzaeWXW7GNtoO
 9Ov/iecJ/AYz4Dp0I85yo1ljfay6xFxP3TC5cX8wIQo3V9jz3Ly0y3jEvetI21AifMoV
 P2Wg==
X-Gm-Message-State: AOAM533KwFC11Bf1Qnyw3o8zensXUrlnV2bVDXMUk8m4DIQylqtAIdq4
 NnePIgVy4E2BhUyuCirfNcI3cHiMyRd6OIXu3TNVh+aCePlCmgQmE541qCFxinU2TMAjhcNTngP
 miWU/+qxWbRMsbK08mOmpMdRJf6YMiN8n7jI0TKsUcaaWIwcCvqEclY3n2MJfkRW8
X-Received: by 2002:a62:8cc2:0:b0:480:ffe3:9eeb with SMTP id
 m185-20020a628cc2000000b00480ffe39eebmr36608462pfd.82.1637032962761; 
 Mon, 15 Nov 2021 19:22:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzI984kcKDey1GMCIIW4aZY+ueai1JXlOu6G4iiy9tbRIdEU5+Xr8TDeZnZNR8ybE7XmzbTmQ==
X-Received: by 2002:a62:8cc2:0:b0:480:ffe3:9eeb with SMTP id
 m185-20020a628cc2000000b00480ffe39eebmr36608431pfd.82.1637032962328; 
 Mon, 15 Nov 2021 19:22:42 -0800 (PST)
Received: from localhost.localdomain ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id p43sm6443407pfw.4.2021.11.15.19.22.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Nov 2021 19:22:41 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] dump-guest-memory: Use BQL to protect dump finalize process
Date: Tue, 16 Nov 2021 11:22:34 +0800
Message-Id: <20211116032234.1775-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
be accessing dump state in paralell.  That's racy.

Fix it by protecting the finalizing phase of dump-guest-memory using BQL as
well.  To do that, we expand the BQL from dump_cleanup() into dump_process(),
so we will take the BQL longer than before.  The critical section must cover
the status switch from ACTIVE->{FAIL|COMPLETE} so as to make sure there's no
race any more.

We can also just introduce a specific mutex to serialize the dump process, but
BQL should be enough for now so far, not to mention vm_start() in dump_cleanup
will need BQL anyway, so maybe easier to just use the same mutex.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
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


