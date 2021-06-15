Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE893A82C0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:26:13 +0200 (CEST)
Received: from localhost ([::1]:51288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltA15-0001IR-FJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9wk-0004ay-QT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:21:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9wi-00027A-91
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623766898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPKTfv2HqhrWVRWhfR1Uo1UNdb0VcpdNpjLI/wWrdVo=;
 b=dY09S/jZjvDEFUyrLe6UB6JQMjgoUwyKWyRDx1ndr9e8yLg6jgwtT6duldkmnLRjad1dae
 h5by4QU0hxII8VXdY4R811gOEC3TAW/Vk4zRnOWWxPLrN+LTW9pCpt91ORkNPMbx2FKCP1
 YSXYgKXBJNJzJISMBRseCrSDEt3di2k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-w5JnqdVgPK-RHyuGeAgGTg-1; Tue, 15 Jun 2021 10:21:37 -0400
X-MC-Unique: w5JnqdVgPK-RHyuGeAgGTg-1
Received: by mail-wr1-f71.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so8603363wre.9
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 07:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EPKTfv2HqhrWVRWhfR1Uo1UNdb0VcpdNpjLI/wWrdVo=;
 b=ewIDe5Fitw0HpVKXyAXrOEuVsNcTh2mqpDTHG9/Ldx0l1BnaMgGGLLJupPucGuQSXM
 0ufUEp3PX4WW311n63eeAAM1KSTVt4KLmY8mWFggBVSvyJdn89C6JG9annyFcIwZDUX3
 IqxR/6cp+zUqXv1a2sZQbi4qaNRq0kcSbu2M1jEpMs3A38mELc0KaJh9TqDX8zhLG0Sq
 6yAarCKKp//KbMzA9M03BJlPXr8i8VDXT90VcYtQuiSpacUfOSeiMY0iURbjuwwJD5+i
 oJz+xD0yfhlGmv1G/zqVGN6NtphL9iTOV//c3FKe6JR/NoUafGxUFgtAxPhCRgkCAVCT
 Fmcg==
X-Gm-Message-State: AOAM532+Wv2OY+31Jh+xEdUwf//fYe3BNE5cYYnObWPIk6ihGDmPxzqL
 Zp6BT02JZI7SvDdD2ZMomqwaYxPLOieGT+TPTHzeNQY2SvS0SSD2bmi9bUWrYY6xVh6bSlNrNFQ
 j5q5fQtA4uPFqAMk2xjYk/SRVwoVK48+E58tJJmt7DAMf70AGUYrFw4BIKeB8cFZs
X-Received: by 2002:adf:f907:: with SMTP id b7mr25374121wrr.357.1623766896431; 
 Tue, 15 Jun 2021 07:21:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3GlcNBRqRb+XpNwnxIFJAzmIc+HaJR0ycHvDIYPwpyaKDcDxKqBGwGXVMqKBFx2sbwXjUtA==
X-Received: by 2002:adf:f907:: with SMTP id b7mr25374099wrr.357.1623766896278; 
 Tue, 15 Jun 2021 07:21:36 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j131sm2401069wma.40.2021.06.15.07.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 07:21:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] acpi: Eliminate all TPM related code if CONFIG_TPM is
 not set
Date: Tue, 15 Jun 2021 16:21:19 +0200
Message-Id: <20210615142121.2127692-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615142121.2127692-1-philmd@redhat.com>
References: <20210615142121.2127692-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 "M : Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
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


