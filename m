Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6156702CD6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:37:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXPg-0006jC-B7; Mon, 15 May 2023 08:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOk-0006RD-Bp
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:33:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOg-0003K1-HU
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tN/SR4Ju+jfq6SzQNNQ4u1IOrbHLiPvooaqy1t3mEOA=;
 b=UGHklDInXZ2Eb7WTWirlkjCrRI1OJqNDHu/3ftC1f+yNNgZ8I34Yl5nu26dfYeLKOl6lYO
 B2Kh+xy+74lDve+3OITNRoVXUAxE0fnVwklQ+QSMsonax6qqrkBCAC7y1MoTNQP7Vgm65O
 TcfqcERBI2ri+mQ8XaG3wXYJT5qNwd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-2lbDfOc8NJO0U5JhmsYsWg-1; Mon, 15 May 2023 08:33:46 -0400
X-MC-Unique: 2lbDfOc8NJO0U5JhmsYsWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C4841854CA0;
 Mon, 15 May 2023 12:33:46 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A02C63F8F;
 Mon, 15 May 2023 12:33:44 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 04/11] migration: Teach dirtyrate about qemu_target_page_size()
Date: Mon, 15 May 2023 14:33:27 +0200
Message-Id: <20230515123334.58995-5-quintela@redhat.com>
In-Reply-To: <20230515123334.58995-1-quintela@redhat.com>
References: <20230515123334.58995-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230511141208.17779-4-quintela@redhat.com>
---
 migration/dirtyrate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index ae52c42c4c..9383e91cd6 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -313,6 +313,7 @@ static void update_dirtyrate(uint64_t msec)
  */
 static uint32_t compute_page_hash(void *ptr)
 {
+    size_t page_size = qemu_target_page_size();
     uint32_t i;
     uint64_t v1, v2, v3, v4;
     uint64_t res;
@@ -322,14 +323,14 @@ static uint32_t compute_page_hash(void *ptr)
     v2 = QEMU_XXHASH_SEED + XXH_PRIME64_2;
     v3 = QEMU_XXHASH_SEED + 0;
     v4 = QEMU_XXHASH_SEED - XXH_PRIME64_1;
-    for (i = 0; i < TARGET_PAGE_SIZE / 8; i += 4) {
+    for (i = 0; i < page_size / 8; i += 4) {
         v1 = XXH64_round(v1, p[i + 0]);
         v2 = XXH64_round(v2, p[i + 1]);
         v3 = XXH64_round(v3, p[i + 2]);
         v4 = XXH64_round(v4, p[i + 3]);
     }
     res = XXH64_mergerounds(v1, v2, v3, v4);
-    res += TARGET_PAGE_SIZE;
+    res += page_size;
     res = XXH64_avalanche(res);
     return (uint32_t)(res & UINT32_MAX);
 }
@@ -344,7 +345,8 @@ static uint32_t get_ramblock_vfn_hash(struct RamblockDirtyInfo *info,
 {
     uint32_t hash;
 
-    hash = compute_page_hash(info->ramblock_addr + vfn * TARGET_PAGE_SIZE);
+    hash = compute_page_hash(info->ramblock_addr +
+                             vfn * qemu_target_page_size());
 
     trace_get_ramblock_vfn_hash(info->idstr, vfn, hash);
     return hash;
-- 
2.40.1


