Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F56DB833
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 04:46:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyY0-0006x1-6i; Fri, 07 Apr 2023 22:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXy-0006vM-6U
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:22 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXt-0005Wo-MQ
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:21 -0400
Received: by mail-pl1-x62b.google.com with SMTP id e13so56707plc.12
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
 b=Ea1zZYA0y6DU1+Jpk3XYzqWFvMO+AsIyzT5p0CZL7dUA/MpgPrTLPHQlxxWoNkempS
 X9MT4q+4VuYPzo7OcJXGP+PTuDdVH8riWLRr7CtGHbkafQ47ETQOHtsnRl59TPodpW6I
 EPOSlxf/IAmKkoofGDfUiPNIPv5T5i1lPES3JqOIfHWb+vpehaBEeqMvFXytmlRQzsGB
 jcl6KmkbAjr8P2bjBz1ZwFWy/rVJdU0q5YFOiadGHD4HzrIE/okBTXSJ8SIHHzBbJD58
 d/sUkyq/0D54H27FNVV4jwZz75Kn3T1hn5YvNJs+WblO/fIKuemmmpW3g/YjkSa/NRwP
 aGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
 b=nVPZCqTF8+F4Hcf/OA4wmH4p7Mm0EulqnhGHN4UVV3OfvEsGX5JzGMnIHPKJmloyPO
 DKC5qdaaxMrC6FrQwUv51MnsxBPJTYEKKQYetX8rCT/s/0myJzTam1enuRUZl5foGftj
 lyYweRu/9qmiw7kQeuB9bFFSkU6CJQPL13Y2xMGqmrAlIOkCtQ6b8GzyNff9UVfY6gBa
 Eif9SwyUoIHcpdEKN9qubHiAxaMXB2TpvqsE+Z3cviShy2V9BaQwTxX19SzYh9psPesd
 JnCYO/4IRBBoB5ktKwg9QYmQR5n5j/ZQw1iQohLzmiZo8UuKxb0B0SOLXcFhoVdhxL4h
 Z4nw==
X-Gm-Message-State: AAQBX9d1G9tgw6upGTnrABoWjp7WawgMJSvUzicB7VJ1tfcxPuJU/D/q
 9KtfO+amNgflQZKIlrLF0ffvB7IMhbS6oYcKfPI=
X-Google-Smtp-Source: AKy350Yhn0srUEmNpjRdUNHsBk0rxPoNMgBroWV9RbErYZ5rsf/orDoLJWpM25sEP7TyIe9HbSzmEg==
X-Received: by 2002:a17:902:f94d:b0:1a1:f95a:2505 with SMTP id
 kx13-20020a170902f94d00b001a1f95a2505mr8481645plb.29.1680921796286; 
 Fri, 07 Apr 2023 19:43:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0] tcg/i386: Adjust assert in tcg_out_addi_ptr
Date: Fri,  7 Apr 2023 19:42:32 -0700
Message-Id: <20230408024314.3357414-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We can arrive here on _WIN64 because Int128 is passed by reference.
Change the assert to check that the immediate is in range,
instead of attempting to check the host ABI.

Fixes: 6a6d772e30d ("tcg: Introduce tcg_out_addi_ptr")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1581
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4444eb9234..5a151fe64a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1082,7 +1082,7 @@ static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
     /* This function is only used for passing structs by reference. */
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(imm == (int32_t)imm);
     tcg_out_modrm_offset(s, OPC_LEA, rd, rs, imm);
 }
 
-- 
2.34.1


