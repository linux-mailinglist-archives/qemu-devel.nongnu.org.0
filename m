Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024764040F6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 00:24:09 +0200 (CEST)
Received: from localhost ([::1]:35082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO5zD-0003Wi-Eq
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 18:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO5xH-0001gJ-PW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 18:22:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO5xE-0006B7-Ip
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 18:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631139722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sox0ErEJCzF5se9cHfEhb93bZQg1lpJOq2y21MBeWHA=;
 b=Y6N6l5VOi73+/vpBVgTxysoeKQHr5LkADDl6gtdXyVKRP+cL2ScoPTi6DQzTI+smNNdUPQ
 ONwobV/6dkkkIQwGEL4XmaCpr2zmLst6OSFCYAYq5v0q/z5a8xzfNuXq1mDI2L+6jt5Rrp
 JVYZDkEEB3AeBm/Nwbt9J+V/cKsnnaA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-yWC9ydMXNm-invlsXNcQbw-1; Wed, 08 Sep 2021 18:22:01 -0400
X-MC-Unique: yWC9ydMXNm-invlsXNcQbw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso1673021wma.9
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 15:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sox0ErEJCzF5se9cHfEhb93bZQg1lpJOq2y21MBeWHA=;
 b=TT7FfVHWZm6EgbuE96bvdGJ88XEuDMxVUsWRJcNnfuqZX1kEdiEjXnTilnBtbrpYxg
 /5BIBBSlg7ztzR4t7CSldox/eOLVcMTAGgXTYtBl2KE1FogG3Eh0UWj3ry6cWw8xVfTR
 OiAUhTjsf5Uzg8vF2CqcxVtyErLbI5QDY2F9M9JgLgNrrkCt0GcW1ia6qCRJTnBWDo1t
 eyMOiichZ/UI9oKjYbAKQ5f2uuCc5suPJ1t+H4e+n+JlPHL4Pd5T5ushk7iW6tOdHdkr
 5S6v+hf7tTXFAdB+qdnEaO3DkdKJKN8f7RyqpBCp3GratjZ4fiPxbLnYVEWcOgCIl571
 PLzg==
X-Gm-Message-State: AOAM531968jqi6aj0kcbsjaM/9I2apTsde/YmsmGMXTYYWxp5pCzxEQt
 QKy9+0Lv5VtqpOTbocbeQR4nHYWHixoLBpnLVz2iHFJ5g5KVQH9a9pC3omJavSO3eOJEEKRv17a
 8FrwHtIyeKkXNdzc+nMdeUbBu4ytrozeGyJ7MxjnWrLBnlavgORU89WnTKAgYJSuZ
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr524060wrf.312.1631139719652; 
 Wed, 08 Sep 2021 15:21:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw87ledNau73FknFQ6WyYJvP/da0ZEunenrueghy0KHVvY6a1jgfQJT8IohmtFgXzXveCCzg==
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr524036wrf.312.1631139719280; 
 Wed, 08 Sep 2021 15:21:59 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z19sm3881594wma.0.2021.09.08.15.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 15:21:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/i386/acpi-build: Fix a typo
Date: Thu,  9 Sep 2021 00:21:57 +0200
Message-Id: <20210908222157.2377282-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix 'hotplugabble' -> 'hotpluggabble' typo.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d1f5fa3b5a5..478263e12c9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1916,7 +1916,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     NodeInfo *numa_info = machine->numa_state->nodes;
-    ram_addr_t hotplugabble_address_space_size =
+    ram_addr_t hotpluggabble_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
 
@@ -2022,10 +2022,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * Memory devices may override proximity set by this entry,
      * providing _PXM method if necessary.
      */
-    if (hotplugabble_address_space_size) {
+    if (hotpluggabble_address_space_size) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, machine->device_memory->base,
-                          hotplugabble_address_space_size, nb_numa_nodes - 1,
+                          hotpluggabble_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-- 
2.31.1


