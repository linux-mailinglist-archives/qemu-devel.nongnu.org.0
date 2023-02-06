Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E9968BCAF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:18:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0RY-00080n-5i; Mon, 06 Feb 2023 07:17:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RM-0007kh-7k
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:45 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RI-0005pD-0O
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so10602891wmb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXO14j3VKdWe9oMd0XtD7rpE8pnbdCJDTrrJ4g32Du4=;
 b=tTqa5kVvFUNGGqkuqndZaNDJTdCWxd3s4VkuhG/TI6WVUpJc1szlYoYwXLBPxAtehA
 huEnWvFDeUMDjN7s99YhxD6GWODnj3FFG1pXySaJtyDX1Qh/jGjhyW4DbQBJpZlbPBc4
 xRLSCv8nxB6e6JUVbCTrfG2CugyiSIWj6WFIKKajBGSeIv0L/6FobLAiBaBHsj/vDdg5
 +gjjdVSPFsXuaPS1CLPDJ8fI8gzyTvxKR2PQVfup2BGktGfQySGULEZUqXLALb1tG4XA
 COfSxzqnWeMTepnxH0Y+GVlasx38Xik7xWzA4I4yJJjuFV5dlWDWnwGFCyOt66RUuQHq
 +fAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXO14j3VKdWe9oMd0XtD7rpE8pnbdCJDTrrJ4g32Du4=;
 b=sKK1HzZ2ceAbXV3I4nIXP2dK0aFq0Hhv4nFLX7FLqq+JfDayeLBC3nPddS7eh44Ss5
 ktcrKZlqcv4OJIYgdEtTLU7VmCg+9/tzLAmb8KTiHakd67Lyi8UPXRZGz2nxYN99fQVr
 AQbWn3QO8qSlnvwpo+vPCZBB8Z+xYvi2mowCn0Sg+bIJcy0Qz2GEChJnkIpNHjLLW5Ca
 N0KcmP90qieMP4Z/JhrErTZ3PgX8IVOVsSttDlOaeeprTv3NflJnzis2jT15xTiDWdTu
 R+VwQSNaI/VkmQPCBATdmWlzesVl9aKWCB+nYaUon/5ClvByKezsxfTI3cJXrdaK/POj
 +gOQ==
X-Gm-Message-State: AO0yUKX6xGwgnolVTw+57u7uO6tT5sD1c6UvzhTBFV66tpXFVnIrfhO/
 eMVLFiejRLI2cor95J8RY6JGCqcDnR4omq7L
X-Google-Smtp-Source: AK7set+L71tdIoiboQNHx6+FKXnD5rBWqqfIYDfNnFTX13cXkdKCBv6Uqe/2MKzIDE9kbL9ZSVsxtg==
X-Received: by 2002:a05:600c:3d92:b0:3df:e468:17dc with SMTP id
 bi18-20020a05600c3d9200b003dfe46817dcmr13312294wmb.40.1675685857362; 
 Mon, 06 Feb 2023 04:17:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b003e001afa274sm2564647wmb.2.2023.02.06.04.17.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/9] target/arm: Restrict CPUARMState::arm_boot_info to sysemu
Date: Mon,  6 Feb 2023 13:17:09 +0100
Message-Id: <20230206121714.85084-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bbbcf2e153..01d478e9ce 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -770,9 +770,10 @@ typedef struct CPUArchState {
 #if defined(CONFIG_USER_ONLY)
     /* For usermode syscall translation.  */
     int eabi;
+#else
+    const struct arm_boot_info *boot_info;
 #endif
     void *nvic;
-    const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
 
-- 
2.38.1


