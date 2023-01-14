Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7014066AE4E
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 23:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGp0S-00014m-40; Sat, 14 Jan 2023 17:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0N-000134-8w
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:28:03 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0L-0003iq-RQ
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:28:03 -0500
Received: by mail-ej1-x62b.google.com with SMTP id v6so17019231ejg.6
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 14:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KbvtpHhDfsdmUGIyCrGLdQ6hWFCYi1M1hBOX3D1iFH4=;
 b=FWg7OXpeixiIBJdCm6F00FW7yFE6DPr2StA1q0W6QHXHJzZcrThcM2ax3ucUupuQ43
 sjPtq8m2RR2u2xpVXtF4gAHaPoUDW8yjwdztQGEWx0QpPE2ZNzlGDdYMp0CATt0qh9Mf
 u2Y+/Hoig9QIliSRMo4Pt26Z4s6/4pvxAi+R/twDpaKshERSuxULMl8BsToxlWNFhJ71
 6TSMxV7ieNaJ1HiU7rSLMZmZWyCQ000BTmI3x9Gcb1c/vZs7grq9S28SZyWDYkWssY7Z
 7wYBMULmcM1mkU//LlY9P7SZEBuiOJcj3tdI8XR5hzBdbJzB2CA7FDJMSWxZcCGWZLNm
 r0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KbvtpHhDfsdmUGIyCrGLdQ6hWFCYi1M1hBOX3D1iFH4=;
 b=mRaBBU3cI6/RMWpeeDUHn1lklpA8QdxkOZEoZFDIuyeoQ8z4mlWcSmzT5oriOzEQZc
 VwJuISSpLe22+MMM+poAyy5x0bUFJinQ95eRkrPiLB7esu+MC6RQvmGhWTFxUREiw+iq
 Z9VEYqMNhb2iIyAeKJyQYG2WLepSi2ATkUSOT3VkbwLCHCCeQQQVndMKouu6a5oXKhcg
 fyr1uDkiKqqVWcyzVePm2eYWOMm74S68xrIwYZUdHlIiDMJUJza6nHD41/HpxDSyt7x4
 50eTGuEqvebT+cwW81DsgnRD2lMRsZSyu8nyskNepx0eBfEiHL8zrgKNGQUI3M9Bwk48
 o6CA==
X-Gm-Message-State: AFqh2kqAnoTGJGJEZlL3bvjwC+3WlSLQAnH/HB4sFklKqcn1GzNMldYl
 +grrmYEPZNfYuuLsSb/CCyZXL9igu4I=
X-Google-Smtp-Source: AMrXdXugoub1agY3DmEO2p6RD4zpvrdrauIIA8rJ36hch8sa0IZp76348QzmvK0qqiu/crjPMwJNOQ==
X-Received: by 2002:a17:906:7247:b0:86e:a013:c264 with SMTP id
 n7-20020a170906724700b0086ea013c264mr1311381ejk.24.1673735280307; 
 Sat, 14 Jan 2023 14:28:00 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-013-123-004.77.13.pool.telefonica.de. [77.13.123.4])
 by smtp.gmail.com with ESMTPSA id
 og5-20020a1709071dc500b0084d420503a3sm8324840ejc.178.2023.01.14.14.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 14:27:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 6/7] hw/i386/acpi-microvm: Reuse qbus_build_aml()
Date: Sat, 14 Jan 2023 23:27:37 +0100
Message-Id: <20230114222738.282478-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114222738.282478-1-shentey@gmail.com>
References: <20230114222738.282478-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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


