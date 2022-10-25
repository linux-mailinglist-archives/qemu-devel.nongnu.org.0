Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC1660C6F8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:53:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFQ3-0001BR-0P; Tue, 25 Oct 2022 04:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1onEhf-0003Gm-Ke
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:50:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1onEhc-0005Ux-IM
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666684223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51si67oMLHfMigUNv16V9jLVZNglhcVFQhgyfCf3TyU=;
 b=R6w1JZzJtE0PEXwvkt8tM9vq6CspvnTdkkflPJ6wEwBu9nFQEwe++OhhG3Kk/dwXoWJgoC
 wT+BK4VoySeSozYJ8avNjI/NEEMOn8lGD5lf5BCYJ4pX7zKsYKRZID3FXPQ59lxM6Oopgs
 AJYOiasSPfs5Boqy8ag8jWIdgoIfQVo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-TAxe2ATXN8OR6zCq3DTo_w-1; Tue, 25 Oct 2022 03:50:20 -0400
X-MC-Unique: TAxe2ATXN8OR6zCq3DTo_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D62A1381796B;
 Tue, 25 Oct 2022 07:50:19 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7D6A17582;
 Tue, 25 Oct 2022 07:50:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
Subject: [PULL v2 02/11] dump: Write ELF section headers right after ELF header
Date: Tue, 25 Oct 2022 11:49:54 +0400
Message-Id: <20221025075003.18161-3-marcandre.lureau@redhat.com>
In-Reply-To: <20221025075003.18161-1-marcandre.lureau@redhat.com>
References: <20221025075003.18161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Janosch Frank <frankja@linux.ibm.com>

Let's start bundling the writes of the headers and of the data so we
have a clear ordering between them. Since the ELF header uses offsets
to the headers we can freely order them.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221017083822.43118-3-frankja@linux.ibm.com>
---
 dump/dump.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index e7a3b54ebe..b168a25321 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -583,6 +583,8 @@ static void dump_begin(DumpState *s, Error **errp)
      *   --------------
      *   |  elf header |
      *   --------------
+     *   |  sctn_hdr   |
+     *   --------------
      *   |  PT_NOTE    |
      *   --------------
      *   |  PT_LOAD    |
@@ -591,8 +593,6 @@ static void dump_begin(DumpState *s, Error **errp)
      *   --------------
      *   |  PT_LOAD    |
      *   --------------
-     *   |  sec_hdr    |
-     *   --------------
      *   |  elf note   |
      *   --------------
      *   |  memory     |
@@ -608,20 +608,20 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    /* write PT_NOTE to vmcore */
-    write_elf_phdr_note(s, errp);
+    /* write section headers to vmcore */
+    write_elf_section_headers(s, errp);
     if (*errp) {
         return;
     }
 
-    /* write all PT_LOADs to vmcore */
-    write_elf_phdr_loads(s, errp);
+    /* write PT_NOTE to vmcore */
+    write_elf_phdr_note(s, errp);
     if (*errp) {
         return;
     }
 
-    /* write section headers to vmcore */
-    write_elf_section_headers(s, errp);
+    /* write all PT_LOADs to vmcore */
+    write_elf_phdr_loads(s, errp);
     if (*errp) {
         return;
     }
@@ -1868,16 +1868,13 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (dump_is_64bit(s)) {
-        s->phdr_offset = sizeof(Elf64_Ehdr);
-        s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
-        s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
-        s->memory_offset = s->note_offset + s->note_size;
+        s->shdr_offset = sizeof(Elf64_Ehdr);
+        s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
+        s->note_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
     } else {
-
-        s->phdr_offset = sizeof(Elf32_Ehdr);
-        s->shdr_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
-        s->note_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
-        s->memory_offset = s->note_offset + s->note_size;
+        s->shdr_offset = sizeof(Elf32_Ehdr);
+        s->phdr_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
+        s->note_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
     }
 
     return;
-- 
2.37.3


