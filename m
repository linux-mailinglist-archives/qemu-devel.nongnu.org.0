Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D7A50EB5E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 23:58:44 +0200 (CEST)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj6jE-00019Z-0A
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 17:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nj6cc-0005hX-3l
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nj6cZ-00014H-CK
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650923510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCN4rR4bAIHd7dZhYCUf3JnbZmufgbcGPMyBtVIgbmE=;
 b=ZotaaWku+rTv82kpAo0PbraBAeXQDHMaZY7kDkVHQ9bg258uQpYq4Jt4gcqp7ifbNczCMk
 V7Dycfz4ieagOomexpEvnVj29WXz515orgAj0b7zyiCb3A9Q//CaNdkuHqtMJrjejQdWfF
 hytJj5W9ZajSlRGyrw7AzMb2tXEpGTQ=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-IC7ewV_ZP1SZog2EXnGsCw-1; Mon, 25 Apr 2022 17:51:48 -0400
X-MC-Unique: IC7ewV_ZP1SZog2EXnGsCw-1
Received: by mail-ot1-f70.google.com with SMTP id
 x97-20020a9d20ea000000b00604724bc745so6838034ota.3
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 14:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCN4rR4bAIHd7dZhYCUf3JnbZmufgbcGPMyBtVIgbmE=;
 b=yCoqgAZ37H4nCt43UtCI1qH+7nx92Op2UBaU4f2oJQb1KH1LmOyiIS4lExLZicbbv3
 /EkRi1LpzSV6zKHYREs4SH/SwZ1kBCm9T5SKPlbPAMqYGWRSGTA+xWhmY1NjYAhoNe1a
 nKmZDAGUM03dMJ+Mf0jpbZC98tL/bmueEqanalh0FWazQ58zTLJFm8nDWFEaQKExcFPD
 PCja22xVc1WlmJGVHR2WST4I54nuyQV1cU51xtDaUmOq+LqT9u11Zuz1XVr9ft4AvLnj
 /ApORxAE64IwolopQMlAZ4IZvi6tnUEBDqjD2NuoDnRKr+pgYoUTXuxQy5W7fLJFfypp
 lYMg==
X-Gm-Message-State: AOAM530IqGlC9QgW1fG/fNligIx6MZlhGUx0e2OIayDdV8KijKzdx0N+
 iPChTDQRN4aCzrk/UvckxK80b/dS8nyJErKdyNV2+tpubiAWRZZHn/LJjdHq4wcdhrSOulQ9YAt
 NC6Kp5hxrX2Mc1EI=
X-Received: by 2002:a9d:1702:0:b0:604:f0f2:bea2 with SMTP id
 i2-20020a9d1702000000b00604f0f2bea2mr7192670ota.362.1650923507887; 
 Mon, 25 Apr 2022 14:51:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbLfrZ95+XVYfEKJk0pQeBg1Q03FfZjNkcneKwphUXgEueWhIWDqBcFrWoADQ0jeBzMaBrkw==
X-Received: by 2002:a9d:1702:0:b0:604:f0f2:bea2 with SMTP id
 i2-20020a9d1702000000b00604f0f2bea2mr7192653ota.362.1650923507689; 
 Mon, 25 Apr 2022 14:51:47 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:2ba0:92e8:26c9:ce7e:f03e])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056870e60700b000e686d13878sm156807oag.18.2022.04.25.14.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 14:51:47 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v9 4/7] migration: Add migrate_use_tls() helper
Date: Mon, 25 Apr 2022 18:50:53 -0300
Message-Id: <20220425215055.611825-5-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220425215055.611825-1-leobras@redhat.com>
References: <20220425215055.611825-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A lot of places check parameters.tls_creds in order to evaluate if TLS is
in use, and sometimes call migrate_get_current() just for that test.

Add new helper function migrate_use_tls() in order to simplify testing
for TLS usage.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/migration.h | 1 +
 migration/channel.c   | 3 +--
 migration/migration.c | 9 +++++++++
 migration/multifd.c   | 5 +----
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index e8f2941a55..485d58b95f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -380,6 +380,7 @@ bool migrate_use_zero_copy_send(void);
 #else
 #define migrate_use_zero_copy_send() (false)
 #endif
+int migrate_use_tls(void);
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
 bool migrate_colo_enabled(void);
diff --git a/migration/channel.c b/migration/channel.c
index c6a8dcf1d7..a162d00fea 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -38,8 +38,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));
 
-    if (s->parameters.tls_creds &&
-        *s->parameters.tls_creds &&
+    if (migrate_use_tls() &&
         !object_dynamic_cast(OBJECT(ioc),
                              TYPE_QIO_CHANNEL_TLS)) {
         migration_tls_channel_process_incoming(s, ioc, &local_err);
diff --git a/migration/migration.c b/migration/migration.c
index 3e91f4b5e2..4b6df2eb5e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2588,6 +2588,15 @@ bool migrate_use_zero_copy_send(void)
 }
 #endif
 
+int migrate_use_tls(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.tls_creds && *s->parameters.tls_creds;
+}
+
 int migrate_use_xbzrle(void)
 {
     MigrationState *s;
diff --git a/migration/multifd.c b/migration/multifd.c
index 9ea4f581e2..2a8c8570c3 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -782,15 +782,12 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
                                     QIOChannel *ioc,
                                     Error *error)
 {
-    MigrationState *s = migrate_get_current();
-
     trace_multifd_set_outgoing_channel(
         ioc, object_get_typename(OBJECT(ioc)),
         migrate_get_current()->hostname, error);
 
     if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
+        if (migrate_use_tls() &&
             !object_dynamic_cast(OBJECT(ioc),
                                  TYPE_QIO_CHANNEL_TLS)) {
             multifd_tls_channel_connect(p, ioc, &error);
-- 
2.36.0


