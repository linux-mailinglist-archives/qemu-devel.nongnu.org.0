Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39A9607861
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:27:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ols3k-0007Up-Ic
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:27:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrjP-0005U6-A2
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olrjC-00052p-Nv
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olrjA-000846-HZ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666357579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HG7g3uvc3zS6AQkb3eDYkOWEDXLlGZqks/JPekIlw8=;
 b=bxcNKake/ZdMXeObh935EI7pjPh1jiO8nR8EkC1GDtm+fX/J3BFMZqKHAciJ5+ZuWe4kj9
 b5/oQS7Tv0pbQiwB7ArUouqqfZwabZDd21oNsYmq3SCJPHgeWKjQMQIQgvnyofUfMrh70r
 9OFI0pbgAaV+5I/wjDAxn3VHCac7xxU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-8xUal1N0NomKHW6Y9pNyVQ-1; Fri, 21 Oct 2022 09:06:16 -0400
X-MC-Unique: 8xUal1N0NomKHW6Y9pNyVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BCF5858282;
 Fri, 21 Oct 2022 13:06:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89BED40CA41F;
 Fri, 21 Oct 2022 13:06:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PULL 05/11] dump: Add architecture section and section string table
 support
Date: Fri, 21 Oct 2022 17:05:43 +0400
Message-Id: <20221021130549.111864-6-marcandre.lureau@redhat.com>
In-Reply-To: <20221021130549.111864-1-marcandre.lureau@redhat.com>
References: <20221021130549.111864-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janosch Frank <frankja@linux.ibm.com>

Add hooks which architectures can use to add arbitrary data to custom
sections.

Also add a section name string table in order to identify section
contents

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221017113210.41674-1-frankja@linux.ibm.com>
---
 include/sysemu/dump-arch.h |   3 +
 include/sysemu/dump.h      |   3 +
 dump/dump.c                | 186 +++++++++++++++++++++++++++++++------
 3 files changed, 166 insertions(+), 26 deletions(-)

diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h
index e25b02e990..59bbc9be38 100644
--- a/include/sysemu/dump-arch.h
+++ b/include/sysemu/dump-arch.h
@@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {
     uint32_t page_size;      /* The target's page size. If it's variable and
                               * unknown, then this should be the maximum. */
     uint64_t phys_base;      /* The target's physmem base. */
+    void (*arch_sections_add_fn)(DumpState *s);
+    uint64_t (*arch_sections_write_hdr_fn)(DumpState *s, uint8_t *buff);
+    int (*arch_sections_write_fn)(DumpState *s, uint8_t *buff);
 } ArchDumpInfo;
 
 struct GuestPhysBlockList; /* memory_mapping.h */
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 9ed811b313..38ccac7190 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -180,6 +180,9 @@ typedef struct DumpState {
     hwaddr note_offset;
 
     void *elf_section_hdrs;     /* Pointer to section header buffer */
+    void *elf_section_data;     /* Pointer to section data buffer */
+    uint64_t elf_section_data_size; /* Size of section data */
+    GArray *string_table_buf;   /* String table data buffer */
 
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
diff --git a/dump/dump.c b/dump/dump.c
index 626f7b2fd0..9428d1fde9 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -103,6 +103,7 @@ static int dump_cleanup(DumpState *s)
     memory_mapping_list_free(&s->list);
     close(s->fd);
     g_free(s->guest_note);
+    g_array_unref(s->string_table_buf);
     s->guest_note = NULL;
     if (s->resume) {
         if (s->detached) {
@@ -152,11 +153,10 @@ static void prepare_elf64_header(DumpState *s, Elf64_Ehdr *elf_header)
     elf_header->e_phoff = cpu_to_dump64(s, s->phdr_offset);
     elf_header->e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
     elf_header->e_phnum = cpu_to_dump16(s, phnum);
-    if (s->shdr_num) {
-        elf_header->e_shoff = cpu_to_dump64(s, s->shdr_offset);
-        elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
-        elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
-    }
+    elf_header->e_shoff = cpu_to_dump64(s, s->shdr_offset);
+    elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
+    elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
+    elf_header->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
 }
 
 static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header)
@@ -180,11 +180,10 @@ static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header)
     elf_header->e_phoff = cpu_to_dump32(s, s->phdr_offset);
     elf_header->e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
     elf_header->e_phnum = cpu_to_dump16(s, phnum);
