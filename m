Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D864F37A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:50:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV9-0006pB-NV; Fri, 16 Dec 2022 16:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUJ-00067L-8D
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:33 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUC-0000ck-Gz
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:26 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so2678704wmb.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SHJyhm2AvF1J3KhcjjNeB31fuKNh0dgEGUX5Ov6mrnA=;
 b=GWVEhcJGJIJs6JULa7rzsirYlBUI9BPAylC7RjAWoFzMIbUWFDi7ewMJrx28QFX0ZV
 Lk9G8ZruKXD5eLY+yTwfUqSehPR8cXrDsSf1DByo0+s4LcQLTrvwtwzcixyJCvvFgKVm
 0WD8/cyLzJJaEh6FmpiDX0PJyz2KJv9yPIM7kmO4R0znP6fHoix7btLfUq8VT78m5806
 bc1Mu+AYKSBhI9dGxFPHfXZYaf5tVwiUH1QqWWMAkHg1iavIFw1oVZZ5lyiI+/ZJgxn4
 Ba1Yznx7kQLB3fFVe8nIS/WNlOEf7DPqDH5R8MEWNCatjC33oIwoGOvJobCAgL31700m
 JzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SHJyhm2AvF1J3KhcjjNeB31fuKNh0dgEGUX5Ov6mrnA=;
 b=ybiaEpKSyjo8rAFfG3RCPvdeBfzXW8jmRcMZ1CJT2i+fgGt3dmuj0BC0/sqdX2ttVf
 TJqTjDKErHxhKZt9K4VSTPgkB9CU4s8hwtx/NnS2wxUqIEWH5V8KyWHx6rvC/E5OnXy1
 usF86xjbO9nEGAkwInJTq4ikgWTMoBjQ3BNtMpMcsZ7a9nCP8kGPpGRdm0T8Cq2npvhf
 q/17ss83HI8PZ6rBpDEN5Ko4pH7snJIpgS1YdudEiJ1961T0iWyIXhceSHZXGGdfakCk
 VaDX9rRjWD1CJODPKDDeZUPIjjA34L0jKjZX1KGr126m0XLvu3E6MF/+MJknUsWidjwJ
 ynOg==
X-Gm-Message-State: ANoB5pnwoaTYN8w4kn1LWAoeiMHHerL0WXENMYA758EIj3UXVDdv61ie
 sg0qzZof9coSKTY13bbCIK3VCGvZHvqBBPu/
X-Google-Smtp-Source: AA0mqf6uDzvDbwsaqwNTm+Dq9R930UOcHPxRkp5w8vCL7Pxp3eOAV52ejG5yjLnzNJSV5c9+d1t4TA==
X-Received: by 2002:a05:600c:354d:b0:3d0:85b5:33d3 with SMTP id
 i13-20020a05600c354d00b003d085b533d3mr26138175wmq.16.1671226998925; 
 Fri, 16 Dec 2022 13:43:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/36] hw/intc/xics: Convert TYPE_ICS to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:43 +0000
Message-Id: <20221216214244.1391647-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Convert the TYPE_ICS class to 3-phase reset; this will allow us
to convert the TYPE_PHB3_MSI class which inherits from it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221125115240.3005559-7-peter.maydell@linaro.org
---
 hw/intc/xics.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index dd130467ccc..c7f8abd71e4 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -564,9 +564,9 @@ static void ics_reset_irq(ICSIRQState *irq)
     irq->saved_priority = 0xff;
 }
 
-static void ics_reset(DeviceState *dev)
+static void ics_reset_hold(Object *obj)
 {
-    ICSState *ics = ICS(dev);
+    ICSState *ics = ICS(obj);
     g_autofree uint8_t *flags = g_malloc(ics->nr_irqs);
     int i;
 
@@ -584,7 +584,7 @@ static void ics_reset(DeviceState *dev)
     if (kvm_irqchip_in_kernel()) {
         Error *local_err = NULL;
 
-        ics_set_kvm_state(ICS(dev), &local_err);
+        ics_set_kvm_state(ics, &local_err);
         if (local_err) {
             error_report_err(local_err);
         }
@@ -688,16 +688,17 @@ static Property ics_properties[] = {
 static void ics_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->realize = ics_realize;
     device_class_set_props(dc, ics_properties);
-    dc->reset = ics_reset;
     dc->vmsd = &vmstate_ics;
     /*
      * Reason: part of XICS interrupt controller, needs to be wired up,
      * e.g. by spapr_irq_init().
      */
     dc->user_creatable = false;
+    rc->phases.hold = ics_reset_hold;
 }
 
 static const TypeInfo ics_info = {
-- 
2.25.1


