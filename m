Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222C5AE33D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:43:27 +0200 (CEST)
Received: from localhost ([::1]:33304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUB3-0008DS-FC
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6D-0002Ut-Ip
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6B-0005TS-E4
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:24 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bz13so10891652wrb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=KgHC0Epmn6vIL/++u2sTVzw0n1Bos8TAPXCVOYM1ynY=;
 b=RDKjCRAyh8eFvcPmfcdflwD8QPeR5U5+6Y63s9VK2Y7KAVQPDXqskMp4+Kun6VwHvd
 x4uITsj2v0QdLI0j+Bl/AI+be6fSaFwXCJ513NPDYLRaVuBsw/ynB7oYejLEfVa3IgP2
 xynPfdpyrmQ2QJJ1VtadgVOyAe3zt/IHm1gEOVzELu6LKSvrc9GonQlg7Nmo69YdL799
 eQVZ2H2DnDiYgBdc6+CHB0u5HahRcFE2JIKE+MAWvYjQ8X4DxrNNQb6y/OzhY7VLS4bR
 qHJ8ArpbKsP3azVe6ht3L2MmeYJk6f1V0nnoOIciyEQwTX+VO4R7VTftczAg2dA+GktJ
 O5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KgHC0Epmn6vIL/++u2sTVzw0n1Bos8TAPXCVOYM1ynY=;
 b=1DAoonMEIZapbXYMIcQ/Jdk0l3Ex26e5C+864qV123gsONMD1Ey4IrefsdHcfL6YAx
 zJWoUb3JGtgqf+GLkVIVwKhZGmqdYIyzug6kJ9wkcFpmHuo9wzkHUO2xSBo4a7mX2/mi
 G+Gr+oJtuXIo29Qu5Ca/9b96Robk6l4ZVtUT4DzYmb4GZEtqvw6oEKldXDdO47szFhaH
 RsA7HCU1bDtDukyxsl2MKcgphID60TnvIcDxcNodo3kwFbH8pWqs+/5Vx3SthuPJ6xKQ
 aoIbDj7gvVp2fRo+88lIk18lqib8d4cQQfK6ehajFqPIL25vU99r6eG8kcBosOgcp7dj
 gHMw==
X-Gm-Message-State: ACgBeo1pg4+0c1O9//JPeYAv7iNB1CmAPEeUjxk4zoC3jxbXuQ/anAAG
 JX1JXXmboIZ+tJGjxqPagcZHT4i1cOLKL5uE
X-Google-Smtp-Source: AA6agR5XGJmaIFXBqq/fkdAxxsjSdEmL6fB7n/RdrUHVOdB1WJtfOuIrSgMYiCrsXl0Q6VYyQcWKwg==
X-Received: by 2002:adf:efd1:0:b0:226:eb1c:de82 with SMTP id
 i17-20020adfefd1000000b00226eb1cde82mr16120224wrp.81.1662453501488; 
 Tue, 06 Sep 2022 01:38:21 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 03/20] linux-user/x86_64: Allocate vsyscall page as a
 commpage
Date: Tue,  6 Sep 2022 09:37:58 +0100
Message-Id: <20220906083815.252478-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

We're about to start validating PAGE_EXEC, which means that we've
got to mark the vsyscall page executable.  We had been special
casing this entirely within translate.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 29d910c4cc..82fecf9e5a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -195,6 +195,27 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
     (*regs)[26] = tswapreg(env->segs[R_GS].selector & 0xffff);
 }
 
+#if ULONG_MAX > UINT32_MAX
+#define INIT_GUEST_COMMPAGE
+static bool init_guest_commpage(void)
+{
+    /*
+     * The vsyscall page is at a high negative address aka kernel space,
+     * which means that we cannot actually allocate it with target_mmap.
+     * We still should be able to use page_set_flags, unless the user
+     * has specified -R reserved_va, which would trigger an assert().
+     */
+    if (reserved_va != 0 &&
+        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE >= reserved_va) {
+        error_report("Cannot allocate vsyscall page");
+        exit(EXIT_FAILURE);
+    }
+    page_set_flags(TARGET_VSYSCALL_PAGE,
+                   TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE,
+                   PAGE_EXEC | PAGE_VALID);
+    return true;
+}
+#endif
 #else
 
 #define ELF_START_MMAP 0x80000000
@@ -2360,8 +2381,10 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 #else
 #define HI_COMMPAGE 0
 #define LO_COMMPAGE -1
+#ifndef INIT_GUEST_COMMPAGE
 #define init_guest_commpage() true
 #endif
+#endif
 
 static void pgb_fail_in_use(const char *image_name)
 {
-- 
2.34.1


