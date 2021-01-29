Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025EC308953
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 14:27:59 +0100 (CET)
Received: from localhost ([::1]:58782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Tob-0006EL-Vb
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 08:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tky-0003je-LC; Fri, 29 Jan 2021 08:24:15 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tku-0007xw-Ew; Fri, 29 Jan 2021 08:24:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id my11so6461217pjb.1;
 Fri, 29 Jan 2021 05:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jrYO5yz/J2x1yetvpXGtvLlgKXHVau4sRG7K210isU=;
 b=Jsdz9+/f/5wZFbrhXlxddOR3acr3mlGNT9rupY8Zl7SRBzvlgJMLKLEdvV8NY340ip
 bZHy0JFACntK7/mqWYLmyna29/oXiMNgr44k5kmmqX0LY9tEMiGNahoaA39TP/LZioWj
 nWRre2JvyEATHPrOMNEyBFqUf5nBENN4SRik/g9B6iMyKngy1zJNsOfhGdmm/gZeSltI
 Hx24nBjx3LxSmX3xLLgmvPXCOxBk4Vv5Dcktqf0KctWjP1OwQHq8MeYPWQXYGK6P3VGU
 7MP3Ga1yypb38NC9FOByRoBmrdNXq5+OctlWta6+Lb3HdXZ+o2F5JdypevovXGrflknV
 L9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jrYO5yz/J2x1yetvpXGtvLlgKXHVau4sRG7K210isU=;
 b=gdUSVpxcPLVRT7NYVdgIqVli/LpjhnKLGipDOLS2kWBiV/2WV0Cwq9Jrd4ZbR6vqiZ
 C7lRZXYimcf6O9Xl4L0elCvuXKxGyja0PXDvwzCnoskaAHZc6/2KqL9lj+glSaLDD21E
 93viJp6YV+AFfO9MZEkCCroHyRREmQhYfmdeOduWtrnk4AWvGZ3UKIcxwNddLXQK4OtE
 QQWhHv1wOCgqzEx2X/f2ItMu68qypfgbXSY8x+xWvjUuj0mx+uV99ME4f3R1TssFFhbD
 zCZwXeRkvq3gQHPMTqtVcHtnTVsyj3cgazoKnsy5g1sZNk2eBh+dSndAdr5EC7wy3AiL
 fDkA==
X-Gm-Message-State: AOAM533TeTf894JP/5Cq9cXQC05SzbUixFazbgHn56CQKrJz29M2ypmr
 il0PMgrwJKFCbRawCI68AXc=
X-Google-Smtp-Source: ABdhPJxwmX9NVkeIvUbjKBU3la09esY60T104AFAGjfoht4KeQ02bm3yVXzmYUjUsbvruLB5c43xdw==
X-Received: by 2002:a17:902:9044:b029:df:fa69:1ed1 with SMTP id
 w4-20020a1709029044b02900dffa691ed1mr4204665plz.11.1611926645606; 
 Fri, 29 Jan 2021 05:24:05 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:24:05 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 03/10] hw/ssi: imx_spi: Remove pointless variable
 initialization
Date: Fri, 29 Jan 2021 21:23:16 +0800
Message-Id: <20210129132323.30946-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

'burst_length' is cleared in imx_spi_reset(), which is called
after imx_spi_realize(). Remove the initialization to simplify.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210115153049.3353008-3-f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v7)

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] remove pointless variable initialization

 hw/ssi/imx_spi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 4d488b159a..8fb3c9b6d1 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -434,8 +434,6 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-    s->burst_length = 0;
-
     fifo32_create(&s->tx_fifo, ECSPI_FIFO_SIZE);
     fifo32_create(&s->rx_fifo, ECSPI_FIFO_SIZE);
 }
-- 
2.25.1


