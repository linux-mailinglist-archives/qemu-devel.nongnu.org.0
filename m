Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A5A4A5763
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 07:55:51 +0100 (CET)
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEn4w-0006as-HQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 01:55:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEmg7-0003DK-9G
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEmg2-0006cL-Dm
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 01:30:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643697005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obEhyfdKeFZPz947EhpcCq9pBreTXhzcDGdVnISAPPE=;
 b=B2cs0xTE+aauvG46GYYUF9qG1N8QMpamlhuby+2ONwEsQrCA8ydYsUNuEtiBUUnoaeHZqC
 LeqH+5j228FpaUFg/KcMjO5ZXCYm0PG59Jw1ok+glIKoPVAzjb7EYX4P9TYC4to97SsTy3
 Nxr9NCiKj6EpTiMqJtfmCT8j2fyW+DA=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-IwNXN9xLNcCJl7boAQBr7A-1; Tue, 01 Feb 2022 01:30:04 -0500
X-MC-Unique: IwNXN9xLNcCJl7boAQBr7A-1
Received: by mail-oo1-f70.google.com with SMTP id
 e6-20020a4ab146000000b002df82c0ed9aso6158295ooo.21
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 22:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=obEhyfdKeFZPz947EhpcCq9pBreTXhzcDGdVnISAPPE=;
 b=uVsO6FiO7x6be5v6kb8R2IoQ8sIv6myv/JOxAUK18zW6xj9zZpu4+v7oHXr2xdzGu4
 j5ZddKWN6E0Kq5077lcunDQVN4EKNHALlS2FgThgVnNr2cCj4/U5SNRV1+VfaHpU7aNt
 3yaUYhMt7c5sGbHsYQGoOQmMHxnjmU1OZwDdpXONuBkgHy/W8MWl5tsKojzT46ghr0aB
 lDStQzZfu456bvK24Ar4uCMo2Ipcerkwa2eqb443YOynNQbS3s2jcW80wEAdvbxiqwZ4
 cXGMyZUXDx0s/N3ueUTicavMbZ05kMPUIriD2lbRQKEfqSJ0gUEisJxkwiqKcms8liWf
 k/+w==
X-Gm-Message-State: AOAM532BCvvThDRo3kKxpEgSI0c4806ixAbwHR3PvyfNITmr0sL9WXTH
 IRg7ruvG8RwoewIhEWvdjuh3QQTe4YDWxFgiswG1btwI/WLvsZxcZEqaWllbHJBrUxac4WYsZTM
 1XfRMWcRHbAkuL8I=
X-Received: by 2002:a54:4812:: with SMTP id j18mr335945oij.186.1643697004194; 
 Mon, 31 Jan 2022 22:30:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOW3CiZJ6QsfFHylmw5lGiRr53tBmMqACfnq28L39SIB17EjLYGXemaHSgt7U79UcSNNvZJQ==
X-Received: by 2002:a54:4812:: with SMTP id j18mr335929oij.186.1643697003998; 
 Mon, 31 Jan 2022 22:30:03 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e])
 by smtp.gmail.com with ESMTPSA id l14sm14424720ooq.12.2022.01.31.22.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 22:30:03 -0800 (PST)
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
Subject: [PATCH v8 4/5] migration: Add migrate_use_tls() helper
Date: Tue,  1 Feb 2022 03:29:02 -0300
Message-Id: <20220201062901.428838-5-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201062901.428838-1-leobras@redhat.com>
References: <20220201062901.428838-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 4cbc901ea0..debacb2251 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -344,6 +344,7 @@ bool migrate_use_zero_copy_send(void);
 #else
 #define migrate_use_zero_copy_send() (false)
 #endif
+int migrate_use_tls(void);
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
 bool migrate_colo_enabled(void);
diff --git a/migration/channel.c b/migration/channel.c
index c4fc000a1a..086b5c0d8b 100644
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
index 1b3230a97b..3e0a25bb5b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2576,6 +2576,15 @@ bool migrate_use_zero_copy_send(void)
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
index 76b57a7177..43998ad117 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -784,14 +784,11 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
                                     QIOChannel *ioc,
                                     Error *error)
 {
-    MigrationState *s = migrate_get_current();
-
     trace_multifd_set_outgoing_channel(
         ioc, object_get_typename(OBJECT(ioc)), p->tls_hostname, error);
 
     if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
+        if (migrate_use_tls() &&
             !object_dynamic_cast(OBJECT(ioc),
                                  TYPE_QIO_CHANNEL_TLS)) {
             multifd_tls_channel_connect(p, ioc, &error);
-- 
2.34.1


