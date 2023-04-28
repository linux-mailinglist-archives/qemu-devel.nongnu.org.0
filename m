Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C396F1EAB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:16:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTWD-0004kt-2J; Fri, 28 Apr 2023 15:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTW7-0004hb-T2
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTW1-0002xQ-UR
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bezRbyElX4oDQkDmYg3oZ+p/BWTANa/wf2MhX9HYs/8=;
 b=GHM2szPECWyTiwZkP4ZhPDM/EucWg+bdiCQf7ZwcQboLSUSyYxeixD3QLlvXToM/t7B+Qk
 jXHxp/16nKEv1mNEPoBbn0HuZtrjz8mh+TlQ1hZXCIA46JkMx+nV8OX6aBIxDEiWehNKwq
 baL+C7VylMK4nv8875lLx3Bk3LSjFW8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-nKjCn_dvNTS32UJ9qXZqQQ-1; Fri, 28 Apr 2023 15:12:18 -0400
X-MC-Unique: nKjCn_dvNTS32UJ9qXZqQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E2E7185A790;
 Fri, 28 Apr 2023 19:12:17 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22F7D2166B4F;
 Fri, 28 Apr 2023 19:12:16 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 07/21] migration: Drop unused parameter for
 migration_tls_get_creds()
Date: Fri, 28 Apr 2023 21:11:49 +0200
Message-Id: <20230428191203.39520-8-quintela@redhat.com>
In-Reply-To: <20230428191203.39520-1-quintela@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

It is not needed since we moved the accessor for tls properties to
options.c.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/tls.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/migration/tls.c b/migration/tls.c
index cd29177957..d4a76cf590 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -29,9 +29,7 @@
 #include "trace.h"
 
 static QCryptoTLSCreds *
-migration_tls_get_creds(MigrationState *s,
-                        QCryptoTLSCredsEndpoint endpoint,
-                        Error **errp)
+migration_tls_get_creds(QCryptoTLSCredsEndpoint endpoint, Error **errp)
 {
     Object *creds;
     const char *tls_creds = migrate_tls_creds();
@@ -80,8 +78,7 @@ void migration_tls_channel_process_incoming(MigrationState *s,
     QCryptoTLSCreds *creds;
     QIOChannelTLS *tioc;
 
-    creds = migration_tls_get_creds(
-        s, QCRYPTO_TLS_CREDS_ENDPOINT_SERVER, errp);
+    creds = migration_tls_get_creds(QCRYPTO_TLS_CREDS_ENDPOINT_SERVER, errp);
     if (!creds) {
         return;
     }
@@ -124,8 +121,7 @@ QIOChannelTLS *migration_tls_client_create(MigrationState *s,
 {
     QCryptoTLSCreds *creds;
 
-    creds = migration_tls_get_creds(
-        s, QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT, errp);
+    creds = migration_tls_get_creds(QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT, errp);
     if (!creds) {
         return NULL;
     }
-- 
2.40.0


