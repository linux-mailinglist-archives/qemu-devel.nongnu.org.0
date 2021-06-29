Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480B83B75EA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:53:01 +0200 (CEST)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyG2l-0000gX-Uo
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lyG0U-0007a9-2B
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lyG0R-0003W9-Gw
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624981834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udk95XR3w/7N9e3qPwRBW4TboySiL2TAlAhEpqkJqMg=;
 b=JS88DbAvwBcPP0ma2DB9Zcn56AnZVDxQ9nl26BfoXTi8yVmXXkL5C72Qc08AkzkZz0nSJ+
 NA3pFbhkUucWmjNCRmbDe2THe+lawciL1B93qTm7uHzu0aC4hkO/gc27EqS+iyvpQYYTFe
 r0kfGou1Eo/5ZAoSDfljVBzSAvmWZY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-f6h-zdf3NYmvVcaOK1qZZQ-1; Tue, 29 Jun 2021 11:50:23 -0400
X-MC-Unique: f6h-zdf3NYmvVcaOK1qZZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0A8518D6A2F
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 15:50:22 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-114-217.ams2.redhat.com
 [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4891A60854;
 Tue, 29 Jun 2021 15:50:18 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] migration: failover: continue to wait card unplug on error
Date: Tue, 29 Jun 2021 17:50:07 +0200
Message-Id: <20210629155007.629086-3-lvivier@redhat.com>
In-Reply-To: <20210629155007.629086-1-lvivier@redhat.com>
References: <20210629155007.629086-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Jens Freimann <jfreimann@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the user cancels the migration in the unplug-wait state,
QEMU will try to plug back the card and this fails because the card
is partially unplugged.
To avoid the problem, continue to wait the card unplug, but to
allow the migration to be canceled if the card never finishes to unplug
use a timeout.

Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1976852
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 migration/migration.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 3e92c405a2b6..3b06d43a7f42 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3679,6 +3679,17 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
                qemu_savevm_state_guest_unplug_pending()) {
             qemu_sem_timedwait(&s->wait_unplug_sem, 250);
         }
+        if (s->state != MIGRATION_STATUS_WAIT_UNPLUG) {
+            int timeout = 120; /* 30 seconds */
+            /*
+             * migration has been canceled
+             * but as we have started an unplug we must wait the end
+             * to be able to plug back the card
+             */
+            while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
+                qemu_sem_timedwait(&s->wait_unplug_sem, 250);
+            }
+        }
 
         migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
     } else {
-- 
2.31.1


