Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E026099BB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:22:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhsY-0003lH-AP
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG66-0007Tb-Ah; Sat, 22 Oct 2022 11:07:38 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG64-0002Rg-TQ; Sat, 22 Oct 2022 11:07:38 -0400
Received: by mail-ed1-x534.google.com with SMTP id e18so16111698edj.3;
 Sat, 22 Oct 2022 08:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BaVSE48kspYbLZ9VZblE9FtnZX8RMdoxMh3IsSPxpjA=;
 b=j/q8fjHNsoCYvs66N+Ic0W8MKn+Lu3DDKKYd7di7S4Jptk5+X548JHk7WzVBZ6aC3f
 fRUgkRdtwL53+s7UAPwPiBcevcRt40LRlHd/vwZ1UQdaEh3AcM+pkHd3w5jZIZwa7o5v
 M3RjhGWgYb0xbxGOsJjwyH8JB0bO6Yc7GkihxHqJ/Js5sxHcon9Qz/vMNmKvKKdgHkR6
 /5YiYT/gbNrrVUIo5jL0NTSNT4LnMHhV1w2Aujxu3BGh2L/ESs6yC9hP3J8IC8W37dgc
 ka9Uld2DvQuBWQ8td0ooiO6t111Qsr1Oi7jxXFKHgpXJW37UVPJFLX9RZEiRR0Hu4zk6
 F2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaVSE48kspYbLZ9VZblE9FtnZX8RMdoxMh3IsSPxpjA=;
 b=UIiJzM9mEnJWMUOUbVBkC9I/oSoIJ5a4nZAvjbFtty6QDKKLY0y0W66/7VNougN8NI
 xwkAR6MvFFrezSW5zOs4rXMhVUEpVe9r+oAqwDrGXsJrcTqL7Gc8LUqr6UkLcAglx6tC
 I4btD7a1H49nIzDilOpm2RggC0g0t3WspbNM3FnxHItogxv3X4O2H36hwPTCoy05VHnc
 siVJlTWp2AwQUZpxT3luh7IB+s9Lfxeej+QnWp42+AMQWB/2gOX+A1pKWr58DobEGdZU
 3ppCMi+BR8gjZ8HbXkEdwafW4Pa7CYlb7bmKDypPUoIv2TBZkP0Cb1kuQxapHsmjUsKe
 AHRQ==
X-Gm-Message-State: ACrzQf2OC6fHhzRXky5dCVGjqFG4nLYWCGOctbrWniehscjx6lQWamy0
 Cm7qw67pSHGp4YtekKT3XppKar6nMif49g==
X-Google-Smtp-Source: AMsMyM5p+PauxRlCmKB7AxVOWLcpoDsKwoHqgmO4PS3xeoDjRq8mwMqtCGYmukr54cR7EC6Kz/J6Fg==
X-Received: by 2002:a17:907:7d8f:b0:78e:2cba:560f with SMTP id
 oz15-20020a1709077d8f00b0078e2cba560fmr20408049ejc.173.1666451254952; 
 Sat, 22 Oct 2022 08:07:34 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 43/43] hw/i386/acpi-build: Resolve PIIX ISA bridge rather
 than ACPI controller
Date: Sat, 22 Oct 2022 17:05:08 +0200
Message-Id: <20221022150508.26830-44-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolving the PIIX ISA bridge rather than the PIIX ACPI controller mirrors
the ICH9 code one line below.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c006db72e8..d705ff6f3d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -288,7 +288,7 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
 
 static void acpi_get_misc_info(AcpiMiscInfo *info)
 {
-    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
+    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX_PCI_DEVICE);
     Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
     assert(!!piix != !!lpc);
 
-- 
2.38.1


