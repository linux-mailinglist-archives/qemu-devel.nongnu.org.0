Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8917F619CDD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:17:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzMp-00005X-Af; Fri, 04 Nov 2022 12:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLw-0006UZ-QG
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLp-0000gb-Ss
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r186-20020a1c44c3000000b003cf4d389c41so5723209wma.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIssiaxZUXp9drHLMQc52wG6/fuhaHC1D5IXSogHJ7w=;
 b=ufYS2BuzYP8Jzkpt5M+0RiMNbz9d6olyUVYGOpGAPI2iroE7hpTev0qkF9qc4Z1Ngc
 4myNvP8LxajOZIScEK9JjCwqHaoezNIVQnrIQu0eiuAb/KdPDRvDRvqLT46vp0LZy4Wr
 jU1J+41/5SSS9OuwM7nG+i0gizpWzBc5MX6C36LK4xXpPq90018Ruv7i0t/IO2Th9coc
 old4dPYAfiDJ/ZtjaFF/1GBCZGlmIhl0fIAe6sVME6t53H30sgNLIWlWMgZRM2qAUKsB
 Ies9pRhASBofBiWieNRYNApARN6rcKbP9WJ8Ud8oTSK0NaUk7pkZbHCe9bI7+0PcxGYx
 txYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIssiaxZUXp9drHLMQc52wG6/fuhaHC1D5IXSogHJ7w=;
 b=7vy7NQuFfCeVcVkIhiBCrnsb0STyzo357VRe8ASKVJLFFDMZ8QowH2GJEqnkKAT79t
 T4sSADMoSM2eSERk03c/kwOuXtpp6JVj6MKtHmuHUx0nEKc2ac7iGjXX4DFZERi6LsDR
 YDj4VlIwPB/aW+DPKD8H3+jWli1qT766HhktHs+HOnx802lp3uEGngTIOBFW9GsiUfpq
 w8KXiCu7t9LOwG/2Fjsf8VVlLLFeVHuhsx6GtmvWEdyNME4IPPRqf0F2qLaKwOKYCkgg
 1bcCsph7D+k7+nUcKGC85t158M0fesNAkKOlnvlRh/yqLai+rLrTM9TsE3T26vj8y5Ni
 ScmQ==
X-Gm-Message-State: ACrzQf2MHXVauQpoLzbNB3fft0CnZnwkBHtfpPtHLV7jFp3PO4J3E9Cr
 AZDUs3/VEGpGzyqDxU1OyMKw53cyOc+MkA==
X-Google-Smtp-Source: AMsMyM798tJkPMHvycRkh3rkiei+Kp3C44y4aNR4c8QCxTJvg0D6NP9eS3DmL+CYHK+EMi1XTsj+5w==
X-Received: by 2002:a05:600c:3b22:b0:3cf:5eff:c858 with SMTP id
 m34-20020a05600c3b2200b003cf5effc858mr24416622wms.193.1667578521744; 
 Fri, 04 Nov 2022 09:15:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4649645wrb.99.2022.11.04.09.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:15:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 4/9] hw/usb/hcd-xhci: Reset the XHCIState with
 device_cold_reset()
Date: Fri,  4 Nov 2022 16:15:08 +0000
Message-Id: <20221104161513.2455862-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104161513.2455862-1-peter.maydell@linaro.org>
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently the hcd-xhci-pci and hcd-xhci-sysbus devices, which are
mostly wrappers around the TYPE_XHCI device, which is a direct
subclass of TYPE_DEVICE.  Since TYPE_DEVICE devices are not on any
qbus and do not get automatically reset, the wrapper devices both
reset the TYPE_XHCI device in their own reset functions.  However,
they do this using device_legacy_reset(), which will reset the device
itself but not any bus it has.

Switch to device_cold_reset(), which avoids using a deprecated
function and also propagates reset along any child buses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
It's possible this might result in USB devices on the bus getting
reset more than once (once via the descent-along-qbus and once when
xhci_reset() etc manually reset each port), but in my testing with
gdb I couldn't get that to happen.  It should be harmless anyway.
---
 hw/usb/hcd-xhci-pci.c    | 2 +-
 hw/usb/hcd-xhci-sysbus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index e934b1a5b1f..643d4643e4d 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -85,7 +85,7 @@ static void xhci_pci_reset(DeviceState *dev)
 {
     XHCIPciState *s = XHCI_PCI(dev);
 
-    device_legacy_reset(DEVICE(&s->xhci));
+    device_cold_reset(DEVICE(&s->xhci));
 }
 
 static int xhci_pci_vmstate_post_load(void *opaque, int version_id)
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index a14e4381960..faf57b47975 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -29,7 +29,7 @@ void xhci_sysbus_reset(DeviceState *dev)
 {
     XHCISysbusState *s = XHCI_SYSBUS(dev);
 
-    device_legacy_reset(DEVICE(&s->xhci));
+    device_cold_reset(DEVICE(&s->xhci));
 }
 
 static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
-- 
2.25.1


