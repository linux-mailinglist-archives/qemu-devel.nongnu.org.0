Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E79553432
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:08:55 +0200 (CEST)
Received: from localhost ([::1]:52320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3eYo-0005Hn-EN
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVf-0003Ed-61
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVZ-00007a-0O
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655820332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ws13QdUcyYGFjbw70rrJhmkRqsVUGx4aeK7EIwM+OI=;
 b=HaVB/QXXbNEn6OKZlwMwQj8vtpzLioGa9fAwOAkcFtnBRk4OPUSfnqMfc6CwrjD86gZCAK
 /slzI8WsIHprRNuN48Ydd3iGjk5b5qvrWGdHE+r6EN7Y2/6l5BNMOMpskcRk0KGdRjlEMQ
 C2ldKEGR2IkO384ceWXCwrykrqk9Sos=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-1Q2-BpvaOUG2rxKroddsmg-1; Tue, 21 Jun 2022 10:05:26 -0400
X-MC-Unique: 1Q2-BpvaOUG2rxKroddsmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 280B43C17F14;
 Tue, 21 Jun 2022 14:05:26 +0000 (UTC)
Received: from secure.laptop (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 750E42166B26;
 Tue, 21 Jun 2022 14:05:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 3/5] migration: Simplify ram_find_and_save_block()
Date: Tue, 21 Jun 2022 16:05:05 +0200
Message-Id: <20220621140507.1246-4-quintela@redhat.com>
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

We will need later that find_dirty_block() return errors, so
simplify the loop.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 35816a3a0a..1d4ff3185b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2256,7 +2256,6 @@ static int ram_find_and_save_block(RAMState *rs)
 {
     PageSearchStatus pss;
     int pages = 0;
-    bool again, found;
 
     /* No dirty page as there is zero RAM */
     if (!ram_bytes_total()) {
@@ -2272,18 +2271,17 @@ static int ram_find_and_save_block(RAMState *rs)
     }
 
     do {
-        again = true;
-        found = get_queued_page(rs, &pss);
-
-        if (!found) {
+        if (!get_queued_page(rs, &pss)) {
             /* priority queue empty, so just search for something dirty */
-            found = find_dirty_block(rs, &pss, &again);
+            bool again = true;
+            if (!find_dirty_block(rs, &pss, &again)) {
+                if (!again) {
+                    break;
+                }
+            }
         }
-
-        if (found) {
-            pages = ram_save_host_page(rs, &pss);
-        }
-    } while (!pages && again);
+        pages = ram_save_host_page(rs, &pss);
+    } while (!pages);
 
     rs->last_seen_block = pss.block;
     rs->last_page = pss.page;
-- 
2.34.1


