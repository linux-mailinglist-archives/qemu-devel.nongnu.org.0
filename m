Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0563F4757AA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:19:53 +0100 (CET)
Received: from localhost ([::1]:36270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSK7-00084U-Pz
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:19:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiY-0006la-HH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:02 -0500
Received: from [2a00:1450:4864:20::436] (port=41580
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiW-0008QT-Fu
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:02 -0500
Received: by mail-wr1-x436.google.com with SMTP id a9so37361301wrr.8
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G182pIHkjJrICKs+H0StOPfRJTHwqdMAHlojnGkBCfQ=;
 b=hCiaY+5qKLBES+R6pWTsQpEvpSIm3ARlnIfK4DKLCy5XpiPnRJA7bVGafGoQDiLDsR
 f24S79YcjmBFDJllzWu8GlPs6/mJHFrLWG1NapUIB+iD5AzBux20tG0kH7+rkpGnw+yh
 5m1VVclYbF+HYH35KJqJ0/tFL8DeR76l2VHMkXXJy3oh1/1remR9rAXmAMSgPh74XHDc
 xoQdQVTeNO7wUmOgkvi8NGj0HK4IhRoHEsXnfFvzMYvpXcyEgDfHWJlmaSYSw2PvZq47
 UBkro/fgsq+RXo/dzPZNTiklpEtYb4HmxUeJOZvxyedh8M+ARz0qopaZBFHIu2IfI4qX
 EKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G182pIHkjJrICKs+H0StOPfRJTHwqdMAHlojnGkBCfQ=;
 b=5WwrpSN2seBYUABW+U3yFJviC/Eo+3n8V1vN2LPuTYpgtvsI9qfpXBTRzHKZtX/vn2
 BFDjvkAliNeN0N1F8oLOl3f/PjWy6WVTzGDHFqdfQP54KKEdBBIb5dJvqSY3JoAsM0n7
 bCgSQT3rw5/vtXpLzu3aYnfkx2WS1tD5YcyKKzwGKk4UuUxulES/dhKNawHmUg5YTmh6
 c/F8gT4Nm59DeLeIrMSX/8wUSnIYCdKk7ueATQWzxjqFTeGnc4D+SVIGcctn3D50afoI
 kPEsDF5BAgLpb4aEFODx8GuYkeDVe5+GTKaUN0NmitTKmvdII6leH/XOeOP2jqW4N/a6
 5gzw==
X-Gm-Message-State: AOAM532ULGegEky0BnkbHlrN8OXSAXGL4jshluT/0TzztQibhsstsLDn
 GDAxmL34EjLLbS3H8EiPZpOiM227oBRXsQ==
X-Google-Smtp-Source: ABdhPJyV6MnXQqtZbYleDd82zxnXhv87wy3TG0fnSOwgxafCd088dNblqS0ElbUsOYjrAaazex73gQ==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr3757570wru.316.1639564857128; 
 Wed, 15 Dec 2021 02:40:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/33] target/arm: Hoist pc_next to a local variable in
 thumb_tr_translate_insn
Date: Wed, 15 Dec 2021 10:40:27 +0000
Message-Id: <20211215104049.2030475-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c721b2ce42c..1c2a7274dfc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9618,25 +9618,25 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint32_t pc = dc->base.pc_next;
     uint32_t insn;
     bool is_16bit;
 
     if (arm_pre_translate_insn(dc)) {
-        dc->base.pc_next += 2;
+        dc->base.pc_next = pc + 2;
         return;
     }
 
-    dc->pc_curr = dc->base.pc_next;
-    insn = arm_lduw_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
+    dc->pc_curr = pc;
+    insn = arm_lduw_code(env, &dc->base, pc, dc->sctlr_b);
     is_16bit = thumb_insn_is_16bit(dc, dc->base.pc_next, insn);
-    dc->base.pc_next += 2;
+    pc += 2;
     if (!is_16bit) {
-        uint32_t insn2 = arm_lduw_code(env, &dc->base, dc->base.pc_next,
-                                       dc->sctlr_b);
-
+        uint32_t insn2 = arm_lduw_code(env, &dc->base, pc, dc->sctlr_b);
         insn = insn << 16 | insn2;
-        dc->base.pc_next += 2;
+        pc += 2;
     }
+    dc->base.pc_next = pc;
     dc->insn = insn;
 
     if (dc->pstate_il) {
-- 
2.25.1


