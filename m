Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D882351C95C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:41:31 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhLu-0005Lk-Vk
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYc-0002yx-9K; Thu, 05 May 2022 14:50:34 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:44105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYY-0004Td-4O; Thu, 05 May 2022 14:50:33 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-ed9a75c453so5073268fac.11; 
 Thu, 05 May 2022 11:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceXIRmvDGwZG2ZoRhYTNniMrHQbaZU4/f2aaZDKJUo4=;
 b=CjKbhySb+qyxsIokCHgJNYK6I0Okq5NIAy+EIjBjG97L63Bqc6HC9wb/zzWlaUUUTp
 tQUhkr+IeCiCSniRcL3yOVxCyFXPUbXLm8TFSNXfmqR5z3NaDsjRf7YUPbhnBUdblySR
 WK3P8GTZ8mKIx9yIfRr5f+XSXdct0XbQ0RYjU/eq8/tPgOgb8V+9Vzu44WtPwVVTWnFz
 hZ6GD8zYAjXIr75jM4C3FMtkBBKsP/ME6v0lRtzSfsbv5R9yGReK3PLr+DrDIUo0ubpv
 NitSPDM8rSB3SVDBVVFI5WZyiXt1iaLOsruKxRcrCr3f/nKks8suDwz4QOnmGglH1XLn
 zEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceXIRmvDGwZG2ZoRhYTNniMrHQbaZU4/f2aaZDKJUo4=;
 b=VtjagNUFVLh7VcTp2ymVbod1Cxyk6QAjmCM+GgDwOy8uJWHmm9cm4S7tD+Zpxg4p+p
 wYl3VkfytBoeHmbriUnSZ9+r+dYX+9TXUkkcK+kaBRPtChvEiYuElXMR9tH5Sy6tPQJr
 7FlC+pbDtIzT6sUWfXz/oYtIsKZ/fpDoLL3wf9ZvMVxoUZqqej+20xFSL8or+qSsks0v
 5zQLe/HQNic5O4ShhzLV5gIUALy15dLPODzYiL/H3nm2LxSOg2oGfp+UbW5F7KcboRzi
 g4TdE+EkuJ+hdVOBs5dT6DI7mv0x/omHs1491NuowwRKgOf4UwHFFzMbSYSUmAZGh+DF
 W3Og==
X-Gm-Message-State: AOAM530Q5FVZPlZ7KaGPyHDsFrj52Mc3QuiNxqmmGUj1D5Mbhjbpkp6g
 s6xmo5gP6dsospbrvmxOYgVNAq4k0Bo=
X-Google-Smtp-Source: ABdhPJz6Cz3411O97cfT5MpRP+VMrBDMkGnXGmwTZDc+Z6QQIbAUOai/O4mppnAdRBYWURq48mo8nA==
X-Received: by 2002:a05:6870:d5a2:b0:de:f682:6c4d with SMTP id
 u34-20020a056870d5a200b000def6826c4dmr2930370oao.283.1651776628311; 
 Thu, 05 May 2022 11:50:28 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/30] ppc/xive: Always recompute the PIPR when pushing an OS
 context
Date: Thu,  5 May 2022 15:49:15 -0300
Message-Id: <20220505184938.351866-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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

From: Frederic Barrat <fbarrat@linux.ibm.com>

The Post Interrupt Priority Register (PIPR) is not restored like the
other OS-context related fields of the TIMA when pushing an OS context
on the CPU. It's not needed because it can be calculated from the
Interrupt Pending Buffer (IPB), which is saved and restored. The PIPR
must therefore always be recomputed when pushing an OS context.

This patch fixes a path on P9 and P10 where it was not done. If there
was a pending interrupt when the OS context was pulled, the IPB was
saved correctly. When pushing back the context, the code in
xive_tctx_need_resend() was checking for a interrupt raised while the
context was not on the CPU, saved in the NVT. If one was found, then
it was merged with the saved IPB and the PIPR updated and everything
was fine. However, if there was no interrupt found in the NVT, then
xive_tctx_ipb_update() was not being called and the PIPR was not
updated. This patch fixes it by always calling xive_tctx_ipb_update().

Note that on P10 (xive2.c) and because of the above, there's no longer
any need to check the CPPR value so it can go away.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220429071620.177142-2-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/intc/xive.c  | 11 ++++++++---
 hw/intc/xive2.c | 16 +++++++++-------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index b8e4c7294d..c729f6a478 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -413,10 +413,15 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
         /* Reset the NVT value */
         nvt.w4 = xive_set_field32(NVT_W4_IPB, nvt.w4, 0);
         xive_router_write_nvt(xrtr, nvt_blk, nvt_idx, &nvt, 4);
-
-        /* Merge in current context */
-        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
     }
+    /*
+     * Always call xive_tctx_ipb_update(). Even if there were no
+     * escalation triggered, there could be a pending interrupt which
+     * was saved when the context was pulled and that we need to take
+     * into account by recalculating the PIPR (which is not
+     * saved/restored).
+     */
+    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
 
 /*
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 3aff42a69e..400fd70aa8 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -316,7 +316,6 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
 {
     Xive2Nvp nvp;
     uint8_t ipb;
-    uint8_t cppr = 0;
 
     /*
      * Grab the associated thread interrupt context registers in the
@@ -337,7 +336,7 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
     /* Automatically restore thread context registers */
     if (xive2_router_get_config(xrtr) & XIVE2_VP_SAVE_RESTORE &&
         do_restore) {
-        cppr = xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
+        xive2_tctx_restore_os_ctx(xrtr, tctx, nvp_blk, nvp_idx, &nvp);
     }
 
     ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2);
@@ -345,11 +344,14 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
         nvp.w2 = xive_set_field32(NVP2_W2_IPB, nvp.w2, 0);
         xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
     }
-
-    /* An IPB or CPPR change can trigger a resend */
-    if (ipb || cppr) {
-        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
-    }
+    /*
+     * Always call xive_tctx_ipb_update(). Even if there were no
+     * escalation triggered, there could be a pending interrupt which
+     * was saved when the context was pulled and that we need to take
+     * into account by recalculating the PIPR (which is not
+     * saved/restored).
+     */
+    xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
 
 /*
-- 
2.32.0


