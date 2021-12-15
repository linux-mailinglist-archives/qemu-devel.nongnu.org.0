Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169BE4756B5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:43:35 +0100 (CET)
Received: from localhost ([::1]:36382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRkz-0000dK-HA
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:43:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaO-0002ve-QO
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaM-0007GX-UZ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkIeKNzahnBYlfvSNTMD6VEokpYIrrRe3YW8hPKtdgY=;
 b=Dx5M8Vvg5kBRpdXxZsafeDDBit+/392JGV1atdARrQ9y2NFqi080jz9swn+opa6vVoLZZ/
 vk2qhi3bHStYpDliOxACn0PLs5bD44C6z8U5oSCTy+tj/B4LdEwaugTkQGxkriLACuvlHo
 +MSNNfmwCjiz0+vhBthHqVk6d++0I1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-gOpvy0PfPGqe4PdLd77aGw-1; Wed, 15 Dec 2021 05:32:29 -0500
X-MC-Unique: gOpvy0PfPGqe4PdLd77aGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ED9910144E0;
 Wed, 15 Dec 2021 10:32:27 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9F2375C3A;
 Wed, 15 Dec 2021 10:32:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/18] Fixed a QEMU hang when guest poweroff in COLO mode
Date: Wed, 15 Dec 2021 11:32:03 +0100
Message-Id: <20211215103218.17527-4-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, "Rao, Lei" <lei.rao@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

When the PVM guest poweroff, the COLO thread may wait a semaphore
in colo_process_checkpoint().So, we should wake up the COLO thread
before migration shutdown.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/colo.h |  1 +
 migration/colo.c         | 20 ++++++++++++++++++++
 migration/migration.c    |  6 ++++++
 3 files changed, 27 insertions(+)

diff --git a/include/migration/colo.h b/include/migration/colo.h
index 768e1f04c3..5fbe1a6d5d 100644
--- a/include/migration/colo.h
+++ b/include/migration/colo.h
@@ -37,4 +37,5 @@ COLOMode get_colo_mode(void);
 void colo_do_failover(void);
 
 void colo_checkpoint_notify(void *opaque);
+void colo_shutdown(void);
 #endif
diff --git a/migration/colo.c b/migration/colo.c
index c8fadae956..2a85504966 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -819,6 +819,26 @@ static void colo_wait_handle_message(MigrationIncomingState *mis,
     }
 }
 
+void colo_shutdown(void)
+{
+    MigrationIncomingState *mis = NULL;
+    MigrationState *s = NULL;
+
+    switch (get_colo_mode()) {
+    case COLO_MODE_PRIMARY:
+        s = migrate_get_current();
+        qemu_event_set(&s->colo_checkpoint_event);
+        qemu_sem_post(&s->colo_exit_sem);
+        break;
+    case COLO_MODE_SECONDARY:
+        mis = migration_incoming_get_current();
+        qemu_sem_post(&mis->colo_incoming_sem);
+        break;
+    default:
+        break;
+    }
+}
+
 void *colo_process_incoming_thread(void *opaque)
 {
     MigrationIncomingState *mis = opaque;
diff --git a/migration/migration.c b/migration/migration.c
index abaf6f9e3d..c0ab86e9a5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -225,6 +225,12 @@ void migration_cancel(const Error *error)
 
 void migration_shutdown(void)
 {
+    /*
+     * When the QEMU main thread exit, the COLO thread
+     * may wait a semaphore. So, we should wakeup the
+     * COLO thread before migration shutdown.
+     */
+    colo_shutdown();
     /*
      * Cancel the current migration - that will (eventually)
      * stop the migration using this structure
-- 
2.33.1


