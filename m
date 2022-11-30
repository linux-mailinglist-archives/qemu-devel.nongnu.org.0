Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3932D63DACB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 17:36:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Q2x-0003jm-3O; Wed, 30 Nov 2022 11:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Q2u-0003hZ-Rp
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 11:34:52 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Q2t-0008Sg-Af
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 11:34:52 -0500
Received: by mail-wr1-x42e.google.com with SMTP id x17so27969134wrn.6
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wj4Tumdtb8tpGGJ6wJeEX2VYkTrShcgFecj89k/vw5w=;
 b=NnaUgGx05/YGfF4nOCw93Z28Q92EcWnqDwFGb7DKok05ELHZtPcDQRb8A/ZeXJ8qJY
 bNvSdyjQdz19DQbK6XUOs2Qxek76FDN0QTwHZQ0I3HJog+l6w9JLi3TDgWiZksgkJrc8
 Kk66+crRtsfdDi9z0NdAklcHHnqITRaVCxMziQgQDSMbrCyzWxY/+IeneZraHiP3XeIm
 B1OWvduHVXhx9YhTDwjmMWK/TK9c2zE5FVI6m9tchPw8uzYiA9LFKRzKwbUG4Sc2FIeY
 NQPcWQZ4+lplb953hm8YFA7PMHEL5SYWtyGouk4oOElf9LUsQzpmTz6k0C17FNyMONw4
 QGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wj4Tumdtb8tpGGJ6wJeEX2VYkTrShcgFecj89k/vw5w=;
 b=o62qPHjw0OZ729ZFpf6PpBsw0IX4jzd4wSQf7JuRMgqyetrOPcebqPMICws2S56Gy1
 WsNhFO+fIKQ7tOr+NTFE+Dktk/dy5Y3hIR/dq+4fxwQ65TOBs5E5xEb4wiOSiW7wF9s+
 3F6Sqoub+LHF2o0eqV3BFYSJ15DEkev0m12L1KusDMvJSXWBhzRWFrYW4y1HUqqE6FqH
 T6QkDPVhWTCTBmd78d7zHFwTygX4JgK9dvE/auxz1X5g3aGpPUXhIoeS+mQzzJYG9aRd
 w11/yOX6gWfb3BDr3YMyumQYGcsRQ6una4sOq+ErpYb+/ebyFxnYQ8PFaCCkA/e7JuIX
 /UZw==
X-Gm-Message-State: ANoB5pkYad0vGFJZnaxr5wTNxI+CCTdgAElYYTzEVMaOmq9kdWRPftfc
 8DMMI49JVP0X//VwsyhVR/DbOljMyvlvd1k3
X-Google-Smtp-Source: AA0mqf6+4Etsdk7WE51XB9fTU8tPROI/QT68v063YKAD/CnPCT1MRYE7XpsxijTdmTfCbvRMZIAiuA==
X-Received: by 2002:a5d:6144:0:b0:242:1c33:35b8 with SMTP id
 y4-20020a5d6144000000b002421c3335b8mr8786611wrt.217.1669826089841; 
 Wed, 30 Nov 2022 08:34:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4d10000000b00241c712916fsm2488305wrt.0.2022.11.30.08.34.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 08:34:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alessandro Di Federico <ale@rev.ng>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 2/2] target/sparc64: Replace TCGv by TCGv_i64 in
 gen_op_multiply()
Date: Wed, 30 Nov 2022 17:34:36 +0100
Message-Id: <20221130163436.87687-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130163436.87687-1-philmd@linaro.org>
References: <20221130163436.87687-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Although TCGv is defined as TCGv_i64 on sparc64,
make it clear tcg_temp_new_i64() returns a TCGv_i64.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 34858eb95f..5a08641995 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -647,8 +647,8 @@ static inline void gen_op_multiply(TCGv dst, TCGv src1, TCGv src2, int sign_ext)
         tcg_gen_mulu2_tl(dst, cpu_y, src1, src2);
     }
 #else
-    TCGv t0 = tcg_temp_new_i64();
-    TCGv t1 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
 
     if (sign_ext) {
         tcg_gen_ext32s_i64(t0, src1);
-- 
2.38.1


