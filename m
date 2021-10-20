Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD09543490F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:36:45 +0200 (CEST)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8xg-0007pt-IU
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8h9-0003Fc-Fv
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8h7-0002py-Ua
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=45RxJNq+cSGim9pNSbreOrNLOePsLo5J2oFWYQMFyvE=;
 b=QNpIRvTUSFz0MzDPWI215AWZkcUEpfokcvTecpTXHMDPYulWg0gTGj2kFKdd8iwMrgaSn7
 SCUtMFCvLpInZ5gqoT6CpT2jdkC5N7zUUD94OC9i0cl/Cm+pzSOaBUIDGetARG1bsG9ueR
 5gQByF83bmXUx7cUMSbiNBpQ5869tBo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-wYEv29DmMMm7OGRdGeaoaw-1; Wed, 20 Oct 2021 06:19:35 -0400
X-MC-Unique: wYEv29DmMMm7OGRdGeaoaw-1
Received: by mail-ed1-f70.google.com with SMTP id
 h19-20020aa7de13000000b003db6ad5245bso20616742edv.9
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=45RxJNq+cSGim9pNSbreOrNLOePsLo5J2oFWYQMFyvE=;
 b=KxjRvnGyh39ar4a5mxQisAbG114MxDaJc1++ya7qmeA1tI7BXS/3/0y54uOODTHSe1
 DjB7FDvgmPhK2lGSqewZ5o622Vx/MbijU6cFOLwVeNAS2SlOiKB/ytOcOn9QXUnS5egB
 td/uM1dOy/D1o0pI3AudW2fnKXrGHCel4KF3wNtaqZXdvUP5nxADeS/UbHHuGwxX5h7L
 8JtH3ETCI0dEuvg5SJN7jUPWsc46bGIAla6QWGy+KF6K/YCVaNII9+fHnTRljj5B7g/J
 xdAl7TUQvikyaC5RMN2x4E8JAryEtwQ1D8BYXLHpean26e8H3S6Soe5knc8IruqEicV8
 aUlg==
X-Gm-Message-State: AOAM533VQ/uPY9s9jFraO8jdxx1IlqHW6rtLpeTSWAxiqhmjn6KmHhpF
 3Fc7VAJVFd3GC0q/28rqfucH2u5RMKPGckoC8+PhP9BbD+UZmD2CbrOEX+OHbD5Gh17g9HDOV35
 0Sa32DVCBINnUk0ahykJv5LvWpBQELrcGCq8BNDnLlYwwMBz8WPUR1RwFtnc5
X-Received: by 2002:a17:907:1b0a:: with SMTP id
 mp10mr45328127ejc.29.1634725174416; 
 Wed, 20 Oct 2021 03:19:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydEQfRzt61EYsJp4akm4vrIL9U/EvwYjp3yxEkUwAjBT1g9C9q2E2WuCQ6EHVcmNrEA6/1RA==
X-Received: by 2002:a17:907:1b0a:: with SMTP id
 mp10mr45328099ejc.29.1634725174191; 
 Wed, 20 Oct 2021 03:19:34 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id s16sm969499edd.32.2021.10.20.03.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:33 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/44] tests: acpi: add testcase for intel_iommu (DMAR table)
Message-ID: <20211020101844.988480-8-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
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


