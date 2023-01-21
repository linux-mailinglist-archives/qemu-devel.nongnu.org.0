Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5E8676717
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 16:21:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJFf2-0002AA-Lw; Sat, 21 Jan 2023 10:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFf0-00027x-8N; Sat, 21 Jan 2023 10:20:02 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFey-0005f2-Im; Sat, 21 Jan 2023 10:20:01 -0500
Received: by mail-ej1-x62f.google.com with SMTP id vw16so20722551ejc.12;
 Sat, 21 Jan 2023 07:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmcAsHcDgaESdi0rbv2EOY5SZ3qNDR9/dJGcyl8UdkU=;
 b=M4EVkEivCQ3DvXR7lu0cWf3siogDAapyU3En/Ela+xnyJ6/lF9k8wfMGmRMHcRSVa9
 mkTB5LIFoGqQPUHe1wYp6o5D80gSRLY41cj+2kP90hCcIksKC7BJBrUHa6TyVEmHc6kn
 uTE7+GniuNvj0yGcWm/wre82T/BTe54jHyddLZK+Cglj4n8eBKwYIh34Flw8og2fVgB6
 GnJHP9Xo9IdU+y24/z6LmuGjGrz3IvdaJdro+pQEmUEJXhlzGIUByNjQo3efr3DSlB76
 d6gXKlMq/odlbtE3gVBcaj8TaWqNV3jxbtccXeCNwZAmdanaSgYoctykR92OHcGbKMUr
 GZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LmcAsHcDgaESdi0rbv2EOY5SZ3qNDR9/dJGcyl8UdkU=;
 b=qEg1YeaUoa15CJWIeHaeFcoW7MtM3f5dJtU2KP+gVt+wkgpTwPpuvWfunKXaDW/hYw
 f12crdlgIinGiXJpxlFngucqO4Bz2eZ4CJl+DqSD59geDYbA7/M9gLRR5xbSFLYxJ5V6
 l9Wjd38RzfejzJ95YwdQjTR8tRQG1TaVZ6OsQ0F7xR5a8WWuUVFID/MKHba8cI66AcS4
 WLrv+hNa7KYEXyOAtm0lRF7nLQYQynbeV/yxGjv0ddC/CU9RpPh6M3NeRFeKKSqFJq0X
 935GLYTPZpNO1MOOTzDhtg8aXM6JoUlFajWIN5LEmojU6nemmH7W6hbkcQgx7tBRcaN9
 lyRg==
X-Gm-Message-State: AFqh2kpMc9lCuhNneLtyICOlmf+JpNOHkpmoZYS57/uT8Q/4yitETT3q
 8Dv3dH1ETF9KTpeyLrZ89lb9qrNKrkEN4Q==
X-Google-Smtp-Source: AMrXdXsxRnz8ErVDlnmLl0+ikx/ZbkjpM5kr5lztHjFD4YuRTg59y8qUfPAuEUseU1bU/BwHYTWjhA==
X-Received: by 2002:a17:907:2c66:b0:7c4:f752:e959 with SMTP id
 ib6-20020a1709072c6600b007c4f752e959mr23181838ejc.33.1674314399341; 
 Sat, 21 Jan 2023 07:19:59 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906101400b0085ff05d5dbdsm14162567ejm.173.2023.01.21.07.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 07:19:58 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 6/7] hw/acpi/acpi_dev_interface: Remove now unused #include
 "hw/boards.h"
Date: Sat, 21 Jan 2023 16:19:40 +0100
Message-Id: <20230121151941.24120-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121151941.24120-1-shentey@gmail.com>
References: <20230121151941.24120-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

Removing the "hw/boards.h" include from hw/acpi/acpi_dev_interface.h
requires include fixes in various unrelated files to keep the code
compiling.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/hmat.h                       | 3 ++-
 include/hw/acpi/acpi_dev_interface.h | 1 -
 hw/acpi/cpu.c                        | 1 +
 hw/acpi/hmat.c                       | 1 +
 hw/acpi/memory_hotplug.c             | 1 +
 monitor/qmp-cmds.c                   | 1 +
 6 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
index b57f0e7e80..fd989cb661 100644
--- a/hw/acpi/hmat.h
+++ b/hw/acpi/hmat.h
@@ -27,7 +27,8 @@
 #ifndef HMAT_H
 #define HMAT_H
 
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "sysemu/numa.h"
 
 /*
  * ACPI 6.3: 5.2.27.3 Memory Proximity Domain Attributes Structure,
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index ca92928124..68d9d15f50 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -3,7 +3,6 @@
 
 #include "qapi/qapi-types-acpi.h"
 #include "qom/object.h"
-#include "hw/boards.h"
 #include "hw/qdev-core.h"
 
 /* These values are part of guest ABI, and can not be changed */
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index f6647e99b1..1a7eb54c98 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -2,6 +2,7 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_cpu_interface.h"
 #include "hw/acpi/cpu.h"
+#include "hw/core/cpu.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
 #include "trace.h"
diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 3a6d51282a..d9de0daf89 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -27,6 +27,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "sysemu/numa.h"
+#include "hw/acpi/aml-build.h"
 #include "hw/acpi/hmat.h"
 
 /*
diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index d926f4f77d..0b883df813 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/boards.h"
 #include "hw/qdev-core.h"
 #include "migration/vmstate.h"
 #include "trace.h"
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index bf22a8c5a6..051b825986 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -41,6 +41,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
+#include "hw/boards.h"
 #include "monitor/stats.h"
 
 NameInfo *qmp_query_name(Error **errp)
-- 
2.39.1