-    if (s->shdr_num) {
-        elf_header->e_shoff = cpu_to_dump32(s, s->shdr_offset);
-        elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
-        elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
-    }
+    elf_header->e_shoff = cpu_to_dump32(s, s->shdr_offset);
+    elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
+    elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
+    elf_header->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
 }
 
 static void write_elf_header(DumpState *s, Error **errp)
@@ -195,6 +194,8 @@ static void write_elf_header(DumpState *s, Error **errp)
     void *header_ptr;
     int ret;
 
+    /* The NULL header and the shstrtab are always defined */
+    assert(s->shdr_num >= 2);
     if (dump_is_64bit(s)) {
         prepare_elf64_header(s, &elf64_header);
         header_size = sizeof(elf64_header);
@@ -393,17 +394,49 @@ static void prepare_elf_section_hdr_zero(DumpState *s)
     }
 }
 
-static void prepare_elf_section_hdrs(DumpState *s)
+static void prepare_elf_section_hdr_string(DumpState *s, void *buff)
+{
+    uint64_t index = s->string_table_buf->len;
+    const char strtab[] = ".shstrtab";
+    Elf32_Shdr shdr32 = {};
+    Elf64_Shdr shdr64 = {};
+    int shdr_size;
+    void *shdr;
+
+    g_array_append_vals(s->string_table_buf, strtab, sizeof(strtab));
+    if (dump_is_64bit(s)) {
+        shdr_size = sizeof(Elf64_Shdr);
+        shdr64.sh_type = SHT_STRTAB;
+        shdr64.sh_offset = s->section_offset + s->elf_section_data_size;
+        shdr64.sh_name = index;
+        shdr64.sh_size = s->string_table_buf->len;
+        shdr = &shdr64;
+    } else {
+        shdr_size = sizeof(Elf32_Shdr);
+        shdr32.sh_type = SHT_STRTAB;
+        shdr32.sh_offset = s->section_offset + s->elf_section_data_size;
+        shdr32.sh_name = index;
+        shdr32.sh_size = s->string_table_buf->len;
+        shdr = &shdr32;
+    }
+    memcpy(buff, shdr, shdr_size);
+}
+
+static bool prepare_elf_section_hdrs(DumpState *s, Error **errp)
 {
     size_t len, sizeof_shdr;
+    void *buff_hdr;
 
     /*
      * Section ordering:
      * - HDR zero
+     * - Arch section hdrs
+     * - String table hdr
      */
     sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
     len = sizeof_shdr * s->shdr_num;
     s->elf_section_hdrs = g_malloc0(len);
+    buff_hdr = s->elf_section_hdrs;
 
     /*
      * The first section header is ALWAYS a special initial section
@@ -419,6 +452,26 @@ static void prepare_elf_section_hdrs(DumpState *s)
     if (s->phdr_num >= PN_XNUM) {
         prepare_elf_section_hdr_zero(s);
     }
+    buff_hdr += sizeof_shdr;
+
+    /* Add architecture defined section headers */
+    if (s->dump_info.arch_sections_write_hdr_fn
+        && s->shdr_num > 2) {
+        buff_hdr += s->dump_info.arch_sections_write_hdr_fn(s, buff_hdr);
+
+        if (s->shdr_num >= SHN_LORESERVE) {
+            error_setg_errno(errp, EINVAL,
+                             "dump: too many architecture defined sections");
+            return false;
+        }
+    }
+
+    /*
+     * String table is the last section since strings are added via
+     * arch_sections_write_hdr().
+     */
+    prepare_elf_section_hdr_string(s, buff_hdr);
+    return true;
 }
 
 static void write_elf_section_headers(DumpState *s, Error **errp)
@@ -426,7 +479,9 @@ static void write_elf_section_headers(DumpState *s, Error **errp)
     size_t sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
     int ret;
 
-    prepare_elf_section_hdrs(s);
+    if (!prepare_elf_section_hdrs(s, errp)) {
+        return;
+    }
 
     ret = fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_shdr, s);
     if (ret < 0) {
@@ -436,6 +491,29 @@ static void write_elf_section_headers(DumpState *s, Error **errp)
     g_free(s->elf_section_hdrs);
 }
 
