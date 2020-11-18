Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF8C2B78F3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:41:57 +0100 (CET)
Received: from localhost ([::1]:38676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ2K-0006V7-Rp
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyW-00021V-Lw
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyT-0005Um-D1
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWuey6nF2A1oCBUf0dA4SccomTLKM7KgHltxbmb1Ko0=;
 b=iIeKbOTZf8gSxpsJICKDw57BZrpTgeOo+qNcEXjM25CNfdorN3fs656V/oGLYfdcGWEB/u
 BuAW8togs7orX9fu1Alz3PV08lxGsD3Ozyj9WT8xykLOGN4Z07U3MKgKlAslmpkIOgh3Rd
 29v7BD+LIpad5QgPw0m+9sobtRECM5k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-B9msWSKAPdisVOv0TOldMw-1; Wed, 18 Nov 2020 03:37:53 -0500
X-MC-Unique: B9msWSKAPdisVOv0TOldMw-1
Received: by mail-wr1-f69.google.com with SMTP id e18so615616wrs.23
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWuey6nF2A1oCBUf0dA4SccomTLKM7KgHltxbmb1Ko0=;
 b=bi740W4osRkhdUYv5lfTVQmMKL3KDIqhAaDN3xq/WPc8X3t76ESY54JGRmy4iVp/U+
 S4oQVAMsqDnxyEZ459MXsHWxr0hjF7uzQSpmWuC0uXjWg+JVcPyEwWJaSUsChKFlSbZ/
 fzOD+Ocsh7FNIwrYvB9p+VTsf05RQ3Z73gjW/YTGP0hBfGKBnHK2/JqRKruxx1NvKGrE
 AV4I1ef6KM4yNjeZ/q4hMWnG8gGf/y0X3vcJS93KVytAfx2RommdutDqDssm6XKkzdeg
 wbwCvK4IzePmG74oV/yp9Sx9/1BPkAGrckos0A2rp4wvF09AqlImGZdwlZRvXR3zAO+5
 iODQ==
X-Gm-Message-State: AOAM532v5VqqzSnu6IkU5pcSlGnVhLDku5DHbJJI7M8qOkR1qiOQcbd2
 Ux7HY9z5xfavxlFnTe+wdkD8rDWRRz2BEnpSXihJ9fJLi1RBdhr3KQ+p02pS60/sTU9kOX9Nsa9
 SIVFIbjXqqTOLDYfWB3fmKaZEGk1jPRfxwUuOPyDRdIGJutpuw2jBzvCy5cdL8Ft23MI=
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr3673348wru.80.1605688672170;
 Wed, 18 Nov 2020 00:37:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyjUU137DvLBG0A1h26Q1b8/csDjAuQKhVka9OOP1Pgmcnpy9QhKiEH2szg0px6ZYqk5i4Tw==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr3673324wru.80.1605688671936;
 Wed, 18 Nov 2020 00:37:51 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id c17sm2473074wml.14.2020.11.18.00.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:37:51 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/27] migration: Network Failover can't work with a paused
 guest
Date: Wed, 18 Nov 2020 09:37:22 +0100
Message-Id: <20201118083748.1328-2-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we have a paused guest, it can't unplug the network VF device, so
we wait there forever.  Just change the code to give one error on that
case.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 87a9b59f83..d44fc880f9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3548,6 +3548,18 @@ static void *migration_thread(void *opaque)
     qemu_savevm_state_setup(s->to_dst_file);
 
     if (qemu_savevm_state_guest_unplug_pending()) {
+        /* if guest is paused, it can send back the wait event */
+        if (!runstate_is_running()) {
+            Error *local_err = NULL;
+
+            error_setg(&local_err, "migration: network failover and "
+                       "guest is paused'");
+            migrate_set_error(s, local_err);
+            error_free(local_err);
+            migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
+                              MIGRATION_STATUS_FAILED);
+            goto end;
+        }
         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
                           MIGRATION_STATUS_WAIT_UNPLUG);
 
@@ -3597,6 +3609,7 @@ static void *migration_thread(void *opaque)
     }
 
     trace_migration_thread_after_loop();
+end:
     migration_iteration_finish(s);
     object_unref(OBJECT(s));
     rcu_unregister_thread();
-- 
2.26.2


