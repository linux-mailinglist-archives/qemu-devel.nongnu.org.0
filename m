Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138246A40D3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:39:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWboD-0005X0-B4; Mon, 27 Feb 2023 06:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboA-0005VQ-LU
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo7-0005fV-Oi
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HG6jRm/qjM4kk0nXdEquLhIJKaa+w72K1oXuqkJeUs=;
 b=ejMiRkssB5/D0WQRXp/eD2HVhjtbsQPfgNs0kmFXNdhpVIFg6cwlZgTCaLd7IqPI1peD6p
 qPP4jR6MV1iNuZbf96EnPFuqdnTHc0UxwIMQFY22gM9rQbHZ7vE03CPYSXCVrpUL2m4wof
 5wKlpkt+tR6rSciAjJDJldpuOhL3Xps=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-Ijyemj6eMXWI0NfPLGK2fw-1; Mon, 27 Feb 2023 06:36:34 -0500
X-MC-Unique: Ijyemj6eMXWI0NfPLGK2fw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 691803815EE3;
 Mon, 27 Feb 2023 11:36:34 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A72901121314;
 Mon, 27 Feb 2023 11:36:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/33] target/s390x/arch_dump: Simplify memory allocation in
 s390x_write_elf64_notes()
Date: Mon, 27 Feb 2023 12:35:57 +0100
Message-Id: <20230227113621.58468-10-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215085703.746788-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
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


