Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65226670C8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:23:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFulN-0002i1-EE; Thu, 12 Jan 2023 05:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulL-0002hV-KK
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:24:47 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulK-0000Gh-2U
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:24:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id bk16so17567432wrb.11
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePUpY57zvg4A0Qc0xpq/0lKutMQk/AlQwlgNULaa5VI=;
 b=pODn1w1BBgXqFZuZdQXrXgL0CISMMe7H69BLjKztTbUWphMg+Q66mfBBdwSY5iunhR
 FmFnqaCqwg2RaR2m7JNqqO7jTsj9oat2HLfWYZa8JWanOKqNVOjuUEanuSZS519V+bkM
 Q9n/rNM/9Vc0iyi1IGZIDdyFE0EpJgx1JHih2jr8U7+kGgMvnfkl53HQCJ5K2Px2JfTg
 SRIdfBp5P24ooZecEZzMtMz7L73jvPNBtHH2Nk/xVvAe9NqzNw3hmNcpQi8hZSMBvPFd
 cTyI3Vwtx8aYA+iRXCS8781FnAhIFwUbSUTCvhBymQUvwynYVFvhY3zw5DKrVnmdO2+h
 JXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePUpY57zvg4A0Qc0xpq/0lKutMQk/AlQwlgNULaa5VI=;
 b=t5fKwkvkzsDj+erpXrkNLpBTvfPxN+xUllkV6huIs2BwWQHxilrBqz9/ivFS5jC/g6
 GZYql0RZtzcci9ZVzp98bI0f+3fbYNUHgrqSDDmmS0RCLJjfaWaYUr4WVh1zNkNPBhkQ
 nQnkLjdScNld82HNCG+hsqPxYDPR3C8+28Z2uDMASjoYTxjpnL1/CDqsvfSnFYQENo9O
 in601O889ZvlxoK7HfrlO/ow/mGRHrMvJO5zk/EYAg++xamScf3CBVnPQviq0jMk7mwo
 VRK90QoPYpq4b+vHxghyr1Epdk2DytCAcmRoDGqYn+Nx//4jcESjldciwaJbBZ7SjO/V
 5IQA==
X-Gm-Message-State: AFqh2krAkKia6Q17BFG/Et81mCztau356WJm9scLWDqO32sk1UMy39ib
 b6FFxgg8TETrXcE8CwYFC5zy8HZe8qGFe0vC
X-Google-Smtp-Source: AMrXdXsc//ysHLz1kQO6V1TFAqGsLFRrfVWBnR8h7GOivP5y3Z2mUieYF/naWGik/EJ+ND8fdtzWnQ==
X-Received: by 2002:a5d:61ca:0:b0:28a:4135:d303 with SMTP id
 q10-20020a5d61ca000000b0028a4135d303mr36073650wrv.37.1673519084321; 
 Thu, 12 Jan 2023 02:24:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d20-20020adfa354000000b002bc50ba3d06sm11959200wrb.9.2023.01.12.02.24.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 02:24:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/7] target/arm/sme: Reorg SME access handling in
 handle_msr_i()
Date: Thu, 12 Jan 2023 11:24:30 +0100
Message-Id: <20230112102436.1913-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
References: <20230112102436.1913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/translate-a64.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2ee171f249..35cc851246 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1841,18 +1841,20 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
             goto do_unallocated;
         }
         if (sme_access_check(s)) {
-            bool i = crm & 1;
-            bool changed = false;
+            int old = s->pstate_sm | (s->pstate_za << 1);
+            int new = (crm & 1) * 3;
+            int msk = (crm >> 1) & 3;
 
-            if ((crm & 2) && i != s->pstate_sm) {
-                gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
-                changed = true;
-            }
-            if ((crm & 4) && i != s->pstate_za) {
-                gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
-                changed = true;
-            }
-            if (changed) {
+            if ((old ^ new) & msk) {
+                /* At least one bit changes. */
+                bool i = crm & 1;
+
+                if ((crm & 2) && i != s->pstate_sm) {
+                    gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
+                }
+                if ((crm & 4) && i != s->pstate_za) {
+                    gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
+                }
                 gen_rebuild_hflags(s);
             } else {
                 s->base.is_jmp = DISAS_NEXT;
-- 
2.38.1


