Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CB743491F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:41:02 +0200 (CEST)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md91p-000528-Qv
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hJ-0003XT-54
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hH-0002wq-Db
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JGBYmvhDt6E8gZOldDQh567mQwOZUysQwDU9UgiIntM=;
 b=cCCf2ecLSWjKG71P05gI2iE9nnwVMPxBPqlM9jp6TKWvHpBLvqOPrtePnOC0Z2OIc0cwQn
 tv94tP9dGOcxktrEQ0m4Evu3Bols1UFp8t0MC00nCgsQjEJgRA93lYyIUNcgmmk8bGJfoD
 Qfucf3F+IKU8gK17C+Yhiy6ezwT6D2A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-lCEo4AZiMda3M1_Qt5zJFw-1; Wed, 20 Oct 2021 06:19:44 -0400
X-MC-Unique: lCEo4AZiMda3M1_Qt5zJFw-1
Received: by mail-ed1-f71.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so20505183edl.5
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JGBYmvhDt6E8gZOldDQh567mQwOZUysQwDU9UgiIntM=;
 b=ZoKJZ4XwrnLPYFgxD/x0ax0PCMsbVuN+GJxZkmopJsdwlJYsgPi/1wFqxD19U170ny
 SjYEHZg8yAVQlr2j/e51FNkL2olllx7i8Fn3F7KlK8cq+Gtfw2cErqjqeDTjpykLQNBB
 yz7GU+K0tUbLLJhpva/azEJAAJks0tFrQTgVhH7k8r0APKPDncbm1PtIn9RNMSwxT1Iu
 MJ/xqJHNgsFEwUFcK9J11nt4oUDSuHnx6oe/RsrsYIJczFwx6AAUcpzC+zuxygqSdAP6
 6S+ly6om2pHGN89zJqb4MZO1QL1sqZFKU45R90S50hKgT9R8ZanJB4KV1iPp186isk4i
 hZBQ==
X-Gm-Message-State: AOAM530G22p3kOsT4pLOzPGiqSeUM+sav1q//Aam0mn2jCU6aexVLFkl
 AipEPPdzcCv4oh1Wbrf+aKUhi7Uio0n9jx5VU2v2XE7dm2uOMwP1yiANi0PpuXv4T0GiKAmEd2Z
 qLm4t1UTp/CXn13XgPk3mrwbZ6gqww2f6hR3aCpAOoJhdwTpzNZaHk3l29ghO
X-Received: by 2002:a17:906:480a:: with SMTP id
 w10mr46484408ejq.262.1634725182453; 
 Wed, 20 Oct 2021 03:19:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEe4wrDIarrs0GEw622lySSiyk5EOl7E+LjemrW363uqF2jd5iCgYTZm2aZz2ydAIw4113rg==
X-Received: by 2002:a17:906:480a:: with SMTP id
 w10mr46484390ejq.262.1634725182276; 
 Wed, 20 Oct 2021 03:19:42 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id a1sm943218edu.43.2021.10.20.03.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:41 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/44] tests: acpi: add testcase for amd-iommu (IVRS table)
Message-ID: <20211020101844.988480-11-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Message-Id: <20210902113551.461632-11-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0361c84c5e..ef28bb41f3 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1102,6 +1102,18 @@ static void test_acpi_q35_kvm_dmar(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_ivrs(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".ivrs";
+    data.tcg_only = true,
+    test_acpi_one(" -device amd-iommu", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg_numamem(void)
 {
     test_data data;
@@ -1581,6 +1593,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/smm-compat-nosmm",
                        test_acpi_q35_tcg_smm_compat_nosmm);
         qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
+        qtest_add_func("acpi/q35/ivrs", test_acpi_q35_tcg_ivrs);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-- 
MST


