Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93853445F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:40:01 +0200 (CEST)
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwrQ-0002PL-2n
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwh3-00052I-FI
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwh1-0003qm-5g
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtZdJzeKJoyGwpmhFItxc7PeNKZ/W7P7ouilE2b374E=;
 b=UQt0kOyHxEeSsCTkPifHDxFjywcPY9yS6fn3pMPgN2v5FGUSkK+s3RLlyQr6cySo/fDSZS
 YJgWEP3DWw3yFFfj6Sz+qiR5Nh/EpH4M1SmIbruMz8AGfnP+OUgW0hixEK8zufT/Wa/2r8
 xTn2FusHBVBsitT6rkA11IKubzCNMrA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-OR_CtIRqNEK-sIIbG00QXw-1; Wed, 25 May 2022 15:29:13 -0400
X-MC-Unique: OR_CtIRqNEK-sIIbG00QXw-1
Received: by mail-ed1-f70.google.com with SMTP id
 j22-20020aa7ca56000000b0042bd3527f2aso420354edt.0
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wtZdJzeKJoyGwpmhFItxc7PeNKZ/W7P7ouilE2b374E=;
 b=psk1uR+LzMQTK5U+CO10hJ2OX+wQzVhjwzP/6ePqwGh1KjQZL/juaQG7EsKj6rZbn2
 78AYIJxAstEMpFOacesS8FR8UOnoRURMHUcuF4iI8T7gZgAK7dksu0VCfo28D3iicFo9
 Br8JsHLXw1YXZJqmJq7ecRXOzVnA+opjKLkiqfKCbyzlFy04gZVtSIWbszDAE/XNFTyu
 OzKt8U/ntOSEchuE13aamVenF02LceBlT8osa8dskwFl5gcitECu0njE8/xiQhjl4UHC
 23HYOg90ljKnfoiBT+GDHjmYq5D8UUVgitrUbwBalSDy61nLxKHYg2kcAQv7GaHy9nrH
 2ioQ==
X-Gm-Message-State: AOAM531ezMDmyJymQml/UPv1inKhLBy2KP9/adfVXuh7NPQtDneZ4S/6
 k4zyt4GavIxx0gHVkHZVSsyVmfubbjPTAYtLX6p7VxMKIi3NrGcQSlNLsZN64QBWv6g52hTtRNY
 ZTc73SIJwLBeDssH9fuSPJkGTfvpSom66F9irskvb2MCgsOwf99gSMlWF6u1lLnC+8nY=
X-Received: by 2002:a05:6402:1010:b0:42b:5afd:a506 with SMTP id
 c16-20020a056402101000b0042b5afda506mr20186596edu.276.1653506951672; 
 Wed, 25 May 2022 12:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdhkAnbXitZXdy5PUo4kLFTnTw9GbP7zhW+KLwQuZfeBde8y3dULEsCcQLflQA/LvQNIsDXg==
X-Received: by 2002:a05:6402:1010:b0:42b:5afd:a506 with SMTP id
 c16-20020a056402101000b0042b5afda506mr20186536edu.276.1653506950951; 
 Wed, 25 May 2022 12:29:10 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a17090619d200b006f3ef214df2sm5224162ejd.88.2022.05.25.12.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Viktor Prutyanov <viktor.prutyanov@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/17] contrib/elf2dmp: add ELF dump header checking
Date: Wed, 25 May 2022 21:28:41 +0200
Message-Id: <20220525192852.301633-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Viktor Prutyanov <viktor.prutyanov@redhat.com>

Add ELF header checking to prevent processing input file which is not
QEMU x86_64 guest memory dump or even not ELF.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1013

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220520084339.171684-1-viktor.prutyanov@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.36.1



