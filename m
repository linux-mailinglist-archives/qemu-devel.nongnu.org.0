Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80144366735
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:44:41 +0200 (CEST)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ8TQ-0002xP-KT
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lZ8Rw-0002V5-Fo
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 04:43:08 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lZ8Ru-0008Hi-S8
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 04:43:08 -0400
Received: by mail-ej1-x62d.google.com with SMTP id sd23so53678871ejb.12
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4hch9e56u44iE4LgxdztZJh8ya3EkIax/daj65NAhZ8=;
 b=I2ZAQVsPGjW1m39dn50XJWZW3e3rg2mwF4XNK6iqAF5BQXwRpkW5jSUIyvYAMe4eFv
 9q97RCXBG15zuP1n00C7dze1gEEuKKu+hSUNtlvqZU2OMLpqA3zcmYUPY9tipBms/ZS0
 Qkk+BxCvoRzk23uBLVMbx3qfzxCR73BixNXi+FRgQ4IZk4YwzLZ9Yj3sfYVSW8snMfRv
 hGW6nv58Ug3lIGEfvxkRCbWj+tYrbg3vtrwE7LqqeZ75Up0QMl33g6qwZBKnsiL6wYMP
 Km5ZzzyBmYP8/217ID0jfOLsx8FQTS1KBp9xU1DvtO/oLkH5YItaQzfThV/YliC7ZFbd
 2Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4hch9e56u44iE4LgxdztZJh8ya3EkIax/daj65NAhZ8=;
 b=TPMHKonB7N2mxojOuM4jSEmL+IKHdIEndYHCFSxkKvTMUnCkJX+/oIXVQZrUV4fq1P
 cYTx4UUCPFRfuFfdDMv0fNbqpKWZwSiY130jngkPc5N7st+hKRs1OL2wsDz/IaRa6oys
 vN++It8q/tHbZXq0BelpyDd8mRN3aMzuO7cCM6JbWZ6Hnyp4AzaD5UHam+N40kBSmF1M
 S4HKgY9wxL1+zDyRNQ9VWA7Oxr8i3BZvKwAn7HMJBep9bgWw/98Prm88Siynk4KQtKyi
 koHhX3i7qN7V7JMpuaYZ2DOYrScDF8ps7cPn8/yYNGeQhxAjuAUs2xCn1sIi23kjh2C9
 4cAw==
X-Gm-Message-State: AOAM532Wrx35I3dWpqHBWucblhpgQoQCk2vAG7HVlDftVwyHomAapxiS
 a8QJCWr104bd5IR39dK2tkJV3A==
X-Google-Smtp-Source: ABdhPJy8ziXau7AQxYPo1SfvOV2cTqvSDOUzL638ZAOnhizMnWgy3k0jx+DWj5pp2UJL6GooRykg9w==
X-Received: by 2002:a17:906:b1c1:: with SMTP id
 bv1mr31885983ejb.24.1618994584464; 
 Wed, 21 Apr 2021 01:43:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id e16sm2264342edu.94.2021.04.21.01.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 01:43:04 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, ehabkost@redhat.com
Subject: [PATCH] amd_iommu: Fix pte_override_page_mask()
Date: Wed, 21 Apr 2021 10:40:08 +0200
Message-Id: <20210421084007.1190546-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AMD IOMMU PTEs have a special mode allowing to specify an arbitrary page
size. Quoting the AMD IOMMU specification: "When the Next Level bits [of
a pte] are 7h, the size of the page is determined by the first zero bit
in the page address, starting from bit 12."

So if the lowest bits of the page address is 0, the page is 8kB. If the
lowest bits are 011, the page is 32kB. Currently pte_override_page_mask()
doesn't compute the right value for this page size and amdvi_translate()
can return the wrong guest-physical address. With a Linux guest, DMA
from SATA devices accesses the wrong memory and causes probe failure:

qemu-system-x86_64 ... -device amd-iommu -drive id=hd1,file=foo.bin,if=none \
		-device ahci,id=ahci -device ide-hd,drive=hd1,bus=ahci.0
[    6.613093] ata1.00: qc timeout (cmd 0xec)
[    6.615062] ata1.00: failed to IDENTIFY (I/O error, err_mask=0x4)

Fix the page mask.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/i386/amd_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 74a93a5d93f..43b6e9bf510 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -860,8 +860,8 @@ static inline uint8_t get_pte_translation_mode(uint64_t pte)
 
 static inline uint64_t pte_override_page_mask(uint64_t pte)
 {
-    uint8_t page_mask = 12;
-    uint64_t addr = (pte & AMDVI_DEV_PT_ROOT_MASK) ^ AMDVI_DEV_PT_ROOT_MASK;
+    uint8_t page_mask = 13;
+    uint64_t addr = (pte & AMDVI_DEV_PT_ROOT_MASK) >> 12;
     /* find the first zero bit */
     while (addr & 1) {
         page_mask++;
-- 
2.31.1


