Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F0263238A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:30:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6rw-0001Uw-0d; Mon, 21 Nov 2022 08:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6rQ-0000rb-Fa
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:29:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6qa-00052u-El
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669037304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+GlhHy1Aw+J2S/PdKkSiWceIYryK6JZft0nwXoxTSo=;
 b=X+p4xc44L9eFeDG0ElkofstucFt5nBieiV7+1GASM0roguKDszjW6PR2EV5LM5n1yRtgvT
 Yj4FrLa8bX4LF2gFe5ou0Jiy9ZEeJfiqKQ/W7J5u7KxXmRgR2br8ihuSPQTMbR0mVMPelg
 muh/ygk8PFqVRXbnZ75QwYDqcAGonAU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-pighrKX1NSiD0FgFp5gFiQ-1; Mon, 21 Nov 2022 08:28:22 -0500
X-MC-Unique: pighrKX1NSiD0FgFp5gFiQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B8E91C0878C;
 Mon, 21 Nov 2022 13:28:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13C294B3FC6;
 Mon, 21 Nov 2022 13:28:18 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 19/19] migration: Drop rs->f
Date: Mon, 21 Nov 2022 14:27:17 +0100
Message-Id: <20221121132717.63070-20-quintela@redhat.com>
In-Reply-To: <20221121132717.63070-1-quintela@redhat.com>
References: <20221121132717.63070-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Peter Xu <peterx@redhat.com>

Now with rs->pss we can already cache channels in pss->pss_channels.  That
pss_channel contains more infromation than rs->f because it's per-channel.
So rs->f could be replaced by rss->pss[RAM_CHANNEL_PRECOPY].pss_channel,
while rs->f itself is a bit vague now.

Note that vanilla postcopy still send pages via pss[RAM_CHANNEL_PRECOPY],
that's slightly confusing but it reflects the reality.

Then, after the replacement we can safely drop rs->f.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1ae093fb61..334309f1c6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -323,8 +323,6 @@ struct RAMSrcPageRequest {
 
 /* State of RAM for migration */
 struct RAMState {
-    /* QEMUFile used for this migration */
-    QEMUFile *f;
     /*
      * PageSearchStatus structures for the channels when send pages.
      * Protected by the bitmap_mutex.
@@ -2532,8 +2530,6 @@ static int ram_find_and_save_block(RAMState *rs)
         }
 
         if (found) {
-            /* Cache rs->f in pss_channel (TODO: remove rs->f) */
-            pss->pss_channel = rs->f;
             pages = ram_save_host_page(rs, pss);
         }
     } while (!pages && again);
@@ -3089,7 +3085,7 @@ static void ram_state_resume_prepare(RAMState *rs, QEMUFile *out)
     ram_state_reset(rs);
 
     /* Update RAMState cache of output QEMUFile */
-    rs->f = out;
+    rs->pss[RAM_CHANNEL_PRECOPY].pss_channel = out;
 
     trace_ram_state_resume_prepare(pages);
 }
@@ -3180,7 +3176,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
             return -1;
         }
     }
-    (*rsp)->f = f;
+    (*rsp)->pss[RAM_CHANNEL_PRECOPY].pss_channel = f;
 
     WITH_RCU_READ_LOCK_GUARD() {
         qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
@@ -3315,7 +3311,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        ret = multifd_send_sync_main(rs->f);
+        ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
         if (ret < 0) {
             return ret;
         }
@@ -3385,7 +3381,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = multifd_send_sync_main(rs->f);
+    ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
     if (ret < 0) {
         return ret;
     }
-- 
2.38.1


