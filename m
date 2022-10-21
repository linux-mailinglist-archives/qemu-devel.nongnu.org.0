Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0A60784F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:24:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ols0I-00082Z-F3
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:24:02 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrjM-0005Qf-UI
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olrit-00050o-Vr
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olris-00081g-DV
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666357561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YB4V5ihMQ6DA/f+0fE4sJLzVdNzD5DFNFZBuoZGA7ts=;
 b=TTwaankBabz5EnxypXy7AJXTrmb/A1LWbuzYgbeO5rpilVuf87RzX41v1U9LGb2W03aPmk
 klfrZnPnto+cmtnRWYS4iG875jgcidgUItGwhBTBL8QauswC46duY10KBajkoYxhTzC/xx
 soMiJECjD/iicpkFNQL8VUXOSk/RFmQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-l8kYLYZoNhCrC-5NC7jVMQ-1; Fri, 21 Oct 2022 09:05:58 -0400
X-MC-Unique: l8kYLYZoNhCrC-5NC7jVMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 139483814940;
 Fri, 21 Oct 2022 13:05:58 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA7102166B33;
 Fri, 21 Oct 2022 13:05:56 +0000 (UTC)
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
Subject: [PULL 01/11] dump: Use a buffer for ELF section data and headers
Date: Fri, 21 Oct 2022 17:05:39 +0400
Message-Id: <20221021130549.111864-2-marcandre.lureau@redhat.com>
In-Reply-To: <20221021130549.111864-1-marcandre.lureau@redhat.com>
References: <20221021130549.111864-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
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

Currently we're writing the NULL section header if we overflow the
physical header number in the ELF header. But in the future we'll add
custom section headers AND section data.

To facilitate this we need to rearange section handling a bit. As with
the other ELF headers we split the code into a prepare and a write
step.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221017083822.43118-2-frankja@linux.ibm.com>
---
 include/sysemu/dump.h |  2 ++
 dump/dump.c           | 75 +++++++++++++++++++++++++++++--------------
 2 files changed, 53 insertions(+), 24 deletions(-)

diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index b62513d87d..9995f65dc8 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -177,6 +177,8 @@ typedef struct DumpState {
     int64_t filter_area_begin;  /* Start address of partial guest memory area */
     int64_t filter_area_length; /* Length of partial guest memory area */
 
+    void *elf_section_hdrs;     /* Pointer to section header buffer */
+
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
     uint32_t nr_cpus;           /* number of guest's cpu */
diff --git a/dump/dump.c b/dump/dump.c
index 236559b03a..e7a3b54ebe 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -380,31 +380,60 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
     }
 }
 
-static void write_elf_section(DumpState *s, int type, Error **errp)
+static void prepare_elf_section_hdr_zero(DumpState *s)
 {
-    Elf32_Shdr shdr32;
-    Elf64_Shdr shdr64;
-    int shdr_size;
-    void *shdr;
-    int ret;
+    if (dump_is_64bit(s)) {
+        Elf64_Shdr *shdr64 = s->elf_section_hdrs;
 
-    if (type == 0) {
-        shdr_size = sizeof(Elf32_Shdr);
-        memset(&shdr32, 0, shdr_size);
-        shdr32.sh_info = cpu_to_dump32(s, s->phdr_num);
-        shdr = &shdr32;
+        shdr64->sh_info = cpu_to_dump32(s, s->phdr_num);
     } else {
-        shdr_size = sizeof(Elf64_Shdr);
-        memset(&shdr64, 0, shdr_size);
-        shdr64.sh_info = cpu_to_dump32(s, s->phdr_num);
-        shdr = &shdr64;
+        Elf32_Shdr *shdr32 = s->elf_section_hdrs;
+
+        shdr32->sh_info = cpu_to_dump32(s, s->phdr_num);
+    }
+}
+
+static void prepare_elf_section_hdrs(DumpState *s)
+{
+    size_t len, sizeof_shdr;
+
+    /*
+     * Section ordering:
+     * - HDR zero
+     */
+    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
+    len = sizeof_shdr * s->shdr_num;
+    s->elf_section_hdrs = g_malloc0(len);
+
+    /*
+     * The first section header is ALWAYS a special initial section
+     * header.
+     *
+     * The header should be 0 with one exception being that if
+     * phdr_num is PN_XNUM then the sh_info field contains the real
+     * number of segment entries.
+     *
+     * As we zero allocate the buffer we will only need to modify
+     * sh_info for the PN_XNUM case.
+     */
+    if (s->phdr_num >= PN_XNUM) {
+        prepare_elf_section_hdr_zero(s);
     }
+}
 
-    ret = fd_write_vmcore(shdr, shdr_size, s);
+static void write_elf_section_headers(DumpState *s, Error **errp)
+{
+    size_t sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
+    int ret;
+
+    prepare_elf_section_hdrs(s);
+
+    ret = fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_shdr, s);
     if (ret < 0) {
-        error_setg_errno(errp, -ret,
-                         "dump: failed to write section header table");
+        error_setg_errno(errp, -ret, "dump: failed to write section headers");
     }
+
+    g_free(s->elf_section_hdrs);
 }
 
 static void write_data(DumpState *s, void *buf, int length, Error **errp)
@@ -591,12 +620,10 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    /* write section to vmcore */
-    if (s->shdr_num) {
-        write_elf_section(s, 1, errp);
-        if (*errp) {
-            return;
-        }
+    /* write section headers to vmcore */
+    write_elf_section_headers(s, errp);
+    if (*errp) {
+        return;
     }
 
     /* write notes to vmcore */
-- 
2.37.3


