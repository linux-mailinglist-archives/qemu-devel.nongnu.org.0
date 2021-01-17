Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C52F94F5
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:39:16 +0100 (CET)
Received: from localhost ([::1]:48102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1DtL-0004V2-90
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgw-0008TM-LG; Sun, 17 Jan 2021 14:26:27 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgu-0005Wy-Uy; Sun, 17 Jan 2021 14:26:26 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c5so14444877wrp.6;
 Sun, 17 Jan 2021 11:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XogiRe5yl1pNdqgPP5V4b7SXP6ekjym12cW6DYLGVp0=;
 b=dHzl2LACEwVQNJhxnDfIp+k/e2+8X0LFiprYl04+U7/AQgBLE93j09+DEwxBHCx72r
 CpPITxjy0TJLx+gj5fT+DRnsn6nE411uOqW8Q0Qz+7e3Hzv2ATu6bA3hbpfk0+wVyWx0
 urrTcZ+Q3haAu562yWx3+KF3Z1YQpnASASkSMdgJJ1h72rLOJOfRwKX3BllpWATYdY7H
 SV3Cv0fvvH2RbAGCDNA7wxT2nNU8eHb1aDIpyyFwoOM4+7aue5h+I1mRqG+ItGfAI2Tu
 LSeFn1EDviFdR6c5vpEaSX5nwDmIKmMKo8XujmtGig2c/WpZHoWmX90dUJgA4O/RwgFP
 Jy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XogiRe5yl1pNdqgPP5V4b7SXP6ekjym12cW6DYLGVp0=;
 b=NZT33XADN0226G9ffxKXHsqLQsj4VkGjmwvJsljHiJFhUbPi1Zn0UJJ6YL8mBRSs5P
 BVOFIjBb65qon+vWaNGZIsQubF4Av6jZ/tcBMo3IsBgfs2r0sFeJzfT4nyhUJYSaMMdS
 nn0kUGFI1W9SSxr2IQReKkESaJf7Nx1Yq7dOLBuspdHL3XBDo/3TP2v/d3j43KiPNmq2
 MYChHxFPJ03larWVfVBjahy/y/RBUczT8EDjogz0PxR4lG+S63QI8lsNYP3TqtyKdRQk
 QS78016dkKVaU9xup8Cv+ltRIV/igRZBcr/ZKqwDq2VEp6QwAF/b1fqgqEXM7jyYd346
 nixA==
X-Gm-Message-State: AOAM532UtLF02mEycn5UT/qa4P/GRMCitWUGKWufGlVbvEZFTWqPQAiA
 yXhosQ5HppcTKWP4CIorbII=
X-Google-Smtp-Source: ABdhPJz3j/0k13Y+1hAKw3keqLsar5KE6t3HteVdbPBktHQmHravmlslxwvSJKSccWLBysDa73hcFw==
X-Received: by 2002:adf:eecc:: with SMTP id a12mr22631110wrp.312.1610911582822; 
 Sun, 17 Jan 2021 11:26:22 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v4sm25387282wrw.42.2021.01.17.11.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 17/20] hw/pci-host/gpex: Mark device with no migratable
 fields
Date: Sun, 17 Jan 2021 20:24:43 +0100
Message-Id: <20210117192446.23753-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_GPEX_HOST does not have internal state to migrate.
Its only interesting state is in the GPEXRootState, which
is a TYPE_GPEX_ROOT_DEVICE which migrates itself.
Explicit there is nothing to migrate by using the special
vmstate_qdev_no_state_to_migrate.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/gpex.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 2bdbe7b4561..2565dc27ae4 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -115,6 +115,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
 
     hc->root_bus_path = gpex_host_root_bus_path;
     dc->realize = gpex_host_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name = "pci";
 }
-- 
2.26.2


