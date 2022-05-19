Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3220252DA9F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 18:50:59 +0200 (CEST)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrjMX-0001oQ-OA
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 12:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nrjKg-00008B-Va
 for qemu-devel@nongnu.org; Thu, 19 May 2022 12:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nrjKd-0002QK-5V
 for qemu-devel@nongnu.org; Thu, 19 May 2022 12:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652978937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fkYaPJZ5+Qd9CDGHA3uqtT/cDtvXW/OfvbFVg6Bs+G0=;
 b=YdjAaRUpCCzvdh+7PnzWJPEDfrYSO/oUrTgQ0+Uh7njqCHZZBUiqlDIteBfhn7+xSKcV4W
 aM1AeRUGdJDxx2KTlnQck67IVltHjzDfhsG7ulfT3k5K0vXXfhguZAXJe+BgYA+ROi7oDt
 yfZMRNedE5bAe7+e8D/PCtroHoUeRnQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-p_F39id4MxuhShEa9_eMgw-1; Thu, 19 May 2022 12:48:53 -0400
X-MC-Unique: p_F39id4MxuhShEa9_eMgw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38368800882;
 Thu, 19 May 2022 16:48:53 +0000 (UTC)
Received: from vp-pc.redhat.com (unknown [10.40.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68AB940C1438;
 Thu, 19 May 2022 16:48:51 +0000 (UTC)
From: Viktor Prutyanov <viktor.prutyanov@redhat.com>
To: thuth@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	yan@daynix.com,
	viktor.prutyanov@phystech.edu
Subject: [PATCH] contrib/elf2dmp: add ELF dump header checking
Date: Thu, 19 May 2022 19:48:49 +0300
Message-Id: <20220519164849.112847-1-viktor.prutyanov@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
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
QEMU guest memory dump or even not ELF.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1013

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
---
 contrib/elf2dmp/qemu_elf.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/contrib/elf2dmp/qemu_elf.c b/contrib/elf2dmp/qemu_elf.c
index b601b6d7ba..941b573f17 100644
--- a/contrib/elf2dmp/qemu_elf.c
+++ b/contrib/elf2dmp/qemu_elf.c
@@ -118,6 +118,39 @@ static void exit_states(QEMU_Elf *qe)
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
+    if (ehdr->e_type != ET_CORE) {
+        eprintf("Invalid ELF type, must be core file\n");
+        return false;
+    }
+
+    if (!ehdr->e_phnum) {
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
@@ -133,6 +166,11 @@ int QEMU_Elf_init(QEMU_Elf *qe, const char *filename)
     qe->map = g_mapped_file_get_contents(qe->gmf);
     qe->size = g_mapped_file_get_length(qe->gmf);
 
+    if (!check_ehdr(qe)) {
+        err = 1;
+        goto out_unmap;
+    }
+
     if (init_states(qe)) {
         eprintf("Failed to extract QEMU CPU states\n");
         err = 1;
-- 
2.35.1


