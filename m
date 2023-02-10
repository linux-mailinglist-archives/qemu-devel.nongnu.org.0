Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7EE6923D3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:59:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWj7-0003Yu-0j; Fri, 10 Feb 2023 11:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWj5-0003Yi-8c
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:58:19 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWj3-0003zc-IE
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:58:18 -0500
Received: by mail-wm1-x333.google.com with SMTP id z13so4286078wmp.2
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76WGhaMeuPYXbX/pWJbcrHLrwrtrG1g1D4hmZur00GA=;
 b=qWkoEjoOVmCqr1OiTv613fwL4i8yn6qDJ3BoIC2oamGES+NCsMCI0XZHfy3bQYqdya
 +ccw38zjVDi3QnECFPfE29HG36boSUEXSOdroeZM9pjZKxvOCtGyYGc9y4PsE7JZgh+2
 OuAYUqCQSO8qDbK/AcGzZBfRSa2RHRiKAe6zGUiaCi8ZG8VfFxasAqNIEVMIDEF/5CVt
 uoVqXbIbm/+a1G07m7Yyv+z0ad5R8ykSJ7ehGpKG+xCQUzBm4WuzO0XHlVS1/LDiL9IC
 uJiC9uboEtxeD58PAXvP+kGKsUxLOvF6QJwLeaDZoKX7YnhhCIaCFWFeCMEbzBkvitLf
 5jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76WGhaMeuPYXbX/pWJbcrHLrwrtrG1g1D4hmZur00GA=;
 b=fPYmk6TVpveoMUqRmjYIMlwhSCVeP/q+sFYpEAwsVy4CGsB6xYPiaoxQYhazwUhQTL
 AqBJ/fwhlWOOlEZf5fI5XQQREKhIcfI53p3+LPwHUH6GF6dppooyIMMQdTHOstWfMuFW
 K698CiSjTo0aqNHAKXcG3LK6u25tiU5hZwDS8/g77Bc6dYZUX1tNg9B+812mhLGoX2Hk
 gk+lXb2bDUAjrzds+is9W9mi/doRQ7yYOhRdaMPBgRncVoIJzWbDAQ6B9y32qTURtpEJ
 tHS66OjmLbM8ZCPOLQDzZfyWgUkj6elYUYT0lFjZm9EYGXi8e+wI3eDjf7hwr955Uyy9
 EBzg==
X-Gm-Message-State: AO0yUKU6wPpw+AM9+ZqQEuj7hFwFok0N0q8NV9NuPsp1opBlLw178sTI
 SLwbTSBi3vHoemYAw4sFOR4U8oh5r0UU54st
X-Google-Smtp-Source: AK7set8R23J4Quk8coo0UTN9zV1cs6lVG9SYrU+lgJ/9a415LhmVEcP01REND0769t7xMjBxWRB4sA==
X-Received: by 2002:a05:600c:331a:b0:3dd:f286:5ae9 with SMTP id
 q26-20020a05600c331a00b003ddf2865ae9mr13493365wmp.9.1676048296006; 
 Fri, 10 Feb 2023 08:58:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b39-20020a05600c4aa700b003dc433bb5e1sm5519466wmp.9.2023.02.10.08.58.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:58:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/4] hw/isa/piix: Unify PIIX-ISA QOM type names using qdev
 aliases
Date: Fri, 10 Feb 2023 17:57:54 +0100
Message-Id: <20230210165754.34342-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210165754.34342-1-philmd@linaro.org>
References: <20230210165754.34342-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Unify PIIX ISA (PCI function #0) as:

 pci-piix3 -> piix-isa       (abstract base class)
 PIIX3     -> piix3-isa      (PIIX3 implementation)
 PIIX3-xen -> piix3-isa-xen  (PIIX3 implementation with Xen extensions)
 piix4-isa -> piix4-isa      (PIIX4 implementation)

Alias previous names in the QDevAlias table.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/southbridge/piix.h | 6 +++---
 softmmu/qdev-monitor.c        | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 71a82ef266..cce65e8f44 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -58,9 +58,9 @@ struct PIIX3State {
     MemoryRegion rcr_mem;
 };
 
-#define TYPE_PIIX_ISA       "pci-piix3"
-#define TYPE_PIIX3_ISA      "PIIX3"
-#define TYPE_PIIX3_ISA_XEN  "PIIX3-xen"
+#define TYPE_PIIX_ISA       "piix-isa"
+#define TYPE_PIIX3_ISA      "piix3-isa"
+#define TYPE_PIIX3_ISA_XEN  "piix3-isa-xen"
 #define TYPE_PIIX4_ISA      "piix4-isa"
 
 OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_ISA)
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index b8d2c4dadd..820e7f52ad 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -72,6 +72,9 @@ static const QDevAlias qdev_alias_table[] = {
     { "ES1370", "es1370" }, /* -soundhw name */
     { "ich9-ahci", "ahci" },
     { "lsi53c895a", "lsi" },
+    { "piix-isa", "pci-piix3" },
+    { "piix3-isa", "PIIX3" },
+    { "piix3-isa-xen", "PIIX3-xen" },
     { "virtio-9p-device", "virtio-9p", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_VIRTIO_PCI },
-- 
2.38.1


