Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B79D420A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 16:03:04 +0200 (CEST)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIvVW-0003vo-Hf
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 10:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJI-0005zD-LY
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:50:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJH-00045k-It
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:50:24 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:40344)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJH-00045V-FQ
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:50:23 -0400
Received: by mail-yb1-xb42.google.com with SMTP id s7so3116658ybq.7
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 06:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PbD/qSofe9qS2Crqciyp9o1Gyg/ozYNCw40WhU0Rn+Y=;
 b=fXc73B8+k/nq6C0jV0T+9RDjmtZwkSaAJcevw8T9qek2cPT7phWzjgu3x3ojXxeHpT
 8vN9UMJC1TqRKKSvbsvN2FZCgpcJl9fXvTUfoaxxCTV+/GzYdAP57bbwryHLZi2rhhG2
 PPlT+mAqQcY2t7mGVenTGow044yRhNUxtBheGETiYPlmptVmt2Ljbh/tOAE46SqAy5fy
 uzxAVIVbjDXRjnyrXXvvXmKxLlPiHH3JzR8mjcA/yPidE5lzn5IR3Hp6C/k2HiPg4x2t
 ShoHMfZrYcbopFmDtyFtKnakdF00aH3gbdUzMNgYbiJ/oK2jqH+CmaOUjucI0AGcNSf9
 HBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PbD/qSofe9qS2Crqciyp9o1Gyg/ozYNCw40WhU0Rn+Y=;
 b=QW4oUi24ah9yE8hrRt3qe7xssMfFlsJmjbGX/kVh41tiqrdTHMzoLG7OBfQv6S08eG
 HZlcrvnFyDlRm4Z9L0cQBFkVQJIB7eDexgAqxviWn4UF7Ys9djYj6xaEjT26I9vBdDYJ
 zqcbaXIDqxhOdEa9QEaxzAj5MarUg8OG1QGK3+Q4TQ2hiEMt8xkzHFnK0okAgbjn9+n/
 L6GgHoUf7cdaqypmHX78W2wJ6x+toZRJzFKCozfH/nth5nb4b5FlsZcqfcnQt0H+gRc4
 vwZ4X5ywULEIOLAv8dhYlUvQTaSoi5PCNczWUvA08lHokoPWWfB3rrsqWv7AHS1cHinD
 MJFA==
X-Gm-Message-State: APjAAAX69f0EyEfIyNSCfUV2eZncy2QQ2JKebPQXW9h0k1sxPkEQOXaE
 t2vOJjHP2RvHoRz8mBLstyK1eAAcE90=
X-Google-Smtp-Source: APXvYqyvTlcDlz5fevtX6aeigzmRhP6YNPSaIjEoalEDjfWJPRaEYxxFRSrfUG8sH27fn8OWZOyUtA==
X-Received: by 2002:a25:770b:: with SMTP id s11mr10337635ybc.373.1570801822605; 
 Fri, 11 Oct 2019 06:50:22 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/22] target/arm: Clean address for DC ZVA
Date: Fri, 11 Oct 2019 09:47:37 -0400
Message-Id: <20191011134744.2477-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This data access was forgotten in the previous patch.

Fixes: 3a471103ac1823ba
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4e049bb4aa..49817b96ae 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1766,7 +1766,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
-        tcg_rt = cpu_reg(s, rt);
+        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
     default:
-- 
2.17.1


