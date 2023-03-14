Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239826B9155
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:15:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc2cS-0008Ix-Un; Tue, 14 Mar 2023 07:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc2cP-0008Hg-LR
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:15:01 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc2cO-0007SA-0X
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:15:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so9852417wmq.2
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 04:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678792498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAR+F6n4v/j09daumAcHV4U9McsXvObmKUx9h2b2hsI=;
 b=xP+URl10FWDC37tLepb/bdaiWvbY4IVS6KSifQvrPKZ2mIaJuUw2Wix+Q8s5pzrBMa
 u1savO8sEhyPrj8yJVdvL+wVr+1lsz2bT3Yrqae3VpVhdeowA/P2G/o0UibqChL6HU4s
 iK+VLINK1n9IuUcZiDqFrW9X0n65/vTOL4PHnWG4UfkUpsD2gUnHfXR0uyGzVvDHfFKq
 cPOdASQY4W3+z0e0rlWi8VmQZ/4KazSvMrfXRYhXd/nCEZe2aRcxdNpMY972J5HOrDf3
 r/OLyMaHCC4C83eFVmOVOwHogPa/jfnesVruBn8jd9AHQzT8uJdMMMMRAH+iVmzYZFWX
 qGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678792498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAR+F6n4v/j09daumAcHV4U9McsXvObmKUx9h2b2hsI=;
 b=tfubickzjVktOMijjgD65XRQ8FYwvIqy6MT1rM24YR3OH2PVDW2VzFFMRXQwA4P4CM
 Udsr+nuFgeJrKA5xgK81zJQHUloEdmPvByQLPqLGCOhpCxqx7+c9fku0HnVf9MnxMaXI
 zmfEFUGcA7O3Is0UjRUn3Ho/StemCpE3RfymXxHTPT5OF/PIVwEsmTKT99ShQAODovor
 1E4TuThWYexYQVcFBpxzXJAxuZDb5BkrksrnCs2GBoaIXS9GTjPN/KD4x9tFCKD0lms9
 C18B3MgczfhgJ7lL6OLUNSQ4R1oJrexLvRRLGyLUajnDIU9lWMOtXZscGLTh7wTAGltd
 ocxg==
X-Gm-Message-State: AO0yUKX9mD8dS18RcUq8xgVHWqjonERNoF2x81O8DR0UKQbVW/3BOwCv
 A3+FCfBYG2O7An6ftp3DDqy4zlTekD/XaBwJYA8=
X-Google-Smtp-Source: AK7set8b+Vq0pRtIGi9/XJZgHYbHGwcBMT4P9WB1qon9GO3B1XIc4/RIme3Owwy3SyQsAMPOkF4QVg==
X-Received: by 2002:a05:600c:4f81:b0:3ea:d620:57a0 with SMTP id
 n1-20020a05600c4f8100b003ead62057a0mr14259453wmq.3.1678792498261; 
 Tue, 14 Mar 2023 04:14:58 -0700 (PDT)
Received: from localhost.localdomain
 (233.red-88-29-167.dynamicip.rima-tde.net. [88.29.167.233])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1c4c04000000b003eb395a8280sm2491151wmf.37.2023.03.14.04.14.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Mar 2023 04:14:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] hw/pci: Add sanity check in pci_find_space()
Date: Tue, 14 Mar 2023 12:14:34 +0100
Message-Id: <20230314111435.89796-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230314111435.89796-1-philmd@linaro.org>
References: <20230314111435.89796-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

This 'used' array is allocated via:

 pci_qdev_realize() -> do_pci_register_device() -> pci_config_alloc()

In a perfect world where all device models are correctly QOM'ified
this can't happen. Still it occured to me while refactoring QDev and
it was not obvious to figure out. This assert helped, so keep it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index def5000e7b..ac41fcbf6a 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2185,6 +2185,7 @@ static uint8_t pci_find_space(PCIDevice *pdev, uint8_t size)
 {
     int offset = PCI_CONFIG_HEADER_SIZE;
     int i;
+    assert(pdev->used);
     for (i = PCI_CONFIG_HEADER_SIZE; i < PCI_CONFIG_SPACE_SIZE; ++i) {
         if (pdev->used[i])
             offset = i + 1;
-- 
2.38.1


