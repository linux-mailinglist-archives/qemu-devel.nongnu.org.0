Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593566A8C1D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:44:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrdZ-0001Pi-Bc; Thu, 02 Mar 2023 17:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdX-0001LR-QZ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdW-0000Ea-7D
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:55 -0500
Received: by mail-wm1-x32e.google.com with SMTP id p16so560253wmq.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bd1OtqBygG3Ey4k52ycKQXbZ8TYrh9zI9oYB+ByJfKQ=;
 b=CrJZMr7NS+K1QFqpo31b6xY5hqthq8dEBov+MA1lV2MpErknHKeDWvcWwB+0go9Mtx
 9SdneTw2a3YbL0Km/+r3ve0MLPsYkdX3tDY3Zu+PfJnJm/WebLC4OV+EwYEBbeSK9qxy
 3HsNloyEwb2rGPIFbRqX63jngRYf5nowJnSjXwZYoHMIJRrrZn5AbRzWHzbxCi5y5UAj
 VLH295r57xm5jSiMhzBpJzmZcuR3XJk9SITV2TC9M3o2i+PMeziwpFoVovFwYLJ7hGsR
 bEJaXbu/lfuZj9Xa86LkuOUzxIHU48swjyo4DBdfNRH7db2MuOiybI/5B/g5cQF8b0bg
 yPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bd1OtqBygG3Ey4k52ycKQXbZ8TYrh9zI9oYB+ByJfKQ=;
 b=duFopnm0f0/nB6kyPJYdhLa43WiyknQV6uP68LsJKT3LvdcuRyQ4Yh3rpL9sAxfvrs
 HfqGRFGRngupHTW9XmAOefqPxWhX/Eo4Dqah8aHjpXoBDE5tu/z63rynJndJG6YJ3wdO
 CPk2CyfsP834zj1AmZ5KxPM8HfjgBf7XsFPFFsthF1/1klt2yqzh3S3z56czpP1LbuPL
 wNXBX/9KSErFQYDNWAtdXueJq16UiyzSVolL8WPjl4IzE0PnWpO7+QmCv+oLeAzPTbJp
 RXaEdPUDq8/5xPRdNYrDHni9DMKsKhWpO+uqO35DU0nuNCdl1e1kXV4zocOvsc7t2pYE
 +C8Q==
X-Gm-Message-State: AO0yUKXv6m51Y4A21slNWTUMCGDoqj1Z+8Hgmd9OeJsfi2a7NNFmI4wQ
 1P/+x1q4xsslsJBejpRCy1vJB2REDLxYFVG9
X-Google-Smtp-Source: AK7set+4wGgqRXa9ikkWTvI3IuwHWQK+z9OdJ2hJcOAMKxaAK5M1h8NbHimtPCF1N7wKZUe1jqRhow==
X-Received: by 2002:a05:600c:181d:b0:3ea:f6c4:5f2a with SMTP id
 n29-20020a05600c181d00b003eaf6c45f2amr8904936wmp.17.1677796973389; 
 Thu, 02 Mar 2023 14:42:53 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 k8-20020a5d66c8000000b002c573a6216fsm500468wrw.37.2023.03.02.14.42.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:42:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 15/18] hw/southbridge/piix: Use
 OBJECT_DECLARE_SIMPLE_TYPE() macro
Date: Thu,  2 Mar 2023 23:40:55 +0100
Message-Id: <20230302224058.43315-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Manually convert to OBJECT_DECLARE_SIMPLE_TYPE() macro,
similarly to automatic conversion from commit 8063396bf3
("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/southbridge/piix.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 0bf48e936d..a58bf13a41 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -29,7 +29,7 @@
 #define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
 #define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
 
-struct PIIXState {
+struct PIIX3State {
     PCIDevice dev;
 
     /*
@@ -57,14 +57,12 @@ struct PIIXState {
     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
     MemoryRegion rcr_mem;
 };
-typedef struct PIIXState PIIX3State;
 
 #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
-DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
-                         TYPE_PIIX3_PCI_DEVICE)
-
 #define TYPE_PIIX3_DEVICE "PIIX3"
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
+OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_PCI_DEVICE)
+
 #endif
-- 
2.38.1


