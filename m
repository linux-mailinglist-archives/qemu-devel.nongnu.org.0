Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CC36A4F7B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:04:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmUx-0007TF-B0; Mon, 27 Feb 2023 18:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUv-0007OH-Ly
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:33 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUt-0000yI-Sg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:33 -0500
Received: by mail-pg1-x529.google.com with SMTP id q23so4565466pgt.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZqDXhMcCOeub1Ju764Ko+HifWn9WFHZoVwIsyr5duY=;
 b=xo6w2ztMChST+elFtliGIIapTKSUnZGcrkEYJYGlf0MJER4vrma3y4pEhWVznNOivR
 fC8+0SIt99uQhLg+5fwR+2xXSCHnLzBq0jO8TX7wq7XMlVPT5Jkfsjh2IA2QzS1NzFQu
 0adc8sxEgBlBryao6cpZQ4YFz36KNX5p3JPnASWNg7t/S5XXUC9EXDjUvJgiDSWDMsDy
 yTyd6dpwNG6Wxmy6dl1AtcNvCXNprHPtEO2wg0yHdrf3yzuwznLmSOVvWwA10lwI8XSV
 U1n3B4WigkiDvfIuO+D+yoIEzp/zZbMaJcGEPOWNbMi1giB43hmSzT62P988DZfG5wmy
 Gr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZqDXhMcCOeub1Ju764Ko+HifWn9WFHZoVwIsyr5duY=;
 b=ni6pZ2GjSXeAF3iscXqMqm9Wei+OEIBnrIszMQHUAubHNWQ4utg9/XHwgog122ax4T
 cBdYrKbR33ZxXl+pHsSo7sZNGpFLHTf3ki8qzIB5ahoxDG3EQ7NjNqZtLaZ/MIlNdcJJ
 WMceBGGLijqCCNU65HAADE7LdZudjfTUAIHOpm4wZrg7KOkW3gysOPNLXgOjA939112z
 jO+EDwL3h/FI9UVklM4EbzvQEJpB1SNlAnx0+sjJsQ+m6XZVAM91v8FBUAOMVsTalThQ
 6ETTayQj69Su572uTUBWA3Xp9XWo5KVTInOCYO9//TmSOk1SG+SghGIm8AKfjTI/M66D
 PoaQ==
X-Gm-Message-State: AO0yUKXcCz6T3i8pJZqObo7ZuVSzDEzXpDc5YrGZKC2qFehPp0XbVOMA
 eajauP0VAFLFbZC8QPWT98m57F3/BcVID+vxoes=
X-Google-Smtp-Source: AK7set/fIBzPGvlhhC3NRhYmhPCyAlnzVBbpxSmmw2MQaDlovoBXHYtbrzLkpfnnu9u7BmWrDFvlBg==
X-Received: by 2002:aa7:8f0b:0:b0:5a9:c535:dba3 with SMTP id
 x11-20020aa78f0b000000b005a9c535dba3mr567113pfr.25.1677538890324; 
 Mon, 27 Feb 2023 15:01:30 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 03/21] target/arm: SCR_EL3.NS may be RES1
Date: Mon, 27 Feb 2023 13:01:04 -1000
Message-Id: <20230227230122.816702-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

With RME, SEL2 must also be present to support secure state.
The NS bit is RES1 if SEL2 is not present.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 66c578c360..20e28d5e09 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1856,6 +1856,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         if (cpu_isar_feature(aa64_sel2, cpu)) {
             valid_mask |= SCR_EEL2;
+        } else if (cpu_isar_feature(aa64_rme, cpu)) {
+            /* With RME and without SEL2, NS is RES1 (R_GSWWH, I_DJJQJ). */
+            value |= SCR_NS;
         }
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
-- 
2.34.1


