Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F4D694C60
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:21:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZO-0004bM-Ga; Mon, 13 Feb 2023 11:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZL-0004a6-Ut; Mon, 13 Feb 2023 11:20:44 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZK-0007w3-7u; Mon, 13 Feb 2023 11:20:43 -0500
Received: by mail-ed1-x52d.google.com with SMTP id fi26so13641610edb.7;
 Mon, 13 Feb 2023 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XW7xO6YJKL9F4WjdLXKBwfmeW/OQ9/AIW0Vshsiq+Yw=;
 b=ErEoLK0HSfaLC6Hru67T9svbJdBd70XiNqTEfQoY8aelwnlKdAo2zNOFzrvaZNjNl+
 snLM8P9nYArNDgeEGacK4eajl3SeVb6GYEUHajQbrtyxEhnB7nz4yTnbgtIeYh1oKBcT
 hLLF98fLrZA1p18+yzcq1wBFbXJ5y4QrXEE+Rha827Wt9z9xJaXbMfHD5misVMu7P617
 AmL+YkxIBlv7X5beSOTLIot1bLEqb7ZgdBnRxHFciCAeEaOG06CGiT7JRbxOfq9Hbte4
 M2XzHa6Nx2OdBfOu43urBHS9nwm9j9cz22LcS3sEIgml9oYO/+fMyhzdQroTCVXm+MeT
 +MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XW7xO6YJKL9F4WjdLXKBwfmeW/OQ9/AIW0Vshsiq+Yw=;
 b=1keEmtmeFV4DNB0MNKxx004fo6mgx+0JFC7FYEuqdeMX48muDgvOUsb1vFY4eJ2hsZ
 QUyOTtO7Vfv1QLt96zFM8LkKDHYflkeFBkql8WbiGzq7f466NoGex2Ya7OfbXy7mbWiD
 K5+v/QLOBDDbhJ0Vq8v5sIfcGurETjf2THPKb3S77GeNtL7f/jCcCS6A4Ia/1MzPaF4Q
 AGoQ39FufedruwIyhtr0b0UOKb2hg66ArEVu+D5ylsyUKS2nQpClxPvAgWS2uTgnqXef
 +8E3aqJTIYiDUV1V3DnRVwWaqIOpTeeSr/BWhRlC0BSdZZuu6vRS9CU4uSHCwwhWyhiW
 B1GA==
X-Gm-Message-State: AO0yUKXlL8S5jStGpCdw7zL5fRK07CcchalD8wNWcwaqqNPFxDrhd6gM
 8t8ocODqWqxIwhKVNZAShPq+/SWSVAc=
X-Google-Smtp-Source: AK7set/vJ+SmM7QB3wE9GE6uXenVHYT1NwSHj3zFNaZy30E1y7rtsxc+qSn5qApMWsAn5+17rAzO8g==
X-Received: by 2002:a50:ee8f:0:b0:4ab:1715:2858 with SMTP id
 f15-20020a50ee8f000000b004ab17152858mr7688539edr.11.1676305240166; 
 Mon, 13 Feb 2023 08:20:40 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm6979952ejl.211.2023.02.13.08.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:20:39 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 3/9] hw/i386/pc_q35: Reuse machine parameter
Date: Mon, 13 Feb 2023 17:19:58 +0100
Message-Id: <20230213162004.2797-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213162004.2797-1-shentey@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc_q35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 66cd718b70..dee2b38474 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -218,7 +218,7 @@ static void pc_q35_init(MachineState *machine)
     pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
                    pci_hole64_size);
 
-    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
+    object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
                              OBJECT(ram_memory), NULL);
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
-- 
2.39.1


