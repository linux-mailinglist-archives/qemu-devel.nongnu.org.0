Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0937AA61
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:13:49 +0200 (CEST)
Received: from localhost ([::1]:35756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgU4y-0006gp-BY
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU0a-0006oc-7x
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU0V-0004MW-VJ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvPzD05Q5eMGhLmbAKUJqAkee5+TTYcJwpga4//Zteg=;
 b=DG5csf6niLnWv6Ra69nOidsXbN7J/s52gLtxHepqWyH2BE3C48OP6fub2JKh9iaWqlTYqy
 e9+Hsf+M+Ac4W8GrJ8x1MRX5tIDgfeAwkcqk6HpfB5lHIRHpYKKGNfbSeYqIjKW46nEn35
 aQj4dHzXKeCVtu9FKSZyCSs22JJq5q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-XkAGGlv9OJ2Uk-JnyH3zYQ-1; Tue, 11 May 2021 11:09:08 -0400
X-MC-Unique: XkAGGlv9OJ2Uk-JnyH3zYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 064FCFC88;
 Tue, 11 May 2021 15:09:07 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-51.ams2.redhat.com
 [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C00A6614EB;
 Tue, 11 May 2021 15:09:02 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 03/17] migration/ram: Optimize ram_save_host_page()
Date: Tue, 11 May 2021 16:08:28 +0100
Message-Id: <20210511150842.207155-4-dgilbert@redhat.com>
In-Reply-To: <20210511150842.207155-1-dgilbert@redhat.com>
References: <20210511150842.207155-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kunkun Jiang <jiangkunkun@huawei.com>

Starting from pss->page, ram_save_host_page() will check every page
and send the dirty pages up to the end of the current host page or
the boundary of used_length of the block. If the host page size is
a huge page, the step "check" will take a lot of time.

It will improve performance to use migration_bitmap_find_dirty().

Tested on Kunpeng 920; VM parameters: 1U 4G (page size 1G)
The time of ram_save_host_page() in the last round of ram saving:
before optimize: 9250us		after optimize: 34us

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210316125716.1243-3-jiangkunkun@huawei.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 00b579b981..bb52bd97db 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2013,6 +2013,8 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
     int tmppages, pages = 0;
     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
+    unsigned long hostpage_boundary =
+        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
     unsigned long start_page = pss->page;
     int res;
 
@@ -2023,30 +2025,27 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
 
     do {
         /* Check the pages is dirty and if it is send it */
-        if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
-            pss->page++;
-            continue;
-        }
-
-        tmppages = ram_save_target_page(rs, pss, last_stage);
-        if (tmppages < 0) {
-            return tmppages;
-        }
+        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
+            tmppages = ram_save_target_page(rs, pss, last_stage);
+            if (tmppages < 0) {
+                return tmppages;
+            }
 
-        pages += tmppages;
-        pss->page++;
-        /*
-         * Allow rate limiting to happen in the middle of huge pages if
-         * something is sent in the current iteration.
-         */
-        if (pagesize_bits > 1 && tmppages > 0) {
-            migration_rate_limit();
+            pages += tmppages;
+            /*
+             * Allow rate limiting to happen in the middle of huge pages if
+             * something is sent in the current iteration.
+             */
+            if (pagesize_bits > 1 && tmppages > 0) {
+                migration_rate_limit();
+            }
         }
-    } while ((pss->page & (pagesize_bits - 1)) &&
+        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
+    } while ((pss->page < hostpage_boundary) &&
              offset_in_ramblock(pss->block,
                                 ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
-    /* The offset we leave with is the last one we looked at */
-    pss->page--;
+    /* The offset we leave with is the min boundary of host page and block */
+    pss->page = MIN(pss->page, hostpage_boundary) - 1;
 
     res = ram_save_release_protection(rs, pss, start_page);
     return (res < 0 ? res : pages);
-- 
2.31.1


