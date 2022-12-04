Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE8641F19
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:09:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLC-00022k-F0; Sun, 04 Dec 2022 14:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLA-00021N-3g; Sun, 04 Dec 2022 14:07:52 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uL8-0001ey-LJ; Sun, 04 Dec 2022 14:07:51 -0500
Received: by mail-ed1-x52f.google.com with SMTP id z92so13113677ede.1;
 Sun, 04 Dec 2022 11:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/wxsTmP7l5LlF1GFek5c+GBtV7vec6Q4LUqFd5Igoo=;
 b=fJrFmhbnq+mc1vIsvPUQW/20AR6zVAeDCJc15nx84LhyukivEHGp5wRhgxSJvCp+LG
 8fKz04D5N+jMgAUWnvy6+AS+dqkLKVDNrMcQrv9NG/BPM3oxj1QSwiHndT2JKL6JjUO9
 oeF+SadkQZoN3fSU3ZjznRuHENFvmpx/DB5epSSHMtQ/NpOj02Q2+hXmQUjmWUN4FRq7
 JR9UTI4f3+/hmn00C8ueup5X3oQONQCjtGOVMZEjwFnBY+DWox7qAtmNF8TG1AfKXNCr
 JBc8jBdCJKsOATXwvJ+lNBNsvh22+zltYxYLsx3rSQnrJa9FkVmTkMVCIUH7qSuvnPYC
 AgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2/wxsTmP7l5LlF1GFek5c+GBtV7vec6Q4LUqFd5Igoo=;
 b=wwOhk4bkwaVCkA4VJ4VaN8LcEAXvzEtfZl2B1wZJKwvxSpKyQd7xbpvCWsiMh/afH/
 4jrPHE+L5VqfVhp7hmOOD2jozqLLfd1Q3YdWmr++XfG4EG+k45gID60riNkwr9s+8DJh
 LWN926kOp0Uw/RiXwJrWtwYqWmZsUtOPIfrhiD0oo8/N2xEOBbJzSGVta0MG5rGGQWUG
 J2Oz7MhO0tLiYtLhfXovGRkqOM9hQgAGzPGp0y8Q8N9Wez0B1khwQKzl8+4Y11ZvZhI4
 8fAp98qizbqqwsQwACHFSgv/9bHhQmYysGcjfz8lxYfzruv7pBKd4YsWZVagQ+VjjEo2
 qdsg==
X-Gm-Message-State: ANoB5pnpUpDMnx1ZPnMVobinxouvQlrxi2pMl94BdcJ4odMCozw17ekx
 unIuX/xFa5CUJS7BYdfarPsvvIN/0+k=
X-Google-Smtp-Source: AA0mqf7xXXJJkVSVMZZQxSqeEJYhGBh5jBQ5QFE3u4Is2elcmBPDOMOdpc2yq+Cta3UrgrJsaqp8mw==
X-Received: by 2002:aa7:dd0e:0:b0:46b:9dee:1e09 with SMTP id
 i14-20020aa7dd0e000000b0046b9dee1e09mr19592534edv.390.1670180869126; 
 Sun, 04 Dec 2022 11:07:49 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:48 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 17/32] hw/isa/piix3: Rename piix3_reset() for sharing with
 PIIX4
Date: Sun,  4 Dec 2022 20:05:38 +0100
Message-Id: <20221204190553.3274-18-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
Message-Id: <20221022150508.26830-23-shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index a811a9bdab..e99622699a 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -156,7 +156,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
     piix3_write_config(dev, address, val, len);
 }
 
-static void piix3_reset(DeviceState *dev)
+static void piix_reset(DeviceState *dev)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
@@ -406,7 +406,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
-    dc->reset       = piix3_reset;
+    dc->reset       = piix_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-- 
2.38.1


