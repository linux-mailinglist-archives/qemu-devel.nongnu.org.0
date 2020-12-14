Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1ED2DA35B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:28:00 +0100 (CET)
Received: from localhost ([::1]:39704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kowJz-00053i-VI
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kowEG-000071-Es; Mon, 14 Dec 2020 17:22:05 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:39330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kowEE-0005gB-FU; Mon, 14 Dec 2020 17:22:04 -0500
Received: by mail-lf1-x143.google.com with SMTP id a12so34274225lfl.6;
 Mon, 14 Dec 2020 14:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T8UChHoIwBEiicq6XXISwbaZDtZv7FINyWUE/0T1qPQ=;
 b=NSK7x4cdySy45qlEoMjebrrrekBsuRnj3R4Zs6RcM6zHalW6iHL40aEgO3qhNF7Gew
 sw0U9FhnqV3106xyMFSW3+09eQOJpoks+URTG6U81zkVAl82vbVJqel4Gw/Z0X8wR0H7
 /OuezSNNEth3iDBVk0J8HjYj+54OEPR/TpwwJGFuyFRf7FQyDwBCK7ZT/SqFLFxM0Lk+
 vigrM6lcd7YTc/tWw3yQlKejKFKT9c/w8XPK8VxHD0mOBGg5J1x95gYtzb6qnt+k8gTl
 yEtTtPJioT06kDkdmEwfVF/GmTA3ZA+1kKMS/V8fSoQakenmhtXrFyYDOOHSfFroR/B0
 FqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T8UChHoIwBEiicq6XXISwbaZDtZv7FINyWUE/0T1qPQ=;
 b=tTBUkDFIGWL+qjg5F4zCb6XLkQtedFaNWebI4I5cJMkSpEJ0Tfo071h7ujt9V3qMaG
 t+33hagANh7Wh3Sj3h0LeWNNwpSpjJ+nJhcLktqsCQtnYgUOUkrlx/resjvmc91F9kmt
 9KgibQ2Y2gO4+r+R5nKwV557pAlSz6cOPQ1/wPe9/0HUl4Gq/OK7eZZkyKA4AMtKGoiY
 HamrsGl/dkFV2SV3ZQLX3boJuoJwPh6TRUjrEByeb7dn52vYz4UoBTjCIz7Dxpr3hBJc
 qawv23L8fe25iydjtGwBXCWN47n6j+fM7XSUS4mJDgl3o4Kw6G06R9az/z4+CRIRLKdc
 JIQA==
X-Gm-Message-State: AOAM531rtoTY5BhMRKvmacz+2KBxhbqP0xJCAuIsrlg6SG4K/HgIXyDe
 GgFqmLx+6inkKKxCCeIK/6AXHxJ6SXBRfg==
X-Google-Smtp-Source: ABdhPJy2tAnUumZby74S7mXV0lxyaxlUHduKmJowRdp1oLoa9z30CdSzk7jtctXboATDCcSLU5wRLA==
X-Received: by 2002:a19:8b88:: with SMTP id n130mr9832231lfd.527.1607984520444; 
 Mon, 14 Dec 2020 14:22:00 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id m11sm2462941ljp.12.2020.12.14.14.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 14:21:59 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] intc/arm_gic: Fix gic_irq_signaling_enabled() for vCPUs
Date: Mon, 14 Dec 2020 23:21:54 +0100
Message-Id: <20201214222154.3480243-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214222154.3480243-1-edgar.iglesias@gmail.com>
References: <20201214222154.3480243-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x143.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 figlesia@xilinx.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Correct the indexing into s->cpu_ctlr for vCPUs.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/intc/arm_gic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index c60dc6b5e6..af41e2fb44 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -141,6 +141,8 @@ static inline void gic_get_best_virq(GICState *s, int cpu,
 static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
                                     int group_mask)
 {
+    int cpu_iface = virt ? (cpu + GIC_NCPU) : cpu;
+
     if (!virt && !(s->ctlr & group_mask)) {
         return false;
     }
@@ -149,7 +151,7 @@ static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
         return false;
     }
 
-    if (!(s->cpu_ctlr[cpu] & group_mask)) {
+    if (!(s->cpu_ctlr[cpu_iface] & group_mask)) {
         return false;
     }
 
-- 
2.25.1


