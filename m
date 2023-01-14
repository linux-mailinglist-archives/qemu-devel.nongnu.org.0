Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676DE66AE4D
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 23:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGp0T-00015O-K7; Sat, 14 Jan 2023 17:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0O-00013D-7O
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:28:04 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0M-0003hR-Gr
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:28:03 -0500
Received: by mail-ej1-x62b.google.com with SMTP id u9so60069752ejo.0
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 14:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wzORsWbTapB5OlO96gO8KniljyDWuA5amvSZ6XptoxM=;
 b=S7Q/rT7fuPJSYSjcqJ+DRN5JPyEIzaNQkLUuPRCfOpp9FnlgNvAQAzntwSu/+HdGUy
 p9hYDTuU+NlFbfrPLnNJU/hsnJMKaLUW918T36xYAEcOEr5HkWC3EKuC1DZTuayQVkkX
 hoJcuFkxH5QtAW+PKBfYBGO4EgIVfJPvJWuQd7i/Rg5zsFNLiSxBHzDDzsSkNyHvxQhW
 yffD1Xkkgc59wLagAU9U7tq4HkAHQsam9zMBbS64l2xBKUPEW2EgfidhA0OcxwuJRZeR
 2vxHq7caHoFzKjR5OE9u2TTigd8tUVviEXpcBgr71hMI21OiTv/RVoWzlaCHeU3MhcUb
 aI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wzORsWbTapB5OlO96gO8KniljyDWuA5amvSZ6XptoxM=;
 b=NBuCPIienpoyWmhrdRQkaolt88K7ei1dbKe5jwokUNsRkpaXlHjkAgXI8eQFALK80h
 lfAABbhZqJ0qzwHfhBM29uvF9rkYvFvYhspDSsvM8PgB7fjav/yFxT+e78ymdbqAdD5k
 LXeGC9yvQnUF6a5djYM0SftYVyhPmVl3tutj/SzQpvUejg0AE1dZpdgaWbt2sjqumPgN
 DoaGy+99CS04D5l1M1ZXZS+H0sSwGvxstPa0lTnEFLYpS+NULPJ3VSmTNVY9wjCPTE7Z
 qmxi4j0B65bDbE7yjktrBg+K3XZuELCW35/r+CBhfO8Q+5lqTy2IG1zFPCxtFyjXXTo+
 +KlA==
X-Gm-Message-State: AFqh2krlyRMSAPym+5ppudLsPUB9/P1f3HR6+eAz02ZXskkOewA42yAl
 eFYBXPTsofzaMJNLT67cE/0Ey0VeeoE=
X-Google-Smtp-Source: AMrXdXu/jFLdpy0FM7Mnl3qi7/gI7/Cu6CrYQBpV4hzU+uQI6eXeDdAooI/Uzp4ZRgBsUxBUbKkieg==
X-Received: by 2002:a17:906:524b:b0:7c1:5098:907f with SMTP id
 y11-20020a170906524b00b007c15098907fmr73163244ejm.61.1673735281513; 
 Sat, 14 Jan 2023 14:28:01 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-013-123-004.77.13.pool.telefonica.de. [77.13.123.4])
 by smtp.gmail.com with ESMTPSA id
 og5-20020a1709071dc500b0084d420503a3sm8324840ejc.178.2023.01.14.14.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 14:28:01 -0800 (PST)
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
Subject: [PATCH 7/7] hw/isa/isa-bus: Remove now unused isa_build_aml()
Date: Sat, 14 Jan 2023 23:27:38 +0100
Message-Id: <20230114222738.282478-8-shentey@gmail.com>
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
 include/hw/isa/isa.h |  1 -
 hw/isa/isa-bus.c     | 10 ----------
 2 files changed, 11 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 6c8a8a92cb..25acd5c34c 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -86,7 +86,6 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
 ISADevice *isa_create_simple(ISABus *bus, const char *name);
 
 ISADevice *isa_vga_init(ISABus *bus);
-void isa_build_aml(ISABus *bus, Aml *scope);
 
 /**
  * isa_register_ioport: Install an I/O port region on the ISA bus.
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 1bee1a47f1..f155b80010 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -24,7 +24,6 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
-#include "hw/acpi/acpi_aml_interface.h"
 
 static ISABus *isabus;
 
@@ -188,15 +187,6 @@ ISADevice *isa_vga_init(ISABus *bus)
     }
 }
 
-void isa_build_aml(ISABus *bus, Aml *scope)
-{
-    BusChild *kid;
-
-    QTAILQ_FOREACH(kid, &bus->parent_obj.children, sibling) {
-        call_dev_aml_func(DEVICE(kid->child), scope);
-    }
-}
-
 static void isabus_bridge_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-- 
2.39.0


