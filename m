Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF154334AE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:29:42 +0200 (CEST)
Received: from localhost ([::1]:34162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnJN-0006k9-60
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnA7-00009C-Gg
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnA4-0001sf-C1
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=45RxJNq+cSGim9pNSbreOrNLOePsLo5J2oFWYQMFyvE=;
 b=hhKgsnP2vyox1WPcEQmnfF4b4O1TXdm7Tl20ttYCVttTiGOsdoGKUqFjWg5HjlTbgxhpik
 FEzf6CbPh4KVio+fQscP9KNSzj3JkgOd8A31Z3kYwtxqcHnXjZfbdtBJZifBI8vAGD1Rtl
 OgVAKKB5o+Gb4z3NpHxSF6neny+DxRo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-gPlFpEI_Ocu0b1JFfc0EYQ-1; Tue, 19 Oct 2021 07:20:01 -0400
X-MC-Unique: gPlFpEI_Ocu0b1JFfc0EYQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so17290511edb.8
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=45RxJNq+cSGim9pNSbreOrNLOePsLo5J2oFWYQMFyvE=;
 b=xbYciNfSwBRaOPOWjpDoq45RNYEReJ3mxBOFMVLN/mD9NHoBEBclYt7JBJ/qKI3P8N
 dgvsTpTa6VvyAN+D1izVpcbomyqDmQvrf50Js/Yfc2/C8fUaQU1LXo7LrviM/fXilSyM
 YyIAW5YtSm6gPvv6BMweIH5BjvBv+cmER8upvLbZapMT+KlBdoOqoR9zqyCEZvJ5QJcR
 AbFNHZ1QPVrmtMM0PQRXLFHeLAGXZYD6rSftRQjEIuhFJJrPqId5rH3FsI9SqLzoA9dA
 u3DMUg7tN9cBDhC+XC9JpW5/wuJuoB2q64YjHF5Ewv1p7my13wTSn9G6uouB8ba0vu+7
 Fy/g==
X-Gm-Message-State: AOAM531A7fQGzGheEuCmvHrnhD673cCKrMRs7MjEUgKBQ2GsDs4kfJ9U
 tDhoVuMdrzpanUdEPRpH6mCo8YMcXo72W27MF/rjktgyFqsVz+haXejknboGSF1IhaUMhwqvpFs
 8Eni5F6fWTiOzQm690Oa29cyhqbSl2BAfRpfDQTKqN5UioYjFv67t7IBHkw8H
X-Received: by 2002:a05:6402:4405:: with SMTP id
 y5mr53522660eda.339.1634642400394; 
 Tue, 19 Oct 2021 04:20:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5vPIKmLmr8WR6cI3ejPu5zbJQlKgwkZJxG4MTVCSmx5CMgkiFbx+nhyWSa1BaYi342YOk0w==
X-Received: by 2002:a05:6402:4405:: with SMTP id
 y5mr53522645eda.339.1634642400247; 
 Tue, 19 Oct 2021 04:20:00 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id ca4sm10280297ejb.1.2021.10.19.04.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:19:59 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:19:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/29] tests: acpi: add testcase for intel_iommu (DMAR table)
Message-ID: <20211019111923.679826-8-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-8-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 87a94a59fa..0361c84c5e 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1090,6 +1090,18 @@ static void test_acpi_q35_tcg_nohpet(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_kvm_dmar(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".dmar";
+    test_acpi_one("-machine kernel-irqchip=split -accel kvm"
+                  " -device intel-iommu,intremap=on,device-iotlb=on", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg_numamem(void)
 {
     test_data data;
@@ -1583,6 +1595,7 @@ int main(int argc, char *argv[])
         }
         if (has_kvm) {
             qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
+            qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-- 
MST


