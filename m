Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819C50A014
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:54:05 +0200 (CEST)
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWJw-0004HK-AX
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWFQ-0006Ay-RB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWFO-0003Du-Vd
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650545362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjWGG3jJnZd54nKHLmFWdLCrVUOJWYv9LFLL4AOD8Qo=;
 b=OjUVF016MovXeKpjIHteRIjLDoEPTB8L9LD3jbKp0cGbzrrtT1JpvoWSbevsXZALSmBbjL
 615scN0IJWM+yB5ZDdKFc7kfSZ6G2fHt7HLcXN/Sr3dXLa5678x4EvyrMyzanHQtT2K1bl
 NjOz/PGNvEyF/BCNuHOed8Y7ddy5/jY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-ZD-IaIeMPl2JQMvrwcXqfA-1; Thu, 21 Apr 2022 08:49:13 -0400
X-MC-Unique: ZD-IaIeMPl2JQMvrwcXqfA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B5C186B8A0;
 Thu, 21 Apr 2022 12:49:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0B064C4798;
 Thu, 21 Apr 2022 12:49:11 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] dump: Consolidate phdr note writes
Date: Thu, 21 Apr 2022 16:48:29 +0400
Message-Id: <20220421124835.2831856-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
References: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 viktor.prutyanov@redhat.com, richard.henderson@linaro.org,
 frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janosch Frank <frankja@linux.ibm.com>

There's no need to have two write functions. Let's rather have two
functions that set the data for elf 32/64 and then write it in a
common function.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220330123603.107120-8-frankja@linux.ibm.com>
---
 dump/dump.c | 94 +++++++++++++++++++++++++++--------------------------
 1 file changed, 48 insertions(+), 46 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index b063db134021..0d95fc5b7a3c 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -245,24 +245,15 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
     }
 }
 
-static void write_elf64_note(DumpState *s, Error **errp)
+static void write_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
 {
-    Elf64_Phdr phdr;
-    int ret;
-
-    memset(&phdr, 0, sizeof(Elf64_Phdr));
-    phdr.p_type = cpu_to_dump32(s, PT_NOTE);
-    phdr.p_offset = cpu_to_dump64(s, s->note_offset);
-    phdr.p_paddr = 0;
-    phdr.p_filesz = cpu_to_dump64(s, s->note_size);
-    phdr.p_memsz = cpu_to_dump64(s, s->note_size);
-    phdr.p_vaddr = 0;
-
-    ret = fd_write_vmcore(&phdr, sizeof(Elf64_Phdr), s);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret,
-                         "dump: failed to write program header table");
-    }
+    memset(phdr, 0, sizeof(*phdr));
+    phdr->p_type = cpu_to_dump32(s, PT_NOTE);
+    phdr->p_offset = cpu_to_dump64(s, s->note_offset);
+    phdr->p_paddr = 0;
+    phdr->p_filesz = cpu_to_dump64(s, s->note_size);
+    phdr->p_memsz = cpu_to_dump64(s, s->note_size);
+    phdr->p_vaddr = 0;
 }
 
 static inline int cpu_index(CPUState *cpu)
@@ -310,24 +301,15 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
     write_guest_note(f, s, errp);
 }
 
-static void write_elf32_note(DumpState *s, Error **errp)
+static void write_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
 {
-    Elf32_Phdr phdr;
-    int ret;
-
-    memset(&phdr, 0, sizeof(Elf32_Phdr));
-    phdr.p_type = cpu_to_dump32(s, PT_NOTE);
-    phdr.p_offset = cpu_to_dump32(s, s->note_offset);
-    phdr.p_paddr = 0;
-    phdr.p_filesz = cpu_to_dump32(s, s->note_size);
-    phdr.p_memsz = cpu_to_dump32(s, s->note_size);
-    phdr.p_vaddr = 0;
-
-    ret = fd_write_vmcore(&phdr, sizeof(Elf32_Phdr), s);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret,
-                         "dump: failed to write program header table");
-    }
+    memset(phdr, 0, sizeof(*phdr));
+    phdr->p_type = cpu_to_dump32(s, PT_NOTE);
+    phdr->p_offset = cpu_to_dump32(s, s->note_offset);
+    phdr->p_paddr = 0;
+    phdr->p_filesz = cpu_to_dump32(s, s->note_size);
+    phdr->p_memsz = cpu_to_dump32(s, s->note_size);
+    phdr->p_vaddr = 0;
 }
 
 static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
@@ -357,6 +339,32 @@ static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
     write_guest_note(f, s, errp);
 }
 
+static void write_elf_phdr_note(DumpState *s, Error **errp)
+{
+    ERRP_GUARD();
+    Elf32_Phdr phdr32;
+    Elf64_Phdr phdr64;
+    void *phdr;
+    size_t size;
+    int ret;
+
+    if (dump_is_64bit(s)) {
+        write_elf64_phdr_note(s, &phdr64);
+        size = sizeof(phdr64);
+        phdr = &phdr64;
+    } else {
+        write_elf32_phdr_note(s, &phdr32);
+        size = sizeof(phdr32);
+        phdr = &phdr32;
+    }
+
+    ret = fd_write_vmcore(phdr, size, s);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret,
+                         "dump: failed to write program header table");
+    }
+}
+
 static void write_elf_section(DumpState *s, int type, Error **errp)
 {
     Elf32_Shdr shdr32;
@@ -550,13 +558,13 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    if (dump_is_64bit(s)) {
-        /* write PT_NOTE to vmcore */
-        write_elf64_note(s, errp);
-        if (*errp) {
-            return;
-        }
+    /* write PT_NOTE to vmcore */
+    write_elf_phdr_note(s, errp);
+    if (*errp) {
+        return;
+    }
 
+    if (dump_is_64bit(s)) {
         /* write all PT_LOAD to vmcore */
         write_elf_loads(s, errp);
         if (*errp) {
@@ -577,12 +585,6 @@ static void dump_begin(DumpState *s, Error **errp)
             return;
         }
     } else {
-        /* write PT_NOTE to vmcore */
-        write_elf32_note(s, errp);
-        if (*errp) {
-            return;
-        }
-
         /* write all PT_LOAD to vmcore */
         write_elf_loads(s, errp);
         if (*errp) {
-- 
2.35.1.693.g805e0a68082a


