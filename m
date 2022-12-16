Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095B64F3BA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:09:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU1-0005zX-Pa; Fri, 16 Dec 2022 16:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITj-0005vL-E1
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:53 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITg-0000ag-Uu
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so5001037wmb.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VztGF32a3KriOcGzpvK3NxYNTE7OoAN19xqfTq2WZ4s=;
 b=hkrEwZeqSY3AbJL8JNf9sEqouXYxmQER+aBwTc93FOKBPHa9NJQWLJh5KcXFbFhvIw
 2At5DZzlRXieDTVpZ/tZFcqu5WK3255/8ApmFrwlf5X30CsTF/cK2ckAmWLzPfqXCYx4
 5ozVovpmX5cqA9wEtzEM7BtI2HEnHcBptY5DAO0jI6HD/79URPCQc3xanFu1j0Ot4iy6
 2SYo+OvrvrTT0LJmNiotRDnyKdDCZAhd7Jp32QQfIGzRBITjc75eYuiKP4WZziNEKGb5
 YIZPdtZLl+7Nb6TltXAL7IVeSwalaxXUyNep3x/6lCEyizdrXbYbLIu/w8cK688Ubcy1
 SdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VztGF32a3KriOcGzpvK3NxYNTE7OoAN19xqfTq2WZ4s=;
 b=zwey4XMU73tHJAHCgxnUmVADSAnmevQngiZweT2tJwHBoq9pDWQ7UCjuQS73c+48tm
 M39c4NGvNcyBJOTbY10CoaJKp1SD2OlSuKnRyYMa4/12iwBoQnjp4pE7CqhsgC5kTATi
 21Nso0YtM29q4EL1mGh0f6JKse31gISymYRMcPcYDD+Qvcm0TeZmZJ984aCqWoasDYw8
 o6R5+9gzlfs8MSF+r1f7evnu4jTzLuROZVzEGDA7vCcG+ISKMRp++waPPm9vYoPeMY6j
 zYi74nyuHcDt8dcIXQpPTBkeFj4qn5/2o79pWGnovynbB79VvaRvlwmPdyJcvJjtNtD2
 iiOQ==
X-Gm-Message-State: ANoB5pktq1+YUNE063Qo5gekOwVOTHGCBD3Yi9yTY5d2knWGntuQRhfx
 otb3vhrKOiow025DMmw0BYlAjUSs9zN2Jyit
X-Google-Smtp-Source: AA0mqf49wyLdi22C8D9kC8oLdM1SxX84gB9Nq9ywNbPT5mr/09oOaCaCy/E75EJQlDBOdLpgLvlWyg==
X-Received: by 2002:a05:600c:2252:b0:3d2:196c:270c with SMTP id
 a18-20020a05600c225200b003d2196c270cmr20402078wmm.31.1671226967308; 
 Fri, 16 Dec 2022 13:42:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/36] hw/s390x/s390-pci-inst.c: Use device_cold_reset() to
 reset PCI devices
Date: Fri, 16 Dec 2022 21:42:09 +0000
Message-Id: <20221216214244.1391647-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
index 66e764f9016..9abe95130c5 100644
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


