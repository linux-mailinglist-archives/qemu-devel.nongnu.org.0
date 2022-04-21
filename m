Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C350A04A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:03:48 +0200 (CEST)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWTL-00047B-SA
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWFG-00062X-Mq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:49:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWFA-0003Cl-2f
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650545347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7q2ZojsWb6MPNtEYkkXAHCp9m3DjxVas1XeXU2+is9U=;
 b=Rq87RSzc+5BuFvND7i6z0skMwGtgJsnpEHlvlV5MgxDSAMQln2aUqZD2bovG4DSTrLHiYQ
 ssv4/GVWnGLOMdWOS5Tj7VA11dPP6d3+EccNNpuR47FooiPElpwrclFtch7AqmSwKIRN5U
 CBGRXfna/ftT7TBujQYXVbCPUaKIKdo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-rzjrJsFjP-uLmu4prQ0Ahw-1; Thu, 21 Apr 2022 08:49:04 -0400
X-MC-Unique: rzjrJsFjP-uLmu4prQ0Ahw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8E7A3C0F09A;
 Thu, 21 Apr 2022 12:49:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72202C28139;
 Thu, 21 Apr 2022 12:49:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] dump: Add more offset variables
Date: Thu, 21 Apr 2022 16:48:27 +0400
Message-Id: <20220421124835.2831856-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
References: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Offset calculations are easy enough to get wrong. Let's add a few
variables to make moving around elf headers and data sections easier.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220330123603.107120-6-frankja@linux.ibm.com>
---
 include/sysemu/dump.h |  4 ++++
 dump/dump.c           | 35 +++++++++++++++--------------------
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 19458bffbd1d..ffc2ea1072f3 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -159,6 +159,10 @@ typedef struct DumpState {
     bool resume;
     bool detached;
     ssize_t note_size;
+    hwaddr shdr_offset;
+    hwaddr phdr_offset;
+    hwaddr section_offset;
+    hwaddr note_offset;
     hwaddr memory_offset;
     int fd;
 
diff --git a/dump/dump.c b/dump/dump.c
index 9c80680eb2a4..7f226257eec3 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -141,13 +141,11 @@ static void write_elf64_header(DumpState *s, Error **errp)
     elf_header.e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
     elf_header.e_version = cpu_to_dump32(s, EV_CURRENT);
     elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
-    elf_header.e_phoff = cpu_to_dump64(s, sizeof(Elf64_Ehdr));
+    elf_header.e_phoff = cpu_to_dump64(s, s->phdr_offset);
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
     elf_header.e_phnum = cpu_to_dump16(s, phnum);
     if (s->shdr_num) {
-        uint64_t shoff = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) * s->phdr_num;
-
-        elf_header.e_shoff = cpu_to_dump64(s, shoff);
+        elf_header.e_shoff = cpu_to_dump64(s, s->shdr_offset);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
         elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
@@ -178,13 +176,11 @@ static void write_elf32_header(DumpState *s, Error **errp)
     elf_header.e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
     elf_header.e_version = cpu_to_dump32(s, EV_CURRENT);
     elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
-    elf_header.e_phoff = cpu_to_dump32(s, sizeof(Elf32_Ehdr));
+    elf_header.e_phoff = cpu_to_dump32(s, s->phdr_offset);
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
     elf_header.e_phnum = cpu_to_dump16(s, phnum);
     if (s->shdr_num) {
-        uint32_t shoff = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * s->phdr_num;
-
-        elf_header.e_shoff = cpu_to_dump32(s, shoff);
+        elf_header.e_shoff = cpu_to_dump32(s, s->shdr_offset);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
         elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
@@ -247,12 +243,11 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
 static void write_elf64_note(DumpState *s, Error **errp)
 {
     Elf64_Phdr phdr;
-    hwaddr begin = s->memory_offset - s->note_size;
     int ret;
 
     memset(&phdr, 0, sizeof(Elf64_Phdr));
     phdr.p_type = cpu_to_dump32(s, PT_NOTE);
-    phdr.p_offset = cpu_to_dump64(s, begin);
+    phdr.p_offset = cpu_to_dump64(s, s->note_offset);
     phdr.p_paddr = 0;
     phdr.p_filesz = cpu_to_dump64(s, s->note_size);
     phdr.p_memsz = cpu_to_dump64(s, s->note_size);
@@ -312,13 +307,12 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
 
 static void write_elf32_note(DumpState *s, Error **errp)
 {
-    hwaddr begin = s->memory_offset - s->note_size;
     Elf32_Phdr phdr;
     int ret;
 
     memset(&phdr, 0, sizeof(Elf32_Phdr));
     phdr.p_type = cpu_to_dump32(s, PT_NOTE);
-    phdr.p_offset = cpu_to_dump32(s, begin);
+    phdr.p_offset = cpu_to_dump32(s, s->note_offset);
     phdr.p_paddr = 0;
     phdr.p_filesz = cpu_to_dump32(s, s->note_size);
     phdr.p_memsz = cpu_to_dump32(s, s->note_size);
@@ -1817,15 +1811,16 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (s->dump_info.d_class == ELFCLASS64) {
-        s->memory_offset = sizeof(Elf64_Ehdr) +
-                           sizeof(Elf64_Phdr) * s->phdr_num +
-                           sizeof(Elf64_Shdr) * s->shdr_num +
-                           s->note_size;
+        s->phdr_offset = sizeof(Elf64_Ehdr);
+        s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
+        s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
+        s->memory_offset = s->note_offset + s->note_size;
     } else {
-        s->memory_offset = sizeof(Elf32_Ehdr) +
-                           sizeof(Elf32_Phdr) * s->phdr_num +
-                           sizeof(Elf32_Shdr) * s->shdr_num +
-                           s->note_size;
+
+        s->phdr_offset = sizeof(Elf32_Ehdr);
+        s->shdr_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
+        s->note_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
+        s->memory_offset = s->note_offset + s->note_size;
     }
 
     return;
-- 
2.35.1.693.g805e0a68082a


