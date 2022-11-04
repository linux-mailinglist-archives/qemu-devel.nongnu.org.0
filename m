Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A6619CD5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:16:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzMh-00089u-VQ; Fri, 04 Nov 2022 12:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLq-0006Qy-4j
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLj-0000fP-Ph
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:22 -0400
Received: by mail-wr1-x429.google.com with SMTP id z14so7736022wrn.7
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BU6PNz3e99/tD5N663Lv9AewYZquVRh/84XMEC2v1g8=;
 b=U2ljhIqqroADthC6bE9W8xn64W4wuRDyi+MmbEFW1diIa4wIJA+rE+W9FX2GLXG+yB
 xV8lnNova0psX12PLfJgHSlvHGXipwtYsG2X7ve/pvsGb+eHR68RlFthwiQ5x1czwCEz
 MT+BJIi3dAyyo5zrg7oZIFzCILC+SHZXIe2dKJoM4JGXp8gBV/z8tVP0LplaXU5JcDiM
 WAl9JxNZPIyEDmVZBqgcITGx6bPasD16rAvrnOMf/FHI2j6GVzTnUs4sakgzNRUJjQ93
 XSu7Ovvj+G1qJ6frs3S25YW9IZCLsbKoucmWmrwpwhQKqaNdz0tdUqgvjdXqSw3lKko5
 JF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BU6PNz3e99/tD5N663Lv9AewYZquVRh/84XMEC2v1g8=;
 b=qEkkCBuh7oECwZSja4/L2PEvLV2VERc4WLNjaPT2Wg4U2IRWNBzBg3MUQ9u4MdlXfc
 6lo2b8ilXJnuQvscCLNUNJPBzhewYcSMMlOLrE8UAYbpMe1lOLfri2QcjIwneT3PCPXH
 I7zf7CTh8X2s7Y5a/oVBTXWURI5tIPjQEIT/PHe6AAzo0OEbPXnNeGQFOIuZhtWRecAw
 EP0tZdDjfZZace3WgSicPOOqyu4/GgKruHCj7XwNlS55umVGxG1U8FIscWgLJ80zjvzV
 Ce4hbgYH+T/I6dtrVR+xtbTZtuVfrLdzQZ26tT6pHkpKRE+5YxfTN106KYUPYrVfbGx9
 pFDg==
X-Gm-Message-State: ACrzQf1Z1Wk1uUKNpkFqBw7JpyXxkj69jjMDQDwARXhYgkeHB6zjSz0R
 lzrVmVpD4pXrBpv+XQDmy0zH8M1s0ggZwQ==
X-Google-Smtp-Source: AMsMyM5iABiKrHxgKVwdJrrzrQLhBTQmIhfHy46QBt1u3QXPm0teZC/SQ3Q+RIvKLs2j0/9mEZoKKQ==
X-Received: by 2002:a5d:5a97:0:b0:236:9701:97d2 with SMTP id
 bp23-20020a5d5a97000000b00236970197d2mr249304wrb.185.1667578517534; 
 Fri, 04 Nov 2022 09:15:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4649645wrb.99.2022.11.04.09.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:15:17 -0700 (PDT)
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
Subject: [PATCH for-8.0 1/9] hw/s390x/s390-pci-inst.c: Use device_cold_reset()
 to reset PCI devices
Date: Fri,  4 Nov 2022 16:15:05 +0000
Message-Id: <20221104161513.2455862-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104161513.2455862-1-peter.maydell@linaro.org>
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The semantic difference between the deprecated device_legacy_reset()
function and the newer device_cold_reset() function is that the new
function resets both the device itself and any qbuses it owns,
whereas the legacy function resets just the device itself and nothing
else.

In s390-pci-inst.c we use device_legacy_reset() to reset an
S390PCIBusDevice.  This device doesn't have any child qbuses, so the
functions do the same thing and we can stop using the deprecated one.

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/s390x/s390-pci-inst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 20a9bcc7afb..16f5a3e81b4 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -272,7 +272,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
                 stw_p(&ressetpci->hdr.rsp, CLP_RC_SETPCIFN_FHOP);
                 goto out;
             }
-            device_legacy_reset(DEVICE(pbdev));
+            device_cold_reset(DEVICE(pbdev));
             pbdev->fh &= ~FH_MASK_ENABLE;
             pbdev->state = ZPCI_FS_DISABLED;
             stl_p(&ressetpci->fh, pbdev->fh);
-- 
2.25.1


