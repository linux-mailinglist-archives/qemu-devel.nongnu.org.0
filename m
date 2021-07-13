Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6AF3C7324
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:28:00 +0200 (CEST)
Received: from localhost ([::1]:34304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KKF-0001A1-4C
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGV-0002vJ-D9
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:24:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGT-0001tR-QQ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KoVCc6jUhG+Bk0Xar0TTM2OqPHLVk686edut6IUc4E=;
 b=fAJT2uVUFMU0LEBANG0ulvRnsVxCe5HJYSXMrOwwVjUDrK3ZPWn2MtKOG+YvdkGpqjFqdn
 izXB5n0dmODB4rlAAvJ/rY8iYVIMOwxqLoeRsaeX3vFLxpzrpSdAetnrGn1WBAhPn/D9k0
 fGJ+1WmDqcpWFUErv/fppwCha4Dq3g4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-wAJjnaEDM4qsUvvQWASBZg-1; Tue, 13 Jul 2021 11:24:03 -0400
X-MC-Unique: wAJjnaEDM4qsUvvQWASBZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 455901080A64;
 Tue, 13 Jul 2021 15:24:02 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-214.ams2.redhat.com
 [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D49E55DAA5;
 Tue, 13 Jul 2021 15:23:51 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, lizhijian@cn.fujitsu.com, lvivier@redhat.com,
 peterx@redhat.com
Subject: [PULL 2/6] migration: failover: emit a warning when the card is not
 fully unplugged
Date: Tue, 13 Jul 2021 16:23:20 +0100
Message-Id: <20210713152324.217255-3-dgilbert@redhat.com>
In-Reply-To: <20210713152324.217255-1-dgilbert@redhat.com>
References: <20210713152324.217255-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

When the migration fails or is canceled we wait the end of the unplug
operation to be able to plug it back. But if the unplug operation
is never finished we stop to wait and QEMU emits a warning to inform
the user.

Based-on: 20210629155007.629086-1-lvivier@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20210701131458.112036-1-lvivier@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 5ff7ba9d5c..d717cd089a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3701,6 +3701,10 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
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


