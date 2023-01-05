Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E322F65F29C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMO-0000uC-RF; Thu, 05 Jan 2023 11:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM1-0000a0-K3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:33 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM0-0007Ov-0u
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so1759183wms.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P2vsUh1KZZjl1KJb8eEAjrnadXinJSPoXxKJHFfBzmE=;
 b=U3kcW9JRoPNBIJ+pD9iACicumyH+81stmcE1sYz6Um0fAJXfwYpCAkAIB7E443GdjL
 m12TtsG3IWQkFad/4UiWgYFMOa+dC/dG/06X5DRHnVPCdTixrhsXYKruk5CA0RIf7Pr3
 1aScrl1bVyY+1UPzDbJfaRAztI4+eq5FtVBy5T5VYRMfz8BdjgnuNP+2SwBiUaE0kiNN
 fKF5/4NTCmTwFEYL5a9FI/DyCwU+9iqEL1KCNZEBwe3Ld/l6EuWWlRoT3q69UUYEezaw
 jGIqdtYDOi2HPSNmFIiSJ12aFlyiKxLLdOa6xVf4bienRfVh+Mvy3hhIXNh0zhtbRpoA
 cv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2vsUh1KZZjl1KJb8eEAjrnadXinJSPoXxKJHFfBzmE=;
 b=SP/5EJPtzGh3QlNX/HmNngC+8mKg47YXtlwYGBhlhbLMr5o6KdcjijNFTV0hJUpQw+
 C49rRIrQxsZcFB7DKNBneL7ICHOfAvZFYQorQin3oFyo55P2qkE4XdG4yg3JyElno94f
 jolF/73mjVFte2vxXPGIdc79hT3eI2nKHBNLaLldkfXszD3RHvZHjNNQEJgpgtzSw5ra
 +9v0afbXLkQuvkNIvShMye+OIqlMrih/IBGFmkFky8DxyrhQo6K3ogEeYaAsOstjlQaf
 0UbgptSQBD8L79vAVhH2VpsxzqhgkPAFKpQNwb47kNnZiGxAxK3BB25+LCl0hucW+skj
 pa6Q==
X-Gm-Message-State: AFqh2krmDpfxiU18PKu/qKwvPGudMHXXFDDQDeAFrdUoXmmkHiPHCaao
 0CwWN0PJy2YR3PsMEaxyvtXtGTi0n4CfWldt
X-Google-Smtp-Source: AMrXdXuKLgMcLRxSXUwSRjGC4uVheo0UgBstfkBiqht71Ult3Ub+OsNpXuBXlU+4/ZGPvMfbiDUhGg==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:b07a:cd2f with SMTP id
 ay29-20020a05600c1e1d00b003cfb07acd2fmr35644674wmb.37.1672937070719; 
 Thu, 05 Jan 2023 08:44:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/34] hw/timer/imx_epit: hard reset initializes CR with 0
Date: Thu,  5 Jan 2023 16:43:57 +0000
Message-Id: <20230105164417.3994639-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/imx_epit.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 7af3a8b10e8..39f47222d05 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -99,12 +99,14 @@ static void imx_epit_set_freq(IMXEPITState *s)
 /*
  * This is called both on hardware (device) reset and software reset.
  */
-static void imx_epit_reset(DeviceState *dev)
+static void imx_epit_reset(IMXEPITState *s, bool is_hard_reset)
 {
-    IMXEPITState *s = IMX_EPIT(dev);
-
     /* Soft reset doesn't touch some bits; hard reset clears them */
-    s->cr &= (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
+    if (is_hard_reset) {
+        s->cr = 0;
+    } else {
+        s->cr &= (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
+    }
     s->sr = 0;
     s->lr = EPIT_TIMER_MAX;
     s->cmp = 0;
@@ -205,7 +207,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
         s->cr = value & 0x03ffffff;
         if (s->cr & CR_SWR) {
             /* handle the reset */
-            imx_epit_reset(DEVICE(s));
+            imx_epit_reset(s, false);
         }
 
         /*
@@ -377,12 +379,18 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
     s->timer_cmp = ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
 }
 
+static void imx_epit_dev_reset(DeviceState *dev)
+{
+    IMXEPITState *s = IMX_EPIT(dev);
+    imx_epit_reset(s, true);
+}
+
 static void imx_epit_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc  = DEVICE_CLASS(klass);
 
     dc->realize = imx_epit_realize;
-    dc->reset = imx_epit_reset;
+    dc->reset = imx_epit_dev_reset;
     dc->vmsd = &vmstate_imx_timer_epit;
     dc->desc = "i.MX periodic timer";
 }
-- 
2.25.1


