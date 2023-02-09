Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82036914BA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 00:38:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQGU7-0002Hy-47; Thu, 09 Feb 2023 18:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGU5-0002HB-3u
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:37:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGU3-0007ej-GV
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675985860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzgODHyOzQWAbk4AHk7gxv4NiJacsm4N2/IzV+CEIKw=;
 b=gD53FK2nlpCiokF9QiJijdUKLMzO2U+VuIuUxpFq4hH6hH/95I429YTJFEtfRdkBkR3pHE
 BneznwQWxEKJgOC/Vw0D5weY+p40A+3pgRL0fNCxwSluIphxLzkSix0Yqo6IiTmqpb3YPZ
 iAiQzSxqmFg1UcHjAokmhKuR6H+wWRQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-62vO5Jn0MjC-t7BJp60MBA-1; Thu, 09 Feb 2023 18:37:37 -0500
X-MC-Unique: 62vO5Jn0MjC-t7BJp60MBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F83D3C0D864;
 Thu,  9 Feb 2023 23:37:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3050E140EBF6;
 Thu,  9 Feb 2023 23:37:35 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 2/4] multifd: Protect multifd_send_sync_main() calls
Date: Fri, 10 Feb 2023 00:37:28 +0100
Message-Id: <20230209233730.38288-3-quintela@redhat.com>
In-Reply-To: <20230209233730.38288-1-quintela@redhat.com>
References: <20230209233730.38288-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
index 8d114afd4b..899e2cd8af 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3406,9 +3406,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
-        if (ret < 0) {
-            return ret;
+        if (migrate_multifd_sync_after_each_section()) {
+            ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
+            if (ret < 0) {
+                return ret;
+            }
         }
 
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
@@ -4168,7 +4170,9 @@ int ram_load_postcopy(QEMUFile *f, int channel)
 
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
-            multifd_recv_sync_main();
+            if (migrate_multifd_sync_after_each_section()) {
+                multifd_recv_sync_main();
+            }
             break;
         default:
             error_report("Unknown combination of migration flags: 0x%x"
@@ -4439,7 +4443,9 @@ static int ram_load_precopy(QEMUFile *f)
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


