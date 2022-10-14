Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A645FF06F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:37:06 +0200 (CEST)
Received: from localhost ([::1]:50306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLo9-0007k6-SL
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojLg8-0000jT-Bh
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:28:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojLg5-0000EE-Ak
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:28:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id j16so7840390wrh.5
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 07:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9BVL8lIrmB6e94ewrgZ2edOtQrRa/f+DyHdENfUpMUM=;
 b=tkMjuCuoj/MdJ5jzxnzQpsrCAFaxnn1WrGSZGE6vL/d8qwmdXABd9MrmhyLBnFpBSp
 Uc0XMSpVBAYCSskjtCtWp1TAxPLEpO/3M+u5KunFz1S6+YxMV6Q41Q3rp+g0HRkKFVq5
 +tHm/veQKUQRYhF4tQa5zGGr1DrKOUnCNhzfKsVwyXBHxT5C0fum+g5WvJkFGUUuMVZT
 k9YZqEc9nGLAh2w4G9cK2NdfkL8E03KmxxmzJ7oIt7D46a/+HdtZYuzkPx41cNe0BP7T
 oNy9zSK+RVpQ19HKbdFprZFMlPyN/96a5ii+DB4hWFew5eFyTq0wWDLWEaVTlmwir+2V
 ktgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9BVL8lIrmB6e94ewrgZ2edOtQrRa/f+DyHdENfUpMUM=;
 b=aacyYR+FPCI0EFGa55nu2j7+xUZ7Htf/thjgLO8xsccSEacowDnQDvfEK5Ndtuvzf8
 I4R0vEEvyqqAzxPOYtDFA4r3997Uq+YYv8KUH8wWrJXt/C4komKyaV9CZ9aubpIyGiC1
 PQmfDxz4/CV+iLSbnGHB3qzN4y6vEjcUSJfv/UcUHk9yFxoaI9JnMXnYdazf1yR0JgTE
 HEKhGkIIqQAcHtLHRltY9JRNZqOxopHmPL4alTHBO+S3fj9odoLS2YmISaiLdv7xugi7
 572a7jm5dJH6swRvO04pM3tQTro28O0edpQmUSeC2o/Z3IippYLa2kt3ORrCigK4v9u1
 SO4Q==
X-Gm-Message-State: ACrzQf0Z0rmC+muicrEpZJNVlSFlV9EQgPOn+LzmW5710pSRWKt2IQXD
 tBivszKMDUBRhJv4IY743bx6YnIwR65Geg==
X-Google-Smtp-Source: AMsMyM6QmkuB1rBHnsihct5Ny7xVDi27FgFaBaS6BkjaybeBomeW+hpLMuHbYu7dkHDNOsCV2CF3mA==
X-Received: by 2002:a5d:5249:0:b0:230:1ba4:b6cc with SMTP id
 k9-20020a5d5249000000b002301ba4b6ccmr3607923wrc.197.1665757723532; 
 Fri, 14 Oct 2022 07:28:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j28-20020a5d6e5c000000b0022cd27bc8c1sm2566356wrz.9.2022.10.14.07.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 07:28:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH] hw/ppc/spapr_pci.c: Use device_cold_reset() rather than
 device_legacy_reset()
Date: Fri, 14 Oct 2022 15:28:41 +0100
Message-Id: <20221014142841.2092784-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In spapr_phb_children_reset() we call device_legacy_reset() to reset any
QOM children of the SPAPR PCI host bridge device. This will not reset
any qbus such a child might own. Switch to device_cold_reset(), which will
reset both the device and its buses. (If the child has no qbuses then
there will be no change in behaviour.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I couldn't figure out what exactly the QOM child objects are in this
case -- the comment in spapr_phb_reset() suggests there's only one and
it's the IOMMU? My guess is that they don't have any qbuses in any case.
This patch was tested with 'make check' and 'make check-avocado' only.
---
 hw/ppc/spapr_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 57c8a4f0855..7b7618d5da0 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2045,7 +2045,7 @@ static int spapr_phb_children_reset(Object *child, void *opaque)
     DeviceState *dev = (DeviceState *) object_dynamic_cast(child, TYPE_DEVICE);
 
     if (dev) {
-        device_legacy_reset(dev);
+        device_cold_reset(dev);
     }
 
     return 0;
-- 
2.25.1


