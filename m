Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF847579C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:17:40 +0100 (CET)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSHz-0002Lk-8A
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:17:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiX-0006jY-WB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:02 -0500
Received: from [2a00:1450:4864:20::434] (port=38840
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiR-0008Pj-Hz
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:00 -0500
Received: by mail-wr1-x434.google.com with SMTP id e5so3954960wrc.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VvbtSNqnCuWy9Lo0vAw5pT9GzYQL9wEGhx1QER6IeB0=;
 b=qTRm6+NJOa0MM8Fb7Mp8Yt91aDCD8SYT5sFeY+FsCY082qqj6KbIhaumn11gHnUGSl
 ATug3b/SFeaiM8N5plAO6LYGkMDL1YNme3HIpdxnEVYVMyJj7JFzAZsdSH/RbY8ExSjo
 maXIHEX6oMkwRxQJpSQk6nzsWowEgDahNhv4cn74FMukswBACImEmF9I2lj97Nw93oaH
 mNZHB/5etT/OdUgJiDJBa/Oo8fkphYLxBgsLfJp8O9qVY1vgHRFchxRCH+Q+5gSU4Co9
 6wRjpntAW7rKzZb75SILtVGZYc6kzdRy5W1i4SC9TT5kcrXrMzVMl47gViNT+nz3UwjZ
 mFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VvbtSNqnCuWy9Lo0vAw5pT9GzYQL9wEGhx1QER6IeB0=;
 b=nejPVL/Db0qjxrk4SGGvjo7t6N53tf8dmHaY8USgXFJc14p472cCmpGOaRhNobIHAg
 e1d4lGpgT9NQW/octafDycF6geovBYNXjqolY0drrTRcGjbQE7c6hGPXW05OJR1UlpdH
 Ff+Np2m5MELYz/KHt01YRYsZHomJF8nCMTvpe4wDyHwJ/7mo5/DaEe7vUf3dU27CNmB4
 NR4br2yC1BGTG3G9QWAf8ib1+fipeTWiCVl5lLsNEteIW06hRBUeK2x/jqPb5baJsi+E
 QArPT3fVHXut6NklQnP7HvxbMlKiki+Sqylo9F9WH74gKx7WIyztLjSObzr2Srw13kYp
 T9uA==
X-Gm-Message-State: AOAM533cq5CeBZsDTXyxmeunsDcJTeSPxMt3DC5DquVeaGOG7RR/xh9i
 jkTqwlhrPimBB/RsbD6VG7Z36d4yS3gsjA==
X-Google-Smtp-Source: ABdhPJxabwHmBT6lkI3rKhrmwtUvbOP1JJuXqPhMEaUlcMh9UbQznKepa2bijNHrDzNZYz/5ZA37tQ==
X-Received: by 2002:a05:6000:1201:: with SMTP id
 e1mr3776644wrx.298.1639564853884; 
 Wed, 15 Dec 2021 02:40:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/33] docs: aspeed: ADC is now modelled
Date: Wed, 15 Dec 2021 10:40:21 +0000
Message-Id: <20211215104049.2030475-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Joel Stanley <joel@jms.id.au>

Move it to the supported list.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Message-id: 20211117065752.330632-5-joel@jms.id.au
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/aspeed.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 6aafd611e9a..d8b102fa0ad 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -56,13 +56,13 @@ Supported devices
  * Front LEDs (PCA9552 on I2C bus)
  * LPC Peripheral Controller (a subset of subdevices are supported)
  * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
+ * ADC
 
 
 Missing devices
 ---------------
 
  * Coprocessor support
- * ADC (out of tree implementation)
  * PWM and Fan Controller
  * Slave GPIO Controller
  * Super I/O Controller
-- 
2.25.1


