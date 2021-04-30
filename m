Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579FD36F39F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:27:39 +0200 (CEST)
Received: from localhost ([::1]:56496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHwQ-0004hu-EI
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlM-00032F-IP
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:12 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl5-0007Xx-Cy
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:12 -0400
Received: by mail-pl1-x62f.google.com with SMTP id h20so35744321plr.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vI0Nppr/jR9QkJKg+7QUG9KyH4vg0w2u1KFcbBuivD8=;
 b=ddO2zIGSTDY2L38kz6bmQjJ8II9lUr0kvFNDZifC2aw0jUrXzQ/6Q780qJWR8QspF8
 2yiQx7fOkLU+4dsFMzZYurJ3ijeamgHooBJZ9PZwm1Zpsxg6Z1YKM4LuPo/iXRkgi3vu
 PPATHWPGi8Gnwj7eo1BadznYkD+es6urumz2AEx1LQzoRAj3+//2+QqnqVlvO+on6Vsb
 gxPUsTU9Bqg+HAiMMZy4jYiO+TS2BO8VyXizXKZeT6YGPGWf4ZvgYO2JZZDsCOZPjaEy
 1msLtDMTKxQmxwa2PNm5Gf1tcqpL+fI1O1tOx7uA0L6OM3vhBZvFarn7K5z4FHM0R6fw
 wPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vI0Nppr/jR9QkJKg+7QUG9KyH4vg0w2u1KFcbBuivD8=;
 b=QapqwenRi0ulzDIQ8C5fkb9FX7+A8l6dm6Bfz82kFgyDCMJFKwXci+Z7FKQvgR1+NW
 ueXM1MBSoJv2IPAP3EoByOES6jQOm6HFboWbrSFET6O9Wg4G8wB9/46kVseNq9FKuVzD
 7SUJzQwArZig0IXLz8/W5CfOXKFCexMccNYqgjyHVWZh/qinSIO7m4ulhLooRPjXKkl/
 7rgnre367RWCboM5tBLoWlYOZcVgb2O52lViEcloVSjtVNBS06D7YD3HZ/sSmy1fSwDj
 dQF2tU3s6dZL7TSmb6SfEUV2Tr4vDt3r+vP4YjHK171QzImdem+MNhxwtXQnv4GpATFC
 lTuw==
X-Gm-Message-State: AOAM533MaVYq5x0CJsw6v2ctSlruW6kD0sNfaY3ep/tZZYOTC7tRSpas
 ijbjkVdkPCX/yMmH0A1pR/JfRPylXA5wKw==
X-Google-Smtp-Source: ABdhPJxF/54s/5+ntEqkIfOj5FI/VsBrHIW5Y+1GjM43fr1cocWj37c8kPaPAAZrAD8m2JwR3GLEmw==
X-Received: by 2002:a17:90b:4b12:: with SMTP id
 lx18mr2662667pjb.45.1619745353251; 
 Thu, 29 Apr 2021 18:15:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/30] target/ppc: Remove unnecessary gen_io_end calls
Date: Thu, 29 Apr 2021 18:15:26 -0700
Message-Id: <20210430011543.1017113-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since ba3e7926691ed33, we switched the implementation of icount
to always reset can_do_io at the start of the following TB.
Most of them were removed in 9e9b10c64911, but some were missed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate_init.c.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index c03a7c4f52..99e5f52925 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -213,7 +213,6 @@ static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
     }
     gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
@@ -225,7 +224,6 @@ static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
     }
     gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
@@ -250,7 +248,6 @@ static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
@@ -262,7 +259,6 @@ static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
@@ -311,7 +307,6 @@ static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
     }
     gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
@@ -323,7 +318,6 @@ static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_end();
         gen_stop_exception(ctx);
     }
 }
-- 
2.25.1


