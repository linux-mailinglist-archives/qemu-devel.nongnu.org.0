Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121306980B9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:19:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKUa-0000nI-MP; Wed, 15 Feb 2023 11:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTg-0007vY-Gz
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:58 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTd-0008Ly-Ah
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:50 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o15so16400609wrc.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+kQmnueqHR1/7y+7KCNnDEw+Oe5smCTiQ+KK+3S1XU=;
 b=m54RaJbuwcvSdYapRsachmMl8LykgQH26lhBCZefJKGLimV2/KqoE9gATdeYKqV/2J
 0CIQ2dmH/qCV5B1KrmGhz5KLKMkeffT4P5zDBvo6+cRuLQQgNasamOjp20X2YK7koei7
 ERN8kMcssrRGlPlBKeRZH9ZbNU1m5+O6ARvx1kUVKn4jSCUYyzDtGNP37ioAsZhTt2IW
 a9izcyJw0zF5frfkVsN5vA79IaYB4Er4F7H+MvsH3t09FAMHCn+hsIu8D3L7D+E+NCXf
 fecqV+CKwdpIDbRh5Uo8d0d+oKOi7CILk++8vID41wzvQ5reHKdy96JXgET/5aduxyzT
 XtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l+kQmnueqHR1/7y+7KCNnDEw+Oe5smCTiQ+KK+3S1XU=;
 b=n8IJcs7DRWcYBqAG8YShLBaACZ3sb42a6A3YDU+iddxwPOzmsb6kdp9jngoogWobaD
 GE9Ahi0uAeg7Og9DZ3seHClhIws1bW7PqVQgzZYRiPh+W3IWhQ27AXFDRZsobnwrM65E
 AD6Bue+8XjaRmfkNuQjE3RqYpVG6X3kz7eHJ4lj8DdAUEya69ADxcvvv1vDZU3h3FzCk
 ETQhamI0aaoZ8JvPPb6B1G0io0XOkB7qHyr7LGbgrJDegXbtpWL8Y4JUJtgbEZ6dKD1S
 74c5wFs/bPIsganYYhIgJPx5K73FLFcwwYJIVrXhJ4Occ8aoC676ruSHQ5eU4OJ5MXIH
 xfSg==
X-Gm-Message-State: AO0yUKWJpscvhPRgfDuIkCWNqqAHdu5KLCABgIPDOlhKl0Az4pxiwUAS
 9T84Xrdit/ihN8Mj7GTq1pX395M7ObELB98X
X-Google-Smtp-Source: AK7set8jKtS2zpUuaejWTiYRrFyDxwtKbu+NZfo8FuIUJpwIJhsYMDorjMQhSwRf5GZ5Kqq+gcU2fQ==
X-Received: by 2002:a5d:4cca:0:b0:2c5:5258:b6c with SMTP id
 c10-20020a5d4cca000000b002c552580b6cmr1963532wrt.68.1676477863705; 
 Wed, 15 Feb 2023 08:17:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y9-20020adfee09000000b002c550eb062fsm10941044wrn.14.2023.02.15.08.17.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 11/18] hw/ide: Declare ide_get_[geometry/bios_chs_trans] in
 'hw/ide/internal.h'
Date: Wed, 15 Feb 2023 17:16:34 +0100
Message-Id: <20230215161641.32663-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

ide_get_geometry() and ide_get_bios_chs_trans() are only
used by the TYPE_PC_MACHINE.
"hw/ide.h" is a mixed bag of lost IDE declarations. In order
to remove this (almost) pointless header soon, move these
declarations to "hw/ide/internal.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c              | 3 ++-
 include/hw/ide.h          | 4 ----
 include/hw/ide/internal.h | 4 ++++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e592bd969..79297a6ecd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -34,7 +34,8 @@
 #include "hw/i386/vmport.h"
 #include "sysemu/cpus.h"
 #include "hw/block/fdc.h"
-#include "hw/ide.h"
+#include "hw/ide/internal.h"
+#include "hw/ide/isa.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-bridge/pci_expander_bridge.h"
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 24a7aa2925..db963bdb77 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -3,10 +3,6 @@
 
 #include "exec/memory.h"
 
-int ide_get_geometry(BusState *bus, int unit,
-                     int16_t *cyls, int8_t *heads, int8_t *secs);
-int ide_get_bios_chs_trans(BusState *bus, int unit);
-
 /* ide/core.c */
 void ide_drive_get(DriveInfo **hd, int max_bus);
 
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index c2b794150f..d9f1f77dd5 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -647,6 +647,10 @@ void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
                   int bus_id, int max_units);
 IDEDevice *ide_bus_create_drive(IDEBus *bus, int unit, DriveInfo *drive);
 
+int ide_get_geometry(BusState *bus, int unit,
+                     int16_t *cyls, int8_t *heads, int8_t *secs);
+int ide_get_bios_chs_trans(BusState *bus, int unit);
+
 int ide_handle_rw_error(IDEState *s, int error, int op);
 
 #endif /* HW_IDE_INTERNAL_H */
-- 
2.38.1


