Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AE53DCE7
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 18:14:20 +0200 (CEST)
Received: from localhost ([::1]:34276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxstP-0006Fr-5t
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 12:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxsqH-0004Wg-Ei
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 12:11:07 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxsqD-0000TZ-Hp
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 12:11:03 -0400
Received: by mail-pf1-x42d.google.com with SMTP id u2so10946682pfc.2
 for <qemu-devel@nongnu.org>; Sun, 05 Jun 2022 09:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iqQPbLsPrzF0qGrl4axrKNTY+phxkKEzhj1J8cCkxoQ=;
 b=eX2ihOlpOZu2KHa9CebndWbYptvAxmnxluUuul5a1H+CBTyEj7R5y0Wy33/ky2nlkX
 zZFJ/TZ6evTjSsdXLHzUv6/osP/rPvnYA5ZGO0peiP1tVzNavCfxkMFzbWyX32V2sDKW
 JoKr012LKKcSCEuEroC05m6rV/FvhvSC9ysPLpQ4+ODk6navvTkxZvrA+YVO2luJ7E0t
 vXh9UXt+fBNBWW5yeKXSq/TSn1XrVK+TNxNFX71i0N8817mJnuktX29+2LnGlPdFkTLM
 +9KA4WXtibk+NIhXlGKQtQBIZLKQ/s2kdCl+bayFZ8zw0OQdGtBmwD3JfaLGG0EsyhFx
 VsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iqQPbLsPrzF0qGrl4axrKNTY+phxkKEzhj1J8cCkxoQ=;
 b=u5yqGS54QuEcE6usVfMjTt08u3d4rPx9OOH6rV0wOI432u8aNbrMw7yQ+vPOplERdi
 DO5Cn3yB1NGB68/FTIhzFZCF9kEeLyvlDQLTqTH+YQrFid+PRh91bx6cDnSDMznaWfyD
 wVJdgZRE4JdPC6c7PlQIxRP2EkzFg09DLisa7ctIAq2jdi6RpgFLFxboN7A3wAeeOT1g
 2Vj4Dfr2/HmgWGdG/YvpRosWBlySAX2AtP+XnvMZqCC3tyL9MYJACVdkgRUWJS9mgWQO
 5XDUmVfdrwCbTL4NwS0uGGWezX83x+iyGQGAa9TE+LZodfWdBYI7tOfFju/+ciEDID8D
 U5Zg==
X-Gm-Message-State: AOAM533xQWbUs/50qD5F4JdFtjHk68O9kwo9pXDpwB8D6ZEfdA8+7wzg
 3LnmiTzXNAP1TywI06qntYKHeApzNDWTUw==
X-Google-Smtp-Source: ABdhPJy0sMqKT2fS8zPHBhUCzkraaccYKVBwPXztlqICxeSM1e8iG0oxX5wQakHGSUzVB756yIDeTw==
X-Received: by 2002:a63:4723:0:b0:3fa:c20d:2e26 with SMTP id
 u35-20020a634723000000b003fac20d2e26mr17564033pga.278.1654445460234; 
 Sun, 05 Jun 2022 09:11:00 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3fb8:a3e1:bf34:75a2])
 by smtp.gmail.com with ESMTPSA id
 q133-20020a632a8b000000b003c14af505fesm8932165pgq.22.2022.06.05.09.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 09:10:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: SCR_EL3 bits 4,5 are always res0
Date: Sun,  5 Jun 2022 09:10:55 -0700
Message-Id: <20220605161056.293920-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605161056.293920-1-richard.henderson@linaro.org>
References: <20220605161056.293920-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These bits do not depend on whether or not el1 supports aa32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40da63913c..c262b00c3c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1752,11 +1752,8 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMCPU *cpu = env_archcpu(env);
 
     if (ri->state == ARM_CP_STATE_AA64) {
-        if (arm_feature(env, ARM_FEATURE_AARCH64) &&
-            !cpu_isar_feature(aa64_aa32_el1, cpu)) {
-                value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
-        }
-        valid_mask &= ~SCR_NET;
+        value |= SCR_FW | SCR_AW;      /* RES1 */
+        valid_mask &= ~SCR_NET;        /* RES0 */
 
         if (cpu_isar_feature(aa64_ras, cpu)) {
             valid_mask |= SCR_TERR;
-- 
2.34.1


