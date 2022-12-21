Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE5653492
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:08:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82Ty-0003Xm-8m; Wed, 21 Dec 2022 12:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sd-0002nA-Rq; Wed, 21 Dec 2022 12:00:57 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sc-0008CX-Bw; Wed, 21 Dec 2022 12:00:55 -0500
Received: by mail-ed1-x531.google.com with SMTP id a1so7847741edf.5;
 Wed, 21 Dec 2022 09:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzhj3qF/8UNfXqnrQcm5kLbKLcJsPpAaqvtX2hjFS9U=;
 b=Dn/xnGJTcFM2s/mBPUfkNfB3k0u2UamzLNx6E+tOQ8qdVFM7LxfnVpUi5fEKOXnSdE
 KmcHlaRYsVBes4Wp1lAUqlxKo1nS6eZg0TRrHf7o5wWbylZTxCOJohIrwOaRlUwxBfY9
 HHfrdXjuMWGCXN0WbTKydiGKFlW4QV0UFw8MYCWjRvERll3aPoMyWGaxCGQO8SNA29oh
 LFDOnJp3cXa96EQoPWJuH85u/+oUAMisIqb3pVRSY34XA45Xlsoy9fTROKERucG5d2ae
 n/dIQQF+K4HDUXMzUB/5Cz7WmPtJT50zaL0VbBV8KpMfghelvWIPPkpYp9j/s0sBBTw/
 8vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzhj3qF/8UNfXqnrQcm5kLbKLcJsPpAaqvtX2hjFS9U=;
 b=etfvWQaYPH8Apxq8//+vf1BUGW4cqJVT8Ez3V4IaN4ncWUihtnAz8T6kdVC0GR0cJo
 M3mcOHnwpCHriflgqYWAUIp8bEosvXQtQxuRhOVjVVVkHG1RfKCj4W5G2Cc9K8HQFBvW
 Ujxb55Preh3ZEpJAWFWh9apWCxY+/WAuo8TQiJJiDQn3BOs+tYRVDQFsg+1jIsvtP3Ln
 QM3dk+JWmigkbvHYxAA5GKQwPpNIuvz3ByzMQKEPj2ecO88wAfOBB0UF1hSJEtfGN5S7
 u/MTF8BCSp453nkS8QfNggZ+hrPiJrZCNI4Nbt+USgSRT5tT4zF3qhAWuCThz9CNJGPi
 Uy7g==
X-Gm-Message-State: AFqh2krzHoZbp3a0DX8C2BghrtIGigeur1CWob1J3InHbAe0dHCMzxAd
 aOKXNBgcPUlYo9preKjJEoxJo5iwhtc=
X-Google-Smtp-Source: AMrXdXtFh6w13gjrkZ/R5HVxPTKF0U6G/WH6kVMHYXf6x13JCIDNbX+Dji8zefJz48vamgXOYaNOYQ==
X-Received: by 2002:a05:6402:25cc:b0:45c:835b:9461 with SMTP id
 x12-20020a05640225cc00b0045c835b9461mr2043030edb.29.1671642052415; 
 Wed, 21 Dec 2022 09:00:52 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:00:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 06/30] hw/i386/pc_piix: Associate pci_map_irq_fn as soon as
 PCI bus is created
Date: Wed, 21 Dec 2022 17:59:39 +0100
Message-Id: <20221221170003.2929-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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

Observe that the pci_map_irq_fn's don't depend on the south bridge
instance. So associate them immediately when the PCI bus is created to
keep things logically together.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e4bb8994da..bfa7cb513b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -229,6 +229,9 @@ static void pc_init1(MachineState *machine,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
                               pci_memory, ram_memory);
+        pci_bus_map_irqs(pci_bus,
+                         xen_enabled() ? xen_pci_slot_get_pirq
+                                       : pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
         pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
@@ -236,10 +239,6 @@ static void pc_init1(MachineState *machine,
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
-
-        pci_bus_map_irqs(pci_bus,
-                         xen_enabled() ? xen_pci_slot_get_pirq
-                                       : pci_slot_get_pirq);
     } else {
         pci_bus = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
-- 
2.39.0


