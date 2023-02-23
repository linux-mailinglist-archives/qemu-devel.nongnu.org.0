Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F96A0F0B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:05:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFxK-0004Y9-Nc; Thu, 23 Feb 2023 13:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVFxG-0004Ro-BR
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:04:32 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVFxE-0003jn-Ub
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:04:30 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so83068wmb.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 10:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HNIWPV45KGkKoxXS4WlxdJUG3g4w25TFk+WrlWHrdxY=;
 b=LBC3Lk6BokndQaYPlDuKPQ1M6VdT/7r6APA8KIkebpMpM0lIjKUMvWDDgYjraK1m0r
 qjQgN7C4+y29NjnajXu/eeqqHyPhdZitregKhGZwz872vEl2gWnrt2mMYiqun/Ka2Yhw
 BZVuyGXkM7w7zoIfotNgqNOx6YedZJaIzYyOrIXbghfwWjt4nUjnelWq0HFmpjDaKZtD
 XTUJHVd7vvTutoiythBl6UWPJmXrJZ1JFAy86gK8FT11Mi03MG75PAccBcz9G06TBqdL
 tGI7Cf4j/gMkhtbdKRsHMvsugFUdo7kHbST9Bk26xPsoYprKctuj+Tb7CpZSt1r4WaLS
 f3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HNIWPV45KGkKoxXS4WlxdJUG3g4w25TFk+WrlWHrdxY=;
 b=ZUMjSKt0QtMiRTku0vqQ4WkH8WqKKpcrzeei/OB3czbfzD9p9l4oUmH8BCTAbM5s/G
 y0VHr6A8kqV4Ah3SKy5hm1Nrdht934lNnv0B4eNZIfmL+7GlNfyO8FAnoeYsSKQQXf2N
 4STBBmfpIG61YXBtcbmPdqTWZAE++mNXIWz5bczVaXExTM+FEcAwGIbSWJITIlFEJhWx
 KCy6BGD8mDM1450clAu8ccZHEaQm53NdqA1iQpfHyRPKH9Emv87cqu8p3dSIhH7sF7kG
 nkZkHIgu36Y84qb4cmMnanqZlLtAHPvYQgEgLz1/9R+7DwwoiXcqQKpfLHQYV33TMsIR
 +/fQ==
X-Gm-Message-State: AO0yUKVadWijN6cmy+fNeKCUYu4LS4Qoca6BrnNcmaJaPNXoMY3N4r8w
 oA4v9sctVKfJktYg86V0HpSIhFU3F9Je+CQc
X-Google-Smtp-Source: AK7set9xND8PuqwC3rXsFl+ZVzkfVoFDPwBfJtaPpFt36YA9rseS2be995OU2EFgl3QjMKv8+G1Nig==
X-Received: by 2002:a05:600c:4a9b:b0:3ea:eaa9:8dd8 with SMTP id
 b27-20020a05600c4a9b00b003eaeaa98dd8mr450596wmp.20.1677175467400; 
 Thu, 23 Feb 2023 10:04:27 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 be6-20020a05600c1e8600b003e89e3284fasm32411wmb.36.2023.02.23.10.04.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 10:04:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/3] target/sparc64: Replace TCGv by TCGv_i64 in
 gen_op_multiply()
Date: Thu, 23 Feb 2023 19:04:05 +0100
Message-Id: <20230223180405.31836-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223180405.31836-1-philmd@linaro.org>
References: <20230223180405.31836-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Free calling tcg_temp_free_i64().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 150aeecd14..3cac26680f 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -634,8 +634,8 @@ static inline void gen_op_multiply(TCGv dst, TCGv src1, TCGv src2, int sign_ext)
         tcg_gen_mulu2_tl(dst, cpu_y, src1, src2);
     }
 #else
-    TCGv t0 = tcg_temp_new_i64();
-    TCGv t1 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
 
     if (sign_ext) {
         tcg_gen_ext32s_i64(t0, src1);
@@ -646,8 +646,8 @@ static inline void gen_op_multiply(TCGv dst, TCGv src1, TCGv src2, int sign_ext)
     }
 
     tcg_gen_mul_i64(dst, t0, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
 
     tcg_gen_shri_i64(cpu_y, dst, 32);
 #endif
-- 
2.38.1


