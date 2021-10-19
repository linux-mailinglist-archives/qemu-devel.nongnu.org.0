Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3AF433C93
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:40:08 +0200 (CEST)
Received: from localhost ([::1]:42314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcs9n-0006yk-6y
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqz0-00055V-KX
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:54 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyr-0007XG-SL
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id s1so12086210plg.12
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfu2QZ3gpRQ8C8fsN7554x8wxijvHESDqJdXEHq27p8=;
 b=a1YR+2BJtRX9o6BMOYcBV+wrw+PCXiamdbTRbPfuwMVFaTTxWYGRUp1aYeXqPs2IjY
 4lKPGb+2/jDEU84sSnPK/a4Dls38eD8gECwRsVKeYMwYD4e686/NUtn4dGVLm1dApfIM
 p4jqWHtXP+kbj43Dwf2xc6aOgi7vAt7h+DJ+Sour9uCsmGJmKH2hyDdwAD699XRFH6XI
 IAMGIAIpDruqbHMVtMNt8zd0624C4FMq5WPnhSc0jDA4sNRNVzfWJDRv8as1S/eA19Ta
 XRlXsFwVyMG0VSxCRgtz8NBwRHJwaycMxjPKetQxZtgDhpAoV1nzMZ4z0FqBWAEg9ek8
 9Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfu2QZ3gpRQ8C8fsN7554x8wxijvHESDqJdXEHq27p8=;
 b=rSXL2Q4hEL3LH7Mc2X4hohV+tpAkyPstHxheJP88C7UyWqcSqaDgKuIUCTwGvPfBRY
 gBNCDbtolf8a7yXUPdMVtxk5S8ceTmRxFpBvYZ7B00loOMizc3V1i5lyMpdJVsM4OXAD
 eR0PMSQ6EQYn/cuWmzwNT4jSyeQR6wvmMvO2ysVxKTVCg5Pv9hSB92iTB0ZdGTnmdo1o
 kp1ROhqqYORApTzho3Voc7QIhnjVcXsOfaKtzIwBsmZ6cqAxNP38CIfsZtN1kyr4uFCq
 9C2xIuWdqWho6u8QjzSIglk9W/VqIOa1DmiKM4CwHkY6H6y77KH2iHNH/xT7EtZMIxjP
 jG+g==
X-Gm-Message-State: AOAM532pdS578aBE4OzqiQMUBf7ysZ1LKtBQK6E5e0gRX8AJw+sFBWi+
 XZRgClKA9IT1ItGZ+zSoNtkjLVG+PL335g==
X-Google-Smtp-Source: ABdhPJwA8If2BMlgsJBNUtc7xyC28fK74XJFeFCQcGGG7eYwcdOpgBm+BXUJuQhvKBxlDH2tCx38cg==
X-Received: by 2002:a17:90b:1283:: with SMTP id
 fw3mr589113pjb.99.1634657084471; 
 Tue, 19 Oct 2021 08:24:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/16] target/riscv: Properly check SEW in amo_op
Date: Tue, 19 Oct 2021 08:24:29 -0700
Message-Id: <20211019152438.269077-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're currently assuming SEW <= 3, and the "else" from
the SEW == 3 must be less.  Use a switch and explicitly
bound both SEW and SEQ for all cases.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index d60279b295..d16446d3bb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -704,18 +704,20 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
         gen_helper_exit_atomic(cpu_env);
         s->base.is_jmp = DISAS_NORETURN;
         return true;
-    } else {
-        if (s->sew == 3) {
-            if (!is_32bit(s)) {
-                fn = fnsd[seq];
-            } else {
-                /* Check done in amo_check(). */
-                g_assert_not_reached();
-            }
-        } else {
-            assert(seq < ARRAY_SIZE(fnsw));
-            fn = fnsw[seq];
-        }
+    }
+
+    switch (s->sew) {
+    case 0 ... 2:
+        assert(seq < ARRAY_SIZE(fnsw));
+        fn = fnsw[seq];
+        break;
+    case 3:
+        /* XLEN check done in amo_check(). */
+        assert(seq < ARRAY_SIZE(fnsd));
+        fn = fnsd[seq];
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
-- 
2.25.1


