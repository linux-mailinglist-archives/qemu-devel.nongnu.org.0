Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A0E66BE86
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:02:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHP5g-0005Yo-85; Mon, 16 Jan 2023 07:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5N-0005RN-JY; Mon, 16 Jan 2023 07:59:39 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5K-00018H-MJ; Mon, 16 Jan 2023 07:59:35 -0500
Received: by mail-ej1-x62d.google.com with SMTP id qx13so9535980ejb.13;
 Mon, 16 Jan 2023 04:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7JWsWCZehcpT6ngJWodvXzLoKg3Bv3U8R2NWRwkFTA=;
 b=WtVOsYi6Rnmw9gvbL7hWvpH4A+S6OieZnyPQpLqbEQFiTMLtrYPmWbuHlhBJIfdzsd
 zXpJMBKUyctYLJZ9/DBIatH58snubx+CI+WLolb5ucs6TtGHpcBIKoK/sTmO3NNaCTVg
 g6EVHDLODEbf3qkhazImmQxjSQjkSmaHN46fbw87aacDl/tRE3a58wRW624a7Y7Ed6m9
 aYhrmUSya8lFfjdO1UPLRZjFXNcVmk3MlztP1MnwUfpunJ8cdvfMk1saqbEWiKy9ZKwG
 y7K4GSuWkmmS0lFFpN2QZqL7qRiBcLnZp7im9B76Yf2xBirc7fZm27PzRl/ATlVQziUT
 W35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G7JWsWCZehcpT6ngJWodvXzLoKg3Bv3U8R2NWRwkFTA=;
 b=F2nMXoW8bQ7SNJ8chzxR1ZdUR9fr7+aJg9W61pcR9EDCIYAfHYnpNx3+p0JWKpX/mb
 OQGV3DNx+6okA8aV/+tGkSdR5p1h8Jtl5KsBsy1mI/U/tvMRtC6JNfpCrr43/87ITPKy
 ctCCLZbX0cDdrsDhPi4uEBY+Ry1KCGz7aNWeJsw+PB4CKjGrGgpOwZykvw496VFHzDv4
 W6tkiG1pdW3Ahd2hlfK+210IYhnMleiv/I+0Vs0MoHWET5WSHsAexIUtjioiLMe2cT+d
 hZREi5WmVVz2PEgAwys5cnJqmnXfTnQaaBUwWNFzngCYPneiVC+jVfAdLbw+UpJ2JIbp
 sWmw==
X-Gm-Message-State: AFqh2kql3ac8mbwNBs67fkLqPAbsh9MJBmaPaN0y2DcjDQR+lHunleCK
 xVgP1JRMplD8jhYZIPWuKAH9QJFpzBI=
X-Google-Smtp-Source: AMrXdXtCg0dDOuIXx53w62VjBrYCFvAdgGPvlzLUmDWFEpD6O5VOVHclpkCj2AGqumfOnUo96CiuUg==
X-Received: by 2002:a17:907:9c04:b0:86a:d385:81df with SMTP id
 ld4-20020a1709079c0400b0086ad38581dfmr14405769ejc.3.1673873972938; 
 Mon, 16 Jan 2023 04:59:32 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 um41-20020a170907cb2900b0086c4fbb8507sm3201517ejc.225.2023.01.16.04.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:59:32 -0800 (PST)
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
Subject: [PATCH v2 8/8] hw/isa/isa-bus: Remove now unused isa_build_aml()
Date: Mon, 16 Jan 2023 13:58:42 +0100
Message-Id: <20230116125842.66817-9-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116125842.66817-1-shentey@gmail.com>
References: <20230116125842.66817-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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


