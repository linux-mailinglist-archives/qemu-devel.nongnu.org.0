Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D0A697888
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 09:57:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSDbJ-0002Yq-Sb; Wed, 15 Feb 2023 03:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSDbH-0002YM-IH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSDbG-0002A7-2H
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676451433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xxlgeH/sE0AYKJ9NgTnwOtzFYAQfkptFPd4VAfosM7k=;
 b=aNp/ozh+OlUFEvv0FCC/ByhFkLG2hUYDdj9FGDOzAb2xRR/fkZEZzC+u/6ik0QlrA0EYNj
 XfBKZS/6L1/J+e06K3SkPUIEEO+1Q5Vvgxl7KJ90akNIZKYVj15fjU+3jZVNAqjy4BWpMw
 /8L0ZdVZq8jMoSPdByGNZ6ZFU7JSYFI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-_eHnfcVeNxSIwXAKyCfIcw-1; Wed, 15 Feb 2023 03:57:07 -0500
X-MC-Unique: _eHnfcVeNxSIwXAKyCfIcw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9731185A588;
 Wed, 15 Feb 2023 08:57:06 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F9542166B31;
 Wed, 15 Feb 2023 08:57:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2] target/s390x/arch_dump: Simplify memory allocation in
 s390x_write_elf64_notes()
Date: Wed, 15 Feb 2023 09:57:03 +0100
Message-Id: <20230215085703.746788-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We are not on a hot path here, so there is no real need for the logic
here with the split heap and stack space allocation. Simplify it by
always allocating memory from the heap.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Added the missing "prev_size = note_size" (thanks, Janosch!)
 - Use g_free+g_malloc instead of g_realloc to avoid copying old contents

 target/s390x/arch_dump.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index a7c44ba49d..cb98f4894d 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -227,25 +227,25 @@ static int s390x_write_elf64_notes(const char *note_name,
                                        DumpState *s,
                                        const NoteFuncDesc *funcs)
 {
-    Note note, *notep;
+    g_autofree Note *notep = NULL;
     const NoteFuncDesc *nf;
-    int note_size, content_size;
+    int note_size, prev_size = 0, content_size;
     int ret = -1;
 
-    assert(strlen(note_name) < sizeof(note.name));
+    assert(strlen(note_name) < sizeof(notep->name));
 
     for (nf = funcs; nf->note_contents_func; nf++) {
-        notep = &note;
         if (nf->pvonly && !s390_is_pv()) {
             continue;
         }
 
         content_size = nf->note_size_func ? nf->note_size_func() : nf->contents_size;
-        note_size = sizeof(note) - sizeof(notep->contents) + content_size;
+        note_size = sizeof(Note) - sizeof(notep->contents) + content_size;
 
-        /* Notes with dynamic sizes need to allocate a note */
-        if (nf->note_size_func) {
+        if (prev_size < note_size) {
+            g_free(notep);
             notep = g_malloc(note_size);
+            prev_size = note_size;
         }
 
         memset(notep, 0, note_size);
@@ -258,15 +258,9 @@ static int s390x_write_elf64_notes(const char *note_name,
         /* Get contents and write them out */
         (*nf->note_contents_func)(notep, cpu, id);
         ret = f(notep, note_size, s);
-
-        if (nf->note_size_func) {
-            g_free(notep);
-        }
-
         if (ret < 0) {
             return -1;
         }
-
     }
 
     return 0;
-- 
2.31.1


