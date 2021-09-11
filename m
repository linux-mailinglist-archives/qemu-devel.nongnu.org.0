Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B404407592
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 10:21:48 +0200 (CEST)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOyGg-0007uW-S1
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 04:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOyFi-00072Y-23
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 04:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOyFf-0006cX-ES
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 04:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631348442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vx4nte4uvXOqJ0OSbI8JJD7U5Dv7AVbtB8G0DHVhvzA=;
 b=R+Ey+u8gXG8g6zuoMFLgyhtH3/7s1BWFIUvejW4N7oW0d/NNMtUrjKw7HMA8HAe3PasJf6
 KJYeHCR1ousEOkFhfc23Z48Vkwe6E5lQ3Rip/Zx8pv56OzvyonCDNdtIFhYl3+bT+Rhzuh
 qls4kO4S8d9DXdJs3Wd3/rQZ2VBrYBI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-UwO98vywOf-mCxVoqd_TzA-1; Sat, 11 Sep 2021 04:20:40 -0400
X-MC-Unique: UwO98vywOf-mCxVoqd_TzA-1
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so1776984wmk.2
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 01:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vx4nte4uvXOqJ0OSbI8JJD7U5Dv7AVbtB8G0DHVhvzA=;
 b=02ZfvrZXc/usW86N+Z35jE9Kcytni2jZcsFDJ57Pxj274nLN9X+198KvzQsErEArUf
 rd5LEQQIssbbNKyLeULz/KhJ6slRTlPp0QQxQAU0jQN9V9ML7e1FGEeeUIyo/3dc2rLR
 BZveyj6gF1060HM3ghWG14Js+L34t1j+Csd2DHNSG0VqlYyKQS5m/ZaSghymK158qKbS
 Bwf2t1CVmRdCzs2yJscFDw36UlFSkIfNgTzTkUyB19GrjZKpyHo68+JNWqwNzpHDBSIp
 iLXD3HAH0cDvSbpjrf7gVKOU9yDEqnCqUy3VmOA5rmQnyI6RPmRVwKXUvZaA+YFDLi7z
 hJ1g==
X-Gm-Message-State: AOAM5304wsZ2Kh+DJPkabh7nyEhbqY5mb/7lkhg4DeeG/+FTpCvC8FUA
 rSfvA2Mrgj9Xd9YdQNfc8xvVXXWCx4dRX8M7pBiHNHg1gjq1RQd8NUa59gkSb9BHJsT32X7C8FS
 4/SUS5y2AcQsoUTsT6exRfZxfIBeKCVb/zKacljNSe6qjPJtOnQ+Tb084fgZkXhtr
X-Received: by 2002:a5d:6792:: with SMTP id v18mr1934546wru.416.1631348438783; 
 Sat, 11 Sep 2021 01:20:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTKL2hgGfzpAuT/Gj6gUV1MSbAu/5Bda0VxeRQm0zomrVUhZlTHAfGvZqU2E+hEEeggu8xCQ==
X-Received: by 2002:a5d:6792:: with SMTP id v18mr1934507wru.416.1631348438370; 
 Sat, 11 Sep 2021 01:20:38 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id p5sm1075939wrd.25.2021.09.11.01.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 01:20:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/i386/acpi-build: Fix a typo
Date: Sat, 11 Sep 2021 10:20:36 +0200
Message-Id: <20210911082036.436139-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix 'hotplugabble' -> 'hotpluggable' typo.

Reviewed-by: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v1 still had a typo =) (Volker Rümelin)
---
 hw/i386/acpi-build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d1f5fa3b5a5..dfaa47cdc20 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1916,7 +1916,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     NodeInfo *numa_info = machine->numa_state->nodes;
-    ram_addr_t hotplugabble_address_space_size =
+    ram_addr_t hotpluggable_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
 
@@ -2022,10 +2022,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * Memory devices may override proximity set by this entry,
      * providing _PXM method if necessary.
      */
-    if (hotplugabble_address_space_size) {
+    if (hotpluggable_address_space_size) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, machine->device_memory->base,
-                          hotplugabble_address_space_size, nb_numa_nodes - 1,
+                          hotpluggable_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-- 
2.31.1


