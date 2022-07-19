Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18657A614
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:07:07 +0200 (CEST)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrcg-000124-JO
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWD-0005se-4X
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:25 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWB-0006AM-IR
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:24 -0400
Received: by mail-oi1-x232.google.com with SMTP id o133so7786924oig.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HpGIZKhHPyBTYDyO6aeOz5WE1v6bt6KYlWM4Ue09GC0=;
 b=GRtMo+B9b04w81nZZoASTFc7he5HsTU62Wv/4qtSbVwuK+VFEu2vZk8ePr6OeTxqd9
 /dvxqUlzaJpP+dQMP62oHWZMil+bz4C9FTwOlLFstVVPAtGejAMHx7zT7mtq9P2XSKCa
 0j9GkZyplYrnD/Gw8CMehNUhzM2kuxDDmu9dw+gOrUWCI0ieLmuJ9AeMGaJdquDTN2qZ
 xrZO+P88ITPbCZs3Z2k8HP4hIUoEiEB6f19HVYztp0iNC+PJCunwaZ/ApEssZJrHZmhe
 B0Nrmea6jCF/THAxc/AjslE0tQyuqGR/LpQTLpuI9C4jly/b2wcYWZ3+1xPixuHn9SOp
 CVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpGIZKhHPyBTYDyO6aeOz5WE1v6bt6KYlWM4Ue09GC0=;
 b=KJm+C/FffX6uzNwd4UTIn5wfJZd02lwm/BdNqYoD9Z+q2RQRwBdReiaKRNoYP8SvXB
 l9xDloikRpEo2AwyT3DFXFq3RXY/B3vGYkDR2TrkZEMvuddB6eN7ESVsclJJSapakp/o
 ntkQ/sJUX4mqQYtanQwmFWq0Wl1iOxXdEUhlh1aFoAM7G2OwUN5cOSSKh6Nnu8MZF3dw
 8UlWKpVyGh4r/3Mpmbz8Frvgl7QArTmeDJw6vMHkVValAXVhAmwaTDLi/PMJ2z12TS0n
 2SKPjur2OBEEjuc3rz3Kw36AiPFtWBeGL2dC+sXqRmRpFy3eqz5qX/Syjly4sc3AAN3l
 FSmw==
X-Gm-Message-State: AJIora/EVxKt7yCBeLzxyz0uMaaicS2m3Pcm2kNOBrcO7XbIVkIBbeLR
 0Vg/vzPkkMQdS155heWQGXWH96/1FfEIGyoI
X-Google-Smtp-Source: AGRyM1tQdMlEirmS03QV1O4JkIWW9tB85AA/In42/WmQeyxe5LkWEto5sVDxF/OjhykTSJams2wQwQ==
X-Received: by 2002:a05:6808:1792:b0:337:af80:e140 with SMTP id
 bg18-20020a056808179200b00337af80e140mr325406oib.240.1658253621312; 
 Tue, 19 Jul 2022 11:00:21 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 03/21] hw/intc/loongarch_pch_pic: Fix bugs for update_irq
 function
Date: Tue, 19 Jul 2022 23:29:42 +0530
Message-Id: <20220719180000.378186-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Fix such errors:
1. We should not use 'unsigned long' type as argument when we use
find_first_bit(), and we use ctz64() to replace find_first_bit()
to fix this bug.
2. It is not standard to use '1ULL << irq' to generate a irq mask.
So, we replace it with 'MAKE_64BIT_MASK(irq, 1)'.

Fix coverity CID: 1489761 1489764 1489765

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220715060740.1500628-3-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/loongarch_pch_pic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
index 3c9814a3b4..3380b09807 100644
--- a/hw/intc/loongarch_pch_pic.c
+++ b/hw/intc/loongarch_pch_pic.c
@@ -15,21 +15,21 @@
 
 static void pch_pic_update_irq(LoongArchPCHPIC *s, uint64_t mask, int level)
 {
-    unsigned long val;
+    uint64_t val;
     int irq;
 
     if (level) {
         val = mask & s->intirr & ~s->int_mask;
         if (val) {
-            irq = find_first_bit(&val, 64);
-            s->intisr |= 0x1ULL << irq;
+            irq = ctz64(val);
+            s->intisr |= MAKE_64BIT_MASK(irq, 1);
             qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
         }
     } else {
         val = mask & s->intisr;
         if (val) {
-            irq = find_first_bit(&val, 64);
-            s->intisr &= ~(0x1ULL << irq);
+            irq = ctz64(val);
+            s->intisr &= ~MAKE_64BIT_MASK(irq, 1);
             qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
         }
     }
-- 
2.34.1


