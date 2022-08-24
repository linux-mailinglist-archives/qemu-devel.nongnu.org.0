Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395F559FEDE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:54:09 +0200 (CEST)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQshk-0007cZ-AJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf6-00027t-5O
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:24 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf3-0002Eh-Ot
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:23 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bs25so21307978wrb.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/MVk+AlNPESRV7EYaPRLcDW6Y3EIh0quCranMNr0U+k=;
 b=SISAXUmDEEha4rf3ux+5+6Aj7LWGpWdc7eTG9yXHLEAycCrVN344SK4HXyw10Da1L+
 nB+DurBeZF6AN900e3pW5Iu2XMkL4Yx8HZHyR5QICYpZYjTjeRMHH8xSX1pgGSv5Wq17
 epTNxZgt+1pxLt/5//dlocfCJKPv6ELe4kKizibwVntaOuWGFdW8szx4uiHJpy50MULx
 FN6COSQOvEpH5ePzdAW92rUt+3zy458VX66T+y5qHZghrqGlI9xALHDK/yz4DOxRhoxt
 8LN0oPNiiBMSganwFlZJDPyC/EHDFDydYINNh+erZuckjlhf2bk51yJRKXDd9tRS8tq/
 uXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/MVk+AlNPESRV7EYaPRLcDW6Y3EIh0quCranMNr0U+k=;
 b=kVbWZKErrLFGhx9Mdak8uPTvfX5bVWqc8eT6nuwDMAGZMJT939ui+PlykOZGH6Q0q9
 utKvTmNUsoHK6c74a2cVE/ApjcIN/khD5gcgvJ6qzKgliwox9FsugQi9u0pwagBFROMZ
 9yce4uSzcWto6r76LtZInD2qEG5x13tSCDMpLsQzpYrHQI9rVHRB/07A9otjMJoqzLjd
 VBECTeLAygG+wTJ38ZcDdcRI5aLDASQy3NGDw/BzgTyA9NLNvBTScPTDOZSoHlyxa2YN
 Df+SLUUXXa7mZB8cWE0/WHwvJhT/p7CEl5sHFgGi8DhVSBUGJyxnDTcpczNm3ng9MT0j
 XtlQ==
X-Gm-Message-State: ACgBeo0ra7fnEWw1dAq/4zrCsF50fG1g5WupyPvAO0ziOVE+UrdL+SMZ
 P7wg1FnHyEsB63pDIdHcyGja8A==
X-Google-Smtp-Source: AA6agR7zDHYkhPVnvU176TVqmCTvgU6c/GyEGwZtaXjMS1fPxfYxVloSFOOp5pAZIqu6GzhjeQUNKg==
X-Received: by 2002:a5d:6f11:0:b0:225:735f:e9b0 with SMTP id
 ay17-20020a5d6f11000000b00225735fe9b0mr1609169wrb.709.1661356279563; 
 Wed, 24 Aug 2022 08:51:19 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:19 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 02/10] hw/arm/boot: Fix devicetree warning about the PSCI node
Date: Wed, 24 Aug 2022 16:51:06 +0100
Message-Id: <20220824155113.286730-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

dt-validate warns that an implementation compatible with arm,psci-1.0
shouldn't have arm,psci in their compatible string.

  psci: compatible: 'oneOf' conditional failed, one must be fixed:
	['arm,psci-1.0', 'arm,psci-0.2', 'arm,psci'] is too long
  From schema: linux/Documentation/devicetree/bindings/arm/psci.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..527918227e 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -493,7 +493,7 @@ static void fdt_add_psci_node(void *fdt)
             const char comp[] = "arm,psci-0.2\0arm,psci";
             qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
         } else {
-            const char comp[] = "arm,psci-1.0\0arm,psci-0.2\0arm,psci";
+            const char comp[] = "arm,psci-1.0\0arm,psci-0.2";
             qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
         }
 
-- 
2.37.1


