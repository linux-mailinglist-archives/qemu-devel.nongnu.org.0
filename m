Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15C53C09A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:07:33 +0200 (CEST)
Received: from localhost ([::1]:52734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsyZ-0004ma-1q
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgr-0004jc-K6
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:13 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgo-00007f-5q
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:12 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y196so5796170pfb.6
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVdCbtqKJB+BGb16fkMGEP1znoVx5B0GA093B8K9G20=;
 b=KNfZlP6yJZDFXACTPRfi4EbrMfgsEzutIG3+fbyxZpaeovls7niVdVVVFPRttkO2pP
 il04JEDcxu5V3N5cZVWv6D2fXZOo2XRamhbwInmkP/D9EXd29zLvLf5p9j9pdb8VnLD/
 E0eLyUkhmHynlSVaT1ZokQIQ7viKhJM/69ttuE7JFVWKnkhkCl0RhocqBwyX3yk6a000
 7Iz6nBXaEMSxCRQoT7QEfhQELIgrGBCoFXFJ2/Cb+wIP87rX2giACzYxO1ZBnSqbb+8X
 uudmtc0p3QLvNTTovmYjAvgi+DAUIYkD5ntN/uT1tHic0xZiQzfhr8OzxA1A0bmtQHfX
 lt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OVdCbtqKJB+BGb16fkMGEP1znoVx5B0GA093B8K9G20=;
 b=aV7Q83qKPw8xrjb12gO/7wBfXLGs2g9okdEM9gZyv7NzsSZI1ClBLjdlEowA8r3rGL
 E2j55FpaEzQr+tqvgYfJEKYHuBVP9G2lod+Bk87g4Ti4dAjLOFRw1b8DzWzy12j4Phfe
 rO2f9R0XNBMoirmbDLVyka/h7aKC5oGeY625qOu1I96mmRgQUP7SFCNKqm+shnbPt6Di
 hzmg+MZL1+sYEB56rBV185dW2c8nJatXhAP8XKmohPRRUG7QVpu1YDoudoXa10+usZu2
 Fo1ibh5JFI3mwrZeMp03acMvNw7psx/tICDsKZCPxpaiNvSxs4/rCuafSLL/0F+aoO5N
 7AKA==
X-Gm-Message-State: AOAM531a+CYVygZzGM6DZ9pBmcXPpALw0gkEw02yuGCDC2u5/BQf25zU
 38xqNIrRCuxmAoRRa9p037aYnIRwFi2dgg==
X-Google-Smtp-Source: ABdhPJxijk1ucxea59Kl2mepk90PCk+ARkva2AN01ieXBptqQVHZ4NB4vawI4WlwK4CZAghJy27Tbg==
X-Received: by 2002:a62:1784:0:b0:51b:bc40:28a7 with SMTP id
 126-20020a621784000000b0051bbc4028a7mr7108669pfx.55.1654206548406; 
 Thu, 02 Jun 2022 14:49:08 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 16/71] target/arm: Use expand_pred_b in mve_helper.c
Date: Thu,  2 Jun 2022 14:47:58 -0700
Message-Id: <20220602214853.496211-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Use the function instead of the array directly.

Because the function performs its own masking, via the uint8_t
parameter, we need to do nothing extra within the users: the bits
above the first 2 (_uh) or 4 (_uw) will be discarded by assignment
to the local bmask variables, and of course _uq uses the entire
uint64_t result.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 846962bf4c..403b345ea3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -726,7 +726,7 @@ static void mergemask_sb(int8_t *d, int8_t r, uint16_t mask)
 
 static void mergemask_uh(uint16_t *d, uint16_t r, uint16_t mask)
 {
-    uint16_t bmask = expand_pred_b_data[mask & 3];
+    uint16_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
@@ -737,7 +737,7 @@ static void mergemask_sh(int16_t *d, int16_t r, uint16_t mask)
 
 static void mergemask_uw(uint32_t *d, uint32_t r, uint16_t mask)
 {
-    uint32_t bmask = expand_pred_b_data[mask & 0xf];
+    uint32_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
@@ -748,7 +748,7 @@ static void mergemask_sw(int32_t *d, int32_t r, uint16_t mask)
 
 static void mergemask_uq(uint64_t *d, uint64_t r, uint16_t mask)
 {
-    uint64_t bmask = expand_pred_b_data[mask & 0xff];
+    uint64_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
-- 
2.34.1


