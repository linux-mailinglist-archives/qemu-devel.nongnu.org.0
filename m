Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317346E9751
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:37:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVOH-0001M5-Jb; Thu, 20 Apr 2023 10:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppVOE-0001Ld-B9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppVOC-0003Ge-AO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682001357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kw2+wmY8PsZERaMHjdUA9tsfMYHQUV7TrQ+rUU0d+ZA=;
 b=UDtd9loT7AdEbcETfRRU+mO+gz0epaDIJUPn/uRjQ78Pe+SRKvjtUznwf3qCLbZN9cfkcf
 peiBbYKrNau5scxYORfdeJK3M33vo4HONTOR0gb5Co2nSC4khdKGyujO6aKPUDhBqP/b1R
 xpHfPYTABBZhVN1zjsucmnDaiiVaeos=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-fgEK4cWTNOqI7T2k8v_f7g-1; Thu, 20 Apr 2023 10:35:56 -0400
X-MC-Unique: fgEK4cWTNOqI7T2k8v_f7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1111C857FB3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 14:35:56 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C19ED40BC798;
 Thu, 20 Apr 2023 14:35:55 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>
Subject: [PATCH] migration: Minor control flow simplification
Date: Thu, 20 Apr 2023 09:35:51 -0500
Message-Id: <20230420143551.419229-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

No need to declare a temporary variable.

Suggested-by: Juan Quintela <quintela@redhat.com>
Fixes: 1df36e8c6289 ("migration: Handle block device inactivation failures better")
Signed-off-by: Eric Blake <eblake@redhat.com>
---

If Juan's pull request
https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03138.html
needs a v2, then this can be squashed as a fixup to 15/20 of that
request; otherwise, this can go on top whenever convenient.

 migration/migration.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 7b0d4a9d8f2..59b6bcac958 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3432,7 +3432,6 @@ static void migration_completion(MigrationState *s)
         ret = global_state_store();

         if (!ret) {
-            bool inactivate = !migrate_colo_enabled();
             ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
             trace_migration_completion_vm_stop(ret);
             if (ret >= 0) {
@@ -3440,10 +3439,10 @@ static void migration_completion(MigrationState *s)
                                             MIGRATION_STATUS_DEVICE);
             }
             if (ret >= 0) {
-                s->block_inactive = inactivate;
+                s->block_inactive = !migrate_colo_enabled();
                 qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
                 ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
-                                                         inactivate);
+                                                         s->block_inactive);
             }
         }
         qemu_mutex_unlock_iothread();

base-commit: cdf07846e6fe07a2e20c93eed5902114dc1d3dcf
-- 
2.40.0


