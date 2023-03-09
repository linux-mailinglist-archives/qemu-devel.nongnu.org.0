Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D926B2E7B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:20:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMe8-0000u2-NX; Thu, 09 Mar 2023 15:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdl-0000XY-HE
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:31 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdb-0002HA-8u
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:21 -0500
Received: by mail-pl1-x633.google.com with SMTP id i5so3244897pla.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HBKC1RNF4/gcOcepwXGVOuznTSN/Smr1U9+VOTgmlwA=;
 b=KiQ0Rwm0DvLLI+FMWjRStVjHGXb14GOvS+KZfFCWftMmyK6a+VEemVcZxG850C/aRC
 0MOZn3/Dy0itD3w7tb3+gqTohVCoOFgvgySKzVSZEjKKq/4uFqWyyaIDCxm7Xe0aFT/t
 5uQx1XHC2/Rzx1JfkPfozhhGi1FKXlHRGmGrLAaQdF6UVJWB247y1OEKame2D/qM9jbH
 rA0HlwkPwQErgsqMbUGq0kcCGkIcHgl4Cli7CY34RIMGT3sxN1vNPw/BUMRklAPHsbGH
 hbW+kfF5Os3VvR5l3rFvsNaqHER7+S2YDRbyEGbWbRdKl7FtySw8Y2lTyucLHywD5g19
 kt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HBKC1RNF4/gcOcepwXGVOuznTSN/Smr1U9+VOTgmlwA=;
 b=Yrk4zVIqkoWaqc0bsDnf+uWcPISk1Xo7nbTGCxzQdXaUdrV/57BuOCVEoST9Qw0SIu
 VZktHxIulLgPUhkpUnI0yGcRPv6XTzX9bzt5br71C8svD5D/+VYvv/TWSLoxNMTHb+r/
 lTMSxE51L4sfaqqs5fDPYA7qsCzAyrUvqNNHRequPz4J2C9uhHRT5BVCULXdjtfvfC30
 GMyl/WmFQxhzhIxzGU/gKk5AiaoeCqyslI5vjcMXi2hyBtiT9vRM9yV+jZji6cJoZM97
 31a5Nq5+TIJqahfFNyRF7AHFRMYNoTebVWE/lqjlUp+W3pl7605HQfKYpE0JwhB8MwC8
 U01w==
X-Gm-Message-State: AO0yUKWvCx/2FYB8IJ9mPZoISBeZsZw7d7wV7QJHADNI8bY+M6vWARCt
 6sQVIAICHxHnusbEb0uKXB3FYg5aTV90I48u7xE=
X-Google-Smtp-Source: AK7set831aj+pANafscon3YTeQC0y/4N10ymbI0LnKuGTpbdNBjXwaOfFjBYvXA6SAUv+O1O60FZYQ==
X-Received: by 2002:a05:6a20:918c:b0:cc:f214:2f33 with SMTP id
 v12-20020a056a20918c00b000ccf2142f33mr23476995pzd.24.1678392789436; 
 Thu, 09 Mar 2023 12:13:09 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 85/91] target/ppc: Avoid tcg_const_* in power8-pmu-regs.c.inc
Date: Thu,  9 Mar 2023 12:05:44 -0800
Message-Id: <20230309200550.3878088-86-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

All uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/power8-pmu-regs.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index 42f2cd04a1..d900e13cad 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -177,7 +177,7 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
 
 void spr_read_PMC(DisasContext *ctx, int gprn, int sprn)
 {
-    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+    TCGv_i32 t_sprn = tcg_constant_i32(sprn);
 
     gen_icount_io_start(ctx);
     gen_helper_read_pmc(cpu_gpr[gprn], cpu_env, t_sprn);
@@ -210,7 +210,7 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
 
 void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+    TCGv_i32 t_sprn = tcg_constant_i32(sprn);
 
     gen_icount_io_start(ctx);
     gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
-- 
2.34.1


