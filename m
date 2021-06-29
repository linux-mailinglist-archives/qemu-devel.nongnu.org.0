Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E53B78DF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:51:28 +0200 (CEST)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJlX-0005Vl-MZ
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItU-0000C0-B2
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:36 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItF-0000z2-58
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:36 -0400
Received: by mail-pf1-x433.google.com with SMTP id c5so90902pfv.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzG+IK53XdySkGDuIO25Vl9LUHRHkp4N6+CK9vmLiEo=;
 b=SXb3y76bCDgPgKDSZJ7Zzzkh2RdxrRTnRcaZfdfa0OTJV+dtAEJsh+89cwc6Wz9GUn
 Ubc6/Kz2tquuejdADQaYMIWb26YY5aSXZCcYo38lTlDWABdOJRABb2elwpgvc7k3rPg7
 aA5LIHAU5IWK1J6hcfFvBBbbPdYZuDO2FeDXHA7RTT47V6tUzsFIYiOpvkEu8R6j0g5w
 VvJd8RTdpd+WkdkawtFyxYGVni/ywBxC1TthS0G4YQtuKQOIwbjT34a0t6nT7O4rESJ3
 UKBB7T/zYVH8MvY9YnG463gOQ7h3PIHMuS2zog9kCEG0NPe2qshCHN/kxNG+xV6MG0T4
 H3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RzG+IK53XdySkGDuIO25Vl9LUHRHkp4N6+CK9vmLiEo=;
 b=mMja9IF8llR82UQYGSBQ/PcsF/6q2WdZOwUkrLxROaLHBylTziRU86KupmysdgwKkE
 d1t+aeWJ0194W5xvD3BW1Qmc+BHH6MKcmoDh014o24h4ozycl4vDRdtzA12kAUaHElSa
 MWm1nUyuP35f8o6Lc4GSvNgL9k91raylsM9nKNu5s7wVPUutY09yIwciis6KSHto1J0n
 8hnzU0R+yRNxRaYw9PIKDWKfzloRGfLoUTKLQzIGYWKbEGDsvn7aRnfNt1pm6zzI2B+b
 THHD/jxA+t7S6JWHeG5solB0gKaXe5Txji7VvpImxLCwzdDSMnomlomDUrPiio2KZ20l
 t10g==
X-Gm-Message-State: AOAM5328hkK4+QaIP6klBg72sqqBjnQoglOtAlOmZFucip02CI5jYeeF
 zbzGuQGNwpRs85odgo7FBKIlgjgurfUmew==
X-Google-Smtp-Source: ABdhPJyt0wWQI+7leZxnRGV8/dQ3l/YCCxrqFNC9I3XUiJQMAlxR4O1BB6TvY0CWVD1JB+UwmLzrdg==
X-Received: by 2002:a62:cf02:0:b029:307:f3d:6a2a with SMTP id
 b2-20020a62cf020000b02903070f3d6a2amr4466948pfg.9.1624992919854; 
 Tue, 29 Jun 2021 11:55:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/63] tcg/aarch64: Support bswap flags
Date: Tue, 29 Jun 2021 11:54:30 -0700
Message-Id: <20210629185455.3131172-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 8619e54fca..72aa7e0e74 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2177,12 +2177,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_rev(s, TCG_TYPE_I64, MO_64, a0, a1);
         break;
     case INDEX_op_bswap32_i64:
+        tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
+        }
+        break;
     case INDEX_op_bswap32_i32:
         tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
         break;
     case INDEX_op_bswap16_i64:
     case INDEX_op_bswap16_i32:
         tcg_out_rev(s, TCG_TYPE_I32, MO_16, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            /* Output must be sign-extended. */
+            tcg_out_sxt(s, ext, MO_16, a0, a0);
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            /* Output must be zero-extended, but input isn't. */
+            tcg_out_uxt(s, MO_16, a0, a0);
+        }
         break;
 
     case INDEX_op_ext8s_i64:
-- 
2.25.1


