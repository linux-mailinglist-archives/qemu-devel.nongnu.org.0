Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272DD65EF1D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:46:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJT-00035H-7r; Thu, 05 Jan 2023 09:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJG-0002q4-GR; Thu, 05 Jan 2023 09:33:34 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJE-00072E-TG; Thu, 05 Jan 2023 09:33:34 -0500
Received: by mail-wr1-x436.google.com with SMTP id w1so24198613wrt.8;
 Thu, 05 Jan 2023 06:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyIaDXUUe1E2lKeSs+MY3/RWeIYYGkm/0q2/wOL9FL0=;
 b=l/p9xp2BXiqo7l0rW7wMRwbrFFtiGX6hJorvNnPn7KqasSnxNrALe1Qb4TjRYQgdh/
 kOBAcaacAzU0yoG6iE4wupGIZacuZEf46ST7vwWYKYSmMLMcX5f9AgmDwl2uwg+4vghH
 Bh+BvxYqrVjNp2RNki84KYsC6BiSPrT6t5uHdTT0Dznwl53RyXRMFWkMhLe93T7/zU1M
 XjUz/y2h147paTnQKJkI9RHt5Xq6uJjhcBnZV+0xtSLIv2ql1o1hVbndBUib09CK/XZS
 5yFIlS8hczfryRTLKRTaxar75YhiIBg2PSe0sr4xS/Y4JwMBEUUbSIO1mgx4+cJfkqS8
 r+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyIaDXUUe1E2lKeSs+MY3/RWeIYYGkm/0q2/wOL9FL0=;
 b=fm40XxkIvF/gEH7kIMtR4VN/KxxbNvIgkxyBwSuAu/06wW0jPQNCcpjWviuhXCZ17v
 pGSn53iBKGW39zLUIvKUnzIgRU4JblNUbDXvp9FAwr49VHoWmFIYcCY5c+ZrHk5MUCOC
 bTrUqdDXKfw8QXNpiwwECDhRapwaKzHm9zF/BRXJei+ITFZCYWhk1AuVzfj5JzoAeiZL
 zwTG2qkEdlp2oQW2xb3nU5eJPS3+z4+7gb2dj6bvLsJtXAmZnKpQvyjmJGQaxiRjYwnW
 5YQf40fjAREBBWWLOTGxB7aQOfh+UWpBz6HqxI/nrVLonJIoAAeVoyA+e5F+D+PRsllU
 UHDQ==
X-Gm-Message-State: AFqh2kq/LqGo+Gwm4ZROxSMJIKHKOW6jG3foiddw/ZYBQwS9O0wBUxW6
 zvTnvcZ7nukippWCnXVaEj1/kAUTFDLPDg==
X-Google-Smtp-Source: AMrXdXtFCOm57qUdsz444K5XSp61OrjQpFebDFlNgMRNLHASqOmLAh8IsjchUBAOvpgxPxFxUM53yg==
X-Received: by 2002:a5d:4f8f:0:b0:279:f285:15f9 with SMTP id
 d15-20020a5d4f8f000000b00279f28515f9mr23185736wru.58.1672929210915; 
 Thu, 05 Jan 2023 06:33:30 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:30 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 22/31] hw/isa/piix4: Remove unused inbound ISA interrupt
 lines
Date: Thu,  5 Jan 2023 15:32:19 +0100
Message-Id: <20230105143228.244965-23-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The Malta board, which is the only user of PIIX4, doesn't connect to the
exported interrupt lines. PIIX3 doesn't expose such intterupt lines
either, so remove them for PIIX4 for simplicity and consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-32-shentey@gmail.com>
---
 hw/isa/piix4.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index de4133f573..9edaa5de3e 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -155,12 +155,6 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
-static void piix4_set_i8259_irq(void *opaque, int irq, int level)
-{
-    PIIX4State *s = opaque;
-    qemu_set_irq(s->isa[irq], level);
-}
-
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
@@ -204,8 +198,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
-                            "isa", ISA_NUM_IRQS);
     qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
                              "intr", 1);
 
-- 
2.39.0


