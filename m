Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C058F400460
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:54:36 +0200 (CEST)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDOd-0005Qj-Rf
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGM-00087k-5s
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGI-00013I-1h
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6osDXRphDo8TIq2I2JrJLj4Iq8ymwMld3GU8FS2XmwE=;
 b=h7FHLJBjnRkDuPIleL5LeoeRYVjchRYaPXWh18QyYDa+j/IZzB4NbVxbQ3jn280eytLAzE
 kGcsOhawObVEqKoqjrYqSqNxGRzhn0iQUR3hqNIWQN8EbQsIJ8klaDGT0MmqCr3Ta4uGpt
 xoAChLf2zuir8MZODrUyUhrfQMNOBgs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-5AWaDLZiP8mR0KVTopsJhQ-1; Fri, 03 Sep 2021 13:45:56 -0400
X-MC-Unique: 5AWaDLZiP8mR0KVTopsJhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so2138654wme.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6osDXRphDo8TIq2I2JrJLj4Iq8ymwMld3GU8FS2XmwE=;
 b=RueDoMGA+FiyDz1Zwjztw44IREzQwu+vUCBsZGkYP+McPHwjT3AEXanunhgW8jirp3
 WFmRmi+xxPm3E5oTNTkLLKG0ilZlvrASo4NtFmHaeP/EVCwl8OYmLTErfSVmk/s+riHQ
 VH3f8kjdNQmrHsUIfe5q9Bt9pPT2UrxORBDXxKknEgVLlycTL/6GmFntK2jFLzlk1cV8
 gTnvejp7q3JotiuGVh9frKm6Dfm9AQ8JCQLlycPPt/FflvlQnJ6HYXUhM9cpA5pn39Yi
 7hLH/M0OhDhTuBUImJxzM4OXEMHHMUbqMQqiMPD0SxBdi8NXWJn8dAnQ3Se889/HPKCK
 vVXg==
X-Gm-Message-State: AOAM533mgB5Da0ZPpPKS9R5yoE8vz5n6ChrvWIVJoFS/PpJ5mLD5CZ31
 WlJcbM5EDqkarCbF6GDnM7dt/SWe4ZgIaV614Vxhui4oTbb73pTtq6l9uP5LKyPO5hrukQgMQEA
 Di/kVI7ScBpUhBMDJlDiSvakAPwTJPG7Qa+4XU5g463vDngX1T/CdA1nAYFnLqM+k
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr19281wmj.63.1630691155033;
 Fri, 03 Sep 2021 10:45:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvICEoePWDdVv201fWjAJYQJgNTljhMxvLXfLqfqFtkx3so0aowhDnNuia6XImhOtdvl/Mqw==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr19251wmj.63.1630691154811;
 Fri, 03 Sep 2021 10:45:54 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j18sm5524762wrd.56.2021.09.03.10.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:45:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/28] hw/acpi: Avoid truncating acpi_data_len() to 32-bit
Date: Fri,  3 Sep 2021 19:44:50 +0200
Message-Id: <20210903174510.751630-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

acpi_data_len() returns an unsigned type, which might be bigger
than 32-bit (although it is unlikely such value is returned).
Hold the returned value in an 'unsigned' type to avoid unlikely
size truncation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/virt-acpi-build.c | 2 +-
 hw/i386/acpi-build.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 037cc1fd82c..95543d43e2a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -885,7 +885,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
 static void acpi_ram_update(MemoryRegion *mr, GArray *data)
 {
-    uint32_t size = acpi_data_len(data);
+    unsigned size = acpi_data_len(data);
 
     /* Make sure RAM size is correct - in case it got changed
      * e.g. by migration */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a33ac8b91e1..aa269914b49 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2660,7 +2660,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 
 static void acpi_ram_update(MemoryRegion *mr, GArray *data)
 {
-    uint32_t size = acpi_data_len(data);
+    unsigned size = acpi_data_len(data);
 
     /* Make sure RAM size is correct - in case it got changed e.g. by migration */
     memory_region_ram_resize(mr, size, &error_abort);
@@ -2783,7 +2783,7 @@ void acpi_setup(void)
          * Though RSDP is small, its contents isn't immutable, so
          * we'll update it along with the rest of tables on guest access.
          */
-        uint32_t rsdp_size = acpi_data_len(tables.rsdp);
+        unsigned rsdp_size = acpi_data_len(tables.rsdp);
 
         build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
         fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
-- 
2.31.1


