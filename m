Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D37150A887
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:55:03 +0200 (CEST)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbxG-0000r2-Hv
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjt-0001eW-EW
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjr-0005zg-Rr
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650566471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gk5LRcuKuYvwai5NLh7dTzm4ismprPtiA8ZHZ3dYEc=;
 b=d30L/C7GxgX69uCt8h106Dv4DBYvBzN6O3Qvp6/ibeLrMCxjYglPhnms1+3xhXGu0RxogM
 SBcgAL7SzBpb0ej9/ES49h8hvel1os7CkZbgKJBqjCdXqsQjAleEvZjHYUDDeCofBumw+V
 RiSw5+HH7Jeh9DnGBqWZkbCVeCWZytQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-KFvM36mpMqC75fo_BFApsA-1; Thu, 21 Apr 2022 14:41:09 -0400
X-MC-Unique: KFvM36mpMqC75fo_BFApsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B1DB185A79C
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 18:41:09 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A702C40E8113;
 Thu, 21 Apr 2022 18:41:08 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 10/18] migration: Postpone releasing MigrationState.hostname
Date: Thu, 21 Apr 2022 19:40:44 +0100
Message-Id: <20220421184052.306581-11-dgilbert@redhat.com>
In-Reply-To: <20220421184052.306581-1-dgilbert@redhat.com>
References: <20220421184052.306581-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
  dgilbert: Fixup checkpatch error; don't need to check for NULL
  around g_free
---
 migration/channel.c   | 1 -
 migration/migration.c | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

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
index 4dcb511bb6..3f61a08752 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1809,6 +1809,9 @@ static void migrate_fd_cleanup(MigrationState *s)
     qemu_bh_delete(s->cleanup_bh);
     s->cleanup_bh = NULL;
 
+    g_free(s->hostname);
+    s->hostname = NULL;
+
     qemu_savevm_state_cleanup();
 
     if (s->to_dst_file) {
-- 
2.35.1


