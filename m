Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAFF422E5F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:49:28 +0200 (CEST)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnd9-00041h-5j
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmv9-00022p-82
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmv3-0006rJ-Tb
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ekV4rsvEqzPbqhC9VJ6Rw4BlulbNEjFP62bPhfPBwpY=;
 b=cu+cA3kJQvdCzod3ONb7JsTlbirk23nil0hxijwo1LjZ83rGxTW5fd8hh00uvtqGkmUGxc
 GAy66zS6rzawgEWUnO+gRb3hKhBCjy4fe53v6ARUEzIynLbz0aUncRYeX0aNYJuQ92z6SA
 Pt/5Ag5ejYwY2eRAvPsetm1XsEZpD7c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-lwW4p8uaMV6oKIUjZzV_Rw-1; Tue, 05 Oct 2021 12:03:48 -0400
X-MC-Unique: lwW4p8uaMV6oKIUjZzV_Rw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f12-20020a1c6a0c000000b0030d696e37b7so1494628wmc.4
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ekV4rsvEqzPbqhC9VJ6Rw4BlulbNEjFP62bPhfPBwpY=;
 b=Vmv2Ha/KMdQz3IxARXBDQnJ7Gao8PYTjlAg/9c6Ofd5nhGDc1qQgrnWJaC6jxCkddJ
 pHWMxN6LaOhMdRJjwrBMcVg3MefJ2ZwrNMmOYCNCvvfRyGVjfWlZ4z089xUGQNi+js4F
 cEde1m7L5WFN6tQRjSn+w7zoDAbZwpYc+1WYs8JexYKyJB6YkXGekPSryAYA7SV7P7GF
 zzE4ioUZKH/o4/vWxunnqj/9oc/jnHWtEyw3Jy5ukM4UY4CJ4mK/ZpKSs6y1opx1ksS0
 IrZl/T956vbHvjwvFjdzM8/afVYvvHzwF7PNJmXe6wR4Fv4R//2Mxy5YUkWrXaxxNyaP
 w98w==
X-Gm-Message-State: AOAM531qyXad3twJUMrnNDfQFchngZbbtBkpePm+CyZxa+wuMo6GYkBj
 3aA8LLalfHpgwcnlJAl19kw6QK7oGM0GZAl63SJXF8/nQTI9EftfvXCAiEZGUULBIPbfavSBhEP
 tTBU+cPwT/b0mfAYW1r9UlysUSwyQdM9CAYpBFG0sKmoI2WcFAkVdLM6UWTQ1
X-Received: by 2002:adf:a454:: with SMTP id e20mr17513074wra.310.1633449826726; 
 Tue, 05 Oct 2021 09:03:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxObHg/UcjgS53cFbw7+C8o5A7zdWmkfKIZJU5fwVJ29+tJ97H5IZjtayeaK0Z2K2hLgEv8PQ==
X-Received: by 2002:adf:a454:: with SMTP id e20mr17513034wra.310.1633449826478; 
 Tue, 05 Oct 2021 09:03:46 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id 189sm2744685wmz.27.2021.10.05.09.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:46 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/57] acpi: build_dsdt_microvm: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-41-mst@redhat.com>
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-27-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-microvm.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 1a0f77b911..196d318499 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -113,16 +113,16 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
     Aml *dsdt, *sb_scope, *scope, *pkg;
     bool ambiguous;
     Object *isabus;
+    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = x86ms->oem_id,
+                        .oem_table_id = x86ms->oem_table_id };
 
     isabus = object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous);
     assert(isabus);
     assert(!ambiguous);
 
+    acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
 
-    /* Reserve space for header */
-    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
-
     sb_scope = aml_scope("_SB");
     fw_cfg_add_acpi_dsdt(sb_scope, x86ms->fw_cfg);
     isa_build_aml(ISA_BUS(isabus), sb_scope);
@@ -144,11 +144,10 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
     aml_append(scope, aml_name_decl("_S5", pkg));
     aml_append(dsdt, scope);
 
-    /* copy AML table into ACPI tables blob and patch header there */
+    /* copy AML bytecode into ACPI tables blob */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
-    build_header(linker, table_data,
-        (void *)(table_data->data + table_data->len - dsdt->buf->len),
-                 "DSDT", dsdt->buf->len, 2, x86ms->oem_id, x86ms->oem_table_id);
+
+    acpi_table_end(linker, &table);
     free_aml_allocator();
 }
 
-- 
MST


