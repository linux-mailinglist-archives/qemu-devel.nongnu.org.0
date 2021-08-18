Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57103F0BBF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:27:23 +0200 (CEST)
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRDe-00085l-Ka
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6A-0000DK-Be
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:38 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR68-0008Nl-OZ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:38 -0400
Received: by mail-pj1-x102b.google.com with SMTP id n5so3276835pjt.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6inZETYo7qpmjRK6t8YVcWmKQsxE4jryCUSCrlDOgJc=;
 b=lyJdnz/Am7qYBegT8WVZck0EdQipgxsKMBTlrj+cytpROYYxADrScGSB8v7pGiX+73
 3fur537d7fWa8XWdTBOo4QKScVsjKUHTzw3K78eoEyFzPz1PDxXrsCgtd9y50gg0eoCb
 W5m7tDbtfmUKEAxUnVfDQMvigNboUmAMrEzPXQtNaTCQcguCARQ3/NyLEuVzPF5Xp7k2
 PuJ3DJcpd8iPbcwBICkr/QQa2pLLk74yVW2ZmX/j24rHs5tPwvGgyQU8E95cm2SFlsaH
 3mtX1XS1C1uFB/H6UcY+vC2T3QAQp+0hfJopNog1SbyTluuptk+Vop61ghXad6UuOC6n
 nAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6inZETYo7qpmjRK6t8YVcWmKQsxE4jryCUSCrlDOgJc=;
 b=PqINHmpfEmijNRPZjj4kYUUL2nq/rHGnfPmt1gEr/ccrOjDKoj+reoazxswTPKyA/b
 4I8ThYFR9dG7R7x842fWkSfbZzkkIhGZjGU5BC5Nc7VFYEorDHDEWehSyc4pHO2h7QqV
 yIZmArEiRqYEsEEG2G3q8xJHCgPExQmkuCX2CHLt+XYylRfn7oiWQhRP46OOyzajqO0h
 mHuCJ1NfpCyvVI6I8dhe9fJvs3u4dhVxDq7v2Thl8I9LYW7rQk0CJMix/4IuwlbqNsiO
 ilfAIWaYE1z3fqwuwsw5+oZ02O0a4aVZcFIOgOx8Deadd/wlaKcJlwcub6tzcfinpLMu
 yYtg==
X-Gm-Message-State: AOAM5307V5/Y/SN5qEBM/ul/D/wJlx+4n6j4+zLu4xyCYfCsiSH8AsQR
 rl0LE4ntrsQUDjTfVQvPgY0RBmSfPFdoUA==
X-Google-Smtp-Source: ABdhPJzIFa0Di+GgZOTckvW0Vpgz3SK5XCmNWMMRxUVZJy/3K21Fq5J+T0MrSG5WwkoLbEM+f1FtTw==
X-Received: by 2002:a17:902:e354:b0:12d:d04c:f92c with SMTP id
 p20-20020a170902e35400b0012dd04cf92cmr8487825plc.27.1629314372277; 
 Wed, 18 Aug 2021 12:19:32 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/66] target/microblaze: Do not set MO_ALIGN for user-only
Date: Wed, 18 Aug 2021 09:18:21 -1000
Message-Id: <20210818191920.390759-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel will fix up unaligned accesses, so emulate that
by allowing unaligned accesses to succeed.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a14ffed784..ef44bca2fd 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -727,6 +727,7 @@ static TCGv compute_ldst_addr_ea(DisasContext *dc, int ra, int rb)
 }
 #endif
 
+#ifndef CONFIG_USER_ONLY
 static void record_unaligned_ess(DisasContext *dc, int rd,
                                  MemOp size, bool store)
 {
@@ -739,6 +740,7 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
 
     tcg_set_insn_start_param(dc->insn_start, 1, iflags);
 }
+#endif
 
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
                     int mem_index, bool rev)
@@ -760,12 +762,19 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
         }
     }
 
+    /*
+     * For system mode, enforce alignment if the cpu configuration
+     * requires it.  For user-mode, the Linux kernel will have fixed up
+     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
+     */
+#ifndef CONFIG_USER_ONLY
     if (size > MO_8 &&
         (dc->tb_flags & MSR_EE) &&
         dc->cfg->unaligned_exceptions) {
         record_unaligned_ess(dc, rd, size, false);
         mop |= MO_ALIGN;
     }
+#endif
 
     tcg_gen_qemu_ld_i32(reg_for_write(dc, rd), addr, mem_index, mop);
 
@@ -906,12 +915,19 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
         }
     }
 
+    /*
+     * For system mode, enforce alignment if the cpu configuration
+     * requires it.  For user-mode, the Linux kernel will have fixed up
+     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
+     */
+#ifndef CONFIG_USER_ONLY
     if (size > MO_8 &&
         (dc->tb_flags & MSR_EE) &&
         dc->cfg->unaligned_exceptions) {
         record_unaligned_ess(dc, rd, size, true);
         mop |= MO_ALIGN;
     }
+#endif
 
     tcg_gen_qemu_st_i32(reg_for_read(dc, rd), addr, mem_index, mop);
 
-- 
2.25.1


