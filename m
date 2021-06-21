Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1863AF973
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:34:38 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTR7-0002My-IG
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC9-00018x-V2
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:09 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC7-00062T-Em
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:09 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so472513pjb.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxQeR//xqY+LsX6pm6SBoWME/fdGKFQJm9ucGcJi4j0=;
 b=O8S6lHvnRio7OIyE3Bc0jy4yKxcZv+B+jczpN85+BHP8JzO0LuubOKsUERIfo91m0x
 CRv+zdehapRUwTIfS5p0n0AqIFtuKnyhn/WWoUebO+zg9VzVqx3IDTxGhtzHJuVSJpHs
 mTUVR8ZebJuH4PFNl6fhKkqyWmpxB9cEcWeJyBZUusVyKbSKnyAKHM06d9m4LfI6H8Lj
 Xo/Vea83d19eX2E3ZSd7crEckPnD+HqpyrfSJ5LSzvthJTo3Jp++6X8tgJRcZZ8LR1iG
 U8uNZkSrgiY1pl+w3VXfxRFvp+JPceTqz40bykpka6MkGn7WBL7MLHfRVoWs57DugDx9
 2iwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxQeR//xqY+LsX6pm6SBoWME/fdGKFQJm9ucGcJi4j0=;
 b=qkHo4bi5JDgiky3dFMns/B2nxkXISSbtevdcZZ036LvP8Kh8jwnlycSdZdf4pg4OXU
 a65hPex8KzsX4oKD0304uMmSSCPLK5PFhPNmFfTKzIZ2m4UOdggJX4Emayju572TMgc/
 wksxjwY0zvHNMV8EHsTFinB7XjB0QKP3Wwck+YxaVXmI/yQz8wVYEYoBQzU0Ay4OrKLd
 M4I1tmMCkbRu+4DtDhuvOZZNvXf97FNa7pNUHUZ0gpltkvg7ecIDygUiCsnCYslGhuxN
 pHH9htfWsNElAwBgumJ1iBTifnqLQJLpGi5d0MDzBzn4Yx8MBJmJpPAkMseP1YdP8jj+
 Mw1g==
X-Gm-Message-State: AOAM532iNIuIRzByHlBW77cYaajEvPdUhCw0/cB1y6s9Q72ajzKAAQC8
 NNw8njDVS0w8TQdOC43XyIOXZpoC9orAjg==
X-Google-Smtp-Source: ABdhPJy2lFF2tTCenOHErBgKy8OMOg7djp/v0Makt+nJUb7I7b0EHzuRDK1FPOOL7KvV6v+xwW0znQ==
X-Received: by 2002:a17:90b:4b04:: with SMTP id
 lx4mr684260pjb.54.1624317546186; 
 Mon, 21 Jun 2021 16:19:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/29] target/i386: Improve bswap translation
Date: Mon, 21 Jun 2021 16:18:44 -0700
Message-Id: <20210621231849.1871164-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a break instead of an ifdefed else.
There's no need to move the values through s->T0.
Remove TCG_BSWAP_IZ and the preceding zero-extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e8a9dcd21a..b21873ed23 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7195,17 +7195,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         reg = (b & 7) | REX_B(s);
 #ifdef TARGET_X86_64
         if (dflag == MO_64) {
-            gen_op_mov_v_reg(s, MO_64, s->T0, reg);
-            tcg_gen_bswap64_i64(s->T0, s->T0);
-            gen_op_mov_reg_v(s, MO_64, reg, s->T0);
-        } else
-#endif
-        {
-            gen_op_mov_v_reg(s, MO_32, s->T0, reg);
-            tcg_gen_ext32u_tl(s->T0, s->T0);
-            tcg_gen_bswap32_tl(s->T0, s->T0, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-            gen_op_mov_reg_v(s, MO_32, reg, s->T0);
+            tcg_gen_bswap64_i64(cpu_regs[reg], cpu_regs[reg]);
+            break;
         }
+#endif
+        tcg_gen_bswap32_tl(cpu_regs[reg], cpu_regs[reg], TCG_BSWAP_OZ);
         break;
     case 0xd6: /* salc */
         if (CODE64(s))
-- 
2.25.1


