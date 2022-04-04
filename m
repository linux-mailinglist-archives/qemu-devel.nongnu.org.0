Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F154F0D50
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 02:58:45 +0200 (CEST)
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbB3M-0001j7-Db
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 20:58:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <austin@amass.space>)
 id 1nbARG-0004QC-Nx
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 20:19:23 -0400
Received: from [2a00:1450:4864:20::236] (port=35748
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <austin@amass.space>)
 id 1nbARF-0002T5-6y
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 20:19:22 -0400
Received: by mail-lj1-x236.google.com with SMTP id h11so10942844ljb.2
 for <qemu-devel@nongnu.org>; Sun, 03 Apr 2022 17:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amass-space.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=I2Z5YIAMMt3lLHgt7ls6RIVjULAR0yLAbgtvFElHX7w=;
 b=BvCIQUxqcOa2pJFP37tRX8LjmUTDLWrJuZ/e1GMo0NG2QMTRdulIacDE1YmUzaCwWX
 3SRAkrvy2mGHLQt6B2HgWsU4FO3B9wmCWkHjY30C4aZgZBmyA0dZ6lnoETFex3J2FpS+
 CUCML5aJAXIXIlErUjajGyok69UmlfUUkKK4AadnIH8iKUKGF64c6jYDiwidJ/yVHDq5
 mzv2HuL41xxiwRT6/h9a0/qrqSU4vdkXhVgLGgqZ4canory/NEmqF3E5PIyNb0/sUu3e
 TCCSVbtJaRrnYNb4dv6aVYff7djHugne+BVfeY4Qt0cDzwozMKWVV2FahLqcEMICWABI
 meNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=I2Z5YIAMMt3lLHgt7ls6RIVjULAR0yLAbgtvFElHX7w=;
 b=1VlhVJ9IVJ6bx6BOKbvaf5yBFgl0q+QZdoDSiz1z3KLVAeyrQG/unrtnJyZ+LEQhfe
 XKQ3AuxhVCDdQa0Zp/19A6bNDJLopaNtjD92dLpyrygVXc7pVlxYhpHQxJxCnwPwbatR
 vxz+/atOPLMNrTP3OLN91m5o3fDwx4bRkTd74va8qhUcJrCzSB8FanIVGvzKJGxF0GWB
 JltxD8GaIKKj5Eih3OutGPFy7okDtsCeHUAqWgVdyZHTSCYU6HGR1tsxVfT/AAc6CvXe
 bZYLAJlz7HPLfmoA2l0DhKS0vnRzClescGtaxd06t4VgrMrq0puSoQmca9FD4szSCupS
 FcNQ==
X-Gm-Message-State: AOAM533B7RSaV80iKUxYGhpAXBPTlTae7pWeDY3jFJAr7XCDK+J3HDS/
 zs7Q9cIMOidvbIe0OF/Ff9AGwL+9JsNzWRkZjnxSPhmtzkB7jJ3f
X-Google-Smtp-Source: ABdhPJxq3uEWAxkTELD/JusnxGV1FNjaxhMDpCRS7EOBrtW96vq/kqs3Jh+ypTQNKI4qOvFGdjjURCOeyAO18a8mSrQ=
X-Received: by 2002:a2e:9183:0:b0:24b:1220:a4d8 with SMTP id
 f3-20020a2e9183000000b0024b1220a4d8mr4241606ljg.259.1649031558458; Sun, 03
 Apr 2022 17:19:18 -0700 (PDT)
MIME-Version: 1.0
From: Austin Conatser <austin@amass.space>
Date: Sun, 3 Apr 2022 20:19:07 -0400
Message-ID: <CAO7oc52NECtz_0xQgyezgp9A-J-9Vvv8xUP92aTizCHKh550fA@mail.gmail.com>
Subject: [PATCH] hw/i386/amd_iommu: Fix remapping of APIC registers
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::236;
 envelope-from=austin@amass.space; helo=mail-lj1-x236.google.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_SUSPICIOUS_NTLD=0.499, FROM_SUSPICIOUS_NTLD_FP=1.997,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 03 Apr 2022 20:55:02 -0400
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes the check from only allowing the APIC base address to
allowing the entire APIC address space.

Signed-off-by: Austin Conatser <austin@amass.space>
---
 hw/i386/amd_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index ea8eaeb330..61b7416d50 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1248,7 +1248,7 @@ static int amdvi_int_remap_msi(AMDVIState *iommu,
         return -AMDVI_IR_ERR;
     }

-    if ((origin->address & AMDVI_MSI_ADDR_LO_MASK) != APIC_DEFAULT_ADDRESS) {
+    if (!amdvi_is_interrupt_addr(origin->address & AMDVI_MSI_ADDR_LO_MASK)) {
         trace_amdvi_err("MSI is not from IOAPIC.");
         return -AMDVI_IR_ERR;
     }
-- 
2.34.1

