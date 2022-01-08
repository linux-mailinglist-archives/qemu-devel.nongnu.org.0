Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A14880CD
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 03:06:17 +0100 (CET)
Received: from localhost ([::1]:46482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n617Y-0003sR-AD
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 21:06:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BK-0005qd-DD
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BI-0002mZ-Sn
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frHd/5g516X/URldKy7BtToYamE3vI32g+batxojBlk=;
 b=ZdZAyqtoMGff08msiXPIcVTwdNMUDfCdddN36fj5OTFVB5LtcXgAIgjLvqhLuiSlvY/xni
 sAwAlAIsWiQfmqo2zVcxhunh1tPzqtq/oxwkkoGN9P0ZJpz+XAV5stPifkeXeiPsypNPjb
 i4h7NKzYafgUnQH2I6NNm2LqmYyLG7E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-7u-v5I2eM_i3Hdc01KTgag-1; Fri, 07 Jan 2022 20:06:03 -0500
X-MC-Unique: 7u-v5I2eM_i3Hdc01KTgag-1
Received: by mail-wm1-f72.google.com with SMTP id
 m15-20020a05600c3b0f00b003465ede5e04so2503445wms.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=frHd/5g516X/URldKy7BtToYamE3vI32g+batxojBlk=;
 b=6q2KT/AVHIgVz9frchbhEJxdvBgtcWuswlp2EwUIJzaBJI7tmzOryOflbDCaG8CGvJ
 wArJ3ARq0nuo8kXKo3gtEUSp1x6PTcJE8+fg7oxSibNgE1UWySnvi5lYheVFPpcr/hGb
 J9japl5rjFfmCljZWD9iDtSeMWDkFcjyNuD/ThIDlj86OCMFCrCYvfV81+KRi+wN/6WY
 bN6onI3lNC3VV2kW1NPF2Dj0zEAXQitqAE+tBSsYUPqigekgJnYQYLzggyaww5YyGdW0
 GrUxrnhw9q4L0tc4H6g//vzi6EySzYdZxml9hmQk5cDl3GlVhYgSv8SIreGY4CHxgDdZ
 cVtg==
X-Gm-Message-State: AOAM5315NI248Viq7DAiCVBeoCpNXzI9sRn0e2/omA7pMGiF5qNLnyCY
 X4hATzshI5cAKD4aRxUjm6rcAnoo+8XLQA1gDDSJAP3nKyR1zwbCzOIzaXLXKbFRMIaUijlyQ9i
 +hX1CdHlE+sYA4Mq/k5LenSLMJ57PopbGoKH6xWOr0UOxvJkXyg/Pk+ZpRzpt
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr58184000wrp.500.1641603959478; 
 Fri, 07 Jan 2022 17:05:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyScuVSPeSdzuAKkvfRE+sZW0Jmk5H3F1CzaUOnyLZvqZSFAYSYYsB/PdsEuq/ip9CO8lUH4w==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr58183973wrp.500.1641603959156; 
 Fri, 07 Jan 2022 17:05:59 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id t6sm202144wrx.114.2022.01.07.17.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:58 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 43/55] acpi: fix QEMU crash when started with SLIC table
Message-ID: <20220108003423.15830-44-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 Denis Lisov <dennis.lissov@gmail.com>, Alexander Tsoy <alexander@tsoy.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

if QEMU is started with used provided SLIC table blob,

  -acpitable sig=SLIC,oem_id='CRASH ',oem_table_id="ME",oem_rev=00002210,asl_compiler_id="",asl_compiler_rev=00000000,data=/dev/null
it will assert with:

  hw/acpi/aml-build.c:61:build_append_padded_str: assertion failed: (len <= maxlen)

and following backtrace:

  ...
  build_append_padded_str (array=0x555556afe320, str=0x555556afdb2e "CRASH ME", maxlen=0x6, pad=0x20) at hw/acpi/aml-build.c:61
  acpi_table_begin (desc=0x7fffffffd1b0, array=0x555556afe320) at hw/acpi/aml-build.c:1727
  build_fadt (tbl=0x555556afe320, linker=0x555557ca3830, f=0x7fffffffd318, oem_id=0x555556afdb2e "CRASH ME", oem_table_id=0x555556afdb34 "ME") at hw/acpi/aml-build.c:2064
  ...

which happens due to acpi_table_begin() expecting NULL terminated
oem_id and oem_table_id strings, which is normally the case, but
in case of user provided SLIC table, oem_id points to table's blob
directly and as result oem_id became longer than expected.

Fix issue by handling oem_id consistently and make acpi_get_slic_oem()
return NULL terminated strings.

PS:
After [1] refactoring, oem_id semantics became inconsistent, where
NULL terminated string was coming from machine and old way pointer
into byte array coming from -acpitable option. That used to work
since build_header() wasn't expecting NULL terminated string and
blindly copied the 1st 6 bytes only.

However commit [2] broke that by replacing build_header() with
acpi_table_begin(), which was expecting NULL terminated string
and was checking oem_id size.

1) 602b45820 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
2)
Fixes: 4b56e1e4eb08 ("acpi: build_fadt: use acpi_table_begin()/acpi_table_end() instead of build_header()")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/786
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211227193120.1084176-2-imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Denis Lisov <dennis.lissov@gmail.com>
Tested-by: Alexander Tsoy <alexander@tsoy.me>
Cc: qemu-stable@nongnu.org
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/core.c       | 4 ++--
 hw/i386/acpi-build.c | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 1e004d0078..3e811bf03c 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -345,8 +345,8 @@ int acpi_get_slic_oem(AcpiSlicOem *oem)
         struct acpi_table_header *hdr = (void *)(u - sizeof(hdr->_length));
 
         if (memcmp(hdr->sig, "SLIC", 4) == 0) {
-            oem->id = hdr->oem_id;
-            oem->table_id = hdr->oem_table_id;
+            oem->id = g_strndup(hdr->oem_id, 6);
+            oem->table_id = g_strndup(hdr->oem_table_id, 8);
             return 0;
         }
     }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8383b83ee3..0234fe7588 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2723,6 +2723,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
+    g_free(slic_oem.id);
+    g_free(slic_oem.table_id);
 }
 
 static void acpi_ram_update(MemoryRegion *mr, GArray *data)
-- 
MST


