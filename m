Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEF955343B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:12:04 +0200 (CEST)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ebr-0000dU-PI
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVW-0002wC-Ff
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVT-00006s-FA
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655820326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BI+tY8deCTJTQzfU3oZjQ7qJiYl+eJynuMihQ5Nq2lk=;
 b=e1TiofrKimRB2jLwUOlOlEY67V4KBl67b9rsWeGgjCBEp8Og3yIs3WWFg2hjJkn0DwEm0T
 RtlQBWvsmvNVJ/WrnK+n61o1cPw2eAkT+dEw0gUDDRHMNB76OnhydNuNB/2yUxEkHyFpdy
 NxbiKlQgq6ESAF4VPYTXCR6nMKW4Dh4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-VDVl_7AvMLmsC3y-ERH_6Q-1; Tue, 21 Jun 2022 10:05:23 -0400
X-MC-Unique: VDVl_7AvMLmsC3y-ERH_6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCC9A382C967;
 Tue, 21 Jun 2022 14:05:22 +0000 (UTC)
Received: from secure.laptop (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88EC12166B29;
 Tue, 21 Jun 2022 14:05:18 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 2/5] multifd: Put around all sync calls tests for each
 iteration
Date: Tue, 21 Jun 2022 16:05:04 +0200
Message-Id: <20220621140507.1246-3-quintela@redhat.com>
In-Reply-To: <20220621140507.1246-1-quintela@redhat.com>
References: <20220621140507.1246-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will sync later in different places.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5f5e37f64d..35816a3a0a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2944,11 +2944,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
-    ret =  multifd_send_sync_main(f);
-    if (ret < 0) {
-        return ret;
+    if (migrate_multifd_sync_each_iteration()) {
+        ret =  multifd_send_sync_main(f);
+        if (ret < 0) {
+            return ret;
+        }
     }
-
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3057,9 +3058,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        ret = multifd_send_sync_main(rs->f);
-        if (ret < 0) {
-            return ret;
+        if (migrate_multifd_sync_each_iteration()) {
+            ret = multifd_send_sync_main(rs->f);
+            if (ret < 0) {
+                return ret;
+            }
         }
 
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
@@ -3125,9 +3128,11 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = multifd_send_sync_main(rs->f);
-    if (ret < 0) {
-        return ret;
+    if (migrate_multifd_sync_each_iteration()) {
+        ret = multifd_send_sync_main(rs->f);
+        if (ret < 0) {
+            return ret;
+        }
     }
 
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
@@ -3799,7 +3804,9 @@ int ram_load_postcopy(QEMUFile *f)
 
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
-            multifd_recv_sync_main();
+            if (migrate_multifd_sync_each_iteration()) {
+                multifd_recv_sync_main();
+            }
             break;
         default:
             error_report("Unknown combination of migration flags: 0x%x"
@@ -4075,7 +4082,9 @@ static int ram_load_precopy(QEMUFile *f)
             break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
-            multifd_recv_sync_main();
+            if (migrate_multifd_sync_each_iteration()) {
+                multifd_recv_sync_main();
+            }
             break;
         default:
             if (flags & RAM_SAVE_FLAG_HOOK) {
-- 
2.34.1


