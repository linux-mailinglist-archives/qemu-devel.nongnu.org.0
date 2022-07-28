Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243A2583E68
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:13:55 +0200 (CEST)
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2On-0002Ee-Vs
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2IQ-000131-ES
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2IN-0005h2-FS
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659010033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UW2v1hdObXcPQf63vJd+aoRP3AtFIHpRVXrGLzChD4I=;
 b=DyOL57xZ8XUnm3bkGwvHtrDiiTUHs5Q1ihcpK/fVLYNUbjKZrxJb3orEmZUtVrAMUiiOsb
 i8BIdnNRMr8PlfrLRahTjh12Ky/9G0Es/2Zcs9Kfg4RnVWpu0q6ncfojnNUQP1ghth/w9D
 vhK14vMUW0CjtmuXka4ubGPGF9Tw43c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-EsiZnpXcNmuG1wK8-9w1eQ-1; Thu, 28 Jul 2022 08:07:12 -0400
X-MC-Unique: EsiZnpXcNmuG1wK8-9w1eQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F139801585
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 12:07:12 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C13E1415118;
 Thu, 28 Jul 2022 12:07:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v2 1/2] migration: Split ram_bytes_total_common() in two
 functions
Date: Thu, 28 Jul 2022 14:07:08 +0200
Message-Id: <20220728120709.5782-2-quintela@redhat.com>
In-Reply-To: <20220728120709.5782-1-quintela@redhat.com>
References: <20220728120709.5782-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

It is just a big if in the middle of the function, and we need two
functions anways.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b94669ba5d..96a2b848da 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2581,28 +2581,30 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     }
 }
 
-static uint64_t ram_bytes_total_common(bool count_ignored)
+static uint64_t ram_bytes_total_with_ignored(void)
 {
     RAMBlock *block;
     uint64_t total = 0;
 
     RCU_READ_LOCK_GUARD();
 
-    if (count_ignored) {
-        RAMBLOCK_FOREACH_MIGRATABLE(block) {
-            total += block->used_length;
-        }
-    } else {
-        RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-            total += block->used_length;
-        }
+    RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        total += block->used_length;
     }
     return total;
 }
 
 uint64_t ram_bytes_total(void)
 {
-    return ram_bytes_total_common(false);
+    RAMBlock *block;
+    uint64_t total = 0;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
+        total += block->used_length;
+    }
+    return total;
 }
 
 static void xbzrle_load_setup(void)
@@ -3204,7 +3206,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     (*rsp)->f = f;
 
     WITH_RCU_READ_LOCK_GUARD() {
-        qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
+        qemu_put_be64(f, ram_bytes_total_with_ignored() | RAM_SAVE_FLAG_MEM_SIZE);
 
         RAMBLOCK_FOREACH_MIGRATABLE(block) {
             qemu_put_byte(f, strlen(block->idstr));
-- 
2.37.1


