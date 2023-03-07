Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF246AF0EF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:37:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9l-0003o5-Mt; Tue, 07 Mar 2023 13:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9j-0003mz-MP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:23 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9h-0007nq-U7
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:23 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so17432236pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GrumRIwdVV1Jr8GCRA+MA8lhjBsXMqt+Zj+Dif4zEFE=;
 b=I/XFRR2tDNSGqeRNJhUx2b1vKxcet3+Kbn0D0IqFfArsCAJeFWOsRBC1PSuXtbSw5G
 iaSn5C5Wog8XFrhTqMkIa4ju2Kw0RWBLAPO5xJpk3Rwpx1Zmij7FKGZTvyS+MQFGb6nH
 vH0vNPeFHRHwfo/wpf4l5wUk3FgiJ5OLSybGy3d+g8gOfPs5RtBXe1YV/ahw5FL0M+km
 AE5QqVduIaQdpM9DHeBV0vDTvyJVRDtfd9eHbT6ziVSh5g0SXohdMPbzE3E1m4wVOMiv
 lQhbOSLi303XwXebYWgqmKmrtKiW2D8Ud1xeCe+klLfwwE6blMUz0jrnt58joCtOoQyV
 HYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GrumRIwdVV1Jr8GCRA+MA8lhjBsXMqt+Zj+Dif4zEFE=;
 b=LIA5lyu72UoyktRo5ZZHrbWGZ6mRLBfl4g9SJxP0V7m00+cK2s0p6akDSnSsLR6J2Z
 pifHNR2FyeJWLOsjdpMhSO3Y5SEyjY+vtlmBStAT8Ps+WTXcAYv+GSuhYrm71Kr2Es+c
 dTXqTMCyr7g1PiN016Om4uwMg4CXRhTjUhxWGeHgX2mFSb3UVYI/RAsIwisgWzL/f6zu
 dY4/uOqd7/f9jSGcj5F6VOSv6WjA3KqF/xwurvuw3UALfgwpyLWP8Fbn4VsGnwmhfNga
 Nf6KyUhQBPcpf/RHeF1Rkf+GY4EbepqVXkJOOT0PttdARfDYHDl/rHXSpYhzT8Dtnl+g
 0t/g==
X-Gm-Message-State: AO0yUKU92ulvQyEBKRFHe2PMclQTEEtYSiQLRKDmk/AjP6V87HqedwFU
 L7NlB7+1bpeNe+pPn/N7LkQLdKULICAEBK24KuM=
X-Google-Smtp-Source: AK7set/rjM4QdhZwV0zyiS0qx4HVIGury/jnrtVwOO2g1kQW3IRQOyG8ZaVZmG4/zb++v+oZgIjewA==
X-Received: by 2002:a17:90b:388f:b0:23a:63:6d37 with SMTP id
 mu15-20020a17090b388f00b0023a00636d37mr15836598pjb.6.1678214121171; 
 Tue, 07 Mar 2023 10:35:21 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 21/25] target/ppc: Fix gen_tlbsx_booke206
Date: Tue,  7 Mar 2023 10:34:59 -0800
Message-Id: <20230307183503.2512684-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Fix incorrect read from rD.
Avoid adding 0 when rA == 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
---
 target/ppc/translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index df324fc7ff..7ec940b7d8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5875,12 +5875,10 @@ static void gen_tlbsx_booke206(DisasContext *ctx)
     CHK_SV(ctx);
     if (rA(ctx->opcode)) {
         t0 = tcg_temp_new();
-        tcg_gen_mov_tl(t0, cpu_gpr[rD(ctx->opcode)]);
+        tcg_gen_add_tl(t0, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)]);
     } else {
-        t0 = tcg_const_tl(0);
+        t0 = cpu_gpr[rB(ctx->opcode)];
     }
-
-    tcg_gen_add_tl(t0, t0, cpu_gpr[rB(ctx->opcode)]);
     gen_helper_booke206_tlbsx(cpu_env, t0);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
-- 
2.34.1


