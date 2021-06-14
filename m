Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1523A5E87
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:47:59 +0200 (CEST)
Received: from localhost ([::1]:37342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiG6-0003PT-0c
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6y-0002YD-Uz
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:24 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6r-0003dA-84
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:24 -0400
Received: by mail-pf1-x435.google.com with SMTP id u18so9998054pfk.11
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/cj6AHfD4MCylW24pA885ZQ85JIZz19VyVMXS+bbqyw=;
 b=YTEBO+1AN83WnP1zP1vnjRN61xfVa6buJ6Rg0vRzWKGZ5swwkuw4NahIyD+AES8j2u
 5okQJjbYcG6IfxMtN5vxu/yBWtQe4u09lFHjkRLJOnPtwm/no4/4DQZjCkr8NZCBaTnB
 IGcLPMsZmyXtgyf5XZk9WRDJmwLj8HSZnWwflS5G27ncYbXYt+nsg0KIY3twE6f1MyVg
 evNgr8BOy2TiSncAP2BuWqnAJ6OJg7kBwd9wDC+Eg0h6syqEP6bPa6ZfM+OTIQl4MfXE
 t0CNs7OMMl9uycPOol3WFxHkeG3WwYzns+7xBQEEcKnKDUoQzN9ZjqJqlbMvxainykro
 vnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/cj6AHfD4MCylW24pA885ZQ85JIZz19VyVMXS+bbqyw=;
 b=dUAbg2V2VLi3h/uok5fVyi1RPFNmKHraORK/sHo7JBCMZtx7m4gwWnrM7z8x2ltXG6
 d+KWj/8mGuyOASCpa295KOsz7wXWhFsOWr4KnqNGhwfrFdVd5zKUv3Y/NWE2HibhQWbL
 RrmZGWew5rd824bVU+L1w8d2xmtj9MLg2OWh32R3W2udZbyM9DW1FwC7ilYi9BfvuZmP
 NAn6SENRZ7k+uQWBHuvwZ99HNdrvbQ4iWU3RsfWEbAqRP0J8UEz1jmSPDhh96Oypttee
 QJt3glOXDtWfvTEpdY4BCALEuJDD4Im67fIfBv4f5u0/vgF9JyMaK0vzRWuh9HB8oH3k
 tNrw==
X-Gm-Message-State: AOAM5300w9q5lqOx3T8FC1sTjW13FEj8HIc0YJGFy1ML/ajgV8EpRKYt
 Wr8bR3wuoFIMfbaGK3WnDcKsq/xM1LZxWA==
X-Google-Smtp-Source: ABdhPJyoXJgMpeXGCglYBMADxJKmQARt9uTERhc73qjmq5EF2Jx2ZcoWWsRxfVmGYf8/Er08At8pHw==
X-Received: by 2002:a63:5645:: with SMTP id g5mr16064027pgm.442.1623659895300; 
 Mon, 14 Jun 2021 01:38:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/28] target/i386: Improve bswap translation
Date: Mon, 14 Jun 2021 01:37:55 -0700
Message-Id: <20210614083800.1166166-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a break instead of an ifdefed else.
There's no need to move the values through s->T0.
Remove TCG_BSWAP_IZ and the preceding zero-extension.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
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


