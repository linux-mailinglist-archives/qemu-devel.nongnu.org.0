Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E3850487E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 18:55:39 +0200 (CEST)
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng8BW-0002Nz-Pg
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 12:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng87d-0005nI-TX
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:51:37 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng87c-00047q-HH
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:51:37 -0400
Received: by mail-pg1-x52c.google.com with SMTP id k62so8769965pgd.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4DT9edElY61TApLAOMYde3rWycIWqIECbzuIdmTEx4=;
 b=dNjt8l1/DJOBKeNwjnS6wDfjnSdDr1bIsd4qhsCBIwSWYwi+bE37g0OH3DZC+PMTI5
 Fp/i2/vATC0blUZ4tPGZD/o+XneO6ejetAfmNNDMoUcNZPTUHCSOQBiTOdawFTcJJG9J
 yzhJ3zVjllMtxbl2Yzkr3FHg5iokvlvTomBhrq91StfmbzX2bECKmpOaAZrkQT0mzfcn
 9FUqivyGooATyq9UnieX4vA76dicrwhLz9MwirLnxSC3lzv7LgvTa+yP8KQgek3+cUSR
 e6P5g2kaOXEfamF/6BJ7aGdraxFucZlbwVQQWPGxsqYaz3PB4UzJwjjzJyB8QcXTcO2a
 l0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4DT9edElY61TApLAOMYde3rWycIWqIECbzuIdmTEx4=;
 b=paT7O48TrUjyD83QKhW6RHHClXWrb5eu52Hz0PYkJYObmrHDSBqdKiOHucGpgjqgJh
 utR+xpol44VBy4QDMQNeFO7b+CZrhdH3JbnlRav83Jnk/mJ9gRgVnGpSKm7dF1Fr+4Ql
 QNMSKvSBM7j35XJZiYbY/+GMtUWjtD3EsRLLdY3FXXMQh/6cM7NOLYlYldk502GF3mN7
 z5L0nCQY6j/32/8A++le1WKVAqJwZJcPzDjix/5Q90r+NXv/etitjaSdW0m6JpwvSksO
 b/6X8AxfZBqdi371x1FSkoO2N/Q9aU9XS4tIK/ji6hngCBR1FuJx5CAG558x2QgHC4lS
 /+iw==
X-Gm-Message-State: AOAM5301XiA79wxS6Yjqx7vmw9Z2tSLIYg4MPdRQVaj9qqJPBOQ6lxId
 AE2BuB8xKGorqkKjRasOus1mu26EthLHJA==
X-Google-Smtp-Source: ABdhPJxI1yZ7VJJ9Ny+yw56MzRpJnVoIOoxVvWX6/m3PZeubnr5uxEtDqneONexEKuG/2sGSGeD1AQ==
X-Received: by 2002:a63:5163:0:b0:3a9:4e90:6d3d with SMTP id
 r35-20020a635163000000b003a94e906d3dmr3218013pgl.48.1650214295270; 
 Sun, 17 Apr 2022 09:51:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 f3-20020a17090aa78300b001ca7dfab2e4sm10395396pjq.25.2022.04.17.09.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 09:51:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/rx: Swap stack pointers on clrpsw/setpsw
 instruction
Date: Sun, 17 Apr 2022 09:51:30 -0700
Message-Id: <20220417165130.695085-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417165130.695085-1-richard.henderson@linaro.org>
References: <20220417165130.695085-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: i@yvt.jp, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We properly perform this swap in helper_set_psw for MVTC,
but we missed doing so for the CLRPSW/SETPSW of the U bit.

Reported-by: Tomoaki Kawada <i@yvt.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index d8b9ef635c..b34f238790 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2165,7 +2165,12 @@ static inline void clrsetpsw(DisasContext *ctx, int cb, int val)
             ctx->base.is_jmp = DISAS_UPDATE;
             break;
         case PSW_U:
-            tcg_gen_movi_i32(cpu_psw_u, val);
+            if (FIELD_EX32(ctx->tb_flags, PSW, U) != val) {
+                ctx->tb_flags = FIELD_DP32(ctx->tb_flags, PSW, U, val);
+                tcg_gen_movi_i32(cpu_psw_u, val);
+                tcg_gen_mov_i32(val ? cpu_isp : cpu_usp, cpu_sp);
+                tcg_gen_mov_i32(cpu_sp, val ? cpu_usp : cpu_isp);
+            }
             break;
         default:
             qemu_log_mask(LOG_GUEST_ERROR, "Invalid distination %d", cb);
-- 
2.25.1


