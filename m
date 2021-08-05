Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4263E181E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:35:36 +0200 (CEST)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBfPD-0006hh-Rx
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIi-0007Uw-6t
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIf-0006Yu-Gp
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628177328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yuCH6FaIcf0fSw9wsV3w7RPzDKmuG/cQ8E3dARE37Sk=;
 b=U9SOdD5fzKJYZsiW4AcD4PnHEcdF/JfP1VnF7KT+9Cfu6hALLwXooMt/Wa6YdtXOYJPBuM
 kP9QDcOKhGINsYuL/gQ6R0q8a6irxAVNAsNGgdTleYDWh/6n8WcgEnFZY38W5l6OYy/krt
 Y+o2/mcMY/aV2d6BB1kAlopVubqVxe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-q1T-w0PbNzeZhg09wwqLmg-1; Thu, 05 Aug 2021 11:28:45 -0400
X-MC-Unique: q1T-w0PbNzeZhg09wwqLmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76DD91084F4C;
 Thu,  5 Aug 2021 15:28:44 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4B123CC7;
 Thu,  5 Aug 2021 15:28:41 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/12] hw/s390x/s390-skeys: use memory mapping to detect
 which storage keys to migrate
Date: Thu,  5 Aug 2021 17:28:01 +0200
Message-Id: <20210805152804.100333-10-david@redhat.com>
In-Reply-To: <20210805152804.100333-1-david@redhat.com>
References: <20210805152804.100333-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use the guest_phys_blocks API to get physical memory regions
that are well defined inside our physical address space and migrate the
storage keys of these.

This is a prepearation for having memory besides initial ram defined in
the guest physical address space, for example, via memory devices. We
get rid of the ms->ram_size dependency.

Please note that we will usually have very little (--> 1) physical
ranges. With virtio-mem might have significantly more ranges in the
future. If that turns out to be a problem (e.g., total memory
footprint of the list), we could look into a memory mapping
API that avoids creation of a list and instead triggers a callback for
each range.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/s390x/s390-skeys.c | 70 ++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 27 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 9a8d60d1d9..250685a95a 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -17,6 +17,7 @@
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/error-report.h"
+#include "sysemu/memory_mapping.h"
 #include "sysemu/kvm.h"
 #include "migration/qemu-file-types.h"
 #include "migration/register.h"
@@ -257,10 +258,9 @@ static void s390_storage_keys_save(QEMUFile *f, void *opaque)
 {
     S390SKeysState *ss = S390_SKEYS(opaque);
     S390SKeysClass *skeyclass = S390_SKEYS_GET_CLASS(ss);
-    MachineState *ms = MACHINE(qdev_get_machine());
-    uint64_t pages_left = ms->ram_size / TARGET_PAGE_SIZE;
-    uint64_t read_count, eos = S390_SKEYS_SAVE_FLAG_EOS;
-    vaddr cur_gfn = 0;
+    GuestPhysBlockList guest_phys_blocks;
+    GuestPhysBlock *block;
+    uint64_t pages, gfn;
     int error = 0;
     uint8_t *buf;
 
@@ -274,36 +274,52 @@ static void s390_storage_keys_save(QEMUFile *f, void *opaque)
         goto end_stream;
     }
 
-    /* We only support initial memory. Standby memory is not handled yet. */
-    qemu_put_be64(f, (cur_gfn * TARGET_PAGE_SIZE) | S390_SKEYS_SAVE_FLAG_SKEYS);
-    qemu_put_be64(f, pages_left);
-
-    while (pages_left) {
-        read_count = MIN(pages_left, S390_SKEYS_BUFFER_SIZE);
-
-        if (!error) {
-            error = skeyclass->get_skeys(ss, cur_gfn, read_count, buf);
-            if (error) {
-                /*
-                 * If error: we want to fill the stream with valid data instead
-                 * of stopping early so we pad the stream with 0x00 values and
-                 * use S390_SKEYS_SAVE_FLAG_ERROR to indicate failure to the
-                 * reading side.
-                 */
-                error_report("S390_GET_KEYS error %d", error);
-                memset(buf, 0, S390_SKEYS_BUFFER_SIZE);
-                eos = S390_SKEYS_SAVE_FLAG_ERROR;
+    guest_phys_blocks_init(&guest_phys_blocks);
+    guest_phys_blocks_append(&guest_phys_blocks);
+
+    /* Send each contiguous physical memory range separately. */
+    QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
+        assert(QEMU_IS_ALIGNED(block->target_start, TARGET_PAGE_SIZE));
+        assert(QEMU_IS_ALIGNED(block->target_end, TARGET_PAGE_SIZE));
+
+        gfn = block->target_start / TARGET_PAGE_SIZE;
+        pages = (block->target_end - block->target_start) / TARGET_PAGE_SIZE;
+        qemu_put_be64(f, block->target_start | S390_SKEYS_SAVE_FLAG_SKEYS);
+        qemu_put_be64(f, pages);
+
+        while (pages) {
+            const uint64_t cur_pages = MIN(pages, S390_SKEYS_BUFFER_SIZE);
+
+            if (!error) {
+                error = skeyclass->get_skeys(ss, gfn, cur_pages, buf);
+                if (error) {
+                    /*
+                     * Create a valid stream with all 0x00 and indicate
+                     * S390_SKEYS_SAVE_FLAG_ERROR to the destination.
+                     */
+                    error_report("S390_GET_KEYS error %d", error);
+                    memset(buf, 0, S390_SKEYS_BUFFER_SIZE);
+                }
             }
+
+            qemu_put_buffer(f, buf, cur_pages);
+            gfn += cur_pages;
+            pages -= cur_pages;
         }
 
-        qemu_put_buffer(f, buf, read_count);
-        cur_gfn += read_count;
-        pages_left -= read_count;
+        if (error) {
+            break;
+        }
     }
 
+    guest_phys_blocks_free(&guest_phys_blocks);
     g_free(buf);
 end_stream:
-    qemu_put_be64(f, eos);
+    if (error) {
+        qemu_put_be64(f, S390_SKEYS_SAVE_FLAG_ERROR);
+    } else {
+        qemu_put_be64(f, S390_SKEYS_SAVE_FLAG_EOS);
+    }
 }
 
 static int s390_storage_keys_load(QEMUFile *f, void *opaque, int version_id)
-- 
2.31.1


