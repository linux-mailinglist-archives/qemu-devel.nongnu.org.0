Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4FB47E8B4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 21:21:48 +0100 (CET)
Received: from localhost ([::1]:48192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Uaw-0006I7-3G
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 15:21:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXp-0003Nx-7U; Thu, 23 Dec 2021 15:18:33 -0500
Received: from [2607:f8b0:4864:20::92f] (port=44555
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXm-0004M2-I0; Thu, 23 Dec 2021 15:18:32 -0500
Received: by mail-ua1-x92f.google.com with SMTP id p2so11810824uad.11;
 Thu, 23 Dec 2021 12:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lVJkcyiHGqYfvYM6coxf34H1oxwfCyOAKdOk3/SxtGI=;
 b=bg9Wahnb7sGEuPNr+Z2pTiwwgTBG6UW8Y3P0GYwdL3cxnhPxEzZ15eUVLSFO59l9TO
 X7icK/O9PGKnhRrTkrbqicDBySXFJK7n3Shmb/zQeu7QhtohOwvJ+jTCnlTKkrGLu93H
 M0Fy7wkP9t7zSZBoevLUPVzh0v27tLFevkKa+PRPbqhkGcHBQ8rRMOOxyekrpe1JNNQW
 tc7FsfXj/U/q26NOXyfcf57P7lfZgvZbl+0hlLb5TSTgtS2S1tU5zisPHIUkfzdxBerg
 CNB26qgKdCNLnACKFCogoX2P0+4ggmORBZfLKpsrMngy5TnmZGj7/sE7tuOXPlE6KZ+i
 PWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lVJkcyiHGqYfvYM6coxf34H1oxwfCyOAKdOk3/SxtGI=;
 b=ZlZoDUIAsV5BekbIJO+bKkbJkHnB+A4ytfZMHdiX9h/HmvUelITXDkeKjpfx6fHk9g
 84FTAuB0gfOcDsgbghKFIRlf1s+jLGXRI2hStjJc4WeNVHqS8fiN/WDSqxButy19khkw
 rSznPoD3yD8+4cUZQSVgXl/ZYgm8/AVKF9J2UH1ZrhLE38CQaBq0tlgTsvRIIgrCe+rQ
 bm4T9nDdiodXurrsoN6Y/0rvGX/pEWMhkSy+y1jF/w6uEWHfc/XhfKj5xJsb3qV8+xAX
 dSq7Flcfp8Qqk4GhdWgk9BPzz0ouxDtaD+yMMwf+yI1PMUMLlZXMcXTOaf3zD6PgjWJK
 M66A==
X-Gm-Message-State: AOAM532GxS2n1SPsFK7sFT6ZPpG4a6sdViaPsB1NzEfmXu8ZqlDV6ptx
 8HBaSy/n8WsFAvG90HSuOlp3IZs8YbM=
X-Google-Smtp-Source: ABdhPJzwgUt4D2nFGfXFuzbzsTiyl3aNosfYd5IIrsVP870a6fXelG+WKkXrwIzVNJMUMq3tFDAaCw==
X-Received: by 2002:a05:6102:c46:: with SMTP id
 y6mr1271986vss.53.1640290709318; 
 Thu, 23 Dec 2021 12:18:29 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id f20sm1185114vsl.31.2021.12.23.12.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 12:18:29 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] target/ppc/power8-pmu-insn-cnt: add PMCs1-4 insn count
Date: Thu, 23 Dec 2021 17:18:10 -0300
Message-Id: <20211223201812.846495-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223201812.846495-1-danielhb413@gmail.com>
References: <20211223201812.846495-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use inc_spr_if_cond() to count instructions of all other PMCs that are
capable of counting instructions (all PMCs but PMC6).

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu-insn-cnt.c.inc | 62 ++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
index 3cfb801c69..a5a0d42e71 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -11,6 +11,13 @@
  */
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+#define MMCR1_PMC1_INS_CNT        0x02000000
+#define MMCR1_PMC1_INS_CNT2       0xFE000000
+#define MMCR1_PMC2_INS_CNT        0x00020000
+#define MMCR1_PMC3_INS_CNT        0x00000200
+#define MMCR1_PMC4_INS_CNT        0x00000002
+#define MMCR1_PMC4_INS_LATCH_CNT  0x000000FA
+
 /*
  * This function increments a SPR 'spr' by 'inc_val' if a given
  * register 'reg' has a bitmask 'mask' set (cond = TCG_COND_EQ) or
@@ -54,8 +61,63 @@ static void pmu_count_insns(DisasContext *ctx)
     }
 
  #if !defined(CONFIG_USER_ONLY)
+    TCGv t_mmcr0, t_mmcr1, t_ctrl;
+    TCGLabel *l_skip_pmc14;
+
     inc_spr_if_cond(SPR_POWER_MMCR0, MMCR0_FC56, TCG_COND_NE,
                     SPR_POWER_PMC5, ctx->base.num_insns);
+
+    /*
+     * Skip PMC1-4 increment if:
+     * - MMCR0_FC14 is set OR
+     * - MMCR1 is cleared
+     */
+    l_skip_pmc14 = gen_new_label();
+
+    t_mmcr0 = tcg_temp_new();
+    gen_load_spr(t_mmcr0, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t_mmcr0, t_mmcr0, MMCR0_FC14);
+    tcg_gen_brcondi_tl(TCG_COND_EQ, t_mmcr0, MMCR0_FC14, l_skip_pmc14);
+
+    t_mmcr1 = tcg_temp_new();
+    gen_load_spr(t_mmcr1, SPR_POWER_MMCR1);
+    tcg_gen_brcondi_tl(TCG_COND_EQ, t_mmcr1, 0x0, l_skip_pmc14);
+
+    /* PMC1 is incremented if PMC1SEL = 0x02 or 0xFE */
+    inc_spr_if_cond(SPR_POWER_MMCR1, MMCR1_PMC1_INS_CNT, TCG_COND_EQ,
+                    SPR_POWER_PMC1, ctx->base.num_insns);
+    inc_spr_if_cond(SPR_POWER_MMCR1, MMCR1_PMC1_INS_CNT2, TCG_COND_EQ,
+                    SPR_POWER_PMC1, ctx->base.num_insns);
+
+    /* PMC2 is incremented if PMC2SEL = 0x02 */
+    inc_spr_if_cond(SPR_POWER_MMCR1, MMCR1_PMC2_INS_CNT, TCG_COND_EQ,
+                    SPR_POWER_PMC2, ctx->base.num_insns);
+
+    /* PMC3 is incremented if PMC3SEL = 0x02 */
+    inc_spr_if_cond(SPR_POWER_MMCR1, MMCR1_PMC3_INS_CNT, TCG_COND_EQ,
+                    SPR_POWER_PMC3, ctx->base.num_insns);
+
+    /*
+     * PMC4 is incremented if PMC4SEL = 0x02 or 0xFA. 0xFA depends on the
+     * run latch (SPR_CTRL & CTRL_RUN). Check for the run latch before
+     * checking for PMC4SEL = 0xFA.
+     */
+    inc_spr_if_cond(SPR_POWER_MMCR1, MMCR1_PMC4_INS_CNT, TCG_COND_EQ,
+                    SPR_POWER_PMC4, ctx->base.num_insns);
+
+    t_ctrl = tcg_temp_new();
+    gen_load_spr(t_ctrl, SPR_CTRL);
+    tcg_gen_andi_tl(t_ctrl, t_ctrl, CTRL_RUN);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t_ctrl, CTRL_RUN, l_skip_pmc14);
+
+    inc_spr_if_cond(SPR_POWER_MMCR1, MMCR1_PMC4_INS_LATCH_CNT, TCG_COND_EQ,
+                    SPR_POWER_PMC4, ctx->base.num_insns);
+
+    gen_set_label(l_skip_pmc14);
+
+    tcg_temp_free(t_mmcr0);
+    tcg_temp_free(t_mmcr1);
+    tcg_temp_free(t_ctrl);
 #else
     /*
      * User mode can read (but not write) PMC5 and start/stop
-- 
2.33.1


