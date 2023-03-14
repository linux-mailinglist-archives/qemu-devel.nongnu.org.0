Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F5B6B9156
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:15:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc2cF-0008E6-Fu; Tue, 14 Mar 2023 07:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc2cC-0008Do-Oj
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:14:48 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc2cB-0007Rd-5t
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:14:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id ay8so4740500wmb.1
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678792485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iC81pr4qU2yv+2N4TULW4UOxCyMavZBGsXLy6UiQSWE=;
 b=eCdX05iuFaeVdqegOIlD7qOdfvplVYEZllmwRJ60hpjr4tPco8eE9jbM2YXE/Xd8Ep
 8IOX6VerT2irN+eefasnt6DwmYFZ7i7uIXgSmvoVTpbMkNSf7UnQMipinFkfkxA6pk2E
 bzRmnQ2mXErwesI1siEDxKi2C2o0p+KThtofSR/8GUfaVxlXX39I5cdBGPUYCtshOIn1
 zj5qnJO6ntunKTTrtuw9sTK5cJ7vl8peFoeRgUBGp/TgmBuFR/vp++RKwfO3DKAK90bm
 lilgTWDeLH7BkQo7DNcAUz7YYyMZYUm/GA2lRXbwkY3Zm3zzFK4vSbaZSod3zOUTgxkq
 2Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678792485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iC81pr4qU2yv+2N4TULW4UOxCyMavZBGsXLy6UiQSWE=;
 b=tnW84GXl+lowNsDJVXxy2mVKyUVUUHqZ/i4Bd2O8WQ4Q9dTGFQ8cf/DpbI0B5h8qD1
 5sOL/HrJSm47Pb22IIjHSEZWksCg3XQFLp5YWA02jyx83JY9NENyUOqAdEnM1v4d4DvU
 3z2FlWRJdDIDOKcpnKr17zrYfVwwLFcPSRKovXLldFqLWvcJPrJhUsrfV1W91f6lcq10
 TutgeBeKW+L6Wm8+CRq0PTr3VlWYu2i92aPyeK+AaKw5RWzC5YUoiJkkpCFsgTWWUE5G
 ytPc1nt84Vh1O9yj59bpTWpidn3U5I/EVoCwLdxE3/9gl2TbY2ou0Lfam80zZB8ibBs9
 VV1Q==
X-Gm-Message-State: AO0yUKXxbVeB72ycdJAzeXip8bmecXqiOr8oavBvEPXfQ7mCcGrbOPPV
 7Crwy4lOKC3S2tLdNnMbfBy2Vz+2ec4andlajfc=
X-Google-Smtp-Source: AK7set8uTpdUf5EG++km8tJMK4ghv3/C5XN2zVIfzcuRoe9fcdqEqzIDdMWJnE2AUYM8Ia/MjL1uyg==
X-Received: by 2002:a05:600c:470b:b0:3eb:395b:8b62 with SMTP id
 v11-20020a05600c470b00b003eb395b8b62mr14211111wmo.39.1678792485415; 
 Tue, 14 Mar 2023 04:14:45 -0700 (PDT)
Received: from localhost.localdomain
 (233.red-88-29-167.dynamicip.rima-tde.net. [88.29.167.233])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c228c00b003dec22de1b1sm2579915wmf.10.2023.03.14.04.14.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Mar 2023 04:14:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/4] hw/pci/msi: Fix debug format string
Date: Tue, 14 Mar 2023 12:14:32 +0100
Message-Id: <20230314111435.89796-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230314111435.89796-1-philmd@linaro.org>
References: <20230314111435.89796-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Fix this format string warning when defining MSI_DEBUG:

  hw/pci/msi.c:209:28: warning: format specifies type 'char' but the argument has type 'unsigned int' [-Wformat]
             offset, nr_vectors, msi64bit, msi_per_vector_mask);
             ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  hw/pci/msi.c:83:61: note: expanded from macro 'MSI_DEV_PRINTF'
      MSI_DPRINTF("%s:%x " fmt, (dev)->name, (dev)->devfn, ## __VA_ARGS__)
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
  hw/pci/msi.c:78:58: note: expanded from macro 'MSI_DPRINTF'
      fprintf(stderr, "%s:%d " fmt, __func__, __LINE__, ## __VA_ARGS__)
                               ~~~                         ^~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 041b0bdbec..5de6df8154 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -204,7 +204,7 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     }
 
     MSI_DEV_PRINTF(dev,
-                   "init offset: 0x%"PRIx8" vector: %"PRId8
+                   "init offset: 0x%"PRIx8" vector: %u"
                    " 64bit %d mask %d\n",
                    offset, nr_vectors, msi64bit, msi_per_vector_mask);
 
-- 
2.38.1


