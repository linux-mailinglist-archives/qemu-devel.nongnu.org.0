Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F76167EB8A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:49:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRtE-0002MI-Nk; Fri, 27 Jan 2023 11:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt3-0002Hz-RL; Fri, 27 Jan 2023 11:47:38 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pLRt1-0005eR-RX; Fri, 27 Jan 2023 11:47:37 -0500
Received: by mail-ed1-x52c.google.com with SMTP id v10so5240258edi.8;
 Fri, 27 Jan 2023 08:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYw6G42pi8UOWyOtpdnzKOJ0Zg1+A+c32gMwSKzPG4g=;
 b=hAnWUr9jcQ0CS+8Zgz7+DppjLIX8+lmCikfzCosa4IE+n/eBLEO4koTZSFSLdvLjYm
 AJBblYqDHU+3497ZPXtAhJGGbk561eazBoefIuoUgdv03oRgUYh/0JkHAetXmrzdj17U
 zviVxfIhiKNBNhYiJ6s7jcr4iliEy0ZwBKiHD1BsXPs9LJt57YUJ+MD0RGk7inH0K+7Y
 TrkZ5RsIQZeKBOrnOaEY9R3iy03cka08gq8W/+7C4+ynOOX9NDZIbWqGRqLOE9druODT
 ZQzgm7pWJNbNj13ASfj0b9iYSbHt40wdHIMpyGzjn41j0J0K3TU8gJyabLe5ahrtnJNM
 moYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYw6G42pi8UOWyOtpdnzKOJ0Zg1+A+c32gMwSKzPG4g=;
 b=pQhlhZAYcBs+y7ffFGl1fGh7dG39FAif4N0nqokvSFRyE9/tNxYOOJhglkTioPa+m+
 ttb6cvaL9gKzYxuEGlWG3og/xBVEJopDd40IJC7ynckwZQvV0D+f6MPNfRPpigDUBLwU
 iHRZlxIXGxa5onPDzxzYJhmdK4mhENRp5WDQWME1sOwwr6gTbDRidBacfJTsGV+9HFJU
 igBipcVFhfcbGD63Xn+zHU+hniG4GJLXPU4RDw/urD0Ky8s6Ti/FUu9M5ql0B4zEQ6zE
 VkQSUuDGDU9d2qb21Xd8k/PD0kcltAguQqEwtAfSvAIxP5DY4Va/sM0oI262n4W0flqs
 8hFQ==
X-Gm-Message-State: AFqh2kqx/pLv5Zo0Wi4oJpYdG9SqeNlkyEHI++KODHYU27k/1nTHyIPh
 aE2wW1mJI2SMQL5es117N4Y0f64bDRx6WQ==
X-Google-Smtp-Source: AMrXdXt4xaHDEGF2xKtORnWWZHR2Foi3ZVyAvbxwAr1RkdQ95odcznrL2UUdSm2Fx30QhqGqFcYCxw==
X-Received: by 2002:a05:6402:1484:b0:49e:9d82:49d6 with SMTP id
 e4-20020a056402148400b0049e9d8249d6mr29687857edv.10.1674838053875; 
 Fri, 27 Jan 2023 08:47:33 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056402050f00b0049ef70a2894sm2574414edv.38.2023.01.27.08.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 08:47:33 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/7] hw/i386/ich9: Rename Q35_MASK to ICH9_MASK
Date: Fri, 27 Jan 2023 17:47:14 +0100
Message-Id: <20230127164718.98156-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127164718.98156-1-shentey@gmail.com>
References: <20230127164718.98156-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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

The Q35_MASK macro is already defined by TYPE_Q35_HOST_DEVICE, so let
TYPE_ICH9_LPC_DEVICE have its own one to prevent potential name
collisions.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/ich9.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 222781e8b9..36e0ccd16a 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -75,7 +75,7 @@ struct ICH9LPCState {
     qemu_irq gsi[GSI_NUM_PINS];
 };
 
-#define Q35_MASK(bit, ms_bit, ls_bit) \
+#define ICH9_MASK(bit, ms_bit, ls_bit) \
 ((uint##bit##_t)(((1ULL << ((ms_bit) + 1)) - 1) & ~((1ULL << ls_bit) - 1)))
 
 /* ICH9: Chipset Configuration Registers */
@@ -137,13 +137,13 @@ struct ICH9LPCState {
 #define ICH9_LPC_NB_PIRQS                       8       /* PCI A-H */
 
 #define ICH9_LPC_PMBASE                         0x40
-#define ICH9_LPC_PMBASE_BASE_ADDRESS_MASK       Q35_MASK(32, 15, 7)
+#define ICH9_LPC_PMBASE_BASE_ADDRESS_MASK       ICH9_MASK(32, 15, 7)
 #define ICH9_LPC_PMBASE_RTE                     0x1
 #define ICH9_LPC_PMBASE_DEFAULT                 0x1
 
 #define ICH9_LPC_ACPI_CTRL                      0x44
 #define ICH9_LPC_ACPI_CTRL_ACPI_EN              0x80
-#define ICH9_LPC_ACPI_CTRL_SCI_IRQ_SEL_MASK     Q35_MASK(8, 2, 0)
+#define ICH9_LPC_ACPI_CTRL_SCI_IRQ_SEL_MASK     ICH9_MASK(8, 2, 0)
 #define ICH9_LPC_ACPI_CTRL_9                    0x0
 #define ICH9_LPC_ACPI_CTRL_10                   0x1
 #define ICH9_LPC_ACPI_CTRL_11                   0x2
@@ -162,7 +162,7 @@ struct ICH9LPCState {
 #define ICH9_LPC_PIRQH_ROUT                     0x6b
 
 #define ICH9_LPC_PIRQ_ROUT_IRQEN                0x80
-#define ICH9_LPC_PIRQ_ROUT_MASK                 Q35_MASK(8, 3, 0)
+#define ICH9_LPC_PIRQ_ROUT_MASK                 ICH9_MASK(8, 3, 0)
 #define ICH9_LPC_PIRQ_ROUT_DEFAULT              0x80
 
 #define ICH9_LPC_GEN_PMCON_1                    0xa0
@@ -172,7 +172,7 @@ struct ICH9LPCState {
 #define ICH9_LPC_GEN_PMCON_LOCK                 0xa6
 
 #define ICH9_LPC_RCBA                           0xf0
-#define ICH9_LPC_RCBA_BA_MASK                   Q35_MASK(32, 31, 14)
+#define ICH9_LPC_RCBA_BA_MASK                   ICH9_MASK(32, 31, 14)
 #define ICH9_LPC_RCBA_EN                        0x1
 #define ICH9_LPC_RCBA_DEFAULT                   0x0
 
-- 
2.39.1


