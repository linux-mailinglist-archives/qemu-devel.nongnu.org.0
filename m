Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BAA694031
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUew-0000PB-1h; Mon, 13 Feb 2023 03:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUeu-0000OX-71
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:58:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUes-0002si-Hn
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676278677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+iFHSuieMPGwfVC1TUB1Z5r823JrerG+nuKKfxfBVc=;
 b=IQTApX0sGFkGRNqe9Bz/mOu2LuDJPyu9E0PNre+3QtYQYzD1NrnfgsXpcNXaAIBI35AnF1
 cSPdOH6g8/fU6u43Q+YvWHNhbDsCglmwx/N51fXHWFUXOb/h5q+AA2tlIfiwHMEXSrYBUt
 k5zsia7E/Rlu9W1G8KsINxDZXtocf+I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-Ryu6dFQKNvybGF_o92PN0Q-1; Mon, 13 Feb 2023 03:57:56 -0500
X-MC-Unique: Ryu6dFQKNvybGF_o92PN0Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 n18-20020adfc612000000b002c3d80ab568so2178345wrg.18
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 00:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+iFHSuieMPGwfVC1TUB1Z5r823JrerG+nuKKfxfBVc=;
 b=OEbtefTnxKvrdbJtim4GhXL+rSNb6CkIhRCI6zmK/Zu84pzNxQ6h4hxr1dujW5qdtb
 STTgElUgB8+HzytjmkOJjYr0WiSGHdF/zJeHeOLTRA/yypmpsIi2DwJRRrAFM2yefAH4
 GpvLJN+Ru5m858X+lcanrxcX0dHbsVkSQwTZxevIcz5mFL1STrxD2579sHlqrOr3cOug
 4yxmrWWhS90KZ2DxfTfjEC7xWH2vK+kWMGfNKmxSLQUsWdU1dWTiCujpEQc3rs9EK5ro
 HaSDOO/8hf7HnjZiRbQjfLKbW1NBGAz9jQNafX8luZwbyVRYX7CbwE9s3AM4keSP/H+1
 TODQ==
X-Gm-Message-State: AO0yUKXX+fskO2X3ZVVZedj6TyODmEchajx+maW8+tF6F7t00zVmV1wE
 vH6mhdJZBSkwg6v7iJQyfmc0qqsqX4hk/KYM27ODJOrKII033HwslAhk/YQLNw1qHrvLyNtRznj
 7UtDJcjqRsUAuUuXyHGMLdUSbZgOWws9NUSymjsRtADPfFzaJGOtVUxJhe5V0FkS4ZSo84yCZLw
 o=
X-Received: by 2002:a1c:f315:0:b0:3da:2500:e702 with SMTP id
 q21-20020a1cf315000000b003da2500e702mr18585273wmq.32.1676278674816; 
 Mon, 13 Feb 2023 00:57:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+JwnP/9GcMjlO5k9wSpTNAJCGTJj2R3hxQZYs5i+eZibHW+9Y2DkjEs2mHj8U8yxxzQhZW1g==
X-Received: by 2002:a1c:f315:0:b0:3da:2500:e702 with SMTP id
 q21-20020a1cf315000000b003da2500e702mr18585252wmq.32.1676278674519; 
 Mon, 13 Feb 2023 00:57:54 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 hg8-20020a05600c538800b003e1202744f2sm10279964wmb.31.2023.02.13.00.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 00:57:54 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras <leobras@redhat.com>, Li Xiaohui <xiaohli@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v5 4/8] migration/multifd: Move load_cleanup inside
 incoming_state_destroy
Date: Mon, 13 Feb 2023 09:57:42 +0100
Message-Id: <20230213085746.75586-5-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213085746.75586-1-quintela@redhat.com>
References: <20230213085746.75586-1-quintela@redhat.com>
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


