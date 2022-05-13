Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D9E525BA9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 08:40:24 +0200 (CEST)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npOyM-0004pE-M9
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 02:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1npOnz-0007VT-8M
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:29:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1npOnx-0000aK-ES
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652423375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pvEQVZMG9i7iKmDvZz9LbzPdzOeLSSJa4tE8mPDOfBA=;
 b=QBF0CQyjxPz0zJwQSkyZD4Ji7oEJ28OexNQ848+tCR33fe17dDo1/ML0V4uwAR5/p+sdTp
 wjtrtiMBrYIsjrbUGS7n40ykzCmEUMKiIu43/SPeFhLfsQqalAicM7HLcRFbEXVKuDEri8
 mblRXB2SUeHsVk26QTiUnljqlzAFqhk=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-OzEEvvSsPoCI-LCP4AQpsA-1; Fri, 13 May 2022 02:29:28 -0400
X-MC-Unique: OzEEvvSsPoCI-LCP4AQpsA-1
Received: by mail-oo1-f69.google.com with SMTP id
 b8-20020a056820134800b0035f6e70c82cso3852265oow.2
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 23:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pvEQVZMG9i7iKmDvZz9LbzPdzOeLSSJa4tE8mPDOfBA=;
 b=EEsulgOq2KqVBEOJYI/va/m98wK8hQKddZsrqwSHQ+nEF90H9GWJauLujRdZZ1djcU
 bKefjgQkui3ZyMovlXueFY0PFLsL6+kmqIZ4xliE37gGpcCKo5dLqoiJTE3G0XBC1f35
 r79eclRJx3949zJzgoXJyBYsrlejySza86YqEm9n+GXQ/snEdVzUnADCsY6BDYl4tL7p
 2dfnpTExrBIPjCuwO3BRpxJRT6bpcoU9HHYPTlerI4QtnTGT4gGp0AqC5/j0ajM3mgrQ
 12y4b1bZ7gmawuRwuSo1VD4a4cszBQPeia5reVgH+EkGw8L/H6AT5/1n2aVctlM/pGNk
 eiFQ==
X-Gm-Message-State: AOAM533S+0WAU7Oh9/4FqNJjK5vZy2MQej9QcobYJ0mM2wIIwMRh+J/U
 WJI2sx5Kf0jjj6pvMimFNHOVDMF55/gHF2HsOMvb8CbUlBfeMi42zG6FqAU6cMtuAWoyk55Leg4
 EkOcuVGUU46+cEvw=
X-Received: by 2002:a9d:1723:0:b0:605:d26e:2425 with SMTP id
 i35-20020a9d1723000000b00605d26e2425mr1290519ota.6.1652423367622; 
 Thu, 12 May 2022 23:29:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOb+f3lJK9vULteUceGp2QBYJEwDedfjgMvKjeq3t2Ouuay5z4zQn6X9+y9iMm7uByHu359g==
X-Received: by 2002:a9d:1723:0:b0:605:d26e:2425 with SMTP id
 i35-20020a9d1723000000b00605d26e2425mr1290512ota.6.1652423367429; 
 Thu, 12 May 2022 23:29:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a05680804ce00b00325cda1ffbasm678341oie.57.2022.05.12.23.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 23:29:26 -0700 (PDT)
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v13 5/8] migration: Add migrate_use_tls() helper
Date: Fri, 13 May 2022 03:28:34 -0300
Message-Id: <20220513062836.965425-6-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513062836.965425-1-leobras@redhat.com>
References: <20220513062836.965425-1-leobras@redhat.com>
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
2.36.1


