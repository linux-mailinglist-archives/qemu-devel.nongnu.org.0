Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E744880B2
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:51:39 +0100 (CET)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60tO-0003KD-Ri
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:51:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BO-0005uO-3l
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BM-0002nB-KI
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UtXyrtn+0H59zIz1wAsdY62sOCwJtY4CRpesWdrs1nM=;
 b=DRPFctjIlkY5ErfDOrx/aipDLGFLVJ0mwPaMKDZPNUiz5sBUwPCyRjUjD46MkkhMxDnIuf
 CZn/rzph4xrFcwvIIYJ0DWe1ChQSll0oXe5pg0x1uqMmligZLOZ64PwZ1TWIqxm8+a7jAW
 3aJ16PiFvsaBMI4ezL8BEMj0q++slbA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-AGY7DwrUNAOtQfnZ1lFsUQ-1; Fri, 07 Jan 2022 20:06:07 -0500
X-MC-Unique: AGY7DwrUNAOtQfnZ1lFsUQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i81-20020a1c3b54000000b003467c58cbddso5248406wma.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UtXyrtn+0H59zIz1wAsdY62sOCwJtY4CRpesWdrs1nM=;
 b=m0SXUbN8ncaMKYTOQYksNb+jIE8kLru9cwinvkdnV4lD9OGabXwGyGdLPj0jIWenBA
 kbYMUK/7/4B9QII507Dz5hM8lVvlYye4vjXj5omXKfshGga4RX/jQl0J0dAeBR0dWQp8
 A5cCnl2nf+I5TTaGksq+HUR9NZTIDwzyqeKsSuD/xz9jtHFc67ryLubwVXvaBXe1A/JF
 CFnxxizdbfiZqoa1OdNDrf3D0cB6Y9VrFRZu9q8pj6JBhKkWrjhIjUKLLRsB0dsHOw2f
 4dt7dRWQJgLcrhE7+7VftuVSus64UBy6iVIHGslDtnIMF+asxyZblmgm7vYT8XzzzT4/
 Q5/Q==
X-Gm-Message-State: AOAM532klde3QOW6kPCIX0vu/ukHaEc2h1ASwNAis6e+s0LB9zNfbVex
 iV5wmcx2d69J1Xej4j95sZh121tW83rl/Ozz09SysEeOCqVd1+d9EJLzgd+jCmbw7Q3F9MVCBeT
 JxgVlhOqK7zsE6+2ArbfFUV1dq3EQyvhqDQTkJ3xlIqZtIBuwS8ezz9YiaWha
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr55049598wri.295.1641603965604; 
 Fri, 07 Jan 2022 17:06:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwg4vAMw6wRpGQsrc8YmTYa4VPUCVw981EiMgCJQHbpnX+IyfD4NjuKyiiahkrkbIvYlSa6yA==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr55049586wri.295.1641603965430; 
 Fri, 07 Jan 2022 17:06:05 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id l26sm219098wrz.44.2022.01.07.17.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:05 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 45/55] tests: acpi: add SLIC table test
Message-ID: <20220108003423.15830-46-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

When user uses '-acpitable' to add SLIC table, some ACPI
tables (FADT) will change its 'Oem ID'/'Oem Table ID' fields to
match that of SLIC. Test makes sure thati QEMU handles
those fields correctly when SLIC table is added with
'-acpitable' option.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211227193120.1084176-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 9a468e29eb..e6b72d9026 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1502,6 +1502,20 @@ static void test_acpi_virt_viot(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_slic(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".slic",
+    };
+
+    test_acpi_one("-acpitable sig=SLIC,oem_id='CRASH ',oem_table_id='ME',"
+                  "oem_rev=00002210,asl_compiler_id='qemu',"
+                  "asl_compiler_rev=00000000,data=/dev/null",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1677,6 +1691,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
         qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
+        qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-- 
MST


