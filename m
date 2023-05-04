Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4F6F6A85
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:54:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXWr-0001Fp-Ui; Thu, 04 May 2023 07:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXWc-0001E2-Sj
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:53:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXWa-0001R4-Mo
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uZy5BeUHyl/UrDmarPzqqglMMSReLvHwoJEoHEswzgs=;
 b=KfhcYN+Z1nFIdoFVFxb8VZNXmFF78/iGSijx4E1NHIaekj8v8w3ViW3NgltnbUwOpq8iqd
 QTSQA/nlAFoQnFRsQ5HaZHj6eOM4mO0u7hzunUuKHQbtqn4TYqX711cBxqLndZObAVILWT
 ci4eMveQYvDGgxtTEfivc8AL/eFV/FQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-ar1a9dEWOGiOL22SgAD6nw-1; Thu, 04 May 2023 07:53:26 -0400
X-MC-Unique: ar1a9dEWOGiOL22SgAD6nw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C2BD811E7C
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 11:53:26 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E644D492C3E;
 Thu,  4 May 2023 11:53:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH] migration: Rename xbzrle_enabled xbzrle_started
Date: Thu,  4 May 2023 13:53:23 +0200
Message-Id: <20230504115323.24407-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Otherwise it is confusing with the function xbzrle_enabled().

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 43338e1f5b..06015eeb0b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -388,8 +388,8 @@ struct RAMState {
     uint64_t xbzrle_pages_prev;
     /* Amount of xbzrle encoded bytes since the beginning of the period */
     uint64_t xbzrle_bytes_prev;
-    /* Start using XBZRLE (e.g., after the first round). */
-    bool xbzrle_enabled;
+    /* Are we really  using XBZRLE (e.g., after the first round). */
+    bool xbzrle_started;
     /* Are we on the last stage of migration */
     bool last_stage;
     /* compression statistics since the beginning of the period */
@@ -1420,7 +1420,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
     trace_ram_save_page(block->idstr, (uint64_t)offset, p);
 
     XBZRLE_cache_lock();
-    if (rs->xbzrle_enabled && !migration_in_postcopy()) {
+    if (rs->xbzrle_started && !migration_in_postcopy()) {
         pages = save_xbzrle_page(rs, pss, &p, current_addr,
                                  block, offset);
         if (!rs->last_stage) {
@@ -1636,7 +1636,7 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
             pss->complete_round = true;
             /* After the first round, enable XBZRLE. */
             if (migrate_xbzrle()) {
-                rs->xbzrle_enabled = true;
+                rs->xbzrle_started = true;
             }
         }
         /* Didn't find anything this time, but try again on the new block */
@@ -2288,7 +2288,7 @@ static bool save_page_use_compression(RAMState *rs)
      * using the data compression. In theory, xbzrle can do better than
      * compression.
      */
-    if (rs->xbzrle_enabled) {
+    if (rs->xbzrle_started) {
         return false;
     }
 
@@ -2357,7 +2357,7 @@ static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
          */
-        if (rs->xbzrle_enabled) {
+        if (rs->xbzrle_started) {
             XBZRLE_cache_lock();
             xbzrle_cache_zero_page(rs, block->offset + offset);
             XBZRLE_cache_unlock();
@@ -2738,7 +2738,7 @@ static void ram_state_reset(RAMState *rs)
     rs->last_seen_block = NULL;
     rs->last_page = 0;
     rs->last_version = ram_list.version;
-    rs->xbzrle_enabled = false;
+    rs->xbzrle_started = false;
 }
 
 #define MAX_WAIT 50 /* ms, half buffered_file limit */
-- 
2.40.0


