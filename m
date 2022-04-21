Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068050A055
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:06:30 +0200 (CEST)
Received: from localhost ([::1]:51758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWVx-0007Bz-3P
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWFI-00063X-9x
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:49:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWFE-0003D8-V5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650545352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2qIBwHU1fE5q5I3ZlvdRIeHhKhbLDsoo5b43RL7DQ4=;
 b=QzTBLslTBedsoACxtA8O5Tk4bVZnErEIyT7nfAIbZf3kVMielU4Y5jeKbuwNqCB139HccS
 39uzlNIglN5g3ZghV61LMY7K/AC+ZhdEn2MQlIxW/QUdBbPLVbM8jpFt/re/zGYDjAHynN
 /ZTs27gJt0EHim6Qbxw+FKjPAcFg40o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-m1nDAFP3Ng21QNWLmGs6Yw-1; Thu, 21 Apr 2022 08:49:08 -0400
X-MC-Unique: m1nDAFP3Ng21QNWLmGs6Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 975D71C0E0E1;
 Thu, 21 Apr 2022 12:49:08 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E401C28131;
 Thu, 21 Apr 2022 12:49:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] dump: Introduce dump_is_64bit() helper function
Date: Thu, 21 Apr 2022 16:48:28 +0400
Message-Id: <20220421124835.2831856-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
References: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

Checking d_class in dump_info leads to lengthy conditionals so let's
shorten things a bit by introducing a helper function.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220330123603.107120-7-frankja@linux.ibm.com>
---
 dump/dump.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 7f226257eec3..b063db134021 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -54,6 +54,11 @@ static Error *dump_migration_blocker;
       DIV_ROUND_UP((name_size), 4) +                    \
       DIV_ROUND_UP((desc_size), 4)) * 4)
 
+static inline bool dump_is_64bit(DumpState *s)
+{
+    return s->dump_info.d_class == ELFCLASS64;
+}
+
 uint16_t cpu_to_dump16(DumpState *s, uint16_t val)
 {
     if (s->dump_info.d_endian == ELFDATA2LSB) {
@@ -488,7 +493,7 @@ static void write_elf_loads(DumpState *s, Error **errp)
         get_offset_range(memory_mapping->phys_addr,
                          memory_mapping->length,
                          s, &offset, &filesz);
-        if (s->dump_info.d_class == ELFCLASS64) {
+        if (dump_is_64bit(s)) {
             write_elf64_load(s, memory_mapping, phdr_index++, offset,
                              filesz, errp);
         } else {
@@ -536,7 +541,7 @@ static void dump_begin(DumpState *s, Error **errp)
      */
 
     /* write elf header to vmcore */
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         write_elf64_header(s, errp);
     } else {
         write_elf32_header(s, errp);
@@ -545,7 +550,7 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         /* write PT_NOTE to vmcore */
         write_elf64_note(s, errp);
         if (*errp) {
@@ -756,7 +761,7 @@ static void get_note_sizes(DumpState *s, const void *note,
     uint64_t name_sz;
     uint64_t desc_sz;
 
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         const Elf64_Nhdr *hdr = note;
         note_head_sz = sizeof(Elf64_Nhdr);
         name_sz = tswap64(hdr->n_namesz);
@@ -1016,10 +1021,10 @@ out:
 
 static void write_dump_header(DumpState *s, Error **errp)
 {
-    if (s->dump_info.d_class == ELFCLASS32) {
-        create_header32(s, errp);
-    } else {
+    if (dump_is_64bit(s)) {
         create_header64(s, errp);
+    } else {
+        create_header32(s, errp);
     }
 }
 
@@ -1706,8 +1711,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         uint32_t size;
         uint16_t format;
 
-        note_head_size = s->dump_info.d_class == ELFCLASS32 ?
-            sizeof(Elf32_Nhdr) : sizeof(Elf64_Nhdr);
+        note_head_size = dump_is_64bit(s) ?
+            sizeof(Elf64_Nhdr) : sizeof(Elf32_Nhdr);
 
         format = le16_to_cpu(vmci->vmcoreinfo.guest_format);
         size = le32_to_cpu(vmci->vmcoreinfo.size);
@@ -1810,7 +1815,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         }
     }
 
-    if (s->dump_info.d_class == ELFCLASS64) {
+    if (dump_is_64bit(s)) {
         s->phdr_offset = sizeof(Elf64_Ehdr);
         s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
         s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
-- 
2.35.1.693.g805e0a68082a


