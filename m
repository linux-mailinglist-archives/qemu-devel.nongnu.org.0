Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0EE6154F9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 23:30:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opzlW-0002Jo-43; Tue, 01 Nov 2022 18:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opzlT-0002Im-72
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 18:29:47 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opzlQ-0007YS-O3
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 18:29:46 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so233199wms.0
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 15:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iymhNZLF53NrqTp0QR9MiHOgmBR1A7K6EW0buIZrzQk=;
 b=ZdPzG6fuw2tvcDbcpZjneipZuRZcOFDIUB5eD2dyXbauCfB1CadwoJ6VgS8FX1hxm+
 lTYCn54EmH6SC1TvRB5LkSlaNxAD/KZNugk/b4G6I8r1HZqr1E4sSQ9s8Jt3bKtyCTEX
 WoWh1NfFE3RtykZqw8r1q5irCb1MobEdUti071kYQAO9I8D/IMVTVvncouA59++L8Vdq
 lHGGibscv+8zaCOYVpTjbnDvWPt/6BQ2Conul8pswdWY6Fa+hBh3saMnHjvhe5xa9boN
 2/tQ6+JU1sacI/9l/y2K51dovULa5oOZBjSFnLDDShR93j9W2+dXb+xMaEqpVN7hP5Rp
 Tw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iymhNZLF53NrqTp0QR9MiHOgmBR1A7K6EW0buIZrzQk=;
 b=eMUugONQC+gtsAUJIAIYUyqFA7tAcrO+JMQXuO4ngfFhsOUqJ2GjWgKEyGtJLX+tNu
 4g8oUcqY9OXiBvkFTlq3w2gqfzWcp5sU+efeGcEMZ4aFFgujdNHbjnIWp3ANtSubjH6e
 cICS1AILRYRuugrmLB32Vt/wH6mQqHJgQU1KL9dlCOV0AlTk4iPxETnif/S2EteSJOcO
 S2qfEgeFJFnBDJIEhFBwUVNl6KbzjSGc2J2AAnNl5KoIY57Y/qAh/GKR76QK9aI8RMEy
 K42os+3640Ps/SSeW5yT76bgM6N4ei2wU6Hxa0YFaetoy7tBl5OXNWqKYXyxO3iS8o91
 CJUw==
X-Gm-Message-State: ACrzQf2FpoXgUNUY5BWYFJoJQA3DBo68X2P09/2Zh0moTiKPMuHF4hUk
 AINM1QGtKkqF/1/c4mIQG7QpMMjRxz7l+Q==
X-Google-Smtp-Source: AMsMyM6aYgRBqQzr1gmUEIYbJGYW3RXDcpN0DD9FJKLuOtz7HdP6lVYUUNnlSKnKJmfja/ddLOa7sw==
X-Received: by 2002:a05:600c:4307:b0:3cf:85fe:4d97 with SMTP id
 p7-20020a05600c430700b003cf85fe4d97mr49199wme.89.1667341783073; 
 Tue, 01 Nov 2022 15:29:43 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m39-20020a05600c3b2700b003bfaba19a8fsm25504wms.35.2022.11.01.15.29.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Nov 2022 15:29:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v6 1/3] hw/sd/sdhci: MMIO region is implemented in 32-bit
 accesses
Date: Tue,  1 Nov 2022 23:29:32 +0100
Message-Id: <20221101222934.52444-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101222934.52444-1-philmd@linaro.org>
References: <20221101222934.52444-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Tested-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 306070c872..22c758ad91 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1332,6 +1332,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 static const MemoryRegionOps sdhci_mmio_ops = {
     .read = sdhci_read,
     .write = sdhci_write,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
     .valid = {
         .min_access_size = 1,
         .max_access_size = 4,
-- 
2.38.1


