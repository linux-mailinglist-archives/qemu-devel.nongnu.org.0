Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAC9322E68
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:10:31 +0100 (CET)
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaGc-0003Xk-TZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCb-0006pW-Q4
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCZ-0004lj-UB
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJz72UAWY4HQvxcH6TYo9OVXwWF/s6Ucgkhah6WrpZk=;
 b=gq9nfeNhGHTAfs8YF+0LEfSETxCM5aX7h7gxzHgv8xQho38eDpIqaPOjdsh9NIC9GlR3sQ
 Y/fficM/hEzyBI7xB9qUyx97EmxOem8ORH6xvlV7X6SuHTHtkEBb283ZO4fLDP/26+MNoD
 Cg/LBxBEqsf21QTE1fS7Pwr3m96xmIY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-CqwoX504MDucp_EkY8Qz3g-1; Tue, 23 Feb 2021 11:04:16 -0500
X-MC-Unique: CqwoX504MDucp_EkY8Qz3g-1
Received: by mail-wm1-f70.google.com with SMTP id o18so823323wmq.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mJz72UAWY4HQvxcH6TYo9OVXwWF/s6Ucgkhah6WrpZk=;
 b=l7n3v57yvb4VCBriJMS21kaBA2prSOGQqOr6H2CCMVD5pwpuAAjCtpxZAojFr+IDy1
 IEFFUYLRgzOsaTREHs4eIyY/YtoRPLjqGvWixSnPFG34DVNQ/hr5iw6sO8TsvUlCWKMX
 6bdufv6JYMMMVr9BZKk71FpxlHlxqW2s7QlBjfYCrgkxMpLI7iygcJCLaFqqXnZbjpfJ
 aXRrRtcS84fFsABhm0otXoGn7I4uIdwGulutYIwQrqW7HSN2/SN9tMvqiMQkbDLCuNmk
 rmGCCrlIW3UJ9URda5Gyrj+PXDVd3NcdZBfbAHQodtJugdKO1/OR+ZtTBpCx3zn1nxCn
 AEJw==
X-Gm-Message-State: AOAM532m0vq//BxAX6GrfEa/41q8lbVOzzd6UHZaM64MPoXyQvyybg+S
 KJjPU91wnDSWkhbAfTjJ4+oOfqQAnIVHqNpa2huyYU192tYpS5/LV+OcL4ODklnqA/Lu0lcWzaF
 Pqr+wryMGNGL8Ib0CMByo2+kPN3x1PgYrQdGYtzSCO3/o/85tpJdrSn3ott2v
X-Received: by 2002:a05:600c:19cf:: with SMTP id
 u15mr25603832wmq.139.1614096254689; 
 Tue, 23 Feb 2021 08:04:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpVPuQvXfSB/jcdllQCELDRS5s+uHjvm0AUju1Zv8XAPXIkHkTYL4+OVVogmhvrfORLa1/bA==
X-Received: by 2002:a05:600c:19cf:: with SMTP id
 u15mr25603806wmq.139.1614096254476; 
 Tue, 23 Feb 2021 08:04:14 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id b6sm18497395wrq.56.2021.02.23.08.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:04:13 -0800 (PST)
Date: Tue, 23 Feb 2021 11:04:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/17] acpi: add test case for smm unsupported -machine smm=off
Message-ID: <20210223160144.1507082-14-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <22f774a51255af1608b07b00b257af426adcf4ab.1613615732.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 77053975aa..93d037c29d 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -973,6 +973,39 @@ static void test_acpi_piix4_tcg_memhp(void)
     free_test_data(&data);
 }
 
+static void test_acpi_piix4_tcg_nosmm(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.variant = ".nosmm";
+    test_acpi_one("-machine smm=off", &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_piix4_tcg_smm_compat(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.variant = ".smm-compat";
+    test_acpi_one("-global PIIX4_PM.smm-compat=on", &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_piix4_tcg_smm_compat_nosmm(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.variant = ".smm-compat-nosmm";
+    test_acpi_one("-global PIIX4_PM.smm-compat=on -machine smm=off", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_numamem(void)
 {
     test_data data;
@@ -985,6 +1018,39 @@ static void test_acpi_q35_tcg_numamem(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_nosmm(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".nosmm";
+    test_acpi_one("-machine smm=off", &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_q35_tcg_smm_compat(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".smm-compat";
+    test_acpi_one("-global ICH9-LPC.smm-compat=on", &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_q35_tcg_smm_compat_nosmm(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".smm-compat-nosmm";
+    test_acpi_one("-global ICH9-LPC.smm-compat=on -machine smm=off", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg_numamem(void)
 {
     test_data data;
@@ -1445,6 +1511,16 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
         qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
         qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
+        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
+        qtest_add_func("acpi/piix4/smm-compat",
+                       test_acpi_piix4_tcg_smm_compat);
+        qtest_add_func("acpi/piix4/smm-compat-nosmm",
+                       test_acpi_piix4_tcg_smm_compat_nosmm);
+        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
+        qtest_add_func("acpi/q35/smm-compat",
+                       test_acpi_q35_tcg_smm_compat);
+        qtest_add_func("acpi/q35/smm-compat-nosmm",
+                       test_acpi_q35_tcg_smm_compat_nosmm);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-- 
MST


