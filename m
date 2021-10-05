Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FD5422F4E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:36:13 +0200 (CEST)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoMO-0006PP-4U
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmxH-0002tE-Hj
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmxB-0000Gv-Ek
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m5WIudgdGV/fTsKWLR/EBdq7ujMlfVtUKhh5wWohWOA=;
 b=ce1yG+ODkeT/adXJq1zXGk20fq6paVgzjvdJH202bsuvP35PWqARoXheII9Y3+E8hS3P+m
 J50wSaBeXhRaP1fIO2VaHir54RE/hwUeUOicoOHj5hL+YaoIPTlbSo8QdwdkjsSuPHR61o
 ONDvrt0IkXFLYghQaeaunYslsuUDILI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-yaACObwfOHyICh2Pm3a2rw-1; Tue, 05 Oct 2021 12:02:42 -0400
X-MC-Unique: yaACObwfOHyICh2Pm3a2rw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so2868718wrc.21
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m5WIudgdGV/fTsKWLR/EBdq7ujMlfVtUKhh5wWohWOA=;
 b=B16H1y19hzU94YaSqXz96B0VgmlXFXfaO/bIxwoNzsq1/DBdne6hsiBrxUKHRzvhCJ
 bW3B0gTJI1MiDmvZfRmUQ6Frq5CrKpZFbbQ/+li85ltIJQWhu+n+i+2MWjAVuugDPi6x
 59bsZvqKxuJYEYZdj8C7m0WpB98zuPZx1+PBTf7sPGsEg22w7Elovisor16cMvDthb8F
 L8D9gnQcYQypZ7d8szRkBiJi4HtNednwY6Q/z1a0rFO8UBNvgA4UfgS6bSV4jwkOfm1O
 828AdiX2iph8nHjU7eKx6VaRF4W257ZWJahvLs/Ech0Bj/PK/L4v3+Q7+VwIfE8IwlUY
 0nyQ==
X-Gm-Message-State: AOAM530TXXoo+BnrUuElMxVLSyXFqok+TarkC2ohnFROjdRdywiGBCwt
 ZYXc/wJX0O5tWGKBdYiasa/2C0L7s4NRSzQZ82vi0UJa/GnADYdeL8NQPvnsLsa+4/Pm91q9w3/
 KSYsLRkpqmg+BikfYPMeZSnr/942sD8/+sJ0pt8o25ow3gE7r/qwWQ/tECtXa
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr4297278wmi.112.1633449760368; 
 Tue, 05 Oct 2021 09:02:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqiyngSq4m/Ed7H6YjTqVa6nZzscn6vUIIl0a2Blq6CDFs6tVzMLtoNAZoDoJkk4kcIFY+RA==
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr4297241wmi.112.1633449760093; 
 Tue, 05 Oct 2021 09:02:40 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id n11sm2510331wmq.19.2021.10.05.09.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:37 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:02:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/57] acpi: x86: build_dsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-28-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-14-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f4d6ae3d02..e17451bc6d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1405,12 +1405,12 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 #endif
     int i;
     VMBusBridge *vmbus_bridge = vmbus_bridge_find();
+    AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
+                        .oem_table_id = x86ms->oem_table_id };
 
+    acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
 
-    /* Reserve space for header */
-    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
-
     build_dbg_aml(dsdt);
     if (misc->is_piix4) {
         sb_scope = aml_scope("_SB");
@@ -1867,9 +1867,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
-    build_header(linker, table_data,
-        (void *)(table_data->data + table_data->len - dsdt->buf->len),
-                 "DSDT", dsdt->buf->len, 1, x86ms->oem_id, x86ms->oem_table_id);
+    acpi_table_end(linker, &table);
     free_aml_allocator();
 }
 
-- 
MST


