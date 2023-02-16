Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6388699AD3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnG-000844-AK; Thu, 16 Feb 2023 12:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnD-0007yn-FN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:35 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnB-0007oo-Np
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:35 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m10so2545157wrn.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eFRMxmxSaJfBplZt4RLAoAfhh4Czqb3lB+D76vM9a7w=;
 b=WSAROooVeaPDfVC1r40ZhPyapCjJwbCMjUJUgLEETQJu5T0zy0IHxyuDDUo6cIw7eg
 QP83grVvDN3Sis+Kj8toLKEehoqv5CtG+u3MYzXoTEn8lmS0knOY4L2vF4z4xHUnAs1m
 fGmg/JFAeZ9IQoXWjYjIHzRWOTMXYhYJeLM0/QygANuJ2vTUD80Lt2eLD+8+T60RMv8H
 tzJMeEbwd0qhVmRiT5e+v8autfFzIdbPhq8k7HM+GcZDUVPZ8bF+uR9Pq1XhD1G87xFj
 h++d0+WRpymGErx2C74WyPM0rZMTna3aeqLN56VsOsv3lGxLu3GRT7Z3mClIEw+vnKvq
 lbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eFRMxmxSaJfBplZt4RLAoAfhh4Czqb3lB+D76vM9a7w=;
 b=UvKS6ccvo1KtIMLsNtLuGRWwCkMGdKxd6bnbmb4dDm38nc5U9dM4o/nWkCsbVffbde
 s8OeZC+bqItSFA0MU2Cm3ofrzNOvcgdve5GZt9S16aQxxRf2UF5GMMZ4V2dlHde2HuKi
 fxsXWoISeOnrp3SgMT1nfjKclrBHFwN29f5Q9SJpN/rPf9+WRZkyNecMZRQeosYkZYAW
 Vx1ptFtd8EDiyDer0xyfSAZDrD9BonnlnpTCJRdD5B6EYCNqFu891E6Dyu7ISY0aS5HD
 PxbIEfH7UlPcw8vpqIYYFtGXz3f3JBQ5xzL0Uz8EvAy8NE97M4wlQSvXWZZlereIRtaR
 6nSA==
X-Gm-Message-State: AO0yUKVDS1KlSAhTw29AFn85dKo37qaCWfs6m+u4BBoMThZsYb86pyos
 Hw+zi054K4OZiy2/hLMh1aUCFZBlmw6CTBxO
X-Google-Smtp-Source: AK7set+zKDKpP7OWBBiqeaEBtYhOl5OSQim0gRL619N2Q5xDI/YY3AEDSA4h0gWtARP4fFOtFu4zLw==
X-Received: by 2002:adf:f84f:0:b0:2c5:4c7d:53b1 with SMTP id
 d15-20020adff84f000000b002c54c7d53b1mr6263920wrq.16.1676567493094; 
 Thu, 16 Feb 2023 09:11:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] target/arm: Restrict CPUARMState::nvic to sysemu
Date: Thu, 16 Feb 2023 17:11:02 +0000
Message-Id: <20230216171123.2518285-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230206223502.25122-10-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a574e85b769..01f9566a1b4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -767,8 +767,8 @@ typedef struct CPUArchState {
         uint32_t ctrl;
     } sau;
 
-    void *nvic;
 #if !defined(CONFIG_USER_ONLY)
+    void *nvic;
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
-- 
2.34.1


