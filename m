Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C196982E1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:04:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSM7R-0000UN-1J; Wed, 15 Feb 2023 13:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSM7F-0000QZ-HT
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:02:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSM7D-0004dN-NB
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676484166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sCjEzCRxX0M0nk6I2m/GcDkpwt4qScXDPUqkDYQllqM=;
 b=evH8cTB/tHusO1ODkoP4R+ENs05Mwwzu4wMOwnhjacWOk4FOoKn2avOHTRF1aKIbqqoDJV
 k/c4rEy0YmJgqOE6pEqB0c2/H38wVYqZB4OV/3S/ZZcMVJnwKMwmTtU4l+6cTtB0v05mnq
 LZH1lRqV0jNK8kwLWXZdMVi3q8bro68=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-rd4-2waCNhu6jB0xhjMx4g-1; Wed, 15 Feb 2023 13:02:38 -0500
X-MC-Unique: rd4-2waCNhu6jB0xhjMx4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C12D385A588;
 Wed, 15 Feb 2023 18:02:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4918E2026D4B;
 Wed, 15 Feb 2023 18:02:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH v6 2/3] multifd: Protect multifd_send_sync_main() calls
Date: Wed, 15 Feb 2023 19:02:30 +0100
Message-Id: <20230215180231.7644-3-quintela@redhat.com>
In-Reply-To: <20230215180231.7644-1-quintela@redhat.com>
References: <20230215180231.7644-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

We only need to do that on the ram_save_iterate() call on sending and
on destination when we get a RAM_SAVE_FLAG_EOS.

In setup() and complete() we need to synch in both new and old cases,
so don't add a check there.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Remove the wrappers that we take out on patch 5.
---
 migration/ram.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 521912385d..6191dac9af 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3408,9 +3408,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
-        if (ret < 0) {
-            return ret;
+        if (migrate_multifd_flush_after_each_section()) {
+            ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
+            if (ret < 0) {
+                return ret;
+            }
         }
 
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
@@ -4170,7 +4172,9 @@ int ram_load_postcopy(QEMUFile *f, int channel)
 
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
-            multifd_recv_sync_main();
+            if (migrate_multifd_flush_after_each_section()) {
+                multifd_recv_sync_main();
+            }
             break;
         default:
             error_report("Unknown combination of migration flags: 0x%x"
@@ -4441,7 +4445,9 @@ static int ram_load_precopy(QEMUFile *f)
             break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
-            multifd_recv_sync_main();
+            if (migrate_multifd_flush_after_each_section()) {
+                multifd_recv_sync_main();
+            }
             break;
         default:
             if (flags & RAM_SAVE_FLAG_HOOK) {
-- 
2.39.1


