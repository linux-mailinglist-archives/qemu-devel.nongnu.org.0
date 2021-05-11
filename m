Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B4137AAA2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:25:43 +0200 (CEST)
Received: from localhost ([::1]:38348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUGT-0002sh-VF
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU1Z-00007e-4q
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU1W-0004iz-F3
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33BsZ3D0txt869AfvviqCxMv4hSNDlrsUfKXxCD/PEI=;
 b=cIdPLD6L+XKOfyy6Fb+VgkCcXNG2pC14yPq69ovcHdJ312PUuI4AI1twKy0VqJyWwgjCTU
 UMuZnWpJSh5mhm+sA8Tn0V8WLtf4pD6121oDXxZyOpTkk+pi2lT62vnba/OJAmFiiBiOiJ
 j4usRiQX+WMTDIZi/tAXp4adWxwAeRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-iZTmmoj_NGGpNmdU5MI8Ow-1; Tue, 11 May 2021 11:10:10 -0400
X-MC-Unique: iZTmmoj_NGGpNmdU5MI8Ow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE2A91854E24;
 Tue, 11 May 2021 15:10:09 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-51.ams2.redhat.com
 [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 560FF6A940;
 Tue, 11 May 2021 15:10:03 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 14/17] migration/ram: Use offset_in_ramblock() in range checks
Date: Tue, 11 May 2021 16:08:39 +0100
Message-Id: <20210511150842.207155-15-dgilbert@redhat.com>
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

From: David Hildenbrand <david@redhat.com>

We never read or write beyond the used_length of memory blocks when
migrating. Make this clearer by using offset_in_ramblock() consistently.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210429112708.12291-11-david@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 0ed1005f1a..7ea9c779cc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1342,8 +1342,8 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
         *again = false;
         return false;
     }
-    if ((((ram_addr_t)pss->page) << TARGET_PAGE_BITS)
-        >= pss->block->used_length) {
+    if (!offset_in_ramblock(pss->block,
+                            ((ram_addr_t)pss->page) << TARGET_PAGE_BITS)) {
         /* Didn't find anything in this RAM Block */
         pss->page = 0;
         pss->block = QLIST_NEXT_RCU(pss->block, next);
@@ -1863,7 +1863,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
         rs->last_req_rb = ramblock;
     }
     trace_ram_save_queue_pages(ramblock->idstr, start, len);
-    if (start + len > ramblock->used_length) {
+    if (!offset_in_ramblock(ramblock, start + len - 1)) {
         error_report("%s request overrun start=" RAM_ADDR_FMT " len="
                      RAM_ADDR_FMT " blocklen=" RAM_ADDR_FMT,
                      __func__, start, len, ramblock->used_length);
@@ -3696,8 +3696,8 @@ void colo_flush_ram_cache(void)
         while (block) {
             offset = migration_bitmap_find_dirty(ram_state, block, offset);
 
-            if (((ram_addr_t)offset) << TARGET_PAGE_BITS
-                >= block->used_length) {
+            if (!offset_in_ramblock(block,
+                                    ((ram_addr_t)offset) << TARGET_PAGE_BITS)) {
                 offset = 0;
                 block = QLIST_NEXT_RCU(block, next);
             } else {
-- 
2.31.1


