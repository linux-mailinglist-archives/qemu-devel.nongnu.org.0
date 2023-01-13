Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E140669D67
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMHR-0002S0-Kx; Fri, 13 Jan 2023 10:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHP-0002Qs-CP
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:43 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHN-0006TF-Qq
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:43 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso13308678wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Z1QUovQY9GKd51k95q8FPVeLQ1Fen4KUg1KYYN83u4=;
 b=fIE0ch0J3BH9QGEYCNjI8wX5vGODP7Gc1HzCxVMcwBN6bVPKRbmt/bmqnXQlQrDSHs
 tuuFk7QQIbGTo0gjXA1N3zrnZq0Y2BMoG4gR2gCt7L2+AwzKw8fdYNNNOtXqkgd/PQD6
 DSggEPA93m8x6jXcgYcaYNdC+KD+DUB5mlSy+HLkMPfl/CQREsKNusFFT7WXY7komnYU
 +8n8nZDImIjO286o26sIqwSPkPIehCYhX0j9yQBrW9swndM5aiW5GlnZsD+D4ebMhQ2L
 hPDdvkDwKBtSf0foOVZ8ElSAyKhAUic62A+tIbcWRNV3g/l+2y1QNBmT2zv/z/eSr+Bw
 rV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Z1QUovQY9GKd51k95q8FPVeLQ1Fen4KUg1KYYN83u4=;
 b=F34ahSRDtry3e5+zvRv5WLcuxQFY5EJfCMbov//i7Lfv5HThvHWYmwIwv0tHjMKYYr
 wXJcCumK0q/fetglRyAI3+dqF/FLHWdbmiuZDQfJMX4N34OPOHvGtpJNQYSzacumQ42X
 +7Uy3aErBJhwqtDacVpyKwxJG0BIzSrehlrOnlHIRWnAGlcKnBeefE37mKK4mK+ehfE5
 JX0gWRyo9+j7fRdnT2eS/xEBbRooBl2EXEoUD+hHtsR4OLx5C+n/FzkjWSV30v5PyLxM
 MsVfCtJnDcaSrfCF0ZiXbl812pSN+6t5WO5HWsIbU2NleWsSs0PZQDrfoWcB2wm2GQO6
 kQ7Q==
X-Gm-Message-State: AFqh2krAP1udr+e9GaRs8aEXayPeiDJ3LqOvhGXFFbrzlzwwm7DSinoA
 eu0Rgo6gBf6X3MbCF5b/vrY3V8POnNHGvmce
X-Google-Smtp-Source: AMrXdXs1IRX02wByoqDiOVmRCRlrCy3KXKYjVAHSRq530bqvw1mNx07wqzet/W3Pvstt25Cy9wpvJw==
X-Received: by 2002:a1c:c90d:0:b0:3d3:3d1b:6354 with SMTP id
 f13-20020a1cc90d000000b003d33d1b6354mr190776wmb.3.1673624860020; 
 Fri, 13 Jan 2023 07:47:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfb352000000b00241fab5a296sm19578418wrd.40.2023.01.13.07.47.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 26/46] hw/isa/piix4: Correct IRQRC[A:D] reset values
Date: Fri, 13 Jan 2023 16:45:12 +0100
Message-Id: <20230113154532.49979-27-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

IRQRC[A:D] registers reset value is 0x80. We were forcing
the MIPS Malta machine routing to be able to boot a Linux
kernel without any bootloader.
We now have these registers initialized in the Malta machine
write_bootloader(), so we can use the correct reset values.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221027204720.33611-4-philmd@linaro.org>
---
 hw/isa/piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 8fc1db6dc9..0d23e11a39 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -116,10 +116,10 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0x4c] = 0x4d;
     pci_conf[0x4e] = 0x03;
     pci_conf[0x4f] = 0x00;
-    pci_conf[0x60] = 0x0a; // PCI A -> IRQ 10
-    pci_conf[0x61] = 0x0a; // PCI B -> IRQ 10
-    pci_conf[0x62] = 0x0b; // PCI C -> IRQ 11
-    pci_conf[0x63] = 0x0b; // PCI D -> IRQ 11
+    pci_conf[0x60] = 0x80;
+    pci_conf[0x61] = 0x80;
+    pci_conf[0x62] = 0x80;
+    pci_conf[0x63] = 0x80;
     pci_conf[0x69] = 0x02;
     pci_conf[0x70] = 0x80;
     pci_conf[0x76] = 0x0c;
-- 
2.38.1


