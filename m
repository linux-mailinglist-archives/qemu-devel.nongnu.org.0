Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ECD36FBC5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:51:23 +0200 (CEST)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTY9-0006Ue-Sv
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBc-0005wO-HO
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBP-0003wP-7w
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id x5so20319393wrv.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IDION3oXJpT5OR6Bra+r6895wXbZrL9XVbTtZK09BTQ=;
 b=w95xCK3BWx+Ez9ZZdIk7ggs0RxVMS/d4WRLv7DiDwBNdwMCitMVUYvDfYop4jadI1o
 KmaJWtsCtHZhM4QrwYrTtBbR1k42Rmq0wKbGMPCqsByPViE7VnYIIRpSYyUTIKyBoYxd
 MBTjl7s0TEJF8f8nTyhHBfPg7WQMB1Tx35rhPT6N+rXTJ6MILea4EhVD62DdxfGJ5M1d
 ybmNgpUS73acsWsbQGFXrgUCptrGY+HmL6OqPs/Av9Mb3FbSSWS8czIcijxEnglhEdk0
 Y8PAXC5VO6fik7FvKvUD4UsxayXI9P/8PXl+D6SvGDTyToyxAOaZqkqCrrwaFyhzNP+e
 IgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IDION3oXJpT5OR6Bra+r6895wXbZrL9XVbTtZK09BTQ=;
 b=XdkOL3CI935SviexlpfhgrpTX3pfJhcUc/8VAF4IdsRjxCxbnhXqSDv7LFtuhDnea3
 hGmx95mUtaLqyxxtiucU+jsiMNhQdEB8VK5xNOHotmkOoKVseFb+lPAiteNAp6/c0YmZ
 ENaMkucDHvclv5G90CnbhvSswFIpgBGynlHxfePWI8YU8EO+0H7oYE0nJfJwHsLTxu61
 Jfe0b2gyVFse1k314BSZkEssvNd2WZ9S7lRp3AIS7gvZBc2U+auNnLkppbLMjaquWnrv
 ZNAG4J/tSDurcAgcvv0oERFn0LQvqAPSr7rh7YFQsu4dJ52z68kOWutQ6F4IoPWlJgaY
 jRaA==
X-Gm-Message-State: AOAM533dN9RK9AOMoXAr9LvO9TiMgeaBWKxCZ05+bFrOl3d+aPybmlH5
 aSNubXLnQEAkx6xFdgfx6kJOVKWGp9C8Mfyf
X-Google-Smtp-Source: ABdhPJzvwLM9v45nsBlehabYjrKPA2zv4JCxMhuRDnl6xb+FkXMDO9ZOYowXPKlf9sRapMinFtUnmQ==
X-Received: by 2002:adf:fc46:: with SMTP id e6mr6855949wrs.169.1619789270059; 
 Fri, 30 Apr 2021 06:27:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm2420349wrx.15.2021.04.30.06.27.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:27:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/13] target/arm: Move vfp_reg_ptr() to
 translate-neon.c.inc
Date: Fri, 30 Apr 2021 14:27:36 +0100
Message-Id: <20210430132740.10391-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430132740.10391-1-peter.maydell@linaro.org>
References: <20210430132740.10391-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function vfp_reg_ptr() is used only in translate-neon.c.inc;
move it there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c          | 7 -------
 target/arm/translate-neon.c.inc | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6aec494e81d..095b5c509e1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1215,13 +1215,6 @@ void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
     }
 }
 
-static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
-{
-    TCGv_ptr ret = tcg_temp_new_ptr();
-    tcg_gen_addi_ptr(ret, cpu_env, vfp_reg_offset(dp, reg));
-    return ret;
-}
-
 #define ARM_CP_RW_BIT   (1 << 20)
 
 /* Include the Neon decoder */
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index a02b8369a1d..73bf376ed32 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -60,6 +60,13 @@ static inline int neon_3same_fp_size(DisasContext *s, int x)
 #include "decode-neon-ls.c.inc"
 #include "decode-neon-shared.c.inc"
 
+static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ret, cpu_env, vfp_reg_offset(dp, reg));
+    return ret;
+}
+
 static void neon_load_element(TCGv_i32 var, int reg, int ele, MemOp mop)
 {
     long offset = neon_element_offset(reg, ele, mop & MO_SIZE);
-- 
2.20.1


