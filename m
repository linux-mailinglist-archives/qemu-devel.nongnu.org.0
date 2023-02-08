Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8C68EFC5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:31:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkX8-0000eL-DJ; Wed, 08 Feb 2023 08:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkWm-0000U8-Pg
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:30:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkWl-00076P-7W
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675863022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrkF6Evvslyb699wK/97JmnRE7geMlSfLtpM4sgvx48=;
 b=Hh1cryHidKXndFKKysIelfs2ayfK9pd9KIJJLa76hVlQqWDEbjRuecDYwYUsoWN5GVIxD0
 9K9Cqn556LMxCCRdkDAYw0HT6x+wV3yWO2wpUqbYBh5s/DmNhjCR1HYDiqb7GilKjYUUgi
 xl1DGiPArVpy+PrHKWNspGW+mC6rE7M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-Sias0M2JPwCHtreOEMBeYA-1; Wed, 08 Feb 2023 08:30:19 -0500
X-MC-Unique: Sias0M2JPwCHtreOEMBeYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CF3188904E;
 Wed,  8 Feb 2023 13:30:19 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C901C15BA0;
 Wed,  8 Feb 2023 13:30:16 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 2/6] multifd: Protect multifd_send_sync_main() calls
Date: Wed,  8 Feb 2023 14:30:06 +0100
Message-Id: <20230208133010.17323-3-quintela@redhat.com>
In-Reply-To: <20230208133010.17323-1-quintela@redhat.com>
References: <20230208133010.17323-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
 migration/ram.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b966e148c2..0f0fd5c36a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3354,9 +3354,12 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
-        if (ret < 0) {
-            return ret;
+        if (migrate_multifd_sync_after_each_section()) {
+            ret = multifd_send_sync_main(
+                rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
+            if (ret < 0) {
+                return ret;
+            }
         }
 
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
@@ -4116,7 +4119,9 @@ int ram_load_postcopy(QEMUFile *f, int channel)
 
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
-            multifd_recv_sync_main();
+            if (migrate_multifd_sync_after_each_section()) {
+                multifd_recv_sync_main();
+            }
             break;
         default:
             error_report("Unknown combination of migration flags: 0x%x"
@@ -4387,7 +4392,9 @@ static int ram_load_precopy(QEMUFile *f)
             break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
-            multifd_recv_sync_main();
+            if (migrate_multifd_sync_after_each_section()) {
+                multifd_recv_sync_main();
+            }
             break;
         default:
             if (flags & RAM_SAVE_FLAG_HOOK) {
-- 
2.39.1


