Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0658A6AF0F3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:37:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9l-0003nj-2Y; Tue, 07 Mar 2023 13:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9j-0003mJ-4c
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:23 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9g-0007iZ-VP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:22 -0500
Received: by mail-pj1-x102f.google.com with SMTP id bo22so14125703pjb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZdTBDl9nXXjMgu9i8Non2f0+ozz7fi4hp6Tet75Z0Y8=;
 b=g3A4JmRiOVNhK5YMW1Jja+R2QjcLfEUH9yoi7aMbX1t7LNuXsMVy37EXyt1V5KtGdm
 ERBw7uEKqyMqBEfZrH7+lXBZRt11OwchOF2zKgFbXtfOyzFdI5PAWFEHH03UWlvt93Vj
 ycUxReKvkDogIZ9hY/ASs4U72Si9r4ohVlGPdqwdvzWZjNXSLKLcHNsFY+5pvEB7xvGE
 hbmWYVA9T+3hCUCQf2LQqnoRuNNh8UKQ/v982A/357LzVIVPPdQrO77WWcvNqyQd+RZ0
 gIXM1UsKLVwTWxwEAO+wqm8NDIWmtJvLjz6COsmNh9Tbw/Nv3RdxR3ipgz0GcE7saN1w
 wRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZdTBDl9nXXjMgu9i8Non2f0+ozz7fi4hp6Tet75Z0Y8=;
 b=uHCbo3W5CPS/YGRvvub+8CZZE9lAVNLZzGcbKrY9AvaqzkMAQSGs+bfgA0wvYefha8
 y7EMKyAvXO9tCqtb1trvyId56FocAbTEMaK20G8IkiB6JLGAzrwO5Ji4AF3M9j77LxAf
 mHZUh+Jrfh3QxUo+o3qtpnKITTVcIAClHt+Fh4tdncZGVjXekxfCosRn3rwvxQJ1cDGb
 KEQzDraqpzMDvuR0smmC7R6FKtXbKdH5lHdLvyOIJBbf5FrUK086iOJ/iZY/BpDqohJ4
 LMjZ9mOEfWOzUsdpkSlkCD/xXiRcU5KFxz1lc5Jjfwz0SKywZrzmR9hbTDzXI/I6SyBi
 B6/A==
X-Gm-Message-State: AO0yUKWz/pwJH+FmvWBZvzCf7tWPmBwtNZJKGU6yF1NO5BiUKT777AQ4
 gcM08HnyFMlSGyZHN26mAI7lXBJ56Ey83/mHdig=
X-Google-Smtp-Source: AK7set9RazxNslduZEPL/piThM83M12OfuoUt1zBJCeyNd9gfSs91g/myw1OupfyavLE60w9SyimDA==
X-Received: by 2002:a17:90b:3e89:b0:237:8617:b5a4 with SMTP id
 rj9-20020a17090b3e8900b002378617b5a4mr15413201pjb.21.1678214120252; 
 Tue, 07 Mar 2023 10:35:20 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 20/25] target/ppc: Rewrite trans_ADDG6S
Date: Tue,  7 Mar 2023 10:34:58 -0800
Message-Id: <20230307183503.2512684-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Compute all carry bits in parallel instead of a loop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
---
 target/ppc/translate/fixedpoint-impl.c.inc | 44 +++++++++++-----------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 20ea484c3d..02d86b77a8 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -484,33 +484,35 @@ static bool trans_PEXTD(DisasContext *ctx, arg_X *a)
 
 static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
 {
-    const uint64_t carry_bits = 0x1111111111111111ULL;
-    TCGv t0, t1, carry, zero = tcg_constant_tl(0);
+    const target_ulong carry_bits = (target_ulong)-1 / 0xf;
+    TCGv in1, in2, carryl, carryh, tmp;
+    TCGv zero = tcg_constant_tl(0);
 
     REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
 
-    t0 = tcg_temp_new();
-    t1 = tcg_const_tl(0);
-    carry = tcg_const_tl(0);
+    in1 = cpu_gpr[a->ra];
+    in2 = cpu_gpr[a->rb];
+    tmp = tcg_temp_new();
+    carryl = tcg_temp_new();
+    carryh = tcg_temp_new();
 
-    for (int i = 0; i < 16; i++) {
-        tcg_gen_shri_tl(t0, cpu_gpr[a->ra], i * 4);
-        tcg_gen_andi_tl(t0, t0, 0xf);
-        tcg_gen_add_tl(t1, t1, t0);
+    /* Addition with carry. */
+    tcg_gen_add2_tl(carryl, carryh, in1, zero, in2, zero);
+    /* Addition without carry. */
+    tcg_gen_xor_tl(tmp, in1, in2);
+    /* Difference between the two is carry in to each bit. */
+    tcg_gen_xor_tl(carryl, carryl, tmp);
 
-        tcg_gen_shri_tl(t0, cpu_gpr[a->rb], i * 4);
-        tcg_gen_andi_tl(t0, t0, 0xf);
-        tcg_gen_add_tl(t1, t1, t0);
+    /*
+     * The carry-out that we're looking for is the carry-in to
+     * the next nibble.  Shift the double-word down one nibble,
+     * which puts all of the bits back into one word.
+     */
+    tcg_gen_extract2_tl(carryl, carryl, carryh, 4);
 
-        tcg_gen_andi_tl(t1, t1, 0x10);
-        tcg_gen_setcond_tl(TCG_COND_NE, t1, t1, zero);
-
-        tcg_gen_shli_tl(t0, t1, i * 4);
-        tcg_gen_or_tl(carry, carry, t0);
-    }
-
-    tcg_gen_xori_tl(carry, carry, (target_long)carry_bits);
-    tcg_gen_muli_tl(cpu_gpr[a->rt], carry, 6);
+    /* Invert, isolate the carry bits, and produce 6's. */
+    tcg_gen_andc_tl(carryl, tcg_constant_tl(carry_bits), carryl);
+    tcg_gen_muli_tl(cpu_gpr[a->rt], carryl, 6);
     return true;
 }
 
-- 
2.34.1


