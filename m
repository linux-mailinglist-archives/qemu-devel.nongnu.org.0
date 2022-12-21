Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC926531C4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:30:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynr-0006gd-Eh; Wed, 21 Dec 2022 08:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yne-0006HI-Ox
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ync-0004V9-Us
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iukuCA+rzJ80KucAWcE5G28qrjaAATvHC4LYdC0eHpw=;
 b=ZETIqvxUa+JynjYf+OXnorExmdOKp4s5UgZK45qkdNk15tjaGU2mXhRhrSN5+i00W5CXUo
 u9lDai9Jf1QmeEwGhYi5CWxGXs4vuNgGZEBaaFtwLvrzac6i5ctvaR/D2Zvu/SkumCSTai
 +Hq0ANA7V8Gze6y4t0DGzNBmXvHBoEo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-3qY5bTnsMVCHf8CO9LXiwg-1; Wed, 21 Dec 2022 08:06:19 -0500
X-MC-Unique: 3qY5bTnsMVCHf8CO9LXiwg-1
Received: by mail-wm1-f70.google.com with SMTP id
 q21-20020a7bce95000000b003d236c91639so664986wmj.8
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iukuCA+rzJ80KucAWcE5G28qrjaAATvHC4LYdC0eHpw=;
 b=6+PX4kRupHxHe6pzfSLY5LUM1uy3NfPA02kkC+e4nsnAeY22rDbVih4842ZwFSOlEy
 wBXwu6nGKAqhVlHi8QSytc+HNNfMx67sKey2FBigBAVJnkSxGmVPtHuNnQdkLVHV1z/v
 WXPbJJat2HxLNX0c5Yjyc3UhrKyU5MdU6Xc1NbbaRbYCS3IK51/SFBAHFKjT/g8YYKIz
 9oMsmk+xr4QjIZ0WQCQclXI3hqRrry34Yuy/joScD0s/2vnJGWeZdTa+Eva5Q7e2vNFY
 53sQ3OlHvQrv/gOfIt4tu+SZoibiEggZmVh6QDmWJy86wgOtxp097sY9YMlaU2o365ZJ
 ASpQ==
X-Gm-Message-State: AFqh2kqwLAAuA3NqZ1EAlgf7zlqVbj35UyQwCAHvUipabXXCilupRtlW
 7ctYFV4wusVYNqzPsuU6Mg1p6TG1c3s6AmWoqyAyL2vJyB5enUNTRhRZ4Er5bjjnC2NjuJZW9pi
 C9zkTsZBZCVCNoC3Z8WzhxyXzHa8d+R3Z1Ma65iyVW26iOdkRynAGh3A+CGh7
X-Received: by 2002:adf:e54f:0:b0:242:7fd6:1c82 with SMTP id
 z15-20020adfe54f000000b002427fd61c82mr1069641wrm.16.1671627977003; 
 Wed, 21 Dec 2022 05:06:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuII7X3BMSgprR5PfFpSgF+NlEm24UOP4VQ3mhtvho4YkFYKK5KnSpjI6EVYtXvCMfmFNyNgg==
X-Received: by 2002:adf:e54f:0:b0:242:7fd6:1c82 with SMTP id
 z15-20020adfe54f000000b002427fd61c82mr1069618wrm.16.1671627976717; 
 Wed, 21 Dec 2022 05:06:16 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 5-20020a05600c230500b003d1e051f671sm2214007wmo.9.2022.12.21.05.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:16 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 32/41] hw/acpi: Rename tco.c -> ich9_tco.c
Message-ID: <20221221130339.1234592-33-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

tco.c contains the ICH9 implementation of its "total cost
of ownership". Rename it accordingly to emphasis this is
a part of the ICH9 model.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221212105115.2113-1-philmd@linaro.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/ich9.h                | 2 +-
 include/hw/acpi/{tco.h => ich9_tco.h} | 2 +-
 hw/acpi/ich9.c                        | 2 +-
 hw/acpi/{tco.c => ich9_tco.c}         | 2 +-
 tests/qtest/tco-test.c                | 2 +-
 MAINTAINERS                           | 4 ++--
 hw/acpi/meson.build                   | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)
 rename include/hw/acpi/{tco.h => ich9_tco.h} (97%)
 rename hw/acpi/{tco.c => ich9_tco.c} (99%)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 7ca92843c6..d41866a229 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -27,7 +27,7 @@
 #include "hw/acpi/pcihp.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/acpi_dev_interface.h"
-#include "hw/acpi/tco.h"
+#include "hw/acpi/ich9_tco.h"
 
 #define ACPI_PCIHP_ADDR_ICH9 0x0cc0
 
diff --git a/include/hw/acpi/tco.h b/include/hw/acpi/ich9_tco.h
similarity index 97%
rename from include/hw/acpi/tco.h
rename to include/hw/acpi/ich9_tco.h
index a1e0da8213..c4393caee0 100644
--- a/include/hw/acpi/tco.h
+++ b/include/hw/acpi/ich9_tco.h
@@ -1,5 +1,5 @@
 /*
- * QEMU ICH9 TCO emulation
+ * QEMU ICH9 TCO emulation (total cost of ownership)
  *
  * Copyright (c) 2015 Paulo Alcantara <pcacjr@zytor.com>
  *
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index ea4182256d..a93c470e9d 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -34,7 +34,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "hw/acpi/acpi.h"
-#include "hw/acpi/tco.h"
+#include "hw/acpi/ich9_tco.h"
 
 #include "hw/i386/ich9.h"
 #include "hw/mem/pc-dimm.h"
diff --git a/hw/acpi/tco.c b/hw/acpi/ich9_tco.c
similarity index 99%
rename from hw/acpi/tco.c
rename to hw/acpi/ich9_tco.c
index 9ebd3e5e64..fbf97f81f4 100644
--- a/hw/acpi/tco.c
+++ b/hw/acpi/ich9_tco.c
@@ -12,7 +12,7 @@
 #include "hw/i386/ich9.h"
 #include "migration/vmstate.h"
 
-#include "hw/acpi/tco.h"
+#include "hw/acpi/ich9_tco.h"
 #include "trace.h"
 
 enum {
diff --git a/tests/qtest/tco-test.c b/tests/qtest/tco-test.c
index caabcac6e5..d865e95dfc 100644
--- a/tests/qtest/tco-test.c
+++ b/tests/qtest/tco-test.c
@@ -16,7 +16,7 @@
 #include "hw/pci/pci_regs.h"
 #include "hw/i386/ich9.h"
 #include "hw/acpi/ich9.h"
-#include "hw/acpi/tco.h"
+#include "hw/acpi/ich9_tco.h"
 
 #define RCBA_BASE_ADDR    0xfed1c000
 #define PM_IO_BASE_ADDR   0xb000
diff --git a/MAINTAINERS b/MAINTAINERS
index 716d5a24ad..a2773108f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1659,8 +1659,8 @@ F: hw/isa/piix3.c
 F: hw/isa/lpc_ich9.c
 F: hw/i2c/smbus_ich9.c
 F: hw/acpi/piix4.c
-F: hw/acpi/ich9.c
-F: include/hw/acpi/ich9.h
+F: hw/acpi/ich9*.c
+F: include/hw/acpi/ich9*.h
 F: include/hw/southbridge/piix.h
 F: hw/misc/sga.c
 F: hw/isa/apm.c
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index f8c820ca94..2ed29ae94c 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -22,7 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'ich9_tco.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
-- 
MST


