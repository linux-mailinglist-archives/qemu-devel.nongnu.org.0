Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B7A67ECCF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:57:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSwo-0000nP-2D; Fri, 27 Jan 2023 12:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-0000ms-Rr
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:31 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwT-0005yh-9e
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:14 -0500
Received: by mail-wr1-x436.google.com with SMTP id h16so5640666wrz.12
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qq/IZh/lNupdEfHfwuJJO8Jpf9afj0T8EShIAYRtDBc=;
 b=RtT0sNPrw5d8hsn24FqjnmlYl4WkIsiIpF2fd9lmBxUuvXYRc0H1p6D3+2HGV3reM6
 XKFpMCo+PZHDAUtAGKM9TpHhpg5L1+K5m8GmvxBjr0M5l6kbacc6gbOAYiB9+ucXB0lo
 uIXh/m3D4o/kLrLdaySzEAP6GDmQrN/+pJHx9jcj3IVR0zMJxoNEu7nTYJXBgEP+VfHD
 mtXvkm1KGPxEZQFpnYbu6XGk25u9L+loGUb+PTllqTeQ4fsEdLd19UF1hEknHbUzusOW
 emhPbQXNsmizbLmuTa1gHZj0rAIni2pQcq4ulccJmzz9+3cqldmY5xtX4wldP+Ny9jia
 TEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qq/IZh/lNupdEfHfwuJJO8Jpf9afj0T8EShIAYRtDBc=;
 b=CQRk7+FkH6/QfvGSmVWyZAZEtnUa2cw9gQ4dEU+A/DdTI003RGWRe7IRKg98ot4hPQ
 sa1vbHL7o9SUf7hvtCO96Y7FiBx7QvKcxQmqpMnl4EGxCZfi/P6+r0K9hXVvo8pem8/g
 eIqN3KNFZ6P+5qeP2VM8gZiRXTXG7ayy6oyHvVyKDUwBvZrXY9w3EYg9DYyckZ1eHyDn
 Y/1voXDF/do0wojkR7qqKeDPV0dEWQ9Tufv4hSbitHcgFkyZ4GOjAKxej0m693bozl0J
 59Vkeo3jaeQWXEfi2o7zEr8nKdOQzcIXvCoyYjORN0RLqRtTLS0UrkF6m0uUzs0Ifa7n
 nMLg==
X-Gm-Message-State: AO0yUKXhsszj/4DpouYhTJvgU2VeZ2vj9MXnoO3AV9YvDzGvBQIzM12B
 W/EEmWROaOTkVmYk8Pmuq6izag==
X-Google-Smtp-Source: AK7set8Ei56EG1qobc8vH/E0VFkII1Wcp08+TopmaPaB6dCHlMI37DjZeS55oVsbCdQNZPIEWZ8bpA==
X-Received: by 2002:adf:f68d:0:b0:2bf:bcab:8e20 with SMTP id
 v13-20020adff68d000000b002bfbcab8e20mr8089240wrp.32.1674842111747; 
 Fri, 27 Jan 2023 09:55:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/23] target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs
 correctly
Date: Fri, 27 Jan 2023 17:54:45 +0000
Message-Id: <20230127175507.2895013-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

The encodings 0,0,C7,C9,0 and 0,0,C7,C9,1 are AT SP1E1RP and AT
S1E1WP, but our ARMCPRegInfo definitions for them incorrectly name
them AT S1E1R and AT S1E1W (which are entirely different
instructions).  Fix the names.

(This has no guest-visible effect as the names are for debug purposes
only.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf17..ccb7d1e1712 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7734,11 +7734,11 @@ static const ARMCPRegInfo vhe_reginfo[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const ARMCPRegInfo ats1e1_reginfo[] = {
-    { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
+    { .name = "AT_S1E1RP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-    { .name = "AT_S1E1W", .state = ARM_CP_STATE_AA64,
+    { .name = "AT_S1E1WP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-- 
2.34.1


