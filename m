Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7EC682C03
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDP-0007ID-6O; Tue, 31 Jan 2023 06:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDJ-000711-OO; Tue, 31 Jan 2023 06:54:13 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDI-0002Lu-1n; Tue, 31 Jan 2023 06:54:13 -0500
Received: by mail-ed1-x534.google.com with SMTP id z11so14157367ede.1;
 Tue, 31 Jan 2023 03:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5q6pEDmjbLQHJco4WLG6HNWuGgK1XtcwTBdRpFvGtI=;
 b=BBup4VtaxJBinKfpx6oe/NejpbXWqtl6M0IBcjcPjSDM87sVNaDyXmL5eAmKYDE++c
 e14Rj5A9gxYYeslYjPEFO71Bns4mz5yVUy9RQAHVITlP61fl/p0aLtRHxOk/zhBV+Uyb
 rwAzpL48qiGoaeQHHqrP18NkqcLvs8xmbzmN1B7Ivem5ZBskxiq0Lc/aKdgVu3UMKFIx
 qmea2mF2fv+sE6DhWcEI01h0J4j0kw9vakSPFHPd7Ie5VOH7NTpu5tiBFrD/EMqG6GG0
 gN8G8jWgzhkhaNHQXZnUM1tervko560j2kThm7ZPsX2tcH6j1hoaW5YZxGAsIfNJS+bC
 hzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K5q6pEDmjbLQHJco4WLG6HNWuGgK1XtcwTBdRpFvGtI=;
 b=A/bcBrtvRTxd3P0OvrUu5NuwX1EcOj+hvO0K6dL9WDHDeEltfqIwgxOAxki6rNr5Lx
 Bhbzni9+6WIntKv3twcO6Lvu8RRnGLhaEoibRdOaQnhfk9Z1lXMjpP7Ah2ohhRNyNNov
 yH0o1bpUXc5vNqTizNvzXgP8ACyx2QBbZeD9CWRdfd/e8SfIQUsR0UfITtrjK6UDo9Fc
 oDr33/lmjnjkgQfbyIVLUC3p1+9Nhhf4M24mZ8CbPNK0If4kwXS8TSrgsHAT4S2fN+IK
 kvM2EWS2jtFzWyuvNF310tdL0C455BG8/5WpAwQZwLdVWZpYBxPddJADBRfttivRUz49
 bnGg==
X-Gm-Message-State: AO0yUKXmn5aau5+0FEGMx28lt/cAsU3PbZzhAKhy3QUAQ3e1dWlHMK3R
 KUXHVCAQeCq5bd9nzAqqPEhr1UN446k=
X-Google-Smtp-Source: AK7set9ZgJ2HtzZZGCVzWksZmbaXuhJ11VBNJEViJy4/FcVa50YXx1bt5mbY3w01GOUtsKp4KUWvpA==
X-Received: by 2002:aa7:d593:0:b0:4a2:34dd:2bb9 with SMTP id
 r19-20020aa7d593000000b004a234dd2bb9mr10826988edq.41.1675166050851; 
 Tue, 31 Jan 2023 03:54:10 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:54:10 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 19/20] hw/i386/ich9: Clean up includes
Date: Tue, 31 Jan 2023 12:53:25 +0100
Message-Id: <20230131115326.12454-20-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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
 include/hw/i386/ich9.h | 8 +++++---
 hw/i386/acpi-build.c   | 1 +
 hw/isa/lpc_ich9.c      | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index d29090a9b7..3125863049 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -1,11 +1,13 @@
 #ifndef HW_ICH9_H
 #define HW_ICH9_H
 
-#include "hw/sysbus.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/apm.h"
-#include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
+#include "hw/intc/ioapic.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
+#include "exec/memory.h"
+#include "qemu/notify.h"
 #include "qom/object.h"
 
 void ich9_generate_smi(void);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 127c4e2d50..266df7a153 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -59,6 +59,7 @@
 #include "hw/acpi/pcihp.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/ich9.h"
+#include "hw/i386/pc.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/i440fx.h"
 #include "hw/pci-host/q35.h"
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 808c572ae4..f508f6071e 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -40,8 +40,8 @@
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/pci/pci.h"
-#include "hw/pci/pci_bridge.h"
 #include "hw/i386/ich9.h"
+#include "hw/i386/pc.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
 #include "hw/pci/pci_bus.h"
-- 
2.39.1


