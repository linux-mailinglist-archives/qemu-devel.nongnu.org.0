Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1025103DE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:44:34 +0200 (CEST)
Received: from localhost ([::1]:38242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOIj-0005hn-TQ
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5d-0002xF-RW
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5b-0003mv-Me
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:01 -0400
Received: by mail-pf1-x430.google.com with SMTP id bo5so18447976pfb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RvG/ZXY14qN/GxLVgsYoVDV2d6Cg9Hy3tF+gamW3U1s=;
 b=uO1Qc+2a3djRhRyWBUmai4mDONPd11w0vFPiLb5HVlmtizLmQN7Am9oDanuWKZDNrC
 ZcD8sDzeD7KcoBOBnSzfGV0PnQdn+/TwKeW647sHznKBsXtogviLkQc5xcklx5WxB7Gb
 W1OXWlOBDFgdwA1YnCwJPxvH0XdODKi9cuXCiK35cWr/qV5akz9eS5Ht+1NiL97noBXa
 Apoj6P3/UdglaxPxcagEVmUIpw9FYl6j9G0IrbfWz8dm1wcVlz+IgWP7PvMF11IO1PjW
 WenlLjLWP87K2F0syAyYPsdJUq55U8XdxQ8bi89FA0qzhFJSG20F9VFIupe3o6DiY0Gi
 EsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RvG/ZXY14qN/GxLVgsYoVDV2d6Cg9Hy3tF+gamW3U1s=;
 b=bONJwdK8px7InYyJKi807jHrke4VvL/mDl7sPdfxcMtzrLGmnCwUv+M73ayH1aloiG
 Q24HXsDEyPKOL6h2yxzy2p8oYBdcpN87spDYdcGOTn3m+F4qIb5Y8fSDySA2H9Q3eeXs
 XwyOooyeNxwO4CmTUi8SYo1IrnDNq/TsMoUq944uUdopbYThV1f7G5RMV9SL/SAi7qU7
 +8wfvy2nLZd3IAwE4VOJS3bTkKqHJM4NXOSN8qsJM3aoLnJgbLFqtOQKuSDYFyugHWI3
 hZ1XuYZnHUmxOrDuvJUNXcZDkGOt2vil4jvCdO3YRDmO6bewt2fjzrrjwu/dmT/sHMb5
 qF7Q==
X-Gm-Message-State: AOAM532jlNenNQLMRm824tAEA/EN9y3ROx5H32vD2UpeLKBlO0TpVklX
 y8hNHXupFLyvbpRPMIkwncV+XzkqW8zJyw==
X-Google-Smtp-Source: ABdhPJyj6lhBrBlLuojh2v3HrMn+4pIVO96XQQAso3lgQ93K+kC7ZsIl5CtBNxNuELHfiBefdD3smA==
X-Received: by 2002:a63:42c4:0:b0:3a2:b7e5:5077 with SMTP id
 p187-20020a6342c4000000b003a2b7e55077mr20217836pga.427.1650990654979; 
 Tue, 26 Apr 2022 09:30:54 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/47] target/arm: Use tcg_constant in disas_ld_lit
Date: Tue, 26 Apr 2022 09:30:05 -0700
Message-Id: <20220426163043.100432-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index af6844b4b6..1caca38a79 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2778,7 +2778,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_const_i64(s->pc_curr + imm);
+    clean_addr = tcg_constant_i64(s->pc_curr + imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -2788,7 +2788,6 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
                   false, true, rt, iss_sf, false);
     }
-    tcg_temp_free_i64(clean_addr);
 }
 
 /*
-- 
2.34.1


