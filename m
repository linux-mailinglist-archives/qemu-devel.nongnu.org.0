Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FC0400D21
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:41:06 +0200 (CEST)
Received: from localhost ([::1]:46044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdPN-0005rq-EN
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKu-0004bw-LB
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKt-0000xL-0H
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a99C9crsAiO4p+uk+bJauItmwvIN3BCi69tD3HDwFvQ=;
 b=OQqR66vQEQYXs6j/bEQImDhiflhqUcWWalqErolSkTFuDqC8uzxo9qzwjFSEH3JT442//k
 7dgqkWB7E0KtnDw3aMMafXMhHf6vOVFQlVdPAo3hGJuqnc6jnPNRUPQU/3WICxeGwZh6fk
 SA7Kd55/wINCk4e3VndbYy1v8QjVPFg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-RVBLBSW4Msmi6rw2ixstiw-1; Sat, 04 Sep 2021 17:36:24 -0400
X-MC-Unique: RVBLBSW4Msmi6rw2ixstiw-1
Received: by mail-ej1-f69.google.com with SMTP id
 v19-20020a170906b013b02905b2f1bbf8f3so865168ejy.6
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a99C9crsAiO4p+uk+bJauItmwvIN3BCi69tD3HDwFvQ=;
 b=NlNCGB8cWtVxwl16JzO42YIory4mrVPD3LAdL/6j42CVLHSNt3mbmjV58u6+E/wQ3h
 vuHXRu4PfvRwkE+kGTsUD6KMd9vA/wRnI8td4oPbpZbd2/Y5xSGk/c1Cus7eVFUZyZg6
 ib4JnE1TCoxP1mmfWSJv0/B+jdG6dny9GtatkNf8JUnP4BBuW/xhzJc2af/Qmg+c2Ceq
 ohHVjRt6Qj2fI/DWlAwBqmK3bun5armKbypKAx6DI7eOPdX19FdwxYH5x1sUvzPPeEFm
 o79GPWPpbxHJxtYNaRQs9qu+xdTfnHdeE4GymaAEAcrFVnYebD9cOih3ZOdVVeVkC4CK
 R50w==
X-Gm-Message-State: AOAM532XdIDvAi36gh1gBLWDGyuvoZzWP+RIpdUpC1D6/WVaDB4JHCyQ
 tniLrXJGlk+vaN5WaUuzei7dOzoQ8R4GN9q+ZS/sWvr5IpRRAwd/CE0C8FWbsjBvtvOu5S2/CCi
 kqNZAs70pp8a4uDAGV/XMfCKNYzoic7iLYeph262yPBPm+sy6FmoyBTtD1/Qp
X-Received: by 2002:a17:906:63ca:: with SMTP id
 u10mr5938636ejk.411.1630791383318; 
 Sat, 04 Sep 2021 14:36:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY7C9JlnQTEoKqamNmCq/fdEAKdIatXHvpdnZ/N5CW+lRjbcpVH9e3IKTpcagpkVEZ8R9ZUg==
X-Received: by 2002:a17:906:63ca:: with SMTP id
 u10mr5938620ejk.411.1630791383169; 
 Sat, 04 Sep 2021 14:36:23 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id i7sm1541051ejx.73.2021.09.04.14.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:22 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/35] acpi: Delete broken ACPI_GED_X86 macro
Message-ID: <20210904213506.486886-10-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

The macro never worked and never will, because the
AcpiGedX86State type never existed.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210805193431.307761-2-ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/generic_event_device.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 6bed92e8fc..d49217c445 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -70,8 +70,6 @@
 OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
 
 #define TYPE_ACPI_GED_X86 "acpi-ged-x86"
-#define ACPI_GED_X86(obj) \
-    OBJECT_CHECK(AcpiGedX86State, (obj), TYPE_ACPI_GED_X86)
 
 #define ACPI_GED_EVT_SEL_OFFSET    0x0
 #define ACPI_GED_EVT_SEL_LEN       0x4
-- 
MST


