Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E86A6F1356
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:35:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJYs-00064Q-G8; Fri, 28 Apr 2023 04:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psJYo-00063j-IC
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psJYl-000305-LA
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682670869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21zJ9OHYfCjdqi0xMTuVLkKEC6/QM+t/Y7XcAmYUI6Q=;
 b=C0K6DA/SLw6lq4tUNdm+PfA/LqLBs0TPuTr1o58SlBm35iSmzBP+zpyjJ/6RUL7hA27xWt
 L0lS4CtrqgAaaCUHOwikvEyZjBMDiCX5NMCX/wNwDWJS5+Kx/E6XbrsjFaGYJAAkY3MDSZ
 psO+c1KhyN05rqhwCTnrP78a2ESo60E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-d8MQ7eg2PuaIvgh978254A-1; Fri, 28 Apr 2023 04:34:24 -0400
X-MC-Unique: d8MQ7eg2PuaIvgh978254A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D4D43815EEC;
 Fri, 28 Apr 2023 08:34:24 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54C4B40C6EC4;
 Fri, 28 Apr 2023 08:34:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH 1/2] migration: Drop unused parameter for
 migration_tls_get_creds()
Date: Fri, 28 Apr 2023 10:34:20 +0200
Message-Id: <20230428083421.34701-2-quintela@redhat.com>
In-Reply-To: <20230428083421.34701-1-quintela@redhat.com>
References: <20230428083421.34701-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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


