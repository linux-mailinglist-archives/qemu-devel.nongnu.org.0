Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D2B2B0CF6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:49:23 +0100 (CET)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHes-0000LI-3Z
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUj-00034f-BQ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUe-0006Xc-Ju
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605206321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6nEKmLj5d6+j+dkyP524BhEMIkn9lxQsJrf3oP85Is=;
 b=HFp9vTAcgn/RblC/SdoTPsUZ6VOVy7sstbZzLjT42St/PhxSlXS5jMmIcau/JmAcOPUNxl
 rc/sBvWhe9rfjqm3XftE6QvQnJM3bpxM1dPq6VUoyL+dX6lSOECbW//YWnYnJCi0r/DwDN
 Uk6laPsD76O1GooCQWpx931YNFKT7ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-OW6OZLt3PM2iDSNfQYbEOw-1; Thu, 12 Nov 2020 13:38:39 -0500
X-MC-Unique: OW6OZLt3PM2iDSNfQYbEOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73019101F00D;
 Thu, 12 Nov 2020 18:38:38 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-60.ams2.redhat.com
 [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65DB55D9E4;
 Thu, 12 Nov 2020 18:38:36 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kuhn.chenqun@huawei.com, zhengchuan@huawei.com,
 lihaotian9@huawei.com, longpeng2@huawei.com, liangpeng10@huawei.com,
 philmd@redhat.com, liuzhiqiang26@huawei.com
Subject: [PULL 07/11] migration: handle CANCELLING state in
 migration_completion()
Date: Thu, 12 Nov 2020 18:37:54 +0000
Message-Id: <20201112183758.203176-8-dgilbert@redhat.com>
In-Reply-To: <20201112183758.203176-1-dgilbert@redhat.com>
References: <20201112183758.203176-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Longpeng(Mike)" <longpeng2@huawei.com>

The following sequence may cause the VM abort during migration:

1. RUN_STATE_RUNNING,MIGRATION_STATUS_ACTIVE

2. before call migration_completion(), we send migrate_cancel
   QMP command, the state machine is changed to:
     RUN_STATE_RUNNING,MIGRATION_STATUS_CANCELLING

3. call migration_completion(), and the state machine is
   switch to: RUN_STATE_RUNNING,MIGRATION_STATUS_COMPLETED

4. call migration_iteration_finish(), because the migration
   status is COMPLETED, so it will try to set the runstate
   to POSTMIGRATE, but RUNNING-->POSTMIGRATE is an invalid
   transition, so abort().

The migration_completion() should not change the migration state
to COMPLETED if it is already changed to CANCELLING.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
Message-Id: <20201105091726.148-1-longpeng2@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index f696e22fab..87a9b59f83 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3061,6 +3061,8 @@ static void migration_completion(MigrationState *s)
 
         qemu_savevm_state_complete_postcopy(s->to_dst_file);
         trace_migration_completion_postcopy_end_after_complete();
+    } else if (s->state == MIGRATION_STATUS_CANCELLING) {
+        goto fail;
     }
 
     /*
-- 
2.28.0


