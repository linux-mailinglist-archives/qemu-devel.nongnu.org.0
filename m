Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B93A6FDC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:12:44 +0200 (CEST)
Received: from localhost ([::1]:59378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsswt-0004cl-6q
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuJ-0001fD-5S
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuF-0002vk-0A
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623701398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPKTfv2HqhrWVRWhfR1Uo1UNdb0VcpdNpjLI/wWrdVo=;
 b=MubBnpHjjwBih/Gm1U/K0LQXk8i8gj8LI9keAIenzam2954i9yRaafXg3zUGxsiK61KFBV
 +KOQq67xk5hAfb6WO6yYPymc0Iwsgz6yXQtP7Iacb+TQhn/uPGbWxQJ/hjLwe2NwMz1PUv
 5T+E52FP4I02XbL82fd2ExgGdhx7s6I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-rO-8FaL4Mw-xfxC6ware9A-1; Mon, 14 Jun 2021 16:09:57 -0400
X-MC-Unique: rO-8FaL4Mw-xfxC6ware9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 n4-20020a5d42040000b0290119fef97609so7490694wrq.18
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EPKTfv2HqhrWVRWhfR1Uo1UNdb0VcpdNpjLI/wWrdVo=;
 b=E8v5PpeG0ydrMxhhEJHKaIZlcgn8YgqUsMpku3z3I+w2Dzx4Fv+DGJ54fUVpFPXHtM
 5Pf2y16okCgiy0CkwBVFUhfEdFqjRjQONfhXXpqdS+PZFebNRig1nU/qq6gH3+liX4L6
 M2Fmggeyu33ErkOIog5OIGlVqmYwxi5nAb8mTKkjGaBdZ78LDSK+J7yIvO9UMk2IakV4
 6caUMR+O3KGiDiNtpgzC6DM/yiGvtefsXchUbsFCslL+YtVWodAxFxbgcIKYiondfYcp
 J3GcmvHffliWbsmJyuDLPxqPxP7F7EePbmOCRBygYlqWkLlFm+416J1cGRerj32nUVSp
 yx3w==
X-Gm-Message-State: AOAM533ZqtZOYNRV41NeVv1NmtSzLd58gQ0jNt2TEuYn2rJa0S/5JzjT
 OThpXzg3C1UiKMqBJxR6KowmQTzGDEcWvSB+//Mr+oZCdWVNa+mYRTQLd2cuav6MdDo8B8jGcz7
 HHuUcvALWtPfpT70/GnYwzVKSZlGM2c/89I4/EgTsvmwnS5/fiFbUQQnKsh95WK9R
X-Received: by 2002:a05:600c:154:: with SMTP id
 w20mr19010088wmm.185.1623701395864; 
 Mon, 14 Jun 2021 13:09:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKrtErV8vdKFyKmCoLXADeqaBrA3K+NaN7fHpr2QZqO+iHRt2YFsbePDqVXE5fGAiZ4mv/tA==
X-Received: by 2002:a05:600c:154:: with SMTP id
 w20mr19010065wmm.185.1623701395709; 
 Mon, 14 Jun 2021 13:09:55 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 2sm16640398wrz.87.2021.06.14.13.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:09:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] acpi: Eliminate all TPM related code if CONFIG_TPM is
 not set
Date: Mon, 14 Jun 2021 22:09:38 +0200
Message-Id: <20210614200940.2056770-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614200940.2056770-1-philmd@redhat.com>
References: <20210614200940.2056770-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

Cc: M: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210614191335.1968807-4-stefanb@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/acpi/tpm.h | 4 ++++
 hw/acpi/aml-build.c   | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
index 1a2a57a21f0..559ba6906c8 100644
--- a/include/hw/acpi/tpm.h
+++ b/include/hw/acpi/tpm.h
@@ -21,6 +21,8 @@
 #include "hw/acpi/aml-build.h"
 #include "sysemu/tpm.h"
 
+#ifdef CONFIG_TPM
+
 #define TPM_TIS_ADDR_BASE           0xFED40000
 #define TPM_TIS_ADDR_SIZE           0x5000
 
@@ -209,4 +211,6 @@ REG32(CRB_DATA_BUFFER, 0x80)
 
 void tpm_build_ppi_acpi(TPMIf *tpm, Aml *dev);
 
+#endif /* CONFIG_TPM */
+
 #endif /* HW_ACPI_TPM_H */
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index f0035d2b4a1..d5103e6d7b0 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2044,6 +2044,7 @@ build_hdr:
                  "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
 }
 
+#ifdef CONFIG_TPM
 /*
  * build_tpm2 - Build the TPM2 table as specified in
  * table 7: TCG Hardware Interface Description Table Format for TPM 2.0
@@ -2101,6 +2102,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                  (void *)(table_data->data + tpm2_start),
                  "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
 }
+#endif
 
 Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
                uint32_t mmio32_offset, uint64_t mmio64_offset,
-- 
2.31.1


