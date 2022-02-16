Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F914B81E2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:47:15 +0100 (CET)
Received: from localhost ([::1]:45300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKF1u-0005jy-78
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:47:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDpS-0005pR-Ml
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDpR-0006aH-4b
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644993016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQVTOcSvujLUu+ruq0WAemac4DnT0xNNLGIpX9WC1+A=;
 b=KY6qYmhlcpabI6inlTkSsiy2EdagYBE+3hTNdmpMbtd9Se2fdV7muIIz6Z+qjYU37e5oGV
 oc8UxcpyU4lyqXK/aI2YBHnCaTLOoWqlBAQqYunzwDcXC1i9+cHv5PZ/wJtnk2nkLyKY3d
 U+5BBC6sAamxEZ6F3zd++xTx9x6IfKk=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-xd_-KLZaPwic5ZZq9mQ6Lw-1; Wed, 16 Feb 2022 01:30:13 -0500
X-MC-Unique: xd_-KLZaPwic5ZZq9mQ6Lw-1
Received: by mail-pg1-f199.google.com with SMTP id
 37-20020a630e65000000b0036c461afa9aso731312pgo.20
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQVTOcSvujLUu+ruq0WAemac4DnT0xNNLGIpX9WC1+A=;
 b=amkeoezf99xcMbtncgaubQGyqemNh1VLznD9fhIQaydZa8qyUjZHQRrCaqjbeM3AVM
 DjcDf+/LySuo5lpmEX+1HDCFvgCWU0uTc/Zs3VxuytjfaXOYdiJjyPBWDyV4KGiBvXoo
 N7GEo3uj/0ph04KAT5Ha2vCn9VY9havJoOuNgiCm64yK5qVbgNI+NiobNnF5wn1/H0Ir
 19+22CnY6ARbnB7So1db+XeRmFl5IozC7d7StUyjizdd7BzM0dIQVR+aqF+hYRUtZZj7
 UpktrwiyUvpxw0f4oa6x/X4WMmqoR8fCHa+v03/GQrQXdxAJLauFxK/sK2Ukz1UP8w6m
 Ds5Q==
X-Gm-Message-State: AOAM531L2g4yPWp0zRJztlV4+ua0XQeDlnGck1XykPLtyBzuXFdShUKJ
 NZOWii0YfLs2L1VeyfvdVk04PuCmdAYzeNsduRBaCHVBqAw0I6v/OAjTdBBW1iwgVePdio4/V5d
 kWvC5zLhES0TyHmei3BmlsLjkUWQJp7XQDA396GHfH88YE4w02uE0Ub4jwQ6vTA6h
X-Received: by 2002:a17:903:2490:b0:14d:57a5:a472 with SMTP id
 p16-20020a170903249000b0014d57a5a472mr1180839plw.17.1644993012231; 
 Tue, 15 Feb 2022 22:30:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzu0n3wwEZiCjwqEhi0YZpBGpJJlp9fDhIGNsAw2KJwV3fbWbo41L4/xfQjzP87W3w2kX8s6A==
X-Received: by 2002:a17:903:2490:b0:14d:57a5:a472 with SMTP id
 p16-20020a170903249000b0014d57a5a472mr1180819plw.17.1644993011854; 
 Tue, 15 Feb 2022 22:30:11 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.30.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:30:11 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/20] migration: Allow migrate-recover to run multiple times
Date: Wed, 16 Feb 2022 14:28:04 +0800
Message-Id: <20220216062809.57179-16-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously migration didn't have an easy way to cleanup the listening
transport, migrate recovery only allows to execute once.  That's done with a
trick flag in postcopy_recover_triggered.

Now the facility is already there.

Drop postcopy_recover_triggered and instead allows a new migrate-recover to
release the previous listener transport.

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


