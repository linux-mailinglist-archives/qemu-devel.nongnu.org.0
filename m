Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237036AF0EC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:37:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9l-0003nh-31; Tue, 07 Mar 2023 13:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9i-0003lT-90
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:22 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9g-0007qE-MA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:22 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so2129124pjb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzyJzA22uKXasXpBwzGrbKyMSGaVktQVzvYxO4YCmRY=;
 b=hBlPTyq4zC2+gmIlJj8HfszcqrVQS0oA6t2kSBsquddhHWQqqunJyRdR9IXx1RFhkR
 OJ55dV/CEGU+2uiOah+lu2+s7RMgb88sqxUanTOJTTdT9hrU8t90nDkfnJ3GaEJ9DWqv
 QW3aLdy4KCNKAGt8MqngOmLAJcwbCWwl3cQK/zIFCKCdIyVlM+DLRSTWETAAqVOGvSC9
 lcOOgR0YkWmB7izep3ATWfdHyeo3wzEK7D9rFmBPvqWJPyyFHGymsizVWKKMRUB03eRI
 MvrSJVj5AaQi9oSuiE4W/NI4N6y4ScOVJd5ba29YDjeg83+4O8fGm+bDq56eYqbPXDCd
 2MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzyJzA22uKXasXpBwzGrbKyMSGaVktQVzvYxO4YCmRY=;
 b=XECSkm3W0jQtJGNMDPFNYyKQegX2POFGfa7OpQxXHMU7stjaP4cwwINBASbnBCVTGF
 hW4ZuaWDhKsKKZubEI+xWaIXuMFBLAbez7oTXn8JuZ/iw87uK61RyN8i/ekXYVkQH5pM
 d/xR2EHMRBGo2vmxzNrnFp3zfyaYpbrxUHPpzOhRYhbVqNB7w63twjqtPNmDznvnEX3H
 PV4KLiy/XDNqa7md2GleU/nfjBs7MUgMdq80vZ5C7mgCswNXH1CVTdK2tkbbpKixHs/S
 q5oJHzGRVu+HV+CUHmLPv29vmzKir4eQoj9DkslyAWa9g1aZjl9a9Zc5CjJ5ZCF3Dw6Y
 zSwQ==
X-Gm-Message-State: AO0yUKVwZLOIpEGny1ae+1CtT1wJxHx8aiHQN5Jxqi9iv4hQf2ViTXpa
 W3952MXWUoK0jQWgF8hqKP+u0d6pw5YIA3CgrGk=
X-Google-Smtp-Source: AK7set8bz6Pqf+wNBlIsbxFtZbGvr18rNWb6kTtQYrYior1P6JKKBl7tdwAcfSK+WRilNXSe3lhLEg==
X-Received: by 2002:a17:90b:4c85:b0:234:b23:ead3 with SMTP id
 my5-20020a17090b4c8500b002340b23ead3mr15739211pjb.3.1678214119429; 
 Tue, 07 Mar 2023 10:35:19 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 19/25] target/ppc: Avoid tcg_const_* in
 power8-pmu-regs.c.inc
Date: Tue,  7 Mar 2023 10:34:57 -0800
Message-Id: <20230307183503.2512684-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
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


