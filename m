Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3566BE8F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:02:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHP5C-0005BR-67; Mon, 16 Jan 2023 07:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP59-0005AQ-LF; Mon, 16 Jan 2023 07:59:24 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP58-00014g-1H; Mon, 16 Jan 2023 07:59:23 -0500
Received: by mail-ej1-x629.google.com with SMTP id ss4so60629732ejb.11;
 Mon, 16 Jan 2023 04:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDvnNleTofFVRIOnoN95BqkY3xCpBxqsWSXhf9xPH6I=;
 b=KypHgCttC3+NnaBH2BHOhCvu1zT163HS3dpbxammkVo7smBENGYyWpHV9vPNthU/KP
 I6lzPx5LXQF96aplCSN1rEeDB4WdTQKUzdXdfecjpLanwgUAVLK8Kvz8PLfNmyeu0jKi
 BJ2knOTGvAc76iwIiCRig7QTrHvKFD3WgA5Jhtu9W+Zn5PmuzpPabjoj7xc12csXNt5w
 CsrZ8jRtVKUSHfErs+fYkKQZUDYPZyoqBqOGhN2Hg6GxHnYYS0iQAhJKnyLdv4LD+Ebl
 kOlRFuTdBq2diSHRtWKsE/ySILyElCOmvncw9CbkE40sJyjlLpfqJNufdpOqXpUoukPY
 mb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDvnNleTofFVRIOnoN95BqkY3xCpBxqsWSXhf9xPH6I=;
 b=rQb4rSdXPEEi5zfLcQk3cO4C0ta4npYVRhjYC2Rhse7n+r6YdewDQgTCXM/pnUkkTU
 Hxhw1m1k4rDKxHdkHHE+7YEe5WWLo1IeJz1QEvDTifVbUHglxzNcR7xVXpN7P+lACrsw
 v2IaRqdRauh47WH4dtE4cuVy/YRmapkMJbEyYbrtES9VRIDXeVVx70hWD3cdndnx7aym
 Qg9CpQd01bdd8sOsMmj6wWlpHmY3S4SoVSKANSIO/JnhPbFkxhYpQNJgd+28489VIstN
 RvC4g/Qp+JcwNmoJuFnwBPmLxYkihgzneVS2fIRuQwRnUi/7YWAp249PGuyF/MUrEQU/
 ZZJQ==
X-Gm-Message-State: AFqh2kou7tvmw4Pv45LHYgccQNr7tDspk/z89yaxZAf1vZQEv1oi/GkM
 eURpPCsjoNOaLc+glRf2vgkJqeAZo/o=
X-Google-Smtp-Source: AMrXdXs1nxyj7kPJheEBYqppFAFIhZVokOn8AkflWgose07Z0HP0zB0i24eSwjpZNzwj+9EQ82o3nQ==
X-Received: by 2002:a17:906:a82:b0:81b:f931:cb08 with SMTP id
 y2-20020a1709060a8200b0081bf931cb08mr12251222ejf.47.1673873959996; 
 Mon, 16 Jan 2023 04:59:19 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 um41-20020a170907cb2900b0086c4fbb8507sm3201517ejc.225.2023.01.16.04.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:59:19 -0800 (PST)
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
Subject: [PATCH v2 1/8] hw/acpi: Add missing includes
Date: Mon, 16 Jan 2023 13:58:35 +0100
Message-Id: <20230116125842.66817-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116125842.66817-1-shentey@gmail.com>
References: <20230116125842.66817-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

When removing the "hw/boards.h" include in hw/acpi/acpi_dev_interface.h,
these include directives must be added to make the code compile again.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/hmat.h           | 3 ++-
 hw/acpi/cpu.c            | 2 ++
 hw/acpi/hmat.c           | 1 +
 hw/acpi/memory_hotplug.c | 1 +
 monitor/qmp-cmds.c       | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

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
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 4e580959a2..9148b3a49e 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -1,6 +1,8 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/cpu.h"
+#include "hw/core/cpu.h"
+#include "hw/boards.h"
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
index 2932b3f3a5..45b0f2905d 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -44,6 +44,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
+#include "hw/boards.h"
 #include "monitor/stats.h"
 
 NameInfo *qmp_query_name(Error **errp)
-- 
2.39.0


