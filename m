Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C1C65F26B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:18:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMO-0000uA-Uk; Thu, 05 Jan 2023 11:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM1-0000Yw-A0
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLy-0007M4-9M
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:33 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so1774091wms.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4lYj5lfrX23EEPpJVAljAbbuQWpQ9S1qrdtCZ8SVOo0=;
 b=naDdzj0PBXlEs8HQw9FMQFoKAI5aUqssiWIBKtRjf6B1faIsU7Tasp15JKEfQiMKZ1
 Q9ptHA9WjYYKsPOGyUUKw0Mo9RVbQNYSKmwjudxcYOnZPO5KkC6GRVeRU9NXbi40DFyd
 P00khDvPCjPRlFKF3WOgLuebcd0MkMPOaXec8hQTBVwnT0piaHz1AN+1gk2+qvzCEO26
 nXYVxiw0yP0dBiCDeSgf5oH1ByzbCiuubuV//NwxykSdHUAjMWWeZe4f4ebIQtBZqgk1
 DT+5bN1xfcnCxuZ4Xyc2Bb6AcTuDEYbUuqMGoQauUVcgrl1KTHMHxW4Rh9P/3V1RHvRh
 QtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4lYj5lfrX23EEPpJVAljAbbuQWpQ9S1qrdtCZ8SVOo0=;
 b=3/6/h0IJIMTflepoNRTP76NRcB31khx/jUNBVwk3HYS6eUfTd5QNxDGtNjxfUP5G9M
 CQO8jVLqTcnUQBnFfQ0hm49K9Zo0R48TUqKw9UrAV+q+1tiLwk/0lR2NigjljAsCnSfa
 Fpnef0MfxyfrqS7R+K95nIMOE/+gi6R6VnZq4g0V8UIFwbcxthNPHCkh5emBubI5loeQ
 Cfza+zs1iaZG+vzqnPVBksZiPkUNL+szkJb6xfilCEYY5Q3cruatKKNhN/huD63S+96U
 dNO7Eqygt6awd8jJT3wfdfUSHuPpo7hrb5lNZgMhmLgLW9Aur0Jrxqjxuqj5qz94nynB
 0vEQ==
X-Gm-Message-State: AFqh2kqkEIal/MjQ0pK3pfMl5pBsq7EapU2TVtF/iojQOVNkxWP/K5CZ
 oXYKBGZaxK8210Mj2HwfXx7zkwG2HYD1mWAw
X-Google-Smtp-Source: AMrXdXv2mxu+kcol/Jeh5EphJpCWNal2k3yAGKFkupAPlgBUqsuNxb3E2+We/erBShE2ycJn+FVpbQ==
X-Received: by 2002:a05:600c:3d1b:b0:3d0:6a57:66a5 with SMTP id
 bh27-20020a05600c3d1b00b003d06a5766a5mr36113770wmb.0.1672937068350; 
 Thu, 05 Jan 2023 08:44:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/34] hw/timer/imx_epit: cleanup CR defines
Date: Thu,  5 Jan 2023 16:43:54 +0000
Message-Id: <20230105164417.3994639-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

From: Axel Heider <axel.heider@hensoldt.net>

remove unused defines, add needed defines

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/imx_epit.h | 4 ++--
 hw/timer/imx_epit.c         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 2acc41e9822..e2cb96229be 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -43,7 +43,7 @@
 #define CR_OCIEN    (1 << 2)
 #define CR_RLD      (1 << 3)
 #define CR_PRESCALE_SHIFT (4)
-#define CR_PRESCALE_MASK  (0xfff)
+#define CR_PRESCALE_BITS  (12)
 #define CR_SWR      (1 << 16)
 #define CR_IOVW     (1 << 17)
 #define CR_DBGEN    (1 << 18)
@@ -51,7 +51,7 @@
 #define CR_DOZEN    (1 << 20)
 #define CR_STOPEN   (1 << 21)
 #define CR_CLKSRC_SHIFT (24)
-#define CR_CLKSRC_MASK  (0x3 << CR_CLKSRC_SHIFT)
+#define CR_CLKSRC_BITS  (2)
 
 #define EPIT_TIMER_MAX  0XFFFFFFFFUL
 
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 2841fbaa1c8..661e9158e3b 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -82,8 +82,8 @@ static void imx_epit_set_freq(IMXEPITState *s)
     uint32_t clksrc;
     uint32_t prescaler;
 
-    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, 2);
-    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, 12);
+    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
+    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
 
     s->freq = imx_ccm_get_clock_frequency(s->ccm,
                                 imx_epit_clocks[clksrc]) / prescaler;
-- 
2.25.1


