Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FADF52277D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 01:19:27 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noZ8Y-0002BK-HA
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 19:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noZ6S-0000AR-8U
 for qemu-devel@nongnu.org; Tue, 10 May 2022 19:17:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noZ6P-0002de-LR
 for qemu-devel@nongnu.org; Tue, 10 May 2022 19:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652224632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C3PhERB/Qd47X3D+Dfp1vJsPqLtsrfRafbeH2AAOHKU=;
 b=jNHkQBkr1h8m0OOKIkb2mZrfgZ/jXjGXXrkvIjUUtVkNdUkGTW/pwEJN1XqbML/COCzu2t
 YrU+lwT345/DWsGSxQZxK59dwgQMqH9wz2mqXtR58acDhgsw4H0wCenUfUqJMIBzq/mCm8
 nKh0MLwcgzm3Db6NSI7I2PBZmpKtEgs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-Q8QLM7fHM4-wdIP8kWKWxg-1; Tue, 10 May 2022 19:17:11 -0400
X-MC-Unique: Q8QLM7fHM4-wdIP8kWKWxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AC1A185A7A4
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 23:17:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C62940D0161;
 Tue, 10 May 2022 23:17:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>
Subject: [PATCH 1/2] migration: Split ram_bytes_total_common() in two functions
Date: Wed, 11 May 2022 01:17:07 +0200
Message-Id: <20220510231708.7197-2-quintela@redhat.com>
In-Reply-To: <20220510231708.7197-1-quintela@redhat.com>
References: <20220510231708.7197-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

It is just a big if in the middle of the function, and we need two
functions anways.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index a2489a2699..b3fa3d5d8f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2304,28 +2304,30 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
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
@@ -2924,7 +2926,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     (*rsp)->f = f;
 
     WITH_RCU_READ_LOCK_GUARD() {
-        qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
+        qemu_put_be64(f, ram_bytes_total_with_ignored() | RAM_SAVE_FLAG_MEM_SIZE);
 
         RAMBLOCK_FOREACH_MIGRATABLE(block) {
             qemu_put_byte(f, strlen(block->idstr));
-- 
2.35.1


