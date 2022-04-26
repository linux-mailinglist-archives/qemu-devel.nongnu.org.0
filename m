Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EF5510C81
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:16:20 +0200 (CEST)
Received: from localhost ([::1]:56516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUPr-00007b-Ee
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1njUHg-0002Qf-5G
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:07:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1njUHe-0000Bq-FJ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651014469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCN4rR4bAIHd7dZhYCUf3JnbZmufgbcGPMyBtVIgbmE=;
 b=MzitEgln1iNEWSAtDIWbu5CSiYQRSqOEmK22c9uQ1cxGk3sS+CqYhAAXYV2KZCWf8oAzeq
 6zpkfHDxRrMdFqmt5CEt0U8TmNnjRizEIMI91xNqq3w8J0xvI+IVy7mMgG+HYqJOsPzzXG
 UjXIvGXEyOGzd9rZblyeI8Er9TLdQHs=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-J_uZfuBINOSERuvosx5IsQ-1; Tue, 26 Apr 2022 19:07:48 -0400
X-MC-Unique: J_uZfuBINOSERuvosx5IsQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 i12-20020a4ad08c000000b0035e7ff33045so205336oor.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCN4rR4bAIHd7dZhYCUf3JnbZmufgbcGPMyBtVIgbmE=;
 b=72Nl33udTO8KPOVEw3T47OHnm8wiJoOGBFpK08/tWvbswimJrgglW41C6MCKj7Hv+s
 p7X4hfcqPALybfFXHXLgsG5efFsXajtf+FLjhxH+jY77+FmbGTIKXpFh8sKmPTxXCDZg
 8Ud5s0zVTs+xjOK1610Qgko+xO10oy8O39yMOTXDK5++Tmvxdo9DUtCQySkluKdm3CJz
 Upr0ezbF+xq9mqC+s/mHhMdsFLreigBIASmnpTBZlaRTPJrIY2AhMA0Ny4oaoCftnxNS
 im8PkQV+NozlnkgDJxnJxWpQDerh84bIU7E2xPpnBP2ppL3IFhbaQvA6ygcv+GznEeNz
 GbVA==
X-Gm-Message-State: AOAM533xSFYj4xv3bu3PXWCjHvIL039yLY1dT05QPutlqUDBTz32RxuJ
 kDS5VJ/GtJA22vpApnTsVeaFOyz7tRGGIa6uGpohIgdqgFTEhRx4wlVHb2J9unqciYi6SYftYWi
 4cKSqfPop/rYH2WY=
X-Received: by 2002:a05:6808:f06:b0:324:f7bd:c3a with SMTP id
 m6-20020a0568080f0600b00324f7bd0c3amr9935725oiw.25.1651014468214; 
 Tue, 26 Apr 2022 16:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO/36uEc66sBabrP0V7pzKYtV+/jNDRWVxOhJVyoa1EtckIAt0pYAEKS4HqBGnrEY8O/HwVg==
X-Received: by 2002:a05:6808:f06:b0:324:f7bd:c3a with SMTP id
 m6-20020a0568080f0600b00324f7bd0c3amr9935704oiw.25.1651014467943; 
 Tue, 26 Apr 2022 16:07:47 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:2ba0:92e8:26c9:ce7e:f03e])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a4a3004000000b0035e974ec923sm419855oof.2.2022.04.26.16.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:07:47 -0700 (PDT)
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
Subject: [PATCH v10 4/7] migration: Add migrate_use_tls() helper
Date: Tue, 26 Apr 2022 20:06:51 -0300
Message-Id: <20220426230654.637939-5-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426230654.637939-1-leobras@redhat.com>
References: <20220426230654.637939-1-leobras@redhat.com>
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


