Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F804591565
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:19:19 +0200 (CEST)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZFe-0007I2-74
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4x-0003RM-1i
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:15 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4v-0006WN-8u
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:14 -0400
Received: by mail-pg1-x52c.google.com with SMTP id bh13so1414904pgb.4
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HeLIyzSnBSgTsEjpLE+UrcJkbFayKBL07Hhi/YlkyKA=;
 b=uC0WdfQSkZGvDUH/GE8ArB1y+XK1PPiBkRLst/StY2kalmAgWz/MYIhpND8ieqHAJl
 mZJglurOWj0TNxfjFHCQybPLzSK/BtSOi7M3wCSvIVG4HL/vtKingkH9l1tuJxG1MW+t
 qF6nX/DChwFagiIMRVUzrJHe+p4oS8nZWHBN7Ts+zCWtrvze45cmFBrDbCkf3Orw5OuH
 gdTX6IZXZTPufRvWUiMBTPN2R4rRiob55CJDy/HpFO3+M/lWwaL7hwC1Ck0WTAvthI3X
 xISlf32DwnoyfOEnC9Esi9rAXstvsQ0oibgTWph84ABMUdSpG4hZhg8/WJFn+Aj5HwLI
 SjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HeLIyzSnBSgTsEjpLE+UrcJkbFayKBL07Hhi/YlkyKA=;
 b=WnmqC7U1fdohCc9SkSaIS3dpiRSh/C72970h2TwEuwH8fCx9Up0AnIaUeZZ9UmcLOI
 HtdltfVLpwSerxEQf1hTuSaTai3SH0tz+7GutFr6ux226iKzuXXxfMp7RiqKVckurnQT
 kTNqfsrnyKczG3n1VIadqs409NkGIVsj/a+HOAlcnmtW/Yoqp2OYNnKMskKFVUXrp9Kq
 1gJRhLjAOHmawRxTlOBBXkqeNbI5yE6ZYJyd2ejxe+0Elj7haFcLJGMy5wTIaqx0IWf8
 lCqHYPiZwCjqg3xojGVFK97yR2exX2abAKr7HOOBRqHTcLN25AbphPRZbe59+lBkoOqU
 nw9w==
X-Gm-Message-State: ACgBeo3cWNAFgbS3jCul2frHXThj0HUpHU2zvTryc02LOw6JMK41cwjY
 Ir2dEHva56y+VyHV1IxBkM06ZMfmB1fHTg==
X-Google-Smtp-Source: AA6agR6BD7H0okDJg8iOFGOfEdtsC7pHB2BYOofWQCuIG82YELI/wKi1MmjcNFHBebxDPBinlQS+NQ==
X-Received: by 2002:a05:6a00:1705:b0:52f:6028:5c33 with SMTP id
 h5-20020a056a00170500b0052f60285c33mr5042351pfc.29.1660327691936; 
 Fri, 12 Aug 2022 11:08:11 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 03/21] linux-user/x86_64: Allocate vsyscall page as a
 commpage
Date: Fri, 12 Aug 2022 11:07:48 -0700
Message-Id: <20220812180806.2128593-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
got to the vsyscall page executable.  We had been special casing
this entirely within translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 29d910c4cc..e315155dad 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -195,6 +195,27 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
     (*regs)[26] = tswapreg(env->segs[R_GS].selector & 0xffff);
 }
 
+#define HI_COMMPAGE  TARGET_VSYSCALL_PAGE
+
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
+
 #else
 
 #define ELF_START_MMAP 0x80000000
-- 
2.34.1


