Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C490366BE85
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:02:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHP5g-0005Z3-8i; Mon, 16 Jan 2023 07:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5K-0005Qp-Sy; Mon, 16 Jan 2023 07:59:36 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5J-00017s-7h; Mon, 16 Jan 2023 07:59:34 -0500
Received: by mail-ej1-x631.google.com with SMTP id qx13so9535785ejb.13;
 Mon, 16 Jan 2023 04:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3aXSHolNmoD+uAWx1iQQB3uBgq7VIljmtpVGikvpuU=;
 b=bIH+NF7fMl7RaZ9RSv9OeaGSoipCcZ8xc4kjCW4qxRl0tkUL/KCNkvbXqCyH7HtJZB
 U4pbFpk3Z80EpkD4iJBDOyWxwxJyucba71CPGW48sQql6P4Y9iWhb0IjfmHNoNA5N1kl
 1/LGAHkj+1HmIBgdCEbws6bTCJYtKUfpx+YKBfHB2lUYvOdGpu58XsbHPOv4k/J7brh0
 GyLOc/G0594L1qisuWmffpRm42mGQepqgjOH6W7jPspAj+I3+3EWCu01HqE44VafukH3
 jn5nuKCe8MKMdpwn+L7JPTww2lQO9JbpC95+21ItdXHbS6mh2PIDrRJV6pjaGwo/99cg
 TZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C3aXSHolNmoD+uAWx1iQQB3uBgq7VIljmtpVGikvpuU=;
 b=cxlZYQ8f5KKvaS/KaNTPQxAGsxQgvA0ZGmPHq4EZtejhF9d/YUAORIDJEJ2FVy1bNb
 DfuIfQ0xO0lUk6DzL+K5fQv2K6RJ5pdrLCG2DEUFSPNC/QUzJN2DlN0syIsi9byWkIVx
 MXCMDXm8SWDVFWaLq4nCm3FfKHMDkzB7wnJ4PDMs2DK/thrw+jlFcbvh7QKYavz/b5eH
 8NJaP41XGz3Rjxur1ZQm4mTCXRUcI8SRMI5tu4Dha9zaNpWODjLbdHTAe7Ulcgqjfcva
 TWF8Hliirhq5puDst+O5GFNlQvhXjLTMd7p/QoGU9hnlXqQr7XzGVH7Mb28tyF9Kk1Pz
 nyqQ==
X-Gm-Message-State: AFqh2kpifLNrECA1Yax2X2lUDQJivSLq3AGemwXUTjM9oiBOefboGSKq
 FD1/MZaWpKsKoF4SCmITAKU9kOcPpBk=
X-Google-Smtp-Source: AMrXdXsO0yVTnqImrZa8Qj61A2Nx9YUnQh5HqVliDFtjCob1aMzqZ6irD2jGdCikxGdKTEFEGFhdMg==
X-Received: by 2002:a17:906:c795:b0:84d:45ff:d283 with SMTP id
 cw21-20020a170906c79500b0084d45ffd283mr26006880ejb.72.1673873970985; 
 Mon, 16 Jan 2023 04:59:30 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 um41-20020a170907cb2900b0086c4fbb8507sm3201517ejc.225.2023.01.16.04.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:59:30 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 7/8] hw/i386/acpi-microvm: Reuse qbus_build_aml()
Date: Mon, 16 Jan 2023 13:58:41 +0100
Message-Id: <20230116125842.66817-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116125842.66817-1-shentey@gmail.com>
References: <20230116125842.66817-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/acpi-microvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index d8a444d06c..fec22d85c1 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -26,6 +26,7 @@
 
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
@@ -129,7 +130,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
 
     sb_scope = aml_scope("_SB");
     fw_cfg_add_acpi_dsdt(sb_scope, x86ms->fw_cfg);
-    isa_build_aml(ISA_BUS(isabus), sb_scope);
+    qbus_build_aml(BUS(isabus), sb_scope);
     build_ged_aml(sb_scope, GED_DEVICE, x86ms->acpi_dev,
                   GED_MMIO_IRQ, AML_SYSTEM_MEMORY, GED_MMIO_BASE);
     acpi_dsdt_add_power_button(sb_scope);
-- 
2.39.0


