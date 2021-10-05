Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D99C4220AC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:29:02 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfor-00073U-Ag
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXfUz-0004sh-7N
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXfUw-0004D4-Va
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633421305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akrOFtpruS1rTHiywU72c7V0Xb/PMo08R6jbqyEsitE=;
 b=GbbLrVRZw7kAUKNv1Xx46fQwrQOcBHf0ubKmHmt/X3tkHtbxSo5R9unHkNqmBTLwxW+1ZL
 MX4d0LUQKjmqhGG/sl59Z6VOvcGjgEg3OJYWg7PF7y10dzjAav8IHb8iLiWtsZVmsxOzI9
 PqPgqlhZmwReFBvboPHkWFttdoqbM8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-3oS-irVkO4yw4pV6MUmjbQ-1; Tue, 05 Oct 2021 04:08:24 -0400
X-MC-Unique: 3oS-irVkO4yw4pV6MUmjbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97443CC62B;
 Tue,  5 Oct 2021 08:08:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2BC210013C1;
 Tue,  5 Oct 2021 08:08:22 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v1 2/2] migration: add missing qemu_mutex_lock_iothread in
 migration_completion
Date: Tue,  5 Oct 2021 04:07:51 -0400
Message-Id: <20211005080751.3797161-3-eesposit@redhat.com>
In-Reply-To: <20211005080751.3797161-1-eesposit@redhat.com>
References: <20211005080751.3797161-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_savevm_state_complete_postcopy assumes the iothread lock (BQL)
to be held, but instead it isn't.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 migration/migration.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 041b8451a6..215d5281f2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3182,7 +3182,10 @@ static void migration_completion(MigrationState *s)
     } else if (s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE) {
         trace_migration_completion_postcopy_end();
 
+        qemu_mutex_lock_iothread();
         qemu_savevm_state_complete_postcopy(s->to_dst_file);
+        qemu_mutex_unlock_iothread();
+
         trace_migration_completion_postcopy_end_after_complete();
     } else if (s->state == MIGRATION_STATUS_CANCELLING) {
         goto fail;
-- 
2.27.0


