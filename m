Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D366B9157
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:15:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc2cM-0008Ez-FV; Tue, 14 Mar 2023 07:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc2cJ-0008Em-Tp
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:14:55 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc2cI-0007Rz-Fu
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:14:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m18-20020a05600c3b1200b003ed2a3d635eso2117070wms.4
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 04:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678792492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PdkgNhaJPRrRdkwIFpantMiXyAUBdqjpuNqmDmvsuyE=;
 b=P5wjeinbvuNQMqSBnfNB0Mub/SLmKEHiwPIs7jQ0TIyv2yj43NcYW6annmsjMfQewY
 QTO4mvq6Av4cxf9TlrpC/ZZoous3oTZn1xYAyNc60ZPBh+KLcVGvOQ2OPUGuzOA8aLy5
 7NfTMCkWHDthS2C2igZ053+vpZxfpWMu+BlwvVmkjsgC0XC6ixRDVuj4hRMo5dHwZlXJ
 H7VHSJDx1pNfhOuf1DJYvkDjEKWQNzLaakvKb23PN4heDvW4E+5TyJ9Fb9sfcA5BhX0R
 alqrpV6rywyLDcr6cj2Q3VOrhppnVSJJ64oq1oHZmQZyaTyzyfIuKs8OFrFbjZwss11R
 o8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678792492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PdkgNhaJPRrRdkwIFpantMiXyAUBdqjpuNqmDmvsuyE=;
 b=g7Rm1SDQz9Z7gURMaKwhwaubvkd+Amokc3pdNV3u3TO4wteZjvJc2yh3O3829hEt37
 TiaixmOPnTnJSCaIGcW+W00q1YsqgLov1Us6pcBlxkOGSSuSKKEI6No+tHR1ahX7WwHd
 gDvuEkOIhk+yc7L0z1vg5KDHju79kWTD3GJz/HDsbyAttnXtDI/a9wCaU4Zxzo4QGiHl
 dZXrh4Tppt0HteoMvfZqdsbgZ2ssqBQDo8PoFEby5i7zoGFTj2YqAmgitDv6+H9/inBK
 Ga8ZLBqyP0sNvl/8UrT5gslf6GfbIiwalvBKnCSXYfBaizwZ6XNIkAjm3sczbjG6mtNZ
 DDsg==
X-Gm-Message-State: AO0yUKXxfaU4CVU1Scfvq7d4lvK/uM8Rvrc1nBKJSj/KUVcJzpd2eSD5
 QWPZtqsRDiQvz+fYeODkIIcjxoLP7hHeak/JlKE=
X-Google-Smtp-Source: AK7set+nURq60Nc3VKPhCAcvPTuh/Xhcx3hCa3Op79De80s710tqXZfJ5LSPcncntTS5w3ZIgh4aXQ==
X-Received: by 2002:a05:600c:3acb:b0:3eb:2e2b:ff3d with SMTP id
 d11-20020a05600c3acb00b003eb2e2bff3dmr13908003wms.20.1678792492102; 
 Tue, 14 Mar 2023 04:14:52 -0700 (PDT)
Received: from localhost.localdomain
 (233.red-88-29-167.dynamicip.rima-tde.net. [88.29.167.233])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c5405000000b003ed246f76a2sm2605303wmb.1.2023.03.14.04.14.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Mar 2023 04:14:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/4] hw/pci/msi: Ensure msi_init() is called before device is
 realized
Date: Tue, 14 Mar 2023 12:14:33 +0100
Message-Id: <20230314111435.89796-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230314111435.89796-1-philmd@linaro.org>
References: <20230314111435.89796-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

A PCI device can't magically become MSI-capable at runtime.
Guests aren't expecting that. Assert MSI is initialized
_before_ a device instance is realized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/msi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 5de6df8154..dfa257cc22 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -182,6 +182,7 @@ bool msi_enabled(const PCIDevice *dev)
  * address.
  * If @msi_per_vector_mask, make the device support per-vector masking.
  * @errp is for returning errors.
+ * @dev must be unrealized.
  * Return 0 on success; set @errp and return -errno on error.
  *
  * -ENOTSUP means lacking msi support for a msi-capable platform.
@@ -208,6 +209,7 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
                    " 64bit %d mask %d\n",
                    offset, nr_vectors, msi64bit, msi_per_vector_mask);
 
+    assert(!DEVICE(dev)->realized);
     assert(!(nr_vectors & (nr_vectors - 1)));   /* power of 2 */
     assert(nr_vectors > 0);
     assert(nr_vectors <= PCI_MSI_VECTORS_MAX);
-- 
2.38.1


