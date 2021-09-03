Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86B4002F8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:08:08 +0200 (CEST)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBjb-0004hX-GV
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXw-0001kH-IN
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:56:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXu-0000jX-Qs
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kziqgMymkMLtY5poKAOZZqOtzjY64iw5zYUWpNorWmw=;
 b=Mpv2wDRrNCermvkv8AbVWJD81xynIqr0DKDRSu8HSiLqMfQvve1VqyoCrmb+aNbxgfXJPq
 nrUNZ0CKdlzjCS5zDdhs0vcBzFdR+HplIxzWV7Eum+qoEIaTG1DoTUsoj+7Qymsqq8duY8
 GeI43VfCw7oAJFZNk8T6ExF513bgz+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-R18D_EbFMwCs_3RK1YmW8A-1; Fri, 03 Sep 2021 11:55:58 -0400
X-MC-Unique: R18D_EbFMwCs_3RK1YmW8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00D598015C7;
 Fri,  3 Sep 2021 15:55:56 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D673C60916;
 Fri,  3 Sep 2021 15:55:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/13] hw/s390x/s390-skeys: use memory mapping to detect
 which storage keys to dump
Date: Fri,  3 Sep 2021 17:55:11 +0200
Message-Id: <20210903155514.44772-11-david@redhat.com>
In-Reply-To: <20210903155514.44772-1-david@redhat.com>
References: <20210903155514.44772-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Handle it similar to migration. Assert that we're holding the BQL, to
make sure we don't see concurrent modifications.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/s390x/s390-skeys.c | 50 ++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 250685a95a..56a47fe180 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -110,11 +110,10 @@ void qmp_dump_skeys(const char *filename, Error **errp)
 {
     S390SKeysState *ss = s390_get_skeys_device();
     S390SKeysClass *skeyclass = S390_SKEYS_GET_CLASS(ss);
-    MachineState *ms = MACHINE(qdev_get_machine());
-    const uint64_t total_count = ms->ram_size / TARGET_PAGE_SIZE;
-    uint64_t handled_count = 0, cur_count;
+    GuestPhysBlockList guest_phys_blocks;
+    GuestPhysBlock *block;
+    uint64_t pages, gfn;
     Error *lerr = NULL;
-    vaddr cur_gfn = 0;
     uint8_t *buf;
     int ret;
     int fd;
@@ -145,28 +144,39 @@ void qmp_dump_skeys(const char *filename, Error **errp)
         goto out;
     }
 
-    /* we'll only dump initial memory for now */
-    while (handled_count < total_count) {
-        /* Calculate how many keys to ask for & handle overflow case */
-        cur_count = MIN(total_count - handled_count, S390_SKEYS_BUFFER_SIZE);
+    assert(qemu_mutex_iothread_locked());
+    guest_phys_blocks_init(&guest_phys_blocks);
+    guest_phys_blocks_append(&guest_phys_blocks);
 
-        ret = skeyclass->get_skeys(ss, cur_gfn, cur_count, buf);
-        if (ret < 0) {
-            error_setg(errp, "get_keys error %d", ret);
-            goto out_free;
-        }
+    QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
+        assert(QEMU_IS_ALIGNED(block->target_start, TARGET_PAGE_SIZE));
+        assert(QEMU_IS_ALIGNED(block->target_end, TARGET_PAGE_SIZE));
 
-        /* write keys to stream */
-        write_keys(f, buf, cur_gfn, cur_count, &lerr);
-        if (lerr) {
-            goto out_free;
-        }
+        gfn = block->target_start / TARGET_PAGE_SIZE;
+        pages = (block->target_end - block->target_start) / TARGET_PAGE_SIZE;
 
-        cur_gfn += cur_count;
-        handled_count += cur_count;
+        while (pages) {
+            const uint64_t cur_pages = MIN(pages, S390_SKEYS_BUFFER_SIZE);
+
+            ret = skeyclass->get_skeys(ss, gfn, cur_pages, buf);
+            if (ret < 0) {
+                error_setg_errno(errp, -ret, "get_keys error");
+                goto out_free;
+            }
+
+            /* write keys to stream */
+            write_keys(f, buf, gfn, cur_pages, &lerr);
+            if (lerr) {
+                goto out_free;
+            }
+
+            gfn += cur_pages;
+            pages -= cur_pages;
+        }
     }
 
 out_free:
+    guest_phys_blocks_free(&guest_phys_blocks);
     error_propagate(errp, lerr);
     g_free(buf);
 out:
-- 
2.31.1


