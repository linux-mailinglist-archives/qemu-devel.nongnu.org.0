Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934CC50A6C5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:14:49 +0200 (CEST)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaOG-0003nF-Lq
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrc-0007fq-Gq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZra-00033f-U4
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650559262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5rmsR5iNE9Exm7sFcwqx0eWk32SLfXiquYLY/d6Lgw=;
 b=beaBTt2M/ks2nxvw/0SCI8uBwiNkc8RtFo1za7J11jKbinpFo3uIvLrgWOGYZuT/LU5rfS
 BNuU+/SS9DXJPQGX6xyW/6kvcIlijFZ1Zgg/4kmV0B4CfBKNzueYDofn2VbBQKWcQEWfPj
 Qb7Rbly8Dphz/l13fObDkyvM/e6fUOk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-zInAMh_1O-W26cniqrqIUg-1; Thu, 21 Apr 2022 12:41:00 -0400
X-MC-Unique: zInAMh_1O-W26cniqrqIUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 795D686B8A7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 16:41:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B266040D016E;
 Thu, 21 Apr 2022 16:40:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 10/18] migration: Postpone releasing MigrationState.hostname
Date: Thu, 21 Apr 2022 17:40:35 +0100
Message-Id: <20220421164043.209703-11-dgilbert@redhat.com>
In-Reply-To: <20220421164043.209703-1-dgilbert@redhat.com>
References: <20220421164043.209703-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

We used to release it right after migrate_fd_connect().  That's not good
enough when there're more than one socket pair required, because it'll be
needed to establish TLS connection for the rest channels.

One example is multifd, where we copied over the hostname for each channel
but that's actually not needed.

Keeping the hostname until the cleanup phase of migration.

Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220331150857.74406-2-peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/channel.c   | 1 -
 migration/migration.c | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/migration/channel.c b/migration/channel.c
index c4fc000a1a..c6a8dcf1d7 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -96,6 +96,5 @@ void migration_channel_connect(MigrationState *s,
         }
     }
     migrate_fd_connect(s, error);
-    g_free(s->hostname);
     error_free(error);
 }
diff --git a/migration/migration.c b/migration/migration.c
index 4dcb511bb6..90676f3f22 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1809,6 +1809,11 @@ static void migrate_fd_cleanup(MigrationState *s)
     qemu_bh_delete(s->cleanup_bh);
     s->cleanup_bh = NULL;
 
+    if (s->hostname) {
+        g_free(s->hostname);
+        s->hostname = NULL;
+    }
+
     qemu_savevm_state_cleanup();
 
     if (s->to_dst_file) {
-- 
2.35.1


