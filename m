Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B178752E802
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 10:48:41 +0200 (CEST)
Received: from localhost ([::1]:54012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nryJM-0006ye-Fd
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 04:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nryEk-0004vw-GS
 for qemu-devel@nongnu.org; Fri, 20 May 2022 04:43:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nryEh-0000i7-7O
 for qemu-devel@nongnu.org; Fri, 20 May 2022 04:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653036229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=OdfWNUU4rViQE19uIE1Yq8k5pd9hXy64x2hW4nbOfiA=;
 b=cd7FS+fYpGdCEq7WxskxpZKRG8qBrKcWdoHN2wd2gbLqafbV/wqiKTt6AcNq0msZVH9/rf
 rzJrJcGQ6odTXuXSO5glXdtUVQHlnc9n0YtTxbxKjOwYJhGMY9Jd5+DZWw0QtET9HWmaBX
 LTDiUaWJRwlogOyMxZYi8+XjNbV/WKY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-YuvesKmvNMyB6gEoKUrtlQ-1; Fri, 20 May 2022 04:43:43 -0400
X-MC-Unique: YuvesKmvNMyB6gEoKUrtlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21CFB38349A1;
 Fri, 20 May 2022 08:43:43 +0000 (UTC)
Received: from vp-pc.redhat.com (unknown [10.40.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B1FE1121314;
 Fri, 20 May 2022 08:43:41 +0000 (UTC)
From: Viktor Prutyanov <viktor.prutyanov@redhat.com>
To: richard.henderson@linaro.org, thuth@redhat.com, pbonzini@redhat.com,
 f4bug@amsat.org, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	yan@daynix.com,
	viktor.prutyanov@phystech.edu
Subject: [PATCH v2] contrib/elf2dmp: add ELF dump header checking
Date: Fri, 20 May 2022 11:43:39 +0300
Message-Id: <20220520084339.171684-1-viktor.prutyanov@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=viktor.prutyanov@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add ELF header checking to prevent processing input file which is not
QEMU x86_64 guest memory dump or even not ELF.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1013

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
---
 contrib/elf2dmp/qemu_elf.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/contrib/elf2dmp/qemu_elf.c b/contrib/elf2dmp/qemu_elf.c
index b601b6d7ba..ebda60dcb8 100644
--- a/contrib/elf2dmp/qemu_elf.c
+++ b/contrib/elf2dmp/qemu_elf.c
@@ -118,6 +118,53 @@ static void exit_states(QEMU_Elf *qe)
     free(qe->state);
 }
 
+static bool check_ehdr(QEMU_Elf *qe)
+{
+    Elf64_Ehdr *ehdr = qe->map;
+
+    if (sizeof(Elf64_Ehdr) > qe->size) {
+        eprintf("Invalid input dump file size\n");
+        return false;
+    }
+
+    if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
+        eprintf("Invalid ELF signature, input file is not ELF\n");
+        return false;
+    }
+
+    if (ehdr->e_ident[EI_CLASS] != ELFCLASS64 ||
+            ehdr->e_ident[EI_DATA] != ELFDATA2LSB) {
+        eprintf("Invalid ELF class or byte order, must be 64-bit LE\n");
+        return false;
+    }
+
+    if (ehdr->e_ident[EI_VERSION] != EV_CURRENT) {
+        eprintf("Invalid ELF version\n");
+        return false;
+    }
+
+    if (ehdr->e_machine != EM_X86_64) {
+        eprintf("Invalid input dump architecture, only x86_64 is supported\n");
+        return false;
+    }
+
+    if (ehdr->e_type != ET_CORE) {
+        eprintf("Invalid ELF type, must be core file\n");
+        return false;
+    }
+
+    /*
+     * ELF dump file must contain one PT_NOTE and at least one PT_LOAD to
+     * restore physical address space.
+     */
+    if (ehdr->e_phnum < 2) {
+        eprintf("Invalid number of ELF program headers\n");
+        return false;
+    }
+
+    return true;
+}
+
 int QEMU_Elf_init(QEMU_Elf *qe, const char *filename)
 {
     GError *gerr = NULL;
@@ -133,6 +180,12 @@ int QEMU_Elf_init(QEMU_Elf *qe, const char *filename)
     qe->map = g_mapped_file_get_contents(qe->gmf);
     qe->size = g_mapped_file_get_length(qe->gmf);
 
+    if (!check_ehdr(qe)) {
+        eprintf("Input file has the wrong format\n");
+        err = 1;
+        goto out_unmap;
+    }
+
     if (init_states(qe)) {
         eprintf("Failed to extract QEMU CPU states\n");
         err = 1;
-- 
2.35.1


