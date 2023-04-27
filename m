Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE626F0831
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:25:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3Tr-0002JG-VC; Thu, 27 Apr 2023 11:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3Tp-0002Iz-Vn
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:24:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3To-0000UY-HN
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682609059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BGDvRr0VMOFF07iehFiiG38Rpy7KD/E0KTE/DE3D1NE=;
 b=VrVXoaw3Oispk6mXRc9arn+rRSBYKNi+7j3joxvNnmIee/wSOcevqeHUsP4I4RdKiJia/T
 ZiFZmzGlurKm23rPB6AZHdJF+r+cTTFRKXaz6M3IQKlC4MZyb631SOBO4sbUFU404E2NzP
 9+M5p+fp1946GioVtx5gauzxZQqWxSo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-ItjEUXL4M2SRKcGTVG_Zkw-1; Thu, 27 Apr 2023 11:24:12 -0400
X-MC-Unique: ItjEUXL4M2SRKcGTVG_Zkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA01429AB44B;
 Thu, 27 Apr 2023 15:23:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31B5E40C2020;
 Thu, 27 Apr 2023 15:23:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, John Snow <jsnow@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 10/18] migration: Create migrate_tls_hostname() function
Date: Thu, 27 Apr 2023 17:22:26 +0200
Message-Id: <20230427152234.25400-11-quintela@redhat.com>
In-Reply-To: <20230427152234.25400-1-quintela@redhat.com>
References: <20230427152234.25400-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

---

Moved the type to const char * (vladimir)
---
 migration/options.c | 7 +++++++
 migration/options.h | 1 +
 migration/tls.c     | 5 +++--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index 014aecc9ee..1aa9575bc0 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -596,6 +596,13 @@ const char *migrate_tls_creds(void)
     return s->parameters.tls_creds;
 }
 
+const char *migrate_tls_hostname(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->parameters.tls_hostname;
+}
+
 uint64_t migrate_xbzrle_cache_size(void)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/options.h b/migration/options.h
index 987e639a49..819c1b1ce3 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -82,6 +82,7 @@ int migrate_multifd_zstd_level(void);
 uint8_t migrate_throttle_trigger_threshold(void);
 const char *migrate_tls_authz(void);
 const char *migrate_tls_creds(void);
+const char *migrate_tls_hostname(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
 /* parameters setters */
diff --git a/migration/tls.c b/migration/tls.c
index 184db4d7bf..cd29177957 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -130,8 +130,9 @@ QIOChannelTLS *migration_tls_client_create(MigrationState *s,
         return NULL;
     }
 
-    if (s->parameters.tls_hostname && *s->parameters.tls_hostname) {
-        hostname = s->parameters.tls_hostname;
+    const char *tls_hostname = migrate_tls_hostname();
+    if (tls_hostname && *tls_hostname) {
+        hostname = tls_hostname;
     }
 
     return qio_channel_tls_new_client(ioc, creds, hostname, errp);
-- 
2.40.0


