Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4D34ADA21
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:39:44 +0100 (CET)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQid-0000Sh-1v
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:39:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOr0-0000v1-11
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:14 -0500
Received: from [2a00:1450:4864:20::332] (port=53773
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-00029b-MH
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:13 -0500
Received: by mail-wm1-x332.google.com with SMTP id n8so11948210wmk.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZU4Qt8dF8HrU5xx9gXHm/kYMTxx7ioejy8a/MXphI7c=;
 b=Tb574VxnftOb0xkQQZQm899rPqCTXBLASZM5wfFl/6AA8+zRXQMsZy5y0EELiKDPtV
 GkaW+Z5Cc/SVAO0v9/l4hbV6xnFESZUFi3hT9PZpxCiaCiU7gQA3rk0Kltx27Lt5irJw
 cRNxwC4+K5iRRtUBgIGn7vI3Gbx0np1jZQ9S5JjYMpBBet6m0CpELe52P8bZ6n19sRZz
 N2SiLDg/EAewtxHDfKFGlSLor7DcKWm6OJkIW0wLqRprdOp+Jsmr4AkmB6FulQ/KhBoC
 jghtlDmDJ4n7xANUIizMe4uD60XK2Z9ppwvg4UjReYNSdvccknuz8Y1DNsiSOLD4N8DI
 wmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZU4Qt8dF8HrU5xx9gXHm/kYMTxx7ioejy8a/MXphI7c=;
 b=dNvW5duCdSgohxa89FXdT2iMpfdS1mqjO0IXZm0K2naHYdrjrj3pkRA9REQWmdHf+b
 7oG9FdaD//LRQ192BFpu38/Qb5KpubZG0SHu1Q3sFwUuiit4DOgIcbeR/u/jxzS7BfL6
 AGbVA7DiJB4IXLZ+DxTWGjxZnrvaOQR9QGWcYhISXcgBO5n7iVY+bAlxLUus21COP2Qn
 RUUfdaxGlTdXR/zVtXd3MTCSvb63ETpii/a6OZnxfvEGMFF6qXGXiviRGJ/pQKwLQ4od
 zahWEMzSgQs1iK1zQ7bDUtyYDm4F8Wep/36jPEjGOeLrisxHWXeVvP/eUKsK96puNtXw
 Mcfg==
X-Gm-Message-State: AOAM530s8UDyJ6994Px6P3NaJeXbW+3uLkbS0pXkv2iNNuTbstUP+oWV
 2QFDxEAJGePEXoUyhabJaNvF+2Lyjf/QYA==
X-Google-Smtp-Source: ABdhPJz+8cfB6PdlG2fHy4Fn902um172TKzg7QgOlR3+sqKsErWhgP+XSFjySns8RZl+qDOjDAhUuw==
X-Received: by 2002:a1c:1946:: with SMTP id 67mr811785wmz.12.1644320406202;
 Tue, 08 Feb 2022 03:40:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/39] hw/arm/smmuv3: Fix device reset
Date: Tue,  8 Feb 2022 11:39:34 +0000
Message-Id: <20220208113948.3217356-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Eric Auger <eric.auger@redhat.com>

We currently miss a bunch of register resets in the device reset
function. This sometimes prevents the guest from rebooting after
a system_reset (with virtio-blk-pci). For instance, we may get
the following errors:

invalid STE
smmuv3-iommu-memory-region-0-0 translation failed for iova=0x13a9d2000(SMMU_EVT_C_BAD_STE)
Invalid read at addr 0x13A9D2000, size 2, region '(null)', reason: rejected
invalid STE
smmuv3-iommu-memory-region-0-0 translation failed for iova=0x13a9d2000(SMMU_EVT_C_BAD_STE)
Invalid write at addr 0x13A9D2000, size 2, region '(null)', reason: rejected
invalid STE

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220202111602.627429-1-eric.auger@redhat.com
Fixes: 10a83cb988 ("hw/arm/smmuv3: Skeleton")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b43368be0f..674623aabea 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -278,6 +278,12 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->features = 0;
     s->sid_split = 0;
     s->aidr = 0x1;
+    s->cr[0] = 0;
+    s->cr0ack = 0;
+    s->irq_ctrl = 0;
+    s->gerror = 0;
+    s->gerrorn = 0;
+    s->statusr = 0;
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
-- 
2.25.1


