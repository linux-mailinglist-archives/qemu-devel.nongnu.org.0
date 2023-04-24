Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4CB6ED48A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 20:37:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr10C-0000Vu-Br; Mon, 24 Apr 2023 14:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pr0zx-0000KT-D6
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pr0zo-0005iE-KG
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682361183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ba1pQ3UpK61JHzob3pgcqrrXeYlz6aOVT8m4TonLUV0=;
 b=EquzkGJLg4bUwypasF+MVDlV0SGjdh6wBmnYuY3bHf877+IVn26n3bUaZbHBgDlj5NfETh
 KU43u1rzFWmlQ3R5fvBbV1Gym6e/8/5IG+96fcPYCCx7uFlZ8SwTOA4esd+j5vxXipR06t
 8/6C1ps8mFJadA5BQNXF3sgxdeUvgOY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-OOmKRERiOSK7MzVSiF2OoA-1; Mon, 24 Apr 2023 14:32:58 -0400
X-MC-Unique: OOmKRERiOSK7MzVSiF2OoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D807800B35;
 Mon, 24 Apr 2023 18:32:58 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D01F7C15BA0;
 Mon, 24 Apr 2023 18:32:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 10/13] migration: Create migrate_tls_authz() function
Date: Mon, 24 Apr 2023 20:32:33 +0200
Message-Id: <20230424183236.74561-11-quintela@redhat.com>
In-Reply-To: <20230424183236.74561-1-quintela@redhat.com>
References: <20230424183236.74561-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.c | 7 +++++++
 migration/options.h | 1 +
 migration/tls.c     | 5 +----
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index 9eabb4c25d..9e19e4ade1 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -579,6 +579,13 @@ uint8_t migrate_throttle_trigger_threshold(void)
     return s->parameters.throttle_trigger_threshold;
 }
 
+char *migrate_tls_authz(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->parameters.tls_authz;
+}
+
 char *migrate_tls_creds(void)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/options.h b/migration/options.h
index 47cc24585b..0438c6e36e 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -80,6 +80,7 @@ MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 uint8_t migrate_throttle_trigger_threshold(void);
+char *migrate_tls_authz(void);
 char *migrate_tls_creds(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
diff --git a/migration/tls.c b/migration/tls.c
index 0d318516de..4c229326fd 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -86,10 +86,7 @@ void migration_tls_channel_process_incoming(MigrationState *s,
         return;
     }
 
-    tioc = qio_channel_tls_new_server(
-        ioc, creds,
-        s->parameters.tls_authz,
-        errp);
+    tioc = qio_channel_tls_new_server(ioc, creds, migrate_tls_authz(), errp);
     if (!tioc) {
         return;
     }
-- 
2.39.2