+static void write_elf_sections(DumpState *s, Error **errp)
+{
+    int ret;
+
+    if (s->elf_section_data_size) {
+        /* Write architecture section data */
+        ret = fd_write_vmcore(s->elf_section_data,
+                              s->elf_section_data_size, s);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "dump: failed to write architecture section data");
+            return;
+        }
+    }
+
+    /* Write string table */
+    ret = fd_write_vmcore(s->string_table_buf->data,
+                          s->string_table_buf->len, s);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "dump: failed to write string table data");
+    }
+}
+
 static void write_data(DumpState *s, void *buf, int length, Error **errp)
 {
     int ret;
@@ -692,6 +770,31 @@ static void dump_iterate(DumpState *s, Error **errp)
     }
 }
 
+static void dump_end(DumpState *s, Error **errp)
+{
+    int rc;
+    ERRP_GUARD();
+
+    if (s->elf_section_data_size) {
+        s->elf_section_data = g_malloc0(s->elf_section_data_size);
+    }
+
+    /* Adds the architecture defined section data to s->elf_section_data  */
+    if (s->dump_info.arch_sections_write_fn &&
+        s->elf_section_data_size) {
+        rc = s->dump_info.arch_sections_write_fn(s, s->elf_section_data);
+        if (rc) {
+            error_setg_errno(errp, rc,
+                             "dump: failed to get arch section data");
+            g_free(s->elf_section_data);
+            return;
+        }
+    }
+
+    /* write sections to vmcore */
+    write_elf_sections(s, errp);
+}
+
 static void create_vmcore(DumpState *s, Error **errp)
 {
     ERRP_GUARD();
@@ -701,7 +804,14 @@ static void create_vmcore(DumpState *s, Error **errp)
         return;
     }
 
+    /* Iterate over memory and dump it to file */
     dump_iterate(s, errp);
+    if (*errp) {
+        return;
+    }
+
+    /* Write the section data */
+    dump_end(s, errp);
 }
 
 static int write_start_flat_header(int fd)
@@ -1711,6 +1821,14 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     s->filter_area_begin = begin;
     s->filter_area_length = length;
 
+    /* First index is 0, it's the special null name */
+    s->string_table_buf = g_array_new(FALSE, TRUE, 1);
+    /*
+     * Allocate the null name, due to the clearing option set to true
+     * it will be 0.
+     */
+    g_array_set_size(s->string_table_buf, 1);
+
     memory_mapping_list_init(&s->list);
 
     guest_phys_blocks_init(&s->guest_phys_blocks);
@@ -1847,26 +1965,42 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     /*
-     * calculate phdr_num
+     * The first section header is always a special one in which most
+     * fields are 0. The section header string table is also always
+     * set.
+     */
+    s->shdr_num = 2;
+
+    /*
+     * Adds the number of architecture sections to shdr_num and sets
+     * elf_section_data_size so we know the offsets and sizes of all
+     * parts.
+     */
+    if (s->dump_info.arch_sections_add_fn) {
+        s->dump_info.arch_sections_add_fn(s);
+    }
+
+    /*
+     * calculate shdr_num so we know the offsets and sizes of all
+     * parts.
+     * Calculate phdr_num
      *
-     * the type of ehdr->e_phnum is uint16_t, so we should avoid overflow
+     * The absolute maximum amount of phdrs is UINT32_MAX - 1 as
+     * sh_info is 32 bit. There's special handling once we go over
+     * UINT16_MAX - 1 but that is handled in the ehdr and section
+     * code.
      */
-    s->phdr_num = 1; /* PT_NOTE */
-    if (s->list.num < UINT16_MAX - 2) {
-        s->shdr_num = 0;
+    s->phdr_num = 1; /* Reserve PT_NOTE */
+    if (s->list.num <= UINT32_MAX - 1) {
         s->phdr_num += s->list.num;
     } else {
-        /* sh_info of section 0 holds the real number of phdrs */
-        s->shdr_num = 1;
-
-        /* the type of shdr->sh_info is uint32_t, so we should avoid overflow */
-        if (s->list.num <= UINT32_MAX - 1) {
-            s->phdr_num += s->list.num;
-        } else {
-            s->phdr_num = UINT32_MAX;
-        }
+        s->phdr_num = UINT32_MAX;
     }
 
+    /*
+     * Now that the number of section and program headers is known we
+     * can calculate the offsets of the headers and data.
+     */
     if (dump_is_64bit(s)) {
         s->shdr_offset = sizeof(Elf64_Ehdr);
         s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
-- 
2.37.3


