Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DAF433246
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:32:55 +0200 (CEST)
Received: from localhost ([::1]:42664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclUM-0008Dt-IG
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQv-0003mQ-GM
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQt-0005fl-1v
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAKgpEl8rTyJC3oyhCxTrd4U/7tfuhWfKE44KangE/I=;
 b=UVDPbrWzYDQtHeEfylWuHIY+7kUAtKSt1Ge6O2j9I4HHsICU0iwDNrqm9B5/9YUUlTnSRe
 vWcKesmv+ySSfCrTWV4z0NbJOYsqUJmM/CgVdh5hhqKqf5S77Zy6lzBrEmVoBt2hoqOKiK
 +ezvCmTFwFqc1Hn1flvYcbwxR25FmVs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-305e8nIqOfSmWcsKRSdNIg-1; Tue, 19 Oct 2021 05:29:17 -0400
X-MC-Unique: 305e8nIqOfSmWcsKRSdNIg-1
Received: by mail-wm1-f72.google.com with SMTP id
 s25-20020a7bc399000000b0030da0f36afeso918258wmj.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sAKgpEl8rTyJC3oyhCxTrd4U/7tfuhWfKE44KangE/I=;
 b=1prKmsfrjgCpm5CxCg1wJ0Q2teNwRihhwX+/EgX+54oHJRpT0QsDECAv5V1Mtk2Gpa
 iHQ4Y07CQVe1BZFgZaFNZ+AFhaev26RdPkilS1zleltERkVxiGU5Iy64GwvNdL2+btj1
 r1sWKlXtypHuCMHFhZ2SpXhw2syZZW44bLcKPFr0AmznfQqRJtP/dQltzgeQCUNS1woi
 JzYgKZz1sZi2AGbZdDF3B+qQuCIco79SRmjIj/0uSJHOzK4qFGV4iiGuy2F5gMIrTZz2
 7Kr0MxOTlWAQnJIGdwAVgZSzynjzc/FuQrfb4yL9wxKD4tkr//7eLUu9Oh7DMBZMT9ZG
 HvSg==
X-Gm-Message-State: AOAM531hVzZ8W9YBZz/+gBXHvGktXXvh9JNqxtof6z7f2ZbeXxbRJ2bz
 lUjfqZk+I+XDE6A9JVMG3X6gqoTTHaqzWG97GYaUab50f/yNifQLMOYw340puuKIHwMXuw4tjuK
 sv899ZPO/E/VTViz1tc7ILNCfw3nQQDfWCVTx61K8qrGIu4VwUWO5GUdRGAh5P1j3Pss=
X-Received: by 2002:adf:aad7:: with SMTP id i23mr41663081wrc.209.1634635755684; 
 Tue, 19 Oct 2021 02:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9BsDRokjXgWfBSN0ta4Wcv2/CInOW/YYBtUSF1EmPzNiB1Ub8XXupNX+4SCSBv1qzD2r/Rg==
X-Received: by 2002:adf:aad7:: with SMTP id i23mr41663053wrc.209.1634635755389; 
 Tue, 19 Oct 2021 02:29:15 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id n11sm14024588wrw.43.2021.10.19.02.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:29:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] migration: allow multifd for socket protocol only
Date: Tue, 19 Oct 2021 11:29:04 +0200
Message-Id: <20211019092907.5255-5-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019092907.5255-1-quintela@redhat.com>
References: <20211019092907.5255-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
index 6ac807ef3d..f13b07c638 100644
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


