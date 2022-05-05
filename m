Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47251C902
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:28:19 +0200 (CEST)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmh98-0006vb-Dw
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYd-00031m-Sg; Thu, 05 May 2022 14:50:35 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:44707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYa-0004NN-Ty; Thu, 05 May 2022 14:50:35 -0400
Received: by mail-oi1-x230.google.com with SMTP id m11so5238858oib.11;
 Thu, 05 May 2022 11:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RPMxvwAqQam90MVgCoGz5ATuhdIJWRrG9JDb0zbUbBg=;
 b=S0BoOJJeH4ENEAL3Q4gAbXS/ODEE99PPB04kBLNU6p5skZiGE+u8SmNrnCn9aCcFLP
 GXSNVUVPgWOMSHTANxsA1UYpJht7Pj48sQYMYvXjFgC+yylA+YJ0EwWvDRCWotzIidO+
 tprR+t9mMNe12x6wR3UMYsN8agEkytzqvS7cJZbUTT1dDXRPl9aKGY+xlNv62uBTJTNo
 jGSxQKqo21QjRjvZIFlRv2enF3TafK2KTWcRHFStbny/YWG0jcQuk7ym5Ih7fyoJ8MW8
 +Cc1nLMVkhpzoKKBbIOHg8zh7BC+5wmbMVnBEquxGys4fTXReEQv/7j0tKGZt94JmgWy
 dp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RPMxvwAqQam90MVgCoGz5ATuhdIJWRrG9JDb0zbUbBg=;
 b=nmLsueqpJCIxqKwoC9/JyQI/Jd93rH8CXXSAXJGZvnmGHaRISgIzP5ArRYrvW+ee/e
 kPtWV+uZrQ9mayButhW/lFEToGUXnfBuq4jSs533BgfrCLjjnRL0TneYGp721bn1RoCc
 iISwExH/0Qf5qX/rf1dYrH4zjZKwLSaDUBv9Lj3jnKTXne4NbYBVDwh/NS0Ou5qVGVWp
 HxLFUls//0TgEoIVr39rVIZ/DTrsYHoqEU1EXyJszuBsGS+6OEVWOC9+Ykc+bjhrKg9o
 8NCFJ+3LZPm7vn96Iw/pHainioCH5NCIAKWQ4h/2U1TeigyhhL5zFin0uSNB5zGrq2N7
 9eWw==
X-Gm-Message-State: AOAM533/ceBkmeFJzRM6jF0y1q/CTypPGeur7fjX0zLAS26h8gzw8Cz7
 JTbe6X5wNFdBq5smDNw2uSOvrn9bivc=
X-Google-Smtp-Source: ABdhPJyb08ziSO5n8m56n2jOHvoy4PjlH7ZPe/EB9A2ogn3a8AIJ0PYbzHzac/npvF5TqU8Gud5LJQ==
X-Received: by 2002:a05:6808:a89:b0:325:9d65:7b24 with SMTP id
 q9-20020a0568080a8900b003259d657b24mr3244572oij.266.1651776631689; 
 Thu, 05 May 2022 11:50:31 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 08/30] ppc/xive: Update the state of the External interrupt
 signal
Date: Thu,  5 May 2022 15:49:16 -0300
Message-Id: <20220505184938.351866-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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

When pulling or pushing an OS context from/to a CPU, we should
re-evaluate the state of the External interrupt signal. Otherwise, we
can end up catching the External interrupt exception in hypervisor
mode, which is unexpected.

The problem is best illustrated with the following scenario:

1. an External interrupt is raised while the guest is on the CPU.

2. before the guest can ack the External interrupt, an hypervisor
interrupt is raised, for example the Hypervisor Decrementer or
Hypervisor Virtualization interrupt. The hypervisor interrupt forces
the guest to exit while the External interrupt is still pending.

3. the hypervisor handles the hypervisor interrupt. At this point, the
External interrupt is still pending. So it's very likely to be
delivered while the hypervisor is running. That's unexpected and can
result in an infinite loop where the hypervisor catches the External
interrupt, looks for an interrupt in its hypervisor queue, doesn't
find any, exits the interrupt handler with the External interrupt
still raised, repeat...

The fix is simply to always lower the External interrupt signal when
pulling an OS context. It means it needs to be raised again when
re-pushing the OS context. Fortunately, it's already the case, as we
now always call xive_tctx_ipb_update(), which will raise the signal if
needed.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220429071620.177142-3-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/intc/xive.c        | 14 ++++++++++++++
 hw/intc/xive2.c       |  2 ++
 include/hw/ppc/xive.h |  1 +
 3 files changed, 17 insertions(+)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index c729f6a478..ae221fed73 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -114,6 +114,17 @@ static void xive_tctx_notify(XiveTCTX *tctx, uint8_t ring)
     }
 }
 
+void xive_tctx_reset_os_signal(XiveTCTX *tctx)
+{
+    /*
+     * Lower the External interrupt. Used when pulling an OS
+     * context. It is necessary to avoid catching it in the hypervisor
+     * context. It should be raised again when re-pushing the OS
+     * context.
+     */
+    qemu_irq_lower(xive_tctx_output(tctx, TM_QW1_OS));
+}
+
 static void xive_tctx_set_cppr(XiveTCTX *tctx, uint8_t ring, uint8_t cppr)
 {
     uint8_t *regs = &tctx->regs[ring];
@@ -388,6 +399,8 @@ static uint64_t xive_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
     /* Invalidate CAM line */
     qw1w2_new = xive_set_field32(TM_QW1W2_VO, qw1w2, 0);
     xive_tctx_set_os_cam(tctx, qw1w2_new);
+
+    xive_tctx_reset_os_signal(tctx);
     return qw1w2;
 }
 
@@ -420,6 +433,7 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
      * was saved when the context was pulled and that we need to take
      * into account by recalculating the PIPR (which is not
      * saved/restored).
+     * It will also raise the External interrupt signal if needed.
      */
     xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 400fd70aa8..4d9ff41956 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -269,6 +269,7 @@ uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
         xive2_tctx_save_os_ctx(xrtr, tctx, nvp_blk, nvp_idx);
     }
 
+    xive_tctx_reset_os_signal(tctx);
     return qw1w2;
 }
 
@@ -350,6 +351,7 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
      * was saved when the context was pulled and that we need to take
      * into account by recalculating the PIPR (which is not
      * saved/restored).
+     * It will also raise the External interrupt signal if needed.
      */
     xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
 }
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 126e4e2c3a..f7eea4ca81 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -527,6 +527,7 @@ Object *xive_tctx_create(Object *cpu, XivePresenter *xptr, Error **errp);
 void xive_tctx_reset(XiveTCTX *tctx);
 void xive_tctx_destroy(XiveTCTX *tctx);
 void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb);
+void xive_tctx_reset_os_signal(XiveTCTX *tctx);
 
 /*
  * KVM XIVE device helpers
-- 
2.32.0


