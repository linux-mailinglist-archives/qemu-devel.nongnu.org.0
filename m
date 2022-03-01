Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFC44C876F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:09:43 +0100 (CET)
Received: from localhost ([::1]:45590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyVq-0005Ol-Os
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:09:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3R-0004Fv-S8
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3O-0008Fe-W4
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VC80P80l7wFMnNypuT8Iab0jvjyzZ7olmZZPDsWbNdY=;
 b=UngRo37f1MFbAGvd9z3lSMhb6URxiqsJVKHcxVHEux4IySxHC6s2u2zgDwCPV0LSGRA2IR
 LXjfLpRYFpdLgGrbQHlmQOO/TJKENKfHJw9Xm3TDtuk9HGGLRvbhJ2+v3uYikcxUNa+el4
 e/MgvzZeZR7G/XnIC6heez7RYKc/0/g=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-eygwp5KBMjC8DkbA3q1huw-1; Tue, 01 Mar 2022 03:40:17 -0500
X-MC-Unique: eygwp5KBMjC8DkbA3q1huw-1
Received: by mail-pg1-f198.google.com with SMTP id
 v4-20020a63f844000000b003745fd0919aso8148862pgj.20
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VC80P80l7wFMnNypuT8Iab0jvjyzZ7olmZZPDsWbNdY=;
 b=TQA0HqqHIdSId3KwwAkJgaS90aNodDzycYA0wpc73aB4Cx6tB8N1GTXTptsm9jpA0u
 lcn3DnWlGA1DgzonIwW1ShXkUy+ldad871rUHrleBddm6DZe1UOgjaiTsnrh2FKEjgqs
 rChTbhV8o2dm9cAQDGzKAGSAZstULprQ0VLnNyvn9qbEMq1mghT97oK/gj6J+m7O0Wkb
 LkUikQJsj4USlP6DQrzUR6RipAR/G/EBpI7VmWaHSkv016TThbbHuK5HqyU0lwqvZziK
 uacaNbjAfBKC3ovlFhQbTDHTn10p1HOX97CjM2G3vDSNBzKK8PJrkU4ZK8JtnnD3q1xM
 kUgQ==
X-Gm-Message-State: AOAM531fafjkFmVG0LA9ZxqnzaTKpzKIa2WSuHPqtqtEy27S7zhA66EC
 B/jaWa9hFo6B9cZm/ofHwEZTUCkWRJ9W5PeBg3FH52kSICTEIlYSK7y5rVWZ/L5ngQcwjYQynPR
 wqstPCfBiiEuJS6rBPPv/ppx/faW7f96x0ORNjrcowdO6DbwXu8cgolPHcLcZ7qD9
X-Received: by 2002:a17:902:6acb:b0:150:c60:294a with SMTP id
 i11-20020a1709026acb00b001500c60294amr24633293plt.71.1646124016231; 
 Tue, 01 Mar 2022 00:40:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIMDjWYvWQ2AJgJcmyODC4UbipY2XIyQEX3Ffz7aDb4yKxcTkxGlav7W0WFgkZalEHliEuJA==
X-Received: by 2002:a17:902:6acb:b0:150:c60:294a with SMTP id
 i11-20020a1709026acb00b001500c60294amr24633257plt.71.1646124015672; 
 Tue, 01 Mar 2022 00:40:15 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:15 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/25] migration: Allow migrate-recover to run multiple
 times
Date: Tue,  1 Mar 2022 16:39:15 +0800
Message-Id: <20220301083925.33483-16-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously migration didn't have an easy way to cleanup the listening
transport, migrate recovery only allows to execute once.  That's done with a
trick flag in postcopy_recover_triggered.

Now the facility is already there.

Drop postcopy_recover_triggered and instead allows a new migrate-recover to
release the previous listener transport.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 13 ++-----------
 migration/migration.h |  1 -
 migration/savevm.c    |  3 ---
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 6bb321cdd3..16086897aa 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2159,11 +2159,8 @@ void qmp_migrate_recover(const char *uri, Error **errp)
         return;
     }
 
-    if (qatomic_cmpxchg(&mis->postcopy_recover_triggered,
-                       false, true) == true) {
-        error_setg(errp, "Migrate recovery is triggered already");
-        return;
-    }
+    /* If there's an existing transport, release it */
+    migration_incoming_transport_cleanup(mis);
 
     /*
      * Note that this call will never start a real migration; it will
@@ -2171,12 +2168,6 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * to continue using that newly established channel.
      */
     qemu_start_incoming_migration(uri, errp);
-
-    /* Safe to dereference with the assert above */
-    if (*errp) {
-        /* Reset the flag so user could still retry */
-        qatomic_set(&mis->postcopy_recover_triggered, false);
-    }
 }
 
 void qmp_migrate_pause(Error **errp)
diff --git a/migration/migration.h b/migration/migration.h
index f17ccc657c..a863032b71 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -139,7 +139,6 @@ struct MigrationIncomingState {
     struct PostcopyBlocktimeContext *blocktime_ctx;
 
     /* notify PAUSED postcopy incoming migrations to try to continue */
-    bool postcopy_recover_triggered;
     QemuSemaphore postcopy_pause_sem_dst;
     QemuSemaphore postcopy_pause_sem_fault;
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 967ff80547..254aa78234 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2589,9 +2589,6 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
 
     assert(migrate_postcopy_ram());
 
-    /* Clear the triggered bit to allow one recovery */
-    mis->postcopy_recover_triggered = false;
-
     /*
      * Unregister yank with either from/to src would work, since ioc behind it
      * is the same
-- 
2.32.0


