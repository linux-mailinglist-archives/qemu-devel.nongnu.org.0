Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CDE693C92
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:53:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROxM-0002bv-BS; Sun, 12 Feb 2023 21:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROxF-0002Nz-SM
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROxE-0006wl-2b
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+iFHSuieMPGwfVC1TUB1Z5r823JrerG+nuKKfxfBVc=;
 b=UHUvUumpt4nIcKS2v3noR3LRHnq3T1+C8Y+g8TQM90uvAjNc4g34yfH7LynS4XQZUelWXS
 8VSOc0N5MAPpMCNUY6LOAKKaisdCrTsnalaNhS9gfjcPJod8QLQwjo4f01hBkw/49waui6
 B72z1RSVNT2R91APCIYK+9o1djveCLA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-353-jSlMHNxAPt64UezjCoylXQ-1; Sun, 12 Feb 2023 21:52:30 -0500
X-MC-Unique: jSlMHNxAPt64UezjCoylXQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j37-20020a05600c1c2500b003deaf780ab6so6058258wms.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+iFHSuieMPGwfVC1TUB1Z5r823JrerG+nuKKfxfBVc=;
 b=pd9V3xVNM3JxNWz08PpIJlPB9j7PoXuNmonkJQ7p1vOqMmJkMHDKdA7AF/+4h4QCFg
 gMtZnq9Mp5GohHFDgggI3tADgg98d5uBNJhs7wbhgmDAumP2QlqLlKmXOvg6ATozWDU7
 yYgy3FBEh7sYtjhiXP7aB8WmTaIAvm9WH+SscgeWmz9glX6EoPIUDCXs8oVCiQhbCkM3
 BJAsQ1JvMG/gDSezz8J99cpTT0GLlicOGZVgeCW1psxDrbSUmM9CUQH2nsPvvs1jyAhN
 59PTjpwcEDblnNtd014vXl8Vb37/AebSXF0HyJoBXpdpBtWGwejBCnWBC/Dic2HNbgYn
 gASg==
X-Gm-Message-State: AO0yUKXwffvBvZWR0+wxVOUHNkCsnlLF1Ot24eDTewzN9grqR7zxU2hV
 zxoPJeQWKbV9Oal3mY1h9iuuQdMkAqF+Ke/x64K7EyNHJJuJlEauLEG2jd2KgQKGxMbXJq5zq88
 MIRdTMm65+z+HV2RkV00HTLGxyNSOt24omgjGrDaBy79Tl5+gefnDyHiIz+cv6PfnnJSD8+OI
X-Received: by 2002:adf:fdc8:0:b0:2c5:5048:8a6a with SMTP id
 i8-20020adffdc8000000b002c550488a6amr3774549wrs.60.1676256748570; 
 Sun, 12 Feb 2023 18:52:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/qnbNBMTIX1+jGWEajvhQy9YxTtilAHQHXHMPXyXd1waXlUQgvS4VO0mzMy5H4N8K+izX9LA==
X-Received: by 2002:adf:fdc8:0:b0:2c5:5048:8a6a with SMTP id
 i8-20020adffdc8000000b002c550488a6amr3774532wrs.60.1676256748301; 
 Sun, 12 Feb 2023 18:52:28 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 i14-20020adff30e000000b00241fab5a296sm9375986wro.40.2023.02.12.18.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Li Xiaohui <xiaohli@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 21/22] migration/multifd: Move load_cleanup inside
 incoming_state_destroy
Date: Mon, 13 Feb 2023 03:51:49 +0100
Message-Id: <20230213025150.71537-22-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Leonardo Bras <leobras@redhat.com>

Currently running migration_incoming_state_destroy() without first running
multifd_load_cleanup() will cause a yank error:

qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance:
Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
(core dumped)

The above error happens in the target host, when multifd is being used
for precopy, and then postcopy is triggered and the migration finishes.
This will crash the VM in the target host.

To avoid that, move multifd_load_cleanup() inside
migration_incoming_state_destroy(), so that the load cleanup becomes part
of the incoming state destroying process.

Running multifd_load_cleanup() twice can become an issue, though, but the
only scenario it could be ran twice is on process_incoming_migration_bh().
So removing this extra call is necessary.

On the other hand, this multifd_load_cleanup() call happens way before the
migration_incoming_state_destroy() and having this happening before
dirty_bitmap_mig_before_vm_start() and vm_start() may be a need.

So introduce a new function multifd_load_shutdown() that will mainly stop
all multifd threads and close their QIOChannels. Then use this function
instead of multifd_load_cleanup() to make sure nothing else is received
before dirty_bitmap_mig_before_vm_start().

Fixes: b5eea99ec2 ("migration: Add yank feature")
Reported-by: Li Xiaohui <xiaohli@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h   | 1 +
 migration/migration.c | 4 +++-
 migration/multifd.c   | 7 +++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 9a7e1a8826..7cfc265148 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -17,6 +17,7 @@ int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 void multifd_load_cleanup(void);
+void multifd_load_shutdown(void);
 bool multifd_recv_all_channels_created(void);
 void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
diff --git a/migration/migration.c b/migration/migration.c
index 5bf332fdd2..90fca70cb7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -315,6 +315,8 @@ void migration_incoming_state_destroy(void)
 {
     struct MigrationIncomingState *mis = migration_incoming_get_current();
 
+    multifd_load_cleanup();
+
     if (mis->to_src_file) {
         /* Tell source that we are done */
         migrate_send_rp_shut(mis, qemu_file_get_error(mis->from_src_file) != 0);
@@ -559,7 +561,7 @@ static void process_incoming_migration_bh(void *opaque)
      */
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
-    multifd_load_cleanup();
+    multifd_load_shutdown();
 
     dirty_bitmap_mig_before_vm_start();
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 840d5814e4..5e85c3ea9b 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1013,6 +1013,13 @@ static void multifd_recv_terminate_threads(Error *err)
     }
 }
 
+void multifd_load_shutdown(void)
+{
+    if (migrate_use_multifd()) {
+        multifd_recv_terminate_threads(NULL);
+    }
+}
+
 void multifd_load_cleanup(void)
 {
     int i;
-- 
2.39.1


