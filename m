Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DEE68C9A6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA5w-0001wu-N7; Mon, 06 Feb 2023 17:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5X-0001uw-EP
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:54 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5V-0004XC-TC
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:51 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso11935537wms.0
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4wwJ9rgwf3OGu6ruHO5E3WC10MpsXTe+i4WOyzlxyQ=;
 b=uiJC8y6Scd+xH5k6JhmB1Txo0p0Al4I43GaNRNM1U1OoqQZUHDELm4AWJjDOlYpiJ1
 ksqh1SE4wUDIluR7RVkTB3BQ2w8QmVlqNu9AOFeUqfB0vQj/zslF+vWiaKfGk4asAOgE
 zNqs1ZG4dma4urO/4+kgM9bRJEazewBlNP/EWXySmrJOMv4qs6eKRdz0EV7UZecUyzTp
 B5dGuBIds/LA/gd9xHTW3WyMcRn98g2UTQuD75hkhJuCinNLqubBQ6CB+ooQ99HtAjxM
 iCjSNr+SkTpg9p9MwZnjaP7gprQ+jJ5A5hpe7Qi5Wh5AxiHDaAOXr9xPlYAvXKGh18+r
 dXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E4wwJ9rgwf3OGu6ruHO5E3WC10MpsXTe+i4WOyzlxyQ=;
 b=wJfZeY8B2LuGCz7AAZmQr6VEU11HJNrPgs3aLFe+XQj6oLhQaOh+NGVPfTpG1UUW5S
 /VbNqad+0c9VyMJBP9Ey6WVyV0kwR7Jpym+yey3iITAgDZfJ88li5EwfdfEWML/UfVH4
 5v17C23tj9/0EsKrdcZtlYfQ6/hrmCikdyViBXuiAEy0yydbiVIDFbFWu1BUyiWBSzTX
 fm4NYSuBEEyJjKZqWnY/03Mf+jbA32SYKZ1E7p8zGVLAntFvEbpMyo4t8bu3S7INj0Nq
 E9C55RBxKHYL9mmXk6wkDMHWpmT73EVt7mEviNR9vrXIDVfd4SaN+IzN6ENMgVNd/oyV
 fVow==
X-Gm-Message-State: AO0yUKUiaHZewQjpJf8EmA19Q8L//3x/CeSSiCbFw7TUpS7inF+E3Kl9
 p1IkasvrYDdynOdJRM8W4AWxhrgdFQUfI+i3
X-Google-Smtp-Source: AK7set9vqos7aFG5IPZxS/XD6u0MtMnk6E7EPmnMrxjW32jElHNNDMMUD/wVubBmSkPPaZm3ItVzAQ==
X-Received: by 2002:a05:600c:319d:b0:3dc:5950:b358 with SMTP id
 s29-20020a05600c319d00b003dc5950b358mr1160116wmp.14.1675722948488; 
 Mon, 06 Feb 2023 14:35:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a7bc7d1000000b003dc3f07c876sm17500100wmk.46.2023.02.06.14.35.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/11] target/arm: Restrict CPUARMState::arm_boot_info to
 sysemu
Date: Mon,  6 Feb 2023 23:34:59 +0100
Message-Id: <20230206223502.25122-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 002082eb5b..a574e85b76 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -768,8 +768,8 @@ typedef struct CPUArchState {
     } sau;
 
     void *nvic;
-    const struct arm_boot_info *boot_info;
 #if !defined(CONFIG_USER_ONLY)
+    const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
 #else /* CONFIG_USER_ONLY */
-- 
2.38.1


