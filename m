Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9833B790B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 22:03:26 +0200 (CEST)
Received: from localhost ([::1]:44270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJx7-00075t-Fu
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 16:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwi-0004Eq-TT
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:57 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwN-000319-4s
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:56 -0400
Received: by mail-pf1-x429.google.com with SMTP id c5so98436pfv.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZ+vu44B3MA2rQDPHlYV5+XUBqzkPAnWuZi1J6wYDao=;
 b=rvyU8OjpPX4X/aVIwFeQqNdHSgafL6hYrbmAE6RWeXr9WevwvbPyz256JA9V1MmuSs
 G71H33uxFPm+QayrxepfWhTPdfnHfdR8HWVCrWwK5g6MGNEfDp0TQFxRoRPwGHS+R2Z2
 N8LC54CZlmc/D9KBc93ay8FUfvZorAGIySUnwc/vvBntatlxB7Ic/FEpay+6lmArqVLp
 wSU7PjAj7njf/dQL6qVF5T/zdBrBHYKPT3foAHkh9TYyYYtFJePhVMD0tFBl5dsfbcyU
 Bo6DxBPg01C2YktQuG5jMGyNrbziIMbE21XerqtFLmsJCam4mp+8tyop94+NSBeWnPWO
 U9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZ+vu44B3MA2rQDPHlYV5+XUBqzkPAnWuZi1J6wYDao=;
 b=nAKYs+iQJVPOEB3iZmdG6ICgGKSyWIrWtYIL7qYOJd+BplDQebXyWTFNn+OlWKXqJj
 Nqb8iYErlTa2aKw/fiYyFeCdeciXZdXvGgre64TeQYcDOgiuC2fJkkT8j3aq529PM8gX
 AlXTsf3LD10jSe/78cOCnPFwZGwkf2AvFoObtgYcnYxTAdPENnodCxr/FhRFBtpaCe79
 P9X4AlNBEWlrbrneEMygUzLGkN516zdlSAmLX5X+83CGFBo5SUMhsWsGPDKL1aCPd4/8
 yrFGmmbDFhBayDkgh/yLZlxi0dgLIbY3URDNzp9uISGbWwZ5BIGIHjPP94x+FmYb2WNX
 XplA==
X-Gm-Message-State: AOAM53244x9O2dbro2ECZTq1cqWmpviLY5Dggb2YnZlyJY5D2uWfs3PA
 Gep3beV8Bba93jks/+9glH36sxspedjtZw==
X-Google-Smtp-Source: ABdhPJxFGOPAy9nTn8y1W0TRLiNriLGkQfkPmYfz76FNAmldiqNsag4YyifLDP8xHosbcHfvNVjozA==
X-Received: by 2002:a63:6781:: with SMTP id
 b123mr25280686pgc.397.1624993113980; 
 Tue, 29 Jun 2021 11:58:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 55/63] target/arm: Improve REV32
Date: Tue, 29 Jun 2021 11:54:47 -0700
Message-Id: <20210629185455.3131172-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

For the sf version, we are performing two 32-bit bswaps
in either half of the register.  This is equivalent to
performing one 64-bit bswap followed by a rotate.

For the non-sf version, we can remove TCG_BSWAP_IZ
and the preceding zero-extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f2641a37ba..304fd3d370 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5430,22 +5430,13 @@ static void handle_rev32(DisasContext *s, unsigned int sf,
                          unsigned int rn, unsigned int rd)
 {
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
+    TCGv_i64 tcg_rn = cpu_reg(s, rn);
 
     if (sf) {
-        TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-        TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-
-        /* bswap32_i64 requires zero high word */
-        tcg_gen_ext32u_i64(tcg_tmp, tcg_rn);
-        tcg_gen_bswap32_i64(tcg_rd, tcg_tmp, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        tcg_gen_concat32_i64(tcg_rd, tcg_rd, tcg_tmp);
-
-        tcg_temp_free_i64(tcg_tmp);
+        tcg_gen_bswap64_i64(tcg_rd, tcg_rn);
+        tcg_gen_rotri_i64(tcg_rd, tcg_rd, 32);
     } else {
-        tcg_gen_ext32u_i64(tcg_rd, cpu_reg(s, rn));
-        tcg_gen_bswap32_i64(tcg_rd, tcg_rd, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+        tcg_gen_bswap32_i64(tcg_rd, tcg_rn, TCG_BSWAP_OZ);
     }
 }
 
-- 
2.25.1


