Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B0382AB8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:17:22 +0200 (CEST)
Received: from localhost ([::1]:41366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libFR-0007HQ-Ny
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libAR-0005By-62
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:12:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libAO-0000n5-Fl
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:12:10 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so3348576wmn.2
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EMgUQW0usIbC3Xh5eHeXBZBc/9XCoZrI2HXiiIOGatY=;
 b=G8UIhZOxwi+kZfVpn2N+AUxeaawT3KAaro3nMtlmbQLZdQCXXzFWbNooteGR77hwqa
 xISrj2GZ2QQFXaXSDAjEWizmDGNLWlb/wYo8QukB5MpizUi6tu2mwNYkQhAJQ0IAjelQ
 jduY7aT+E0j1cvsHbMB7cizASg3VMvSod3Qg8D4cb04/ndeoknZ/IVNugzAUEsXNqAOx
 TizyYgVss1x+y1MepFiEszQAMEuhImbATnsCE6o/DriroSes3hft2WcfFVkInTtZOHm/
 vFatVv1CXrMEFTJc98h0pOUbM6hBm7okzxHsAZjUZDvIMGIXD0E4NVUcfoebYLck3myx
 P/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EMgUQW0usIbC3Xh5eHeXBZBc/9XCoZrI2HXiiIOGatY=;
 b=clgvlekjUeFsEANiC4jHNHKnzsDP+SZEwxOz2OYsHf/kDmGS2kxsm5sF9jxfngHf+m
 4tweRUdYVNyXO75j884nCugcMfLKCfOo8lO8lJybXsHg7B7tch/mA3KqPY/EvDLTmA6E
 E/0oZlywVirQXaZkjykKK83aCocWGc7aWxWW9hAQm6AQQAgVHEiK3i7BUI05sPEt4mPz
 7Z9AA7/c9e8DxQbF4aFUomIBMnxmqd0OpADfJNLWct1YMgySvxojTnK/OSN0W+3mklnN
 tPDvcJLaV1tfVfvdOUwYXpkSYcIi78aRoocw/kL0kQXdJxy8OlsUvVaEzRc9xnR1Pelv
 /V6g==
X-Gm-Message-State: AOAM530ttbc+GyKxh94tble4yEPKv7n0AMPiRdo6J3K5YF98wwgZy1Ph
 +Ad867E4jC48UF7fCzXMd7+mz05g885Qbw==
X-Google-Smtp-Source: ABdhPJwRYqtg8TClglBQpnVlli5s5Oy/nls+QqQ6ID60kt61sUh/ePFt6ZVKFJf7pWr3NJsB9JHn1w==
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr61695580wmf.167.1621249926034; 
 Mon, 17 May 2021 04:12:06 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c8sm16619684wrx.4.2021.05.17.04.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:12:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] exec: Restrict confidential-guest-support.h to sysemu/
Date: Mon, 17 May 2021 13:11:11 +0200
Message-Id: <20210517111111.1068153-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make it clearer the confidential-guest-support.h header is
sysemu specific, move it to the sysemu/ directory.

Patch created mechanically using:

  $ sed -i s,exec/confidential-guest-support.h,sysemu/confidential-guest-support.h, \
    $(git grep -l exec/confidential-guest-support.h)

Then the #ifdef'ry conditional on CONFIG_USER_ONLY has
been replaced by an #error.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/{exec => sysemu}/confidential-guest-support.h | 6 +++---
 backends/confidential-guest-support.c                 | 2 +-
 hw/core/machine.c                                     | 2 +-
 hw/ppc/pef.c                                          | 2 +-
 hw/s390x/pv.c                                         | 2 +-
 softmmu/vl.c                                          | 2 +-
 target/i386/sev.c                                     | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename include/{exec => sysemu}/confidential-guest-support.h (95%)

diff --git a/include/exec/confidential-guest-support.h b/include/sysemu/confidential-guest-support.h
similarity index 95%
rename from include/exec/confidential-guest-support.h
rename to include/sysemu/confidential-guest-support.h
index ba2dd4b5dfc..3b52d086642 100644
--- a/include/exec/confidential-guest-support.h
+++ b/include/sysemu/confidential-guest-support.h
@@ -18,7 +18,9 @@
 #ifndef QEMU_CONFIDENTIAL_GUEST_SUPPORT_H
 #define QEMU_CONFIDENTIAL_GUEST_SUPPORT_H
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu specific header from user emulation
+#endif
 
 #include "qom/object.h"
 
@@ -57,6 +59,4 @@ typedef struct ConfidentialGuestSupportClass {
     ObjectClass parent;
 } ConfidentialGuestSupportClass;
 
-#endif /* !CONFIG_USER_ONLY */
-
 #endif /* QEMU_CONFIDENTIAL_GUEST_SUPPORT_H */
diff --git a/backends/confidential-guest-support.c b/backends/confidential-guest-support.c
index 052fde8db04..bc141504451 100644
--- a/backends/confidential-guest-support.c
+++ b/backends/confidential-guest-support.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 
-#include "exec/confidential-guest-support.h"
+#include "sysemu/confidential-guest-support.h"
 
 OBJECT_DEFINE_ABSTRACT_TYPE(ConfidentialGuestSupport,
                             confidential_guest_support,
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1bf0e687b94..6ab11140ef0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -32,7 +32,7 @@
 #include "hw/mem/nvdimm.h"
 #include "migration/global_state.h"
 #include "migration/vmstate.h"
-#include "exec/confidential-guest-support.h"
+#include "sysemu/confidential-guest-support.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
index 573be3ed79b..d469326a480 100644
--- a/hw/ppc/pef.c
+++ b/hw/ppc/pef.c
@@ -14,7 +14,7 @@
 #include "qom/object_interfaces.h"
 #include "sysemu/kvm.h"
 #include "migration/blocker.h"
-#include "exec/confidential-guest-support.h"
+#include "sysemu/confidential-guest-support.h"
 #include "hw/ppc/pef.h"
 
 #define TYPE_PEF_GUEST "pef-guest"
diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 401b63d6cb6..799d8b047b2 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -17,7 +17,7 @@
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "qom/object_interfaces.h"
-#include "exec/confidential-guest-support.h"
+#include "sysemu/confidential-guest-support.h"
 #include "hw/s390x/ipl.h"
 #include "hw/s390x/pv.h"
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 93e78469bce..d79c15cd4dc 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -102,7 +102,7 @@
 #include "qemu/plugin.h"
 #include "qemu/queue.h"
 #include "sysemu/arch_init.h"
-#include "exec/confidential-guest-support.h"
+#include "sysemu/confidential-guest-support.h"
 
 #include "ui/qemu-spice.h"
 #include "qapi/string-input-visitor.h"
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 41f7800b5f7..f2a92cf9126 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -31,7 +31,7 @@
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
-#include "exec/confidential-guest-support.h"
+#include "sysemu/confidential-guest-support.h"
 #include "hw/i386/pc.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
-- 
2.26.3


