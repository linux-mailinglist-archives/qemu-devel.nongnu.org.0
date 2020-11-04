Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B32A672D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 16:10:47 +0100 (CET)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaKQw-0006Ww-VL
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 10:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kaKIk-0003CU-OY
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:02:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kaKIZ-00063c-Qd
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604502127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XiD8HbcJhfbTr0TesAGVNWogVRGczLPh7/pZG4xTuw8=;
 b=D6rntFXyepCfh2Ydoy3kSJr6vpQfXQUL4cceb7XVkYbOmdY1D7hXX+uyo6DXu/5slBk7+s
 NCbDOeoyVO8cF/Qb+nZ4nHU0NUnBDvFWZyDOEpkEpDrhFCneERvtpha7nMc9PJbwcVXaR+
 AMGBhZTj9kqEzbvlsKh2iRfaiQneles=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-t03oaX70OAmalcJH75Uwcg-1; Wed, 04 Nov 2020 10:02:02 -0500
X-MC-Unique: t03oaX70OAmalcJH75Uwcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1D641891E9F;
 Wed,  4 Nov 2020 15:02:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FCF56EF6A;
 Wed,  4 Nov 2020 15:02:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] fuzz: fix writing DMA patterns
Date: Wed,  4 Nov 2020 10:01:47 -0500
Message-Id: <20201104150153.541326-15-pbonzini@redhat.com>
In-Reply-To: <20201104150153.541326-1-pbonzini@redhat.com>
References: <20201104150153.541326-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

This code had all sorts of issues. We used a loop similar to
address_space_write_rom, but I did not remove a "break" that only made
sense in the context of the switch statement in the original code. Then,
after the loop, we did a separate qtest_memwrite over the entire DMA
access range, defeating the purpose of the loop. Additionally, we
increment the buf pointer, and then try to g_free() it. Fix these
problems.

Reported-by: OSS-Fuzz (Issue 26725)
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: OSS-Fuzz (Issue 26691)
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20201029172901.534442-2-alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 37 +++++++++++++++------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index a8f5864883..3e2d50feaa 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -229,10 +229,10 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr, bool is_write)
     address_range ar = {addr, len};
     g_array_append_val(dma_regions, ar);
     pattern p = g_array_index(dma_patterns, pattern, dma_pattern_index);
-    void *buf = pattern_alloc(p, ar.size);
+    void *buf_base = pattern_alloc(p, ar.size);
+    void *buf = buf_base;
     hwaddr l, addr1;
     MemoryRegion *mr1;
-    uint8_t *ram_ptr;
     while (len > 0) {
         l = len;
         mr1 = address_space_translate(first_cpu->as,
@@ -244,30 +244,27 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr, bool is_write)
             l = memory_access_size(mr1, l, addr1);
         } else {
             /* ROM/RAM case */
-            ram_ptr = qemu_map_ram_ptr(mr1->ram_block, addr1);
-            memcpy(ram_ptr, buf, l);
-            break;
+            if (qtest_log_enabled) {
+                /*
+                * With QTEST_LOG, use a normal, slow QTest memwrite. Prefix the log
+                * that will be written by qtest.c with a DMA tag, so we can reorder
+                * the resulting QTest trace so the DMA fills precede the last PIO/MMIO
+                * command.
+                */
+                fprintf(stderr, "[DMA] ");
+                if (double_fetch) {
+                    fprintf(stderr, "[DOUBLE-FETCH] ");
+                }
+                fflush(stderr);
+            }
+            qtest_memwrite(qts_global, addr, buf, l);
         }
         len -= l;
         buf += l;
         addr += l;
 
     }
-    if (qtest_log_enabled) {
-        /*
-         * With QTEST_LOG, use a normal, slow QTest memwrite. Prefix the log
-         * that will be written by qtest.c with a DMA tag, so we can reorder
-         * the resulting QTest trace so the DMA fills precede the last PIO/MMIO
-         * command.
-         */
-        fprintf(stderr, "[DMA] ");
-        if (double_fetch) {
-            fprintf(stderr, "[DOUBLE-FETCH] ");
-        }
-        fflush(stderr);
-    }
-    qtest_memwrite(qts_global, ar.addr, buf, ar.size);
-    g_free(buf);
+    g_free(buf_base);
 
     /* Increment the index of the pattern for the next DMA access */
     dma_pattern_index = (dma_pattern_index + 1) % dma_patterns->len;
-- 
2.26.2



