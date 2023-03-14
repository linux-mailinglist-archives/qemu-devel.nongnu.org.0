Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1F06B9154
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:15:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc2ce-0000A8-Pv; Tue, 14 Mar 2023 07:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc2ca-00007G-Ce
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:15:12 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc2cW-0007Rd-1L
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:15:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id ay8so4743112wmb.1
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678792504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qfZpyN/6cn0lQTIIg8sb3mDy2U0N3ziNO6V5wkqMbpY=;
 b=vEMvkQFoTD6l2YhEVl17hTKEZbQ0RGgx1kItCOdkx2tHxYLaWA011BqAYE8p1cW6c2
 hV1H3pzV8WX3yawPB/2dywzk6+P+jP1joVbgMRCZjQmayp0LPZltfDMqWB2FwInMDCrZ
 8Sjz/MlGNIdAd6/k0Mo2FxIKn8VrBzE7yCBKG3nS5HnnjP16b/LIkb/k3GJGc4J/lZSM
 t9OyglpzNclAa/agGl9Z0MNRFUabetx6rJ4rTn8wRcgRnRZCDgM+3iJAxtXbC4+i45zi
 /vjnvNioPNTPxlF6s4lZM1HURbzoa4AwmXNI5cnoCNPRg0aSDqTuK5QVQucr1bN8TKGr
 SFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678792504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qfZpyN/6cn0lQTIIg8sb3mDy2U0N3ziNO6V5wkqMbpY=;
 b=my20oqIJQY3Vg2PqGPRBLBKJjMdaBZByWuNLJhLc9GmTi9jrelms8dU2A1Z4diruLQ
 qrCJ/PsTnGUxnonOW47gI8RnSZP69JgzDmSmBJvEYNpnzrqe5AlPkkujdS2rkBHM+Jxg
 cQKjnIkRGsLf8bu/VEYbh9dL6G1UsyG0vFcEzmTH6MFQV5N0hpZ2HgJ+Cl4Yof9LUQWt
 V40ZwvYUPNLVVADyWvUxLwcrfrYYMJLSsfw8T3o+muEvOWE0RvMdo6k/3FsqD5osorV+
 +FSPmpuIE64m52qzS12gymCn4elBjJT3sTQNPtYYHYakzQSJPC74vfw4FNWKRJpKe2Kw
 R/yQ==
X-Gm-Message-State: AO0yUKWveh4H4/JUD+0Aer+/l/ygWTgfrXt5YCFKDm/9X7PLDEgtuk0D
 yrht5GJ2o6L3JRhvIHQXibEu6/58XxvbPxVvzE4=
X-Google-Smtp-Source: AK7set+Ospj7RQZCA/QwXD/NFFZTeVGwidP2Tb6tPxJv0RGh6mgxtLktIQgkmaAJpgXlixukp12SWg==
X-Received: by 2002:a05:600c:4f53:b0:3eb:29fe:7343 with SMTP id
 m19-20020a05600c4f5300b003eb29fe7343mr13839323wmq.33.1678792504495; 
 Tue, 14 Mar 2023 04:15:04 -0700 (PDT)
Received: from localhost.localdomain
 (233.red-88-29-167.dynamicip.rima-tde.net. [88.29.167.233])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a1c7712000000b003ed2987690dsm2450277wmi.26.2023.03.14.04.15.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Mar 2023 04:15:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/4] hw/pci: Ensure pci_add_capability() is called before
 device is realized
Date: Tue, 14 Mar 2023 12:14:35 +0100
Message-Id: <20230314111435.89796-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230314111435.89796-1-philmd@linaro.org>
References: <20230314111435.89796-1-philmd@linaro.org>
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

PCI capabilities can't appear magically at runtime.
Guests aren't expecting that. Assert all capabilities
are added _before_ a device instance is realized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index ac41fcbf6a..ed60b352e4 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2397,7 +2397,7 @@ static void pci_del_option_rom(PCIDevice *pdev)
  * On success, pci_add_capability() returns a positive value
  * that the offset of the pci capability.
  * On failure, it sets an error and returns a negative error
- * code.
+ * code. @pdev must be unrealized.
  */
 int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
                        uint8_t offset, uint8_t size,
@@ -2406,6 +2406,8 @@ int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
     uint8_t *config;
     int i, overlapping_cap;
 
+    assert(!DEVICE(pdev)->realized);
+
     if (!offset) {
         offset = pci_find_space(pdev, size);
         /* out of PCI config space is programming error */
-- 
2.38.1


