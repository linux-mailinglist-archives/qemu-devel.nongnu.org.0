Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DFD50B6A8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:57:26 +0200 (CEST)
Received: from localhost ([::1]:60724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhruf-0007Z3-2O
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqKK-0000Bf-7b
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqKI-0004my-FU
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650622544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UUAiq0z2rzGHnE26rtABqpfZSZSn8iucEsR8c2fwcE=;
 b=DwDcYppH9rt/BsVMuTaFOiYPBogUuQQgp7tCioOLOL8kdhSoMjKtJ/IAaFdY7+zIbdxKfj
 +spmBf9jImhe1c1ApSQLsG4I+Wla9sur1QDlErHHNRG9gIwyiRUJS7rSxlNdaKVRbUNaVF
 kVMJKoD7duQTcqasDFGnhk1l84nfKfc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-ZHoZj5BnPYauWlXy4x3_Sg-1; Fri, 22 Apr 2022 06:15:43 -0400
X-MC-Unique: ZHoZj5BnPYauWlXy4x3_Sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3878738149B1;
 Fri, 22 Apr 2022 10:15:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7C3A40E80F5;
 Fri, 22 Apr 2022 10:15:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/13] dump: Introduce shdr_num to decrease complexity
Date: Fri, 22 Apr 2022 14:15:15 +0400
Message-Id: <20220422101525.3260741-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
References: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
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

Let's move from a boolean to a int variable which will later enable us
to store the number of sections that are in the dump file.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220330123603.107120-4-frankja@linux.ibm.com>
---
 include/sysemu/dump.h |  2 +-
 dump/dump.c           | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index b463fc9c0226..19458bffbd1d 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -155,7 +155,7 @@ typedef struct DumpState {
     ArchDumpInfo dump_info;
     MemoryMappingList list;
     uint32_t phdr_num;
-    bool have_section;
+    uint32_t shdr_num;
     bool resume;
     bool detached;
     ssize_t note_size;
diff --git a/dump/dump.c b/dump/dump.c
index 010b272da038..285ed4475b0d 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -144,12 +144,12 @@ static void write_elf64_header(DumpState *s, Error **errp)
     elf_header.e_phoff = cpu_to_dump64(s, sizeof(Elf64_Ehdr));
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
     elf_header.e_phnum = cpu_to_dump16(s, phnum);
-    if (s->have_section) {
+    if (s->shdr_num) {
         uint64_t shoff = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) * s->phdr_num;
 
         elf_header.e_shoff = cpu_to_dump64(s, shoff);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, 1);
+        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
 
     ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
@@ -181,12 +181,12 @@ static void write_elf32_header(DumpState *s, Error **errp)
     elf_header.e_phoff = cpu_to_dump32(s, sizeof(Elf32_Ehdr));
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
     elf_header.e_phnum = cpu_to_dump16(s, phnum);
-    if (s->have_section) {
+    if (s->shdr_num) {
         uint32_t shoff = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * s->phdr_num;
 
         elf_header.e_shoff = cpu_to_dump32(s, shoff);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, 1);
+        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
 
     ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
@@ -565,7 +565,7 @@ static void dump_begin(DumpState *s, Error **errp)
         }
 
         /* write section to vmcore */
-        if (s->have_section) {
+        if (s->shdr_num) {
             write_elf_section(s, 1, errp);
             if (*errp) {
                 return;
@@ -591,7 +591,7 @@ static void dump_begin(DumpState *s, Error **errp)
         }
 
         /* write section to vmcore */
-        if (s->have_section) {
+        if (s->shdr_num) {
             write_elf_section(s, 0, errp);
             if (*errp) {
                 return;
@@ -1802,11 +1802,11 @@ static void dump_init(DumpState *s, int fd, bool has_format,
      */
     s->phdr_num = 1; /* PT_NOTE */
     if (s->list.num < UINT16_MAX - 2) {
+        s->shdr_num = 0;
         s->phdr_num += s->list.num;
-        s->have_section = false;
     } else {
         /* sh_info of section 0 holds the real number of phdrs */
-        s->have_section = true;
+        s->shdr_num = 1;
 
         /* the type of shdr->sh_info is uint32_t, so we should avoid overflow */
         if (s->list.num <= UINT32_MAX - 1) {
@@ -1817,19 +1817,19 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (s->dump_info.d_class == ELFCLASS64) {
-        if (s->have_section) {
+        if (s->shdr_num) {
             s->memory_offset = sizeof(Elf64_Ehdr) +
                                sizeof(Elf64_Phdr) * s->phdr_num +
-                               sizeof(Elf64_Shdr) + s->note_size;
+                               sizeof(Elf64_Shdr) * s->shdr_num + s->note_size;
         } else {
             s->memory_offset = sizeof(Elf64_Ehdr) +
                                sizeof(Elf64_Phdr) * s->phdr_num + s->note_size;
         }
     } else {
-        if (s->have_section) {
+        if (s->shdr_num) {
             s->memory_offset = sizeof(Elf32_Ehdr) +
                                sizeof(Elf32_Phdr) * s->phdr_num +
-                               sizeof(Elf32_Shdr) + s->note_size;
+                               sizeof(Elf32_Shdr) * s->shdr_num + s->note_size;
         } else {
             s->memory_offset = sizeof(Elf32_Ehdr) +
                                sizeof(Elf32_Phdr) * s->phdr_num + s->note_size;
-- 
2.36.0


