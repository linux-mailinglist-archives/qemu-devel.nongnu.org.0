Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9724DBE2F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:24:23 +0100 (CET)
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUicY-0006uH-T9
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:24:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKc-0000Us-An
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:50 -0400
Received: from [2607:f8b0:4864:20::62a] (port=38572
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKa-0002DA-L9
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:50 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n18so3559966plg.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L+hHIFlWfBTWBYr3FWgA0oFT6zz/eF9rCjwaIxiotag=;
 b=CBkjPBEjEnkCygb/TQ0Lwvh9voa/HM7X3RdQUdZZ9PzDHMESJy6LNFS1bOwRID5Y2/
 1N9c+UQ9LBtmCoBPxLOdbKIerT8eIgw4rtbIReTLgViBQbh3mgjWJPN5855mS7l4l/RU
 rjjnEFBvbnxzGcbxSY5eJK30s3Q5pVRZprq9bZfXJX+dJqsugKz82YpWn7YlgDozVLIb
 qNgCByblyQg57GbGZsprAsMyG3J9MdmUxYJgxD3IOud2qobvbb5AjCNcBJgTTBE09lrH
 DDlOSpB4b3orVtYc6Vk3e9Ci6Mr2GhysNBze6DgQU07xqy2THADhrCpeK/dLvJtWEha0
 zkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L+hHIFlWfBTWBYr3FWgA0oFT6zz/eF9rCjwaIxiotag=;
 b=xIuu5n/pIRN4Rg4PFVXh9jbjgU/SaCzljNNF/L2p13XpVZlh6xoJOoNHQcOI3cfx2N
 bme32xhq9g0PXW0DCyzGwxkwctjiy7bMJ6PAqX5FTf5beFXcM42a1zlbCB11IjOfse/r
 DUGMWPYccutJb7izy3ZABlh0dKbrEzbE+kI38tVdcz8SI7RojpcoVIcMH3e+hWigOMyT
 d6ssSTiQlTqINJC7rJkLwIB+1aUOjt041wkTjtPcnj3jaW1+OoQ9VIUDw3GnKSuPrmWo
 X8Z1e+l3q0zIaWUTV7kKULiSPDv0PWw9mbnWcH1Mjfyb1LbRNggdtMVmh9bFK94QmH6G
 1FoQ==
X-Gm-Message-State: AOAM531xz1R+14srLkUaSSXYpmaJ+MIIzQiCTRYOkmWFnKuQR53qrNGJ
 xHbq+zvySGLXYaBaPZBXKJMvWeFSkEb6CA==
X-Google-Smtp-Source: ABdhPJzatySXpc9wuCJnrSieRJBrsurUfQo8Vuq3dlc25dol1guKpBkjLVHxWOOgBx2WdaloL0tWsA==
X-Received: by 2002:a17:903:240c:b0:153:c8df:7207 with SMTP id
 e12-20020a170903240c00b00153c8df7207mr2990519plo.44.1647493546831; 
 Wed, 16 Mar 2022 22:05:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 07/51] target/nios2: Fix BRET instruction
Date: Wed, 16 Mar 2022 22:04:54 -0700
Message-Id: <20220317050538.924111-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had failed to copy BSTATUS back to STATUS, and diagnose
supervisor-only.  The spec is light on the specifics of the
implementation of bret, but it is an easy assumption that
the restore into STATUS should work the same as eret.

Therefore, reuse the existing helper_eret.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 7c2c430e99..3f7bbd6d7b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -407,12 +407,22 @@ static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
     dc->base.is_jmp = DISAS_JUMP;
 }
 
-/* PC <- ba */
+/*
+ * status <- bstatus
+ * PC <- ba
+ */
 static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_BA]);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
-    dc->base.is_jmp = DISAS_JUMP;
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    gen_helper_eret(cpu_env, cpu_R[CR_BSTATUS], cpu_R[R_BA]);
+    dc->base.is_jmp = DISAS_NORETURN;
+#endif
 }
 
 /* PC <- rA */
-- 
2.25.1


