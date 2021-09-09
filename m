Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E31404894
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:38:25 +0200 (CEST)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHRn-0003oL-Tu
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNe-0003Ed-9D
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNb-00030s-Dv
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V0IiYJgceGFKra1MpkcY1f/vJ1kfm2MN13eOCaGsi14=;
 b=PxnVq243lHJFZvWDaqFQGRsW/bQCxk8GiLEnmndVvq1H4GzseDAs3qrxmNMg2JGkZYwliu
 qi01qDSaOX/qeToRLtcWwbeMWRs7p2bYqQ/XeVvvynPU1nV3kXqloNI8+5wFMiEClJpGck
 ejPJPL49LZXJLyie2T9Lg9EYNHeAkO8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-m-5b0dtcO5y1c5LO3scyLg-1; Thu, 09 Sep 2021 06:33:56 -0400
X-MC-Unique: m-5b0dtcO5y1c5LO3scyLg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m22-20020a7bcb96000000b002f7b840d9dcso545810wmi.1
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 03:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V0IiYJgceGFKra1MpkcY1f/vJ1kfm2MN13eOCaGsi14=;
 b=QtRZBUCOfeknhOCLgHJpev4GYsYZ0ic7PH4h2Jv0i+mVIaIXQUrnZMhYc+s1gHjcSc
 Yk+/c/2UR0/OCl9kLuPTvLanjjAJw3Uk3ZYuboOkWYuOusOA2HoMrXVkgqHG1SeUbGl4
 yjr7LhdX0TTB68r6i7quYF31sHuNKCzujPMb68pQxOTKcpwvJ8kytAMie+iCvuI7eoYV
 hyYq7ucuHIJ+nUIv80F8tjWz9BwEvcHdtOGT+mzquRzPdrpg80t+NdWosPYKtOlKZbKD
 q8XsqjtT66x02IJEJ6Qthunu6MUapshSOKp2fxyKzJvzSc4d9Ko828kCyWK2Hok+eVwg
 7GSg==
X-Gm-Message-State: AOAM532PdASWklLlp+TSiNFy5FJJia8Sw1QuHCt9CwO2jf/DDhQAyHdx
 A0lw6XXT8knxXJS4FJ6MZMxdj9sbaQK4+ScyXaC77SPGsEYXDT/IX8QHMAuqTAnaXML4TDRd/FT
 Lsk3GoiaiWRdbg+wnyheyIIcA+6yq6lLpwN9S31hrSjZUKMIAM+3HBteC143qYhahTWY=
X-Received: by 2002:adf:80e2:: with SMTP id 89mr2690085wrl.43.1631183635226;
 Thu, 09 Sep 2021 03:33:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfD6mPeewXMMmYQjstEU2inzL0CR5yuvHq7Qm6kBICM2Dgmge6pWRHRKCQlD/DuKqdVOYwAA==
X-Received: by 2002:adf:80e2:: with SMTP id 89mr2690063wrl.43.1631183634930;
 Thu, 09 Sep 2021 03:33:54 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id u16sm1244491wmc.41.2021.09.09.03.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 03:33:54 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] migration: allow multifd for socket protocol only
Date: Thu,  9 Sep 2021 12:33:45 +0200
Message-Id: <20210909103346.1990-7-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909103346.1990-1-quintela@redhat.com>
References: <20210909103346.1990-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

To: <quintela@redhat.com>, <dgilbert@redhat.com>, <qemu-devel@nongnu.org>
CC: Li Zhijian <lizhijian@cn.fujitsu.com>
Date: Sat, 31 Jul 2021 22:05:51 +0800 (5 weeks, 4 days, 17 hours ago)

multifd with unsupported protocol will cause a segment fault.
(gdb) bt
 #0  0x0000563b4a93faf8 in socket_connect (addr=0x0, errp=0x7f7f02675410) at ../util/qemu-sockets.c:1190
 #1 0x0000563b4a797a03 in qio_channel_socket_connect_sync
(ioc=0x563b4d16e8c0, addr=0x0, errp=0x7f7f02675410) at
../io/channel-socket.c:145
 #2  0x0000563b4a797abf in qio_channel_socket_connect_worker (task=0x563b4cd86c30, opaque=0x0) at ../io/channel-socket.c:168
 #3  0x0000563b4a792631 in qio_task_thread_worker (opaque=0x563b4cd86c30) at ../io/task.c:124
 #4  0x0000563b4a91da69 in qemu_thread_start (args=0x563b4c44bb80) at ../util/qemu-thread-posix.c:541
 #5  0x00007f7fe9b5b3f9 in ?? ()
 #6  0x0000000000000000 in ?? ()

It's enough to check migrate_multifd_is_allowed() in multifd cleanup() and
multifd setup() though there are so many other places using migrate_use_multifd().

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h   |  2 ++
 migration/migration.c |  4 ++++
 migration/multifd.c   | 24 ++++++++++++++++++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 16c4d112d1..15c50ca0b2 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -13,6 +13,8 @@
 #ifndef QEMU_MIGRATION_MULTIFD_H
 #define QEMU_MIGRATION_MULTIFD_H
 
+bool migrate_multifd_is_allowed(void);
+void migrate_protocol_allow_multifd(bool allow);
 int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
diff --git a/migration/migration.c b/migration/migration.c
index bb909781b7..10e7616a48 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -453,10 +453,12 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
 
+    migrate_protocol_allow_multifd(false); /* reset it anyway */
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
+        migrate_protocol_allow_multifd(true);
         socket_start_incoming_migration(p ? p : uri, errp);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
@@ -2280,9 +2282,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         }
     }
 
+    migrate_protocol_allow_multifd(false);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
+        migrate_protocol_allow_multifd(true);
         socket_start_outgoing_migration(s, p ? p : uri, &local_err);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
diff --git a/migration/multifd.c b/migration/multifd.c
index efd424bc97..283f672bf0 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -531,7 +531,7 @@ void multifd_save_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
         return;
     }
     multifd_send_terminate_threads(NULL);
@@ -868,6 +868,17 @@ cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
+static bool migrate_allow_multifd;
+void migrate_protocol_allow_multifd(bool allow)
+{
+    migrate_allow_multifd = allow;
+}
+
+bool migrate_multifd_is_allowed(void)
+{
+    return migrate_allow_multifd;
+}
+
 int multifd_save_setup(Error **errp)
 {
     int thread_count;
@@ -878,6 +889,11 @@ int multifd_save_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
+    if (!migrate_multifd_is_allowed()) {
+        error_setg(errp, "multifd is not supported by current protocol");
+        return -1;
+    }
+
     s = migrate_get_current();
     thread_count = migrate_multifd_channels();
     multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
@@ -971,7 +987,7 @@ int multifd_load_cleanup(Error **errp)
 {
     int i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
         return 0;
     }
     multifd_recv_terminate_threads(NULL);
@@ -1120,6 +1136,10 @@ int multifd_load_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
+    if (!migrate_multifd_is_allowed()) {
+        error_setg(errp, "multifd is not supported by current protocol");
+        return -1;
+    }
     thread_count = migrate_multifd_channels();
     multifd_recv_state = g_malloc0(sizeof(*multifd_recv_state));
     multifd_recv_state->params = g_new0(MultiFDRecvParams, thread_count);
-- 
2.31.1


