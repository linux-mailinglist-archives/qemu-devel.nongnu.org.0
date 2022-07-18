Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387EC5788A4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:41:06 +0200 (CEST)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUjx-0001v4-A5
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSG-0007tr-Ls; Mon, 18 Jul 2022 13:22:48 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSF-0001op-06; Mon, 18 Jul 2022 13:22:48 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10bd4812c29so25489091fac.11; 
 Mon, 18 Jul 2022 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K+sz4ClhBi1qJo9v1UC6b8pJgTN/doSDoBgt8dgJCSw=;
 b=KUON5ZBYo8W7xS3hr3dqk4Itj7f7QqemgqbAVRetQxUY4Hp1BTqnwf6wrWLFwN9P9O
 QwAYwIH7n4vz10cxOKQ+EdZgN3pDwDLW4Uyx4sGojlVkGDSzTpX8SYGZm91O9MCXAPtb
 rbnVLGUR02jh185ONq+VBf7eNuukKYfJmzAZSbQUj3KgoOszEALF8Xy3iKNKff2dXZNH
 8WixXj3Mx9s1tj0um6xVO1tyy0xCotpdJnQyZDhezyFxRy3/EsoWUqYorMTIPDHCXzMo
 2RuNHuMpQ/nthQ6nod7hb4SEU2OOfxhc85T4vKaf9Ye5rsx8NqQ8AJduRvtC6oDKE9FO
 rjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K+sz4ClhBi1qJo9v1UC6b8pJgTN/doSDoBgt8dgJCSw=;
 b=ymomFt0S69lMesrVeQUStojv9EOMg/yqbupkbQyA0tMm78rFqPhl7VLFaBn4pqO0ZQ
 Lcpvc4ehYK7qTmAXTXn9HAEk7aj06rgffDYCGFJ8C4dFtEDUsvcn+mkzd4xjtBLWUpCe
 Dvm2UeDORBcDNgeLF+64v9MHifwqBOZwIYQHImt9MHF2ImYz4kXwQ3pm3YXuQgR5cASL
 wUeNmEn+c0X5vBWmqbWZ/oIJnpaF6OK9/I/jVB23Pwm8Q3/1TVo1L/hAzvhrcjDcDNlk
 l7WTflgcy4BlWtjJuIlkJ43tp+dYBOJuOYhje04MnT3TD/CqqbOeXe9ei0OweLHkZ27k
 ik/A==
X-Gm-Message-State: AJIora/kYY2GTcEKYsa4Rj2bCNLeXuWOomEVseAEsq5eso/madc49mhv
 p/X27Ynx1d3CfSrjhPs6+ky/5KAnVs0=
X-Google-Smtp-Source: AGRyM1sDG4XfkpDZO7Hf+EQJ8j8IfTLQ9pgYxfRfXoF6Hxr1YbMLEb+PLA0rp0ZMuI0DswVF68mr8w==
X-Received: by 2002:a05:6808:210d:b0:33a:6081:dc84 with SMTP id
 r13-20020a056808210d00b0033a6081dc84mr6470408oiw.154.1658164962723; 
 Mon, 18 Jul 2022 10:22:42 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 12/30] target/ppc: fix PMU Group A register read/write
 exceptions
Date: Mon, 18 Jul 2022 14:21:50 -0300
Message-Id: <20220718172208.1247624-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

A call to "gen_(hv)priv_exception" should use POWERPC_EXCP_PRIV_* as the
'error' argument instead of POWERPC_EXCP_INVAL_*, and POWERPC_EXCP_FU is
an exception type, not an exception error code. To correctly set
FSCR[IC], we should raise Facility Unavailable with this exception type
and IC value as the error code.

Fixes: 565cb1096733 ("target/ppc: add user read/write functions for MMCR0")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220627141104.669152-6-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu-regs.c.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index 2bab6cece7..c3cc919ee4 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -22,7 +22,7 @@
 static bool spr_groupA_read_allowed(DisasContext *ctx)
 {
     if (!ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
         return false;
     }
 
@@ -46,10 +46,10 @@ static bool spr_groupA_write_allowed(DisasContext *ctx)
 
     if (ctx->mmcr0_pmcc1) {
         /* PMCC = 0b01 */
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
     } else {
         /* PMCC = 0b00 */
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
     }
 
     return false;
@@ -214,7 +214,7 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
      * Interrupt.
      */
     if (ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
         return;
     }
 
@@ -249,7 +249,7 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
      * Interrupt.
      */
     if (ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_PMU);
         return;
     }
 
-- 
2.36.1


