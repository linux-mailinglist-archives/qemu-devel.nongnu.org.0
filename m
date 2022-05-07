Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9434051E36A
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:03:38 +0200 (CEST)
Received: from localhost ([::1]:54872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn9nF-0004pW-Er
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9iY-0005LJ-4f
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:58:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9iV-0006ip-Su
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651888723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCN4rR4bAIHd7dZhYCUf3JnbZmufgbcGPMyBtVIgbmE=;
 b=gG6jAvnIazb6zKjDjBGtHQGwme5C0VAVvWowuMyWD/uLAzaBawX4oliJd9JcZqFpX99ibm
 l/vaF5wWr22o0vP4ux2Zk+51XuWtL5qTs2JuWKN9KETZ5uOoHmwjZ6Ttow6w3L8dLkn9ad
 ZoRmIsS3uGoELFKV8NiKu+lttu3J83U=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-nhKxiHg5NnCbG2R2EOo40A-1; Fri, 06 May 2022 21:58:42 -0400
X-MC-Unique: nhKxiHg5NnCbG2R2EOo40A-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-e653506dd0so4273967fac.14
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 18:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCN4rR4bAIHd7dZhYCUf3JnbZmufgbcGPMyBtVIgbmE=;
 b=LYsDt3WSpmjNzP0HV1WK9D1csoOr1S79H1dtBXOFXkDWTsDrzq3+/2V2eoO2uDp+9p
 OCqIUdDb/9ze1LecemrAHaaBtQPANFwSDIwFePGgHw/SVuJgUOF4L5oCSagM/rYQLJM/
 ZwEdaWbRvkVuo1f02od3FLfTey7q4KTGbjqNglbahlnHCQ9DoXeHthlR/ILH+sHYeF8c
 2Ggq8cKbr2ynkRSEQAyNItMZxIh69jRhILbUH+bbEYUIUAvgWl9SqHYqWrOJOz1C38eb
 5cmyHJQoxB41fPtNLFQKhh7NpVP0garO1psdOn6j0b3/u3Hd56mSwuiH1WoJ1Ze3Q00y
 V6vw==
X-Gm-Message-State: AOAM530fOtbq7rP8x0zyW31hCqfm9kRtTAx/SAt8xVRJKS5JVXFldYah
 31yKeM6c/BjgIAIj/GW9Jh5mklWsl50Ak01dzo1yVR8i5dZecZfVcPu3teV10bt4UZOAWxzaS9l
 iMFKB/bZOZFz3p48=
X-Received: by 2002:a05:6870:ac0e:b0:ed:9a7d:4881 with SMTP id
 kw14-20020a056870ac0e00b000ed9a7d4881mr2543553oab.178.1651888721398; 
 Fri, 06 May 2022 18:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfjr/F6zDC+FvS/mVcR7TuZpxmE4vOjflWlgE1GtKDloaUE/Di9hQ13GLyfpgrcxsPZOQ87Q==
X-Received: by 2002:a05:6870:ac0e:b0:ed:9a7d:4881 with SMTP id
 kw14-20020a056870ac0e00b000ed9a7d4881mr2543552oab.178.1651888721177; 
 Fri, 06 May 2022 18:58:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a056830141200b0060603221281sm2218124otp.81.2022.05.06.18.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:58:40 -0700 (PDT)
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
Subject: [PATCH v12 4/7] migration: Add migrate_use_tls() helper
Date: Fri,  6 May 2022 22:57:56 -0300
Message-Id: <20220507015759.840466-5-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220507015759.840466-1-leobras@redhat.com>
References: <20220507015759.840466-1-leobras@redhat.com>
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


