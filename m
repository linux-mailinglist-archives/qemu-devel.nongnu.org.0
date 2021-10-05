Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC12D422F53
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:41:00 +0200 (CEST)
Received: from localhost ([::1]:45306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoR1-0004Fq-NM
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmxP-0003EB-Di
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmxM-0000R1-PB
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hV6lu5dUHVTxYU1SPD7OKPspvEIPuBQVzBTSIWyD7ms=;
 b=TCxSYoaFI3w3a5T6ASalKAz7NZTmLGvDhOKgEn312pZVg740hhjQlf/8G6cQgnpfaSn8aw
 EO62aTPn7ZeVkGbO/72IgUqWVieUsqHIMAGQ68MCdvsKCOyDPYVwJOnEihxG57u6yVZtwG
 kbf+lXMDk4+d/7tNIkoAsA7xKK6JMnk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-24VR8nCIOcu5QxRS_PWtEA-1; Tue, 05 Oct 2021 12:03:17 -0400
X-MC-Unique: 24VR8nCIOcu5QxRS_PWtEA-1
Received: by mail-wr1-f70.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so5923848wrh.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hV6lu5dUHVTxYU1SPD7OKPspvEIPuBQVzBTSIWyD7ms=;
 b=skPOQCK9puD/mBquSLM095GospzlNo77Ovtk8cOmWi63tKwhNbu7f07ltozPvIN/IV
 Y3fbA8xaS9XpMqiAFkRuECBog1ptvA9+9NEI3QY8N0TICSniIZsIMuTDtJhc/xKJsFVF
 z1x6fGEe4xhny662BE/QTd2KtmBmf6yyW1YJVC5X7414mAGHyMjVUHQ+GfivfxqlGp+0
 bL5WbUJQpUjC4bl9nTaRVGaDlSAeonnvRz3sLuzwKalXi2abXmltjEosTVsZYxYFaj5M
 ZlkUAmYmkaATUzNb9kxCUUn4qSAZzVUnirIRbceZnly7QlLtzCokKYGvHYdGGjc4Puz7
 g9CQ==
X-Gm-Message-State: AOAM530FXs4bz+bGG9zgr/FPRdK29lsfgqAd7Y2Hm0csiDVkCehVFeCc
 JcETsQQaX/rK/nldlcnKRadBd5SnUz3YM4DhmWXpZLIHEzBruxDxBNdU7c1g3Ue1uidDZbYhHZE
 /OMuHMQHHiPbRtkL5My6Se+vb5n7DaMtfLPJX3YGRuy2OKbM1XD9S2aWSlvtL
X-Received: by 2002:adf:e390:: with SMTP id e16mr22441727wrm.217.1633449796254; 
 Tue, 05 Oct 2021 09:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ3PidJ0X2LhA0U7ZTNA+ZWRzD2b1V8hX7MaLr4VweNOU039M9rcY+D5X88peXJtFrM0tt8A==
X-Received: by 2002:adf:e390:: with SMTP id e16mr22441678wrm.217.1633449795969; 
 Tue, 05 Oct 2021 09:03:15 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id q16sm1203776wrw.23.2021.10.05.09.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:15 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/57] acpi: build_waet: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-34-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Message-Id: <20210924122802.1455362-20-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c65ab1d6a5..e5cc4f7daa 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2223,10 +2223,10 @@ static void
 build_waet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
            const char *oem_table_id)
 {
-    int waet_start = table_data->len;
+    AcpiTable table = { .sig = "WAET", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
 
-    /* WAET header */
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_table_begin(&table, table_data);
     /*
      * Set "ACPI PM timer good" flag.
      *
@@ -2235,9 +2235,7 @@ build_waet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
      * Which avoids costly VMExits caused by guest re-reading it unnecessarily.
      */
     build_append_int_noprefix(table_data, 1 << 1 /* ACPI PM timer good */, 4);
-
-    build_header(linker, table_data, (void *)(table_data->data + waet_start),
-                 "WAET", table_data->len - waet_start, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /*
-- 
MST


