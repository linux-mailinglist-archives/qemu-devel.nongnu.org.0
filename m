Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1C3B77A7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:16:31 +0200 (CEST)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIHe-0003vd-E5
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyIFR-0001mn-PM
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyIFH-0000Ap-Qo
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624990442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hf3kzGEVUDga2EA/8LBXn0npoxdvllbtxwzSARnHkbk=;
 b=W6L0ewumlasBDcPoRGv6OKpCe7Ge2KctOtTaA519aNZak/pVNPANTpFvDkW9odA9J5pTfq
 w/K+bMhIYjOjNLmHvjI4ZiQ/KhoPkEfR9UiuyzQ1OtEKUiq3AhAPCoCB48uMHbbiFa95O8
 01e0TrHCWthqJxMs/T0nBYg5E/E+boQ=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-weoFXnCbM5qhdMck05R-KA-1; Tue, 29 Jun 2021 14:14:01 -0400
X-MC-Unique: weoFXnCbM5qhdMck05R-KA-1
Received: by mail-io1-f71.google.com with SMTP id
 w22-20020a5ed6160000b02904f28b1d759dso9709646iom.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hf3kzGEVUDga2EA/8LBXn0npoxdvllbtxwzSARnHkbk=;
 b=t/PjfisZr4ucAhv0E5/VFFrFYNof0OdFOibF60WOmsem16AZzfUkR8mz1x3LGiI8s1
 18x84xoYxjsO8VPa/0+BkCvRgTAhgynDBZw1aZACVNNKmpXVhkHNyv5YmnuGyXTdhn55
 y4DjypYsAORUIaN79eBq3zC5ZikaAuZWvoPJZFsm3csowLSZtn4z9OuVe8zOvL1toeG4
 vZDlan2RTz7RCAPqVMhuhqjH8q9AbQRbWDBVUWCyvjMxbSPt+MqrlFE6wg+h+oXtmK3F
 lrO9iMn+INICoJ2hbj+zLHz2ySbhT+hrAEgBWU8zvp8oHJAHYyGuSwdHTp4Z3cZy4XEj
 hulQ==
X-Gm-Message-State: AOAM532n6zmuo6sMPYVniiDzCFoLljN6X4NpuqPae+CLEeyijWXu2eNZ
 R5BhlDqhp1wNQTLK2JrLOrC0TY5KY8wLplfhcbpZbKcy05oQ22AbOSnSYRBbdUNAP2CTWTbFd9F
 MaPg/DbpwrAxwzq8+6+7PT9QwhjzZXrH0FGvdzjG6uoLd1AWc7FvYUc90g/kHFOwL
X-Received: by 2002:a6b:e911:: with SMTP id u17mr4926069iof.54.1624990440774; 
 Tue, 29 Jun 2021 11:14:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2+UvO4Tn/WVJ0MD2UustnZNDUpJhZrqFiV5LS/p//6eYrmsne4aiTtEQTieeYIYny3ILOCA==
X-Received: by 2002:a6b:e911:: with SMTP id u17mr4926046iof.54.1624990440420; 
 Tue, 29 Jun 2021 11:14:00 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i6sm4436824ilm.85.2021.06.29.11.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:13:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] migration: Move yank outside
 qemu_start_incoming_migration()
Date: Tue, 29 Jun 2021 14:13:55 -0400
Message-Id: <20210629181356.217312-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629181356.217312-1-peterx@redhat.com>
References: <20210629181356.217312-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peterx@redhat.com, Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Starting from commit b5eea99ec2f5c, qmp_migrate_recover() calls unregister
before calling qemu_start_incoming_migration(). I believe it wanted to mitigate
the next call to yank_register_instance(), but I think that's wrong.

Firstly, if during recover, we should keep the yank instance there, not
"quickly removing and adding it back".

Meanwhile, calling qmp_migrate_recover() twice with b5eea99ec2f5c will directly
crash the dest qemu (right now it can't; but it'll start to work right after
the next patch) because the 1st call of qmp_migrate_recover() will unregister
permanently when the channel failed to establish, then the 2nd call of
qmp_migrate_recover() crashes at yank_unregister_instance().

This patch fixes it by moving yank ops out of qemu_start_incoming_migration()
into qmp_migrate_incoming.  For qmp_migrate_recover(), drop the unregister of
yank instance too since we keep it there during the recovery phase.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4228635d18..1bb03d1eca 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -456,10 +456,6 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
 
-    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
-        return;
-    }
-
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
@@ -474,7 +470,6 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_incoming_migration(p, errp);
     } else {
-        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
 }
@@ -2083,9 +2078,14 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
         return;
     }
 
+    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
+        return;
+    }
+
     qemu_start_incoming_migration(uri, &local_err);
 
     if (local_err) {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         error_propagate(errp, local_err);
         return;
     }
@@ -2114,7 +2114,6 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
-    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
     qemu_start_incoming_migration(uri, errp);
 }
 
-- 
2.31.1


