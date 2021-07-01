Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678333B9224
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 15:17:39 +0200 (CEST)
Received: from localhost ([::1]:50844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lywZV-0006OY-UE
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 09:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lywX9-0005WE-Fu
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 09:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lywX7-0006UG-0s
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 09:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625145306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ji3TNfZl81ftYIYktheoPwdbHcBoL4mBdEmmPxI7SB8=;
 b=SVxfIWwtKL41OQguzzocpt29qMNYlplHFBbe2Il07OY71LKE1AdD2pDakbZ5ePQIb/Jc5i
 6AbAG0mkX1rb5ymYk7KeoA/SLC+nHgpk86smND7sMoyxEo9DAG9bJzgES7oHkYlUcoYL8G
 YwJRWxvr1NYB+S559cPGWqgXFDDKLJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-xfC4CzjAPPCeHImuZxqqMg-1; Thu, 01 Jul 2021 09:15:04 -0400
X-MC-Unique: xfC4CzjAPPCeHImuZxqqMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DDAC100A8F4
 for <qemu-devel@nongnu.org>; Thu,  1 Jul 2021 13:15:01 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1804D19C44;
 Thu,  1 Jul 2021 13:14:59 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration: failover: emit a warning when the card is not
 fully unplugged
Date: Thu,  1 Jul 2021 15:14:58 +0200
Message-Id: <20210701131458.112036-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the migration fails or is canceled we wait the end of the unplug
operation to be able to plug it back. But if the unplug operation
is never finished we stop to wait and QEMU emits a warning to inform
the user.

Based-on: 20210629155007.629086-1-lvivier@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 migration/migration.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 3b06d43a7f42..e065c62e5189 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3689,6 +3689,10 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
             while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
                 qemu_sem_timedwait(&s->wait_unplug_sem, 250);
             }
+            if (qemu_savevm_state_guest_unplug_pending()) {
+                warn_report("migration: partially unplugged device on "
+                            "failure");
+            }
         }
 
         migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
-- 
2.31.1


